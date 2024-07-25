Overview for the shell script
---------

Create a shell script to extract information from the apache access log:
All traffic from a specified ip address
Show the number of requests coming from each browser type
Count the number of different responses ie 200 or 404

To run the log script
-----------------------
- Copy the contents of Check_Logs.sh into the EC2 instance

- Run the script as sudo sh ./check_logs.sh (and enter the desired ip address) eg sudo ./check_logs.sh X.X.X.X

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