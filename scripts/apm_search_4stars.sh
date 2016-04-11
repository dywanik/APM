#!/usr/bin/env bash
#
# insert positions of the stars
#
OUTNAME=MNDra2002.out
V1x=292
V1y=255
C1x=277
C1y=285
C2x=249
C2y=203


sed 1,3d $OUTNAME |awk '{printf "%4.0f %4.0f %4.0f\n", $1, $2-'$V1x', $3-'$V1y'}' > resV1.out
sed 1,3d $OUTNAME |awk '{printf "%4.0f %4.0f %4.0f\n", $1, $2-'$C1x', $3-'$C1y'}' > resC1.out
sed 1,3d $OUTNAME |awk '{printf "%4.0f %4.0f %4.0f\n", $1, $2-'$C2x', $3-'$C2y'}' > resC2.out

# range of the shifts
# V1xa=3
# V1xb=3

# ReadOut values read from *.out
# V1xro=29

LINES=$(cat resV1.out | wc -l)

for CURR_LINE in `seq 1 $LINES`; do
  # shifts for V1
  V1xs=$(sed -n "${CURR_LINE}p" resV1.out |awk '{print $2}')
  V1ys=$(sed -n "${CURR_LINE}p" resV1.out |awk '{print $3}')  
  
  if [ "$V1xs" -ge -3 -a "$V1xs" -le 3 ] && [ "$V1ys" -ge -3 -a "$V1ys" -le 3 ]; then
  OUTV1=$(cat $OUTNAME | sed 1,3d|sed -n "${CURR_LINE}p" |awk '{printf "%4.0f %4.3f %4.3f %2.3f %2.3f\n", $1, $2, $3, $4, $5}')
  echo $OUTNAME $OUTV1 >> V1.txt
#   else
#   echo "NULL"
  fi
  
#   # shifts for C1
#   C1xs=$(sed -n "${CURR_LINE}p" resC1.out |awk '{print $2}')
#   C1ys=$(sed -n "${CURR_LINE}p" resC1.out |awk '{print $3}')  
#   
#   if [ "$C1xs" -ge -3 -a "$C1xs" -le 3 ] && [ "$C1ys" -ge -3 -a "$C1ys" -le 3 ]; then
#   OUTC1=$(cat $OUTNAME | sed 1,3d|sed -n "${CURR_LINE}p" |awk '{printf "%4.0f %4.3f %4.3f %2.3f %2.3f\n", $1, $2, $3, $4, $5}')
#   echo $OUTNAME $OUTC1 > C1.txt
# #   else
# #   echo "NULL"
#   fi
  
#   # shifts for C2
#   C2xs=$(sed -n "${CURR_LINE}p" resC2.out |awk '{print $2}')
#   C2ys=$(sed -n "${CURR_LINE}p" resC2.out |awk '{print $3}')  
#   
#   if [ "$C2xs" -ge -3 -a "$C2xs" -le 3 ] && [ "$C2ys" -ge -3 -a "$C2ys" -le 3 ]; then
#   OUTC2=$(cat $OUTNAME | sed 1,3d|sed -n "${CURR_LINE}p" |awk '{printf "%4.0f %4.3f %4.3f %2.3f %2.3f\n", $1, $2, $3, $4, $5}')
#   echo $OUTNAME $OUTC2 >> C2.txt
# #   else
# #   echo "NULL"
#   fi
done
