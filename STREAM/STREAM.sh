#! /bin/bash

echo > cpu_node.log
echo > core_node.log

for mem_node in 0 1 2 3
do
  for cpu_node in 0 1 2 3
  do
   echo "numactl --cpunodebind=$cpu_node --membind=$mem_node ./stream "   
   numactl --cpunodebind=$cpu_node --membind=$mem_node ./stream | grep Copy | cut -d ' ' -f8,9 >> cpu_node.log

  done
done

core_node=0

for mem_node in 0 1 2 3 
do
  while [ "$core_node" -le 31 ]
  do

   numactl --physcpubind=$core_node --membind=$mem_node ./stream | grep Copy | cut -d ' ' -f8,9 >> core_node.log
   ((core_node++))
  done
done

exit
