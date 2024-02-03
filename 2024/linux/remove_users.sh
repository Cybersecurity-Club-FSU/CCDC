#!/bin/bash

while read line
do
	touch all_users.txt
	$(awk -F: '($3>=1000)&&($1!="nobody"){print $1}' /etc/passwd) > all_users.txt
	$(comm -23 all_users.txt -) > remove_users.txt
	#for user in $(cat remove_users.txt)
	#do
	#	$(userdel -r $user)
	#	echo "User $user removed"
	#done
done < "${1:-/dev/stdin}"
