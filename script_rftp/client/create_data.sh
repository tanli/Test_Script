#! /bin/bash

source ./define.sh

if [ ! -d "$data_src" ]; then
 mkdir -p $data_src
else
 rm -rf $data_src/*
fi

if [ ! -d "$data_sink" ]; then
 mkdir -p $data_sink
else
 rm -rf $data_sink/*
fi


# link source memory
for i in a b c d e f g h
do
        #test -z "$link_root/source/mem" || mkdir -p $link_root/source/mem
        ln -s /dev/zero $data_src/zero$i
done

# link sink memory
for i in a b c d e f g h
do
        ln -s /dev/null $data_sink/zero$i
done
exit

