#!/bin/bash

IFS=,

cat $1 | csvtool col 4,2 - | csvtool drop 1 - | while read -r username password
do
	username=${username/@syr.edu/}
	#echo $username $password
	./create_student.sh $username $password
done
