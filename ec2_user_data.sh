#!/bin/bash
cd ~
sudo apt-get update -y
wget https://filebin.net/6ppfivmjzfzoz2v7/output.tar.gz
tar -zxvf output.tar.gz
_build/dev/rel/distributed_ec2/bin/distributed_ec2 daemon_iex