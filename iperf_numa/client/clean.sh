#! /bin/bash

log_dir=/home/tanli/test/iperf_test/dell_numa/log

rm -rf $log_dir/*
killall -u tanli iperf
