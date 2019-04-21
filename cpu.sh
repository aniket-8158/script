#!/bin/bash
echo -e "===============================================================" >> /home/sys_info.$$
user=`who | wc -l`

echo -e "User name: $USER (Login name: $LOGNAME)" >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "Home Directory: $HOME" >> /home/sys_info.$$
ls -lrth >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "Current Shell: $SHELL" >> /home/sys_info.$$

if [ -f /etc/shells ]
then
 echo -e "Available Shells: " >> /home/sys_info.$$
 echo -e "`cat /etc/shells`" >> /home/sys_info.$$
fi
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "User and Shell:" >> /home/sys_info.$$
cat /etc/passwd >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "User Currently Logged:" >> /home/sys_info.$$
users >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "User and Group:" >> /home/sys_info.$$
cat /etc/group >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

if [ -f /etc/redhat-release ]
then
 echo -e "OS: `cat /etc/redhat-release`" >> /home/sys_info.$$
fi
echo -e "===============================================================" >> /home/sys_info.$$
echo -e "OS Information:" >> /home/sys_info.$$
uname -a >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "Path:" >> /home/sys_info.$$
echo -e "PATH: $PATH" >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "Computer CPU Information:" >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$
cat /proc/cpuinfo >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "Computer Memory Information:" >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$
cat /proc/meminfo >> /home/sys_info.$$

echo -e "===============================================================" >> /home/sys_info.$$
echo -e "Computer HDD Information:" >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$
df -hT >> /home/sys_info.$$
echo -e "===============================================================" >> /home/sys_info.$$

echo -e "================================================================" >> /home/sys_info.$$
echo -e "File System (Mount):" >> /home/sys_info.$$
echo -e "================================================================" >> /home/sys_info.$$
cat /proc/mounts >> /home/sys_info.$$
echo -e "================================================================" >> /home/sys_info.$$

if which dialog > /dev/null
then
 dialog --backtitle "Syatem Information Script" --title "Press Up/Down Keys to move" --textbox /home/sys_info.$$ 21 70
else
 cat /home/sys_info.$$ |more
fi

rm -f /home/sys_info.$$
