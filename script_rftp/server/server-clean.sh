#! /bin/bash

killall -u $User rftpd
killall -u $User nmon
rm -f *.nmon

