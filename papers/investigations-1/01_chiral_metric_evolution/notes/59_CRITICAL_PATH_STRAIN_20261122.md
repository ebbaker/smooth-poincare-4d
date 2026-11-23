# E59 — Localized critical path norm and real strain on the round reference

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
The [request][req] freezes the inputs. [B39][b39] selects the geometric
comparison and [B38][b38] specifies the localized norm.

## Setting and algebraic reconstruction

Let \(g_0\) be the standard round metric of sectional curvature \(K>0\)
on the oriented \(S^4\), and \(A_0\) its round chiral connection on the
oriented Euclidean rank-three bundle. Work in the E14 normalization and clock \(t\),
with internal metric \(\delta=-2\operatorname{tr}_{\mathbb C^2}\)
and \([e_i,e_j]=\epsilon_{ijk}e_k\) in an oriented orthonormal frame.
Let \(U=(a,\beta)=(A-A_0,F_A-F_0)\) be any smooth compatible path,
where \(F_0=F_{A_0}\), and \(D_0\) uses \(A_0,g_0\) on all slots.
All norms on \(U\) and its \(D_0\) derivatives below use
\(g_0,\delta\). Norms on the strain and its live derivative use
\(\widehat g,\delta\). There is a fixed small uniform-value tube
about \(U=0\), with constants depending on \(K\), this reference and
the tube. On the tube \(F=F_A\) is in the round-compatible definite
component. The E14 definitions are
\[
 \begin{gathered}
 \mu=\tfrac13\sum_i F_i\wedge F_i,\qquad
 Q_{ij}\mu=F_i\wedge F_j,\qquad
 S=Q^{1/2},\quad \operatorname{tr}Q=3,\qquad
 dV_{\widehat g}=\mu/(2K^2),\\
 F=-KS\Sigma,\qquad
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g},\qquad
 T_c=\tfrac12(S^{-1}(\nabla_c^A Q)S^{-1})_0 .                     \tag{1}
 \end{gathered}
\]
The subscript \(0\) on an endomorphism denotes projection to trace
zero. Here \(\nabla^A\) uses the live Levi–Civita connection of
\(\widehat g\) on base slots and \(A\) on internal slots.
[E03A][e03a] · [E14][e14].

For \(g_0\) the chiral identification \(E\to\Lambda^+_{g_0}\)
by \(\Sigma_0/\sqrt2\) and the inclusion
\(\Lambda^+_{g_0}\hookrightarrow\Lambda^2\) are parallel, the first
by the definition of \(A_0\) as the induced chiral connection and
the second because Levi–Civita preserves the Hodge splitting.
Round curvature gives \(F_0=-K\Sigma_0\). Since \(K\) is constant,
\(D_0F_0=0\), \(Q(F_0)=I\) and \(\mu(F_0)=2K^2dV_{g_0}\).

The wedge quotient defining \(Q\) is smooth near \(F_0\); the
denominator remains positive and bounded away from zero relative
to \(dV_{g_0}\). The spectrum stays near one, so the matrix square
root and its inverse are smooth there, for example by their
power series at \(I\). For the metric, use the fixed Hodge
splitting of \(g_0\) and regard \(F\) as a map
\(E\to\Lambda^2\) using \(\delta\). The positive projection \(F_+\)
is invertible onto \(\Lambda^+_{g_0}\) near \(F_0\), and the
plane of the curvature is the graph of the smooth bundle map
\(F_-F_+^{-1}\).

The graph of the self-dual plane is a smooth local coordinate
for conformal metrics near \(g_0\). To verify this, write the
volume-preserving representative as \(g_H=g_0(e^H\cdot,\cdot)\)
for symmetric trace-free \(H\). Differentiating the defining
pairing for the Hodge star gives, on two-forms at \(H=0\),
\[
 \dot *\,\omega=-*_{g_0}(H\cdot\omega),\qquad
 (H\cdot\omega)(v,w)=\omega(Hv,w)+\omega(v,Hw).
\]
The graph derivative on \(\Lambda^+\) is
\(\tfrac12\dot *|_{\Lambda^+}\), by differentiating the star
eigenvalue equation. It is injective. In an oriented orthonormal
eigenbasis for \(H\), if it vanishes then \(H\cdot\omega=0\)
on \(\Lambda^+\). Applying this to
\(e^1\wedge e^j+*_{g_0}(e^1\wedge e^j)\) gives
\(h_1+h_j=0\) for \(j=2,3,4\); trace zero gives \(H=0\).
The two spaces of variations have dimension nine, so the
inverse function theorem gives the smooth conformal representative.
Multiplying it by
\((\mu/(2K^2dV_{g_0}))^{1/2}\) gives \(\widehat g\).
The smooth form map \(\Sigma=-K^{-1}S^{-1}F\) has the
normalization in (1), since \(S^{-1}QS^{-1}=I\).
This metric is intrinsic to the given plane and volume.
Indeed if two metrics share a self-dual plane, diagonalize
their relative positive endomorphism with eigenvalues \(l_i\).
The first metric's self-dual combinations of complementary
two-forms being self-dual for the second forces
\(l_il_j=(\prod_k l_k)^{1/2}\) for the pairs, so the
\(l_i\) are equal. The volume fixes the scale.

