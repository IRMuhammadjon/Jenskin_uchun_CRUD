# 1. Build bosqichi
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Barcha fayllarni nusxalash
COPY . ./

# Loyihani build qilish
RUN dotnet restore
RUN dotnet publish -c Release -o out

# 2. Run bosqichi
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

COPY --from=build /app/out .

# Port ochish
EXPOSE 80

# Loyihani ishga tushirish
ENTRYPOINT ["dotnet", "Jenskin_uchun_CRUD.dll"]
