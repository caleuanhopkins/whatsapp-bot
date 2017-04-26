#! bin/bash

while :; 
    do arp-scan --localnet --interface=en1 -O ieee-oui.txt | grep 'Amazon'; 
done