# E105 — Independent audit of static defect pinching

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I did not author E102. I authored E99, which uses
related fixed first-order estimates, and E103, the separate second
B58 test. Neither result is a premise of this audit. The frozen
hashes matched. No new external source was inspected.
[Frozen request][req] · [E102][e102] · [Packet return][ret].

## Disposition and scope

Pass in the stated smooth, compact, closed, oriented round
Riemannian \(S^4\) setting with its positive perfect chiral
\(\mathrm{SO}(3)\) reference and native metric. For the actual
connection \(A=A_0+a\) and \(\beta=F_A-F_0\), the proof gives
\[
 \|Q(A)-I\|_{W^{1,(4,1)};0}+\|Q(A)-I\|_{C^0}
           \le C\|T(A)\|_{L^{4,1}(g_A)}
\]
on a fixed sufficiently small tube
\(\|a\|_{C^0;0}+\|\beta\|_{C^0;0}\le\rho\).
The constants are fixed before choosing \(A\). This is a
single-connection estimate. The analytic proof works on the
ordinary rank-five connection Laplacian. It uses neither slice
condition nor the inverse of E66's slice operator. The frozen
E102 request and B58 define the same scope.
[E102 request][req102] · [B58][b58].

## Rank five and the weak inverse

Let \(E\) be the real rank-three adjoint bundle with its positive
negative-Killing pairing. Its bundle of trace-free symmetric
endomorphisms \(\mathcal V=\operatorname{Sym}_0(E)\) has rank
\(3(3+1)/2-1=5\). In an internal orthonormal frame, the infinitesimal
action on \(\mathcal V\) is \(q\mapsto[\operatorname{ad}k,q]\).
For \(B=\operatorname{ad}k\) skew and \(q\) self-adjoint,
\((Bq-qB)^*=Bq-qB\) and \(\operatorname{tr}[B,q]=0\).
Cyclicity of the trace gives
\(\langle [B,q],p\rangle_{\rm HS}=-\langle q,[B,p]\rangle_{\rm HS}\),
so the induced connection is metric and its coefficient matrices
\(\gamma_i\) are skew in an orthonormal \(\mathcal V\) frame.

For \(K=D_0^*D_0\) on \(\mathcal V\), testing an \(H^1\) weak
kernel section with itself gives \(D_0q=0\). In a frame
\(\partial_i q=-\gamma_iq\), so multiplication by the smooth
fixed coefficients and local Sobolev differentiation give
all local derivatives and smoothness. The curvature of the
induced connection acts by
\([\operatorname{ad}(F_0(X,Y)),q]\). In native normalization
the three self-dual components \(F_{0i}\) have wedge Gram matrix
\(\delta_{ij}\,dV_{g_0}\). They are linearly independent in the
fixed chirality, so the map \(\Lambda^2T_xS^4\to E_x\) given
by \(F_0\) is surjective. The elements of \(\operatorname{ad}(E_x)\)
span all skew endomorphisms of \(E_x\) by faithfulness and equal
dimension. Thus a parallel \(q_x\) commutes with every skew
endomorphism. For a unit eigenvector \(v\), the skew images of
\(v\) exhaust \(v^\perp\), so the same eigenvalue holds on the
whole fiber. Trace-freeness gives zero.

The principal symbol of \(K\) is \(|\xi|_{g_0}^2 I_5\).
Compactness gives coercivity of \(\|D_0q\|_2^2\) on \(H^1\):
if \(\|q_j\|_{H^1}=1\) and \(D_0q_j\to0\), the weak \(H^1\)
and strong \(L^2\) subsequential limit is parallel, hence zero.
Both norms composing the fixed \(H^1\) norm tend to zero,
a contradiction. Therefore for every \(w\in L^2(T^*S^4\otimes
\mathcal V)\) the variational equation
\[
   (D_0u,D_0v)_{L^2}=(w,D_0v)_{L^2}\quad(v\in H^1)
\]
has one solution \(u=Lw\) with \(\|u\|_{H^1}\le C\|w\|_2\).
It follows directly that \(LD_0q=q\). There is no finite-rank
force to subtract from \(D_0^*w\) and no restriction on the
pointwise direction of \(w\).
[E102, reference and equations (2)–(4)][e102].

