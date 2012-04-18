#! /bin/bash

echo "==============================================================="
echo "Get rftp data from anl"
echo
 scp tanli@192.168.120.132:/home/tanli/rftp/script/*.nmon ./rftp/
 scp -r tanli@192.168.120.132:/home/tanli/rftp/log/* ./rftp/
echo "Get gridftp data from anl"
 scp tanli@192.168.120.132:/home/tanli/gridftp/script/*.nmon ./gridftp/
 scp -r tanli@192.168.120.132:/home/tanli/gridftp/log/* ./gridftp/

echo "Get data from nersc"
echo
 scp tanli@192.168.120.6:/home/tanli/rftp/script/*.nmon ./rftp/
 scp tanli@192.168.120.6:/home/tanli/gridftp/*.nmon ./gridftp/

echo "Upload nmon data to hpdtl"
echo
 scp ./rftp/Apr-17/*.nmon tan@192.168.1.80:/home/tan/nmon_data/rftp/ESnet-10G-RoCE
 scp ./gridftp/*.nmon tan@192.168.1.80:/home/tan/nmon_data/gridftp/ESnet-10G-RoCE
 scp ./rftp/Apr-17/time/* tan@192.168.1.80:/home/tan/nmon_data/rftp/ESnet-10G-RoCE
 scp ./gridftp/time/* tan@192.168.1.80:/home/tan/nmon_data/gridftp/ESnet-10G-RoCE
echo "=============================================="
exit
