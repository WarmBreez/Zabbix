#!/bin/bash
# /etc/zabbix/scripts/check_domain_expiry.sh - через SSL

DOMAIN="$1"
PORT=${2:-443}

# Получаем дату из SSL сертификата
cert_info=$(echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:$PORT" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null)

if [ -z "$cert_info" ]; then
    echo "0"
    exit 1
fi

# Извлекаем дату
end_date=$(echo "$cert_info" | cut -d= -f2)

# Конвертируем в секунды
end_seconds=$(date -d "$end_date" +%s 2>/dev/null)
now_seconds=$(date +%s)

# Считаем дни
days_left=$(( (end_seconds - now_seconds) / 86400 ))

# Не возвращаем отрицательные числа
if [ $days_left -lt 0 ]; then
    echo "0"
else
    echo $days_left
fi
