#!/usr/bin/env bash
set -euo pipefail

echo "[host] docker version"
docker --version

echo "[host] nvidia-smi"
if nvidia-smi >/dev/null 2>&1; then
  nvidia-smi --query-gpu=name,driver_version,cuda_version --format=csv
else
  echo "nvidia-smi is not available from this shell. On DGX Spark, run this script on the host node."
fi
