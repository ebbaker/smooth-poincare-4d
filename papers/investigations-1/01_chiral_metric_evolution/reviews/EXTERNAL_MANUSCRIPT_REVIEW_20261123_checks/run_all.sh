#!/usr/bin/env bash
# Runs every check and writes output.txt next to the scripts.  Usage: bash run_all.sh
set -u
cd "$(dirname "$0")"
{
  echo "# Check run for EXTERNAL_MANUSCRIPT_REVIEW_20261123"
  echo "# date (UTC): $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  python3 -c "import sys, numpy, scipy, jax; print('# python', sys.version.split()[0], '| numpy', numpy.__version__, '| scipy', scipy.__version__, '| jax', jax.__version__)"
  for f in check_*.py; do
    echo; echo "===== $f ====="
    python3 "$f" 2>&1
    echo "(exit status $?)"
  done
} | tee output.txt
echo; echo "PASS lines: $(grep -c '^PASS' output.txt)   FAIL lines: $(grep -c '^FAIL' output.txt)"
