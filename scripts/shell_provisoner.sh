#!/bin/bash

set -e

echo "Running initial upgrade"
apt-get update
apt-get -y dist-upgrade

