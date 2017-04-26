#!/bin/bash
MAC="34:d2:70:84:f2:72"

function onClick {
  #curl -X POST https://rest.nexmo.com/sms/json \
  #-d api_key=<NEXMO API KEY> \
  #-d api_secret=<NEXMO API SECRET> \
  #-d to=<MOBILE NUMBER> \
  #-d from="BACON" \
  #-d text="Make me bacon please"

  echo 'amazon dash pressed'
  sh docker.sh
}

START=$(date +%s);
tcpdump -l -i en1 ether host "$MAC" | while read b; do
    END=$(date +%s);
    diff=`echo $((END-START)) | awk 'int($1%60)'` # Get time since last click.
    if [ $(($diff)) -gt 3 ] # wait more than 3 seconds after last click - tcdump has multiple outputs.
    then
        START=$(date +%s)
        onClick & # run in background
    fi
done