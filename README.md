# Ansible Workshop

This repository contains code for a simple configuration management on premise, and on AWS.

## Run locally

`local.yaml` contains a sample configuration for a flask application using `Docker-compose`. To run simply use the command `ansible-playbook local.yaml`. There is no need to declare a localhost, since Ansible will create one.

## Run on AWS

`deployment` has a simple terraform configuration with a sample server on the main VPC, and using all the default resources offered by AWS. Through the use of a `provisioner`, it is possible to deploy and configure with a single command.

> **Note:**  
> Despite this configuration, there are still some variables that may cause issues in the configuration phase.

It is also possible to configure a server indepently, using the public dns for the machine, and the neccessary keys for the ssh connection.