# SP4-FOT-SEC-E09 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request specifies gpt-6.2-sol / ultra
for helper execution. The backend model and effort are unavailable
for independent verification. The author-selected lead was retained,
with actual identifier and effort unavailable here.
[Request v1](SP4-FOT-SEC-E09_REQUEST_v1.md)

**Completed the bounded index test.** On every smooth closed oriented
Riemannian homotopy four-sphere the augmented map \((\delta_r,L_r)\) has
index \(-15\), where \(L_r\) is the Weyl derivative in the B01 fixed-volume
chart. On the fixed TT slice it has index
\(\kappa_r-15\), where \(\kappa_r=\dim\ker K_r\). The Weyl target range
is closed and has codimension
\(15-\kappa_r+\dim\ker(L_r|_{\operatorname{TT}_r})\). These statements
hold in the requested Sobolev and Hölder scales. [Derivation](../../notes/SEC_E09_20261124.md)

The even-to-odd ASD symbol index is \((15\chi+29\tau)/2\). The
augmented map has the opposite parity. The characteristic calculation
uses the universal exact equivariant symbol and applies directly
to the oriented tangent bundle of the supplied \(M\), including when
\(W_r^+\ne0\). The divergence range is \((\ker K_r)^\perp\). A bounded
right inverse permits a triangular target operation whose off-diagonal
term includes \(L_rK_r\), which can be nonzero off ASD.
[Gover–Gursky v1, §1.1, (1.8)–(1.9) and index display](https://arxiv.org/html/2307.12432v1#S1.SS1) ·
[Atiyah–Singer III, §2, (2.13), (2.15)–(2.17)](https://math.uchicago.edu/~shmuel/tom-readings/AS%20III.pdf)

The round derivative is an isomorphism on the fixed TT slice.
The conditional class \(\kappa_r=0\) has cokernel dimension at least
15. The conformal Killing jet bound gives \(\kappa_r\le15\), with
equality forcing \(W_r^+=0\), so full-target surjectivity fails at every
off-ASD reference. Return the all-target openness premise to
[B08](../../brainstorm/notes/SEC_B08_FREDHOLM_BALANCE_20261124.md).
The radial argument would still need to show
\(-\mathcal W_r(0)\in\operatorname{ran}(L_r|_{\operatorname{TT}_r})\) for
a differentiable start. Solvability for that forcing and subsequent
continuation are unresolved. No genericity theorem is needed.

Observed HEAD e76752648b69969b1234d0295530c87fce9fcdcb matched the frozen
baseline. All seven setup crosswalk pins and both SH-B01 and SH-E01 pins
matched. The derivation records the checked B01/B06 and B08 versions.
The source checks concern the stated passages. The evidence is exact
linear and topological analysis at a supplied smooth reference.
