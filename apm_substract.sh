#!/usr/bin/env bash
LINES=$(cat tmp/fits-list.dat | wc -l)


for CURR_LINE in `seq 1 $LINES`; do
  echo $CURR_LINE
  SUBS=$((CURR_LINE+1))
  echo $SUBS
  echo "---"
  DATA_FILE=$(sed -n "${CURR_LINE}p" tmp/fits-list.dat)
done