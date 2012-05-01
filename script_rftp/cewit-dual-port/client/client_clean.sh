#! /bin/bash

source ./define.sh

killall -u tan nmon
killall -u tan rcftp
rm -f *.nmon
rm -rf ../log/*
