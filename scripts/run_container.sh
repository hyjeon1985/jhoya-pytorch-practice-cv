#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

cd "${REPO_ROOT}"

if [[ ! -f "${REPO_ROOT}/.env" ]]; then
  if [[ -f "${REPO_ROOT}/.env.template" ]]; then
    cp "${REPO_ROOT}/.env.template" "${REPO_ROOT}/.env"
    echo "[info] .env was missing, created from .env.template"
  else
    echo "[error] .env.template not found at ${REPO_ROOT}/.env.template" >&2
    exit 1
  fi
fi

export HOST_UID="$(id -u)"
export HOST_GID="$(id -g)"

docker compose up -d lab

if [[ $# -eq 0 ]]; then
  docker compose exec lab bash
else
  docker compose exec -T -e PYTHONPATH=/workspace/src:/workspace lab "$@"
fi
