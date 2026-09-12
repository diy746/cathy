#!/bin/sh

FILE="$1"

for MOD in STORY TUTORIAL HELP CREDITS VERSION
do

echo "Checking $MOD"

DATA=$(grep "^${MOD}_DATA=" "$FILE" | cut -d"'" -f2)

if [ -z "$DATA" ]; then
    echo " EMPTY"
    continue
fi

echo "$DATA" | base64 -d | gzip -t

if [ $? -eq 0 ]; then
    echo " OK"
else
    echo " BROKEN"
fi

done
