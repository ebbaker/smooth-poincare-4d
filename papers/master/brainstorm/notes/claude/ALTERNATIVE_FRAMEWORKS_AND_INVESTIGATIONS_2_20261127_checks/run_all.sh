#!/usr/bin/env bash
# Runs the three checks of the frameworks note and writes output.txt beside them.
set -u
cd "$(dirname "$0")"
{
  python3 -B -c "import sys, sympy, mpmath, numpy; print('Python', sys.version.split()[0], '| sympy', sympy.__version__, '| mpmath', mpmath.__version__, '| numpy', numpy.__version__)"
  for f in check_05_prism_groups.py check_06_pole_forms.py check_07_entropy_and_presentation.py; do
    echo "== $f"
    PYTHONDONTWRITEBYTECODE=1 python3 -B "$f"
    echo "exit code $?"
  done
} 2>&1 | tee output.txt
