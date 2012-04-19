#! /bin/bash

killall -u $User rcftp
killall -u $User nmon
rm -f *.nmon
rm -rf ../log/*
