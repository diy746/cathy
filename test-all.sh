#!/bin/sh
echo "CATHY MODULE TEST"

for FILE in modules/*.block
do
    echo "Testing $FILE"
    DATA=$(grep "_DATA=" "$FILE" | cut -d"'" -f2)

    if printf "%s" "$DATA" | base64 -d | gzip -t
    then
        echo " OK"
    else
        echo " FAIL"
    fi
done
