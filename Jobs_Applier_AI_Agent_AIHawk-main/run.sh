#!/bin/bash
# Run AIHawk Jobs Applier via Docker
set -e

echo "=== AIHawk Jobs Applier AI Agent ==="
echo ""

# Build the Docker image if not already built
if ! docker image inspect jobs-applier-aihawk &>/dev/null; then
    echo "[1/2] Building Docker image (first time only, takes a few minutes)..."
    docker-compose build
else
    echo "[1/2] Docker image already built."
fi

echo "[2/2] Starting the application..."
echo ""
docker-compose run --rm jobs-applier
