# (Optional) If you need extra OS packages beyond the base image.
FROM racket/racket:8.12-full

# Install OS packages (examples: build tools, entr for watch tasks)
RUN apt-get update && \
    apt-get install -y --no-install-recommends git make entr curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Pre-create a non-root user (devcontainers usually handle this, included for standalone usage)
RUN useradd -ms /bin/bash dev && chown -R dev:dev /root
USER dev
WORKDIR /workspaces/app
