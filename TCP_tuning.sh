#! /bin/bash

#ifconfig eth7 mtu 9000
#ifconfig eth7 txqueuelen 10000
service irqbalance stop

#system kernel tuning
#/sbin/modprobe tcp_htcp
#sysctl -w net.ipv4.tcp_congestion_control=cubic
sysctl -w net.ipv4.tcp_timestamps=0
sysctl -w net.ipv4.tcp_low_latency=1
sysctl -w net.ipv4.tcp_sack=0
sysctl -w net.ipv4.tcp_mem="16777216 16777216 16777216"
sysctl -w net.ipv4.tcp_rmem="4096 262144 16777216"
sysctl -w net.ipv4.tcp_wmem="4096 262144  16777216"

sysctl -w net.core.netdev_max_backlog=250000
sysctl -w net.core.rmem_max=33554432
sysctl -w net.core.wmem_max=33554432
sysctl -w net.core.rmem_default=16777216
sysctl -w net.core.wmem_default=16777216
sysctl -w net.core.optmem_max=16777216

service cpuspeed stop
echo performance > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor

#ethtool -C eth6 adaptive-rx off rx-usecs 0 rx-frames 0
#ethtool -C eth5 adaptive-rx off rx-usecs 0 rx-frames 0
