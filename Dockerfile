FROM postgres:17-alpine

RUN apk add --no-cache aws-cli

# Install dependencies for wal2json
RUN apk add --no-cache \
    build-base \
    git \
    postgresql-dev \
	clang \
	llvm

# Clone the wal2json repository
RUN git clone https://github.com/eulerto/wal2json.git ./wal2json

# Build and install wal2json
RUN cd /wal2json && \
    USE_PGXS=1 make && \
    USE_PGXS=1 make install

# Clean up build dependencies
RUN apk del build-base git postgresql-dev clang llvm && \
    rm -rf ./wal2json
