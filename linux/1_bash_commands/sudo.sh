#Check if user sudoer on server(if no, output: User apache is not allowed to run sudo on v00graphictst.)
sudo -l -U krasnosvarov_dn

#ПОВРЕЖДЕННЫЙ /ETC/SUDOERS — ОШИБКА В СИНТАКСИСЕ
#https://obu4alka.ru/resheno-povrezhdennyj-etc-sudoers-oshibka-v-sintaksise.html
#1. Откройте два сеанса ssh к серваку (или работа в двух терминалах или две вкладки в терминале).
echo $$
#2. Во второй запустите агент аутентификации с помощью:
pkttyagent --process Ваш_PID
#3. Вернувшись в первый сеанс, запустите:
pkexec visudo
#or
pkexec visudo -f /etc/sudoers.d/file
