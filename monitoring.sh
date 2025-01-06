#!/bin/bash

# المعمارية ديال النظام و نسخة الكيرنيل
system_info=$(uname -a)

# عدد المعالجات الفيزيائية
physical_cpus=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)

# عدد المعالجات الافتراضية
virtual_cpus=$(grep "^processor" /proc/cpuinfo | wc -l)

# الحجم الإجمالي للذاكرة RAM
total_ram_mb=$(free -m | awk '$1 == "Mem:" {print $2}')

# الذاكرة المستخدمة من RAM
used_ram_mb=$(free -m | awk '$1 == "Mem:" {print $3}')

# نسبة الاستعمال ديال RAM
ram_usage_percent=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# الحجم الإجمالي للقرص
total_disk_gb=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')

# حجم البيانات المستعملة من القرص
used_disk_mb=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')

# نسبة الاستعمال ديال القرص
disk_usage_percent=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}')

# حمل المعالج الحالي
cpu_load=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')

# تاريخ ووقت آخر إعادة تشغيل للسيرفر
last_boot_time=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# هل LVM مفعل؟
lvm_count=$(lsblk | grep "lvm" | wc -l)
lvm_status=$(if [ $lvm_count -eq 0 ]; then echo no; else echo yes; fi)

# عدد الاتصاليات TCP النشيطة
active_tcp_connections=$(cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}')

# عدد المستخدمين المتصلين حالياً
active_users=$(users | wc -w)

# عنوان IPv4 للسيرفر
server_ip=$(hostname -I)

# عنوان MAC للسيرفر
mac_address=$(ip link show | awk '$1 == "link/ether" {print $2}')

# عدد الأوامر المنفذة عبر sudo
sudo_commands_count=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

# عرض المعلومات على جميع التيرمينالات
wall "	#Architecture: $system_info
	#CPU physical: $physical_cpus
	#vCPU: $virtual_cpus
	#Memory Usage: $used_ram_mb/${total_ram_mb}MB ($ram_usage_percent%)
	#Disk Usage: $used_disk_mb/${total_disk_gb}Gb ($disk_usage_percent%)
	#CPU load: $cpu_load
	#Last boot: $last_boot_time
	#LVM use: $lvm_status
	#TCP Connections: $active_tcp_connections ESTABLISHED
	#Active Users: $active_users
	#Network: IP $server_ip ($mac_address)
	#Sudo Commands Executed: $sudo_commands_count"