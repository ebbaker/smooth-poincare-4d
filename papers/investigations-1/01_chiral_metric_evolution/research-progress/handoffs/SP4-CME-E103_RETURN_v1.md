# SP4-CME-E103 return v1 — critical curvature oscillation after vertical gauge

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E execution, helper launch configured
gpt-6.2-sol/ultra. Independent runtime attestation and lead settings
unavailable. I authored E99, a provisional dependency of the Coulomb
application. E103 is a new derivation and does not independently audit
E99. [Frozen request][req] · [Derivation][note].

## Outcome

Proved the fixed test for any supplied internal gauges with
\(\|u_n-I\|_{C^1}\le M_*\epsilon_n\) for one fixed \(M_*\).
The actual compactly supported E95 round pullbacks with dyadic
\(n\) and \(\epsilon_n=n^{-1/4}\) have \(O(\epsilon_n)\) connection
and curvature value differences, \(Q=I\) and zero intrinsic strain.
For all large dyadic \(n\), the curvature after any such gauge satisfies
\[
 \|\operatorname{Ad}_{u_n}F_{A_n}-F_0\|_{\mathcal B^{1/2}}
                              \ge c\,\epsilon_n\sqrt n=c\,n^{1/4}.
\]
The threshold may depend on \(M_*\). The leading window term is
\(\epsilon_n\cos(nx^1)\operatorname{Ad}_{u_n}H\) with
\(H=dx^1\wedge\iota_{e_2}F_0\). The rank-one shear has no quadratic
pullback term. The localized reference correction is \(O(\epsilon_n)\)
in \(C^1\), and the smooth composition remainder is \(O(\epsilon_n/n)\)
in \(L^8\). In the auxiliary coordinates \(y=x/(2\pi)\), E53's
block \(j=\log_2 n\) fixes the cosine. The mean-zero annular kernel has
first absolute moment \(O(n^{-1})\), giving \(O(\epsilon_n/n)\) errors
for the amplitude commutator and fixed reference correction. The
window operator is bounded from the original fixed E59 atlas norm
by the dyadic comparison between \(L^8\) and \(W^{4,8}\). It uses
only fixed coordinate and frame changes.

Provisionally using E98/E99, there are smooth exact Coulomb
representatives \(A_0+b_n\) with
\(\|b_n\|_{W^{1,8}}+\|b_n\|_{C^{0,1/2}}=O(\epsilon_n)\).
Their \(C^0\)-small gauges satisfy \(D_0u_n=u_na_n-b_nu_n\), giving
the required \(C^1\) bound. Thus the connection part of the critical
pair tends to zero and the curvature part diverges in the original
fixed-atlas norm. This supplies the B58 counterexample to omitting
\(S_0^*b=0\) from E66. Explicit full placement maps return these
connections to \(A_0\), because they remain on the round orbit.
The lower bound for supplied \(C^1\)-small gauges is independent
of E98/E99. The asserted Coulomb representatives use their conclusions
provisionally pending lead assessment of E101.

## Provenance

| Input or output | SHA-256 |
| --- | --- |
| [E103 request][req] | ec799c31f7623947135dc3da0aa295f59d8cfa9865e9506f728cdedca4879a5f |
| [B58][b58] | 279b4f58a292c24c3c978b8a40709ec2bdd3d9679c46e6672f5bc8b62938d2e4 |
| [E95][e95] | 1a5930ba2052e2f97d0c8fe869cc0f9a0407509ad9182c33a6efbea60e4b59af |
| [E96][e96] | 4d46618e45e51902f81bbc8c180f183005bbea376dd9ee572945636f1f0f7747 |
| [E53][e53] | 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312 |
| [E98][e98] | 06c883cc5a6626f4748c218b75633ce1cdb947758b04f923b2255ca207251bf4 |
| [E99][e99] | 6785cff000ac53238e95ef2254b0f06aa868636d91b9107400215eff6a116330 |
| [E59][e59] | 2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a |
| [E57][e57] | 8bc1cc7551e137d58324ce9f837c174d0766330f9d61586d14c6c24e4778a3d7 |
| [E66][e66] | 09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66 |
| [E103 derivation][note] | 765a5e8870e2fb9867cae50b1220535fc75a8b374cd5efb45fd354a7eb6b5f79 |

No new external source or shared edit.

[req]: SP4-CME-E103_REQUEST_v1.md
[note]: ../../notes/103_COULOMB_CURVATURE_OSCILLATION_20261122.md
[b58]: ../../brainstorm/notes/B58_DEFECT_PINCHING_AND_VERTICAL_RESIDUAL_20261122.md
[e95]: ../../notes/95_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md
[e96]: ../../reviews/E96_CURVED_ORBIT_EXAMPLE_AUDIT_20261122.md
[e53]: ../../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e98]: ../../notes/98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e99]: ../../notes/99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md
[e59]: ../../notes/59_CRITICAL_PATH_STRAIN_20261122.md
[e57]: ../../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
[e66]: ../../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
