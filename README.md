# Zabbix

1. Создать самополписаные сертификаты (zabbix-ssl)

mkdir -p certs

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout certs/zabbix.key \
  -out certs/zabbix.crt \
  -subj "/C=RU/ST=Moscow/L=Moscow/O=MyCompany/CN=zabbix-web"

2. Заменить данные на свои (логины и пароли).

Добавлен скрипт для проверки SSL сертификата сайта.

Чтобы добавить свой шаблон для проверки скорости загрузки сайта и время отклика, нужно создать "Веб сценарий" в созданном шаблоне.

3.Запустить командой docker compose up --build -d 
