#!/bin/bash
openssl genrsa -out /etc/haproxy/private.key 2048 
openssl req -new -subj '/CN=localhost/O=Tander/C=RU/ST=KRD/L=Krasnodar' -key /etc/haproxy/private.key -out /etc/haproxy/cert.csr 
openssl x509 -req -in /etc/haproxy/cert.csr -signkey /etc/haproxy/private.key -out /etc/haproxy/cert.crt -days 3650 && cat /etc/haproxy/cert.crt > /etc/haproxy/my.pem 
cat /etc/haproxy/private.key >> /etc/haproxy/my.pem
