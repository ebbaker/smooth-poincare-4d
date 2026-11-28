# SP4-CERT-E08 · Shared bibliography collation

27 November 2026, for Edward B. Baker III, with OpenAI Codex assistance.
Actual helper launch configuration GPT-6.2 Sol, ultra. Exact-file
execution on 6a422ce7814fe1ad278d6904970e3b19b05a9890.
[Frozen request](REQUEST_CERT_E08_20261127.md)

The [single unified diff](../../references/SHARED_BIBLIOGRAPHY_20261127.patch)
targets the canonical bibliography at SHA-256 prefix
b8e4a31dc40480a0. Its SHA-256 is
7d03873c15935553139ebe83f179a233c699ad5fc983c7af76cd250be6f2caed.
It adds 40 entries, revises 20 entry bodies, and adds provenance comments
to nine further existing entries. Application to the canonical bibliography
is pending its owner's action. [Canonical bibliography](../../../../../references/references.bib)

## Read versions

Two snapshots were taken. The first located the POLE and ZERO handoffs,
LINE's intake and linked shared patch, and ENT's import handoff. The
second included ENT's newly available bibliography handoff and patch.
There was no TO_05 or TO_CERT source handoff from investigation 06
in either snapshot.

| Owner | Input at second snapshot, SHA-256 prefixes | Records carried forward |
| --- | --- | --- |
| 01 POLE | [Bibliography handoff](../../../01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_05_BIBLIOGRAPHY_20261127.md) 291869be6fc72979 and [primary receipt](../../../01_chiral_transfer_and_pole_forms/references/README.md) 29ab03d03b85f08f | Lockhart–McOwen's journal theorem and lemma, the relative Gromov passages, Donaldson–Sullivan, the Iwaniec–Martin comparison, the two Perutz sources, ADK, Lalonde–McDuff and Taubes. The companion algebra handoff supplies project statements and requests no additional bibliography change. |
| 02 ZERO | [Handoff](../../../02_zero_circles/research-progress/handoffs/TO_05_BIBLIOGRAPHY_20261127.md) 787dbaeb5ab82e58, [patch](../../../02_zero_circles/references/BIBLIOGRAPHY_20261127.patch) 6634673338a98353 and [E03 receipt](../../../02_zero_circles/research-progress/handoffs/RETURN_E03.md) 4af4e165f73ea3a5 | Talenti's published Sobolev passages, Honda's January 2004 revision, published LeBrun, and journal passages for Perutz and both shared Taubes records. |
| 03 LINE | [CERT intake](../../../03_lines_and_broken_fibrations/research-progress/handoffs/TO_CERT_IMPORTS_20261127.md) c96cce78a06b9d64, [owner handoff](../../../03_lines_and_broken_fibrations/research-progress/handoffs/TO_REFERENCES_PRIMARY_READINGS_20261127.md) aec05bb45d82fb19 and [patch](../../../03_lines_and_broken_fibrations/references/SHARED_BIBLIOGRAPHY_20261127.patch) e677cb0b93dab5f2 | Published and arXiv readings retain their versions. The Gerig sequel preserves the v2 reading and carries the journal publication data separately. The Hayano thesis is a separate source with its journal counterpart noted. |
| 04 ENT | [Import return](../../../04_entropy_of_embeddings/research-progress/handoffs/TO_05_ENTROPY_IMPORTS_20261127.md) 8820bc3cfff2064c, [bibliography handoff](../../../04_entropy_of_embeddings/research-progress/handoffs/TO_05_ENTROPY_BIBLIOGRAPHY_20261127.md) 662f4e67c962df7f, [patch](../../../04_entropy_of_embeddings/research-progress/handoffs/ENT_SHARED_REFERENCES_20261127.patch) 8126dd22ca7b8b76 and [E01 reading](../../../04_entropy_of_embeddings/research-progress/handoffs/E01_FLOW_RETURN.md) ad12a189ed8e5ba2 | The existing CMS key preserves arXiv v2, the accepted-manuscript comparison and the verified 2025 journal metadata. Daniels–Holgate and Haslhofer–Kleiner preserve the checked copies and exact passages. The smooth-topology and entropy records distinguish the two Smale 1961 articles and the separate Bernstein–Wang papers. ENT-E04 descriptive and abstract-only readings keep their scope. |
| CERT | [E01](../../notes/E01_ORDER_SEVEN_COMPARISON.md) 9727ed40f09131b8, [E04](RETURN_CERT_E04_20261127.md) 91b2a166a5e9b9b0, [E06](../../notes/E06_PRESENTATION_HANDLES.md) 0718114604f51a00 and [ledger](../../notes/IMPORT_LEDGER.md) 79e1c239fd1b88c7 | Galaz-García–Searle §3.2, Theorem 3.2, p. 1404, and Freedman §1, Theorem 1.6, p. 371, were checked in the journal texts. Miller–Schupp Theorem 1, Shehper et al. arXiv v2 §3.3, Gabai arXiv v2 Remark 13.5(ii) and Problem 13.6, and Gay–Kirby published §4.1 and Lemma 4.7 are recorded. The lead supplied the additional check of Gay–Kirby Remark 4.9 and Gabai–Naylor–Schwartz Definition 3.3 and Lemma 3.4 in the author-hosted PDF. The latter's separate journal metadata have DOI 10.1016/j.aim.2025.110455. |

## Overlaps and open readings

- ADK's two proposed keys have DOI 10.2140/gt.2005.9.1043 and arXiv
  math/0410332. The diff uses
  AurouxDonaldsonKatzarkov2005SingularPencils, the LINE proposal, and
  carries POLE's Definition 1, Proposition 1 and §7.2 alongside LINE's
  checked passages. The POLE alias has no existing canonical citation to
  migrate.
- Perutz's existing journal entry keeps bibliographic year 2006, the
  2007 PDF masthead and v2 date. It records LINE's journal and version
  comparison, ZERO's checked journal passages and POLE's inspected
  v2 definition and lemma.
- Taubes 2006 has one record by DOI, with LINE's Proposition 2.1 and
  opening of §3, POLE's Part 5 and ZERO's equations (2.2)–(2.16).
  Taubes 1999 preserves the journal and v1 reading and adds ZERO's
  journal §2(c), pp. 172–173. Gay–Kirby keeps both the LINE arXiv v1
  reading and CERT's published reading.
- Jabłonowski's earlier reader extraction ended in §5. The original
  v2 §§7–8 and Figure 1 were inaccessible to CERT-E01. The rewritten
  passage locator and conditional algebra do not raise this receipt to
  a primary reading. Direct inspection of McDuff–Salamon Theorem 9.4.2,
  Kuiper's original comparison and the original Fintushel and Pao
  texts is still outstanding for CERT. CMS's journal publication
  metadata were verified and the full journal text was unavailable.

## Validation

**Certificate for bibliographic integrity.** Each supplied owner patch
passed its own scratch applicability check. The combined diff passed
git apply --check with whitespace errors enabled, applied in a fresh
scratch Git tree and reproduced the expected file byte for byte. The
diff has 16 hunks for references/references.bib. The live canonical
file matched the input snapshot.

BibTeX 0.99d in TeX Live 2023 resolved all 348 original and 388 patched
entries with the plain style and a whole-database citation. Both builds
reported the same two pre-existing empty-publisher warnings for
Fine2011OberwolfachAbstract and MillerSchupp1999TrivialGroup. All
original keys and their supplied DOIs and arXiv identifiers were
retained. Exact key checks (including case folding), DOI and arXiv
identifier checks, and normalized-title comparisons of new records
found no duplicate additions. These checks establish file and
citation integrity for this diff.
