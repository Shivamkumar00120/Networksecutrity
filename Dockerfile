# 1. Use a modern Python base image (Debian Bookworm) that works perfectly
FROM python:3.10-slim-bookworm

WORKDIR /app
COPY . /app 

# 2. Install your required tools (This will now run flawlessly without errors)
RUN apt-get update -y && apt-get install -y awscli git build-essential

# 3. Install your updated python packages
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