## Divergence blocks, localization and common endpoints

In a metric \(\mathcal V\) frame the weak differential expression,
multiplied by the fixed coordinate density \(\mu\), has integrands
\[
 A^{ij}=\mu g_0^{ij}I_5,\qquad B^i=A^{ij}\gamma_j,\qquad
 C^j=\gamma_i^*A^{ij},\qquad D=\gamma_i^*A^{ij}\gamma_j .
\]
This follows by expanding the two factors
\(\partial_j u+\gamma_j u\) and \(\partial_i v+\gamma_i v\).
In particular \(C^i=-B^i\), so \(M^i=B^i-C^i=2B^i\).
The operator and the forcing are
\[
 \begin{aligned}
 Pu&=-\partial_i(A^{ij}\partial_j u+M^i u)+D_1u,\qquad
          D_1=D-\partial_j C^j,\\
 Pu&=-\partial_i F^i+G,\qquad
          F^i=\mu g_0^{ij}w_j,\quad G=\gamma_i^*F^i.
 \end{aligned}
\]
The sign of the differentiated \(C^j\) is fixed by
\(C^j\partial_j u=\partial_j(C^j u)-(\partial_j C^j)u\).
The first-order terms on the right are on the test derivative
or the test value, as required by the weak equation.

For \(v=\chi u\), the product commutator is
\[
 P(\chi u)-\chi Pu
   =-\partial_i(A^{ij}(\partial_j\chi)u)
       -(\partial_i\chi)A^{ij}\partial_j u-(\partial_i\chi)M^iu .
\]
Writing the middle term as
\(-\partial_j((\partial_i\chi)A^{ij}u)
  +\partial_j((\partial_i\chi)A^{ij})u\) verifies both added
flux terms and the sign of the differentiated coefficient in
E102. Also \(-\chi\partial_iF^i=-\partial_i(\chi F^i)
+(\partial_i\chi)F^i\). Thus the new divergence and value
inputs cost only \(C_\chi(\|w\|_8+\|u\|_8)\) on the patch.
With \(P_*=-A_*^{ij}\partial_i\partial_j\) and
\(A_*^{ij}=A^{ij}(x_*)\), the extra flux in \(I+P_*\) is
\((A_*^{ij}-A^{ij})\partial_jv-M^iv\), and the extra value
is \((I-D_1)v\), in agreement with E102.

For the gradient of the frozen resolvent, the flux matrix
has entries \(\xi_i\xi_j/(1+A_*(\xi))\) and the value multiplier
has entries \(i\xi_i/(1+A_*(\xi))\), read as scalar symbols on
each of the five components, with
\(A_*(\xi)=\mu(x_*)|\xi|_{g_0(x_*)}^2\).
The numerator sign for the flux follows from \(i\xi_i(-i\xi_j)\).
The E88/E89 multiplier proof transfers with this coefficient:
on an annulus rescaled from level \(\ell\), the denominator
is \(2^{-2\ell}+A_*(\xi)\). Positivity and fixed upper bounds
give uniform derivatives of its inverse on the annulus.
Thus the flux kernel and its first derivative have block
bounds \(C_N2^{(4+i)\ell}(1+2^\ell|x|)^{-N}\) for \(i=0,1\),
and summing off the origin yields \(|x|^{-4}\) and \(|x|^{-5}\).
These estimates and the Plancherel bounds hold also for the
adjoint. They give the checked E89 weak \((1,1)\) cancellation:
a vector bad cube of side \(r\) has zero integral, and the
kernel difference outside its enlargement has integral bounded
by \(Cr\int_{cr}^\infty s^{-2}\,ds\). Integrating the weak
\((1,1)\) plus strong \((2,2)\) bounds for the adjoint at
\(8/7\), then using duality, gives the flux \(L^8\) bound.
For the value multiplier the low block has an integrable
kernel, and the high blocks have \(L^1\) norms \(O(2^{-\ell})\).
This verifies the hypotheses of the transferred method for
the actual five-dimensional bundle and ordinary metric symbol.
[E88, local divergence and multipliers (3)–(5)][e88] ·
[E89, local form, cutoffs and the fixed divergence multiplier][e89].

