# SP4-CME-E48 return v1 — fixed round stability gauge

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper `gpt-6.2-sol`/`ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Request v1][req] · [Derivation][note].

## Disposition

All four finite checks pass for the fixed perfect chiral reference
on the round oriented Riemannian \(S^4\).

- The corrected operator is second-order quasilinear. Its principal
  coefficients depend smoothly on \(x,A,F_A\). Curvature
  antisymmetrization fixes the map from \(D^2a\) to the second jet
  in \(DF_A\), and the live codifferential of the physical term
  differentiates \(F_A\) at most once. The fixed rough Laplacian
  differentiates only the reference \(S_0^*\) and \(a\) under
  the live algebraic \(S_A\). The reference symbol is strictly
  positive for the negative of the generator and remains coercive
  in a small value neighborhood.
- For E28's left action the correction is
  \(R(\delta_0a+\chi_A(\Delta_0S_0^*a),A)\). In Fine's
  \(v-R(\xi_{\rm st},A)\) form the written generator is the negative
  of this Lie-algebra element. The base field is second order.
- The full physical linearization is
  \(-8d_0^*L_0^*\Pi_0L_0d_0\), and \(P_0=\sqrt{8}\,\Pi_0L_0\)
  in the original metric and time. Here \(\Pi_0\) is trace-free
  symmetric projection. The correction linearizations add
  \(-d_0d_0^*\) and \(-S_0\Delta_0S_0^*\), giving \(-G_0\)
  exactly.
- For integer \(m\geq6\), (8)–(10) prove both requested
  \(H^{m-1}\) tame estimates on a small \(H^m\) ball for
  \(H^{m+1}\) inputs. Coefficient differences use the first
  jet in \(H^{m-1}\), and the principal product uses the
  second jet in \(H^{m-1}\), controlled by \(H^{m+1}\).
  Fixed background derivatives and curvature commutators
  are included in the exact linear and lower terms.

The literal live version of (4.9) has the cubic symbol displayed
in (7). On amplitude \(S_A(Y)\) the vertical contribution is
\(-|\xi|_{g_A}^2\,\xi\otimes a(Y)\). Every cubic contribution
from the live horizontal term lies in \(\operatorname{im}S_A\),
which is disjoint from that covector image apart from zero.
Small smooth perturbations of the fixed reference realize
a nonzero vertical contribution. This calculation concerns the
literal derivative order of the live expression. Long-time
stability and gauge transfer are outside this calculation.

## Versions and source record

| Frozen input or packet artifact | Checked SHA-256 |
| --- | --- |
| root `references/1111.5005v2.pdf`, 447930 bytes | `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8` |
| `notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md` | `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a` |
| `notes/29_LOCAL_PARABOLIC_INPUT_20261122.md` | `f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5` |
| `notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md` | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| `brainstorm/notes/B35_FIXED_STABILITY_GAUGE_20261122.md` | `c5a622f748ffb18547b5216b8569b998d8cbe7189ac5d45608dcd79ca53ee2a7` |
| `research-progress/handoffs/SP4-CME-E48_REQUEST_v1.md` | `55a74b7a5794e74fe1fe1e128ed26129556ee16171e61877ce5541d888c1c529` |
| `notes/48_FIXED_STABILITY_GAUGE_20261122.md` | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` |

The E27 live adjoint calculation and E28 left action were also
consulted at digests
`755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590`
and `b5bc0ba6f3981370f29027481a8293083e3fc93e9fa013e4494ab86767f74175`,
respectively. E42 was used for setup comparison.

On 22 November 2026, America/New_York, E48 rendered selected
pages of the existing repository copy of Joel Fine,
*A gauge theoretic approach to the anti-self-dual Einstein
equations*, arXiv:1111.5005v2, 29 November 2011.
Checked p. 4 Definition 1.4 for the reconstructed metric and
volume, pp. 17–18 (3.1)–(3.3) and Lemma 3.1 for the symmetric
map and Gram derivative, p. 19 Lemma 3.2 and (3.4) for the action,
pp. 29–31 Lemma 4.1, Proposition 4.2 and (4.1)–(4.4) for the
physical gradient and adjusted convention, pp. 32–35 (4.5),
Proposition 4.5, (4.7), Lemma 4.6, Corollary 4.7 and Lemma 4.9
for the Hessian factor and symbol, and pp. 38–39 (4.9) and
Proposition 4.12 for the live terms and the reference linearization.
The display in (4.5) uses \(\Theta^{1/2}\). The kernel proof on
pp. 38–39 recalls it with \(\Theta^{-1/2}\), which suffices for
that proof's kernel test but would change the normalization.
The trace-free symbol projection is unaffected by the printed
factor in Corollary 4.7. No new version or original retrieval
metadata was inferred. [Frozen PDF][fine] · [Canonical source record][canonical].

[req]: SP4-CME-E48_REQUEST_v1.md
[note]: ../../notes/48_FIXED_STABILITY_GAUGE_20261122.md
[fine]: ../../../../../references/1111.5005v2.pdf
[canonical]: ../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
