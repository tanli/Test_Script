#! /bin/bash

Log_dir=/home/tanli/test_all/STREAM/log
bin=/home/tanli/test_all/STREAM/bin

if [ ! -d "$Log_dir" ] 
then
 mkdir -p $Log_dir
else
 rm -f $Log_dir/*
fi

num_threads="1 2 4 8 16"
mem_nodes="0 1 2 3"
cpu_nodes="1"

for num_thread in $num_threads
do
 for cpu_node in $cpu_nodes
 do
   for mem_node in $mem_nodes
   do
    export OMP_NUM_THREADS=$num_thread
    echo "========================================================="
    
    echo "numactl --cpunodebind=$cpu_node --membind=$mem_node --thread=$num_thread ./stream "
    echo "========================================================="
    if [ $mem_node = 0 ]; then
    field=17
    fi

    if [ $mem_node = 1 ]; then
    field=27
    fi

    if [ $mem_node = 2 ]; then
    field=37
    fi
    
    if [ $mem_node = 3 ]; then
    field=47
    fi
 
    echo "field=$field"
   
    numastat|grep other_node|cut -d ' ' -f$field >> $Log_dir/numastat-start-cpu$cpu_node-mem$mem_node.txt
    /home/tanli/test_all/oprofile/script/startup.sh
    numactl --cpunodebind=$cpu_node --membind=$mem_node $bin/stream | grep Copy | cut -d ' ' -f8,9 >> $Log_dir/bw_node-cpu$cpu_node-mem$mem_node.txt
    /home/tanli/test_all/oprofile/script/report.sh | grep main.omp_fn.11 >> $Log_dir/oprofile-cpu$cpu_node-mem$mem_node.txt
    numastat|grep other_node|cut -d ' ' -f$field >> $Log_dir/numastat-end-cpu$cpu_node-mem$mem_node.txt


   done
 done
done
#core_node=0

#for mem_node in 0 1 2 3 
#do
#  while [ "$core_node" -le 31 ]
#  do

#   numactl --physcpubind=$core_node --membind=$mem_node ./stream | grep Copy | cut -d ' ' -f8,9 >> core_node.log
#   ((core_node++))
#  done
#done

exit
