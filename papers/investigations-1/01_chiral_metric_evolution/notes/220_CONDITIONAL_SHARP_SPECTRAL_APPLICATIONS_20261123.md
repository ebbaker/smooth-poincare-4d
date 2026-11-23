# E220 Conditional stationary and flow consequences of the sharp ratio

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable. I
authored E218, the algebraic input, as well as the inherited E204
and E214 audits. E202, E203, E205, E209 and E212 were separately
authored. This packet leaves the sharp algebraic premise explicit.

## Premise and conclusions

**\(H_{\rm sharp}\).** Use the full E202–E204 pointwise stationary
derivative form \(R_Q\) on the actual velocity kernel, with the
Bianchi-recovered skew term and the stated old conventions. For
\(Q>0\) of trace three with \(\rho(Q)=\lambda_{\max}(Q)/
\lambda_{\min}(Q)\le7/2\), the form is nonnegative on that
kernel. It is positive definite except at the ordered spectrum
proportional to \((1,1,7/2)\), where it has a four-dimensional
radical. The tested spaces and forms are unchanged under the
compatible pointwise frame identifications of E202–E204.
[Frozen E218 result](218_STATIONARY_SPECTRAL_RANGE_TEST_20261123.md) ·
[E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md).

All claims below assume \(H_{\rm sharp}\). A supplied smooth
critical connection with \(\sup_M\rho(Q)\le7/2\) is perfect.
For a supplied original flow over a homotopy four-sphere with
one geometrically bounded late sequence, the closed bound
\(\limsup_n\sup_M\rho(Q(A(t_n)))\le7/2\) gives an actual
fixed round limit. Each fixed strict ratio bound \(1\le r<7/2\)
gives a positive, possibly non-explicit stationary coefficient
\(\kappa(r)\), the static native gradient estimate and interval
bound below. For \(1<r<7/2\), accumulated time in the corresponding
spectral region also gives the two sufficient round-entry tests
below under the specified homotopy-sphere sequence hypotheses.

## Old and native conventions and the exact identities

Let \(M\) be a smooth closed connected oriented real
four-manifold, \(P\to M\) a smooth principal \(SO(3)\) bundle,
and \(A\) a supplied smooth definite connection with positive
curvature planes and the round-compatible curvature-map sign.
Fix \(K>0\) constant. In the older conventions the oriented
orthonormal internal frame has bracket
\([e_i,e_j]=\epsilon_{ijk}e_k\) and pairing \(\delta\). Write
\(\widehat g\) for the reconstructed metric,
\(S=Q^{1/2}\), \(q=Q-I\) and \(H=q-|q|^2I/6\). The curvature
and chiral bases obey \(F=-KS\Sigma\),
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}\),
and \(F_i\wedge F_j=Q_{ij}\mu_{\rm o}\) with
\(\mu_{\rm o}=2K^2dV_{\widehat g}\). Use ordinary internal
Frobenius norms for endomorphisms and \(\widehat g\) for their
covector slots.

Write \(\mathcal P_{\rm o}=\int_M|q|^2\mu_{\rm o}\).
For a smooth independent connection variation with tangent \(a\),
\(\delta F=d_Aa\) and \(\delta\mu_{\rm o}=\tfrac23
d\langle a\wedge F\rangle_\delta\). Vary the wedge quotient
in \(\int_M\operatorname{tr}(Q^2)\mu_{\rm o}\), which differs
from \(\mathcal P_{\rm o}\) by a constant along variations.
The result is
\[
 D\mathcal P_{\rm o}[a]=
 \int_M \big\langle d_Aa\wedge
       [(4Q-\tfrac23\operatorname{tr}(Q^2)I)F]\big\rangle_\delta .
\]
The second factor is self-dual, converting the wedge into the
ordinary two-form pairing with measure \(dV_{\widehat g}\).
The matrix in brackets equals \(2I+4H\), and self-duality and
Bianchi give \(d_A^{*\widehat g}F=0\). Thus
\[
 V_{\rm o}=-4d_A^{*\widehat g}(HF)=4*((D^AH)\wedge F),\qquad
 D\mathcal P_{\rm o}[a]=-\int_M\langle a,V_{\rm o}\rangle_{\widehat g,\delta}
                                       \,dV_{\widehat g}.
 \tag{1}
\]
This is the ordinary independent-connection gradient identity.
Put \(\mathscr D_{\rm o}=\int_M|V_{\rm o}|_{\widehat g,\delta}^2
dV_{\widehat g}\) and \(\mathscr G_{\rm o}=
\int_M|\nabla^AQ|_{\widehat g}^2\mu_{\rm o}\).
[E203 first variation](203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) ·
[E209/E210 assessment](../reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md).

