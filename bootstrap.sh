#!/bin/sh

set -eu

git submodule init || true
git submodule update --recursive
./0dotlink
