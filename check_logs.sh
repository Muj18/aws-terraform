#!/bin/bash
cat /var/log/httpd/access_log | grep $1 > ip_data.txt

echo "------------------------"
echo "[Traffic Requests]"
echo "------------------------"
cat ip_data.txt | awk '{print $1}' | grep $1 |sort -n | uniq -c
echo "------------------------"

echo "[Browser Type]"
echo "----------------------------------------------------------------------------------------"
cat ip_data.txt | awk -F\" '{print $6}'| sort -n | uniq -c
echo "----------------------------------------------------------------------------------------"


echo "[Status Code Response]"
echo "-----------------------"
cat ip_data.txt | awk '{print $9}' |sort -n | uniq -c
echo "-----------------------"

rm ip_data.txt