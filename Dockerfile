# 1. Build bosqichi
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

# 2. Run bosqichi
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# EF tools uchun kerakli dependency
RUN apt-get update && apt-get install -y curl

# EF toolsni o‘rnatish imkonini berish uchun SDK image kerak bo‘ladi
# Shuning uchun SDK bazasida ishlaymiz:
FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /app
COPY --from=build /app/out ./
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

EXPOSE 80

ENTRYPOINT ["./entrypoint.sh"]
