#!/bin/bash

# Array of IP addresses and corresponding hostnames of all Raspberry Pis in the cluster, including the host
pi_info=("169.254.38.164 bevmic" "192.168.1.101 bevmic")

# SSH into each Raspberry Pi and execute a command on all cores
for info in "${pi_info[@]}"
do
    ip=$(echo $info | cut -d' ' -f1)
    hostname=$(echo $info | cut -d' ' -f2)
    echo "Connecting to Raspberry Pi at $hostname ($ip)"
    ssh -i ~/.ssh/id_rsa $hostname@$ip 'for i in $(seq 0 3); do echo "Hello World from core $i"; done'
done
