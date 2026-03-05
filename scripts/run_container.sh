#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f .env && -f .env.example ]]; then
  cp .env.example .env
  echo "[info] .env was missing, created from .env.example"
fi

export UID="$(id -u)"
export GID="$(id -g)"

docker compose up -d lab
docker compose exec lab bash
