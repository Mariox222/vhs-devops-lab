#!/bin/bash

# Check if Podman is installed
if ! command -v podman &> /dev/null; then
    echo "Podman is not installed. Please install Podman and try again."
    exit 1
fi

# check if nexus server image exists
if podman image exists localhost/nexus-server:nexus; then
    echo "nexus-server image does not exist, build it first"
    exit 1
fi

mkdir -p /tn_devops/nexus

podman run -d -p 18081:8081 \
    --name nexus \
    -v /tn_devops/nexus:/opt/nexus/sonatype-work \
    localhost/nexus-server:nexus

# Check if the container was started successfully
if [ $? -eq 0 ]; then
    echo "Nexus server container started with the name 'nexus'."
else
    echo "Error: Failed to start the Nexus server container."
fi

# # Start container on boot
# podman generate systemd --new --name nexus > /usr/lib/systemd/system/nexus.service

# chmod 644 /usr/lib/systemd/system/nexus.service
# restorecon  /usr/lib/systemd/system/nexus.service

# systemctl daemon-reload
# systemctl start nexus.service
# systemctl enable nexus.service
# systemctl status --no-pager nexus.service
# echo "The container is set to automatically start with the operating system."