#Узнать внешний ip
wget -q -O - checkip.dyndns.org \
> | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
