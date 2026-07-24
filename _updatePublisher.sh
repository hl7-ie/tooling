#!/usr/bin/env bash
# _updatePublisher.sh – Download or update the HL7 FHIR IG Publisher jar.
set -euo pipefail

PUBLISHER_URL="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
PUBLISHER_JAR="publisher.jar"

echo "Downloading IG Publisher from $PUBLISHER_URL ..."
curl -L --output "$PUBLISHER_JAR" "$PUBLISHER_URL"
echo "Done. Publisher jar saved to $PUBLISHER_JAR"
java -jar "$PUBLISHER_JAR" -v
