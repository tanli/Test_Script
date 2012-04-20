# /bin/bash

source ./define.sh

if [ ! -d "$taskdir" ]; then
 mkdir -p $taskdir
fi

for c in $cbufsiz
do
 
 p=18141

  if [ $c = "128K" ]; then
   p=18139
  fi

 
  if [ $c = "256K" ]; then
   p=18139
  fi

  if [ $c = "512K" ]; then
   p=18139
  fi

  if [ $c = "1M" ]; then
   p=18140
  fi

  if [ $c = "2M" ]; then
   p=18140
  fi

  if [ $c = "4M" ]; then
   p=18140
  fi



 echo "open $IB_port1 $p" > $taskdir/rput-c$c
 echo "user ftp ftp" >> $taskdir/rput-c$c
 echo "bin" >> $taskdir/rput-c$c
 echo "prompt" >> $taskdir/rput-c$c
 echo "lcd $data_src" >> $taskdir/rput-c$c
 echo "cd $data_sink" >> $taskdir/rput-c$c
 echo "rput zeroa" >> $taskdir/rput-c$c
 echo "bye" >> $taskdir/rput-c$c
done
exit

