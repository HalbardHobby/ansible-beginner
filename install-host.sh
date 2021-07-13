#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

HOST_FILE=/etc/ansible/hosts
PWD=$(pwd)
SOURCE_FILE=$PWD/hosts

echo $HOST_FILE
if [ -e $HOST_FILE ]; then
   rm $HOST_FILE
fi

ln -s $SOURCE_FILE $HOST_FILE