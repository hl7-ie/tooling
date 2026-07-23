# Contributing to HL7 Ireland Tooling

Thank you for contributing to the HL7 Ireland FHIR Tooling repository.

## Governance

All contributions are subject to the HL7 Ireland governance process. Please refer to the [governance repository](https://github.com/hl7-ie/governance) for the full process, including:

- How to raise a change request
- Voting and balloting procedures
- Intellectual property agreements

## Getting Started

1. Fork this repository.
2. Create a branch: `git checkout -b feature/my-change`.
3. Make your changes following the conventions below.
4. Run the local build: `bash _genonce.sh`.
5. Validate examples: `bash scripts/validate-all.sh`.
6. Commit and push your branch.
7. Open a pull request against `main`.

## Conventions

- Use FHIR R4 (4.0.1).
- Follow the FSH (FHIR Shorthand) style guide.
- Name FSH files using PascalCase: e.g. `IEPatient.fsh`.
- Name resource JSON files using kebab-case: e.g. `structuredefinition-ie-patient.json`.
- All canonical URLs must start with `https://hl7-ie.github.io/tooling/fhir/`.
- Keep example data synthetic – never use real patient data.

## Code Review

All pull requests require at least one approving review from a HL7 Ireland maintainer.

## Licence

By contributing, you agree that your contributions will be licenced under the [Apache 2.0 licence](LICENSE).
