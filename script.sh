sqlplus / as sysdba <<EOF
startup;
alter session set container=pdb1;
alter pluggable database read write;
exit;
EOF

lsnrctl start
