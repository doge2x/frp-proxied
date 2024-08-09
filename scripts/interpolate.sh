#!/usr/bin/env bash

SERVER_ADDR="${SERVER_ADDR:-127.0.0.1}"
REMOTE_UUID="${REMOTE_UUID:-$(uuidgen)}"
CLIENT_UUID="${CLIENT_UUID:-$(uuidgen)}"
find . \( -name '*.json' -o -name '*.toml' \) -exec \
	sed -i \
	-e "s/{{SERVER_ADDR}}/$SERVER_ADDR/" \
	-e "s/{{REMOTE_UUID}}/$REMOTE_UUID/" \
	-e "s/{{CLIENT_UUID}}/$CLIENT_UUID/" \
	{} \;
