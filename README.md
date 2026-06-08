# situ-devops-05 Лаб 5. Docker basics

Проект поднимает контейнер с Nginx, который:
- отдаёт статическую HTML страницу
- работает по HTTPS (self-signed certificate)
- пробрасывает порт 54321 -> 443
- показывает порт, по которому был сделан запрос
- обновляет сертификат через скрипт `renew-cert.sh`

Структура проекта
```
├── Dockerfile
├── index.html
├── nginx.conf
├── run.sh
├── certs/
│   ├── nginx.crt
│   └── nginx.key
└── renew-cert.sh
```

## Запуск стенда
1. Клонировать репо и провалиться в директорию
```
git clone https://github.com/sergeylobaev/situ-devops-05.git
cd situ-devops-05
```
2. Сгенерировать серт
```
mkdir -p certs
openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout certs/nginx.key \
    -out certs/nginx.crt \
    -subj "/C=RU/ST=Perm/L=Perm/O=SITU/OU=PSU/CN=localhost"
```
3. Запустить контейнер
```
chmod +x run.sh
./run.sh
```
4. Проверка
```
sergey@situ-vm-1:~/situ-devops-05$ curl -k https://localhost:54321
<!DOCTYPE html>
<html>
<head>
    <title>Nginx SITU</title>
</head>
<body>
    <h1>Hello from Docker Nginx 443 port!</h1>
</body>
```
5. Обновление сертификата
```
chmod +x renew-cert.sh
./renew-cert.sh
```

<img width="1474" height="526" alt="image" src="https://github.com/user-attachments/assets/cb8ae4fa-8f0e-45d6-853b-50364f3d1f80" />
