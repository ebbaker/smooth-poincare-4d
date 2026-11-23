# SP4-CME-E110 — Static defect and Coulomb example manuscript audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E66 and the related E89,
E96, E101 and E107 audits. I did not author E102, E103, E105, E106
or the integrated TeX. This checks the lead's integration and the
disposition of my earlier E107 wording edits. The manuscript and all
four requested input hashes matched at consumption. The lead was
notified after the target was read. All manuscript line numbers here
refer to the consumed frozen working TeX. [Request][req] · [Return][ret].

## Defect pinching without a slice

Frozen lines 5205–5223 preserve E102's actual smooth connection,
fixed connection and curvature value tube, and native live norm.
The inherited setting is the smooth closed oriented round
Riemannian \(S^4\) with the positive perfect chiral \(\mathrm{SO}(3)\)
reference \(A_0\). The radius may be chosen inside its definite
component. The fixed derivative norm uses \(g_0,D_0\), whereas the
strain uses \(g_A^{\rm F}\) and its own volume. The two slice
equations are absent. [E102 (1)][e102] · [E105, disposition][e105].

The changed operator at lines 5225–5249 is the connection Laplacian
on the real rank-five bundle \(\mathcal V=\operatorname{Sym}^2_0 E\).
Its curvature action is the commutator with
\(\operatorname{ad}(F_0(X,Y))\). Testing the weak kernel equation
against its section gives parallelism. Since the curvature spans
the internal Lie algebra and the adjoint representation is faithful,
the induced skew endomorphisms span \(\mathfrak{so}(E_x)\).
A commuting self-adjoint endomorphism has each eigenspace
invariant under these endomorphisms. For any unit eigenvector,
the skew images span its orthogonal complement, forcing a scalar
endomorphism. Trace-freeness eliminates the scalar. Compactness
and the zero kernel then give the required \(H^1\) coercivity.

The compressed reference to the finite Lorentz gauge proof uses its
ordinary divergence argument, with the changed principal array
\(A^{ij}=\mu g_0^{ij}I_{\mathcal V}\). In a fixed orthonormal frame
\(D_0=\partial+\gamma\), the matrices
\(B^i=A^{ij}\gamma_j\), \(C^j=\gamma_i^*A^{ij}\) and the zeroth
order term \(\gamma_i^*A^{ij}\gamma_j-\partial_j C^j\) follow from
the same integration by parts, now with the commutator connection.
The flux for \(D_0^*w\) is \(F^i=\mu g_0^{ij}w_j\) with value term
\(\gamma_i^*F^i\). The absence of a kernel eliminates any finite
subtraction. The same signed cutoff, leading coefficient absorption
and fixed mollifier step give \(L^8\to W^{1,8}\) for the same
inverse as the weak \(L^2\to H^1\) bound. The layers apply to general
one-form forcings. Taking \(w=D_0q\) gives
\(q=K_{\mathcal V}^{-1}D_0^*D_0q\) and the ray endpoint gives the
stated sup bound. This is the actual rank-five proof from E102,
with no use of E66's slice inverse.
[E102 (2)–(4)][e102] · [E105, rank-five inverse][e105].

The strain inversion at lines 5251–5262 restores the scalar from
\(S^{-1}(\nabla_X^A Q)S^{-1}=2T_X+c_X I\). Trace-freeness of
\(\nabla_X^A Q\) and \(\operatorname{tr}Q=3\) give
\(c_X=-2\operatorname{tr}(QT_X)/3\). The operator on trace-free
symmetric endomorphisms is self-adjoint. Its half-quadratic form
has the off-diagonal weights \(\sqrt{\lambda_i\lambda_j}\) and the
nonnegative weighted diagonal variance in the manuscript. Both
are bounded by \(\lambda_{\max}(Q)\) times the corresponding
squared Hilbert–Schmidt norm. This gives \(6|T|\) upon summing in
live orthonormal base directions. As the volume bound at
lines 5264–5269 follows separately from the wedge formula,
the fixed one-covector norm costs \(\sqrt{3/2}\) and the
distribution bound costs \(2^{1/4}\) in the chosen Lorentz norm.
The constant \(2^{1/4}\sqrt{3/2}\) is correct.
[E102, comparisons][e102] · [E105, inversion and absorption][e105].

