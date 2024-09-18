#!/bin/bash

OLLAMA_VERSION=$(cat VERSION)

podman push quay.io/kaliprasannabasu/ollama:latest
podman push quay.io/kaliprasannabasu/ollama:${OLLAMA_VERSION}