The oscillatory leading flux is absorbed on each sufficiently
small fixed patch using the uniform frozen constant before
summing. Reconstruction gives
\(\|D_0u\|_8\le C_1(\|w\|_8+\|u\|_8)\).
For supported components the mollifier estimates are
\(\|v-\eta_h*v\|_8\le Ch\|\partial v\|_8\) and
\(\|\eta_h*v\|_8\le Ch^{-3/2}\|v\|_2\).
The kernel exponent here is \(8/5\), since
\(1+1/8=1/2+5/8\) and \(4(1-5/8)=3/2\).
Fixed cutoffs and frame derivatives add \(Ch\|u\|_8\).
Absorbing this term first gives
\(\|u\|_8\le\varepsilon\|D_0u\|_8+C_\varepsilon\|u\|_2\).
Choose \(C_1\varepsilon\le1/2\) and insert the weak bound using
\(\|w\|_2\le V^{3/8}\|w\|_8\) for \(V=\mu_0(S^4)\).

The strong estimate can be applied first to smooth \(w\).
In the difference-quotient interior test, the lower terms
and derivatives of fixed coefficients are bounded by the
known \(H^1\) norm times the tested first-derivative norm.
For the smooth forcing \(D_0^*w\), the \(L^2\) norm of
\(\delta_{-h}(\chi^2\delta_hu)\) is controlled by
\(\|\chi\delta_h u\|_{H^1}+C\|u\|_{H^1}\), from translation
and the cutoff derivative. Uniform positivity of the
translated leading block and absorption give local \(H^2\).
Differentiating the equation then uses one already controlled
derivative fewer than the differentiated leading term and
gives all orders. The strong \(W^{1,8}\) estimate for arbitrary
\(w\in L^8\) follows by smooth approximation, and finite
volume gives convergence of the same data in \(L^2\).
The \(H^1\) and \(W^{1,8}\) limits therefore coincide, as
do their weak derivatives. This supplies one inverse on
both endpoints for all one-form forcings.
[E102, equation (3)][e102] · [E89, common strong endpoints][e89].

## Layer endpoint and continuity

The Lorentz convention is
\(\|f\|_{4,1}=4\int_0^\infty\mu_f(t)^{1/4}\,dt\).
Chebyshev's two bounds give
\(\mu_f(t)^{1/4}\le\min(A_2^{1/2}t^{-1/2},A_8^2t^{-2})\),
where \(A_p=\|f\|_p\). Splitting at
\(t_*=A_8^{4/3}A_2^{-1/3}\) and multiplying the sum of
the two integrals by \(4\) yields
\(12A_2^{1/3}A_8^{2/3}\), with the zero cases immediate.
Apply this calculation to \(D_0^jLw_t\), \(j=0,1\),
for the arbitrary vector layers
\(w_t=(w/|w|)\mathbf1_{\{|w|>t\}}\), taken as zero at \(w=0\).
Their two input norms are \(\mu_w(t)^{1/2}\) and
\(\mu_w(t)^{1/8}\), so the output power is
\(1/6+1/12=1/4\). At all thresholds with
\(\mu_0(\{|w|=t\})=0\), the layers are continuous in the
two strong norms by dominated convergence, and such thresholds
have full measure. The two-endpoint inequality gives Lorentz
measurability of both outputs. The integral of the layers is
\(w\) in \(L^2\) by
\(\mu_w(t)^{1/2}\le V^{1/4}\mu_w(t)^{1/4}\).
The common inverse identifies the \(L^2\) and Lorentz
output integrals, using \(L^{4,1}\hookrightarrow L^2\)
on the finite reference volume in both derivative slots.
Hence \(L:L^{4,1}\to W^{1,(4,1)}\) and \(q=LD_0q\)
give a constant \(C_L\) in E102 (4).

On a compactly supported coordinate piece, the ray formula
bounds the modulus by the potential of \(|\partial v|\)
with kernel \(|x-y|^{-3}/|S^3|\).
For a set of measure \(m\), splitting the kernel integral
at radius \(m^{1/4}\) gives \(C m^{1/4}\), so layer integration
gives the uniform estimate. The cutoffs contribute the value
norm, and fixed density and frame coefficients suffice for
patching. For the weak graph norm, the modulus tails of each
supported piece and its derivative tend to zero in \(L^{4,1}\)
by dominated layer integration. Bounded supported pieces
have translation continuity in \(L^2\cap L^8\), hence also in
\(L^{4,1}\) by the same inequality. Mollification converges in
the graph norm and the smooth approximants converge uniformly
by the ray estimate. Thus the continuous representative
asserted in E102 (4) is the weak section. The argument does
not require exact-form structure of Lorentz input layers.
[E88, Lorentz layers (8) and ray endpoint][e88] ·
[E89, common endpoints and endpoint continuity][e89].

