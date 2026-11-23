# SP4-CME-E49 return v1 — nonlinear stability in the fixed round gauge

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper `gpt-6.2-sol`/`ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Request v1][req] · [Theorem and proof][note].

## Disposition

The exact smooth-data \(H_{\rm st}\) hypothesis frozen in E50
holds in the fixed round geometry for each integer \(m\geq6\).
Choose \(\alpha=\lambda_1/2\) from E47. The E48 quadratic
and difference estimates hold in the weighted forcing norm
by assigning the single exponential weight to the
\(L^2_tH^{m+1}\) factor and using the unweighted
\(L^\infty_tH^m\) factor. For \(K\) the linear inverse norm
and \(M\) a remainder constant, choose
\(R\leq(8KM)^{-1}\) inside the fixed definite first-jet tube
and \(\eta=R/(4K)\). The half-line fixed-point map has image
norm at most \(3R/8\) and Lipschitz constant at most \(1/4\).
Its complete energy space gives the strong trace,
distributional equation, and norm bound
\(\|a\|_X\leq(8K/7)\|a_{\rm in}\|_{H^m}\).

For smooth initial data, use one fixed globally parabolic
cutoff of the E48 coefficients. The E29 spectral Galerkin
construction at order six bounds the \(C^2\) norm on a common
positive time controlled by the \(H^6\) datum bound. Explicitly
\(T_{\rm loc}=\log(3/2)/(1+K_6)\) for the uniform order-six
energy constant chosen in the note. The same \(C^2\) bound
controls every higher-order energy inequality on that interval.
Those energies and the equations yield a smooth local
solution up to the initial slice. \(L^2\) Gårding comparison
identifies it with the global energy solution through the full
local interval. Each smooth restart uses the same \(H^6\) bound
and lifespan, and overlapping slabs establish global smoothness.
No uniform higher initial norms enter the choice of that lifespan.
The fixed-point value bound keeps the solution in the definite
region and the cutoff agreement region.

This provides the precise fixed-gauge input for the separate
transfer. Gauge recovery and the unadjusted or small-value
conclusions are outside this packet.

## Versions and source dependence

| Frozen input or packet artifact | Checked SHA-256 |
| --- | --- |
| `notes/47_ROUND_STABLE_LINEAR_20261122.md` | `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6` |
| `notes/48_FIXED_STABILITY_GAUGE_20261122.md` | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` |
| `notes/29_LOCAL_PARABOLIC_INPUT_20261122.md` | `f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5` |
| `research-progress/handoffs/SP4-CME-E50_REQUEST_v1.md` | `2ee0d2af956c32441758b623398ce142a7810267a574cb707067b5d4beb0d27f` |
| `research-progress/handoffs/SP4-CME-E49_REQUEST_v1.md` | `f1643f8eb142480b6e767456fd871eb99bba0b09cc7927373a20a2c63466f1a5` |
| `reviews/E47_E48_STABILITY_INPUTS_ASSESSMENT_20261122.md` | `26f5bbc020285959076c3e7885d42c22736d4b40f1cbe473438cc05a052d24f4` |
| `brainstorm/notes/B35_FIXED_STABILITY_GAUGE_20261122.md` | `c5a622f748ffb18547b5216b8569b998d8cbe7189ac5d45608dcd79ca53ee2a7` |
| `brainstorm/notes/B36_SMOOTHING_TO_STABILITY_20261122.md` | `3d35bd441b9d075f30512ee12abbcc0966cdf41ec953eece4993e5930da3d3e5` |
| `notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md` | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` |

Rechecked Michael E. Taylor, *Pseudodifferential Operators and
Nonlinear PDE*, Birkhäuser Boston, Progress in Mathematics
**100** (1991), DOI 10.1007/978-1-4612-0431-2, in the undated
author-hosted file on 22 November 2026, America/New_York.
The local energy estimates use (3.1.18)–(3.1.20), printed
p. 66, for smooth composition with bounded jet values
at \(p=2\), and Proposition 3.6.A, (3.6.14), printed p. 94,
for the commutator with a smooth fixed operator in
\(OP\,S^k_{1,0}\) at \(\sigma=0,p=2\).
The compact-bundle localization, cutoff lifespan and comparison
are displayed in E49. Fine's arXiv:1111.5005v2 normalization
and operator dependence are inherited through the assessed
E47 and E48. No new primary version, retained reading copy
or external stability theorem enters this result.
[Taylor author-hosted PDF][tay] · [Lead input assessment][lead].

[req]: SP4-CME-E49_REQUEST_v1.md
[note]: ../../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[lead]: ../../reviews/E47_E48_STABILITY_INPUTS_ASSESSMENT_20261122.md
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
