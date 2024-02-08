#!/usr/bin/env bash

set -eou pipefail

rm .git/hooks/* || true
sg release -i npm
