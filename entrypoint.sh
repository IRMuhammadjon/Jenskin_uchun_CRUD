#!/bin/bash
set -e

# EF tool o'rnatish (birinchi marta kerak bo'ladi)
dotnet tool install --global dotnet-ef

# PATH ga qo'shish
export PATH="$PATH:/root/.dotnet/tools"

# Migrationni qo‘llash
dotnet ef database update --project Jenskin_uchun_CRUD.csproj

# Loyihani ishga tushirish
dotnet Jenskin_uchun_CRUD.dll
