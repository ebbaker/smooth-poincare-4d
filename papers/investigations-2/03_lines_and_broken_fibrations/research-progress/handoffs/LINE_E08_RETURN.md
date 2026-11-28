# SP4-LINE-E08 · Bibliography-owner transfer

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex
assistance. [Frozen request r1](LINE_E08_REQUEST.md), SHA-256 prefix
`0c28fffa3b81f737c`. Dispatch was `gpt-6.2-sol` / ultra. The exact serving
variant and effort were unavailable. Repository HEAD `6a422ce7814f`.

The [proposed bibliography patch](../../references/SHARED_BIBLIOGRAPHY_20261127.patch)
adds 18 source records and revises eight existing records under their
original citation keys. It targets only `references/references.bib`.
`git apply --check` passed against canonical input SHA-256
`b8e4a31dc40480a0cc8cd546b41cd6bb1e7402b5be7a485fbe41a8806a789a79`.
The canonical file retains that hash. The patch SHA-256 is
`e677cb0b93dab5f249c82c8b22466fcbae20784b17f418a0ecf14c06f35b82fb`.
The patch is ready for the bibliography owner.

| Input and SHA-256 prefix | Added keys | Existing keys revised |
| --- | --- | --- |
| [E01](LINE_E01_RETURN.md) `087580634c2bf83a` | `Gerig2021NoHomotopySphereInvariants`, `AurouxDonaldsonKatzarkov2005SingularPencils` | `Taubes1999SelfDualHarmonic`, `Gerig2020Taming`, `Gerig2018SWGr`, `Perutz2006ZeroSets` |
| [E02](LINE_E02_RETURN.md) `3f8d5270ad69b307` | `LiLiu1995GeneralWallCrossing`, `KronheimerMrowka1994GenusProjectivePlane`, `KotschickMorganTaubes1995NonSymplectic` | `Gerig2018SWGr`, `GromovLawson1980Surgery` |
| [E03](LINE_E03_RETURN.md) `7f2aaa0ce4990beb` | `Taubes2006VanishingCircles` | `Perutz2006ZeroSets` |
| [E04](LINE_E04_RETURN.md) `8a6ac6b320283dee` | `AurouxDonaldsonKatzarkov2005SingularPencils` shared with E01, `Baykur2008ExistenceBrokenFibrations`, `Lekili2009WrinkledFibrations`, `Gay2016TrisectionsOfPencils`, `BaykurKamada2015SmallFiberGenera`, `Hayano2013CompleteGenusOne`, `Baykur2012BrokenGenera`, `GayKirby2016Trisecting`, `MeierZupan2017GenusTwoTrisections` | `GayKirby2007LefschetzType`, `BaykurSaeki2017Simplifying`, `Hayano2011GenusOne` |
| [B01](../../notes/LINE_B01_MARKED_CAP.md) `225339f11f64921d` | `Lerman1995SymplecticCuts` | |
| [E06](../../reviews/LINE_E06_PERIOD_REPLAY.md) `a56bb92269c38c1a` | `Taubes1999FredholmNearSymplectic`, also cited in B02 | E01 records carry the reused sources |
| [B02](../../brainstorm/notes/LINE_B02_LAST_CIRCLE.md) `89dd5927d39d4572e` | `Taubes1998LocalStructure`, `Chen2006EllipticSCobordisms` | |

The duplicate audit compared authors, titles, DOIs and arXiv identifiers
against the live bibliography. In particular, the Gromov–Lawson and
Gay–Kirby records were updated in place, and the second Gerig paper and the
Baykur–Saeki preprint now include journal metadata under their original
keys. Their annotations retain the first posting and identify the preprint
versions used for claims. The Perutz record retains the author's 2006
volume date and records both the 2007 masthead and inspected revision.
The Hayano complete-classification record identifies the inspected thesis
and lists the later journal counterpart in its note. The additions carry
a pointer to the [branch reference receipt](../../references/README.md).

Chen is a historical pointer to the statement of Problem 1.3 in
[arXiv v4, p. 4](https://arxiv.org/pdf/math/0403396). The separate
[Taubes local-structure paper](https://arxiv.org/abs/math/9901142v1) uses
the 1998 volume year and records the January 1999 release. The
[Taubes Fredholm paper](https://intlpress.com/site/pub/files/_fulltext/journals/ajm/1999/0003/0001/AJM-1999-0003-0001-a011.pdf)
has a verified publisher PDF and print citation. A DOI for it was
unverified. The separate Li–Liu adjunction paper remains outside this
transfer because E02 records failed access and uses no result from it.
