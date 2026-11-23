# SP4-CME-E122 return v1 — uniform parabolic remainder audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I authored E41, audited E42 conditional on E41 in E44
and audited E63's fixed-strip step in E67. I did not author E119,
E42 or E63. This checks the new scale-uniform inference.
[Request][req] · [Audit][audit].

## Disposition

Pass in the actual fixed E42 completed spaces. For the parabolic
lift \(z(t)=r\eta(t/r^2)s\), the divergence sign and frame terms
give \(B_{z,j}=(\partial_j\log m_z)I-C_{z,j}\), and the principal
flux has the two inverse Jacobians exactly as claimed. The extra
speed is a positive value-source drift plus endomorphism, of size
\(O(|s|/r)\) on the band. Small and large upper slabs miss that band,
and comparable upper slabs give the asserted bounds. In tents,
including the larger ones, the band contributes time length at
most \(2r^2\). Thus each speed coefficient with amplitude \(M/r\)
gives \(Z\le CM\) and \(Y\le CMr\). Uniform transport bounds hold
on the same solution and source completions by spatial covering
and fixed-density change of variables. No time-derivative norm
of the lift is used.

The transformed source perturbation is uniformly \(O(|s|)\)
as a Lipschitz map. The original E42 margin, stationary zero,
unchanged initial trace and one fixed datum radius give contraction
in the original ball. The exact transformed residual identity and
the E42 zero-trace linear energy argument identify the lifted
solution with that transformed fixed point. The uniform inverse
of \(I-D_V\Phi_r\) and bounded source derivatives yield all mixed
fixed-point derivatives through total order four, including two
parameter and two datum derivatives. Neither compactness of
initial data nor behavior at \(r=0\) is needed.

The transported directional jets at \(t=r^2\) recover the weighted
first and second covariant jets by uniform spanning, a fixed
Levi–Civita correction, polarization and the fixed pair-bundle
curvature action. Thus the full ordered Hessian is controlled.
The datum Taylor subtraction includes \(h_1(x,0)DW+
(D_Uh_0)(x,0)W\) along with \(LW\). For one fixed datum ball and
all \(0<t\le T/4\), the weighted solution and full Taylor remainder
through order two are respectively \(O(\|u\|_\infty)\) and
\(O(\|u\|_\infty^2)\), independently of initial derivatives.
This audit concerns the adjusted pair only. E121 was consulted for
method attribution and is not a proof premise. No new primary
source, shared edit, build or nonlinear multiscale implication.

## File identities

| Input or output | SHA-256 |
| --- | --- |
| [E122 request][req] | 4cf7f66fe689e74d8d4e2a750f26264e25cad329a0d8e6debc73ee7b2b5ffbd3 |
| [E119 request][req119] | fce7d9d0dc3804e137342e7e1197412108bcb89759e865397f7dadaaf373f062 |
| [E119 return][ret119] | 49fa30409a59f3bdf40d7b094672e65a98e85d83e33485a79f46250a36019b39 |
| [B63][b63] | ab7254b83dd4c099b5953d530025e85f6325df5f664320e88eaf2d1860106a6f |
| [E119][e119] | 4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea |
| [E41][e41] | 8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3 |
| [E42][e42] | 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77 |
| [E63][e63] | 427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb |
| [E121][e121] | 2f628e07e312b1d902636d666729197f6666bf352d3de5e3505e99e52ce821e4 |
| [E122 audit][audit] | d60a910e0007d4e469ffae84bea67d0153556da11461d9d05466d079cdd70ac7 |

[req]: SP4-CME-E122_REQUEST_v1.md
[req119]: SP4-CME-E119_REQUEST_v1.md
[ret119]: SP4-CME-E119_RETURN_v1.md
[b63]: ../../brainstorm/notes/B63_PARABOLIC_SCALE_NONLINEAR_REMAINDER_20261122.md
[e119]: ../../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[e41]: ../../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: ../../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e63]: ../../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e121]: ../../reviews/E121_ROUGH_DERIVATIVE_SOURCE_AUDIT_20261122.md
[audit]: ../../reviews/E122_UNIFORM_PARABOLIC_REMAINDER_AUDIT_20261122.md
