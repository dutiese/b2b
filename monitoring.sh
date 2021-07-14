# !/usr/bin/bash
clear
wall "
#Architecture: $(uname -a)
#CPU physical: $(nproc --all)
#vCPU: $(cat /proc/cpuinfo | grep processor | wc -l)
#Memory Usage: $(free -h | awk 'NR == 2 {print $3-0"/"$2-0"Gb"}') ($(free -t | awk 'NR == 2 {printf("%.2f"), $3/$2*100}')%)
#Disk Usage: $(df -h | awk 'NR == 4 {print $3-0"/"$2-0"Gb ("$5")"}')
#CPU load: $(top -b -n1 | grep ^%Cpu | awk '{printf("%.1f"), 100-$8}')%
#Last boot: $(who -b | awk 'NR == 1 {print $3" " $4" " $5" " $6}')
#LVM use: $(if [ $(lsblk | grep lvm | wc -l) -gt 0 ]
then
        echo "yes"
else
        echo "no"
fi
)
#Connections TCP: $(netstat | grep tcp |wc -l) ESTABLISHED
#User log: $(who | wc -l)
#Network: IP $(ip route list | awk 'NR == 2 {print $9}') ($(ip addr show enp0s3 | awk 'NR == 2 {print $2}'))
#Sudo: $(grep -c ':' /var/log/sudo/sudo.log) cmd
"
