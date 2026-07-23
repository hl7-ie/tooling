# Developer Guide

This page provides step-by-step instructions for building, validating, and publishing HL7 Ireland FHIR Implementation Guides using this tooling repository.

## Prerequisites

| Tool | Minimum version | Install |
|------|----------------|---------|
| Java (JDK) | 17+ | [adoptium.net](https://adoptium.net/) |
| Node.js | 18+ | [nodejs.org](https://nodejs.org/) |
| npm | 9+ | bundled with Node.js |
| Ruby + Jekyll | 4.x | `gem install jekyll bundler` |
| Git | 2.x | [git-scm.com](https://git-scm.com/) |

## Installation

```bash
# Clone the tooling repository
git clone https://github.com/hl7-ie/tooling.git
cd tooling

# Install Node.js dependencies (includes SUSHI)
npm install
```

## Building the IG

### 1. Compile FSH sources

```bash
npx sushi .
```

SUSHI reads `sushi-config.yaml` and compiles all `.fsh` files under `input/fsh/` into FHIR JSON resources in `fsh-generated/`.

### 2. Download / update IG Publisher

```bash
bash _updatePublisher.sh
```

This downloads the latest `publisher.jar` from the HL7 GitHub releases.

### 3. Run IG Publisher

```bash
bash _genonce.sh
```

Output is written to `output/`. Open `output/index.html` in a browser to review the IG locally.

## Validating Resources

### Validate all example resources

```bash
bash scripts/validate-all.sh
```

### Validate a single resource

```bash
java -jar publisher.jar -validate input/resources/examples/Patient-ie-example.json \
  -version 4.0.1 \
  -ig hl7-ie.tooling#current
```

### Using the FHIR Validator CLI directly

```bash
# Download validator_cli.jar
curl -L -o validator_cli.jar \
  https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar

# Validate
java -jar validator_cli.jar \
  input/resources/examples/Patient-ie-example.json \
  -version 4.0.1 \
  -ig hl7.fhir.r4.core#4.0.1
```

## Scaffolding a New HL7-IE IG

Use the scaffold script to create a new IG repository skeleton:

```bash
bash scripts/scaffold-ig.sh my-new-ig "My New IG Title"
```

This creates a directory `my-new-ig/` with the standard HL7-IE IG structure.

## Updating IG Publisher

```bash
bash _updatePublisher.sh
```

## Publishing

The IG is automatically published to GitHub Pages via the CI/CD pipeline on every push to `main`. See the [CI/CD Guide](ci-cd.html) for details.

## Troubleshooting

### `publisher.jar` not found

Run `bash _updatePublisher.sh` to download it.

### SUSHI compilation errors

Check that your `.fsh` files are valid FSH syntax. Run `npx sushi .` and review error messages.

### Java version errors

Ensure Java 17+ is installed: `java -version`.

### Out of memory during publisher run

Increase the Java heap size:

```bash
java -Xmx4g -jar publisher.jar -ig ig.ini
```