At a point choose an oriented ordered eigenframe and a matched
oriented orthonormal coframe. The signed curvature polar
isometry \(-F^\sharp S^{-1}/(\sqrt 2K)\) is oriented by the
selected sign. The \(SO(4)\) action on positive chiral frames
matches the ordered triple. This gives \(S=cD\) with
\(D=\operatorname{diag}(d_1,d_2,d_3)=\operatorname{diag}(1,u,v)\),
\(1\le u\le v\), \(c^2=3/(1+u^2+v^2)\), and \(\rho(Q)=v^2\).
Write \(X_a=(\nabla^AQ)_a\), a trace-free symmetric matrix in
each covector component, and define
\[
 C_a=X_a-\tfrac13\operatorname{tr}(QX_a)I,\qquad
 W_i(X)=\sum_j d_jJ_j C_{ij}
     =-\frac{V_{{\rm o},i}(X)}{4Kc},\qquad
 J_j\alpha=*(\alpha\wedge\Sigma_j).
 \tag{2}
\]
The same maps act on abstract trace-free symmetric tuples
\(X\). For the actual \(X\), \(D^AH=C\). The ordinary
trace-free projection inverts \(X\mapsto C\) on the
weighted trace-free space \(\operatorname{tr}(D^2C_a)=0\).
The quaternion identities and symmetry give
\(\sum_i d_iJ_i W_i=0\). The derivative form is
\[
 \begin{aligned}
 R_Q(X)&=\sum_a\big(\langle X_a,\mathscr L_Q X_a\rangle
                              -\langle q,[X_a,\Xi_a]\rangle\big),\\
 \mathscr L_Q X_a&=2(QX_a+X_aQ)-\tfrac43\operatorname{tr}(QX_a)Q,\\
 \Xi_a&=2[D^A_aS,S]+4S\operatorname{ad}(b_a)S .
 \end{aligned}
 \tag{3}
\]
Here \(D^A_aS\) comes from \(S D^A_aS+(D^A_aS)S=X_a\).
Bianchi for \(F=-KS\Sigma\) cancels the common \(K\) and
recovers the actual \(b=A-\Gamma_A^+\) by its invertible
chiral map. Equation (3) is evaluated on all \(X\) by this
same linear recovery. It has the same coefficients as the
\(K=1\) form in the chosen orthonormal coframe, while \(K\)
only multiplies the velocity in (2). Changing frames
conjugates the internal tensors and rotates their covector
slots, preserving the norm, the velocity zero set and the
value of \(R_Q\). These are pointwise tensor transformations,
including at repeated spectra.
[E203 frame and scale proof](203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) ·
[E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md).

The exact E05 defect identity in E203 and E209 applies in
the direction \(V_{\rm o}(A)\) at any fixed datum. To see
the temporal interface, use the smooth affine variation
\(A+\sigma V_{\rm o}(A)\) in the open definite sign class
near zero. Its first curvature derivative is \(d_A V_{\rm o}\).
Equation (2) gives
\[
 *\langle V_{\rm o}\wedge F\rangle_\delta
 =4K^2c^2\sum_i d_iJ_iW_i=0.
\]
The pointwise volume derivative is therefore zero at that
tangent. The defect identity uses only this first temporal
tangent and the spatial identities at the datum. Its
integrated version and (1) give
\[
 \mathscr D_{\rm o}=2\int_M R_Q(\nabla^AQ)\,\mu_{\rm o}
                 +48K\int_M\sqrt{\det Q}\,|q|^2\,\mu_{\rm o}.
 \tag{4}
\]
The measure in \(\mathscr D_{\rm o}\) is \(dV_{\widehat g}\).
The integrals on the right use \(\mu_{\rm o}\). The ratio
hypothesis is applied at \(A\) only.
[E203 integrated identity](203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) ·
[E209 fixed-tangent proof](209_PINCHED_GRADIENT_DOMINATION_20261123.md).

