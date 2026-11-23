# E153 — Determinant-normalized trace audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, configured helper launch
gpt-6.2-sol/ultra. Independent runtime attestation and lead settings
were unavailable. I previously checked inherited nonlinear defect
principal structure in E02B and native clock conversion in E65.
I did not author E152, E11, E08 or E02A. I read the actual E11 and
E08 jet calculations, the inherited nonlinear defect formula, and
the assessed Fine–Yao comparison. [Request][req] · [E152][e152].

## Disposition

Pass. The exact transverse principal term is nonzero for every
\(0<\varepsilon<1\) on the specified algebraic ray. For one fixed
sufficiently small positive \(\varepsilon\) the actual local
connection jets give a strict spatial maximum with fixed scalar
two-jet and arbitrarily large positive original-flow derivative.
The native derivative is exactly half the old-clock derivative
in this calibration. The obstruction is limited to the proposed
scalar pointwise closure. No primary source reinspection, numerical
experiment, or shared file edit was made.

## Affine determinant calculus and transverse coefficient

On \(V=\operatorname{Sym}_0(\mathbb R^3)\) with Frobenius pairing,
write \(U=Q^{-1}\), \(p=(\det Q)^{-1/3}\) and
\(m=\operatorname{tr}U/3\). Then \(\det(pQ)=1\) and
\(\operatorname{tr}(pQ)-3=3p-3\). The trace-three
arithmetic-geometric mean bound gives \(f\ge0\), with equality
only at \(I\). In an affine direction \(X\in V\),
\(D_X\det Q=\det Q\,\operatorname{tr}(UX)\) and
\(D_Xp=-(p/3)\operatorname{tr}(UX)\). Thus
\(df[X]=-p\,\operatorname{tr}(UX)\). Removing the scalar
part of \(-pU\) gives the affine Frobenius gradient
\(G=p(mI-U)\). Differentiating once more with
\(D_XU=-UXU\) gives
\[
 D^2 f(Q)[X,Y]
  =p\,\operatorname{tr}(UXUY)
   +\tfrac p3\operatorname{tr}(UX)\operatorname{tr}(UY).
\]
The Hessian at \(I\) is the Frobenius pairing on \(V\),
and \(G(I)=0\). The invariant scalar is smooth and meets
the E11 hypotheses. The formula uses the affine derivative,
with no determinant-one tangent restriction on \(X,Y\)
before the normalization map.

The nonpositive rough Laplacian convention in E02A has
positive coefficient
\(\mathscr L_QT=2(QT+TQ)-\frac43\operatorname{tr}(QT)Q\).
This maps \(V\) to \(V\) by trace three. Its self-adjointness
follows by cyclic trace and symmetry of the last rank-one
term. Since \(QG=GQ=p(mQ-I)\) and
\(\operatorname{tr}(QG)=3p(m-1)\), direct cancellation gives
\(\mathscr L_QG=4p(Q-I)\).

Set \(D=\operatorname{diag}(1,0,-1)\), \(N=(D^2)_0\) and
\(\rho=1-\varepsilon^2>0\). Direct inversion on the ray
yields \(m=(3-\varepsilon^2)/(3\rho)\) and
\(G=(p\varepsilon/\rho)(D-\varepsilon N)\).
Thus \(G_{22}=2p\varepsilon^2/(3\rho)>0\), whereas
\(\mathscr L_QG=4p\varepsilon D\) has zero \(22\)-entry
and is nonzero. Since \(D\perp N\), \(|D|^2=2\) and
\(|N|^2=2/3\), the projection of \(D\) onto
\(\mathbb R(D-\varepsilon N)\) is
\(3(D-\varepsilon N)/(3+\varepsilon^2)\). Subtracting it
gives exactly
\[
 Y=\frac{4p\varepsilon^2}{3+\varepsilon^2}
                           (\varepsilon D+3N),\qquad
 |Y|^2=\frac{32p^2\varepsilon^4}{3+\varepsilon^2}.
\]
The second equality uses \(|\varepsilon D+3N|^2=
2(3+\varepsilon^2)\). In particular \(Y\) is orthogonal
to \(G\) and nonzero, with expansion
\(4\varepsilon^2N+O(\varepsilon^3)\) as in the \(a=1\)
case of the E11 obstruction. [E02A][e02a] · [E11][e11].

## Realization, scalar two-jet and exact velocity

