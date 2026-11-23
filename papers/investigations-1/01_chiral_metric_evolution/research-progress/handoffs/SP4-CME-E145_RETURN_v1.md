# SP4-CME-E145 return v1 — General real transport temporal equivalence

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E derivation, configured
gpt-6.2-sol / ultra. Independent runtime attestation and actual lead
identifiers are unavailable. The executor authored E03A, the related
E14/E24 temporal work, E138 and the E143 conditional audit. E09,
E137, E139 and E140 are inherited. [Request][req] · [Derivation][note].

## Result and checks

For any supplied smooth positive definite native \(SO(3)\) connection
in the stated chirality and round-compatible curvature-map sign,
let \(R_X(f)=P_fT_Xf\) on the complete unit target direction sphere.
Using the target round area \(4\pi\), the live Levi–Civita derivative
on \(X\), and the live \(\Gamma\)-horizontal lift on the target,
the exact identities are
\[
 (D_\Gamma R)_{Y,X}(f)=P_f(\nabla^\Gamma_Y T)_Xf,\qquad
 \|R\|_{L^2_f}=k|T|,\qquad
 \|D_\Gamma R\|_{L^2_f}=k|\nabla^\Gamma T|,
 \qquad k=\sqrt{4\pi/5}.
\]
The derivation also gives the recoveries of \(T_X\) and
\((\nabla^\Gamma_Y T)_X\) by integrating \(R_X\otimes f\) and
\((D_\Gamma R)_{Y,X}\otimes f\), respectively, with factor \(4\pi/5\).
All base slots are squared and summed in the live metric. These
are real moments with no relabeling Jacobian.

The inverse of the native compatibility matrix for the unit
\(\sigma\) triple has norm two, and the native wedge-star map on
\(P=S^{-1}\nabla^AS\) has norm at most \(\sqrt{3/2}\).
The relative Sylvester identity gives \(|P|\le2|T|\), so
\(|b|\le2\sqrt6|T|\). With
\(\|\operatorname{ad}(b_Y)\|_{\rm op}=|b_Y|/\sqrt2\) this gives
\(|\nabla^AT-\nabla^\Gamma T|\le C_0|T|^2\), \(C_0=4\sqrt3\).
Then for
\(\Psi=\|D_\Gamma R\|_{L^2_f}+\|R\|_{L^2_f}^2\) and
\(\mathcal G=|\nabla^AT|+|T|^2\),
\[
 \frac{k^2}{1+C_0}\mathcal G\le\Psi
      \le k(C_0+k)\mathcal G .
\]
The constants require no eigenvalue floor or near-round assumption.
The direct projection formulas cover both poles, the pointwise
Sylvester argument covers eigenvalue multiplicities, and at
\(T=0\) the pointwise relation is \(\Psi=k\mathcal G\).

The inequalities pass in order to the base supremum and the
time integral on each supplied original interval in native time.
The two budgets are finite together on finite half-open intervals
as well, and each is preserved by taking same-slice pullbacks
with orientation-preserving bundle automorphisms. All derivatives
in the identities are spatial. The implication from finite real
budget to smooth continuation of a supplied original solution,
and its contrapositive at a finite maximal smooth definite
lifespan, are conditional here on the assessed E138/E140
combination. E143 checked E140 under the E138 premise. The new
equivalence is a reformulation of the temporal hypothesis, with
no new a priori budget bound or holomorphic chart result.

No new primary theorem or inspection entered. The branch Fine
normalization and Fine–Panov/AHS source records retain the
inherited inspections. The derivation and this return were the
only written files.

## Verified identities

| File | SHA-256 |
| --- | --- |
| E145 request | 99f5baa056ab10214171d259f809b533ff23571d9ce8097dd60cf264aa41acd8 |
| B73 decision | 634f7f61112f182388f06aec88ea16b4136b887f8a475221043dae63362cf2b9 |
| E03A derivation | ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2 |
| E09 derivation | c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae |
| E137 derivation | 8b2622b44a5a46106f28f67e2a37b2e1a129d238281a7be1f811498a48d95193 |
| E139 audit | c2cf4973987a4bf74b9be30fe77aff95979893727bc936dbb71039f9130ecb88 |
| E140 derivation | f885cffc8c290e1efb8891b0ca3a142a005a980de54b4911dda01d39789e33e3 |
| E143 audit | 5efc3fe31e73732293834f2c6dc1b39b2b5d4a8d2eba5810197928be91dd0c2e |
| E145 derivation | 544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4 |

[req]: SP4-CME-E145_REQUEST_v1.md
[note]: ../../notes/145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md