For native conventions the internal pairing is \(2\delta\).
The old orthonormal curvature components gain \(\sqrt2\)
in native orthonormal labels, so the wedge numerator and
volume both double, with \(Q\) and its sign class unchanged.
Thus \(dV_{g_A}=2\mu_{\rm o}\), \(g_A=2K\widehat g\) and
\(\mathcal E=\int_M|q|^2dV_{g_A}=2\mathcal P_{\rm o}\).
The adjoint from two-forms to one-forms gains \((2K)^{-1}\)
under this constant metric scaling. The internal factor
cancels in that adjoint. As bundle-valued one-forms
\(V_{\rm n}=(2K)^{-1}V_{\rm o}\), with native time
\(\tau=2K t_{\rm o}\). The native dissipation and derivative
quantities are
\[
 \begin{aligned}
 \mathscr D&=\int_M|V_{\rm n}|_{g_A,\,2\delta}^2\,dV_{g_A}
                =\mathscr D_{\rm o}/K,\\
 \mathscr G&=\int_M|\nabla^AQ|_{g_A}^2\,dV_{g_A}
                =\mathscr G_{\rm o}/K .
 \end{aligned}
 \tag{5}
\]
Indeed for velocity the pointwise square scales by
\(2(2K)^{-3}\) from internal pairing, one covector slot and
speed, and the measure relative to \(dV_{\widehat g}\)
scales by \((2K)^2\). The endomorphism norm for \(\mathscr G\)
is unaffected by uniform rescaling of the internal metric,
while the covector inverse metric and volume relative to
\(\mu_{\rm o}\) give \(2/(2K)=1/K\). Therefore
\(D\mathcal E[V_{\rm n}]=(1/K)D\mathcal P_{\rm o}[V_{\rm o}]
=-\mathscr D\). Below all trajectory times are native.
[E209/E210 normalization check](../reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md).

## Closed ratio and actual critical perfection

If \(A\) is critical under smooth independent native
connection variations, the identity of energies on the
open definite class gives old criticality as well. By (1)
and smoothness \(V_{\rm o}=0\), so the actual \(X\) lies in
\(\ker W\). If \(\sup_M\rho(Q)\le7/2\), \(H_{\rm sharp}\)
gives \(R_Q(X)\ge0\) everywhere. With \(\mathscr D_{\rm o}=0\),
(4) forces the reaction integral to vanish. Its weight is
strictly positive everywhere since \(K>0\), \(Q>0\) and
\(\mu_{\rm o}\) is positive. By continuity \(q=0\)
everywhere. At the semidefinite axial endpoint this same
reaction argument applies. Thus \(Q=I\). Compatibility
gives \(D^AS=0\) and \(b=0\), so the connection is the
positive chiral Levi–Civita connection in the adapted
identification. The curvature block is \(W^+=0\),
\(\operatorname{Ric}_0=0\), \(\operatorname{scal}(\widehat g)=12K\).
The native scalar curvature is \(6\). This part applies
to the stated general closed base.
[E202–E204 stationary application](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md).

## Closed limsup and the actual round tail