The definitions are equivariant under oriented \(g_0\)-isometries
and internal orthogonal transformations in the chosen component.
Compactness, the parallel reference, and the smooth formulas
give uniform bounds for the first two fiber derivatives on a
small closed tube and
\[
 |Q-I|+|S^{-1}-I|+|\Sigma-\Sigma_0|_0+|\widehat g-g_0|_0
          \leq C|\beta|_0,\qquad
 C^{-1}g_0\leq\widehat g\leq Cg_0 .                              \tag{2}
\]
Here \(|\cdot|_0\) on geometric tensors is the fixed-reference
norm. In \(D_0\)-parallel frames along curves the algebraic
maps have no spatial coefficient derivative, since parallel
transport preserves \(g_0,F_0\), orientation and the internal
pairing. Thus, covariantly with the displayed order of derivatives,
\[
 \begin{aligned}
 D_0 Q&=Q_F[D_0\beta],\\
 D_0^2 Q&=Q_F[D_0^2\beta]+Q_{FF}[D_0\beta,D_0\beta],\\
 D_0\widehat g&=(\widehat g)_F[D_0\beta],\qquad
 D_0(S^{-1})=(S^{-1})_F[D_0\beta].
 \end{aligned}                                                     \tag{3}
\]
These are bundle chain rules using \(D_0\) also on derivative
slots, with no exchange of derivative order. Coordinate
derivatives of the fixed frames are included in \(D_0\).

## Covariant strain estimates

Set \(q=Q-I\), \(P=S^{-1}\), \(B_c=\operatorname{ad}(a_c)\),
and \(X_c=\nabla_c^A Q\). Since \(I\) is parallel and central,
\[
 \begin{aligned}
 X_c&=(D_0Q)_c+[B_c,q],\\
 (D_0X)_{dc}
     &=(D_0^2Q)_{dc}
       +[\operatorname{ad}((D_0a)_{dc}),q]
       +[B_c,(D_0Q)_d].
 \end{aligned}                                                     \tag{4}
\]
The moving base connection has no slot on \(Q\) itself.
Write \(u=|U|_0\), \(d=|D_0U|_0\), \(e=|D_0^2U|_0\).
Equations (2)–(4), with \(|\operatorname{ad}(a)|\leq C|a|\),
give \(|X|_0\leq C(d+u^2)\) and
\(|D_0X|_0\leq C(e+d^2+ud)\).
Differentiating (1) in the fixed derivative gives
\[
 2(D_0T)_{dc}
 =\bigl((D_0 P)_d X_cP+P(D_0X)_{dc}P+PX_c(D_0P)_d\bigr)_0 .
\]
The projection commutes with \(D_0\) by metric preservation.
Since \(|D_0P|_0\leq Cd\), this gives
\(|D_0T|_0\leq C(e+d^2+ud)\) after shrinking the value tube to
\(u\leq1\).

Let \(\mathcal C=\widehat\nabla-\nabla^0\) be the live
Levi–Civita difference on the base. Its fixed-covariant formula
and the derivative on the one-form \(T\) are
\[
 \begin{aligned}
 \mathcal C^\ell{}_{dc}
 &=\tfrac12\widehat g^{\ell m}
   \big((D_0)_d\widehat g_{cm}+(D_0)_c\widehat g_{dm}
                            -(D_0)_m\widehat g_{dc}\big),\\
 (\nabla^A T)_{dc}
 &=(D_0T)_{dc}+[B_d,T_c]-\mathcal C^\ell{}_{dc}T_\ell .
 \end{aligned}                                                     \tag{5}
\]
Thus \(|\mathcal C|_0\leq Cd\) by (2)–(3), and the last two
terms in (5) have combined bound \(C(u+d)(d+u^2)\).
Also \(|T|_0^2\leq C(d^2+u^4)\).
Using \(u\leq1\) and the fixed-to-live norm comparison gives
\[
 \boxed{\quad |T|_{\widehat g}\leq C(d+u^2),\qquad
 |\nabla^A T|_{\widehat g}+|T|_{\widehat g}^2
       \leq C(e+d^2+ud+u^2).\quad}                               \tag{6}
\]
The quadratic undifferentiated term in the first estimate
uses both \(D_0F_0=0\) and \([B_c,I]=0\).

