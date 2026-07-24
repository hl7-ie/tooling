#!/usr/bin/env bash
# _genonce.sh – Run the HL7 FHIR IG Publisher once.
# Usage: bash _genonce.sh [additional publisher flags]
set -euo pipefail

PUBLISHER_JAR="publisher.jar"
# -no-sushi: SUSHI is already run as a separate CI/build step (npx sushi .),
# so skip the IG Publisher's own SUSHI invocation. It shells out to a global
# "sushi" binary, which isn't on PATH in this repo's Node/npm setup.
PUBLISHER_OPTS="-ig ig.ini -no-sushi"

if [ ! -f "$PUBLISHER_JAR" ]; then
  echo "publisher.jar not found. Running _updatePublisher.sh first..."
  bash _updatePublisher.sh
fi

echo "Running IG Publisher..."
java -jar "$PUBLISHER_JAR" $PUBLISHER_OPTS "$@"
