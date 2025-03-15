FROM postgres:17-alpine

# Install AWS CLI
RUN apk add --no-cache python3 py3-pip && \
	pip3 install awscli && \
	apk del python3 py3-pip
