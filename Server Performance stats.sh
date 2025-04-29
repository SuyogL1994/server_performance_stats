#!/bin/bash

# server-stats.sh
# A script to analyze basic server performance stats

echo "==============================================="
echo "         Server Performance Statistics         "
echo "==============================================="

# OS Version
echo -e "\n>> OS Version:"
uname -a

# Uptime
echo -e "\n>> Uptime:"
uptime -p

# Load Average
echo -e "\n>> Load Average:"
uptime | awk -F'load average:' '{ print $2 }'

# Logged in Users
echo -e "\n>> Currently Logged In Users:"
who

# Total CPU Usage
echo -e "\n>> Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "User: " $2 ", System: " $4 ", Idle: " $8}'

# Total Memory Usage
echo -e "\n>> Total Memory Usage:"
free -h | awk '/Mem:/ {
    printf "Total: %s, Used: %s, Free: %s, Usage: %.2f%%\n", 
    $2, $3, $4, $3/$2 * 100
}'

# Total Disk Usage
echo -e "\n>> Total Disk Usage:"
df -h --total | grep total | \
awk '{print "Total Size: " $2 ", Used: " $3 ", Available: " $4 ", Usage: " $5}'

# Top 5 Processes by CPU usage
echo -e "\n>> Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory usage
echo -e "\n>> Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

# Failed login attempts (optional stretch goal)
echo -e "\n>> Failed Login Attempts:"
if command -v journalctl >/dev/null 2>&1; then
    journalctl _COMM=sshd | grep "Failed password" | wc -l
else
    grep "Failed password" /var/log/auth.log 2>/dev/null | wc -l
fi

echo -e "\n==============================================="
