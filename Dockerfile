# 1. Build stage (SDK bilan)
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o /app/out

# 2. Final stage (ASP.NET Runtime bilan)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# EF tools ishlashi uchun faqat kerakli fayllarni oldindan ishga tushiramiz:
COPY --from=build /app/out ./
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

EXPOSE 80

ENTRYPOINT ["./entrypoint.sh"]
