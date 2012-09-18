#! /bin/bash

source /home/tanli/test_all/oprofile/script/define.sh 

#Clean the environment
opcontrol --stop
opcontrol --shutdown 
opcontrol --deinit
opcontrol --reset
#echo 0 > /proc/sys/kernel/nmi_watchdog

#Do the initiation
#opcontrol --vmlinux=/usr/lib/debug/lib/modules/2.6.32-279.5.2.el6.x86_64/vmlinux --separate=thread,kernel
opcontrol --no-vmlinux --separate=thread,kernel
opcontrol --init

#List the events monitered
opcontrol --event=LLC_MISSES:8000 --event=resource_stalls:2200000 --event=CPU_CLK_UNHALTED:2200000  

#opcontrol --event=resource_stalls:2200000:0x10 --event=resource_stalls:2200000:0x0e --event=resource_stalls:2200000:0x04 --event=CPU_CLK_UNHALTED:2200000

#opcontrol --event=resource_stalls:2200000:0x0e --event=CPU_CLK_UNHALTED:2200000


opcontrol --session-dir=$Log_dir

opcontrol --start

opcontrol --reset
#opcontrol --list-events
