#!/usr/bin/env python3
"""Recompute the Edition 04 activation inputs from the repository root."""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import posixpath
import re
import runpy
import subprocess
import tempfile


BASE = '5ddaabd76595b3679d1ea415e9f6d9643802f9ef'
SURGERY = '05_collar_deformation_and_surgery'
SURGERY_BRANCH = f'papers/investigations-1/{SURGERY}'
MANUSCRIPTS = (
    'master',
    'master/01_fixed_type_variational_descent',
    '03_first_order_twistor/01_sections_and_connections/01_neck_geometry',
    '04_hypersurface_immersions/01_immersed_handle_constructions',
    '04_hypersurface_immersions',
    '04_hypersurface_immersions/02_two_handle_recognition',
    SURGERY,
    f'{SURGERY}/01_collar_deformation_and_adapted_coordinates',
    f'{SURGERY}/02_handle_isolation_and_marked_surgery',
)
PLANNING = ('research-overview/OVERVIEW.md', 'research-plan/PLAN.md', 'research-progress/REGISTER.md')
FORMAL = 'formalization/investigations/'
TOPIC_SHA = 'cf1131d16f1c9289017c7c7aff7ce7ea5cdfae4dc7e3c71a67efb473c267a14c'
ROOT_IMPORT_SHA = '70ce2f5b27398d80f3ee4160c00f2aae46b83aed9668d5a8679ead01da6a9a61'
SELECTED_SHA = '2ec10301cba5f2ebc2bba7535cdffdaa42ba74857087fb66801e90c239de373f'
SELECTED = sorted('SmoothPoincare.' + name for name in (
    'ClosedMarkedControl.exists_splitClosingHomeomorph',
    'ClosedMarkedControl.slidClosedAssembly_representatives',
    'IsolatedOneHandle.RetainedRoundedTrace.exists_markedBall_of_nativeRepCover',
    'SignedCollarCapTestPath.joinedYamabeFloor_of_ceiling_lt',
    'eventually_no_paid_cap_of_original_charged_markedDisk',
    'geometricDiscardedMass_le_excess_inclusive',
    'geometricRecognitionEndpoint',
    'original_markedDisk_charge_eq_and_le_excess_of_arbitrarily_small_cap_drift',
    'ricciFlow_terminalBall_intrinsicRicciCharge_pointedLimit',
    'ricciFlow_terminalPointed_noncompact_of_initialVolume',
))


def run(*args, cwd=None):
    return subprocess.check_output(args, cwd=cwd, stderr=subprocess.STDOUT)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def aggregate(paths, read, separator='\t'):
    paths = sorted(set(paths))
    records = ''.join(f'{path}{separator}{sha(read(path))}\n' for path in paths)
    return len(paths), sha(records.encode())


def tex_closure(main, read):
    base = PurePosixPath(main).parent
    pending = [main]
    seen = set()
    while pending:
        path = pending.pop()
        if path in seen:
            continue
        seen.add(path)
        contents = re.sub(r'(?<!\\)%[^\n]*', '', read(path).decode())
        for include in re.findall(r'\\(?:input|include)\s*\{([^{}]+)\}', contents):
            name = PurePosixPath(include)
            pending.append(posixpath.normpath(base / (name if name.suffix else name.with_suffix('.tex'))))
    return seen


def report_inputs(root):
    tracked = run('git', 'ls-tree', '-rz', '--name-only', BASE, cwd=root).decode().split('\0')
    paths = {path for path in tracked if path}
    changed = set()

    def read(path):
        if path not in paths:
            raise ValueError(f'Activation input lies outside {BASE}: {path}')
        committed = run('git', 'show', f'{BASE}:{path}', cwd=root)
        working = root / path
        if not working.is_file() or working.read_bytes() != committed:
            changed.add(path)
        return committed

    projects = runpy.run_path(str(root / 'tools/build_manuscripts.py'))['MANUSCRIPTS']
    science_plans = []
    closures = []
    print('Activation source tree', BASE)
    for key in MANUSCRIPTS:
        series, filename = projects[key]
        branch = str(PurePosixPath('papers', series, key))
        science_plans.append([f'{branch}/{locator}' for locator in PLANNING])
        source = f'{branch}/manuscript/{filename}'
        closure = tex_closure(source, read)
        closures.append(closure)
        pdf = (root / 'output/pdf' / key / Path(filename).with_suffix('.pdf')).read_bytes()
        if not pdf.startswith(b'%PDF-'):
            raise ValueError(f'Invalid reading copy for {source}')
        print('Manuscript', key, *aggregate(closure, read, ' '), sha(pdf), 'raw main', sha(read(source)))

    def plans(start, end):
        return [path for branch in science_plans[start:end] for path in branch]

    topics = {path for path in paths if path.startswith('formalization/SmoothPoincare/') and path.endswith('.lean')}
    groups = {
        'Established science planning': plans(0, 6),
        'Collar and surgery planning': plans(6, 9),
        'All science planning': plans(0, 9),
        'Lean topics': topics,
        'Blueprint top-level TeX': [path for path in paths if re.fullmatch(r'formalization/blueprint/src/[^/]+\.tex', path)],
        'Formalization planning and owning registers': [path for path in paths if path.startswith(FORMAL) and (
            re.fullmatch(r'research-(?:overview|plan)/[^/]+\.md', path.removeprefix(FORMAL))
            or path == FORMAL + 'research-progress/REGISTER.md'
            or any(path.endswith('/' + locator) for locator in PLANNING)
        )],
    }
    print('Collar and surgery TeX closure union', *aggregate(set.union(*closures[6:]), read, ' '))
    for key, group in groups.items():
        count, digest = aggregate(group, read)
        if key == 'Lean topics' and (count, digest) != (177, TOPIC_SHA):
            raise ValueError('Edition 03 topic generation mismatch')
        print(key, count, digest)

    files = (
        'references/references.bib',
        'references/SOURCE_NOTES_MASTER_CHARGED_FLOW_20261125.md',
        'references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md',
        'papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md',
        'papers/master/research-progress/handoffs/PARALLEL_OWNERSHIP_20261125.md',
        f'{SURGERY_BRANCH}/references/README.md',
        f'{SURGERY_BRANCH}/reviews/PENULTIMATE_CUTS_AND_CURVED_FILLINGS_20261126.md',
        f'{SURGERY_BRANCH}/reviews/TWO_MIXED_CUTS_AND_CHARGED_DISK_20261126.md',
        f'{SURGERY_BRANCH}/notes/SOURCE_WITNESSES.md',
        f'{SURGERY_BRANCH}/research-progress/handoffs/PREFIX_AND_INTERIOR_20261126.md',
        'formalization/blueprint/src/macros/common.tex',
        'formalization/lean-toolchain', 'formalization/lakefile.toml',
        'formalization/lake-manifest.json', 'formalization/SmoothPoincare.lean',
    )
    for path in files:
        digest = sha(read(path))
        if path == 'formalization/SmoothPoincare.lean' and digest != ROOT_IMPORT_SHA:
            raise ValueError('Edition 03 public import mismatch')
        print(path, digest)
    print('Audited working paths differing from activation Git tree', len(changed))
    for path in sorted(changed):
        print('Changed working path', path)


