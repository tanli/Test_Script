#! /bin/bash

input=$1
output=$2
while read line
do
id=`echo $line | cut -d ',' -f 1`
		vtime=`echo $line | cut -d ',' -f 2`
		vdate=`echo $line | cut -d ',' -f 3`
		year=`echo $vdate | cut -d '-' -f 3`
		mon=`echo $vdate | cut -d '-' -f 2 | sed -e "
	s/JAN/01/
	s/FEB/02/
	s/MAR/03/
	s/APR/04/
	s/MAY/05/
	s/JUN/06/
	s/JUL/07/
	s/AUG/08/
	s/SEP/09/
	s/OCT/10/
	s/NOV/11/
	s/DEC/12/"`
		day=`echo $vdate | cut -d '-' -f 1`
		printf "%s,%s-%s-%s %s\n" $id $year $mon $day $vtime
	done < $input