Now fix a smooth closed connected oriented homotopy
four-sphere \(M\) and a bundle \(P\to M\) as above. Let
\(A(t)\), \(0\le t<T_*\), be a supplied maximal smooth
original native trajectory in the selected class. Suppose
one sequence \(t_n\uparrow T_*\) has
\[
 \sup_M\Psi(A(t_n))\le P_0,\qquad
 \operatorname{diam}(M,g_{A(t_n)})\le D_0,
 \qquad 0\le P_0<\infty,\quad 0<D_0<\infty .
 \tag{6}
\]
Here \(\Psi\) is E179's native real transport density
\(\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2\)
with \(\mathcal R_Y(f)=P_{f^\perp}T_Y f\) and
\(T_Y=(Q^{-1/2}D_Y^AQ\,Q^{-1/2})_0/2\),
on the unit internal sphere of area \(4\pi\), using the chiral
Levi–Civita horizontal derivative and live base covector
derivative. These bounds already give \(T_*=\infty\) by
the assessed finite-endpoint continuation implication.
Assume also
\[
 \limsup_{n\to\infty}\sup_M\rho(Q(A(t_n)))\le7/2 .
 \tag{7}
\]
E179/E181 gives, after a subsequence, smooth equivariant
\(h_n:P\to P\) over orientation-preserving diffeomorphisms
for which
\[
 (\widetilde A_n,\widetilde F_n)
   =h_n^*(A(t_n),F_{A(t_n)})
   \longrightarrow(A_*,F_*) \quad\text{strongly in }C^0 .
 \tag{8}
\]
The limit pair is continuous, distributionally compatible,
positive and of the same sign. Fix a common positive tube
and its value radii, one smooth compatible reference and
its common time \(T_{\rm ref}>0\). In the assessed adjusted
comparison the paths \((\mathcal A_n,\mathcal F_n)\)
for \((\widetilde A_n,\widetilde F_n)\) converge smoothly
on positive interior strips to the adjusted compatible
\((\mathcal A_*,\mathcal F_*)\). This limit has the strong
\(C^0\) pair trace \((A_*,F_*)\) at zero in the closed-slab
completion. The individual smooth recoveries \(j_n\) with
\(j_n(0)=\mathrm{id}\) satisfy, for \(0\le s\le3T_{\rm ref}/4\),
\[
 (A(t_n+s),F_{A(t_n+s)})
       =(j_n(s)\circ h_n^{-1})^*(\mathcal A_n(s),\mathcal F_n(s)).
 \tag{9}
\]
Both \(C^0\) interfaces and the interior convergence are used.
[E179/E181 assessment](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) ·
[E205 derivation](205_CONDITIONAL_LATE_SPECTRAL_CONVERGENCE_20261122.md).

The assessed energy argument on the common positive interior
gives \(V_{\rm n}(\mathcal A_*(s))=0\) and
\(\partial_s\mathcal A_*=\mathcal L_{\xi_*(s)}\mathcal A_*\).
In detail, invariance in (9) and monotonicity bound each
adjusted energy between \(\mathcal E_\infty\) and
\(\mathcal E(A(t_n))\), both tending to
\(\mathcal E_\infty=\lim_{t\to\infty}\mathcal E(A(t))\).
Smooth convergence gives constant limiting adjusted energy.
Freezing \(\xi_*\) at any one smooth interior time and
differentiating its flow invariance gives
\(D\mathcal E[\mathcal L_{\xi_*}\mathcal A_*]=0\). The
adjusted equation and native dissipation then give zero
integrated square of the original velocity there.

For an orientation-preserving equivariant pullback by \(h\),
the wedge numerator and native volume pull back together.
In terms of the forward adjoint isometry \(h_E\) over the
base map \(\bar h\), this gives
\(Q(h^*F)(x)=h_E(x)^{-1}Q(F)(\bar h(x))h_E(x)\).
Thus the spatial ratio supremum is unchanged. Fix a smooth
positive volume \(\nu\) and use \(N_{ij}=F_i\wedge F_j/\nu\)
so \(Q=3N/\operatorname{tr}N\). Both the trace denominator and
the least eigenvalue of \(Q\) are bounded below in a common
compact positive value tube at the traces. Uniform
curvature convergence gives uniform \(Q\) convergence there.
For matrices in the tube, with least eigenvalues at least \(m_0>0\)
and trace three, the Rayleigh quotient estimate gives
\[
 |\rho(Q_1)-\rho(Q_2)|\le
 (m_0^{-1}+3m_0^{-2})\|Q_1-Q_2\|_{\rm op}.
\]
It follows from (7)–(8) and naturality that
\(\sup_M\rho(Q(F_*))\le7/2\). By the second strong pair
trace, \(\sup_M\rho(Q(\mathcal F_*(s)))\) tends to this
supremum as \(s\downarrow0\).

