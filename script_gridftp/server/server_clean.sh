#! /bin/bash

source ./define.sh

killall -u $User globus-gridftp-server
killall -u $User nmon
rm -f *.nmon
