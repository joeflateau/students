#!/bin/bash

name=$1
pass=$(perl -e 'print crypt($ARGV[0], "password")' $2)
home="/students/$name"

if id -u $name >/dev/null 2>&1; then
	echo "$name already exists"
else
	sudo useradd -m -d $home -p $pass $name
	sudo usermod -g students $name
	sudo mkdir -p "$home"
fi

sudo usermod -s /bin/bash -g students $name
sudo chown $name.$name $home
sudo chmod 700 $home

