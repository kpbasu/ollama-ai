#!/bin/bash

OLLAMA_VERSION=$(curl -s "https://api.github.com/repos/ollama/ollama/releases/latest" | jq -r .name)

echo ${OLLAMA_VERSION} > VERSION
echo "VERSION=${OLLAMA_VERSION}" > OLLAMA_VERSION

podman build --no-cache --build-arg OLLAMA_VERSION=${OLLAMA_VERSION} -t quay.io/kaliprasannabasu/ollama:latest -f Containerfile.build
podman tag quay.io/kaliprasannabasu/ollama:latest quay.io/kaliprasannabasu/ollama:${OLLAMA_VERSION}

# Moved to upload.sh
#podman push quay.io/kaliprasannabasu/ollama:latest
#podman push quay.io/kaliprasannabasu/ollama:${OLLAMA_VERSION}
