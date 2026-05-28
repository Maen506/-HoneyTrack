FROM python:3.11-slim-buster

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose ports for SSH honeypot (2222), HTTP honeypot (8080), and Flask dashboard (5000)
EXPOSE 2222
EXPOSE 8080
EXPOSE 5000

CMD ["python", "main.py"]
