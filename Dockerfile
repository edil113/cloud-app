# Базовый образ с Python
FROM python:3.12-slim

WORKDIR /app

# Сначала зависимости — так Docker кэширует этот слой
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Затем код приложения
COPY . .

EXPOSE 5000

# Gunicorn — промышленный сервер для Flask, 2 рабочих процесса
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]
