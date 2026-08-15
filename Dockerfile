FROM python:3.8-slim 

WORKDIR /app
COPY . /app 

# 1. Fix the Debian Buster EOL repositories so apt update works
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/buster-updates/d' /etc/apt/sources.list

# 2. Install awscli AND git (git is required to pull your public repo)
RUN apt-get update -y && apt-get install -y awscli git build-essential

# 3. Install your updated python packages
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
