#!/usr/bin/env bash
# quick one-screen system snapshot: os, cpu, memory, disk, ip
# usage: ./sysinfo.sh

echo "host   : $(hostname)"
echo "uptime : $(uptime -p 2>/dev/null || uptime)"
echo "kernel : $(uname -sr)"
echo "cpu    : $(nproc) cores"
echo "memory :"; free -h | awk 'NR==1||/Mem/'
echo "disk   :"; df -h --output=source,size,used,avail,pcent / 2>/dev/null || df -h /
echo "ip     : $(hostname -I 2>/dev/null | awk '{print $1}')"