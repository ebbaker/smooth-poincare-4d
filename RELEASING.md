# Release workflow

No release, public manuscript acceptance or archival integration is established
by repository setup. A release requires an explicit maintainer instruction.
The current working documents retain their stated research status.

Before a release:

1. Identify exactly which manuscripts are released and which remain working
   drafts. Update their status statements, branch `DRAFT_HISTORY.md`, root
   navigation and citation metadata consistently. Preserve limitations and
   distinguish inherited results from checked additions.
2. Complete the stated scientific review for the intended claims. Record
   reviewers, source versions, shared premises and unresolved items. Successful
   builds and tool tests are not a mathematical release gate by themselves.
3. Run the tool tests, hygiene checks and manuscript builds. Inspect the PDFs
   and ensure they match the intended editable sources. Check citation files
   with `tools/check_citations.py` using a supplied official schema as its help
   describes. No placeholder DOI or invented release date is permitted.
4. Inspect tracked files, ignored inputs, history sizes and public chat records.
   Exclude third-party PDFs, raw exports, private data and regenerable large
   outputs. Confirm every external dependency has a versioned source or a
   complete regeneration/provenance guide under [LARGE_FILES.md](LARGE_FILES.md).
5. Prepare a changelog entry and explicit release notes naming the scientific
   scope, validation and remaining draft material. After maintainer authorization,
   create the intended tag/release. Publishing or announcing is a separate
   external action and is never implied by writing these files.

If a DOI archive is later configured, verify the integration and resulting
record rather than assuming that a Git tag creates a deposit. Record actual
version and concept identifiers only after issuance. A source-tree archive may
not include ignored PDFs or separately uploaded release assets: check its real
contents and deposit the intended manuscript separately where necessary.

Use repository versions independently of manuscript versions and record both
when citing them. Preserve the existing [license](LICENSE.txt); do not apply
its terms to third-party reference material.
