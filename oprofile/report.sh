#! /bin/bash

source /home/tanli/test_all/oprofile/script/define.sh

opcontrol --dump
opreport --session-dir=$Log_dir -l $App -m all 


