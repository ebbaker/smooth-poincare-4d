# E211 Independent audit of the integrated pinched gradient estimate

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable. I
authored the inherited E204 exact-certificate and stationary audit
and the E208 integration audit. E209, E210 and the new integration
were separately authored.

## Disposition

**Pass with located repairs.** The quantitative gradient
estimate, old/native conversion, and weighted interval inequality
agree with E209/E210 at the exact stated scope. The frozen
manuscript incorporates all four E208 content edits. The revised
trace sentence has an unclosed inline math delimiter. The
unrestricted quadratic upper bound is written strictly in a
place where \(X=0\) must be allowed. The stationary and source
comparison paragraph needs the explicit stationary theorem
referent after insertion of the static-and-interval proposition.
No new mathematical premise or change to the constants is needed.

## Quantitative statement, frozen lines 2370–2405

The hypothesis is the global spatial bound
\(\sup_M\rho(Q)\le9/4\) on the supplied smooth definite
connection with positive curvature planes and the round-compatible
sign. The ratio is explicitly
\(\lambda_{\max}(Q)/\lambda_{\min}(Q)\). The statement uses the
native negative-Killing pairing, \(g_A\), and the native velocity
in \(\mathscr D\), and specifies Frobenius on the endomorphism
part of the derivative in \(\mathscr G\). The one base covector
slot and the measure are native. The ambient assumptions remain
smooth, closed, connected, oriented and four-dimensional, with
the principal \(SO(3)\) setting of the subsection. There is no
homotopy-sphere premise.

The constants are exactly
\[
 \kappa=\frac{32768}{2205225},\qquad L_0=81,\qquad
 C_0=\frac{11}{32}\left(\frac{2L_0^2}{\kappa}+L_0+
                                      \frac{\kappa}{2}\right),
 \quad \gamma=\frac{48}{5(1+4C_0)},\quad
 \beta=\frac{\kappa}{1+4C_0}.
\]
They give \(\mathscr D\ge\gamma\mathscr E+\beta\mathscr G\)
at each such datum, including a noncritical datum, and the
weighted estimate for a supplied smooth native interval pinched
throughout. The statement's endpoints and integrand are as assessed.

## Pointwise extension off the velocity kernel, lines 2406–2450

Match the positively oriented frames of the preceding theorem
at one point, using \(D=\operatorname{diag}(1,u,v)\) on the
closed triangle. For arbitrary trace-free symmetric \(X_a\), the
weighted trace projection is
\(C_a=X_a-\operatorname{tr}(QX_a)I/3\) with inverse
\(X_a=C_a-\operatorname{tr}(C_a)I/3\).
At the actual derivative \(X_a=(\nabla^AQ)_a\), this is the
derivative of the velocity's coefficient. The full old velocity
then has the factor \(-4Kc\) times the quaternion row map \(W\).
For the inverse on its eight-dimensional relation image,
the first two diagonal assignments have the minus sign required
by \(J_i^2=-I\). Weighted trace fixes the third diagonal. The
weighted quaternion relation of both outputs makes the remaining
third row agree. Projection to ordinary trace-free matrices
contracts the Frobenius norm. Each of the two coefficients of
\(C_{33}\) has absolute value at most one, hence
\(|C|^2\le3(|W_1|^2+|W_2|^2)\le3|W|^2\).
Using \(c^2\ge6/11\) gives \(3/(16K^2c^2)\le11/(32K^2)\).
The orthogonal component \(X_\perp\) is the unique minimal
preimage of its output. It is bounded by the explicit diagonal
preimage and neither construction differentiates a projection
or a spectral frame.

The unrestricted \(\Xi\) bound reproduces the old Sylvester
and full Bianchi estimates. Writing \(M_*\) for the greatest
eigenvalue, they give \(|D^AS|\le |X|/(2\sqrt m)\) and
\(|b|\le\sqrt3|X|/(2m)\), with
\(|\operatorname{ad}(b)|_{\rm F}=\sqrt2|b|\). Both terms yield
\[
 |\Xi|\le2\big(\sqrt{M_*/m}+\sqrt6\,M_*/m\big)|X|
 \le(3+9\sqrt6/2)|X|.
\]
The principal form is between zero and \(12|X|^2\), and
\(|q|\le\sqrt6\). The Frobenius commutator term is bounded
in absolute value by \(2|q||X||\Xi|\), giving
\(|\mathfrak R_Q(X)|\le(66+6\sqrt6)|X|^2\).
Since the scalar \(66+6\sqrt6<81\), the symmetric polarization
has operator norm at most \(L_0\) on the full space. The strict
scalar inequality holds independently of \(X\). The homogeneous
upper bound uses a non-strict inequality at \(X=0\).

