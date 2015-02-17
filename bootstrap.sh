#!/bin/sh

set -eu

git submodule init || true
## NOTE: `--depth` requires git >= 1.8.4
git submodule update --recursive --depth 2
./0dotlink
