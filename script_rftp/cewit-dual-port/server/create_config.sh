#! /bin/bash

source ./define.sh

if [ ! -d "$configdir" ]; then
mkdir -p $configdir
fi

rm -rf $configdir/*

n=20

for p in $ports
do


# touch $configdir/rftpdrc-b$c-p18139-dno
# echo "cbufsiz="$c > $configdir/rftpdrc-b$c-p18139-dno
 echo "rdma_qp_rq_depth=1024" > $configdir/rftpdrc-p$p
 echo "rdma_qp_sq_depth=1024" >> $configdir/rftpdrc-p$p
 echo "cbufnum=" $n >> $configdir/rftpdrc-p$p
 echo "rcstreamnum=10" >> $configdir/rftpdrc-p$p
 echo "srvcomport="$p >> $configdir/rftpdrc-p$p
 echo "directio=no" >> $configdir/rftpdrc-p$p
 echo "devzerosiz=100G" >> $configdir/rftpdrc-p$p
 echo "usesplice = no" >> $configdir/rftpdrc-p$p
 echo "rmtaddrnum = 200" >> $configdir/rftpdrc-p$p
 echo "evbufnum = 500" >> $configdir/rftpdrc-p$p
 echo "recvbufnum = 500" >> $configdir/rftpdrc-p$p
 echo "readernum = 1" >> $configdir/rftpdrc-p$p
 echo "writernum = 2" >> $configdir/rftpdrc-p$p
 echo "ioengine = sync" >> $configdir/rftpdrc-p$p
 echo "rdma_cq_depth = 500" >> $configdir/rftpdrc-p$p
 echo "wceventnum = 600" >> $configdir/rftpdrc-p$p
 echo "wcthreadnum = 4" >> $configdir/rftpdrc-p$p
done
exit
