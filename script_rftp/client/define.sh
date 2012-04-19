#! /bin/bash

User=tanli

#Paths 
configdir=/home/tanli/rftp/config
taskdir=/home/tanli/rftp/task
ftplogdir=/home/tanli/rftp/log/rftp
cpulogdir=/home/tanli/rftp/log/cpu
timelogdir=/home/tanli/rftp/log/time
data_src=/home/tanli/rftp/data/source
data_sink=/home/tanli/rftp/data/sink

#Parameters
cbufsiz="64M 32M 16M 8M 4M 2M 1M 512K 256K 128K"
str_num="1 2 4 8"
IB_port1=192.168.140.13
