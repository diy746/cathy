#!/bin/bash

MODULES=(
story
tutorial
help
version
credits
)


for MODULE in "${MODULES[@]}"
do

echo ""
echo "################################"
echo "# NEXT MODULE: $MODULE"
echo "################################"

./build-module.sh "$MODULE"


if [ $? -ne 0 ]; then
    echo "FAILED: $MODULE"
    exit 1
fi


done


echo ""
echo "ALL MODULES BUILT SUCCESSFULLY"
