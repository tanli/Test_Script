#! /bin/bash

log_dir=/home/tanli/test_all/iperf_numa/hp_numa/log

IP_1=192.168.8.13
time=60
loop=1

mkdir -p $log_dir

while [ "$loop" -le 1 ]
do

 port_core=18510
 port_node=18130
 core_id=0
 node_id=0

 while [ "$port_node" -le 18131 ]
 do
  echo "iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-node-$node_id.log 2>&1"
   iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-node-$node_id.log 2>&1
 ((node_id++))
 ((port_node++))
 sleep 10
 done

 while [ "$port_core" -le 18525 ]
 do
   echo "iperf -c $IP_1 -p $port_core -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-core-$core_id.log 2>&1"
   iperf -c $IP_1 -p $port_core -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-core-$core_id.log 2>&1
   sleep 10
   ((port_core++))
   ((core_id++))
 done


for stream in 2 4 8 16
do
 port_node=18130
 node_id=0

 while [ "$port_node" -le 18131 ]
 do
 echo "iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K -P $stream |grep SUM| cut -d ' ' -f 9,10 >> $log_dir/bw-node-$node_id.log 2>&1"
   iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K -P $stream |grep SUM| cut -d ' ' -f 9,10 >> $log_dir/bw-node-$node_id.log 2>&1
 ((node_id++))
 ((port_node++))
 sleep 10
 done
done

 ((loop++))
done
exit

