#!/usr/bin/env python3
"""Run from repo root. Omit revision for working files or give a Git tree-ish."""
import hashlib
import json
import os
from pathlib import Path
import posixpath
import re
import runpy
import subprocess
import sys


def git(*args, directory='.'):
    return subprocess.check_output(['git', '-C', str(directory), *args])


os.chdir(git('rev-parse', '--show-toplevel').decode().strip())
revision = sys.argv[1] if len(sys.argv) > 1 else None


def file_bytes(path):
    if revision:
        return git('show', f'{revision}:{path}')
    return Path(path).read_bytes()


def digest(data):
    return hashlib.sha256(data).hexdigest()


def aggregate(paths, separator='\t'):
    ordered = sorted(set(paths))
    encoded = ''.join(f'{p}{separator}{digest(file_bytes(p))}\n' for p in ordered).encode()
    return len(ordered), digest(encoded)


if revision:
    source_paths = set(git('ls-tree', '-r', '--name-only', revision).decode().splitlines())
else:
    source_paths = {
        p for p in git('ls-files', '-z', '--cached', '--others', '--exclude-standard').decode().split('\0')
        if p and Path(p).is_file()
    }

keys = ['master', 'master/01_fixed_type_variational_descent',
        '03_first_order_twistor/01_sections_and_connections/01_neck_geometry',
        '04_hypersurface_immersions/01_immersed_handle_constructions',
        '04_hypersurface_immersions', '04_hypersurface_immersions/02_two_handle_recognition']
projects = runpy.run_path('tools/build_manuscripts.py')['MANUSCRIPTS']
branches = {key: posixpath.normpath(f'papers/{projects[key][0]}/{key}') for key in keys}
science_locator = ('research-overview/OVERVIEW.md', 'research-plan/PLAN.md', 'research-progress/REGISTER.md')
formal_dir = 'formalization/investigations/'

groups = {
    'Six manuscript directories': [p for p in source_paths if p.endswith('.tex') and any(p.startswith(f'{b}/manuscript/') for b in branches.values())],
    'Scientific plans and registers': [f'{branch}/{loc}' for branch in branches.values() for loc in science_locator],
    'Lean topic sources': [p for p in source_paths if p.startswith('formalization/SmoothPoincare/') and p.endswith('.lean')],
    'Blueprint TeX sources': [p for p in source_paths if re.fullmatch(r'formalization/blueprint/src/[^/]+\.tex', p)],
    'Formalization plans and owning registers': [p for p in source_paths if p.startswith(formal_dir) and (
        re.fullmatch(r'research-(?:overview|plan)/[^/]+\.md', p.removeprefix(formal_dir))
        or p == f'{formal_dir}research-progress/REGISTER.md'
        or any(p.endswith(f'/{loc}') for loc in science_locator)
    )],
}
print('Source', revision or f'working tree at {git("rev-parse", "HEAD").decode().strip()}')
for key, paths in groups.items():
    count, generation = aggregate(paths)
    print(f'{key}: {count} {generation}')
    if os.getenv('SP4_GENERATION_PATHS'):
        print('\n'.join(sorted(paths)))


def tex_inputs(main):
    base = posixpath.dirname(main)
    pending = [main]
    visited = set()
    while pending:
        path = pending.pop()
        if path in visited:
            continue
        visited.add(path)
        # Within these six sources all literal includes use braces. Do not
        # confuse a literal escaped percent with a TeX comment.
        contents = re.sub(r'(?<!\\)%[^\n]*', '', file_bytes(path).decode())
        for rel in re.findall(r'\\(?:input|include)\s*\{([^{}]+)\}', contents):
            if not posixpath.splitext(rel)[1]:
                rel += '.tex'
            pending.append(posixpath.normpath(posixpath.join(base, rel)))
    return visited


for key, branch in branches.items():
    file_name = projects[key][1]
    inputs = tex_inputs(f'{branch}/manuscript/{file_name}')
    count, generation = aggregate(inputs, ' ')
    pdf = Path(f'output/pdf/{key}/{file_name[:-4]}.pdf')
    print(f'{key}: {count} {generation} {digest(pdf.read_bytes()) if pdf.is_file() else "PDF missing"}')
    if os.getenv('SP4_GENERATION_PATHS'):
        print('\n'.join(sorted(inputs)))

for path in ('references/references.bib',
             'references/SOURCE_NOTES_MASTER_CHARGED_FLOW_20261125.md',
             'papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md',
             'papers/master/research-progress/handoffs/PARALLEL_OWNERSHIP_20261125.md',
             'formalization/lean-toolchain', 'formalization/lakefile.toml',
             'formalization/lake-manifest.json', 'formalization/SmoothPoincare.lean'):
    print(f'{path}: {digest(file_bytes(path))}')

root = json.loads(file_bytes('formalization/lake-manifest.json'))
expected = {entry['name']: entry['rev'] for entry in root['packages']}
nested_total = 0
for entry in root['packages']:
    name = entry['name']
    pkg_dir = Path('formalization', root['packagesDir'], name)
    actual = git('rev-parse', 'HEAD', directory=pkg_dir).decode().strip()
    status = git('status', '--porcelain', '--untracked-files=no', directory=pkg_dir)
    assert actual == expected[name], (name, expected[name], actual)
    assert not status, (name, status.decode())
    nested_file = pkg_dir / entry['manifestFile']
    nested = json.loads(nested_file.read_bytes())['packages'] if nested_file.is_file() else []
    for row in nested:
        assert row['rev'] == expected[row['name']], (name, row['name'], row['rev'], expected.get(row['name']))
    nested_total += len(nested)
    print(f'{name} {actual} {len(nested)}' + ''.join(f' {row["name"]}:{row["rev"]}' for row in nested))
print(f'{len(expected)} root package revisions verified, clean tracked files, {nested_total} nested revision agreements')
