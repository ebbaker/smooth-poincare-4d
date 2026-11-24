# SP4-FOT-SEC-E30 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The author-selected lead was retained.
The [request][request] specifies gpt-6.2-sol / ultra for the helper.
Actual backend model identifiers and efforts for helper and lead were
unavailable for independent verification.

The fixed cutoff of a smooth metric in normal coordinates makes the
radius-\(\varepsilon\) ball exactly flat and restores the original
metric at radius \(2\varepsilon\). On the transition,
\(D^j(g_\varepsilon-\delta)=O(\varepsilon^{2-j})\) for \(0\le j\le4\).
Thus the curvature is bounded and its first two covariant derivatives
are \(O(\varepsilon^{-1})\) and \(O(\varepsilon^{-2})\).
The Bach tensor is \(O(\varepsilon^{-2})\), and integration on the
modified region gives absolute changes \(O(\varepsilon^4)\) in \(E_+\)
and \(O(\varepsilon^2)\) in \(\int|B|\,dV\). [Derivation][note]

In dimension four the covariant Bach tensor has conformal weight
\(-2\), its norm has weight \(-4\), and the volume weight \(+4\)
cancels it pointwise. The sign is the convention in
[BGI+M, equation (1.1) and §1][bgim], in which the full Weyl energy
has gradient \(-4B\). The [E25 marking][e25] installs the exact
preassigned round cap on the original manifold, preserving both
integrals. The final metric can agree with the original outside
the extended marked chart. The shrinking support statement after
marking is relative to the same pulled-back and conformally
rescaled original metric.

The constants and admissible radii can be chosen uniformly on a
common fixed normal-coordinate germ. Agreement only on possibly
shrinking neighborhoods suffices if the replacement radius is
chosen within each agreement neighborhood. The proof needs no
scalar sign or global compactness assumption.

Observed HEAD e76752648b69969b1234d0295530c87fce9fcdcb. All 26 B19,
B16 and setup pins matched. The note records the additional B19
and request hashes and the primary passage inspected. Returned
to B19 for assessment. The cost estimate is independent of the
double construction and uses no numerical execution.

[request]: SP4-FOT-SEC-E30_REQUEST_v1.md
[note]: ../../notes/SEC_E30_20261124.md
[e25]: ../../notes/SEC_E25_20261124.md
[bgim]: https://arxiv.org/pdf/2508.06633