Use the real four-chart, bracket inner product, \(K=1\) and
round-compatible self-dual triple of E08. For the old curvature
components in this chart,
\(M_{ij}=(F_i\wedge F_j)/(2dV_{\rm eucl})\) and
\(Q=3M/\operatorname{tr}M\). At \(F_i^*=-s_i\Sigma_i^*\),
\(M=Q_*\), \(\operatorname{tr}M=3\), and
\[
 (\delta M)_{ij}
  =-\tfrac12(s_j\langle\delta F_i,\Sigma_j^*\rangle
                   +s_i\langle\delta F_j,\Sigma_i^*\rangle),
 \qquad
 \delta Q=\delta M-\tfrac13\operatorname{tr}(\delta M)Q_*.
\]
For unit \(\xi\), \(\langle\xi\wedge V,\Sigma_j^*\rangle
=\langle V,J_j\xi\rangle\) in the ordinary two-form convention.
The three \(J_j\xi\) are orthonormal by their quaternionic
relations. Therefore the E11 choice
\(V_i^a=-\sum_j(H_{ij}/s_j)J_jdx^a\) gives
\(\delta M=H\) for \(\delta F_i=dx^a\wedge V_i^a\),
and trace-freeness gives \(\delta Q=H\).

Write \(\alpha_a=\iota_{\partial_a}F^*/2\), so
\(A^0=x^a\alpha_a\) and \(dA^0=F^*\) with the sign
in E152 (3). The cubic has exterior derivative
\(\sum_a(x^a)^2 dx^a\wedge V^a/2\). Its bracket with
the affine part is order four, and its square is order
six, so these do not affect the curvature two-jet.
For the affine part alone the quadratic bracket gives
\(\partial_a\partial_bF^0=[\alpha_a\wedge\alpha_b]\).
Using \(\alpha_{a,i}=-(s_i/2)J_i dx^a\), its
\(\Sigma_j^*\) contraction is
\[
 \tfrac14\sum_{r,t}\epsilon_{irt}s_rs_t\,
        \operatorname{sym}_{ab}
         \langle J_jJ_rdx^a,J_tdx^b\rangle
       = \tfrac{d}{2s_i}\delta_{ij}\delta_{ab}.
\]
Indeed the scalar part of \(J_jJ_r\) gives an antisymmetric
pairing in \(a,b\), and the other part gives
\(\epsilon_{jrt}\delta_{ab}\) after symmetrization.
The two complementary ordered pairs carry the same sign.
This gives \(\partial_{ab}M^0=-dI\delta_{ab}/2\),
and quotient normalization gives
\(\partial_{ab}Q^0=(d/2)q_*\delta_{ab}\).
These are the baseline signs and factors in the actual
E08 argument. [E08][e08] · [E11][e11].

The full first curvature jet vanishes. Hence no quadratic
chain-rule term contributes to the \(Q\) Hessian or scalar
Hessian. The reconstructed metric is Euclidean at the
center because the positive span is Euclidean self-dual
and \(\mu=2dV_{\rm eucl}\) in this old \(K=1\) calibration.
Its first derivative is zero. In the covariant \(Q\)
Hessian the derivative of the affine connection contributes
\(\frac12[\operatorname{ad}(F^*_{ab}),Q_*]\), skew in
\(a,b\), and the base Christoffel term multiplies a vanishing
first derivative. Thus
\(\partial_{ab}Q=\delta_{ab}(dq_*/2+H)\) and
\(\Delta_A Q=4(dq_*/2+H)\), including the factor from the
four-dimensional trace. The exact curvature satisfies Bianchi
without imposing any independent matrix jet.

Choose \(H=-dq_*/2-G+LY\), with one fixed \(\varepsilon>0\)
and \(L>0\) finite. Then
\(w(o)=f(Q_*),\, dw(o)=0\) and
\(\nabla^2 w(o)=-|G|^2g_{\rm eucl}\), by
\(\langle G,Y\rangle=0\). The Hessian is negative definite.
The scalar two-jet, \(Q(o)\), and the listed curvature and
metric values and first jets are fixed as \(L\) changes.
Smooth definite curvature and the stipulated sign hold on
a possibly different neighborhood for each \(L\).

All E02A first-derivative products have a factor of
\(\nabla Q\); these terms vanish at the center. The exact
old-clock reaction at \(K=1\) is \(-24d q_*\).
Self-adjointness gives \(\langle G,\mathscr L_QY\rangle
=|Y|^2\), while
\(\langle G,q_*\rangle=2p\varepsilon^2/\rho\) and
\(\langle G,\mathscr L_QG\rangle=8p^2\varepsilon^2/\rho\).
Therefore
\[
 w_t=-\frac{32p^2\varepsilon^2}{\rho}
     -\frac{48dp\varepsilon^2}{\rho}
     +\frac{128Lp^2\varepsilon^4}{3+\varepsilon^2}.
\]
In particular it is positive if
\(L>\frac{3+\varepsilon^2}{4\varepsilon^2\rho}
        (1+\frac{3d}{2p})\), and increases without bound
