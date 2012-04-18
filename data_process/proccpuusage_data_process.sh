#! /bin/bash

cbufsiz="128KB 256KB 512KB 1MB 2MB 4MB 8MB 16MB 32MB 64MB"
str_num="1 2 4 8"

touch total_cpu.txt

for b in $cbufsiz
do
 for s in $str_num
 do
  cat cpu_log-b$b-s$s |cut -f3 | tail -n +6 | head -n -2 > ./txt/cpu_log-b$b-s$s.txt
  str="$str ./txt/cpu_log-b$b-s$s.txt"
 done
done
paste -d '\t' $str > total_cpu.txt
exit

