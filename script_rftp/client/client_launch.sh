#! /bin/bash

source ./define.sh

nmon -fT -s 5 -c 5000 

if [ ! -d "$ftplogdir" ]; then
 mkdir -p $ftplogdir
#else
# rm -rf $ftplogdir/*
fi

if [ ! -d "$cpulogdir" ]; then
 mkdir -p $cpulogdir
#else
# rm -rf $cpulogdir/*
fi

if [ ! -d "$timelogdir" ]; then
 mkdir -p $timelogdir
#else
# rm -rf $cpulogdir/*
fi


for c in $cbufsiz
do
 for s in $str_num
 do
    date "+%F %T" >> $timelogdir/datetime_start.log

    env RCFTPRC=$configdir/rcftprc-b$c-s$s-p18139 /home/tanli/rftp/bin/rcftp -n -i -v < $taskdir/rput-c$c > $ftplogdir/log-b$c-s$s-p18139 &
    pid1=$!
    echo "env RCFTPRC=$configdir/rcftprc-b$c-s$s-p18139 /home/tanli/rftp/bin/rcftp -n -i -v < $taskdir/rput-c$c"
#    /home/tanli/rftp/bin/proccpuusage $pid1 > $cpulogdir/cpu-b$c-s$s-p18139 2>&1 &
    wait $pid1
    date "+%F %T" >> $timelogdir/datetime_end.log
    sleep 5
 done
done
killall -u $User nmon
exit

