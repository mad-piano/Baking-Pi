#!/bin/bash

# Array of IP addresses and corresponding hostnames of all Raspberry Pis in the cluster, including the host
pi_info=("192.168.1.100 bevmic2" "192.168.1.101 bevmic" "bevmic3" "169.254.241.166" "bevmic4" "172.19.0.18")

# SSH into each Raspberry Pi and execute a command
for info in "${pi_info[@]}"
do
    ip=$(echo $info | cut -d' ' -f1)
    hostname=$(echo $info | cut -d' ' -f2)
    echo "Connecting to Raspberry Pi at $hostname ($ip)"
    for core in {0..3}
    do
        ssh $hostname@$ip "echo 'Hello World from core $core'"
    done
done
