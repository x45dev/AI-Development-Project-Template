#!/bin/bash

set -e

echo "Running DevContainer setup script..."

# --- 1. Trust Mise ---
echo "Trusting Mise..."
mise trust -y

# --- 2. Gemini CLI Authentication Persistence (OAuth2) ---
# The Gemini CLI uses OAuth2 for authentication. This typically requires a browser-based flow.
# You will need to manually authenticate the first time the container is created or if your credentials expire.
# Run the following command in the DevContainer terminal:
# gcloud auth application-default login

# Check if gcloud is already authenticated
if gcloud auth application-default print-access-token &> /dev/null; then
    echo "gcloud is already authenticated."
else
    echo "gcloud is NOT authenticated. Please run 'gcloud auth application-default login' in the terminal."
fi

# --- 3. Start Docker Compose Services ---
echo "Starting Docker Compose services..."
docker compose up -d

echo "DevContainer setup complete."