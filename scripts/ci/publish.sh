#!/usr/bin/env bash

version="$1"

set -eou pipefail

echo "🚀 Publishing version ${version}"

yq eval ".version = \"${version}\"" ./chart/Chart.yaml >"Chart.tmp"
mv "Chart.tmp" ./chart/Chart.yaml

echo "📝 Generating Documentation"
helm-docs
echo "✅ Documentation Generated"
