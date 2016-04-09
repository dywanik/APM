#!/usr/bin/env bash

clear
echo "Working..."
chmod 774 scripts/apm_*
rm out/*.log
# make catalogs for all files
if [ ! -d "tmp" ]; then
  mkdir tmp
else
  rm -r tmp/*
fi

ls *.fits > tmp/fits-list.dat
sed -i 's/.fits//' tmp/fits-list.dat

if [ ! -d "out" ]; then
  mkdir out
else
  rm -r out/*
fi

LINES=$(cat tmp/fits-list.dat | wc -l)

for CURR_LINE in `seq 1 $LINES`; do
  PROGRESS=$((100*$CURR_LINE/$LINES))
  clear
  echo "Working... "$PROGRESS"%"
  FITS_FILE=$(sed -n "${CURR_LINE}p" tmp/fits-list.dat)
  FWHM=5.5
  THRES=7.0
  ./scripts/apm_use_dao-b4.do $FITS_FILE $FWHM $THRES
  ./scripts/apm_use_dao-after.do $FITS_FILE $FWHM $THRES
  ./scripts/apm_use_all.do $FITS_FILE
  ./scripts/apm_use_dao-end.do $FITS_FILE
done

# final clean up
cp *.out out
#mv -t tmp *.ap *.coo *.lst *.nei *.psf *.als *.out
