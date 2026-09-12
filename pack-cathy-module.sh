#!/bin/sh
NAME="$1"

if [ -z "$NAME" ]; then
    echo "Usage: ./pack-cathy-module.sh name"
    exit 1
fi

INPUT="./txt/$NAME"
OUTPUT="./modules/$NAME.block"

if [ ! -f "$INPUT" ]; then
    echo "Missing: $INPUT"
    exit 1
fi

VAR=$(echo "$NAME" | tr '[:lower:]' '[:upper:]')"_DATA"
DATA=$(gzip -9 -c "$INPUT" | base64 | tr -d '\n')

cat > "$OUTPUT" <<EOF
# Cathy compressed module
# Module: $NAME
${VAR}='$DATA'
EOF

printf "%s" "$DATA" | base64 -d > /tmp/cathy-test.gz

if gzip -t /tmp/cathy-test.gz
then
    echo "OK: $OUTPUT"
else
    echo "FAILED"
    exit 1
fi
