# SP4-CME-E03A return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E03A_REQUEST_v1.md) and
[derivation](../../notes/05A_REAL_TWISTOR_COMPARISON_20261122.md).

## Transport and fiber projection

The B02 formula holds for the prescribed lifts and the
round-normalized direction map \(\phi(u)=Su/|Su|\).
The pushed \(A\)-horizontal lift differs from the metric horizontal
lift by \(\mathcal H_X(f)=P_f L_Xf\), where
\(L_X=(\nabla_X^A S)S^{-1}-\operatorname{ad}(b_X)\).
The vertical differential is \(d\phi(v)=P_f Sv/|Su|\), and
the fixed-identification time differential at fixed \(u\) is
\(P_f(S_tS^{-1})f\). The derivation checks conjugation under
base-dependent \(SO(3)\) frames, the complete \(\mathcal O(2)\)
transition \(y_w=-\zeta^{-2}y_\zeta\) with \(w=1/\zeta\), and
the antipodal reality relation.

The real representative of the holomorphic projection is
\(\Omega_X f\), where \(\Omega_X=\operatorname{skew}L_X\).
The remainder \(\mathcal R_X=P_fT_X f\) is a sphere gradient
and is antipodally odd in ambient components. This establishes
orthogonality to rotations and the other real holomorphic fields.
On the complete unit target sphere, with area \(4\pi\),
\[
 \int|\mathcal R_X|^2\,dA=\tfrac{4\pi}{5}|T_X|^2,\qquad
 T_X=\tfrac5{4\pi}\int\mathcal R_X\otimes f\,dA.
\]
The \((1,0)\) norm for \(h(Z,W)=g_{\mathrm{rd},\mathbb C}(Z,\bar W)\)
has squared norm \(2\pi|T_X|^2/5\). Its projector is the complex
representative of the same real projection.

## Derivative recovery and geometric scope

Write \(N_X=\nabla_X^A Q\). The symmetric strain and its inverse are
\[
 T_X=\tfrac12(S^{-1}N_XS^{-1})_0,\qquad
 N_X=2S T_X S-\tfrac23\operatorname{tr}(QT_X)Q,\qquad
 \operatorname{tr}L_X=-\operatorname{tr}(QT_X).
\]
For \(m=\lambda_{\min}(Q)>0\) and \(M_*=\lambda_{\max}(Q)\),
\(2m|T_X|\le |N_X|\le2M_*|T_X|\le6|T_X|\).
The round-normalized Bianchi compatibility inverse also gives
\(|b|_{\widehat g}\le2\sqrt3|T|_{\widehat g}\) on summing over
an orthonormal base frame. These upper conversions from the
measured remainder use no assumed lower eigenvalue bound. The
notes give explicit base-scale conversion constants and retain
the skew and scalar parts of \(L_X\).

The vertical complex-structure discrepancy
\(d\phi\,j\,(d\phi)^{-1}-j\) is separate from \(\mathcal H\).
Its pointwise operator norm equals the tangent stretch ratio
minus one, with fiber supremum \(\sqrt{M_*/m}-1\).
At round \(Q=I,b=0\), the lift mismatch and this vertical
defect both vanish. The primary comparison uses the B02
round-calibrated sign, whose detailed source audit is assigned
to E03B. The same packet owns the single anisotropic fiber test.
The present identities measure horizontal strain and compatibility.
An estimate along the flow, control of the eigenvalue floor and
the base geometry, and a generalized isothermal chart theorem
remain open. [Fine–Panov v2, Definition 2.9 and Remark 2.10](https://arxiv.org/html/0802.3648v2)
and [Atiyah–Hitchin–Singer, Theorem 4.1 and Remarks](../../../../../references/Atiyah.pdf).

## Input and output identities

Fine–Panov was inspected in primary HTML at the cited passages.
Atiyah–Hitchin–Singer was visually checked in the existing PDF
at journal pp. 435–436 (PDF pp. 12–13). The B02 primary record
links the earlier draft passages that were re-read. The E02
assessment acquired a documentary addendum after freeze. Its
initial 16 lines reproduce the frozen hash exactly.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E03A_REQUEST_v1.md | `2f486eba4b374a689c133697e61fa7eeeed317476b212c095ad1444ae641f599` |
| B02_REAL_TRANSPORT_DECISION_20261122.md | `d371354e77d0d2604673d456a53713ce0e9076ecdbc455fd8b766546045656cc` |
| E02_NONLINEAR_ASSESSMENT_20261122.md, frozen prefix | `4e996d702dc711f4c3416d296718d5082eef9856853de989e698345e964b4fde` |
| E02_NONLINEAR_ASSESSMENT_20261122.md, including the later addendum when checked | `ba9ac8cbeaf11cf8b47286fc384e72445fa97bfde10660f327fb5a8c1ac63279` |
| 04A_NONLINEAR_Q_20261122.md | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md | `e4da6fceda70bb2286813eede60142535dcb54ddb933c1c06019959dc4c248f9` |
| Atiyah.pdf | `a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6` |
| 05A_REAL_TWISTOR_COMPARISON_20261122.md | `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2` |
