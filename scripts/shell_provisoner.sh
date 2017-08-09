#!/bin/bash

set -e

echo "Running initial upgrade"
sudo apt-get update
sudo apt-get -y dist-upgrade
echo "Finished initial upgrade"
