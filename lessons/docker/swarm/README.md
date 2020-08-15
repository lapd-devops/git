```
terraform apply
terraform refresh

#check if 
for i in $(for i in $(virsh list|tail -n+3|awk '{print $2}'); do virsh domifaddr $i|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'; done); do ssh den@$i 'hostname; sudo tail -2 /var/log/cloud-init-output.log'; done


#show ips and hostnames
for i in $(for i in $(virsh list|tail -n+3|awk '{print $2}'); do virsh domifaddr $i|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'; done); do echo $i; ssh den@$i 'hostname'; done
192.168.122.69
swarm1
192.168.122.62
swarm3
192.168.122.14
swarm2
```