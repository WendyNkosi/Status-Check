FROM python:3.12-alpine
WORKDIR /usr/src/app
EXPOSE 8080

# Install system dependencies, including g++, Rust, and others required for building wheels
RUN apk --no-cache add \
    bash cargo curl g++ gcc jq libffi-dev musl-dev rust wget

# Upgrade pip, setuptools, and wheel, and install ddtrace
RUN pip install --upgrade pip \
    && pip install --upgrade setuptools wheel \
    && pip install ddtrace

COPY . ./     

RUN chmod +x /usr/src/app/serve.sh

RUN pip install --no-cache-dir -r requirements.txt --root-user-action=ignore

CMD ["sh", "/usr/src/app/serve.sh"]
