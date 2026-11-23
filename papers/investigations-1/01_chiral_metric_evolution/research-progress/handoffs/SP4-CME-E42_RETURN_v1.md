# SP4-CME-E42 return v1 — small continuous values and compatible limits

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Request v1][req] · [Derivation][note].

## Contraction and regularity

Conditional on the two E41 estimates for the fixed reference operator,
the independent system has a common-time mild and distributional
solution for globally \(C^0\)-small continuous pair data.
The solution is unique in the specified small ball of the smooth
\(X_T\) completion, has a strong uniform trace, and satisfies the
Lipschitz estimate (7). The nonlinear source size and difference bounds
include the \(T\)-weighted inhomogeneity, \(\sqrt T\)-weighted linear
gradient forcing, two-gradient product and the value-dependent
divergence term. The cutoff agrees with the actual system throughout
the solution's value tube.

Positive-time smoothness and smooth convergence on interior strips
follow from a compact-bundle adaptation of the Koch–Lamm spatial
parameter argument. The lifted flow fixes the initial slice, the
transformed equations contract uniformly, and linear energy uniqueness
identifies the pullback with the parameterized fixed point. No
additional nonlinear smoothing premise is needed in this class.

## Compatibility passage

For compatible continuous data, E38 provides approximating smooth
connections with uniform convergence of their curvatures. Each
approximating fixed point agrees initially with the curvature lift of a
smooth local E29 connection solution with the same fixed reference.
The principal coefficient's dependence on \(A,F_A\) gives the symbol
margin for this application even when the full initial gradient is
large. The individual classical lifespans may depend on the approximant.
E36 propagates the exact constraint along the smooth positive-time
approximating fixed points on the common contraction interval.
Uniform convergence of both entries gives distributional curvature
closure at every slice and smooth compatibility at positive time.

The conclusion is the fixed-reference adjusted evolution under the
linear premise. It gives no arbitrary-size data result, reverse gauge
endpoint control, unadjusted restart or global result.

## Versions and sources

| Frozen input or output | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B33_COMPACT_ROUGH_SYSTEM_20261122.md` | `fd2f7557e141a15479daecbdd331ddec0207ca5be035bfa8180db24b6d9cb734` |
| `notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md` | `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a` |
| `notes/37_ROUGH_DATA_SOURCE_TEST_20261122.md` | `de2c9c2887a6df86d32c0c40f8ae2ce8da6bfc16a7c2a0158a2c3a8862ed424d` |
| `notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md` | `cbc7dc854602fe2271503663900e35d2ad874116ccb1871ec4bbccdb802e73c7` |
| `notes/29_LOCAL_PARABOLIC_INPUT_20261122.md` | `f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5` |
| `research-progress/handoffs/SP4-CME-E41_REQUEST_v1.md` | `b431ac9d4b3d14ab3651b78cc995bd87a9d1fc0f795725067f6e18bd180743c1` |
| `research-progress/handoffs/SP4-CME-E42_REQUEST_v1.md` | `6515c97735c519803c08cc0bad5c8d0a062fdf2a455e42fab7f51d58241fd597` |
| `notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md` | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |

E41 returned during this packet. Its [note][e41] at SHA-256
`8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3`
and [return][e41ret] at SHA-256
`20b8bcda52ee8f32025f4fd4edbc25296dd9575b1f99d39cdc1e2842b831d8ff`
state the exact bounds and smooth forcing completion used in E42.
E42 retains the linear premise and leaves proof assessment of E41 to the lead.

Remote primary inspection on 22 November 2026 covered Herbert Koch and
Tobias Lamm, *Parabolic equations with rough data*, arXiv:1310.3658v1
(14 October 2013), Theorem 1.1 and §§2–4, with the parameter step in
§§2–3 and the investigation's own scaled norms. The publication is
*Mathematica Bohemica* **140**(4), 457–477 (2015),
DOI 10.21136/MB.2015.144463 per E40. Taylor's *Pseudodifferential
Operators and Nonlinear PDE*, Birkhäuser Boston, Progress in
Mathematics **100** (1991), DOI 10.1007/978-1-4612-0431-2,
was checked in the undated author-hosted version at (7.3.1)–(7.3.2),
printed p. 147, and Proposition 7.3.A, printed p. 149, for the
strongly parabolic smooth-data proof localized on the bundle in E29.
These are existing sources. No new reading copy or numerical artifact
was needed. [Koch–Lamm PDF][kl] · [Taylor PDF][tay] · [E40 audit][e40].

[req]: SP4-CME-E42_REQUEST_v1.md
[note]: ../../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e41]: ../../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e41ret]: SP4-CME-E41_RETURN_v1.md
[e40]: ../../reviews/E40_REFERENCE_AUDIT_20261122.md
[kl]: https://arxiv.org/pdf/1310.3658v1
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
