#!/bin/sh
echo "Setting language"

sudo update-locale LANG=en_US.UTF8
sudo update-locale LC_ALL=en_US.UTF8
sudo locale-gen --purge en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

echo "Done. Now restart your terminal and run step1.sh"
