# Use a minimal base image
FROM alpine

# Set the working directory
WORKDIR /app

# Install necessary packages
RUN apk add --no-cache tini unzip wget

# Define build arguments
ARG PLATFORM
ARG VERSION=0.5.0

# Download and unzip the precompiled binary
RUN wget https://github.com/rapiz1/rathole/releases/download/v${VERSION}/rathole-${PLATFORM}.zip && \
    unzip rathole-${PLATFORM}.zip && \
    mv rathole /usr/bin/rathole

# Set the entrypoint
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/bin/rathole"]
