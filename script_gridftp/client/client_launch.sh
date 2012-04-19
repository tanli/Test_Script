#! /bin/bash

source ./define.sh

nmon -fT -s 5 -c 5000

if [ ! -d "$BW_log_dir" ]; then
 mkdir -p $BW_log_dir
#else
# rm -rf $ftplogdir/*
fi

if [ ! -d "$CPU_log_dir" ]; then
 mkdir -p $CPU_log_dir
#else
# rm -rf $cpulogdir/*
fi


for blk_sz in $Blk_Szs
do
 for str_num in $Str_Nums
 do
 echo "==================================================================="
 echo "GridFTP test: block_sz=$blk_sz, stream_num=$str_num"
 echo "globus-url-copy -vb -nodcau -fast -t $Trans_Time -bs $blk_sz -tcp-bs 60MB -p $str_num -pp file:///dev/zero ftp://$Serv_IP:$Port/dev/null >> $BW_log_dir/bw_log-b$blk_sz-s$str_num 2>&1 &"
 globus-url-copy -vb -nodcau -fast -t $Trans_Time -bs $blk_sz -tcp-bs 60MB -p $str_num -pp file:///dev/zero ftp://$Serv_IP:$Port/dev/null >> $BW_log_dir/bw_log-b$blk_sz-s$str_num 2>&1 &
 pid=$!
 #/home/tanli/rftp/bin/proccpuusage $pid > $CPU_log_dir/cpu_log-b$blk_sz-s$str_num 2>&1
 wait $pid
 echo "case finished....."
 echo "==================================================================="
 sleep 5
 done
done

killall -u $User nmon

exit
