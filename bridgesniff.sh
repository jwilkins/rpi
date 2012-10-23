#!/bin/bash
# sudo apt-get install bridge-utils tcpdump
hash brctl 2>/dev/null || { echo >&2 "brctl not found, apt-get install bridge-utils"; exit 1; }
hash tcpdump 2>/dev/null || { echo >&2 "tcpdump not found, apt-get install tcpdump"; exit 1; }

#br0_ip="192.168.1.199" 
#br0_mask="255.255.255.0"
#br0_broadcast="192.168.1.255"

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig eth0 0.0.0.0 promisc up
ifconfig eth1 0.0.0.0 promisc up
ifconfig br0 promisc up
#ifconfig br0 $br0_ip netmask $br0_mask broadcast $br0_broadcast
tcpdump -i br0 -s 1600 
