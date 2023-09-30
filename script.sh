#!/bin/bash

# Define the hostname you want to modify
hostname="srvtest.midominio.com"

# Define the new IP address you want to use
new_ip_address="$1"

# Use sed to replace the old IP address with the new one
sudo sed -i "s/\b[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\b/$new_ip_address/g" /etc/hosts


sqlplus / as sysdba <<EOF
startup;
alter session set container=pdb1;
alter pluggable database read write;
exit;
EOF

lsnrctl start