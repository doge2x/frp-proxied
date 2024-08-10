#!/usr/bin/env bash

SERVER_ADDR="${SERVER_ADDR:-127.0.0.1}"
PROXY_UUID="${PROXY_UUID:-$(uuidgen)}"
find . \( -name '*.json' -o -name '*.toml' \) -exec \
	sed -i \
	-e "s/{{SERVER_ADDR}}/$SERVER_ADDR/" \
	-e "s/{{PROXY_UUID}}/$PROXY_UUID/" \
	{} \;
