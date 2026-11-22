#!/usr/bin/env python3
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Edward B. Baker III
"""Copy this prepared setup into an existing repository without overwriting different files.

Default is a read-only plan. --apply creates missing files after a complete conflict check.
It does not delete files, modify .git, commit, push, install hooks, or change permissions.
"""
from __future__ import annotations
import argparse
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
SKIP = {'.git', '__pycache__', '.venv', '.chat-history-transaction'}

def plan(source, destination):
    if not destination.is_dir():
        raise ValueError('Destination must already exist: ' + str(destination))
    if any(p.is_symlink() for p in (destination, *destination.parents)):
        raise ValueError('Destination path must not contain symbolic links')
    pending, identical, conflicts = [], [], []
    for src in sorted(source.rglob('*')):
        relative = src.relative_to(source)
        if any(p in SKIP or p == '.DS_Store' for p in relative.parts): continue
        if src.is_symlink(): raise ValueError('Source contains a symbolic link: ' + str(relative))
        if not src.is_file(): continue
        dst = destination / relative
        for parent in (dst, *dst.parents):
            if parent == destination: break
            if parent.is_symlink() or (parent != dst and parent.exists() and not parent.is_dir()):
                conflicts.append(str(relative) + ': unsafe or non-directory parent')
                break
        else:
            raise ValueError('Destination ancestry mismatch')
        if conflicts and conflicts[-1].startswith(str(relative) + ':'): continue
        if dst.exists():
            if dst.is_file() and dst.read_bytes() == src.read_bytes(): identical.append(relative)
            else: conflicts.append(str(relative) + ': existing bytes differ')
        else: pending.append((src, dst))
    if conflicts: raise ValueError('No files copied; conflicts:\n' + '\n'.join(conflicts))
    return pending, identical

def apply(pending):
    for source, destination in pending:
        destination.parent.mkdir(parents=True, exist_ok=True)
        # Exclusive creation also protects files created after the preflight.
        with destination.open('xb') as stream:
            stream.write(source.read_bytes())

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--destination', type=Path, required=True)
    parser.add_argument('--apply', action='store_true')
    args = parser.parse_args()
    try:
        pending, identical = plan(ROOT, args.destination.expanduser().absolute())
        print(f'{len(pending)} missing files; {len(identical)} identical existing files; no conflicts')
        if args.apply:
            apply(pending)
            print('Copied missing files. Existing files and Git metadata were preserved.')
        else:
            print('Read-only plan. Add --apply to perform the copy.')
    except (OSError, ValueError) as error:
        print(error, file=sys.stderr)
        print('If a copy was interrupted, rerun the plan; identical completed files will be preserved.', file=sys.stderr)
        return 1
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
