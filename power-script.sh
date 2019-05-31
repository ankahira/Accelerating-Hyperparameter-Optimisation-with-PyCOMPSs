#!/bin/bash


export VAR=2
enqueue_compss \
--num_nodes=1 \
--gpus_per_node=4 \
--qos=bsc_cs \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
cifar.py -c configs/cifar_config.json -n 1

export VAR=4
enqueue_compss \
--num_nodes=1 \
--gpus_per_node=4 \
--qos=bsc_cs \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
cifar.py -c configs/cifar_config.json -n 1


export VAR=8
enqueue_compss \
--num_nodes=1 \
--gpus_per_node=4 \
--qos=bsc_cs \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
cifar.py -c configs/cifar_config.json -n 1


export VAR=16
enqueue_compss \
--num_nodes=1 \
--gpus_per_node=4 \
--qos=bsc_cs \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
cifar.py -c configs/cifar_config.json -n 1

export VAR=32
enqueue_compss \
--num_nodes=1 \
--gpus_per_node=4 \
--qos=bsc_cs \
--exec_time=360 \
--master_working_dir=. \
--worker_working_dir=gpfs \
--base_log_dir=$PWD/logs \
--classpath=/gpfs/projects/bsc19/bsc19992/hpo \
--pythonpath=/gpfs/projects/bsc19/bsc19992/hpo \
cifar.py -c configs/cifar_config.json -n 1

