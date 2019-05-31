#!/bin/bash

export VAR=1
enqueue_compss \
--num_nodes=1 \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
mnist.py -c configs/mnist_config.json -n 1


export VAR=2
enqueue_compss \
--num_nodes=1 \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
mnist.py -c configs/mnist_config.json -n 1


export VAR=4
enqueue_compss \
--num_nodes=1 \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
mnist.py -c configs/mnist_config.json -n 1


export VAR=8
enqueue_compss \
--num_nodes=1 \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
mnist.py -c configs/mnist_config.json -n 1

export VAR=16
enqueue_compss \
--num_nodes=1 \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
mnist.py -c configs/mnist_config.json -n 1