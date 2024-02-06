#!/bin/bash

awk -F: '($3>=1000)&&($1!="nobody"){print $1}' /etc/passwd > all_users.txt

grep -vxFf ./good_users.txt ./all_users.txt | while read user
do
	#$(userdel -r $user)
 	echo "$user is a bad user! Edit script and RERUN!"
done
