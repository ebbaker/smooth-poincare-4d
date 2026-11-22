# Setup and installation status

Prepared 21 November 2026, America/New_York, for Edward Baker with OpenAI assistance. Actual backend model and effort are not independently recorded. This records preparation, not mathematical review or deployment.

**Later local verification, 21 November 2026:** the current repository is
`/Users/ebbaker/Documents/smooth-poincare-4d`. Working-tree writes now succeed,
all 36 original files are represented, and the transfer/layout repairs have
been applied locally. See the [repository audit](reviews/REPOSITORY_AUDIT_20261121.md)
for checks and remaining limitations. The account below is historical; its
underscore-path installer commands are retained as provenance, not current
installation instructions. The current research tree remains uncommitted.

## Prepared contents

The setup contains all 36 substantive geometry files, a primary chiral-metric-evolution investigation and two supporting investigations, original unfinished-paper references, tailored workflows, and portable tools. The source folder was preserved. No scientific manuscript text was revised. Four imported Markdown files received link repairs, including normalization of angle-bracket URL wrappers, recorded in [IMPORT_MANIFEST.json](IMPORT_MANIFEST.json).

## Historical installation status — superseded by the audit

The intended Git repository is `/Users/ebbaker/Documents/smooth_poincare_4d`, on its existing `main` branch with origin `https://github.com/ebbaker/smooth_poincare_4d.git`. It was readable, but an attempted temporary write returned `PermissionError: [Errno 1] Operation not permitted`. No file was installed there, and nothing was committed or pushed.

The complete prepared tree is at:

`/Users/ebbaker/Documents/ChatGPT/Generalized Isothermal Coordinates/output/smooth_poincare_4d_setup`

The author's choices about supporting-branch organization and commit/push were requested but no selections were returned. Preparation uses supporting investigations and leaves Git changes uncommitted by default.

Once destination write access is available, the supplied installer checks every existing destination file before copying. It preserves identical files, refuses differing files, retains unrelated files and Git metadata, and performs no deletion, commit, push, hook installation, or permission change.

From the prepared tree (or the extracted package), inspect the plan:

```sh
python3 tools/install_setup.py --destination /Users/ebbaker/Documents/smooth_poincare_4d
```

Apply the same plan when ready:

```sh
python3 tools/install_setup.py --destination /Users/ebbaker/Documents/smooth_poincare_4d --apply
```

Then run the repository hygiene check in the destination and inspect Git status. The existing license is byte-identical and will be preserved. Published reading PDFs and generated manuscript PDFs are included locally but excluded from Git; the three original author-draft PDFs are tracked by explicit exceptions.

## Verification and limitations

- All 36 imported files match the recorded destination hashes; original scientific sources are preserved.
- Relative navigation and branch structure checks pass.
- All three manuscript sources compile successfully with the available TeX toolchain into a separate temporary verification output, preserving imported PDFs.
- Chat-tool and installer tests pass; see [tools/TOOL_PORTABILITY.md](tools/TOOL_PORTABILITY.md) for the original transfer checks. Final totals are recorded in the delivery response.
- A read-only installer preflight against the intended destination found no conflicting existing files.
- The exact current thread's source diagnostic reported `source_unavailable`; no authentic current-session capture or native hook activation is claimed. [Partial public text](chat-histories/UNREGISTERED_PARTIAL_SETUP_20261121.md) is explicitly unregistered and incomplete.
- Citation metadata was inherited; no fresh primary-source literature review or official CFF schema validation was performed during organization.

Reproduce the relevant checks from the prepared repository root:

```sh
python3 tools/check_repository_hygiene.py --verify-import
python3 -m unittest discover -s tools/tests
python3 tools/build_manuscripts.py --output-root /tmp/poincare-build-check
```

After research edits, omit `--verify-import`: it intentionally compares against the original setup snapshot.
