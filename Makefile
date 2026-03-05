.PHONY: shell up down logs local-venv check-host

shell:
	bash scripts/run_container.sh

up:
	@if [ ! -f .env ]; then cp .env.example .env; fi
	docker compose up -d lab

down:
	docker compose down

logs:
	docker compose logs -f lab

local-venv:
	bash scripts/setup_local_venv.sh

check-host:
	bash scripts/check_host.sh