## Localized norm and temporal integration

Choose a finite smooth atlas with coordinate images inside
\((-1/4,1/4)^4\subset\mathbb R^4\) after fixed chart rescalings,
and smaller subcharts covering \(S^4\). Take local oriented
orthonormal internal frames and the coordinate form frames,
a smooth partition of unity \(\chi_\gamma\) with compact
supports in the charts, and nested cutoffs \(\eta_\gamma\),
\(\widetilde\eta_\gamma\) compactly supported in the full
charts. Require \(\eta_\gamma=1\) near \(\operatorname{supp}\chi_\gamma\)
and \(\widetilde\eta_\gamma=1\) near \(\operatorname{supp}\eta_\gamma\).
Let \(v_\gamma\) be the coordinate and bundle components of
\(\chi_\gamma U\), extended by zero to the flat unit torus.
These extensions are smooth, since the cutoffs have compact
interior support, and the torus contains the chart images
away from its identification seams. The localized norm is
the B38 sum with \(p=8,s=1/2\), using the same flat
inhomogeneous dyadic partition \(\Delta_j\), \(j\geq0\), as the
E53 norm used in E54:
\[
 \begin{aligned}
 M&=\sum_{\gamma,j}2^{j/2}\sup_{0\leq t\leq T}
                       \|\Delta_j v_\gamma(t)\|_8,\\
 H&=\sum_{\gamma,j}2^{5j/2}\int_0^T
                       \|\Delta_j v_\gamma(t)\|_8\,dt,\qquad
 E_T(U)=M+H .
 \end{aligned}                                                     \tag{7}
\]
Each \(L^8\) block norm uses flat coordinate Lebesgue measure.
Reference metric, density and fiber-frame comparisons on the
compact supports are fixed. The local construction is used
only to estimate a supplied path. [B38][b38] · [E54, time norms][e54].

In a chart let \(L_i(x)\) be the fixed matrix of the reference
connection on the pair bundle, and let \(G^k{}_{ij}\) be the
round Christoffel symbols. For the section with components
\(v_\gamma\), the first and second reference derivatives have
components
\[
 \begin{aligned}
 (D_0 v_\gamma)_i&=\partial_i v_\gamma+L_i v_\gamma,\\
 (D_0^2 v_\gamma)_{ij}
 &=\partial_i\partial_j v_\gamma+
       L_i\partial_jv_\gamma+L_j\partial_i v_\gamma
       -G^k{}_{ij}\partial_kv_\gamma\\
 &\quad+(\partial_iL_j+L_iL_j-G^k{}_{ij}L_k)v_\gamma .
 \end{aligned}                                                     \tag{8}
\]
The Christoffel term accounts for the added derivative slot.
Reconstruct the pieces as \(\eta_\gamma v_\gamma\) in their
original frames and sum to obtain \(U\).
Derivatives of the reconstructing cutoffs add only fixed
multipliers on \(v_\gamma,\partial v_\gamma\), and vanish
on the support here because \(\eta_\gamma=1\) nearby.
Thus the lower-order frame and coordinate terms in (8) are
all estimated by the zeroth and first ordinary derivatives
of the localized pieces. There is no assumption of globally
constant connection coefficients.

