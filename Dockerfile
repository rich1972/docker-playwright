FROM python:3.12-slim

ENV TZ=Europe/Amsterdam

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends wget gnupg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir packaging requests python-dotenv playwright

RUN python -m playwright install-deps chromium && \
    python -m playwright install chromium && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
