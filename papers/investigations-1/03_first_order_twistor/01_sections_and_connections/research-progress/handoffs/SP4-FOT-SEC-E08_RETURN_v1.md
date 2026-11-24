# SP4-FOT-SEC-E08 · Relaxed section energy · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request specifies helper routing
`gpt-6.2-sol` / `ultra`. The author-selected lead was retained.
Actual backend model identifiers and reasoning effort for the helper
and lead were unavailable for independent verification.

[Request v1](SP4-FOT-SEC-E08_REQUEST_v1.md) · [Owning register](../REGISTER.md) ·
[Derivation and source passages](../../notes/SEC_E08_20261124.md)

**Completed, pending lead assessment.** For every supplied smooth
real Riemannian metric \(g\) on a smooth closed oriented four-manifold,
the SEC-B07 relaxation over independent orthonormal positive triples,
finite covers and smooth subordinate weights satisfies
\(I(g)\le 8E_+(g)\). The constant uses full Hermitian Frobenius tensor
norms and the Hilbert–Schmidt norm of \(W^+\) as a curvature operator.
The infimum for the separate undifferentiated density
\(\sum_i|F_i|_g^4\) is zero for every such fixed metric.

At an arbitrary center \(p\), the prescribed conformal two-jet makes
the auxiliary \(h\) Ricci-flat at \(p\) and matches the first \(g\)-jet.
Radial parallel transport gives \(A(p)=0\) and
\(\partial_aA_b(p)=\Omega_{ab}(p)/2\). Only \(W_h^+(p)=W_g^+(p)\)
acts in \(\Omega(p)\). The full Frobenius tensor is the same for both
metrics, so its first covariant derivative transfers at \(p\) using
the common metric and connection values. The resulting triple has
\(F_i(p)=\nabla^gJ_i(p)=0\) and
\(\sum_i|\nabla^gF_i|_g^2(p)\le 8|W_g^+|_{\mathrm{HS}}^2(p)\).
Continuity and a finite smooth partition of unity give arbitrarily
small additive error with radii depending on \(g\), the center and
the tolerance.

Observed HEAD `e76752648b69969b1234d0295530c87fce9fcdcb` and all nine
frozen digests matched. The derivation identifies the inspected AHS,
Fefferman–Graham, Gover–Gursky and Gover–Hill–Nurowski passages and the
working-file identities for the request and decisions. The upper bound
uses a supplied fixed smooth metric and the unrestricted refinement and
weighting in SEC-B07. Attainment, the separate lower-bound question
and the variable-metric existence problem remain outside this packet.
