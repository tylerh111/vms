#!/usr/bin/env bash
set -eoux pipefail

# set editor environment variable
EDITOR="${EDITOR:-/usr/bin/vim}"
grep -q "export EDITOR=" ~/.profile || echo "export EDITOR='$EDITOR'" >> ~/.profile
