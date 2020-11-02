#!/bin/bash

terraform init
time terraform apply -auto-approve
sleep 60

#ansible-galaxy install andrewrothstein.zookeeper
ansible-galaxy install andrewrothstein.zookeeper-cluster
ansible-playbook install_zookeeper_cluster.yml
