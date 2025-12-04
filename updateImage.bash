#!/bin/bash

# Variables
IMAGE_NAME="ghcr.io/luc14n/tower-defence-game"
IMAGE_TAG="${1:-main}" # Use the first argument as the tag, default to 'main'
CONTAINER_NAME="tower-defence-container"
PORT_MAPPING="8000:8000" # Adjust if necessary

# Check if the container is running
if docker ps -q -f name="$CONTAINER_NAME" > /dev/null; then
  echo "Stopping the running container: $CONTAINER_NAME..."
  docker stop "$CONTAINER_NAME"
fi

# Check if the container exists
if docker ps -aq -f name="$CONTAINER_NAME" > /dev/null; then
  echo "Removing the existing container: $CONTAINER_NAME..."
  docker rm "$CONTAINER_NAME"
fi

# Pull the Docker image
echo "Pulling the Docker image: $IMAGE_NAME:$IMAGE_TAG..."
if ! docker pull "$IMAGE_NAME:$IMAGE_TAG"; then
  echo "Error: Failed to pull the Docker image."
  exit 1
fi

# Run the Docker container
echo "Running the Docker container..."
if ! docker run -d --name "$CONTAINER_NAME" -p $PORT_MAPPING "$IMAGE_NAME:$IMAGE_TAG"; then
  echo "Error: Failed to run the Docker container."
  exit 1
fi

echo "Container is running. Access it at http://localhost:${PORT_MAPPING%%:*}"