Set \(s_0=T_{\rm ref}/2\). For each \(0<\epsilon<s_0\), solve
\(\dot k_\epsilon=-\xi_*(s)\circ k_\epsilon\) with
\(k_\epsilon(\epsilon)=\mathrm{id}\) on the compact positive
strip \([\epsilon,s_0]\). The smooth invariant field on
compact \(P\) gives smooth invertible equivariant maps by
ordinary flow and uniqueness, over an orientation-preserving
base isotopy. Differentiating the pullback using the Lie
equation yields \(k_\epsilon(s_0)^*\mathcal A_*(s_0)
=\mathcal A_*(\epsilon)\), and also the curvature identity.
The ratio suprema therefore agree. Sending \(\epsilon\)
to zero only in that scalar equality gives
\(\sup_M\rho(Q(\mathcal F_*(s_0)))\le7/2\). This uses flow
maps only on positive strips.
[E205/E206 spectral transfer assessment](../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md).

The smooth original-critical slice
\(A^\dagger=\mathcal A_*(s_0)\) now satisfies closed
sharp-ratio perfection and has
\(\mathcal E_\infty=\mathcal E(A^\dagger)=0\). By the
assessed perfect-pair identification, the native metric is
the round one up to an orientation-preserving base isometry.
The ASD Einstein condition, signature zero and the simply
connected compact constant curvature development are the
hypotheses used for that result. The bundle isomorphism
\(\Phi:P\to P_{\rm rd}\) satisfies
\(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\). To see the
fixed tail explicitly, put \(K_n=h_n\circ j_n(s_0)^{-1}\).
By (9), the \(K_n\)-normalized actual shifted pairs converge
smoothly to \(\Phi^*(A_0,F_0)\). After transferring by
\((\Phi^{-1})^*K_n^*\), the datum lies in the fixed round
value basin for all sufficiently late indices. Fix one such
index, \(t_b=t_n+s_0\), and \(L=\Phi\circ K_n^{-1}\).
Write \(B\) for the original round-basin solution of the
transferred datum. Naturality and smooth original uniqueness
at the common slice and recentered later slices give
\((A(t),F_{A(t)})=L^*(B(t-t_b),F_{B(t-t_b)})\) for
\(t\ge t_b\). The limiting pair is
\((b_\infty\circ L)^*(A_0,F_0)\) for the one fixed round
bundle map \(b_\infty\). The native rate
\(\alpha=\lambda_1(G_0)/2>0\) of the assessed round stability
operator carries through the fixed time translation and
smooth pullback. At each fixed \(C^k\) spatial order the
constant may depend on the datum and the fixed maps.
[E179/E181 fixed-tail transfer](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) ·
[E205/E206 map and rate check](../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md).

## Quantitative estimate at each fixed strict ratio

Fix \(1\le r<7/2\). In the model orthonormal frames of
(2)–(3) define
\[
 \mathcal U_r=
 \{(u,v,X):1\le u\le v\le\sqrt r,\quad
          X\in(\operatorname{Sym}_0\mathbb R^3)^4,\quad
          |X|=1,\quad W(X)=0\},
 \qquad
 \kappa(r)=\min_{\mathcal U_r} R_Q(X).
 \tag{10}
\]
The map \(W\) has rank eight throughout the ordered parameter
set. Its values lie in the eight-dimensional space
\(\sum_i d_iJ_iW_i=0\), since the map \((W_i)\mapsto
\sum_i d_iJ_iW_i\) is onto using \(d_1J_1\). For any triple
in that relation space, the diagonal assignment
\[
 C_{11}=-J_1W_1/d_1,\qquad C_{22}=-J_2W_2/d_2,\qquad
 C_{33}=-(d_1^2C_{11}+d_2^2C_{22})/d_3^2,\qquad C_{ij}=0\ (i\ne j)
 \tag{11}
\]
has weighted trace zero. The first two rows of the resulting
velocity map equal \(W_1,W_2\) by \(J_i^2=-I\).
Its relation equation fixes the third row because \(d_3J_3\)
is invertible. The trace-free projection of this \(C\)
therefore gives a right inverse to \(W\) on its image.
The kernel dimension is twelve and the unit fibers in
(10) are nonempty.

