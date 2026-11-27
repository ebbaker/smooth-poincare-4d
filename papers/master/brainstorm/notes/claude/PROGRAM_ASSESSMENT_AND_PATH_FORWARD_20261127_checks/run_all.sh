#!/usr/bin/env bash
# Runs the three Python checks and writes output.txt next to the scripts.  Usage: bash run_all.sh
# python3 -B keeps Python from writing __pycache__ into the repository.
# check_04_repository_counts.sh is separate: it reads the git repository and is run with
#   sh check_04_repository_counts.sh > repository_counts.txt
set -u
cd "$(dirname "$0")"
{
  echo "# Check run for PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127"
  echo "# date (UTC): $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  python3 -B -c "import sys, numpy, sympy, mpmath; print('# python', sys.version.split()[0], '| numpy', numpy.__version__, '| sympy', sympy.__version__, '| mpmath', mpmath.__version__)"
  for f in check_0[1-3]_*.py; do
    echo; echo "===== $f ====="
    python3 -B "$f" 2>&1
    echo "(exit status $?)"
  done
} | tee output.txt
echo; echo "ok lines: $(grep -c '^ok ' output.txt)   FAIL lines: $(grep -c '^FAIL ' output.txt)"
