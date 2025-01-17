#!/bin/bash

# Check if at least one argument was passed
if [ "$#" -eq 0 ]; then
  echo "Error: Specify at least one profile."
  exit 1
fi

# Loop through each argument (profile) and run the docker compose down -v command for each profile
for profile in "$@"; do
  echo "Running: docker compose --profile $profile down -v"
  docker compose --profile "$profile" down -v
done