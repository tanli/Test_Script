#! /bin/bash

source ./define.sh

killall -u tanli rftpd
killall -u tanli nmon
rm -f *.nmon

