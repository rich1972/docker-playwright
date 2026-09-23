FROM python:3.14-slim
ENV TZ=Europe/Amsterdam \
    PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends xvfb xauth && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir packaging requests python-dotenv playwright==1.63.0 schedule pyyaml

RUN python -m playwright install-deps chromium && \
    python -m playwright install chromium && \
    chmod -R a+rX /ms-playwright && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENTRYPOINT ["xvfb-run", "--server-args=-screen 0 1280x1200x24"]
