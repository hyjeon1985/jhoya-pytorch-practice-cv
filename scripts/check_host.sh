#!/usr/bin/env bash
set -euo pipefail

echo "[host] docker version"
docker --version

echo "[host] nvidia-smi"
if nvidia-smi >/dev/null 2>&1; then
  nvidia-smi --query-gpu=name,driver_version --format=csv
  cuda_version="$(nvidia-smi | sed -n 's/.*CUDA Version: \([0-9.]\+\).*/\1/p' | head -n1)"
  if [[ -n "${cuda_version}" ]]; then
    echo "CUDA Version: ${cuda_version}"
  fi
else
  echo "nvidia-smi is not available from this shell. On DGX Spark, run this script on the host node."
fi
