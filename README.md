# Zabbix
1.Изменение подклчюения с https на ssh:
git remote set-url origin git@github.com:username/repository.git
Проверяем:
git remote -v

2. Создать самоподписаные сертификаты (zabbix-ssl)

mkdir -p certs
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout certs/zabbix.key \
  -out certs/zabbix.crt \
  -subj "/C=RU/ST=Moscow/L=Moscow/O=MyCompany/CN=zabbix-web"

3. Заменить данные на свои (логины и пароли).

Добавлен скрипт для проверки SSL сертификата сайта.

Чтобы добавить свой шаблон для проверки скорости загрузки сайта и время отклика, нужно создать "Веб сценарий" в созданном шаблоне.

4. Запустить командой docker compose up --build -d 
