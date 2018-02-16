#! /bin/bash

# download public files directly from site : http://www.1337upload.net

# select pages :
# lower_limit = lower_page_no. - 1 ;
# upper_limit = upper_page_no. - 1 ;
# replace line 18 of this script with
# for i in {lower_limit..upper_limit};

# examples :
# # to download from page 15 to 27
# # replace line 18 of this script with
# # for i in {14..26};

# # to download from only page 55
# # replace line 18 of this script with
# # for i in {54..54};

for i in {0..10};
do
    echo "<=================downloading from page $((i+1))=================>";
    echo "";
    wget -O index.html "http://www.1337upload.net/files?order=uptime&dir=DESC&start=$((i*60))";
    for link in $(cat index.html | grep "filename" | grep title | cut -f4 -d"\"");
    do
        wget $link ;
    done
    rm index.html
done
