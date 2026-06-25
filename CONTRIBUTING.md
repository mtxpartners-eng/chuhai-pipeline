# Contributing to chuhai-pipeline

Thanks for helping maintain Chuhai Pipeline. This repository contains the outbound
buyer-acquisition pipeline, the sales feedback WebUI, the Redvia product site, and the
Cloudflare tracking layer.

## Before You Start

1. Read [`README.md`](README.md) and [`ARCHITECTURE.md`](ARCHITECTURE.md) to understand
   the project scope and data flow.
2. Create a Python 3.11 virtual environment and install the root requirements:

   ```bash
   python -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```

3. Install the Worker dependencies when changing `cloudflare/`:

   ```bash
   cd cloudflare
   npm install
   ```

4. Request production credentials from a maintainer through the approved private
   channel. Never place secrets in issues, pull requests, commits, or chat transcripts.

## Pull Request Flow

1. Branch from `main` using a short name such as `feat/<topic>` or `fix/<topic>`.
2. Keep commits focused and reviewable.
3. Run the relevant checks before opening a pull request.
4. Open the pull request with a summary of the change, screenshots for UI updates, and
   the commands you ran.
5. Wait for review from the appropriate owner before merging protected paths.

## Review Ownership

Most documentation, WebUI, and product-site changes can be reviewed by any collaborator
with write access. Changes to the following areas require maintainer review:

- `pipeline.py`
- `xiaoman_playwright.py`
- `llm_judge.py`
- `send_outreach.py`
- `cloudflare/`
- `.env.example`
- `.github/workflows/`
- `.github/CODEOWNERS`

See [`.github/CODEOWNERS`](.github/CODEOWNERS) for the enforced ownership rules.

## Local Checks

```bash
ruff check .
pytest webui/
cd cloudflare && npx wrangler deploy --dry-run --outdir=/tmp/worker-bundle
```

Step 3 of the pipeline (`xiaoman_playwright.py`) requires an authenticated Chromium
profile and is not expected to run in CI. Use `--skip-step3` when testing the rest of
the pipeline locally.

## Repository Hygiene

- Keep local datasets, exports, credentials, and operating notes out of the repository.
- Commit only scrubbed sample data and documentation intended for collaborators.
- Keep architecture decisions and long-term design rationale in versioned docs rather
  than in ad hoc notes.
