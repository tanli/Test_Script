#! /bin/bash

log_dir=/home/tanli/test_all/iperf_numa/log

IP_1=192.168.50.11
time=100
loop=1

mkdir -p $log_dir

while [ "$loop" -le 1 ]
do

 port_core=18510
 port_node=18130
 core_id=0
 node_id=0

 while [ "$port_node" -le 18133 ]
 do
  echo "iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-node-$node_id.log 2>&1"
   ssh root@130.245.191.122 /home/tanli/test_all/oprofile/script/startup.sh 
   iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-node-$node_id.log 2>&1
   ssh root@130.245.191.122 /home/tanli/test_all/oprofile/script/report.sh | grep no-vmlinux >> $log_dir/oprofile-cpu$node_id.txt
   sleep 10
 ((node_id++))
 ((port_node++))
done

# while [ "$port_core" -le 18541 ]
# do
#   echo "iperf -c $IP_1 -p $port_core -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-core-$core_id.log 2>&1"
#   iperf -c $IP_1 -p $port_core -t $time -l 128K -w 128K |grep sec| cut -d ' ' -f 11,12 >> $log_dir/bw-core-$core_id.log 2>&1
#   sleep 10
#   ((port_core++))
#   ((core_id++))
# done


for stream in 2 4 8 16
do
 port_node=18130
 node_id=0

while [ "$port_node" -le 18133 ]
 do
 echo "iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K -P $stream |grep SUM| cut -d ' ' -f 9,10 >> $log_dir/bw-node-$node_id.log 2>&1"
 ssh root@130.245.191.122 /home/tanli/test_all/oprofile/script/startup.sh
   iperf -c $IP_1 -p $port_node -t $time -l 128K -w 128K -P $stream |grep SUM| cut -d ' ' -f 9,10 >> $log_dir/bw-node-$node_id.log 2>&1
 ssh root@130.245.191.122 /home/tanli/test_all/oprofile/script/report.sh | grep no-vmlinux >> $log_dir/oprofile-cpu$node_id.txt 
   sleep 10
 ((node_id++))
 ((port_node++))
 done
done

 ((loop++))
done
exit

