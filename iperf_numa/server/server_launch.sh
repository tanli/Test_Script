#! /bin/bash

node=0
core=0
port_core=18510
port_node=18130

echo "====================================================="
while [ "$core" -le 31 ]
do
  numactl --physcpubind=$core iperf -s -p $port_core &
  echo "numactl --physcpubind=$core iperf -s -p $port_core"
  ((core++))
  ((port_core++))
done

while [ "$node" -le 3 ]
do
  numactl --cpunodebind=$node iperf -s -p $port_node &
  echo "numactl --cpunodebind=$node iperf -s -p $port_node"
  ((node++))
  ((port_node++))
done
echo "====================================================="
exit
