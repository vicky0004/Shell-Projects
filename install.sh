#!/bin/bash

echo "Enter your choice"
echo  "1-version"
echo "2-upgrade"
echo "3-install"
echo "4-exit"

read choice

case $choice in
	1) echo "Enter the package(applicatin) name"
		read package
		$package --version;;
	2) echo "Enter the package name"
		read package
		sudo apt install $package;;
	3) echo "Enter the pachage name"
		read package
		sudo apt install $package;;
	4) exit;;

esac

