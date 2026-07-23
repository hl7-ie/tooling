# HL7 Ireland – Tooling Implementation Guide

Welcome to the **HL7 Ireland Tooling** Implementation Guide.

This IG provides the shared developer tooling, CI/CD pipeline templates, FHIR IG Publisher configurations, validator bundles, and utility artifacts for the HL7 Ireland (HL7-IE) FHIR ecosystem.

## Background

HL7 Ireland is the Irish affiliate of HL7 International. This tooling repository underpins all HL7-IE Implementation Guides, providing a consistent, repeatable foundation for:

- Building FHIR IGs using the HL7 IG Publisher
- Compiling FSH (FHIR Shorthand) sources with SUSHI
- Validating resource conformance against HL7-IE profiles
- Publishing IGs to GitHub Pages

## Alignment with Other HL7 Affiliates

This repository is modelled after patterns from:

| Affiliate | Tooling Approach |
|-----------|-----------------|
| HL7 US Core | SUSHI + IG Publisher + GitHub Actions |
| CA Core+ | Shared CI templates, pinned publisher versions |
| UK Core | Central tooling repo with reusable workflows |
| AU Base | `_genonce.sh` / `_updatePublisher.sh` conventions |

## Artifacts

Browse the artifacts included in this IG:

- [CapabilityStatement: IE Tooling Server](CapabilityStatement-ie-tooling-server.html)
- [Profile: IE Patient](StructureDefinition-ie-patient.html)
- [Extension: IE PPSN Identifier](StructureDefinition-ie-ppsn-extension.html)
- [CodeSystem: IE Identifier Type](CodeSystem-ie-identifier-type.html)
- [ValueSet: IE Identifier Type](ValueSet-ie-identifier-type.html)

## Getting Started

See the [Developer Guide](developer-guide.html) for build and validation instructions.

See the [CI/CD Guide](ci-cd.html) for GitHub Actions pipeline documentation.
