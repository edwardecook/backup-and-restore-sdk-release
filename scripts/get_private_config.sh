#!/usr/bin/env bash

set -e
set -u

RELEASE_PATH="$(dirname "$0")/.."

lpass show private.yml --notes > "$RELEASE_PATH/config/private.yml"
