#!/usr/bin/env bash

FILE="$1"
NAME="$2"
POSITION="$3"

OFFSET=$(tail -c +"$POSITION" "$FILE" | grep -aob -m 1 "END_CURRENT_OBJECT NAME=$NAME")
if [ "$?" -ne "0" ]
then
  exit 0
fi
OFFSET=$(echo "$OFFSET" | cut -d':' -f1)
OFFSET=$((OFFSET + POSITION - 1))

echo "M118 Object $NAME end at: $OFFSET" > /tmp/printer
echo "M26 S${OFFSET}" > /tmp/printer
echo "M24" > /tmp/printer