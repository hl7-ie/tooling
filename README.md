# HL7 Ireland – Tooling

**Package:** `hl7-ie.tooling`  
**Canonical base:** `https://hl7-ie.github.io/tooling/fhir`  
**FHIR version:** R4 (4.0.1)

---

## Purpose

This repository provides the shared developer tooling, CI/CD pipelines, IG Publisher configurations, validator bundles, and utility scripts for the HL7 Ireland (HL7-IE) FHIR Implementation Guide ecosystem.

It is modelled after patterns established by:

| Affiliate | Repository |
|-----------|-----------|
| HL7 US Core | <https://github.com/HL7/US-Core> |
| CA Core+ | <https://github.com/HL7-Canada/ca-core-r4> |
| UK Core | <https://github.com/NHSDigital/IOPS-FHIR-Simplifier-Backup> |
| NI Core | <https://github.com/HL7-UK/UKCore-Access> |
| AU Base | <https://github.com/hl7au/au-fhir-base> |

---

## Scope

- **IG Publisher wrapper** – pinned version, local `publisher.jar` cache, and helper `_updatePublisher.sh` / `_genonce.sh` scripts.
- **SUSHI / FSH toolchain** – `sushi-config.yaml`, FSH source structure, and Node.js toolchain setup.
- **Validator CLI bundle** – pre-configured `validator_cli.jar` invocations for profile conformance checks.
- **GitHub Actions** – reusable workflow templates for IG build, validation, and GitHub Pages deployment.
- **Terminology tooling** – scripts for syncing CodeSystems and ValueSets with the `terminology` repository.
- **Example CapabilityStatement** – baseline server capability declaration for HL7-IE compliant FHIR servers.
- **Developer utilities** – shell and Node scripts for scaffolding new IGs, running local builds, and publishing previews.

---

## Quick Start

### Prerequisites

| Tool | Minimum version |
|------|----------------|
| Java | 17+ |
| Node.js | 18+ |
| npm | 9+ |
| Ruby + Jekyll | 4.x (for local preview) |

### Install SUSHI

```bash
npm install -g fsh-sushi
```

### Run a local IG build

```bash
# Download / update the IG Publisher jar
bash _updatePublisher.sh

# Build the IG once
bash _genonce.sh
```

The output will be in `output/`. Open `output/index.html` in a browser.

### Validate a resource

```bash
java -jar validator_cli.jar \
  input/examples/Patient-ie-example.json \
  -version 4.0.1 \
  -ig hl7-ie.tooling#current
```

---

## Repository Structure

```
tooling/
├── .github/
│   └── workflows/
│       ├── ig-publisher.yml       # Build & publish IG to GitHub Pages
│       └── validate.yml           # Validate example resources on PR
├── input/
│   ├── fsh/                       # FHIR Shorthand (FSH) source files
│   │   ├── profiles/
│   │   ├── extensions/
│   │   ├── terminology/
│   │   └── examples/
│   ├── pagecontent/               # IG narrative pages (Markdown)
│   │   ├── index.md
│   │   ├── developer-guide.md
│   │   └── ci-cd.md
│   └── resources/                 # Pre-built JSON/XML FHIR resources
│       ├── capabilitystatement-ie-tooling-server.json
│       ├── structuredefinition-ie-patient.json
│       ├── structuredefinition-ie-ppsn-extension.json
│       ├── codesystem-ie-identifier-type.json
│       ├── valueset-ie-identifier-type.json
│       └── examples/
│           ├── Patient-ie-example.json
│           ├── Encounter-ie-example.json
│           ├── MedicationRequest-ie-example.json
│           └── Observation-ie-example.json
├── scripts/
│   ├── scaffold-ig.sh             # Scaffold a new HL7-IE IG repository
│   ├── sync-terminology.sh        # Pull latest terminology from terminology repo
│   └── validate-all.sh            # Validate all example resources
├── ig.ini                         # IG Publisher configuration
├── sushi-config.yaml              # SUSHI/FSH configuration
├── package.json                   # Node.js tooling dependencies
├── _genonce.sh                    # Run IG Publisher once
├── _updatePublisher.sh            # Download/update publisher.jar
└── README.md
```

---

## CI/CD

Every push to `main` triggers the **IG Publisher** GitHub Actions workflow which:

1. Checks out the repository.
2. Sets up Java 17.
3. Downloads the latest pinned IG Publisher jar.
4. Runs SUSHI to compile FSH → FHIR JSON.
5. Runs the IG Publisher.
6. Deploys `output/` to the `gh-pages` branch.

The published IG is available at: <https://hl7-ie.github.io/tooling/>

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) and follow the HL7 Ireland governance process described in the [governance](https://github.com/hl7-ie/governance) repository.

---

## License

Apache-2.0 – see [LICENSE](LICENSE).
