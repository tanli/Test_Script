#! /bin/bash

source ./define.sh

killall -u $User rftpd
killall -u $User nmon
rm -f *.nmon

