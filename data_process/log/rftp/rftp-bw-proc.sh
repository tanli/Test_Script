#! /bin/bash

#Input: RFTP bandwidth log files
#output: "tran_time.log" which is a single colomn file record all the transfer time spent

#Case parameters
cbufsiz="128K 256K 512K 1M 2M 4M 8M 16M 32M 64M"
str_num="1 2 4 8"

echo > tran_time.log

for b in $cbufsiz
do
 for s in $str_num
 do
  cat log-b$b-s$s-p18139 | grep -e "secs" | cut -f5 -d ' ' >> tran_time.log
 done
done

exit
