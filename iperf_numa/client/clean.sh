#! /bin/bash

log_dir=./log

rm -rf $log_dir/* *.txt
killall -u tanli iperf
