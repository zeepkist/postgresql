FROM postgres:18

# Install aws-cli, wal2json, HypoPG, and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        awscli \
        postgresql-18-wal2json \
        postgresql-18-hypopg \
    && rm -rf /var/lib/apt/lists/*
