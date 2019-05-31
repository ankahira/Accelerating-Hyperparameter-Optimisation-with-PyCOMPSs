import argparse
import json
import itertools


def get_args():
    argparser = argparse.ArgumentParser(description="configs and experiment details")
    argparser.add_argument('-c', '--config', help="Configuration file")
    argparser.add_argument('-n', '--nodes', help="nodes")
    args = argparser.parse_args()
    return args


def get_config_from_json(json_file):
    """
    Get the config from a json file
    :param json_file:
    :return: config(dictionary)
    """
    # parse the configurations from the config json file provided
    with open(json_file, 'r') as config_file:
        config_dict = json.load(config_file)

    # config_dict contains the config.json configuration as dictionary
    optimizers = config_dict['optimizer']
    epochs = config_dict['num_epochs']
    batch_sizes = config_dict['batch_size']

    combinations = list(itertools.product(optimizers, batch_sizes, epochs))

    # Build the config dictionaries
    dicts = []
    for c in combinations:
        # Build a dictionary with each tuple
        d = build_dictionary(c)
        dicts.append(d)

    return dicts


def build_dictionary(combination):
    configuration = {}
    # Change hyper parameters
    configuration["optimizer"] = combination[0]
    configuration["batch_size"] = combination[1]
    configuration["num_epochs"] = combination[2]

    return configuration


def process_config(json_file):
    config = get_config_from_json(json_file)
    return config  # a list of configurations (dictionaries)
