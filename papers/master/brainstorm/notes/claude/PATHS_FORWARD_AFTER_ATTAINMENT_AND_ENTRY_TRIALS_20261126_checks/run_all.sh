#!/usr/bin/env bash
set -u
cd "$(dirname "$0")"
{
  echo "# Check run for PATHS_FORWARD_AFTER_ATTAINMENT_AND_ENTRY_TRIALS_20261126"
  echo "# date (UTC): $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  python3 -B -c "import sys, numpy, scipy, sympy; print('# python', sys.version.split()[0], '| numpy', numpy.__version__, '| scipy', scipy.__version__, '| sympy', sympy.__version__)"
  for f in check_*.py; do
    echo; echo "===== $f ====="
    python3 -B "$f" 2>&1
    echo "(exit status $?)"
  done
} | tee output.txt
echo; echo "ok lines: $(grep -c '^\[ok\]' output.txt)   FAIL lines: $(grep -c '^\[FAIL\]' output.txt)"
