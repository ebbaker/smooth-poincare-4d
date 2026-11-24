#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Edward B. Baker III
"""Build working manuscripts with latexmk and keep temporary files out of research folders."""
from __future__ import annotations
import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
MANUSCRIPTS = {
    '01_chiral_metric_evolution': ('investigations-1', 'chiral_curvature_and_metric_evolution.tex'),
    '02_bach_flow': ('investigations-1', 'bach_flow_and_smooth_poincare.tex'),
    '03_first_order_twistor': ('investigations-1', 'first_order_twistor_and_smooth_poincare.tex'),
    '01_generalized_isothermal_coordinates': ('initial-investigations', 'generalized_isothermal_wave_metrics.tex'),
    '02_chiral_descent_and_double_copy': ('initial-investigations', 'chiral_connection_descent_and_double_copy.tex'),
}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('branches', nargs='*', help='Branch names; omit to build all.')
    parser.add_argument('--list', action='store_true', help='List source paths without building.')
    parser.add_argument('--output-root', type=Path, default=ROOT / 'output/pdf')
    args = parser.parse_args()
    selected = args.branches or list(MANUSCRIPTS)
    unknown = set(selected) - MANUSCRIPTS.keys()
    if unknown:
        parser.error('Unknown branch: ' + ', '.join(sorted(unknown)))
    if not args.list and not shutil.which('latexmk'):
        parser.error('latexmk is required; install a TeX distribution first.')
    build_env = os.environ.copy()
    build_env['BIBINPUTS'] = os.pathsep.join(
        (str(ROOT / 'references'), build_env.get('BIBINPUTS', ''))
    )
    for branch in selected:
        series, filename = MANUSCRIPTS[branch]
        source = ROOT / 'papers' / series / branch / 'manuscript' / filename
        if args.list:
            print(source.relative_to(ROOT))
            continue
        with tempfile.TemporaryDirectory(prefix='poincare-tex-') as temporary:
            command = ['latexmk', '-pdf', '-interaction=nonstopmode', '-halt-on-error',
                       '-file-line-error', '-outdir=' + temporary, str(source)]
            result = subprocess.run(
                command, cwd=source.parent, env=build_env, capture_output=True, text=True
            )
            if result.returncode:
                print(result.stdout[-12000:])
                print(result.stderr[-3000:])
                return result.returncode
            pdf = Path(temporary) / source.with_suffix('.pdf').name
            if not pdf.is_file() or not pdf.read_bytes().startswith(b'%PDF-'):
                raise RuntimeError('Build did not produce a PDF: ' + str(source))
            destination = args.output_root / branch / pdf.name
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(pdf, destination)
            print('BUILT', destination)
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
