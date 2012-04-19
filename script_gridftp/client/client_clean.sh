#! /bin/bash

source ./define.sh

killall -u $User globus-url-copy
killall -u $User nmon
rm -f *.nmon
rm -rf ../log/*