Here \(m=\lambda_{\min}(Q)=c^2=3/(1+u^2+v^2)\ge3/8\)
on even the closed sharp range, and \(M_*=\lambda_{\max}(Q)
\le3\), \(M_*/m\le7/2\). The positive floor ensures
continuity of the Sylvester inversion in (3). The Bianchi
matrix in the canonical coframes is fixed invertible, so
\(R_Q(X)\) is continuous in all variables there. The
entries of \(W\) are continuous. Thus \(\mathcal U_r\)
is a nonempty closed subset of a compact parameter set
times the finite-dimensional unit sphere. The strict
part of \(H_{\rm sharp}\) is positive on all its points.
The minimum in (10) is strictly positive, with no
continuous eigenframe selection needed. The scalar
estimate transfers to all actual frames by the covariance
above. At \(r=1\), \(Q=I\) and \(R_Q=4|X|^2\), so
\(\kappa(1)=4\).

For the minimal preimage \(X_\perp\) of \(W(X)\) in
\((\ker W)^\perp\), use (11) and \(d_1,d_2\ge1\),
\(d_i\le d_3\). The projection \(C\mapsto X\) contracts
norm, and
\[
 |C_{33}|^2\le2(|C_{11}|^2+|C_{22}|^2),\qquad
 |X_\perp|^2\le3(|W_1|^2+|W_2|^2)\le3|W|^2
     =\frac{3}{16K^2c^2}|V_{\rm o}(X)|^2
     \le\frac{1}{2K^2}|V_{\rm o}(X)|^2.
 \tag{12}
\]
The minimum norm assertion follows since any other
preimage differs by a kernel vector.

For all \(X\) the Sylvester estimate is
\(|D^AS|\le|X|/(2\sqrt m)\). The starred Bianchi
operator on \(b\) is symmetric with
\(\mathscr C^2=2I-\mathscr C\), so its inverse has norm
at most one. Its source has norm at most
\(\sqrt3\,|S^{-1}D^AS|\) by Cauchy–Schwarz and the three
\(J_j\) isometries. Hence
\(|b|\le\sqrt3|X|/(2m)\). The old bracket has
\(|\operatorname{ad}(b_a)|_{\rm F}=\sqrt2|b_a|\), and (3)
gives
\[
 |\Xi|\le4\sqrt{M_*}|D^AS|+4\sqrt2 M_*|b|
       \le 2\left(\sqrt{M_*/m}+\sqrt6\,M_*/m\right)|X| .
\]
In terms of \(C_a\) from (2), the principal pairing is
\(4\sum_{i,j}\lambda_i |(C_a)_{ij}|^2\). Equivalently,
it is \(4\sum_{i,j}\lambda_i |(X_a)_{ij}|^2\) minus
\(4\operatorname{tr}(QX_a)^2/3\). Thus it is nonnegative
and bounded by \(4M_*|X_a|^2\le12|X_a|^2\). Since
\(|q|^2=\operatorname{tr}Q^2-3
\le6\), the full commutator bound is
\(2|q||X||\Xi|\). In particular
\[
 |R_Q(X)|\le
 \left[12+4\sqrt6\!\left(\sqrt{7/2}+\sqrt6\,7/2\right)\right]|X|^2
 =(96+4\sqrt{21})|X|^2 \le L_0|X|^2,\qquad L_0=120 .
 \tag{13}
\]
The symmetric polarization of this quadratic form has
operator norm at most \(L_0\), since its self-adjoint
matrix has Rayleigh quotients in \([-L_0,L_0]\).
[E209 full-form estimates](209_PINCHED_GRADIENT_DOMINATION_20261123.md).

