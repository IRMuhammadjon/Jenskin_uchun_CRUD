#!/bin/bash
set -e

echo "Ma'lumotlar bazasi tayyorligini kutyapmiz..."
while ! nc -z db 5432; do
  echo "Postgres serveriga ulanish imkoni yo'q, 2 soniya kutilyapti..."
  sleep 2
done

echo "Ma'lumotlar bazasi tayyor, migratsiyalarni qo'llayapmiz..."

# EF tool o'rnatish (birinchi marta kerak bo'ladi)
dotnet tool install --global dotnet-ef

# PATH ga qo'shish
export PATH="$PATH:/root/.dotnet/tools"

# Migrationni qo‘llash
dotnet ef database update --project Jenskin_uchun_CRUD.csproj

# Loyihani ishga tushirish
dotnet Jenskin_uchun_CRUD.dll
