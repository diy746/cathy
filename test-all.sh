#!/bin/sh

echo "CATHY RELEASE TEST"

echo "[1] Version test"

./cathy -v >/dev/null || exit 1

echo " OK"

echo "[2] Script execution test"

./cathy --help >/dev/null || exit 1

echo " OK"

echo "Cathy test passed"
