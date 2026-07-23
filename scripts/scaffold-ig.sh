#!/usr/bin/env bash
# scaffold-ig.sh – Scaffold a new HL7 Ireland FHIR IG repository skeleton.
#
# Usage:
#   bash scripts/scaffold-ig.sh <repo-name> "<IG Title>"
#
# Example:
#   bash scripts/scaffold-ig.sh lab "HL7 Ireland Laboratory"
#
set -euo pipefail

ORG="hl7-ie"
REPO="${1:?Usage: $0 <repo-name> \"<IG Title>\"}"
TITLE="${2:?Usage: $0 <repo-name> \"<IG Title>\"}"
CANONICAL="https://${ORG}.github.io/${REPO}/fhir"
PACKAGE_ID="${ORG}.${REPO}"

echo "Scaffolding HL7-IE IG: ${REPO} (${TITLE})"
echo "  Canonical: ${CANONICAL}"
echo "  Package:   ${PACKAGE_ID}"
echo ""

# Create directory tree
mkdir -p "${REPO}/.github/workflows"
mkdir -p "${REPO}/input/fsh/"{profiles,extensions,terminology,examples}
mkdir -p "${REPO}/input/pagecontent"
mkdir -p "${REPO}/input/resources/examples"
mkdir -p "${REPO}/scripts"

# sushi-config.yaml
cat > "${REPO}/sushi-config.yaml" <<YAML
id: ${PACKAGE_ID}
canonical: ${CANONICAL}
name: $(echo "${TITLE}" | tr ' -' '_' | sed 's/[^a-zA-Z0-9_]//g')
title: "${TITLE} Implementation Guide"
description: "HL7 Ireland ${TITLE} FHIR R4 Implementation Guide."
status: draft
version: 0.1.0
fhirVersion: 4.0.1
copyrightYear: 2024+
releaseLabel: ci-build
license: Apache-2.0
publisher:
  name: HL7 Ireland
  url: https://hl7-ie.github.io
  email: fhir@hl7.ie
dependencies:
  hl7.fhir.r4.core: 4.0.1
  hl7.terminology.r4: 5.5.0
pages:
  index.md:
    title: Home
YAML

# ig.ini
cat > "${REPO}/ig.ini" <<INI
[IG]
ig = input/${PACKAGE_ID}.xml
template = fhir.base.template#current
usage-stats-opt-out = false
copyrightyear = 2024+
releaselabel = ci-build
path-history = ${CANONICAL}/history.html
INI

# README.md
cat > "${REPO}/README.md" <<MD
# ${TITLE}

**Package:** \`${PACKAGE_ID}\`
**Canonical:** \`${CANONICAL}\`
**FHIR version:** R4 (4.0.1)

## Purpose

TODO: Describe the purpose of this Implementation Guide.

## Building

\`\`\`bash
npm install
bash _updatePublisher.sh
bash _genonce.sh
\`\`\`
MD

# Copy common shell scripts from tooling
cp _genonce.sh "${REPO}/_genonce.sh"
cp _updatePublisher.sh "${REPO}/_updatePublisher.sh"

# index.md
cat > "${REPO}/input/pagecontent/index.md" <<MD
# ${TITLE}

Welcome to the **${TITLE}** Implementation Guide.

TODO: Add narrative content.
MD

# GitHub Actions workflow
cp .github/workflows/ig-publisher.yml "${REPO}/.github/workflows/ig-publisher.yml"

echo ""
echo "Scaffold complete. Directory: ${REPO}/"
echo "Next steps:"
echo "  1. cd ${REPO}"
echo "  2. git init && git add . && git commit -m 'Initial scaffold'"
echo "  3. bash _updatePublisher.sh"
echo "  4. bash _genonce.sh"
