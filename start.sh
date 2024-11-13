#!/bin/bash

# Check if at least one argument was passed
if [ "$#" -eq 0 ]; then
  echo "Error: Specify at least one profile."
  exit 1
fi

# Loop through each argument (profile) and run the corresponding docker compose command
for profile in "$@"; do
  if [ "$profile" == "kong" ]; then
    echo "Running: KONG_DATABASE=postgres docker compose --profile $profile up -d"
    KONG_DATABASE=postgres docker compose --profile "$profile" up -d
  else
    echo "Running: docker compose --profile $profile up -d"
    docker compose --profile "$profile" up -d
  fi
done
