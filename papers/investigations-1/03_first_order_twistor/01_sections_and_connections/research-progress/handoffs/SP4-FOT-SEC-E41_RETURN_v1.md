# SP4-FOT-SEC-E41 return v1 · Exterior mixed derivative

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [frozen request][request] records
`gpt-6.2-sol` / `ultra` helper configuration. Actual backend model and
reasoning effort were unavailable for independent verification.
The author-selected lead settings were retained.

**Pass.** For the E27 smooth positive Riemannian reference with
the protected round cap, the [proof note][note] constructs one smooth
trace-free \(v\) compactly supported in the true exterior and
\(m=\dim\mathcal C\) exact old kernel tensors \(k_j\). The compared
perturbation \(r_a=r\exp(av)\) preserves the fixed density. The
real \(m\times m\) matrix \(\langle Z_i,A'_0k_j\rangle_{L^2(r)}\) is
invertible for a sufficiently large single finite frequency \(N\).
The zero-dimensional case is vacuous.

The exterior restriction from E27 supplies independent scalar
fiber evaluations. Shrinking and separating the probes retains
their independence for the moment matrix
\(D_{ij}=\int b_jd_j\langle Z_i,Y_j\rangle_r\,dV_r\).
With the real symbol convention \(\partial\mapsto\xi\), the cosine
metric perturbation gives \(Y_j=-\sigma_{d\phi_j}(L)H_j\).
Transport contributes \(-D/2\) after integration by parts and
oscillatory averaging, and half-divergence contributes \(D/4\).
The longitudinal skew symbol vanishes. Symmetric frame and connection
variations have vanishing errors, and the moving metric gauge input
inside \(L\) pairs to zero exactly. The kernel projection correction
is \(o(1)\) by weak oscillation, compactness of \(Q=L^*G_P\) on
\(L^2\), and the uniform \(C^2\)-based bound for
\((A'_{0,N})^*Z_i\). The exact projected matrix tends to \(-D/4\).

All four requested hashes and the B24 pin for the direct E02
dependency matched at HEAD `e76752648b69969b1234d0295530c87fce9fcdcb`.
The proof note SHA-256 is
`d189a283f012caa481ba34c518f668bb27914c89387e411c5e8b6ca4de9acbbd`.
The verified inputs and primary passages are recorded in the note.
The proof uses the old finite adjoint space throughout. Its finite
rank conclusion supplies the geometric hypothesis tested by E40.
Quantitative control of a finite radial chord and global continuation
remain outside this calculation. The lead owns integration in the
[sole register][register].

[request]: SP4-FOT-SEC-E41_REQUEST_v1.md
[note]: ../../notes/SEC_E41_20261124.md
[register]: ../REGISTER.md