Write \(X=X_0+X_\perp\) in the stationary kernel and its
orthogonal complement. Use (10), (13) and Young's
inequality to obtain, with \(\kappa=\kappa(r)\),
\[
 \begin{aligned}
 R_Q(X)&\ge\kappa|X_0|^2-2L_0|X_0||X_\perp|-L_0|X_\perp|^2\\
       &\ge\tfrac\kappa2|X|^2-
          (2L_0^2/\kappa+L_0+\kappa/2)|X_\perp|^2\\
       &\ge\tfrac\kappa2|X|^2-\tfrac{C(r)}{K^2}|V_{\rm o}(X)|^2,
   \qquad C(r)=\tfrac12(2L_0^2/\kappa(r)+L_0+\kappa(r)/2).
 \end{aligned}
 \tag{14}
\]
Also \(\det Q\ge(3/8)^3=27/512>1/25\), so
\(\sqrt{\det Q}\ge1/5\) is valid. With the actual
\(X=\nabla^AQ\), the negative velocity cost in (4) is
\[
 \frac{2C(r)}{K^2}\int_M |V_{\rm o}|^2\mu_{\rm o}
       =4C(r)\mathscr D_{\rm o}.
\]
Consequently
\[
 (1+4C(r))\mathscr D_{\rm o}
      \ge\kappa(r)\mathscr G_{\rm o}+\frac{48K}{5}\mathcal P_{\rm o}.
\]
Divide by \(K\) and use (5) and
\(\mathcal P_{\rm o}=\mathcal E/2\). On every supplied
smooth datum of the stated general closed-base class
with \(\sup_M\rho(Q)\le r\) this proves
\[
 \mathscr D\ge\gamma(r)\mathcal E+\beta(r)\mathscr G,\qquad
 \gamma(r)=\frac{24}{5(1+4C(r))},\qquad
 \beta(r)=\frac{\kappa(r)}{1+4C(r)} .
 \tag{15}
\]
All proposed B105 constants are valid. They are independent
of \(K\), the base and the bundle. The separately assessed
E209/E210 constants at \(r=9/4\) remain explicit and
effective. Formula (15) is obtained here for each fixed
\(r<7/2\).
[B105](../brainstorm/notes/B105_SHARP_STATIONARY_APPLICATIONS_20261123.md) ·
[E209/E210 assessed constants](../reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md).

