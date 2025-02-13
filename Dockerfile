FROM ubuntu:20.04
LABEL maintainer="the29a"

# Добавляем тестовые переменные
ENV USER="super_user"
ENV PASSWORD="super_secret_password"
ENV API_TOKEN="71738e41-a648-41c8-9bcf-755dcf970788"

# Устанавливаем переменные окружения для веб-приложения
ENV FLASK_ENV=development
ENV FLASK_APP=/src/app.py
ENV DATABASE=/src/database.db

ADD findme /usr/local/bin/findme
ADD .env .env

# Устанавливаем рабочую директорию
WORKDIR /src

# Копируем исходный код в контейнер
COPY ./src /src

# Устанавливаем необходимые пакеты
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    sqlite3 \
    curl && \
    pip3 install --upgrade pip==23.1.2 && \
    pip3 install -r /src/requirements.txt

# Открываем порт 5000
EXPOSE 5000

# Запускаем приложение с помощью Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "4", "app:app"]