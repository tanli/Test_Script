#! /bin/bash

#Input: gridftp bandwidth log files
#output: print the last bandwidth result on the standard output


cbufsiz="128KB 256KB 512KB 1MB 2MB 4MB 8MB 16MB 32MB 64MB"
str_num="1 2 4 8"


for b in $cbufsiz
do
 for s in $str_num
 do
   tail -2 bw_log-b$b-s$s|head -1
 done
done

exit

