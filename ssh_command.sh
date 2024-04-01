#!/bin/bash

# Array of IP addresses of all Raspberry Pis in the cluster, including the host
pi_ips=("169.254.116.109" "169.254.38.164")

# SSH into each Raspberry Pi and execute a command
for ip in "${pi_ips[@]}"
do
    echo "Connecting to Raspberry Pi at $ip"
    ssh pi@$ip 'for i in $(seq 0 3); do echo "Hello World from core $i"; done'
done
