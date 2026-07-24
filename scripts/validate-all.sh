#!/usr/bin/env bash
# validate-all.sh – Validate all example resources against their profiles.
set -euo pipefail

PUBLISHER_JAR="publisher.jar"
EXAMPLES_DIR="input/resources/examples"

if [ ! -f "$PUBLISHER_JAR" ]; then
  echo "publisher.jar not found. Run _updatePublisher.sh first."
  exit 1
fi

echo "Validating all example resources in ${EXAMPLES_DIR}/ ..."
ERRORS=0

for resource in "${EXAMPLES_DIR}"/*.json; do
  echo "  Validating: $(basename "$resource")"
  if ! java -jar "$PUBLISHER_JAR" -validate "$resource" -version 4.0.1; then
    echo "  FAILED: $resource"
    ERRORS=$((ERRORS + 1))
  fi
done

if [ "$ERRORS" -gt 0 ]; then
  echo "Validation completed with ${ERRORS} error(s)."
  exit 1
else
  echo "All resources validated successfully."
fi
