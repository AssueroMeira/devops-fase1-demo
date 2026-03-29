FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=5000

COPY requirements.txt .

RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY app ./app

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.main:app"]