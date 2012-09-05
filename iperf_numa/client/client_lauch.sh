#! /bin/bash

log_dir=/home/tanli/test_all/iperf_test/dell_numa/log

IP_1=192.168.5.11
IP_2=192.168.6.11
time=60
loop=1

mkdir -p $log_dir

while [ "$loop" -le 35 ]
do

 port_core=18510
 port_node=18130
 core_id=0
 node_id=0

 while [ "$port_node" -le 18130 ]
 do
   iperf -c $IP_1 -p $port_node -t $time -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-node-$node_id.log 2>&1
 ((node_id++))
 ((port_node++))
 sleep 10
 done

 while [ "$port_core" -le 18525 ]
 do
   iperf -c $IP_1 -p $port_core -t $time -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-core-$core_id.log 2>&1
   sleep 10
   ((port_core++))
   ((core_id++))
 done
 ((loop++))
done
exit

