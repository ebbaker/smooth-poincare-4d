# SP4-CME-E152 return v1 — Determinant-normalized trace principal test

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E execution under B76, configured
gpt-6.2-sol / ultra. Independent helper runtime attestation and
actual lead identifiers are unavailable. The executor authored
E02A, E08 and E11 and used the inherited E149 source comparison.
[Request][req] · [Derivation][note].

## Result

The determinant-normalized trace fails the E11 purely scalar
pointwise principal closure test. For
\(p=(\det Q)^{-1/3}\), \(\widetilde Q=pQ\),
\(m=\operatorname{tr}(Q^{-1})/3\) and trace-three positive \(Q\),
\[
 \det\widetilde Q=1,\quad f=\operatorname{tr}\widetilde Q-3,
 \quad G=p(mI-Q^{-1}),\quad
 D^2 f(I)[X,Y]=\operatorname{tr}(XY),\quad
 \mathscr L_QG=4p(Q-I).
\]
Along \(Q_\varepsilon=\operatorname{diag}(1+\varepsilon,1,1-\varepsilon)\)
with \(0<\varepsilon<1\),
\(G_{22}=2p\varepsilon^2/[3(1-\varepsilon^2)]>0\) while
\((\mathscr L_QG)_{22}=0\) and \(\mathscr L_QG\ne0\).
The perpendicular projection onto \(G^\perp\) is
\(Y=4p\varepsilon^2(\varepsilon D+3N)/(3+\varepsilon^2)\)
with \(D=\operatorname{diag}(1,0,-1)\), \(N=(D^2)_0\).
Its squared norm is \(32p^2\varepsilon^4/(3+\varepsilon^2)\).

Fix positive small \(\varepsilon\) in E11's local construction.
The inherited compatible polynomial with cubic parameter
\(H=-\sqrt{\det Q_*}(Q_*-I)/2-G+LY\) gives the fixed scalar
two-jet \(f(Q_*),\,0,\,-|G|^2g_{\rm eucl}\) at a strict local
maximum, at the same curvature and metric lower jets, for
all finite \(L>0\). The actual unadjusted derivative (4) of the
derivation increases without bound with \(L\). In the old chart
\(K=1\); the native conversion \(g=2K\widehat g,\ \tau=2Kt\)
halves that derivative and preserves its sign and the strict
local maximum.

This rules out the specified transplant of the **trace maximum
step** (3.10) from Fine–Yao's Theorem 4.7 proof to this scalar
pointwise argument for the connection flow. The source has a
determinant-one Gram matrix of individually closed two-forms and
a different evolution, with seven-dimensional \(G_2\) torsion
in its continuation hypothesis. The E149 comparison also
distinguishes the separate derivative inequality (3.11) and
Theorem 4.10's near-orthogonal triple hypothesis. The local test
does not imply a global maximum or failure of closed-manifold
forward invariance. Other spectral, tensor, integrated and
nonlocal mechanisms are outside its scope. No fresh primary
inspection or numerical experiment entered. [Canonical R26][r26].

## Verified identities

| File | SHA-256 |
| --- | --- |
| E152 request | 680c73bb64f69a32f04575bc7a60c1dd47177020de84c559fb32e16b0b3dc7b0 |
| B76 decision | 92ffe6430e6a73324694e148d4145151f6a7face69fe8b83127b7cc5d407f5f9 |
| E11 current derivation | 91f87b6d5655cd03ec0ac1f4a692df05a2848a873406feb41938a542ccdb0ae7 |
| E08 derivation | 2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06 |
| E02A derivation | 4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19 |
| E08–E13 assessment | 3a781d31480ebcc439a39d85ac18199ab71b30ea0c772636da4f882e0870f688 |
| E149 assessment | 7d60c020d45716ea09bea79c100bb49c30a6fb091c48879aff42c78ad9895309 |
| E149 comparison | fe964ab3ceb115cb6b1b47f2039e0e4bf392ca7e9077a0d19cd2edbcf592914f |
| Inherited E11 typesetting correction record | 2ae8b3a5ce147f84aa879580f01ae62b3ef122cc2ff73bde1ce5d4adea49d807 |
| Inherited canonical R26/R27 comparison record | a337cc91dc24e328eb77da95146111f292da33478868f7139c416fb165e2bd3a |
| E152 derivation | d860eb8260834bd65283e727a3574c8580a4b7890bfc1b9d87075fd82672e5d4 |

The E08–E13 assessment identifies the historical E11 digest
\(2b06\ldots\). The typesetting correction record supplies the
exact crosswalk to the frozen \(91f8\ldots\) without a mathematical
change. Only the assigned note and return were written.

[req]: SP4-CME-E152_REQUEST_v1.md
[note]: ../../notes/152_DETERMINANT_NORMALIZED_TRACE_TEST_20261122.md
[r26]: ../../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md

