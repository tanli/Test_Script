# /bin/bash

source ./define.sh

if [ ! -d "$taskdir" ]; then
 mkdir -p $taskdir
fi

p1=18519
p2=18520

rm -f $taskdir/*

for c in $cbufsiz
do
 
 
 echo "open $IB_port1 $p1" >> $taskdir/rput-c$c-ib0
 echo "user ftp ftp" >> $taskdir/rput-c$c-ib0
 echo "bin" >> $taskdir/rput-c$c-ib0
 echo "prompt" >> $taskdir/rput-c$c-ib0
 echo "lcd $data_src" >> $taskdir/rput-c$c-ib0
 echo "cd $data_sink" >> $taskdir/rput-c$c-ib0
 echo "rput zeroa" >> $taskdir/rput-c$c-ib0
 echo "bye" >> $taskdir/rput-c$c-ib0
done

for c in $cbufsiz
do
 echo "open $IB_port2 $p2" >> $taskdir/rput-c$c-ib1
 echo "user ftp ftp" >> $taskdir/rput-c$c-ib1
 echo "bin" >> $taskdir/rput-c$c-ib1
 echo "prompt" >> $taskdir/rput-c$c-ib1
 echo "lcd $data_src" >> $taskdir/rput-c$c-ib1
 echo "cd $data_sink" >> $taskdir/rput-c$c-ib1
 echo "rput zerob" >> $taskdir/rput-c$c-ib1
 echo "bye" >> $taskdir/rput-c$c-ib1
done



exit
