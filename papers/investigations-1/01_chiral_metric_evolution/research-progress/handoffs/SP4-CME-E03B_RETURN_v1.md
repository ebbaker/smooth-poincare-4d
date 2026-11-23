# SP4-CME-E03B return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. The helper was configured as gpt-6.2-sol /
ultra. Independent runtime settings and lead model/effort were
unavailable. The [derivation][note] completes [request v1][request].

| Check | Disposition |
| --- | --- |
| Round two-patch incidence and reality | Verified \(w_S=\eta w_N\), both first-jet inversions, and the quaternionic anti-holomorphic involution in both directions. On fixed fibers the real section parameters satisfy \(b=ja\) and the jet map has rank four real. Complexified parameters are independent, and the complex jet map has rank four complex. The explicit \(\mathbb CP^1\) projection exists on the complement of the twistor line at infinity. |
| Fine–Panov and AHS conventions | Verified the frame sign using \([\eta_i,\eta_j]=-2\epsilon_{ijk}\eta_k\), so the positive target frame is \(-\Sigma_i/\sqrt2\). The manuscript's curvature map has matrix \(+\sqrt2K S\) in that frame, agreeing in sign with the source's round \(+KI\) convention. The incidence chart realizes the outward vertical complex structure for the calibrated labels. The source curvature ray and the AHS lift agree horizontally and vertically at round. With \(Q=I\) and \(b_{\mathrm{conn}}=W^+=0\), both transports coincide and the normalized ray map is the identity. |
| One anisotropic pointwise fiber | For \(Q=\operatorname{diag}(1+\varepsilon,1,1-\varepsilon)\), the tangent singular values at \(e_2\) are \(\sqrt{1+\varepsilon}\) and \(\sqrt{1-\varepsilon}\). The orientation-preserving ray map is conformal and holomorphic exactly at \(\varepsilon=0\). The derivation gives an explicit bound for each derivative and its inverse, degenerating with the eigenvalue floor. |

Primary passages checked were Fine–Panov v2 Proposition 2.1,
Definitions 2.6 and 2.9, Remark 2.10, §3.1 before Theorem 3.1,
Corollary 3.3 and §4.2, and AHS Theorem 4.1 and the adjacent
geometric description and spin remark, journal pp. 435–436.
The AHS DOI PDF endpoint was unavailable to the web tool. The
same-version local reading copy was visually checked via existing
renders of its PDF pp. 12–13. The inherited source passages
`prop:general-chart`, `eq:general-jet-chart`, `lem:descent`,
`eq:factor` and `prop:two-reconstructions` were re-read.
[Fine–Panov v2][fp] · [AHS][ahs].

The exact normal section and first-jet conclusions concern the
round conformal chart and its complexification. Projective sphere
geometry needs no global spin structure, whereas the degree-one
linear data use a chosen compatible local lift. The pointwise
anisotropic test has no connection or flow realization claim.
Algebraic contraction with \(\pi\) already lands in degree one,
so its zero remainder provides no horizontal or along-flow
control. Any use of such control in a nonround estimate belongs
to B03. No calibration discrepancy remains for the stated round
choices.

## Inputs and evidence file

All frozen file hashes matched at launch. The lead subsequently
appended the E02C disposition to the E02 assessment. The prefix
through the original last newline retains its frozen hash, and
the appended disposition does not enter the round calculation.

| File | SHA-256 |
| --- | --- |
| `B02_REAL_TRANSPORT_DECISION_20261122.md` | `d371354e77d0d2604673d456a53713ce0e9076ecdbc455fd8b766546045656cc` |
| `E02_NONLINEAR_ASSESSMENT_20261122.md` at launch | `4e996d702dc711f4c3416d296718d5082eef9856853de989e698345e964b4fde` |
| E02 assessment as observed at return | `ba9ac8cbeaf11cf8b47286fc384e72445fa97bfde10660f327fb5a8c1ac63279` |
| `04A_NONLINEAR_Q_20261122.md` | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| `SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md` | `e4da6fceda70bb2286813eede60142535dcb54ddb933c1c06019959dc4c248f9` |
| `Atiyah.pdf` | `a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6` |
| `generalized_isothermal_wave_metrics.tex` | `493d81a7e8007aa0963e0ea9f5f1534e0073b7fc81da8268076c7a4d52902f7d` |
| `chiral_connection_descent_and_double_copy.tex` | `cda9e01bbc2eee5d088409b1db7d08ab0f5a0dca99daf6d8dd076c8100686651` |
| `SP4-CME-E03B_REQUEST_v1.md` | `b1426ecfc5c7c0fc0478fb4f953cbe47983b8b469b8efa6e83ab2632c1ea50bc` |
| `05B_REAL_TWISTOR_COMPARISON_20261122.md` | `27a2eaa0e5c7a06179525a6c67cdcfee5277d8e172ad2e5b436bbbf0fd242815` |

[request]: SP4-CME-E03B_REQUEST_v1.md
[note]: ../../notes/05B_REAL_TWISTOR_COMPARISON_20261122.md
[fp]: https://arxiv.org/html/0802.3648v2
[ahs]: https://doi.org/10.1098/rspa.1978.0143