## Strain inversion, comparisons and absorption

With \(N_X=\nabla^A_XQ\), \(S=Q^{1/2}\) and
\(T_X=\tfrac12(S^{-1}N_XS^{-1})_0\), write
\(S^{-1}N_XS^{-1}=2T_X+cI\). Metricity gives
\(\operatorname{tr}N_X=X(\operatorname{tr}Q)=0\).
After multiplication by \(S\) on both sides, the trace
is \(2\operatorname{tr}(QT_X)+3c\); this verifies
\[
 \mathcal N(t)=2StS-\tfrac23\operatorname{tr}(Qt)Q,\qquad
 N_X=\mathcal N(T_X).
\]
It is self-adjoint for the Hilbert–Schmidt inner product
and preserves the trace-free symmetric space. Half its
quadratic form has weights \(\sqrt{\lambda_i\lambda_j}\)
on the off-diagonal entries and
\(\sum_i\lambda_i t_{ii}^2-\tfrac13(\sum_i\lambda_i t_{ii})^2\)
on the diagonal. The latter is the minimum of
\(\sum_i\lambda_i(t_{ii}-c)^2\) over \(c\in\mathbb R\).
It is nonnegative and at most the value at \(c=0\).
Hence \(0\le\mathcal N\le2\lambda_{\max}(Q)I\) and
\(|N_X|\le6|T_X|\), since \(\operatorname{tr}Q=3\).
Summing squares over live orthonormal base directions
gives the live tensor bound.

The E66 (13) comparisons apply at this step without
its slice equations. In the fixed Hodge splitting the
positive plane is the graph of \(F_-F_+^{-1}\), with
\(F_+\) invertible by curvature value closeness to the
reference. The volume varies through the wedge formula
\(\frac13\sum_iF_i\wedge F_i\); the conformal-class map
and the native volume normalization depend smoothly on
these pointwise values. Thus a fixed small curvature-value
radius suffices for
\(\tfrac12g_0\le g_A\le\tfrac32g_0\) and
\(\tfrac12\mu_0\le dV_{g_A}\le\tfrac32\mu_0\).
The volume inequalities use the wedge formula separately.
The derivative in \(N\) and \(T\) contributes one
base covector slot. From \(g_A\le\tfrac32g_0\) one has
\(g_0^{-1}\le\tfrac32g_A^{-1}\). Consequently the threshold
changes by \(\sqrt{3/2}\) and the distribution measure by
at most \(2\), giving
\(\|N\|_{4,1;0}\le6\,2^{1/4}\sqrt{3/2}\,\|T\|_{4,1;g_A}\).
No derivative is used in the comparison.
[E66, equations (13)–(15)][e66].

On the zero-form \(q=Q-I\),
\(\nabla^AQ=D_0q+[\operatorname{ad}(a),q]\).
Here \(I\) is parallel for both connections and there is
no base Levi-Civita term. The commutator is in \(\mathcal V\)
by the same transpose and trace check as above, and its
one-form norm is at most \(C_{\rm ad}|a|_0|q|\) using the
fixed finite-dimensional bracket. Let
\(\ell=\|T(A)\|_{4,1;g_A}\) and
\(C_{\rm cmp}=2^{1/4}\sqrt{3/2}\).
First fix the geometric tube used for \(C_{\rm cmp}\) and
the reference constants \(C_L,C_{\rm ad},C_{\rm emb}\).
Then impose \(\rho\le\rho_{\rm geom}\) and
\(C_LC_{\rm ad}\rho\le1/2\). From the Lorentz estimate
and the exact connection difference,
\[
 \|q\|_{W^{1,(4,1)};0}\le
   6C_L C_{\rm cmp}\ell+
   C_L C_{\rm ad}\rho\,\|q\|_{W^{1,(4,1)};0}.
\]
Absorption gives \(12C_LC_{\rm cmp}\ell\), and continuity
gives the claimed sum with \(C=12C_LC_{\rm cmp}(1+C_{\rm emb})\).
The argument uses only the values of \(a,\beta\) for the
tube and never differentiates either to absorb the error.
The operator norm of \(q\) is bounded by its Hilbert–Schmidt
norm. Thus \(\ell\le\delta/C\) yields
\([1-\delta,1+\delta]\) for every eigenvalue, for
\(0<\delta<1\). When \(\ell=0\) this bound directly yields
\(Q=I\), hence perfectness in the stated definite component.
[E66, equation (17)][e66] · [E102, absorption and result][e102].

