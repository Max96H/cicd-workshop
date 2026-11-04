.PHONY: install lint format test train gate docker-build docker-run all

install:
	pip install -e ".[serve,dev]"
	pre-commit install

lint:
	ruff check .
	ruff format --check .

format:
	ruff check --fix .
	ruff format .

test:
	pytest --cov --cov-report=term-missing

train:
	python -m churn_workshop.train --out models/model.joblib --metrics metrics.json

gate: train
	python scripts/check_metrics.py metrics.json --min-auc 0.70

docker-build:
	docker build -t churn-api:local .

docker-run:
	docker run --rm -p 8000:8000 churn-api:local

all: lint test gate
