# SP4-FOT-SEC-E31 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` as the requested helper configuration. Actual
backend model identifier and reasoning effort were unavailable for
independent verification.

**Result.** For a minimizing sequence of the unrestricted marked-cap
energy on a smooth oriented homotopy four-sphere, assume gauges on
the same smooth \(M\) give a uniformly positive subsequence converging
strongly in \(C^4\) and preserve a common nonempty open subset of
the moved round cap interiors. Then \(M\cong_{\mathrm{diff}}S^4\)
and the marked and global infima are zero. Uniform \(C^{4,\alpha}\)
bounds give the required convergence after taking a subsequence.

E25 identifies the infimum with the global infimum. Conformal
scalings and same-manifold diffeomorphisms preserve \(E_+\) here,
with orientation reversal exchanging the equal chiral energies.
For fixed smooth \(h\), compare the gauged metrics with both signs
of \(s\) in \(G_j+s h\). Passing to the limit at each fixed \(s\)
gives a two-sided variational minimum. Continuity of the first
variation and the Bach tensor at the stated grades forces the
limit to be Bach-flat. The common cap supplies a Weyl-zero open
set by \(C^2\) convergence.

Lassas–Liimatainen's analytic regularity in local conformal
harmonic coordinates gives chiral continuation as in E24. The
[derivation][proof] checks distributional covariance of the
zero obstruction equation at the finite coordinate regularity.
Signature applies on the smooth sequence and gives vanishing of
the opposite block in the limit. The finite-regularity part of
E05 yields a global \(C^{3,\beta}\) developing diffeomorphism on
\(M\), and its \(C^1\) smoothing gives a smooth diffeomorphism.

**Variant.** For a uniformly positive, \(C^4\)-precompact sequence
in the same gauges with the surviving open cap, the premise
\(\int_M|B|\,dV\to0\) replaces minimization. The conformal weight
of the covariant Bach tensor is \(u^{-2}\) for \(g\mapsto u^2g\),
so its norm weight \(u^{-4}\) cancels the volume weight. The
total norm is gauge invariant and vanishes in the limit, giving
the same recognition. Loss of the open cap leaves the analytic
continuation without its initial vanishing set. Degeneracy or
mere bounded Weyl energy leaves the metric compactness premises
unmet.

**Verification.** HEAD was `e76752648b69969b1234d0295530c87fce9fcdcb`.
All seven setup, sixteen B16, and three [B19][b19] listed SHA-256
pins matched, including E05, E24, E25 and SH-E01. The E31 request
hash was
`be7d14c47bbaaf78d1f1449a5d6e4f056f09b7a42d2cbe5e1b2f08540aed7a60`.
Primary checks used BGI+M arXiv:2508.06633v1 §1 and
Lassas–Liimatainen arXiv:1912.08030v2 Theorems 1.3(c), 2.2, 3.7(c)
and §3.2. The Gover–Šilhan tractor formulas, §3.1, eqs. (10), (13),
were cross-checked with E05. Details and source links are in
the [derivation][proof].

The conditional question is resolved. Establishing the compactness
and cap-survival premises on arbitrary \(M\) remains open. The lead
owns integration in the [SEC register][register].

[request]: SP4-FOT-SEC-E31_REQUEST_v1.md
[proof]: ../../notes/SEC_E31_20261124.md
[b19]: ../../brainstorm/notes/SEC_B19_COMPACTNESS_AND_TAUB_NUT_DOUBLE_20261124.md
[register]: ../REGISTER.md
