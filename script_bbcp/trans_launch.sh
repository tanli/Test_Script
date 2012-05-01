#! /bin/bash

source ./define.sh

nmon -fT -s 5 -c 5000

if [ ! -d "$bwlog_dir_1" ]; then
mkdir -p $bwlog_dir_1
fi

if [ ! -d "$bwlog_dir_2" ]; then
mkdir -p $bwlog_dir_2
fi


#if [ ! -d "$bwlog_dir_2" ]; then
#mkdir -p $bwlog_dir_2
#else
#rm -rf $bwlog_dir_2
#fi

if [ ! -d "$time_log_dir" ]; then
mkdir -p $time_log_dir
#else
#rm -rf $cpulog_dir_1
fi

#if [ ! -d "$cpulog_dir_2" ]; then
#mkdir -p $cpulog_dir_2
#else
#rm -rf $cpulog_dir_2
#fi
echo "================================================================"
echo "Test start...."

for str_num in $Str_nums
do
 for buf_sz in $Buf_szs
 do
  echo "================================================================"
  echo "Case (single): buf_size=$buf_sz stream_num=$str_num"
  echo "bbcp -w =$buf_sz -t $test_time -B $buf_sz -F -v -n -s $str_num -P 2 /dev/zero tanli@$IP:/dev/null >> $bwlog_dir/bw_log_b$buf_sz-s$str_num-single 2>&1 &"
  date "+%F %T" >> $time_log_dir/datetime_start.log
  bbcp -w =$buf_sz -t $test_time -B $buf_sz -F -n -v -s $str_num -P 2 /dev/zero tanli@$IP_1:/dev/null >> $bwlog_dir_1/bw_log_b$buf_sz-s$str_num-double 2>&1 &
  pid1=$!
  bbcp -w =$buf_sz -t $test_time -B $buf_sz -F -n -v -s $str_num -P 2 /dev/zero tanli@$IP_2:/dev/null >> $bwlog_dir_2/bw_log_b$buf_sz-s$str_num-double 2>&1 &
  pid2=$!
  wait $pid1 $pid2
  date "+%F %T" >> $time_log_dir/datetime_end.log
  sleep 5
  echo "Finsh..."
  echo "================================================================"
 echo
 done
done
exit
