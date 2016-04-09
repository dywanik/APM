#!/usr/bin/env bash
grep '     1 ' $(pwd)/out/*.out >  $(pwd)/tmp/data1.txt
grep '     2 ' $(pwd)/out/*.out >  $(pwd)/tmp/data2.txt
grep '     3 ' $(pwd)/out/*.out >  $(pwd)/tmp/data3.txt
grep '     4 ' $(pwd)/out/*.out >  $(pwd)/tmp/data4.txt
grep '     5 ' $(pwd)/out/*.out >  $(pwd)/tmp/data5.txt