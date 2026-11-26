#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Edward B. Baker III
"""Check repository navigation, branch structure, size policy, and optionally the import snapshot."""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import re
from urllib.parse import unquote, urlsplit

if __package__:
    from .build_manuscripts import MANUSCRIPTS
else:
    from build_manuscripts import MANUSCRIPTS

ROOT = Path(__file__).resolve().parents[1]
BRANCHES = ('master',
            'master/01_fixed_type_variational_descent',
            'investigations-1/01_chiral_metric_evolution',
            'investigations-1/02_bach_flow',
            'investigations-1/03_first_order_twistor',
            'investigations-1/03_first_order_twistor/01_sections_and_connections',
            'investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry',
            'investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction',
            'investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors',
            'investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching',
            'investigations-1/04_hypersurface_immersions',
            'investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions',
            'investigations-1/04_hypersurface_immersions/02_two_handle_recognition',
            'investigations-1/05_collar_deformation_and_surgery',
            'investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates',
            'investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery',
            'investigations-1/06_bour_flow_and_fixed_type_attainment',
            'investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy',
            'investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment',
            'investigations-1/07_positive_subcritical_entry',
            'initial-investigations/01_generalized_isothermal_coordinates',
            'initial-investigations/02_chiral_descent_and_double_copy')

def files(root):
    for path in root.rglob('*'):
        relative = path.relative_to(root)
        if relative.parts[0] == 'smooth-poincare-4d-storage':
            continue
        if relative.parts[:3] in {('formalization', 'blueprint', 'print'),
                                 ('formalization', 'blueprint', 'web')}:
            continue
        if any(part in {'.git', '.lake', '__pycache__', '.venv', '.chat-history-transaction'} for part in relative.parts):
            continue
        if path.is_file():
            yield path

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repo', type=Path, default=ROOT)
    parser.add_argument('--verify-import', action='store_true', help='Require all 36 original imported files and hashes, including local reading copies.')
    args = parser.parse_args()
    root = args.repo.resolve()
    errors, notices = [], set()
    manifest = json.loads((root / 'IMPORT_MANIFEST.json').read_text())
    local_only = {entry['destination'] for entry in manifest['files']
                  if entry['git_policy'] in {'local_reading_copy', 'generated_local_copy'}}
    # Reading copies may be absent on a checkout that has not built the TeX.
    for branch, (series, filename) in MANUSCRIPTS.items():
        if (root / 'papers' / series / branch / 'manuscript' / filename).is_file():
            local_only.add((Path('output/pdf') / branch / Path(filename).with_suffix('.pdf')).as_posix())
    required = ['README.md', 'AGENTS.md', 'LICENSE.txt', 'CITATION.cff', 'CONTINUATION.md',
                '.gitignore', '.github/pull_request_template.md',
                '.github/workflows/check-repository.yml', '.github/workflows/build-latex.yml',
                '.github/ISSUE_TEMPLATE/formalization.md',
                '.github/ISSUE_TEMPLATE/verification.md', '.github/ISSUE_TEMPLATE/possible-error.md',
                'INVESTIGATION_SETUP_WORKFLOW.md', 'GPT_RESEARCH_MODEL_WORKFLOW.md',
                'REFERENCE_WORKFLOW.md', 'LARGE_FILES.md', 'references/references.bib',
                'papers/investigations-1/README.md', 'papers/initial-investigations/README.md']
    for branch in BRANCHES:
        base = root / 'papers' / branch
        for name in ['README.md', 'DRAFT_HISTORY.md', 'research-overview/OVERVIEW.md',
                     'research-plan/PLAN.md', 'research-progress/REGISTER.md',
                     'continuation-notes/CONTINUATION.md', 'references/README.md',
                     'chat-histories/README.md', 'research-progress/handoffs/README.md',
                     'notes/README.md', 'numerics/README.md', 'reviews/README.md',
                     'brainstorm/README.md', 'brainstorm/notes/README.md',
                     'brainstorm/explanations/README.md', 'manuscript/README.md']:
            required.append(str((base / name).relative_to(root)))
        registers = list((base / 'research-progress').glob('*REGISTER*.md'))
        if len(registers) != 1:
            errors.append(f'{branch}: expected exactly one live register, found {len(registers)}')
    for name in required:
        if not (root / name).is_file(): errors.append('Missing required file: ' + name)
    for forbidden in ('avoid', 'result-summaries'):
        if (root / forbidden).exists(): errors.append('Unrequested imported collection: ' + forbidden)
    count = 0
    for path in files(root):
        rel = path.relative_to(root).as_posix()
        if rel.startswith(('output/', 'tmp/')): continue
        if path.stat().st_size > 1024 * 1024 and rel not in local_only:
            errors.append('Tracked-source candidate exceeds 1 MiB: ' + rel)
        if path.suffix != '.md': continue
        text = re.sub(r'^```[^\n]*\n.*?^```\s*$', '', path.read_text(), flags=re.M | re.S)
        for match in re.finditer(r'\[[^\]\n]+\]\((<[^>]+>|[^\s)]+)(?:\s+"[^"]*")?\)', text):
            link = match.group(1).strip('<>')
            parts = urlsplit(link)
            if parts.scheme or parts.netloc or not parts.path: continue
            destination = (path.parent / unquote(parts.path)).resolve()
            count += 1
            if not destination.is_relative_to(root):
                errors.append(rel + ': link escapes repository: ' + link)
            elif not destination.exists():
                target = destination.relative_to(root).as_posix()
                if target in local_only:
                    notices.add('Optional local reading/build copy absent: ' + target)
                else: errors.append(rel + ': broken link: ' + link)
    if args.verify_import:
        for entry in manifest['files']:
            p = root / entry['destination']
            if not p.is_file():
                errors.append('Import file absent: ' + entry['destination'])
            elif hashlib.sha256(p.read_bytes()).hexdigest() != entry['destination_sha256']:
                errors.append('Import snapshot differs: ' + entry['destination'])
    for notice in sorted(notices): print('OPTIONAL', notice)
    for error in errors: print('FAIL', error)
    print(f'{"FAIL" if errors else "PASS"}: {len(BRANCHES)} branches, {count} relative links, {len(errors)} errors')
    if args.verify_import and not errors: print('PASS: all imported file hashes match the setup snapshot')
    return bool(errors)

if __name__ == '__main__':
    raise SystemExit(main())
