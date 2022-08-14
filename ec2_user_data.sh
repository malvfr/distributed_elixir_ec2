#!/bin/bash
cd ~
sudo apt-get update -y
wget https://filebin.net/nrln04ij4f8i0jfb/output.tar.gz
tar -zxvf output.tar.gz
_build/dev/rel/distributed_ec2/bin/distributed_ec2 daemon_iex