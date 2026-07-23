# CI / CD Pipeline

HL7 Ireland uses GitHub Actions to automate IG builds and deployments.

## Workflows

### `ig-publisher.yml` – Build & Deploy

Triggered on:
- Push to `main`
- Pull requests targeting `main`
- Manual workflow dispatch

**Steps:**

1. **Checkout** – fetches the repository at the target commit.
2. **Set up Java 17** – uses `actions/setup-java` with the Temurin distribution.
3. **Set up Node.js 20** – installs Node.js and caches npm packages.
4. **Install SUSHI** – runs `npm ci` to install `fsh-sushi` from `package.json`.
5. **Compile FSH** – runs `npx sushi .` to generate FHIR JSON from FSH sources.
6. **Download IG Publisher** – runs `_updatePublisher.sh`.
7. **Run IG Publisher** – runs `_genonce.sh -ig ig.ini`.
8. **Upload artifact** – stores `output/` as a GitHub Actions artifact (7 days).
9. **Deploy to GitHub Pages** *(main branch only)* – deploys `output/` to the `gh-pages` branch.

### `validate.yml` – Validate on PR

Triggered on pull requests that change files under `input/resources/` or `input/fsh/`.

**Steps:**

1. Checkout repository.
2. Set up Java 17.
3. Download IG Publisher.
4. Run `scripts/validate-all.sh`.

## GitHub Pages Setup

To enable GitHub Pages for your fork or new repository:

1. Go to **Settings → Pages**.
2. Set **Source** to `GitHub Actions`.
3. Push to `main` to trigger the first deployment.

The published IG will be available at: `https://<github-org>.github.io/<repo>/`

## Secrets & Permissions

The `ig-publisher.yml` workflow requires the following permissions:

```yaml
permissions:
  contents: write
  pages: write
  id-token: write
```

No additional secrets are required for public repositories.

## Reusing Workflows in Other HL7-IE Repositories

Other HL7-IE IG repositories can reference the workflow templates from this tooling repository:

```yaml
# In another repo's .github/workflows/ig-publisher.yml
jobs:
  build:
    uses: hl7-ie/tooling/.github/workflows/ig-publisher.yml@main
```

## Branch Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production; triggers Pages deployment |
| `develop` | Integration branch; triggers build only |
| `feature/*` | Feature branches; no deployment |

## Notifications

Build status badges can be added to your `README.md`:

```markdown
[![IG Publisher](https://github.com/hl7-ie/tooling/actions/workflows/ig-publisher.yml/badge.svg)](https://github.com/hl7-ie/tooling/actions/workflows/ig-publisher.yml)
```
