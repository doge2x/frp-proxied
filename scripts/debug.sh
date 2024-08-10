#!/usr/bin/env bash

find . \( -name '*.json' -o -name '*.toml' \) -exec \
	sed -i \
	-e 's/"level": "info"/"level": "debug"/' \
	-e 's/log.level = "info"/log.level = "debug"/' \
	{} \;
