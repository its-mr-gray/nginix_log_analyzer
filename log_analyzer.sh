#!/bin/bash


echo -e "\nTOP IP ADDRESSES BY REQUEST\n"
awk '{print $1}' nginx-log.txt | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests made."} ' | head -5
 
echo -e "\nTOP MOST REQUESTED PATHS\n"
awk '{print $7}' nginx-log.txt | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests made."} ' | head -5

echo -e "\nTOP RESPONSE STATUS CODES\n"
grep -oE ' [1-5][0-9]{2} ' nginx-log.txt | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " response codes."} ' | head -5

echo -e "\nTOP 5 USER AGENTS\n"
awk -F '"' '{print $6}' nginx-log.txt | sort | uniq -c | sort -nr | awk '{for(i=2;i<=NF;i++) printf "%s ", $i; print "-", $1,"requests"}' | head -5


