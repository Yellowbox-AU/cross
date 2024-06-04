
create-manifest-aarch64:
    -podman manifest create ghcr.io/yellowbox-au/cross-rs-aarch64-unknown-linux-gnu:latest

build-aarch64: create-manifest-aarch64
    podman build docker --platform linux/amd64,linux/arm64 -f docker/Dockerfile.aarch64-unknown-linux-gnu  --manifest ghcr.io/yellowbox-au/cross-rs-aarch64-unknown-linux-gnu:latest
  
push-aarch64: build-aarch64
    podman manifest push ghcr.io/yellowbox-au/cross-rs-aarch64-unknown-linux-gnu:latest

create-manifest-x86_64:
    -podman manifest create ghcr.io/yellowbox-au/cross-rs-x86_64-unknown-linux-gnu:latest

build-x86_64: create-manifest-x86_64
    podman build docker --platform linux/amd64,linux/arm64 -f docker/Dockerfile.x86_64-unknown-linux-gnu --manifest ghcr.io/yellowbox-au/cross-rs-x86_64-unknown-linux-gnu:latest

push-x86_64: build-x86_64
    podman manifest push ghcr.io/yellowbox-au/cross-rs-x86_64-unknown-linux-gnu:latest

build: build-aarch64 build-x86_64

push: build push-aarch64 push-x86_64