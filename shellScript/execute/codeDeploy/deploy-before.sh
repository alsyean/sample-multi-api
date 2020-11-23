#!/bin/bash

if [ -d /home/ec2-user/deploy ]; then
  rm -rf /home/ec2-user/multiModule-api
fi

mkdir -vp /home/ec2-user/multiModule-api
