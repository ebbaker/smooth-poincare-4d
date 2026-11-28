# SP4-TWA-E03 return · Fixed zeros and compatible first jets

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. [Request v1](E03_REQUEST_v1.md) records the
author-selected GPT-6.2 Astra/ultra lead and individually configured
GPT-6.2 Sol/ultra helper. Actual backend serving variant and reasoning
effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`,
and all eight frozen input SHA-256 digests matched at input inspection.

**Disposition.** Completed the derivation in
[E03_FIXED_JETS.md](../../notes/E03_FIXED_JETS.md). For a jointly smooth
compact parameter family with the same prescribed transverse zero and
nonzero Clifford first jet, both the action density and its parameter
derivative are uniformly bounded there. The bulk adjoint paired with
the tangent variation is \(O(1)\). The shrinking-sphere flux in the
normal \(-\partial_r\) is \(O(r^4)\) in absolute value. Dominated
convergence and excision give the E01 variation formula on the punctured
ball with the original exterior boundary momentum. Disjoint balls
give the formula for any finite set of such interior zeros. The explicit
transverse jet with one Clifford direction doubled has infinite action
by logarithmic divergence.

Rechecked the E01 formula, the DIR-E06 and DIR-E07 fixed-jet antecedents,
and Friedrich's §1, equation (1.1), in the digitized published copy.
The local estimates and excision argument are established in the note.
E03 supplies the fixed-jet class for B01.
[Primary source](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

## E01 typography erratum

The repository hygiene checker reads four derivative expressions in
[E01_VARIATION.md](../../notes/E01_VARIATION.md) as Markdown links because
the argument in square brackets is followed immediately by a
parenthesized list of directions. For any future revision, read them
as follows, with the base field in parentheses and the directions in
square brackets.

| Frozen line | Equivalent notation |
| --- | --- |
| 46, 61 | \(DS_g(\psi)[\eta]\) |
| 157 | \(D^2S_g(\psi)[\eta,\zeta]\) |
| 190 | \(D^4S_g(\psi_0)[\eta_1,\eta_2,\eta_3,\eta_4]\) |

This typographic correction keeps the frozen E01 digests available for
downstream packets.
