FROM postgres:17-alpine

RUN apk add --no-cache aws-cli

# Install dependencies for wal2json
RUN apk add --no-cache \
    build-base \
    git \
    postgresql-dev

# Clone the wal2json repository
RUN git clone https://github.com/eulerto/wal2json.git /usr/src/wal2json

# Build and install wal2json
RUN cd /usr/src/wal2json && \
    make && \
    make install

# Clean up build dependencies
RUN apk del build-base git postgresql-dev && \
    rm -rf /usr/src/wal2json