## Invariance and limits of the estimate

Under smooth internal gauge, the adjoint-action isometry
\(U\) takes \(q\) and \(T\) to their conjugates and preserves
the live metric and volume. The live Lorentz strain norm,
the pointwise eigenvalues, the sup defect, and the fixed-volume
\(L^{4,1}\) value norm of \(q\) are invariant. With \(D_0\)
held fixed, the product rule instead gives
\[
 D_0(UqU^{-1})
   =U(D_0q)U^{-1}+[(D_0U)U^{-1},\,UqU^{-1}].
\]
For a smooth \(q\) nonzero at some point, choose a fixed skew
\(B\) in a local orthonormal frame with \([B,q]\ne0\) there.
This is an infinitesimal internal gauge by the adjoint
identification. On a smaller patch of positive volume,
\(|[B,q]|\ge c>0\). Let \(U_s=\exp(s\eta B)\), with
\(\eta=x^1\) on the smaller patch and compact support in
the frame chart. On that patch
\((D_{0,1}U_s)U_s^{-1}=sB+O(1)\), since the fixed
connection terms and both orthogonal matrices are bounded.
Also \(|[B,U_s q U_s^{-1}]|=|[B,q]|\). Thus the fixed
derivative norm grows as \(s\to\infty\) while the value norm
is invariant. This check keeps the reference fixed and
does not require the transformed representatives to belong
to its value tube. Intrinsic pointwise conclusions can be
transferred by conjugation after verifying that at least
one representative meets the tube conditions.

A supplied smooth orientation-preserving bundle pullback
covering \(f\) takes the metric and volume to their pullbacks
and composes the scalar strain norm with \(f\). Change of
variables preserves every live distribution function.
Eigenvalues and the sup defect are carried along by \(f\),
so the pointwise bound transfers even if the transformed
connection is outside the original fixed tube. Using the
old fixed reference for the pulled-back derivative or
the fixed-volume value distribution would require separate
comparison. A reference pulled back with the data gives the
naturally transformed estimate. No arbitrary-pullback
uniformity with the original reference, temporal persistence,
full critical-pair estimate, finite placement or initialization
follows from E102.

## File identities

| Consumed file | SHA-256 |
| --- | --- |
| [E105 request][req] | 171ab6b056c32f194604ba59535432af1bd6f6fb1a06c4a6063916640e65c12a |
| [E102 request][req102] | 61e902fda5422f283c2773191875d933596e9c4330cd4c02e1074ce0b50729f8 |
| [B58][b58] | 279b4f58a292c24c3c978b8a40709ec2bdd3d9679c46e6672f5bc8b62938d2e4 |
| [E102][e102] | 783daa8875728a6265b0632829d57dae4f72522897bb8f052c79cdf841260c3b |
| [E66][e66] | 09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66 |
| [E88][e88] | 91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274 |
| [E89][e89] | 0f3e17807d50c6c35be82c2c442a3f3fce0bc139dfbb1cd83074ced88b371484 |

[req]: ../research-progress/handoffs/SP4-CME-E105_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E105_RETURN_v1.md
[req102]: ../research-progress/handoffs/SP4-CME-E102_REQUEST_v1.md
[b58]: ../brainstorm/notes/B58_DEFECT_PINCHING_AND_VERTICAL_RESIDUAL_20261122.md
[e102]: ../notes/102_STRAIN_DEFECT_PINCHING_20261122.md
[e66]: ../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e88]: ../notes/88_LORENTZ_ORBIT_SOLVER_20261122.md
[e89]: E89_LORENTZ_ORBIT_AUDIT_20261122.md
