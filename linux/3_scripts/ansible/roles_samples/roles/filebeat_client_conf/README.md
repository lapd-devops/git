##### Установка и настройка клиента filebeat 7.2.7 на EL7
###### Репозиторий содержит плейбук, устаавливающий и настраивающий filebeat версии 7.2.1  
**эта штука здорово облегчает жизнь, сама поставит rpm-пакет( он есть у нее), сама все настроит, тебе только прописать:**

1. В репозитории два плейбука
* ```playbooks/filebeat.yml``` - если в заявке указан только один сервер
* ```playbooks/filebeat_multiple_servers.yml``` - если несколько  
*вся настройка плейбуков отличается только тем что переменную с путями логов во втором плейбуке надо указазть в каждом таске*

2. При заявке на настройку filebeat забиксойды указывают порт и сертификат, заказчик указывает сервера и пути логов  
* Сервера указываются в файле hosts(если только один, то в первой группе ```group1```)
* порт, имя сертификата и пути логов указывабтся в самом плейбуке, применен цикл **for** в шаблоне, поэтому пути можно указывать в переменных в таком виде( если их требуется несколько):
```
  vars: 
    - main_dir: /builds/unix_adm/filebeat_client_conf
    
    - cert_name: fito_logs.crt
    - logs_path:
        - /var/log/haproxy
        - /var/log/test

    - server_port: 5175

```

3. Подразумеватся, что ты стянешь себе репу, закинешь в нее сертификат в папку ```certs``` и отправишь в свою ветку( ветку, названную по твоему рабочему логину)
