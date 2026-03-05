#!/usr/bin/env bash
set -euo pipefail

python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip

# DGX Spark local fallback uses Jetson AI Lab index on ARM64.
if [[ "$(uname -m)" == "aarch64" ]]; then
  pip install numpy==1.26.1
  pip install torch==2.6.0 torchvision==0.21.0 torchaudio==2.6.0 \
    --extra-index-url https://pypi.jetson-ai-lab.io/jp6/cu126
else
  # x86 fallback
  pip install torch torchvision torchaudio \
    --index-url https://download.pytorch.org/whl/cu126
fi

pip install pytest

echo "[ok] Local venv is ready: source .venv/bin/activate"
