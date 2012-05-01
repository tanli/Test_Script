#! /bin/bash

source ./define.sh

nmon -fT -s 5 -c 5000

if [ ! -d "$bw_logdir_1" ]; then
 mkdir -p $bw_logdir_1
#else
# rm -rf $ftplogdir/*
fi

if [ ! -d "$bw_logdir_2" ]; then
 mkdir -p $bw_logdir_2
#else
# rm -rf $ftplogdir/*
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
    env RCFTPRC=$configdir/rcftprc-b$c-s$s-p18139 /home/tan/test_all/rftp-test/Apr-17-2012/bin/rcftp -n -i -v < $taskdir/rput-c$c-ib0 > $bw_logdir_1/log-b$c-s$s-p18139 &
    pid1=$!
sleep 1
    env RCFTPRC=$configdir/rcftprc-b$c-s$s-p18139 /home/tan/test_all/rftp-test/Apr-17-2012/bin/rcftp -n -i -v < $taskdir/rput-c$c-ib1 > $bw_logdir_2/log-b$c-s$s-p18139 &
    pid2=$!
    echo "env RCFTPRC=$configdir/rcftprc-b$c-s$s-p18139 /home/tan/test_all/rftp-test/Apr-17-2012/bin/rcftp -n -i -v < $taskdir/rput-c$c"
    
     wait $pid1 $pid2
    date "+%F %T" >> $timelogdir/datetime_end.log
    sleep 5
 done
done

