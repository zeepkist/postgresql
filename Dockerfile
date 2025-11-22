FROM postgres:18-alpine

RUN apk add --no-cache aws-cli

# Install dependencies for wal2json
RUN apk add --no-cache build-base git postgresql-dev

# Clone wal2json
RUN git clone https://github.com/eulerto/wal2json.git /wal2json

# Build and install only the .so library
RUN cd /wal2json && \
    USE_PGXS=1 make wal2json.so && \
    USE_PGXS=1 make install

# Clean up build dependencies
RUN apk del build-base git postgresql-dev && \
    rm -rf /wal2json
