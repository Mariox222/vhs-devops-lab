#!/bin/bash

# Check if Podman is installed
if ! command -v podman &> /dev/null; then
    echo "Podman is not installed. Please install Podman and try again."
    exit 1
fi

mkdir -p /tn_devops/nexus

podman run -d -p 18081:8081 \
    --name nexus \
    --restart=always \
    -v /tn_devops/nexus:/opt/nexus/sonatype-work \
    nexus-server:nexus

# Check if the container was started successfully
if [ $? -eq 0 ]; then
    echo "Nexus server container started with the name 'nexus'."
else
    echo "Error: Failed to start the Nexus server container."
fi
