#! /bin/bash

source ./define.sh

if [ ! -d "$configdir" ]; then
mkdir -p $configdir
fi

rm -rf $configdir/*


for c in $cbufsiz
do
 for s in $str_num
 do
  
  n=7
  p=18141
  if [ $c = "128K" ]; then
   n=1680
   p=18139
  fi

  if [ $c = "256K" ]; then
   n=840
   p=18139
  fi

  if [ $c = "512K" ]; then
   n=420
   p=18139
  fi

  if [ $c = "1M" ]; then
   n=210
   p=18140
  fi

  if [ $c = "2M" ]; then
   n=105
   p=18140
  fi

  if [ $c = "4M" ]; then
   n=56
   p=18140
  fi

  if [ $c = "8M" ]; then
   n=28
  fi

  if [ $c = "16M" ]; then
   n=14
  fi

    #touch $configdir/rcftprc-b$c-p18139-ib0
   echo "cbufsiz="$c > $configdir/rcftprc-b$c-s$s-p18139
   echo "cbufnum="$n >> $configdir/rcftprc-b$c-s$s-p18139
   echo "rdma_qp_rq_depth=1024" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "rdma_qp_sq_depth=1024" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "rcstreamnum="$s >> $configdir/rcftprc-b$c-s$s-p18139
   echo "srvcomport="$p >> $configdir/rcftprc-b$c-s$s-p18139
   echo "directio=no" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "usesendfile=no" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "usesplice=no" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "rmtaddrnum=1000" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "evbufnum=1000" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "recvbufnum=1000" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "readernum=4" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "writernum=1" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "ioengine=sync" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "rdma_cq_depth=2000" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "wceventnum=800" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "wcthreadnum=8" >> $configdir/rcftprc-b$c-s$s-p18139
   echo "devzerosiz=400G" >> $configdir/rcftprc-b$c-s$s-p18139
  done
done

exit
