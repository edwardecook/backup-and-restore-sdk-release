#!/usr/bin/env bash

set -e
set -u

RELEASE_PATH="$(dirname "$0")/.."

cd "$RELEASE_PATH"
./scripts/get_private_config.sh

if [[ ! -d "$GOLANG_RELEASE_PATH" ]]; then
  >&2 echo 'Please export $GOLANG_RELEASE_PATH'
  # git clone https://github.com/bosh-packages/golang-release "$GOLANG_RELEASE_PATH"
fi
(
  cd "$GOLANG_RELEASE_PATH"
  git checkout master
  git pull
)

bosh vendor-package golang-1.8-linux "$HOME/workspace/golang-release"