Write \(h_k(t)=\|D_0^k U(t)\|_{\infty,0}\) for \(k=0,1,2\).
Bernstein on the fixed torus, with power \(2^{(k+1/2)j}\)
for \(k\) derivatives from \(L^8\) to \(L^\infty\), and
(8) yield
\[
 h_k(t)\leq C\sum_{\gamma,j}
          2^{(k+1/2)j}\|\Delta_j v_\gamma(t)\|_8 .
\]
This includes \(j=0\) and all fixed zeroth-order terms.
The Bernstein bound follows from the smooth auxiliary
cutoff multiplier equal to one on the block support,
whose derivative kernel in \(L^{8/7}\) is bounded by
\(C2^{(k+1/2)j}\) by periodization and scaling.
[E53, (1)–(2)][e53].
In particular \(\int_0^T h_2\,dt\leq CH\).
To estimate the quadratic terms use the interpolated block
norm
\[
 L=\sum_{\gamma,j}2^{3j/2}
          \|\Delta_j v_\gamma\|_{L^2(0,T;L^8)}
          \leq M^{1/2}H^{1/2}.
\]
Indeed the \(L^2\) time norm of each block is bounded by
the geometric mean of its time supremum and its time
integral, followed by Cauchy–Schwarz over \((\gamma,j)\).
Minkowski in time and \(2^{j/2}\leq2^{3j/2}\) give
\(\|h_0\|_{L^2(0,T)}+\|h_1\|_{L^2(0,T)}\leq CL\).
The inhomogeneous low block controls the \(v_\gamma\)
terms in (8) and the undifferentiated terms in (6).
Now integrate the spatial sup of (6) and use time
Cauchy–Schwarz on \(h_0 h_1\). This yields
\[
 \begin{aligned}
 J(T)&=\int_0^T\sup_x
          (|\nabla^A T|_{\widehat g}+|T|_{\widehat g}^2)\,dt\\
 &\leq C(H+MH)\leq C(E_T(U)+E_T(U)^2),\qquad 0<T\leq1 .
 \end{aligned}                                                     \tag{9}
\]
Constants are fixed by the reference, atlas and tube and use
no higher path derivatives. This proof is for smooth
compatible paths. A version in a completed class would use
the strongly identified localized path with tube-valued
representatives, a spatial \(C^2\) representative almost
everywhere in time from the summable two-derivative blocks,
and the weak curvature identity \(F_0+\beta=F_{A_0+a}\).
For passage from smooth compatible approximants, strong
convergence in the localized \(E_T\) norm controls uniform
values, \(L^2_t\) uniform first derivatives and \(L^1_t\)
uniform second derivatives by the same estimates. No such
approximation or geometric evolution construction is
required for (9).

## Naturality and clock

Let \(h\) be an orientation-preserving \(SO(3)\)-bundle
automorphism covering a diffeomorphism \(f\). Use pullback
notation. The curvature of \(h^*A\) is \(h^*F_A\).
The wedge and volume definitions give \(Q(h^*F)=h^*Q(F)\)
as an internally conjugated endomorphism and
\(\widehat g(h^*F)=f^*\widehat g(F)\) by uniqueness of
the metric with the specified plane and volume.
The positive square root and trace-free projection
commute with internal orthogonal conjugation, and both
the internal and the Levi–Civita spatial connections
pull back. Consequently
\[
 T(h^*A)=h^*T(A),\qquad
 \nabla^{h^*A}T(h^*A)=h^*(\nabla^AT(A)).
\]
The norms in the pulled-back metric are the old norm
functions composed with \(f\). A diffeomorphism preserves
their spatial suprema, so the integrand of \(J\) is unchanged
at each time even for time-dependent automorphisms,
with no time derivative of \(h\) involved. This concerns the
intrinsic norm in \(J\), since \(E_T\) is measured relative
to a fixed reference and atlas.

With the E14 norms kept in the integrand and Fine's native
clock \(\tau=2Kt\), the same budget is
\[
 J(T)=(2K)^{-1}\int_0^{2KT}\sup_x
        (|\nabla^A T|_{\widehat g}+|T|_{\widehat g}^2)
           \big|_{t=\tau/(2K)}\,d\tau .
\]
If the norms are also converted to Fine's native convention,
the negative Killing metric is \(2\delta\) because
\(\operatorname{tr}(\operatorname{ad}e_i\operatorname{ad}e_j)
=-2\delta_{ij}\). The curvature-volume density is then
\(2\mu\), giving the same \(Q\) and native metric
\(g^{\rm F}=2K\widehat g\). Endomorphism norms are unchanged
by the constant internal rescaling, and the base connections
agree under constant metric rescaling. Since \(T\) is a
one-form and \(\nabla^A T\) has two covariant base slots,
both \(|T|^2\) and \(|\nabla^AT|\) in the native metric
are \((2K)^{-1}\) times their E14 values. Thus the same
budget equals the integral in the native clock of the
native-norm integrand. This comparison uses fixed \(K\)
and the same curvature-volume convention checked in [E26][e26].
It makes no recovery, inverse strain or initial-data claim.

[req]: ../research-progress/handoffs/SP4-CME-E59_REQUEST_v1.md
[b39]: ../brainstorm/notes/B39_CRITICAL_NORM_TO_STRAIN_20261122.md
[b38]: ../brainstorm/notes/B38_COMPACT_CRITICAL_TRANSFER_20261122.md
[e03a]: 05A_REAL_TWISTOR_COMPARISON_20261122.md
[e14]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e26]: 26_FINE_GAUGE_ENDPOINT_GAP_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e54]: 54_CRITICAL_QUASILINEAR_MODEL_20261122.md