The cross cost is bounded by
\[
 2L_0|X_0||X_\perp|
 \le\frac{\kappa}{2}|X_0|^2+
                        \frac{2L_0^2}{\kappa}|X_\perp|^2.
\]
Combining this with the lower bound on the kernel and the
unrestricted bound on \(X_\perp\), then writing
\(|X_0|^2=|X|^2-|X_\perp|^2\), gives the exact
\(2L_0^2/\kappa+L_0+\kappa/2\) coefficient. Applying the
minimal-preimage estimate proves the factor \(C_0/K^2\)
in the displayed speed error.

## Old tangent identity and native interval, lines 2452–2496

The independent connection derivative is the older wedge
pairing with \((2I+4H)F\). Self-duality turns the wedge
pairing into the ordinary \(L^2\) two-form pairing with
measure \(dV_{\widehat g}\). The old gradient and its
dissipation therefore use \(dV_{\widehat g}\), with
\(\mathscr D_{\rm o}=(2K^2)^{-1}\int |V_{\rm o}|^2\mu_{\rm o}\).
There is no derivative of that live inner product in the
directional derivative of \(\mathcal P\).

On the affine path \(A+\sigma V_{\rm o}(A)\) the tangent at
zero has \(F'_0=d_A V_{\rm o}(A)\), and the smooth definite
sign class is open on compact \(M\). The pointwise volume
identity used in the nonlinear defect formula holds at that
tangent. In the proof at 2006–2013, symmetry and the weighted
trace give
\(\sum_iV_{{\rm o},i}\wedge F_i
=2\sum_a\operatorname{tr}(QC_a)\iota_{e_a}\mu_{\rm o}=0\).
With the variation of the wedge trace volume, this gives
\(\mu_{\rm o}'(0)=0\). The nonlinear quotient and integrated
identity therefore evaluate at the affine tangent with no
flow existence or pinching of the affine path. The reaction
coefficient there is \(48K\sqrt{\det Q}\) in
\(\mathscr D_{\rm o}\), and \(m\ge6/11\) gives
\(\det Q\ge216/1331>4/25\). The negative speed cost equals
\[
 2\frac{C_0}{K^2}\int_M |V_{\rm o}|^2\mu_{\rm o}
 =4C_0\mathscr D_{\rm o}.
\]
The gradient integral \(\mathscr G_{\rm o}\) uses
\(\mu_{\rm o}\), giving the exact old inequality with
\(\kappa\mathscr G_{\rm o}+(96K/5)\mathcal P\) on the right.

For \(\ell=2K\), \(g_A=\ell\widehat g\),
\(dV_{g_A}=2\mu_{\rm o}\), the internal metric doubles and
\(V_{\rm n}=\ell^{-1}V_{\rm o}\). These match the native
clock \(\tau=\ell t\). The internal, one-covector and speed
factors in the squared velocity norm are \(2,\ell^{-1},
\ell^{-2}\), and volume relative to \(dV_{\widehat g}\)
contributes \(\ell^2\). The result is
\(\mathscr D=\mathscr D_{\rm o}/K\).
For \(\mathscr G\), the endomorphism norm is unchanged and
the inverse metric and measure relative to \(\mu_{\rm o}\)
give \(2/\ell=1/K\). The energy is \(2\mathcal P\).
Division by \(K\) gives the asserted \(48/5\) native energy
coefficient before dividing by \(1+4C_0\). Native energy
dissipation and multiplication by
\(e^{\gamma(\tau-\tau_0)}\) then give the exact weighted
\(\mathscr G\) integral and endpoint inequality. Lines
2498–2501 keep the stated interval scope. This version
contains no intermittent-time theorem or new continuation,
pinching preservation or initialization claim.

## E208 follow-through and source comparison

1. **Front scope, 94–99 and 390–396.** The positive
   round-compatible critical class is named, and the abstract
   states the limsup of spatial suprema along the same bounded
   late sequence. The introduction states the unshifted trace
   and positive-time transport.
2. **Certificate, 2265–2286.** The full E202 generator and JSON
   filenames and independent E204 verifier are named separately.
   The note that the table displays actual coefficient minima
   is retained, and the diagonal and pairwise denominator
   explanation is present in the bidegree proof.
3. **Two traces, 6175–6190 and 6308–6316.** The explicit
   strong \(C^0\) normalized unshifted limit appears first.
   The strong adjusted time-zero pair trace is then stated with
   its rough-local and uniform-value-radius dependencies.
   Both mathematical interfaces are present. The latter sentence
   needs the closing inline delimiter after \((A_*,F_*)\)
   at 6188.
4. **Available rate and fixed tail, 6275–6279 and 6343–6355.**
   The wording “one may take” gives the available native
   exponent with datum-dependent constants. The map
   \(K_n=h_n\circ j_n(s_0)^{-1}\), direction of
   \(\Phi^*(A_0,F_0)\), one fixed shifted datum in the round
   value basin and the identity
   \((L^{-1})^*=(\Phi^{-1})^*K_n^*\) all appear.
   Time translation and naturality produce
   \(L^*B(t-t_b)\), with the same curvature identity, and the
   final \((b_\infty\circ L)^*\) order is correct.

At 2505–2510 the historical Fine v2 question concerns the
independent-connection defect energy. E207's separate published
FKP2014 receipt gives the connection-volume action with stationary
Einstein equation \(d_A\Phi_A=0\), and Theorem 4.14 concerns its
positive definite connections on compact four-manifolds. The citation
is a comparator and is not used in either the stationary or
quantitative proof. The displayed mathematical distinction is
correct. The inspected passages are recorded in E207. In the
late-critical paragraph, the Fine v2 §5 comparison retains the
distinct definite-triple setting and the conclusion stops at
subsequential critical accumulation.

## Located repairs

1. **Line 6188.** Insert the closing dollar after the pair
   expression. The sentence should give the strong pair trace
   \((A_*,F_*)\) at zero in the closed-slab completion.
2. **Lines 2428–2438.** Replace the strict homogeneous
   inequality by \(|\mathfrak R_Q(X)|\le L_0|X|^2\)
   or state the strict inequality only for the scalar
   \(66+6\sqrt6<L_0\). Write \(M_*\) for the maximum
   eigenvalue to distinguish it from the base \(M\).
3. **Lines 2504–2510.** Name the Stationary spectral pinching
   theorem explicitly. In the FKP
   comparator identify positive definite connections on a
   compact four-manifold satisfying \(d_A\Phi_A=0\)
   as the class of its volume-action theorem. Its citation
   and role stay the same.

All 17 labels in the audited blocks are unique, the 35
reference instances resolve, and the 40 bibliography entries
remain in first-citation order. Both Fine2011 and
FineKrasnovPanov2014 are defined once in the manuscript and
canonical bibliography. The literal 4,501-byte round block
starting at 8507 matches its protected digest. No shared
source, certificate or build artifact was changed or rerun.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E211 request](../research-progress/handoffs/SP4-CME-E211_REQUEST_v1.md) | 1a1aa25e0009bc3c2cca6161283c2d924539cbdae58b246d67bf6709f7041cd5 |
| [Frozen manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex) | a238faa191c199a3b8c20e8cf98e6a5b793a1da0d80a6c52d60defaa361cae00 |
| [E209 proof](../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E210 audit](E210_PINCHED_GRADIENT_DOMINATION_AUDIT_20261123.md) | 5c925f2832e106ffccee368c9027d5632eb20c2525993d942dc45f717ded753d |
| [E209/E210 assessment](E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md) | 83df0cc9c6157a847c23c875c5f8078deb89ff63f72db97836f2b998557628e1 |
| [E208 audit](E208_STATIONARY_SPECTRAL_MANUSCRIPT_AUDIT_20261123.md) | 94ce8c680c44ed5ad8ec537e19dfe87fc43406691bf6cd8036570820d2f45369 |
| [E207 source comparison](E207_STATIONARY_PINCHING_SOURCE_COMPARISON_20261123.md) | 15bfc986f02967a60ebceb2031bec7d7908ffbf2d730aadbc9f9ed64b9401268 |
| [E205/E206 assessment](E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) | bca701d680e3e0f66dca5c56ba4caa3edb43c0005b8a94d7db4c2225b49858aa |

Protected round block SHA-256
c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab.
