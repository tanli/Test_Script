#! /bin/bash

source ./define.sh

killall -u $User rcftp
killall -u $User nmon
rm -f *.nmon
rm -rf ../log/*
