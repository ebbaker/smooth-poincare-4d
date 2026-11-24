# SP4-FOT-SEC-E24 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` as the requested helper configuration. Actual
backend model identifier and reasoning effort were unavailable for
independent verification.

**Result.** On a smooth closed oriented Riemannian homotopy
four-sphere, a smooth extension of a fixed ASD coordinate cap
is stationary for all exterior-supported trace-free variations
of \(E_+\) if and only if it is globally conformally round.
Signature and the curvature-operator norm give
\(\mathcal W_{(0,4)}=8E_+\). With the BGI+M Bach convention the
first variation is \(-\tfrac12\int\langle B_g,h\rangle_gdV_g\).
Testing with a cutoff times \(B_g\) forces Bach-flatness in
the exterior. Auxiliary interior variations have zero first
variation where \(W^+=0\) and force Bach-flatness in the cap.
Smoothness gives global Bach-flatness.

Lassas–Liimatainen Theorems 1.3(c), 2.2 and 3.7(c) give
local analytic determinant-normalized metrics in conformal
harmonic coordinates. The Hodge projector is analytic there,
so the identity theorem propagates the single block \(W^+\)
across each chart and throughout the connected manifold.
The full-Weyl hypothesis in their Theorem 1.4 is unnecessary
for this projected argument. Signature and SH-E01 recognize
the sphere. The [proof][proof] includes a variational comparison
with the Fefferman–Graham obstruction tensor through the
Graham–Hirachi \(Q\)-curvature formula.

**Fixed cap consequences.** A compatible globally conformally
round extension is stationary for a round cap. A genuinely
nonflat ASD cap, meaning \(W^-\ne0\) somewhere, has no smooth
stationary extension or smooth minimizer. The E07 Taub–NUT
example keeps \(E_+\ge11\pi^2/2\) under every extension.
At every nonstationary metric the supported direction
\(h=\chi B_g\) yields \(E_+(g_t)\le E_+(g)-tA_g/4\) for small
positive \(t\), where \(A_g=\int\chi|B_g|^2\,dV_g>0\) and
\(g_t=g(e^{t h^\sharp}\cdot,\cdot)\). Both the decrease
coefficient and allowed interval are metric-dependent.

**Verification.** Observed HEAD was
`e76752648b69969b1234d0295530c87fce9fcdcb`. The seven setup,
sixteen B16, and three [B17][b17] listed SHA-256 pins matched.
The request SHA-256 is
`2427d2699dff3a26d381fc21edcfa8b5225f38629866560611ccbe1696d7b58a`.
Primary passages checked on 24 November include the BGI+M
arXiv:2508.06633v1 first variation in §1 and the Lassas–Liimatainen
arXiv:1912.08030v2 Theorems 1.3(c), 1.4, 2.2, 3.7(c) and 3.8,
plus §3.2 eqs. (26)–(28). The obstruction and signature comparisons
use the checked Graham–Hirachi arXiv:math/0405068v1 §1 and Theorem
1.1 and Gover–Gursky's published signature formula, p. 294.
The source links and normalization checks are in the [proof][proof].

The fixed conditional problem is resolved. An extension
realizing stationarity for a round cap on an arbitrary \(M\),
and a uniform variational estimate, remain open. The lead
owns assessment and integration in the [SEC register][register].

[request]: SP4-FOT-SEC-E24_REQUEST_v1.md
[proof]: ../../notes/SEC_E24_20261124.md
[b17]: ../../brainstorm/notes/SEC_B17_STATIONARITY_WITH_A_RETAINED_CAP_20261124.md
[register]: ../REGISTER.md
