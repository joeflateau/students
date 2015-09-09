#!/bin/bash

name=$1
pass=$(perl -e 'print crypt($ARGV[0], "password")' $2)
home="/students/$name"

if id -u $name >/dev/null 2>&1; then
	echo "$name already exists"
else
	sudo useradd -m -d $home -p $pass $name
	sudo usermod -g students $name
	sudo mkdir -p "$home/chroot/www"
	sudo chown root.root $home
	sudo chown root.root "$home/chroot"
	sudo chmod 755 $home
	sudo chmod 755 "$home/chroot"
	sudo chown "$name.$name" "$home/chroot/www"
	sudo ln -s "$home/chroot/www/" "/var/www/students.joeflateau.net/$name"
fi
