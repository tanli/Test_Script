#! /bin/bash

source ./define.sh
#env RFTPDRC=$configdir/rftpdrc-b64K-p18139-dno /usr/sbin/rftpd -D

nmon -fT -s 5 -c 5000

for p in $ports
do
env RFTPDRC=$configdir/rftpdrc-p$p /home/tanli/test_all/rftp_test/double-port-b2b/bin/rftpd -D
echo "env RFTPDRC=$configdir/rftpdrc-p$p /home/tanli/test_all/rftp_test/Mar-22-2012/bin/rftpd -D"
done
exit

