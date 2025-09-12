FROM python:3.12-slim

# Optional: install git if you need it at runtime
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# Install Python deps
RUN pip install --no-cache-dir pyyaml

# App files
WORKDIR /app
COPY feed.py /usr/local/bin/feed
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make scripts executable
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/feed

# Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