On any supplied smooth original native interval
\([t_0,t_1]\) with the stated ratio bound throughout,
\(\mathcal E'=-\mathscr D\) and multiplication by the
integrating factor give
\[
 e^{\gamma(r)(t-t_0)}\mathcal E(t)+
 \beta(r)\int_{t_0}^t e^{\gamma(r)(s-t_0)}\mathscr G(s)\,ds
 \le\mathcal E(t_0),\qquad t_0\le t\le t_1 .
 \tag{16}
\]
At \(r=1\) a qualifying slice has \(Q=I\) everywhere, so
\(\mathcal E,\mathscr G,\mathscr D\) all vanish there by
(1) and the definitions. The subsequent occupation
statement takes \(r>1\).

## Occupation and conditional entry

For fixed \(1<r<7/2\), let \(A(t)\), \(0\le t<T_*\), be
any supplied smooth original native trajectory of the
same general closed-base class. Set
\[
 S_r=\{t:\sup_M\rho(Q(A(t)))\le r\},\qquad
 \Theta_r(t)=\int_{t_0}^t\mathbf 1_{S_r}(s)\,ds,\qquad 0\le t_0<T_*.
\]
On each compact slab in the actual lifespan smoothness
and positivity give uniform continuity of \(Q\) and a
strictly positive least eigenvalue minimum. The Rayleigh
quotient argument and supremum inequality used for the
traces prove continuity of the spatial supremum in time.
Thus \(S_r\) is relatively closed and Borel. The function
\(\Theta_r\) is \(1\)-Lipschitz and absolutely continuous,
with derivative \(\mathbf 1_{S_r}\) almost everywhere.
Applying (15) instantaneously on \(S_r\) and using
nonnegative dissipation elsewhere gives
\(\mathcal E'+\mathbf 1_{S_r}(\gamma(r)\mathcal E+
\beta(r)\mathscr G)\le0\). The factor
\(f=e^{\gamma(r)\Theta_r}\) is absolutely continuous on
each compact slab and \(f'=\gamma(r)\mathbf 1_{S_r}f\)
almost everywhere. Hence
\((f\mathcal E)'\le-\beta(r)f\mathbf 1_{S_r}\mathscr G\).
This proves, including for zero energy and null or
empty-interior time sets,
\[
 e^{\gamma(r)\Theta_r(t)}\mathcal E(t)+
 \beta(r)\int_{S_r\cap[t_0,t]} e^{\gamma(r)\Theta_r(s)}
                  \mathscr G(s)\,ds
 \le\mathcal E(t_0),\qquad t_0\le t<T_* .
 \tag{17}
\]
No time derivative of the indicator or division by the
energy enters the calculation.
[E212/E213 occupation assessment](../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

For the round consequences additionally assume the
homotopy-four-sphere setting and the simultaneous late
sequence bounds (6). They first give \(T_*=\infty\).
Each of the following tests suffices.

1. If \(\Theta_r(t)\to\infty\), (17) forces
   \(\mathcal E_\infty=0\). The assessed zero-energy
   alternative of E179/E181 then gives the actual fixed
   original round tail.
2. If for one geometrically qualifying unshifted
   \(t_n\ge t_0\),
   \[
    \mathcal E(t_0)e^{-\gamma(r)\Theta_r(t_n)}
                      <\delta(P_0,D_0),
   \]
   then (17) makes the energy of \(A(t_n)\) strictly
   subthreshold. The assessed uniform entry theorem
   applies directly at that actual datum, with the
   non-effective \(\delta(P_0,D_0)>0\) and both bounds
   (6). Time translation to \(t_n\) and recentered
   smooth original uniqueness identify its full
   constructed tail with the original one.

In both cases the actual connection and curvature
converge smoothly to one fixed round pullback, with
the available native rate \(\lambda_1(G_0)/2\) and
datum-dependent constants at each fixed spatial order.
Pinched times need not coincide with the selected
geometric times. The finite test uses only the
occupation through \(t_n\). Its round conclusion gives
\(Q(t)\to I\) uniformly by continuity of the normalized
wedge quotient in a positive tube about the smooth
perfect limit. Choose
\(\varepsilon=(r-1)/(2(r+1))>0\); once
\(\|Q(t)-I\|_{\rm op}\le\varepsilon\) uniformly, one has
\(\sup_M\rho(Q(t))\le(1+\varepsilon)/(1-\varepsilon)<r\).
Thus \(S_r\) contains all sufficiently late times and
has infinite total occupation for a qualifying round-
convergent path. The energy rate in (17) concerns the
occupation clock and the pair rate concerns native time.
[E179/E181 assessment](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) ·
[E182/E183/E185 uniform entry](../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) ·
[E212/E213 finite-test correction](../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md).

## Scope and verified versions

The sharp algebraic input remains conditional in this
packet. The closed-endpoint application uses its
nonnegative sign. The quantitative and occupation estimates
use the positive constant for a fixed strict subrange.
An endpoint uniform gradient inequality, preservation,
occurrence of the visits, waiting time and construction
of initial definite data remain outside these results.
The work uses only the named inputs and the two packet
records.

| Artifact | SHA-256 |
| --- | --- |
| [E220 request](../research-progress/handoffs/SP4-CME-E220_REQUEST_v1.md) | 86dce8ebfde0368bc9dcf803a107cb5e15e5b8efb23c5e6fefe5a05e11f4f5eb |
| [B105](../brainstorm/notes/B105_SHARP_STATIONARY_APPLICATIONS_20261123.md) | 1350211c3f40ebad9b86fefe765b96f0caf066c8db56e9143615543b7c68c62c |
| [E218 note](218_STATIONARY_SPECTRAL_RANGE_TEST_20261123.md) | 68525110f98c8fb66e1c68b472ae19d04bcc83726787336860eaedf999f81b83 |
| [E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E203 application](203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E205/E206 assessment](../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) | bca701d680e3e0f66dca5c56ba4caa3edb43c0005b8a94d7db4c2225b49858aa |
| [E205 proof](205_CONDITIONAL_LATE_SPECTRAL_CONVERGENCE_20261122.md) | 6ef513190a6fa113be021f1b0531afc56eaaefaaef3c5e82adacf040871283bf |
| [E209 proof](209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E209/E210 assessment](../reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md) | 83df0cc9c6157a847c23c875c5f8078deb89ff63f72db97836f2b998557628e1 |
| [E212/E213 assessment](../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) | 63942e67c937280a0ea88f635d79be51c81b6e54f873e6b1bccf9ad2529ead3c |
| [E179/E181 assessment](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E182/E183/E185 assessment](../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) | 0f55dfd759e5dfd1f86e69cc7bd201688de0a2cf5e2bd9ce68414f9ffe96761f |
