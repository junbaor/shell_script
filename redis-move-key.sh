#!/bin/bash

src_ip=127.0.0.1
src_port=6379

dest_ip=127.0.0.1
dest_port=6379

src_key_prefix=TEST
dest_key_prefix=TEST2

i=1

redis-cli -h $src_ip -p $src_port hgetall "$src_key_prefix" |awk "NR%2==1"| while read key
do
    value=`redis-cli -h $dest_ip -p $dest_port hget "$dest_key_prefix" $key`

    if [ "$value" = "" ];
    then
        result=`redis-cli -h $src_ip -p $src_port hget "$src_key_prefix" $key`
        redis-cli -h $dest_ip -p $dest_port hset "$dest_key_prefix" "$key" "$result"
    else
        echo '<<<<>>>>'
    fi

    echo "$i migrate key $key"
    ((i++))
done
