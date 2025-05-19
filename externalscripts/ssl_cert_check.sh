#!/bin/bash
HOST=$1
PORT=${2:-443}

# Получение даты окончания сертификата
end_date=$(echo | openssl s_client -servername "$HOST" -connect "$HOST:$PORT" 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)

if [ -z "$end_date" ]; then
    echo "0"
    exit 1
fi

# Подсчёт дней до истечения
end_date_seconds=$(date -d "$end_date" +%s)
now_seconds=$(date +%s)
days_left=$(( (end_date_seconds - now_seconds) / 86400 ))

echo $days_left