def report_packages(formal):
    print(run('lean', '--version', cwd=formal).decode().strip())
    print(run('lake', '--version', cwd=formal).decode().strip())
    manifest = json.loads(run('git', 'show', f'{BASE}:formalization/lake-manifest.json', cwd=formal))
    packages = manifest['packages']
    revisions = {package['name']: package['rev'] for package in packages}
    total = 0
    for package in packages:
        name = package['name']
        checkout = formal / manifest['packagesDir'] / name
        actual = run('git', 'rev-parse', 'HEAD', cwd=checkout).decode().strip()
        if actual != revisions[name] or run('git', 'status', '--porcelain', '--untracked-files=no', cwd=checkout):
            raise ValueError(f'Unexpected revision or tracked work in {name}')
        nested_file = checkout / package['manifestFile']
        nested = json.loads(nested_file.read_bytes())['packages'] if nested_file.is_file() else []
        for entry in nested:
            if revisions.get(entry['name']) != entry['rev']:
                raise ValueError(f'Nested revision mismatch for {name}/{entry["name"]}')
        total += len(nested)
        print('Package', name, actual, len(nested), *(entry['name'] for entry in nested))
    if (len(packages), total) != (10, 19):
        raise ValueError('Unexpected dependency counts')


def records(output):
    pattern = rb"^'([^']+)' (?:depends on axioms: \[[^\]]*\]|does not depend on any axioms)\n"
    result = {}
    start = 0
    for match in re.finditer(pattern, output, re.M):
        name = match[1].decode()
        record = output[start:match.end()]
        if not record.startswith((f'{name} :'.encode(), f'@{name} :'.encode())) or name in result:
            raise ValueError(f'Malformed type and axiom record for {name}')
        result[name] = record
        start = match.end()
    if start != len(output):
        raise ValueError('Trailing output after final Lean axiom report')
    return result


def replay(formal, setup_log, e43_log):
    content = 'import SmoothPoincare\nset_option pp.universes false\n'
    content += ''.join(f'#check @{name}\n#print axioms {name}\n' for name in SELECTED)
    with tempfile.TemporaryDirectory(prefix='sp4-ed04-replay-') as directory:
        source = Path(directory, 'SelectedPublicReadback.lean')
        source.write_text(content, encoding='utf-8')
        output = run('lake', 'env', 'lean', '-j1', str(source), cwd=formal)
    digest = sha(output)
    if digest != SELECTED_SHA:
        raise ValueError('Public replay differs from the checked Edition 04 setup aggregate')
    if setup_log and output != setup_log.read_bytes():
        raise ValueError('Public replay differs from the retained setup log')
    if e43_log:
        earlier = records(e43_log.read_bytes())
        if len(earlier) != 1066 or output != b''.join(earlier[name] for name in SELECTED):
            raise ValueError('Public replay differs from the selected Edition 03 records')
    by_name = records(output)
    if sorted(by_name) != SELECTED:
        raise ValueError('Public replay is missing a type or axiom query')
    print('Exact type and axiom report pairs', len(by_name), digest)
    for name, record in by_name.items():
        print(name, sha(record))
    print('Retained raw setup compared:', bool(setup_log), 'retained E43 records compared:', bool(e43_log))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--setup-log', type=Path)
    parser.add_argument('--e43-log', type=Path)
    args = parser.parse_args()
    root = Path(run('git', 'rev-parse', '--show-toplevel').decode().strip())
    formal = root / 'formalization'
    report_inputs(root)
    report_packages(formal)
    replay(formal, args.setup_log, args.e43_log)


if __name__ == '__main__':
    main()