The base zero-form \(q=Q-I\) has no Levi–Civita correction.
The change of internal connection contributes the exact commutator
at lines 5270–5275. After the geometric tube and inverse constants
are fixed, \(C_L C_{\rm ad}\rho\le 1/2\) absorbs the error.
The eigenvalue bound uses the operator norm of \(q\) bounded by its
Hilbert–Schmidt norm. The live strain norm and pointwise eigenvalue
bound pass to internal gauges and supplied orientation-preserving
bundle pullbacks. The \(D_0\) derivative estimate remains tied to
the fixed reference and representative. The text gives a
single-connection result inside the stated value tube.
[E102, pointwise conclusion][e102] · [Lead assessment][assess].

## Curvature oscillation after the internal gauge

Lines 5291–5327 use the actual compactly supported shear and
principal lift of the earlier referenced proposition, with only
the scale changed to \(\epsilon_n=n^{-1/4}\) and
\(\delta_n=\epsilon_n/n\). In the chart the lift
\(G_n(x,h)=(\psi_n(x),h)\) is equivariant and glues to the identity
through the fixed collar. The pullback identity for \(A_n=G_n^*A_0\)
gives actual curvature \(G_n^*F_0\), with connection and curvature
sup errors \(O(\epsilon_n)\) from reference coefficient displacement
and slot changes. The wedge Gram matrix is the identity times the
pulled-back volume. This preserves \(Q=I\), perfectness and zero
strain. The inner shear derivative is
\(I+\epsilon_n\cos(nx^1)\partial_2\otimes dx^1\). The term
quadratic in this rank-one perturbation vanishes on a two-form.
The linear term has exactly \(H=dx^1\wedge\iota_{\partial_2}F_0\)
and the remainder costs \(O(\delta_n+\epsilon_n\delta_n)\).
A self-dual form that is nonzero on the \((\partial_2,\partial_3)\)
plane at the center shows \(H(\partial_1,\partial_3)\ne0\)
using the perfect curvature span. [E103 (1)–(3)][e103] ·
[E106, actual pullback][e106].

Lines 5328–5373 keep \(M_*\) fixed while \(n\) grows. The local
conjugation obeys \(\|L_n-I\|_{C^1}\le C_{M_*}\epsilon_n\)
by the product rule and fixed frame comparisons. Its window
amplitude \(p_n\) differs in sup norm by \(O_{M_*}(\epsilon_n)\)
from the fixed amplitude \((\theta\lambda H)(2\pi\,\cdot)\),
so it is uniformly separated from zero on the rectangle for
sufficiently large \(n\). The whole carrier periods on the
first coordinate interval give a fixed lower \(L^8\) bound.
The rescaling \(y=x/(2\pi)\) gives the exact modes \(\pm n e_1\)
on the unit torus. At \(j=\log_2n\) the annular symbol takes
the value one there, since
\(\chi(\pm e_1)-\chi(\pm2e_1)=1\).

The periodized kernel has mean zero, bounded \(L^1\) norm
and first absolute torus moment \(O(n^{-1})\) by unfolding
each lift and comparing its Euclidean distance to the torus
distance. The commutator gains \(C_{M_*}/n\) before multiplication
by \(\epsilon_n\). The mean-zero reference correction gains
\(C_{M_*}\epsilon_n/n\), and the residual only needs its
\(L^8\) bound. Thus the total error is
\(C_{M_*}\epsilon_n/n\), against a leading lower bound
\(c_0\epsilon_n\). The lower constant can be fixed independently
of \(M_*\), with the large-\(n\) threshold depending on the fixed
\(M_*\). No second derivative of \(u_n\) is used.
[E103 (4)–(8)][e103] · [E106, dyadic block][e106].

