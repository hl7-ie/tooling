#!/usr/bin/env bash
# _genonce.sh – Run the HL7 FHIR IG Publisher once.
# Usage: bash _genonce.sh [additional publisher flags]
set -euo pipefail

PUBLISHER_JAR="publisher.jar"
PUBLISHER_OPTS="-ig ig.ini"

if [ ! -f "$PUBLISHER_JAR" ]; then
  echo "publisher.jar not found. Running _updatePublisher.sh first..."
  bash _updatePublisher.sh
fi

echo "Running IG Publisher..."
java -jar "$PUBLISHER_JAR" $PUBLISHER_OPTS "$@"
