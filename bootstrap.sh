#!/bin/sh

set -eu

git submodule init || true
## NOTE: `--depth` requires git >= 1.8.4; and, unfortunately, doesn't quite
## work (as the required commits are usually not within that depth)
git submodule update --recursive
./0dotlink
