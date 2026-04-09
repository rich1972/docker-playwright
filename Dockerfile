FROM python:3.12-slim

# Tijdzone instellen
ENV TZ=Europe/Amsterdam

# Systeem updates
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends wget gnupg

# Pip upgrade
RUN pip install --no-cache-dir --upgrade pip

# Python pakketten installeren
RUN pip install packaging requests python-dotenv playwright

# Playwright browser en systeemafhankelijkheden
RUN python -m playwright install chromium
RUN python -m playwright install-deps chromium

# Schoonmaak actie om image iets kleiner te houden
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Werkmap instellen
WORKDIR /app
