#! /bin/bash

for i in {0..10};
do
    wget -O index.html "http://www.1337upload.net/files?order=uptime&dir=DESC&start=$((i*60))";
    for link in $(cat index.html | grep "filename" | grep title | cut -f4 -d"\"");
    do
        wget $link ;
    done
    rm index.html
done
