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
sysctl -w net.ipv4.tcp_rmem="4096 87380 16777216"
sysctl -w net.ipv4.tcp_wmem="4096 65536  16777216"

sysctl -w net.core.netdev_max_backlog=250000
sysctl -w net.core.rmem_max=16777216
sysctl -w net.core.wmem_max=16777216
sysctl -w net.core.rmem_default=16777216
sysctl -w net.core.wmem_default=16777216
sysctl -w net.core.optmem_max=16777216

service cpuspeed stop

for p in eth10 eth11 eth12 eth13 eth14
do
  ifconfig $p mtu 9000
  ethtool -G $p rx 8192
#  ifconfig $p txqueuelen 10000
done

#ethtool -C eth6 adaptive-rx off rx-usecs 0 rx-frames 0
#thtool -C eth5 adaptive-rx off rx-usecs 0 rx-frames 0
