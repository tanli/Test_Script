#! /bin/bash

i=0
while [ "$i" -le 28 ]
do
 let m=i
 let n=i+1
 let p=i+2
 let q=i+3
 cat ./log/bw-core-$m.log >> bw_0.txt
 cat ./log/bw-core-$n.log >> bw_1.txt
 cat ./log/bw-core-$p.log >> bw_2.txt
 cat ./log/bw-core-$q.log >> bw_3.txt
 let i=i+4
done

paste bw_0.txt bw_1.txt bw_2.txt bw_3.txt > bw.txt

exit