at fixed \(\varepsilon\). This is the derivative of the
scalar on the actual vector field at each smooth local
connection, hence the instantaneous derivative of any
smooth flow attaining it. It does not require a common
space neighborhood or a common evolution time for this
family. [E02A][e02a] · [E08][e08] · [Assessment][assessment].

## Native conversion, provenance and scope

The negative Killing metric on the old bracket-orthonormal
basis is \(2\delta\). Its native orthonormal components of
curvature acquire \(\sqrt2\); the wedge volume doubles
and quotient \(Q\) is unchanged. Since the old volume is
\(2K^2dV_{\widehat g}\), this gives \(g=2K\widehat g\).
The two-form codifferential under this constant metric
scaling has factor \((2K)^{-1}\). The native coefficient
\(4Q-\tfrac23\operatorname{tr}(Q^2)I\) is
\(2I+4(q-|q|^2I/6)\); the first term has zero divergence
by self-duality and covariant Bianchi. Consequently the
same field has \(\tau=2Kt\) and \(w_\tau=(2K)^{-1}w_t\).
At \(K=1\) the derivative is one half of the display,
and the scalar Hessian as a covariant tensor is unchanged
by the constant metric scaling. In native notation it
equals \(-|G|^2g(o)/2\).

The revision record and the E08–E13 assessment identify
the historical E11 digest and its bracket-only correction.
I additionally verified exact reversibility in memory.
At zero-based byte offset 8301 the single corrected
token `\bigl(d[f(Q)]\bigr)(v)(p)`
replaces the concatenation of `d[f(Q)]` and `(v)(p)`.
Reversing only that token in
the 9493-byte corrected file reconstructs 9481 bytes
with SHA-256
2b06dacb36205c2d4629d7169dc227c8b498d870ca05dba04f35e476aaa1c55a,
exactly the historical assessed digest. No input was
written or reverted. [Revision][revision] · [Assessment][assessment].

E149 distinguishes the trace inequality (3.10) from the
derivative inequality (3.11) in Fine–Yao v2 Proposition 3.2,
including the shifted pointer in Theorem 4.7's proof.
Theorem 4.7 treats a supplied compact hypersymplectic
flow with finite time integral of squared seven-dimensional
torsion supremum; the earlier scalar-curvature theorem
was used through the report's restatement. Theorem 4.10
concerns near-orthogonal initial hypersymplectic triples.
The source evolves individually closed two-forms with its
determinant-one Gram. The connection curvature instead
has covariant Bianchi closure and the gauge-covariant
Fine evolution. The common determinant normalization
does not identify the PDE or torsion. The present
calculation excludes only the suggested scalar pointwise
trace maximum step for the connection equation. It neither
tests the hypersymplectic theorem on its own equation
nor proves a global maximum, a closed-manifold breakdown,
or a singular flow. Other scalar mechanisms using different
data and matrix, integral, or nonlocal arguments remain
outside the result. [E149 assessment][a149] · [E149 review][e149].

## Consumed identities

| Input | SHA-256 |
| --- | --- |
| [E153 request][req] | 52fa89026419d69c76cc039b61c9d28032d436ad3a714d11cbe8ce4a56978538 |
| [E152][e152] | d860eb8260834bd65283e727a3574c8580a4b7890bfc1b9d87075fd82672e5d4 |
| [E11][e11] | 91f87b6d5655cd03ec0ac1f4a692df05a2848a873406feb41938a542ccdb0ae7 |
| [E08][e08] | 2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06 |
| [E02A][e02a] | 4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19 |
| [E08–E13 assessment][assessment] | 3a781d31480ebcc439a39d85ac18199ab71b30ea0c772636da4f882e0870f688 |
| [Typesetting revisions][revision] | 2ae8b3a5ce147f84aa879580f01ae62b3ef122cc2ff73bde1ce5d4adea49d807 |
| [E149 assessment][a149] | 7d60c020d45716ea09bea79c100bb49c30a6fb091c48879aff42c78ad9895309 |
| [E149 source review][e149] | fe964ab3ceb115cb6b1b47f2039e0e4bf392ca7e9077a0d19cd2edbcf592914f |

[req]: ../research-progress/handoffs/SP4-CME-E153_REQUEST_v1.md
[e152]: ../notes/152_DETERMINANT_NORMALIZED_TRACE_TEST_20261122.md
[e11]: ../notes/13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md
[e08]: ../notes/10_SCALAR_PINCHING_JET_20261122.md
[e02a]: ../notes/04A_NONLINEAR_Q_20261122.md
[assessment]: E08_E13_CONTROL_ASSESSMENT_20261122.md
[revision]: BROAD_RUN_TYPESETTING_CORRECTIONS_20261122.md
[a149]: E149_CONTINUATION_SOURCE_ASSESSMENT_20261122.md
[e149]: E149_GENERAL_CONTINUATION_SOURCE_COMPARISON_20261122.md
