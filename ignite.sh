#!/bin/bash

# Check if an argument is provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <number_of_instances> <group_id_prefix>"
  exit 1
fi

# Get the number of instances and group ID prefix from the command-line arguments
num_instances="$1"
group_id_prefix="$2"

# Loop to start the instances in different terminals
for ((i = 1; i <= num_instances; i++)); do
  group_id="${group_id_prefix}-${i}"
  gnome-terminal -- bash -c "node index.js $group_id > output.log 2>&1" &  # Pass group ID as an argument to your JavaScript file
  sleep 1  # Adjust as needed to ensure the terminals are not launched too quickly
done

echo "$num_instances instances started."
