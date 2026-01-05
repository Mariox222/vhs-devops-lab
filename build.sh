#!/bin/bash

if [ -f "nexus-3.37.3-02-unix.tar.gz" ]; then
    echo "nexus-3.37.3-02-unix.tar.gz exists"
else
    wget https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz
fi



# Check if Podman is installed
if ! command -v podman &> /dev/null; then
    echo "Podman is not installed. Please install Podman and try again."
    exit 1
fi

podman build --network=host -t doscker.io/nexus-server:nexus -f Dockerfile .

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Nexus server Podman image successfully built as 'nexus-server:nexus'."
else
    echo "Error: Failed to build the Nexus server Podman image."
fi

#rm nexus-3.37.3-02-unix.tar.gz