#!/usr/bin/env bash
# sync-terminology.sh – Pull latest CodeSystems and ValueSets from the
# hl7-ie/terminology repository into this IG's input/resources/terminology/.
#
# Usage:
#   bash scripts/sync-terminology.sh
#
# Requires: git, curl
set -euo pipefail

TERMINOLOGY_REPO="https://github.com/hl7-ie/terminology.git"
TMP_DIR="/tmp/hl7-ie-terminology-sync"
TARGET_DIR="input/resources"

echo "Syncing terminology from ${TERMINOLOGY_REPO} ..."

rm -rf "${TMP_DIR}"
git clone --depth=1 "${TERMINOLOGY_REPO}" "${TMP_DIR}"

echo "Copying CodeSystems ..."
if compgen -G "${TMP_DIR}/input/resources/codesystem-*.json" > /dev/null 2>&1; then
  cp "${TMP_DIR}/input/resources/codesystem-"*.json "${TARGET_DIR}/"
fi

echo "Copying ValueSets ..."
if compgen -G "${TMP_DIR}/input/resources/valueset-*.json" > /dev/null 2>&1; then
  cp "${TMP_DIR}/input/resources/valueset-"*.json "${TARGET_DIR}/"
fi

rm -rf "${TMP_DIR}"
echo "Terminology sync complete."
