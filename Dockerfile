FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Ensure executable permission
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set as entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
