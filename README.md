# CI/CD for Data & AI Engineers: Hands-on Workshop

A ~3-hour workshop for people who already write Python (data engineers, data scientists, AI/ML engineers)
and want to stop shipping notebooks and scripts by hand.

You will **fork this repo** and build a real CI/CD pipeline around a small churn-prediction project
(data validation → training → quality gate → Docker image → gated deployment).
No cloud account needed, only a free GitHub account.

## What you'll learn

- Why CI/CD matters, and what is *different* for data/ML projects
- Writing GitHub Actions workflows (triggers, jobs, matrix, caching, artifacts, secrets, environments)
- Automating tests, linting, **data validation** and **model quality gates**
- Packaging a model service in Docker and publishing it to a registry
- Safe deployments with approvals, tags and releases
- Shift-left tooling: pre-commit, Dependabot, dependency audits

## Agenda (≈ 3h)

| Time | Block | Material |
|------|-------|----------|
| 0:00 | Setup & fork | below |
| 0:10 | **Theory**: CI/CD concepts & what's special about data/ML | [docs/theory.md](docs/theory.md) |
| 0:40 | **Ex. 1**: Your first pipeline (lint + test) | [docs/exercise-1-first-pipeline.md](docs/exercise-1-first-pipeline.md) |
| 1:05 | **Ex. 2**: Faster & more reliable (matrix, cache, artifacts) | [docs/exercise-2-matrix-cache.md](docs/exercise-2-matrix-cache.md) |
| 1:25 | Break | |
| 1:35 | **Ex. 3**: Data & model quality gates | [docs/exercise-3-model-gate.md](docs/exercise-3-model-gate.md) |
| 2:05 | **Ex. 4**: Containers & continuous delivery | [docs/exercise-4-docker-cd.md](docs/exercise-4-docker-cd.md) |
| 2:35 | **Ex. 5**: Releases with approval gates | [docs/exercise-5-release.md](docs/exercise-5-release.md) |
| 2:55 | Wrap-up, bonus challenges | [docs/bonus.md](docs/bonus.md) |

Facilitators: see [FACILITATOR.md](FACILITATOR.md). Stuck? Reference workflows are in [`solutions/`](solutions/).
Cheat sheet: [docs/cheatsheet.md](docs/cheatsheet.md).

## Setup (10 min)

1. **Fork** this repository (button top-right), then clone *your fork*:
   ```bash
   git clone https://github.com/<your-user>/<repo>.git && cd <repo>
   ```
2. In your fork: **Actions tab → "I understand my workflows, go ahead and enable them"**.
3. Local environment (Python ≥ 3.10):
   ```bash
   python -m venv .venv && source .venv/bin/activate   # Windows: .venv\Scripts\activate
   make install          # or: pip install -e ".[serve,dev]" && pre-commit install
   make all              # lint + tests + model gate. All should pass locally
   ```
4. Docker is optional locally (CI builds the images for you).

## The project

```
src/churn_workshop/
  data.py        synthetic data generator + data validation (the "data contract")
  features.py    feature engineering + preprocessing
  train.py       trains a model, writes model.joblib + metrics.json
  api.py         FastAPI service: /health and /predict
scripts/check_metrics.py   quality gate: exits 1 if AUC < threshold
tests/                     unit tests for data, features, training, API
Dockerfile                 builds a self-contained serving image
.github/workflows/ci.yml   STARTER workflow: you will build this up
solutions/                 reference workflows for each exercise
```

Useful commands: `make lint`, `make test`, `make gate`, `make docker-build`.

## Ground rules

- Work on **branches and pull requests** in your fork, not directly on `main`, once Exercise 1 is done.
- Make CI **red on purpose** at least once. Seeing failures is how you learn to trust the pipeline.
- Peek at `solutions/` only after trying for a while.
