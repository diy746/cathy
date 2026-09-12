#!/bin/bash

set -e

MODULE=$1

if [ -z "$MODULE" ]; then
    echo "Usage: ./build-module.sh module_name"
    exit 1
fi

SRC="txt/$MODULE"
OUT="modules/$MODULE.block"

echo "================================="
echo " BUILDING MODULE: $MODULE"
echo "================================="

# Check source exists
if [ ! -f "$SRC" ]; then
    echo "ERROR: Missing $SRC"
    exit 1
fi


echo "[1/5] Checking source..."
wc -c "$SRC"


echo "[2/5] Packing..."

./pack-cathy-module.sh "$MODULE"


if [ ! -f "$OUT" ]; then
    echo "ERROR: Module not created"
    exit 1
fi


echo "[3/5] Creating checksum..."

sha256sum "$OUT" > "$OUT.sha256"


echo "[4/5] Testing module..."

./test-all.sh "$MODULE"


echo "[5/5] Finished"

echo ""
echo "Created:"
echo "$OUT"
echo "$OUT.sha256"
echo ""
