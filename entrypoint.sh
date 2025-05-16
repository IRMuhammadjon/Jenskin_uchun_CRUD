#!/bin/bash
set -e

echo "Ma'lumotlar bazasi tayyorligini kutyapmiz..."
while ! nc -z db 5432; do
  echo "Postgres serveriga ulanish imkoni yo'q, 2 soniya kutilyapti..."
  sleep 2
done

echo "Migratsiyani bajarish o'tkazib yuboriladi. Chunki runtime image ichida ef tool yo'q."

echo "Web API ishga tushyapti..."
dotnet Jenskin_uchun_CRUD.dll