Lines 5375–5390 compare the window to the prescribed atlas
norm. Each fixed transition operator with its supported cutoff
and frame coefficients acts on \(L^8\) and \(W^{4,8}\).
For each original input block \(\ell\) this gives the displayed
\(\min(1,2^{4(\ell-k)})\) bound for output \(k\ge1\), and the
low block uses \(L^8\). For \(k\le\ell\) the weighted sum is
geometric up to \(2^{\ell/2}\). Above \(\ell\) it decays by
\(2^{-7(k-\ell)/2}\) relative to that factor. Summing the
input blocks and finite pieces gives the bound in the fixed atlas
without any \(W^{4,8}\) requirement on the varying gauge.
The actual curvature lower bound is consequently
\(c\epsilon_n\sqrt n=c n^{1/4}\).
[E103 (9)][e103] · [E106, fixed atlas comparison][e106].

Lines 5392–5404 apply the accepted value-small Coulomb corollary
to the fixed pair's sup smallness. It supplies a single \(M_*\)
for all selected gauges, smooth exact Coulomb \(b_n\), and the
stated \(W^{1,8}\), \(C^{0,1/2}\) and curvature sup bounds.
The \(W^{1,8}\) bound implies the small connection critical norm
by summing \(2^{j/2}2^{-j}\) on the high blocks and using the
low value norm, with fixed frame and cutoff costs. The historical
provisional wording in E103 is resolved by the lead assessments.
For the active internal action the vertical map is locally
\(U_n(x,h)=(x,u_n(x)^{-1}h)\). Pullback produces
\(u_n d(u_n^{-1})=-du_n u_n^{-1}\), so the formula
\(B_n=(G_n\circ U_n)^*A_0\) and the placement by its inverse
have the right order. This example defeats removal of the
horizontal equation alone in the fixed-slice estimate. It provides
explicit finite full placement and no temporal strain conclusion.
[E103, application][e103] · [E106, placement][e106] ·
[E98/E99/E101 assessment][assess101] · [Lead assessment][assess].

## E107 edits and reference checks

Both E107 wording edits are present. Frozen lines 4959–4965
distinguish Feehan's quotient-distance theorems from the
chosen-representative hypotheses while retaining weighted
divergence and fixed-base scope. Lines 5132–5134 state weak
\((1,1)\) and strong \(L^2\) for the adjoint flux multiplier
before duality. The frozen TeX source scan found 285 unique
labels, 154 distinct resolved reference targets, and 33 citations
in manual bibliography order by first use. The new subsection's
propositions and its cross-references resolve. No new external
source was inspected or imported. [E107 wording corrections][e107].

## Local precision additions

- At frozen lines 5336–5337 record that the supported window
  lies strictly inside the fundamental cube and is extended by
  zero on the unit torus. This makes the periodic coefficient
  extension explicit without affecting the fixed atlas comparison.
- Before the lower bound in lines 5344–5353 record
  \(\|L_n-I\|_{C^1}\le C_{M_*}\epsilon_n\) and hence
  \(\|p_n-(\theta\lambda H)(2\pi\,\cdot)\|_\infty
  \le C_{M_*}\epsilon_n\). On the rectangle this gives modulus
  at least \(h_*/2\) for sufficiently large \(n\), before the
  whole periods are counted.
- For the nonzero coefficient justification at lines 5325–5327,
  the form \(dx^2\wedge dx^3+*(dx^2\wedge dx^3)\) in the center
  orthonormal frame has value one on \((\partial_2,\partial_3)\).
  This is an optional direct explanation of the span argument.

The integration passes within the assessed static and example
scopes. These additions make implications already used in the
proof explicit. No shared file was changed and no build was run.

[req]: ../research-progress/handoffs/SP4-CME-E110_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E110_RETURN_v1.md
[e102]: ../notes/102_STRAIN_DEFECT_PINCHING_20261122.md
[e103]: ../notes/103_COULOMB_CURVATURE_OSCILLATION_20261122.md
[e105]: E105_STRAIN_DEFECT_PINCHING_AUDIT_20261122.md
[e106]: E106_COULOMB_CURVATURE_OSCILLATION_AUDIT_20261122.md
[e107]: E107_FINITE_INTERNAL_GAUGE_MANUSCRIPT_AUDIT_20261122.md
[assess]: E102_E106_DEFECT_AND_OSCILLATION_ASSESSMENT_20261122.md
[assess101]: E98_E101_VERTICAL_GAUGE_ASSESSMENT_20261122.md
