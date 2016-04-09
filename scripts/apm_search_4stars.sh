#!/usr/bin/env bash
#
# insert positions of the stars
#
V1x=292
V1y=255
C1x=277
C1y=285
C2x=249
C2y=203

# range of the shifts
V1xa=`expr $V1x - 3`
V1xb=`expr $V1x + 3`

# ReadOut values read from *.out
V1xro=29

if [ "$V1xro" -ge "$V1xa" -a "$V1xro" -le "$V1xb" ]; then
echo "EWEWEWE"
else
echo "NULL"
fi