#!/bin/bash

# Simple script to clone all GitHub repos for a user
# Usage: ./cloneallrepos.sh <username> [page]

USER="${USER:-$1}"
PAGE="${PAGE:-${2:-1}}"

# Check arguments
if [ -z "$USER" ]; then
    echo "Usage: $0 <username> [page]"
    echo "Example: $0 px3l"
    exit 1
fi

echo "Cloning all repos for user: $USER"
echo "Page: $PAGE"

# Get repo URLs and clone them
curl -s "https://api.github.com/users/$USER/repos?page=$PAGE&per_page=100" | \
grep '"clone_url"' | \
cut -d '"' -f 4 | \
while read url; do
    echo "Cloning: $url"
    git clone "$url"
done

echo "Done!"