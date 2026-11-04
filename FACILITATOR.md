# Facilitator guide

## Before the session
- Participants need: GitHub account, Python ≥ 3.10, git. Docker is optional.
- **Dry-run** the whole thing in a fresh fork. Free GitHub accounts get 2,000 Actions minutes/month on private repos; public forks are free.
- Remind attendees: *forks start with Actions disabled*. Enable it in the Actions tab.
- Forks of public repos: `GITHUB_TOKEN` can push to GHCR in the participant's own fork; packages are private by default.
- Environment protection rules (Ex. 5) require a public repo or a paid plan. In a public fork on a free plan this works.

## Timing tips
| Block | Risk | Mitigation |
|-------|------|-----------|
| Setup | Python/venv issues | Pair people up; use GitHub Codespaces as a fallback (`Code → Codespaces`) |
| Ex. 1 | YAML indentation errors | Show how to read the Actions error annotation |
| Ex. 3 | Slowest to finish | Part A + B are the core; C/D can be demoed live |
| Ex. 4 | Docker builds take 1-2 min | Start the build, discuss the questions while it runs |
| Ex. 5 | Missing environment setup | Do Part A together on a projector |

## Teaching notes
- **Always break something live.** The red-then-green cycle builds trust in CI.
- Ex. 3 sabotage table: the three cases show unit tests catching a code bug (#1), a too-weak gate missing a real regression (#2), and the gate catching what tests can't (#3). Case #2 sets up the discussion on regression gates and bonus #3. Numbers are deterministic (seed 42) but re-verify after changing any model code.
- Ask participants about their *own* pipelines at each discussion prompt. Tie examples to their stack (Airflow, dbt, Databricks, SageMaker…). The concepts transfer directly.
- Fast finishers → `docs/bonus.md`.

## Intentional design choices
- Synthetic data, so nothing to download and everything is deterministic.
- Model is trained at Docker build time to keep the demo self-contained; Ex. 4 discussion covers why a model registry is better in production.
- The starter workflow is intentionally trivial, so learners write the real one themselves.

## Possible extensions (half-day / full-day)
- Add MLflow/DVC, deploy to a real target (Cloud Run, Azure Container Apps, Fly.io), add monitoring/drift detection, compare with GitLab CI.
