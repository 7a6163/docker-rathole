FROM alpine AS builder
RUN apk add --no-cache wget unzip && \
    wget https://github.com/rapiz1/rathole/releases/download/v0.4.7/rathole-aarch64-unknown-linux-musl.zip && \
    unzip rathole-aarch64-unknown-linux-musl.zip

FROM alpine
WORKDIR /app
COPY --from=builder /rathole /usr/bin/rathole
ENTRYPOINT ["/usr/bin/rathole"]
