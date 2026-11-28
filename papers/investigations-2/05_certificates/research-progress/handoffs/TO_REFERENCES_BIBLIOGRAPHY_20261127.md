# To the shared bibliography owner · checked patch sequence

27 November 2026 for Edward B. Baker III, from the SP4-CERT lead on 6a422ce plus the live source-owner handoffs. Apply the following diffs once, in order, to the canonical references/references.bib with baseline SHA-256 prefix `b8e4a31dc40480a0`. They edit a single bibliography. The root write stays with its owner under the author’s restriction to investigation 05.

| Step | Source records and provenance | Result |
| --- | --- | --- |
| 1. [Consolidated patch](../../references/SHARED_BIBLIOGRAPHY_20261127.patch) | 01–04 and early CERT readings. Reconciles ADK and Taubes aliases and retains precisely which versions were read. [E08 receipt](RETURN_CERT_E08_20261127.md) | 388 keys |
| 2. [Prism supplement](../../references/PRISM_SOURCE_ADDENDUM_20261127.patch) | Teragaito’s theorem, PL category and corrected last page, plus Smale (1959), Thm A, and Mecchia–Seppi §3, Fig. 4. SHA-256 prefix `31a6a9434f88a3e0`. | 390 keys |
| 3. [Candidate supplement](../../references/CANDIDATE_SOURCE_ADDENDUM_20261127.patch) | Includes the full 06 bibliography handoff with four additional passage receipts. This step already includes 06’s own patch. [E11 receipt](RETURN_CERT_E11_20261127.md) | 402 keys |
| 4. [Original order-seven reading](../../references/ORDER_SEVEN_SOURCE_ADDENDUM_20261127.patch) | Updates the Jabłonowski key with the original HTML, corresponding PDF pages, theorem numbers and signed clasp figures. SHA-256 prefix `cec8ad3b2ba9a6ac`. | 402 keys |

**Certificate for the handoff.** All four diffs passed git apply --check and applied sequentially to a fresh copy of the canonical input, with whitespace errors enabled. BibTeX resolved all 402 keys using the plain style. The two original empty-publisher warnings remained. The resulting bibliography has SHA-256 `83f00c6b342bf5e5bc3291e34ba00ef0a5e212bcbf52c8a7bc196973c3bffd04`. Canonical adoption is pending. [Inspection record](../../references/README.md)
