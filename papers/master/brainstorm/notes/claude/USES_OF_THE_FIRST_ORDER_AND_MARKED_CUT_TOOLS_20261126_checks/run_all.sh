#!/bin/sh
# Runs the three checks and writes output.txt.  check_02 takes about ten minutes.
set -u
export PYTHONDONTWRITEBYTECODE=1
: > output.txt
status=0
for f in check_01_kk_cap_energy.py check_02_cap_costs.py check_03_seams_eta_arithmetic.py; do
  echo "===== $f =====" >> output.txt
  python3 -B "$f" >> output.txt 2>&1 || status=1
  echo >> output.txt
done
grep -h "^check_0" output.txt
exit $status
