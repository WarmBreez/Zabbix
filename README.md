# Zabbix
1. Создать самоподписаные сертификаты (zabbix-ssl)

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout zabbix.key   -out zabbix.crt   -subj "/C=RU/ST=Moscow/L=Moscow/O=Zabbix/CN=zabbix.local"

2. Заменить данные на свои (логины и пароли).

Добавлен скрипт для проверки SSL сертификата сайта.

Чтобы добавить свой шаблон для проверки скорости загрузки сайта и время отклика, нужно создать "Веб сценарий" в созданном шаблоне.

3. Запустить командой docker compose up --build -d 
