# Stage 1: Builder
FROM alpine as builder

# Set the working directory
WORKDIR /app

# Install necessary packages
RUN apk add --no-cache unzip wget

# Define build arguments
ARG FILENAME
ARG VERSION

# Download and unzip the precompiled binary
RUN echo "Downloading from https://github.com/rapiz1/rathole/releases/download/v${VERSION}/rathole-${FILENAME}.zip" && \
    wget https://github.com/rapiz1/rathole/releases/download/v${VERSION}/rathole-${FILENAME}.zip && \
    unzip rathole-${FILENAME}.zip

# Stage 2: Final Image
FROM alpine

# Set the working directory
WORKDIR /app

# Install necessary packages
RUN apk add --no-cache tini

# Copy the precompiled binary from the builder stage
COPY --from=builder /app/rathole /usr/bin/rathole

# Set the entrypoint
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/bin/rathole"]
