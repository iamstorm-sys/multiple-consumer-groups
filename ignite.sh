#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <number_of_instances> <group_id_prefix>"
  exit 1
fi

num_instances="$1"
group_id_prefix="$2"

for ((i = 1; i <= num_instances; i++)); do
  group_id="${group_id_prefix}-${i}"
  gnome-terminal -- bash -c "node index.js $group_id > output.log 2>&1" &
  sleep 1
done

echo "$num_instances instances started."
