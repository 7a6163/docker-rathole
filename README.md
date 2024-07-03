# Rathole Docker Images

This repository contains the Docker setup for building and deploying Rathole, a lightweight and high-performance reverse proxy. The Docker images are built using multi-stage builds to ensure minimal image size and efficiency.

## Overview

The Docker setup uses a multi-stage build process:
1. **Builder Stage**: Downloads and unzips the precompiled binary for the specified platform.
2. **Final Image Stage**: Copies the binary from the builder stage and sets up the runtime environment.

Supported platforms:
- `amd64`
- `arm64`

## Usage

### Pulling Images

You can pull the pre-built Docker images from GitHub Container Registry and Docker Hub.

#### GitHub Container Registry

```bash
docker pull ghcr.io/7a6163/rathole:latest
```

#### Docker Hub

```bash
docker pull 7a6163/rathole:latest
```

### Running the Container

```bash
docker run -it --rm -v "path/to/config.toml:/app/config.toml" 7a6163/rathole --server /app/config.toml
```
