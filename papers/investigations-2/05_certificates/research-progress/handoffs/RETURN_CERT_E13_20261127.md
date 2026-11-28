# SP4-CERT-E13 · Original-presentation enumeration at seven

27 November 2026, for Edward B. Baker III, with OpenAI Codex assistance.
Actual launcher setting GPT-6.2 Sol, ultra. Serving details beyond that
record are unavailable. Checkout 6a422ce7814fe1ad278d6904970e3b19b05a9890.
[Frozen request](REQUEST_CERT_E13_20261127.md)

Both original signed presentations closed under the bounded HLT enumeration
of the trivial subgroup. The final signed actions agree with E12.

| Belt slope \(s\) | Status | Provisional cosets | Final cosets | Worker wall seconds | E12 identification |
| --- | --- | ---: | ---: | ---: | --- |
| \(0\) | Closed | 157 | 6 | 0.042775 | \(S_3\) |
| \(-1\) | Closed | 205 | 8 | 0.042777 | \(C_8\) |

There were exactly two runs, with one subprocess per slope, at most
20,000 provisional rows per run including the initial row, and a 60-second
subprocess limit per slope. The enumerator is the existing E02 HLT
implementation and was called with no subgroup generators.
Python 3.10.0 was used. The wrapper captured the engine's table and
coincidence parents at return, without changing its scanning rules.
It compacted the surviving representatives in ascending index order
and replaced each transition target by its surviving representative.
[Execution script](../../numerics/e13_order_seven_enumeration.py)
· [Machine-readable receipt and signed tables](../../numerics/e13_enumeration_receipt.json)

## Inputs and conventions

Native PDF text extraction confirmed the supplied 60-page
arXiv:2609.29839v2 PDF and the original relations in Remark 8.12 on
printed p. 44. The setting is the oriented three-orbifold filling of
the order-seven Whitehead model. The positive based meridians
\(a,b,c\) are those of \(J,W',\ell_A\), respectively. The old singular
meridian is \(b\) and has order two. The two ordinary fillings impose
\(a^3\lambda_J\) and \(c^s\lambda_A\), with the author's preferred
longitudes. [Author v2](https://arxiv.org/pdf/2609.29839v2#page=44)
· [Signed primary transcription](../../references/ORDER_SEVEN_V2_20261127.md)

The generator order was \(a,b,c\) and the column order
\(a,b,c,A,B,C\), with capitals denoting inverses. Each equality was
encoded as left-hand word times inverse right-hand word. The relator
order was the three printed Wirtinger equalities in their printed
order, the \(J\) filling, the belt filling, and \(b^2\). The only
preprocessing expanded the four arc words and freely reduced adjacent
inverse pairs. A separate word comparison before the run checked the
six input strings per slope. The HLT run received the original words.
The sign-marked E12 tables were loaded after both runs for comparison.

| Input | SHA-256 |
| --- | --- |
| Supplied author PDF, 2609.29839v2.pdf | 14dd1a27d2e4900ce90cf2c7c9002d934c34b19b75f67cd386e46a3d549357a6 |
| [Primary transcription](../../references/ORDER_SEVEN_V2_20261127.md) | e689bac2495b7490e938af5c7371b9ad838466b496904f8b3aee00ce91592b03 |
| [E02 HLT implementation](../../numerics/e02_e70_sweep.py) | 3e1a39796b2f0b4aa38bbfee27cb4ce44ee9b19c8caad1eb02e31ae8a40fd9c2 |
| [E12 comparison data](../../numerics/e12_signed_tables.json) | 0bf66e03cdbf5b0366288a2df26590158a569f6f9130eddc5031d2081ac272e5 |
| [E13 wrapper](../../numerics/e13_order_seven_enumeration.py) | 12ae43a64740d4cf33c6cc07c68171ba67ade83548bb8d1770943886216b683b |
| [E13 machine-readable receipt](../../numerics/e13_enumeration_receipt.json) | 96d82536b193d836c897b0a7c2474d2664a07fcda27d0392c03542a412308a15 |

## Check and evidence level

A table-only check independently read the saved JSON and literal original
words. It verified all inverse columns and every relator at every row.
Evaluating the E12 representative words from row zero yielded the rooted,
generator-preserving bijections from E12 rows to E13 rows
\((0,1,2,3,4,5)\) and \((0,3,4,6,7,1,2,5)\), respectively. This verifies
both finite transitive actions and supplies the corresponding lower
bounds. The HLT closure is a separate computational reproduction of the
orders. The E12 reversible word reductions supply exact upper bounds
independent of the enumeration. The HLT coincidence history has no
separate certificate or Lean verification.
[E12 reductions](../../notes/E12_ORDER_SEVEN_PRIMARY_REPLAY.md)
· [E12 certificate return](RETURN_CERT_E12_20261127.md)
