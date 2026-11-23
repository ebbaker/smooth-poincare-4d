# SP4-CME-E119 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E63, audited E41 in
E43 and audited the rough manuscript integration in E46. I did not
author E41 or E42. See the [request][req], [decision][b63] and
[derivation][note].

## Uniform scale bound

Pass on the stationary fixed E42 round pair problem. The same
fixed \(\epsilon,T,C\) give the requested weighted first and
second spatial jet bounds, linear in the initial sup norm for
the solution and quadratic for its full Taylor remainder.
The \(k=0\) estimate is included. The comparison is with
\(D_u\mathsf S(0)[u]\), which solves the fixed principal
system plus \(h_1(x,0)DW+(D_Uh_0)(x,0)W\) and has trace \(u\).

For \(\mathcal T_{r,s}\) with \(z(t)=r\eta(t/r^2)s\), any
tested cylinder meeting its time band has spatial radius at least
\(r/\sqrt2\). Lifting is therefore uniformly bounded on the
original \(X_T^\circ,Y_{0,T}^\circ,Y_{1,T}^\circ\) by the
fixed ball cover and Jacobian estimates. The density and frame
terms in the exact transformed divergence are smooth \(O(z)\).
The transformed principal flux is
\(\widetilde P_z(x,V)(DV-C_zV)\), with \(C_z=O(z)\).
The time derivative adds a value term consisting of a drift and
an endomorphism, each with coefficient \(O(|s|/r)\) on
\([r^2/2,2r^2]\).

The upper slabs meeting the band have radii between
\(r/\sqrt2\) and \(2r\). In the tents, the time length is
at most \(\min(\ell^2,2r^2)\) at cylinder radius \(\ell\).
For a coefficient bounded by \(M/r\) on the band, these give
\(Z(m)\le CM\) and \(Y(m)\le CMr\). Hölder on the upper
slab and Cauchy–Schwarz on the tent give \(Y(m\,DV)\le
CZ(m)Z(DV)\), while the speed endomorphism uses
\(Y(m)\|V\|_\infty\). The same argument applies to the
finite parameter derivatives of both speed coefficients.
This gives a perturbation of size \(C|s|\) in the
source Lipschitz constant, uniformly in \(r\).

The lift is identity near the initial time and preserves the
centered zero solution. The fixed E41 linear operators on the
completed spaces are unchanged. Uniform contraction in the original
radius-\(R\) ball and the distributional residual identity identify
the transformed fixed point \(\Psi_r\) with
\(\mathcal T_{r,s}\mathsf S(u)\) on one fixed pair of parameter and
datum balls. The Neumann inverse for \(I-D_V\Phi_r\) and uniformly
bounded source derivatives give the mixed derivatives
\(\partial_s^\alpha D_u^j\Psi_r\) through \(|\alpha|+j=4\).
At \(t=r^2\), the first and second parameter derivatives along a
field \(V_a\) give \(rD_{V_a}\) and \(r^2D_{V_a}D_{V_a}\).
Uniform spanning, polarization and the fixed curvature identity
recover the full weighted Hessian. Taylor integration in the datum
then proves both estimates with the same \(\epsilon,T,C\).

The result concerns the adjusted solution in the original fixed
completed spaces. It gives no recovery or nonlinear multiscale
trajectory estimate. No new primary source was inspected and
only the two named E119 files were written.

## Verified file identities

| File | SHA-256 |
| --- | --- |
| E119 request | `fce7d9d0dc3804e137342e7e1197412108bcb89759e865397f7dadaaf373f062` |
| B63 decision | `ab7254b83dd4c099b5953d530025e85f6325df5f664320e88eaf2d1860106a6f` |
| E41 | `8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3` |
| E42 | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| E63 | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` |
| Observed E41–E44 completed-space assessment | `cd4081efe286ebe299a911b4a79c3fe9904ec84601c9a1e6ddc0209c1fb6eb75` |
| Observed E62–E67 assessment, E63 scope | `69d4009570d50e810533fd1f37eb4cba7907690b39ce830774f109ed9053e70f` |
| E119 derivation | `4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea` |

[req]: SP4-CME-E119_REQUEST_v1.md
[b63]: ../../brainstorm/notes/B63_PARABOLIC_SCALE_NONLINEAR_REMAINDER_20261122.md
[note]: ../../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
