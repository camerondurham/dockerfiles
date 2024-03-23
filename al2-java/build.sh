#!/bin/bash


# Check if docker is available
if command -v docker >/dev/null 2>&1; then
    # Build the Docker image with the provided JDK_VERSION argument or default to 21.0.2.14.1
    docker build --build-arg JDK_VERSION=${1:-21.0.2.14.1} -t al2java .
elif command -v finch >/dev/null 2>&1; then
    # Use the finch command to build the image if docker is not available
    finch build --build-arg JDK_VERSION=${1:-21.0.2.14.1} -t al2java .
else
    echo "Error: Neither docker nor finch command is available."
    exit 1
fi
