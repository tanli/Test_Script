#! /bin/bash

source ./define.sh

nmon -fT -s 5 -c 5000

globus-gridftp-server -p $Port --aa -control-interface $IP1  -data-interface $IP1 & 

echo "globus-gridftp-server -p $Port --aa -control-interface $IP1  -data-interface $IP1 &"
exit

