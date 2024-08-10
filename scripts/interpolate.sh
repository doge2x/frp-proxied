#!/usr/bin/env bash

set -euo pipefail

passgen() {
	openssl rand -base64 24 | cut -c-24 | tr '/' '_'
}

SERVER_ADDR="${SERVER_ADDR:-127.0.0.1}"
SERVER_PORT="${SERVER_PORT:-12345}"
PROXY_UUID="${PROXY_UUID:-$(uuidgen)}"
FRP_SECRET="${FRP_SECRET:-$(passgen 16)}"
FRP_TOKEN="${FRP_TOKEN:-$(passgen 16)}"
find . \( -name '*.json' -o -name '*.toml' -o -name '*.yaml' \) -exec \
	sed -i \
	-e "s/{{SERVER_ADDR}}/$SERVER_ADDR/" \
	-e "s/12345/$SERVER_PORT/" \
	-e "s/{{PROXY_UUID}}/$PROXY_UUID/" \
	-e "s/{{FRP_SECRET}}/$FRP_SECRET/" \
	-e "s/{{FRP_TOKEN}}/$FRP_TOKEN/" \
	{} \;
