#!/usr/bin/env bash

SERVER_ADDR="${SERVER_ADDR:-127.0.0.1}"
PROXY_UUID="${PROXY_UUID:-$(uuidgen)}"
FRP_SECRET="${FRP_SECRET:-$(openssl rand -base64 16)}"
find . \( -name '*.json' -o -name '*.toml' \) -exec \
	sed -i \
	-e "s/{{SERVER_ADDR}}/$SERVER_ADDR/" \
	-e "s/{{PROXY_UUID}}/$PROXY_UUID/" \
	-e "s/{{FRP_SECRET}}/$FRP_SECRET/" \
	{} \;
