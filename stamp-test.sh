#!/bin/sh

if [ $# -gt 3 ]; then
    log=$1
    shift
    suffix=$1
    shift
    exp=$1
    shift
else
    echo "stamp-test.sh log-file (seq | tl2 | tinystm) (sim | real) nb-threads..."
    exit
fi

while [ $# -gt 0 ]
do

threads=$1
shift

lf=${log}.${suffix}.${exp}

if [ "${exp}" = "sim" ]; then

for test in \
    "./${suffix}/bayes -v32 -r1024 -n2 -p20 -s0 -i2 -e2 -t" \
    "./${suffix}/genome -g256 -s16 -n16384 -t" \
    "./${suffix}/intruder -a10 -l4 -n2038 -s1 -t" \
    "./${suffix}/kmeans -m40 -n40 -t0.05 -i kmeans/inputs/random-n2048-d16-c16.txt -p" \
    "./${suffix}/kmeans -m15 -n15 -t0.05 -i kmeans/inputs/random-n2048-d16-c16.txt -p" \
    "./${suffix}/labyrinth -i labyrinth/inputs/random-x32-y32-z3-n96.txt -t" \
    "./${suffix}/ssca2 -s13 -i1.0 -u1.0 -l3 -p3 -t" \
    "./${suffix}/vacation -n2 -q90 -u98 -r16384 -t4096 -c" \
    "./${suffix}/vacation -n4 -q60 -u90 -r16384 -t4096 -c" \
    "./${suffix}/yada -a20 -i yada/inputs/633.2 -t"
do

echo "=================================================="  | tee -a ${lf}
echo "Executing: ${test} ${threads}" | tee -a ${lf}
exec $test $threads | tee -a ${lf}

done

fi

if [ "${exp}" = "real" ]; then

for test in \
    "./${suffix}/bayes -v32 -r4096 -n10 -p40 -i2 -e8 -s1 -t" \
    "./${suffix}/genome -g16384 -s64 -n16777216 -t" \
    "./${suffix}/intruder -a10 -l128 -n262144 -s1 -t" \
    "./${suffix}/kmeans -m40 -n40 -t0.00001 -i kmeans/inputs/random-n65536-d32-c16.txt -p" \
    "./${suffix}/kmeans -m15 -n15 -t0.00001 -i kmeans/inputs/random-n65536-d32-c16.txt -p" \
    "./${suffix}/labyrinth -i labyrinth/inputs/random-x512-y512-z7-n512.txt -t" \
    "./${suffix}/ssca2 -s20 -i1.0 -u1.0 -l3 -p3 -t" \
    "./${suffix}/vacation -n2 -q90 -u98 -r1048576 -t4194304 -c" \
    "./${suffix}/vacation -n4 -q60 -u90 -r1048576 -t4194304 -c" \
    "./${suffix}/yada -a15 -i yada/inputs/ttimeu1000000.2 -t"
do

echo "=================================================="
echo "Executing: ${test} ${threads}" | tee -a ${lf}
exec $test $threads | tee -a ${lf}

done

fi

done

exit

