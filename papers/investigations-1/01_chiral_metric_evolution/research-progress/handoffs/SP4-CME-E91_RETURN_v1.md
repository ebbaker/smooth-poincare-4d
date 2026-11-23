# SP4-CME-E91 return v1 — frozen horizontal derivative test

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Frozen request][req] · [Derivation][note].

**Pass as a frozen model.** On the period-\(2\pi\) torus the
specified shear has determinant one, is a global diffeomorphism
and pulls the orthonormal reference triple back to
\(F_\theta=F_0+\theta\,da_n\). The curvature wedge Gram is positive
and equals the reference wedge Gram. With
\(u_0=e_1\), \(v=e_2\), \(r_0=S_0u_0\), the exact split is
\[
 \phi_\theta=-\theta f_n q_1/\sqrt2,\qquad
 u_\theta=u_0-\theta f_n'v,\qquad s_\theta=0 .
\]
Indeed \(S_\theta u_\theta=\Psi_\theta^*r_0\), and its difference
from \(r_0\) is the negative of \(d\phi_\theta\). The vertical
parameter has mean zero and both residual slice tests vanish.
The reference scalar operator is the positive
\((2/3)d^*d\), with constant kernel. Its weak inverse on the
mean-zero complement persists under the fixed small value change
of \(\Pi_\theta\), which proves that the displayed split is the
unique selected one.

For dyadic \(n\) at \(\theta=1\), the whole pair occupies one
frequency block and
\[
 \|(a_n,\beta_n)\|_{B^{1/2}_{8,1}}\asymp \epsilon_n n^{1/2},
 \qquad
 \|u_1-u_0\|_\infty=\epsilon_n,\qquad
 \|Du_1\|_\infty=n\epsilon_n .
\]
At \(\epsilon_n=n^{-3/4}\) the critical norm tends to zero
at order \(n^{-1/4}\), whereas both the horizontal \(C^1\) norm
and \(C^1\) difference from \(u_0\) grow at order \(n^{1/4}\).
The values and low-order Lorentz norms are small or converge
to their fixed reference sizes. The forcing one-form \(r_0\)
is fixed in all those norms. The note gives exact separate
value and Lorentz sizes.

This excludes uniform horizontal \(C^1\) control on small full
critical pair balls for this frozen solver, even with the one
fixed forcing. The flat derivative \(d\) has \(d^2=0\) on
internal sections and cannot be the adjoint derivative of a
connection of nonzero curvature \(F_0\) on \(T^4\) or \(S^4\).
The result concerns only B53's frozen differential and fiber
model. No new primary source was used. Only the note and return
were written.

| Artifact | SHA-256 |
| --- | --- |
| [Request][req] | `677de452d57050af58cc3dc14c44aa9fc10f71d7b674e0f4c9f20d962ff51636` |
| B53 | `47539a7f11b3b10a2e37e218994c4495e431fd19d1d7e4233bba9fe464bbad8f` |
| E79 | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| E53 | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |
| E88 | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| [E91 note][note] | `d566e2d9594c1ab42af2523ebd74c25b403e58fa4146a3f9e761a964a082a7f0` |

[req]: SP4-CME-E91_REQUEST_v1.md
[note]: ../../notes/91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md
