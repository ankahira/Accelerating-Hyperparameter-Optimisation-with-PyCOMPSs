import sys
import os
import time
from models.cifar_model import cifar_model
from utils.utils import process_config
from utils.utils import get_args

# PyCOMPSs libraries
from pycompss.api.task import task
from pycompss.api.api import compss_wait_on
from pycompss.api.constraint import constraint

# Keras Modules
import keras
from keras.datasets import cifar10


@constraint(processors=[{'ProcessorType':'CPU', 'ComputingUnits':"$VAR"}, {'ProcessorType':'GPU', 'ComputingUnits':1}])
@task(returns=int)
def experiment(config):
    # input image dimensions
    img_rows, img_cols = 28, 28

    # the data, split between train and test sets
    (x_train, y_train), (x_test, y_test) = cifar10.load_data()

    x_train = x_train.astype('float32')
    x_test = x_test.astype('float32')
    x_train /= 255
    x_test /= 255

    # convert class vectors to binary class matrices
    y_train = keras.utils.to_categorical(y_train, 10)
    y_test = keras.utils.to_categorical(y_test, 10)

    model = cifar_model(config)

    model.fit(x_train, y_train,
              batch_size=config["batch_size"],
              epochs=config["num_epochs"],
              verbose=1,
              validation_data=(x_test, y_test))

    try:
        score = model.evaluate(x_test, y_test, verbose=0)
        return score[1]  # everything went ok
    except Exception:
        print(sys.exc_info())
        return -1  # a training failed


def main():
    start_time = time.time()
    # capture the config path from the run arguments
    # then process the json configuration file
    try:
        args = get_args()
        configurations = process_config(args.config)
    except:
        print("unable to create configurations ")
        exit(0)

    scores = []
    for config in configurations:
        experiment_result = experiment(config)
        scores.append(experiment_result)
    # results is a list of future objects
    results = compss_wait_on(scores)

    end_time = time.time()
    elapsed_time = end_time - start_time

    with open('./results/cifar_times.txt', 'a') as the_file:
        the_file.write("Computing Units = " + str(os.environ['VAR']) + "\n")
        the_file.write("Number of Nodes = " + str(args.nodes) + "\n")
        the_file.write("Elapsed time = " + str(elapsed_time) + "\n")
        the_file.write("\n")
        the_file.write("\n")

    with open('./results/cifar_scores.txt', 'a') as the_file:
        the_file.write(str(results) + "\n")


if __name__ == "__main__":
    main()

