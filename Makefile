.PHONY: shell up down logs local-venv check-host run test notebook

RUN_ENTRYPOINT := src/entrypoint.py
TEST_ENTRYPOINT := tests/test_entrypoint.py
NOTEBOOK_ENTRYPOINT := notebooks/entrypoint.ipynb

shell:
	bash scripts/run_container.sh

up:
	@if [ ! -f .env ]; then \
		cp .env.template .env; \
	fi
	docker compose up -d lab

down:
	docker compose down

logs:
	docker compose logs -f lab

local-venv:
	bash scripts/setup_local_venv.sh

check-host:
	bash scripts/check_host.sh

run:
	bash scripts/run_container.sh python $(RUN_ENTRYPOINT)

test:
	bash scripts/run_container.sh pytest -q $(TEST_ENTRYPOINT)

notebook:
	bash scripts/run_container.sh jupyter nbconvert --to notebook --execute --inplace $(NOTEBOOK_ENTRYPOINT)
