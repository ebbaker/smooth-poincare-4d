# Metric evolution from the chiral connection near round S4

Date: 2026-11-21  
Status: exploratory derivation; exact identities and perturbative conclusions are distinguished below.

Companion: [Riemannian S4 exploration](01_riemannian_s4_exploration_20261121.md). This note continues the Riemannian extension of the generalized-isothermal/chiral-descent program. It does not modify either manuscript.

## 1. Main result and the three different flows

There is a precise Ricci-flow comparison. At the round metric, the independent definite-connection gradient flow preserves the image of transverse-traceless metric variations under the linearized chiral Levi–Civita map. The induced metric equation is four times the linearization of volume-normalized Ricci flow, in the normalization below:

\[
\partial_t h=-4(L+2K)h,\qquad
L=\nabla^*\nabla,\qquad \delta h=\operatorname{tr}h=0.
\tag{1}
\]

The curvature-reconstructed metric perturbation obeys the same equation. This is an identity including the curvature terms, not just a principal-symbol comparison.

There are nevertheless three distinct constructions:

| Construction | Linear TT equation at round |
|---|---|
| Volume-normalized Ricci flow | \(h_t=-(L+2K)h\) |
| Independent connection gradient from metric-induced TT data, then reconstruction | \(\widehat h_t=-4(L+2K)\widehat h\) |
| Metric \(L^2\) gradient of \(g\mapsto\mathcal P(A_g^+)\) | \(h_t=-(L+2K)(L+4K)h\) |

The factor four is a time normalization. The difference between second and fourth differential order is substantive. Pulling an energy back through the differential map \(g\mapsto A_g^+\) and then taking its metric gradient does not commute with taking its connection gradient and reconstructing a metric.

Connection-flow time has length-squared scaling, whereas metric-gradient time for this curvature-squared energy has length-to-the-fourth scaling. Numerical rates in the different rows should not be compared without fixing units and the reference scale \(K\).

The nonlinear connection evolution is not established here to be Ricci flow. The reconstructed metric is generally different from the metric whose spin connection one started with. Nor does the connection remain the Levi–Civita connection of its reconstructed metric in general.

## 2. Conventions and the independent connection functional

Let \(g_0\) be round on \(S^4\), with sectional curvature \(K>0\). Use the conventions of the companion note:

\[
\operatorname{Ric}(g_0)=3Kg_0,\quad s_0=12K,\quad
\Sigma_i^+\wedge\Sigma_j^+=2\delta_{ij}\,dV_{g_0},\quad
F_{0i}=-K\Sigma_i^+.
\]

The internal metric is \(\delta_{ij}=-2\operatorname{tr}(T_iT_j)\), where \(T_i=-i\sigma_i/2\). Let \(E\) denote the rank-three adjoint bundle. For a definite connection on the component containing \(A_0\), define

\[
\mu_A=\frac13\sum_i F_i\wedge F_i,\qquad
F_i\wedge F_j=Q_{ij}\mu_A,\qquad
Q>0,\quad\operatorname{tr}Q=3.
\]

The curvature span determines \(\Lambda^+_{\widehat g_A}\). Fix the conformal scale by

\[
dV_{\widehat g_A}=\frac{\mu_A}{2K^2}.
\tag{2}
\]

Then \(\widehat g_{A_0}=g_0\). In an adapted frame,

\[
F=-K S\Sigma^+,\qquad S=Q^{1/2}.
\tag{3}
\]

Define

\[
\mathcal P(A)=\int|Q-I|^2\mu_A,
\qquad
\langle a,b\rangle_A=\int\sum_i
\langle a_i,b_i\rangle_{\widehat g_A}\,dV_{\widehat g_A}.
\tag{4}
\]

This is the definite-connection functional and flow considered by Fine, with an additive topological constant removed and a fixed rescaling of the reconstructed metric. Fine establishes short-time existence modulo gauge and local stability under the hypotheses of his stability theorem. The computations below specialize the flow to the round sphere and compare its metric evolution. [1, Proposition 4.2 and Sections 4.2–4.3]

Since \(F\) is selfdual for \(\widehat g_A\), the Bianchi identity gives \(d_A^*F=0\). Varying (4) yields

\[
\delta\mathcal P
=\int\sum_i
\left[\left(4Q-\frac23\operatorname{tr}(Q^2)I\right)F\right]_i
\wedge(d_Aa)_i.
\]

Thus, with \(q=Q-I\),

\[
\boxed{
A_t=-d_A^*
\left[\left(4Q-\frac23\operatorname{tr}(Q^2)I\right)F\right]
=-4d_A^*\left[\left(q-\frac{|q|^2}{6}I\right)F\right].
}
\tag{5}
\]

There is no extra factor \(2K^2\): the first variation is a wedge pairing of two-forms, whose conversion to the metric pairing already includes the correct volume. Changing the internal metric to \(-\operatorname{tr}\) would change the time scale.

For a smooth solution,

\[
\frac{d\mathcal P}{dt}=-\|A_t\|_A^2.
\tag{6}
\]

On this fixed bundle,

\[
\int\mu_A=\frac{16\pi^2}{3},\qquad
\operatorname{Vol}(\widehat g_A)=\frac{8\pi^2}{3K^2}.
\tag{7}
\]

The metric evolution is therefore automatically volume normalized in the integrated sense.

## 3. Exact metric velocity for an arbitrary connection velocity

Let \(v=A_t\), and decompose its curvature derivative relative to the reconstructed metric:

\[
d_Av=U\Sigma^++V\Sigma^-.
\tag{8}
\]

Let \(\beta:\operatorname{Sym}^2_0(T^*)\to
\operatorname{Hom}(\Lambda^+,\Lambda^-)\) be the linear map giving the variation of the selfdual plane under a trace-free metric variation. Matrices below use rows for the plus index. With compatible choices of the plus and minus bases, for diagonal \(H\),

\[
\beta(H)=\operatorname{diag}
\left(\frac{H_{11}+H_{22}}2,
\frac{H_{11}+H_{33}}2,
\frac{H_{11}+H_{44}}2\right).
\tag{9}
\]

It is an isomorphism. For \(h=\widehat g_t\), differentiating the curvature plane and its volume gives

\[
\boxed{
\beta(h_0)=-\frac1K S^{-1}V,\qquad
\operatorname{tr}_{\widehat g}h
=-\frac4{3K}\operatorname{tr}(SU).
}
\tag{10}
\]

Here \(h_0\) is the trace-free metric endomorphism. Equivalently,

\[
\boxed{
\widehat g_t
=\widehat g\left(
-\frac1K\beta^{-1}(S^{-1}V)
-\frac1{3K}\operatorname{tr}(SU)I
\right),
}
\tag{11}
\]

where \(\widehat g(H)\) means the symmetric tensor \(\widehat g(H\cdot,\cdot)\).

Also,

\[
\boxed{
Q_t=-\frac1K(US+SU^T)
+\frac2{3K}\operatorname{tr}(SU)\,Q.
}
\tag{12}
\]

These formulas are tensorial in a fixed internal bundle identification. A time-dependent internal frame adds the usual commutator to the matrix derivative of \(Q\). It does not change (10)–(11).

For a basis-independent verification, set

\[
Z_{ij}=\frac{(d_Av)_i\wedge F_j}{\mu_A}.
\]

Then \(Z=-US/K\), and

\[
Q_t=Z+Z^T-\frac23\operatorname{tr}Z\,Q,\qquad
\mu_t=\frac23\operatorname{tr}Z\,\mu
=\frac23d\sum_i(v_i\wedge F_i).
\tag{13}
\]

The anti-selfdual curvature derivative \(V\) controls the trace-free metric velocity; it does not enter \(Q_t\) directly. Consequently, bounds on the algebraic defect \(Q-I\) alone are not yet metric derivative estimates. The differential relation imposed by (5) is essential.

### 3.1 The difference from the reconstructed metric's Levi–Civita connection

The curvature determines a normalized selfdual triple

\[
\Sigma_A=-K^{-1}Q^{-1/2}F.
\]

Its covariant exterior derivative is exactly

\[
\boxed{
\mathcal T_A:=d_A\Sigma_A
=-K^{-1}(d_AQ^{-1/2})\wedge F.
}
\tag{13a}
\]

Under this identification of the adjoint bundle with selfdual forms, let
\(b=A-A^+_{\widehat g_A}\). Then
\(\mathcal T_A=[b,\Sigma_A]\). The pointwise map from the twelve components of \(b\) to the twelve components of \([b,\Sigma_A]\) is invertible. Thus \(\mathcal T_A\) determines the difference between these two connections, and

\[
\mathcal T_A=0\quad\Longleftrightarrow\quad
A=A^+_{\widehat g_A}.
\tag{13b}
\]

In particular, \(Q=I\) makes this defect vanish. For \(Q\) uniformly positive, (13a) relates the defect to derivatives of \(Q\); approaching a zero eigenvalue makes the inverse-square-root factors problematic.

This is not the condition of belonging to the image of \(g\mapsto A_g^+\) for some other metric \(g\). A generic \(A_g^+\) is Levi–Civita for \(g\), but not for \(\widehat g_{A_g^+}\). Indeed, since \(F_A\) is selfdual relative to \(\widehat g_A\), (13b) would force \(\widehat g_A\) to be Einstein. The calculation therefore identifies the additional connection information that must be tracked when discussing metric evolution; it does not assert a closed equation in the metric alone.

## 4. Reconstructing a metric from its own chiral spin connection

Now start with an ordinary metric \(g\) near \(g_0\), and put \(A=A_g^+\). Its curvature has the block form

\[
F=-C\Sigma_g^+-B\Sigma_g^-,
\qquad C=W^++\frac{s}{12}I.
\]

Let \(\mathring{\operatorname{Ric}}=\mathcal R\). With the conventions of (9), \(B=\beta(\mathcal R)\), and \(|B|^2=|\mathcal R|^2/4\). Define

\[
M=C^2-BB^T,\quad
\mu_A=\frac23\operatorname{tr}M\,dV_g,\quad
Q=\frac{3M}{\operatorname{tr}M}.
\tag{14}
\]

The curvature plane is the graph \(C^{-1}B\), where \(C\) is invertible near round. It generally differs from \(\Lambda_g^+\).

For \(g_\varepsilon=g_0+\varepsilon h+O(\varepsilon^2)\), differentiation gives

\[
\boxed{
\widehat h
=h+\frac1K\mathcal R'
+\frac{s'}{12K}g_0
=\frac1K\operatorname{Ric}'-2h-\frac{s'}{6K}g_0.
}
\tag{15}
\]

Checks:

* Constant scaling \(h=2cg_0\) gives \(\widehat h=0\).
* A diffeomorphism variation \(h=\mathcal L_Xg_0\) gives \(\widehat h=h\).
* A conformal variation \(h=2fg_0\) gives
  \[
  \widehat h=-\frac2K\nabla^2f
  =-\frac1K\mathcal L_{\nabla f}g_0.
  \tag{16}
  \]
  It disappears modulo diffeomorphisms at first order.
* On TT tensors,
  \[
  \mathcal R'=\frac12(L+2K)h,\quad s'=0,\qquad
  \boxed{\widehat h=\frac{L+4K}{2K}h.}
  \tag{17}
  \]

Thus forward reconstruction amplifies high frequencies. Its inverse on TT tensors is the elliptic smoothing operator \(2K(L+4K)^{-1}\).

For comparison, volume-normalized Ricci flow in dimension four is

\[
g_t=-2\operatorname{Ric}+\frac{\overline s}{2}g.
\]

Its round TT linearization is \(F_{\rm RF}'=-(L+2K)\), so

\[
\widehat h=\left(I-\frac1{2K}F_{\rm RF}'\right)h.
\tag{18}
\]

This resolvent relation alone does not identify the flows. The additional Bianchi calculation in Section 6 does.

## 5. The closed linear evolution of the connection defect

At round, write \(A=A_0+\varepsilon a+\cdots\) and
\(Q=I+\varepsilon q+\cdots\). Equation (5) becomes

\[
a_t=-4d_0^*(qF_0).
\tag{19}
\]

Using \(\Sigma_{i,ab}^+=\eta_{i,ab}\) with the companion note's eta conventions,

\[
(a_t)_{ib}=-4K\eta_{j,ab}\nabla_aq_{ij},\qquad
q=-\frac2K\operatorname{sym}_0U(a).
\]

Here \(U(a)_{ik}=\frac12\eta_{k,ab}\nabla_a a_{ib}\).
Contraction gives

\[
q_{t,ik}
=4\operatorname{sym}_0\left[
\eta_{k,ab}\eta_{j,cb}\nabla_a\nabla_cq_{ij}
\right].
\]

Use

\[
\eta_{k,ab}\eta_{j,cb}
=\delta_{kj}\delta_{ac}+\epsilon_{kjl}\eta_{l,ac},
\]

and the induced adjoint curvature

\[
[\nabla_a,\nabla_c]q_{ij}
=-K\eta_{t,ac}
(\epsilon_{itm}q_{mj}+\epsilon_{jtm}q_{im}).
\]

The commutator term is exactly \(-6Kq\), giving

\[
\boxed{
q_t=-4(L_E+6K)q,\qquad
L_E=\nabla_{A_0}^*\nabla_{A_0}
\text{ on }\operatorname{Sym}^2_0E.
}
\tag{20}
\]

This is a second-order heat equation with a positive zeroth-order term. In particular,

\[
\frac{d}{dt}\|q\|_{L^2}^2
=-8\|\nabla q\|_{L^2}^2-48K\|q\|_{L^2}^2.
\tag{21}
\]

The local volume velocity vanishes to this order: \(\mu_t=O(\varepsilon^2)\). Equation (21) is a linear estimate, not a nonlinear global convergence theorem.

## 6. The exact linear bridge to Ricci flow

Write \(\mathcal Hh=(A_g^+)'_{g_0}h\), using the symmetric coframe identification. More generally, at a metric \(g\), its local formula is

\[
(\mathcal H_g h)_{ib}
=\frac12\eta_{i,cd}\nabla_ch_{bd}.
\tag{22}
\]

Let \(D h=(W^+)'_{g_0}h\). The contracted Bianchi identity implies

\[
d_A^*(W^+\Sigma^+)
=-\mathcal H_g(\mathcal R)
-\frac1{12}\mathcal H_g(sg).
\tag{23}
\]

For example, with
\((W^+\Sigma^+)_{i,ab}=\frac12\eta_{i,cd}W_{abcd}\),
the divergence identity used is

\[
\nabla^aW_{abcd}
=\frac12(\nabla_c\mathcal R_{bd}-\nabla_d\mathcal R_{bc})
+\frac1{24}(g_{bd}\nabla_cs-g_{bc}\nabla_ds).
\]

Its contraction gives both coefficients in (23).

For a TT perturbation of round, \(s'=0\), and hence

\[
d_0^*(Dh\,\Sigma^+)=-\mathcal H(\mathcal R'),\qquad
\mathcal R'=\frac12(L+2K)h.
\]

Since \(q=2Dh/K\) and \(F_0=-K\Sigma^+\), equation (19) yields

\[
\boxed{
a_t=8d_0^*(Dh\,\Sigma^+)
=-8\mathcal H(\mathcal R')
=\mathcal H[-4(L+2K)h].
}
\tag{24}
\]

This proves preservation of the linearized Levi–Civita image for TT data, not merely equality after projection onto that image. No extra internal gauge term is required in the stated symmetric identification.

Applying the linear reconstruction map (17), which commutes with \(L\), gives

\[
\boxed{
\widehat h_t=-4(L+2K)\widehat h.
}
\tag{25}
\]

After the time change \(\tau=4t\), this is precisely the TT linearization of volume-normalized Ricci flow. For a TT eigenmode \(Lh=\lambda h\),

\[
h(t)=e^{-4(\lambda+2K)t}h(0).
\]

The smallest round TT rough-Laplacian eigenvalue is \(8K\); thus these mode amplitudes decay at least as \(e^{-40Kt}\). The sphere spectral convention is the one checked in the companion note against [2].

The claim is specifically on the TT sector. For general variations, (23) gives

\[
a_t=\mathcal H[-8\mathcal R'-(2/3)s'g_0].
\tag{26}
\]

For \(h=2fg_0\), \(Dh=0\), so \(q=a_t=0\) to first order. This is not the general conformal evolution of normalized Ricci flow.

An independent normalization check is

\[
\mathcal H^*\mathcal H=\frac14(L+4K)
\quad\text{on TT tensors}.
\tag{27}
\]

Together with the metric Hessian below, this gives the same projected rate as (24). Equation (23) supplies the stronger image-preservation statement that the energy check alone would not establish.

## 7. Why the metric gradient is fourth order

Put \(\mathcal P_{\rm met}(g)=\mathcal P(A_g^+)\) and
\(\mathcal E_+(g)=\int|W^+|^2\,dV_g\), using the Hilbert–Schmidt curvature-operator norm.

The companion calculation established

\[
\mathcal P_{\rm met}(g_0+\varepsilon h)
=8\varepsilon^2\|Dh\|^2+O(\varepsilon^3),\qquad
D^*D=\frac1{16}(L+2K)(L+4K)
\quad\text{on TT}.
\]

Therefore

\[
\begin{aligned}
-\operatorname{grad}\mathcal P_{\rm met}:\quad&
h_t=-(L+2K)(L+4K)h,\\
-\operatorname{grad}(\mathcal P_{\rm met}/8):\quad&
h_t=-\frac18(L+2K)(L+4K)h,\\
-\operatorname{grad}\mathcal E_+:\quad&
h_t=-\frac18(L+2K)(L+4K)h.
\end{aligned}
\tag{28}
\]

The Hessian comparison uses the quadratic-curvature variation formulas in [2], with norm conversions explained in the companion note.

The first two metric flows are formal negative-gradient equations here; the TT calculation by itself does not prove nonlinear well-posedness on the full space of metrics. In particular, their conformal degeneracy at round must be treated correctly. Unlike the Weyl energy, \(\mathcal P_{\rm met}\) is not generally invariant under nonconstant conformal changes, so its linear conformal kernel is not an exact nonlinear gauge symmetry.

## 8. First nonlinear differences between the metric energies

Use moving \(g_\varepsilon\)-orthonormal frames and expansions without factorials:

\[
W^+=\varepsilon W_1+\varepsilon^2W_2+\cdots,\quad
B=\varepsilon B_1+\varepsilon^2B_2+\cdots,\quad
a=s/12=K+\varepsilon a_1+\varepsilon^2a_2+\cdots.
\]

From (14),

\[
Q-I=\frac{2\varepsilon}{K}W_1+
\varepsilon^2\left[
\frac2K W_2-\frac{2a_1}{K^2}W_1
+\frac{(W_1^2-B_1B_1^T)_0}{K^2}
\right]+O(\varepsilon^3).
\tag{29}
\]

The exact metric functional is

\[
\mathcal P_{\rm met}
=6\int
\frac{|[2aW^++(W^+)^2-BB^T]_0|^2}
{\operatorname{tr}[(aI+W^+)^2-BB^T]}\,dV_g.
\tag{30}
\]

Expanding through cubic order gives

\[
\boxed{
\frac{\mathcal P_{\rm met}(g_\varepsilon)}8
-\mathcal E_+(g_\varepsilon)
=\frac{\varepsilon^3}{K}
\int\left[
\operatorname{tr}(W_1^3)
-\operatorname{tr}(W_1B_1B_1^T)
\right]dV_0+O(\varepsilon^4).
}
\tag{31}
\]

Scalar-curvature, volume-variation, and second-path-coefficient contributions cancel from this difference. Let \(Jh=B'_{g_0}h\). With background formal adjoints,

\[
\operatorname{grad}
(\mathcal P_{\rm met}/8-\mathcal E_+)
=\frac{\varepsilon^2}{K}
\left\{
D^*[3(W_1^2)_0-(B_1B_1^T)_0]
-2J^*(W_1B_1)
\right\}+O(\varepsilon^3).
\tag{32}
\]

Thus the two normalized metric gradients first differ at quadratic order. These are nonlinear fourth-order terms, even though individual products may contain six derivatives in total.

There is a concrete nonpreservation example. In round normal coordinates near \(p\), choose a smooth cutoff equal to one there and set

\[
f=\tfrac12(y^1)^2y^2,\qquad g_\varepsilon=e^{2\varepsilon f}g_0.
\]

This metric is exactly conformally flat. The jet needed at \(p\) is

\[
N=(B_1B_1^T)_0
=(y^1)^2\operatorname{diag}(-2/3,1/3,1/3).
\]

Direct calculation gives

\[
D^*N(p)=\operatorname{diag}(0,1/3,-1/6,-1/6).
\tag{33}
\]

Since \(N(p)=\nabla N(p)=0\), lower-order background-curvature terms do not affect this value. On this family,

\[
-\operatorname{grad}\mathcal E_+=0,\qquad
-\operatorname{grad}(\mathcal P_{\rm met}/8)
=\frac{\varepsilon^2}{K}D^*N+O(\varepsilon^3).
\]

The global field \(D^*N\) is TT and nonzero. The positive TT Hessian shows that \(D(D^*N)\ne0\). Consequently the metric-gradient vector field of \(\mathcal P_{\rm met}/8\) need not preserve conformal flatness.

This is a statement about the metric pullback gradient. It does not establish the analogous claim for the independent connection flow (5).

## 9. Second-order reconstruction

Write \(\mathcal R=\varepsilon\mathcal R_1+\varepsilon^2\mathcal R_2+\cdots\) and \(s=12K+\varepsilon s_1+\varepsilon^2s_2+\cdots\). Represent the reconstructed metric as

\[
\widehat g=g_\varepsilon(c_\varepsilon e^{H_\varepsilon}\cdot,\cdot),
\qquad \operatorname{tr}H_\varepsilon=0.
\]

For the logarithmic metric variable, the graph is
\(T=\beta(H)+O(H^3)\); its quadratic term vanishes. Expanding \(T=C^{-1}B\) gives

\[
H_1=\frac{\mathcal R_1}{K},\qquad
H_2=\frac{\mathcal R_2}{K}
-\frac{s_1\mathcal R_1}{12K^2}
-\frac{\beta^{-1}(W_1B_1)}{K^2}.
\tag{34}
\]

The scale factor is

\[
c_\varepsilon
=1+\frac{\varepsilon s_1}{12K}
+\varepsilon^2\left[
\frac{s_2}{12K}+
\frac{|W_1|^2-|B_1|^2}{6K^2}
\right]+O(\varepsilon^3).
\tag{35}
\]

In \(c_\varepsilon e^{H_\varepsilon}\), the scalar–Ricci mixed terms cancel. The remaining quadratic terms include
\(\mathcal R_1^2/(2K^2)\),
\(-\beta^{-1}(W_1B_1)/K^2\), and
\((|W_1|^2-|B_1|^2)I/(6K^2)\).
These are reconstruction corrections, not yet the complete quadratic evolution of (5).

## 10. A concrete obstruction to energy-only metric control

Consider a different conformal perturbation near \(p\):

\[
f=\frac{(y^1)^2-(y^2)^2}{2},\qquad
g_\varepsilon=e^{2\varepsilon f}g_0,\qquad z=\varepsilon/K.
\]

At \(p\), \(f=df=0\). Exactly, \(C=KI\) and
\(B=\varepsilon\operatorname{diag}(0,-1,-1)\). For \(|z|<1\),

\[
\boxed{
\widehat g(p)
=\sqrt{1-\frac23z^2}\,
\operatorname{diag}
\left(
\frac{1-z}{1+z},
\frac{1+z}{1-z},
1,1
\right)
}
\tag{36}
\]

relative to \(g_\varepsilon(p)=g_0(p)\).

As \(z\to1\), the reconstructed metric becomes arbitrarily anisotropic even though the source metric stays regular. Meanwhile,

\[
Q\longrightarrow\operatorname{diag}(3,0,0),\quad
|Q-I|^2\longrightarrow6,\quad
|Q-I|^2\frac{\mu_A}{dV_g}
=\frac{4K^2z^4}{3-2z^2}\longrightarrow4K^2.
\tag{37}
\]

This is a local algebraic diagnostic, not a degenerating solution of (5). A global cutoff might cause loss of definiteness elsewhere first.

In fact, \(Q>0\), \(\operatorname{tr}Q=3\) already imply
\(0\le|Q-I|^2<6\). On this fixed bundle every definite connection therefore satisfies \(\mathcal P<32\pi^2\). A finite upper bound on this energy cannot by itself prevent approach to the boundary of definiteness. Quantitative control must include a lower bound for \(\lambda_{\min}Q\), as well as control of the metric scale, derivatives, and concentration.

## 11. Interpretation and the next calculation

The connection approach passes a meaningful local test: its propagating TT metric modes have exactly the normalized-Ricci linear generator after a time rescaling. This supports a geometric-flow interpretation of the proposed Riemannian extension. It does not use the restricted holomorphic Walker sector of the wave-metric manuscript.

The remaining nonlinear questions are now sharper:

1. Derive the quadratic reconstructed metric velocity from (5), (8), and (11), and compare it with normalized Ricci flow modulo diffeomorphisms. The energy comparison in Section 8 is not a substitute for this independent-flow calculation.
2. Track the difference between \(A\) and the chiral Levi–Civita connection of \(\widehat g_A\). This is the extra geometric information preventing an automatic metric-only Ricci equation.
3. Determine whether a lower bound on \(\lambda_{\min}Q\) can be propagated, together with derivative and noncollapse estimates. Section 10 identifies a failure of energy-only control.
4. Separate local stability near round from existence of appropriate initial definite connections and global flow control on an arbitrary smooth homotopy four-sphere.

For a smooth-Poincare application, the last point remains essential: a local calculation around the already standard sphere does not supply the needed global construction or convergence theorem. The useful research target is a quantitative preservation estimate for the definite-connection regime.

## References and verification

[1] Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, arXiv:1111.5005v2.  
https://arxiv.org/html/1111.5005v2

[2] Matthew J. Gursky and Jeff A. Viaclovsky, *Rigidity and stability of Einstein metrics for quadratic curvature functionals*, arXiv:1105.4648v2.  
https://arxiv.org/html/1105.4648v2

Equations (10)–(37) are derivations and checks for this exploration, not claims of novel results. The cited papers supply the established flow framework and metric-Hessian background.

The standard-library Python script below uses exact rational arithmetic. It checks the second-order \(Q\) expansion and cubic energy discrepancy with noncommuting matrices, the curvature contraction \(-6Kq\) on a full basis of symmetric trace-free \(3\times3\) matrices, the metric degeneration formula, and the adjoint source in (33). These are algebraic checks, not substitutes for the differential-geometric arguments above.



```python
"""Exact rational checks for the second S4 note; no external dependencies."""
from fractions import Fraction as F
from itertools import product, combinations

def mat(n,m=None): return [[F(0) for _ in range(m or n)] for _ in range(n)]
def eye(n): return [[F(i==j) for j in range(n)] for i in range(n)]
def add(A,B): return [[a+b for a,b in zip(x,y)] for x,y in zip(A,B)]
def scale(c,A): return [[c*a for a in row] for row in A]
def tr(A): return sum(A[i][i] for i in range(len(A)))
def trans(A): return list(map(list,zip(*A)))
def mul(A,B): return [[sum(a*b for a,b in zip(row,col)) for col in zip(*B)] for row in A]
def inner(A,B): return sum(a*b for x,y in zip(A,B) for a,b in zip(x,y))
def tf(A): return add(A,scale(-tr(A)/len(A),eye(len(A))))

# Noncommuting curvature data and series coefficients.
I=eye(3); K=F(3,2); a1=F(2,5); a2=F(-1,3)
W1=[[F(1),F(2),F(-1)],[F(2),F(-3),F(4)],[F(-1),F(4),F(2)]]
W2=[[F(2),F(-1),F(3)],[F(-1),F(1),F(2)],[F(3),F(2),F(-3)]]
B1=[[F(1),F(2),F(3)],[F(-2),F(1),F(4)],[F(0),F(-1),F(2)]]
C1=add(W1,scale(a1,I)); C2=add(W2,scale(a2,I))
M1=scale(2*K,C1)
M2=add(add(mul(C1,C1),scale(2*K,C2)),scale(-1,mul(B1,trans(B1))))
t0=3*K*K; t1=tr(M1); t2=tr(M2)
q1=add(scale(3/t0,M1),scale(-t1/t0,I))
q2=add(add(scale(3/t0,M2),scale(-3*t1/t0**2,M1)),scale(t1*t1/t0**2-t2/t0,I))
expected=add(add(scale(2/K,W2),scale(-2*a1/K**2,W1)),scale(1/K**2,tf(add(mul(W1,W1),scale(-1,mul(B1,trans(B1)))))))
assert q1==scale(2/K,W1) and q2==expected
mu0=2*K*K; mu1=F(2,3)*t1
P3=2*inner(q1,q2)*mu0+inner(q1,q1)*mu1
E3=2*inner(W1,W2)
cubic=(tr(mul(mul(W1,W1),W1))-tr(mul(W1,mul(B1,trans(B1)))))/K
assert P3/8-E3==cubic
print('Second-order Q and cubic energy discrepancy: exact checks passed')

def eps(i,j,k):
    if len({i,j,k})<3: return 0
    return 1 if (i,j,k) in ((0,1,2),(1,2,0),(2,0,1)) else -1
def eta(i,a,b):
    if a<3 and b<3: return eps(i,a,b)
    if a<3 and b==3: return int(i==a)
    if a==3 and b<3: return -int(i==b)
    return 0

# Algebraic curvature term in the closed linear Q equation, K=1.
basis=[]
for i in (0,1):
    q=mat(3);q[i][i]=1;q[2][2]=-1;basis.append(q)
for i,j in combinations(range(3),2):
    q=mat(3);q[i][j]=q[j][i]=1;basis.append(q)
for q in basis:
    result=mat(3)
    for a,c in product(range(4),repeat=2):
        curvature=[[sum(-eta(m,a,c)*eps(m,j,i) for m in range(3)) for j in range(3)] for i in range(3)]
        comm=add(mul(curvature,q),scale(-1,mul(q,curvature)))
        for i,k,j,l in product(range(3),repeat=4):
            result[i][k]+=F(1,2)*eps(k,j,l)*eta(l,a,c)*comm[i][j]
    result=tf(scale(F(1,2),add(result,trans(result))))
    assert result==scale(-6,q)
print('Linear connection-defect curvature term: -6 K q verified on all five basis elements')

# Exact degenerating conformal jet: graph and finite energy density.
for z in (F(0),F(1,3),F(2,3),F(9,10)):
    d1=(1-z)/(1+z); d2=1/d1; shape=[d1,d2,F(1),F(1)]
    # Product along the first pair gives graph0; the other two give -z.
    assert (d1-1)/(d1+1)==-z
    assert shape[0]*shape[1]*shape[2]*shape[3]==1
    M=[[F(i==j)*(1 if i==0 else 1-z*z) for j in range(3)] for i in range(3)]
    Q=scale(3/tr(M),M)
    density=inner(add(Q,scale(-1,I)),add(Q,scale(-1,I)))*F(2,3)*tr(M)
    assert density==4*z**4/(3-2*z*z)
print('Reconstructed metric graph and finite boundary energy density verified')

# Formal adjoint D* N at p from the principal symbol, N=(y1)^2 diag(-2/3,1/3,1/3).
pairs=list(combinations(range(4),2))
plus=[[1,0,0,0,0,1],[0,1,0,0,-1,0],[0,0,1,1,0,0]]
N2=[[F(-4,3),0,0],[0,F(2,3),0],[0,0,F(2,3)]]
def symbol(h):
    def R(i,j,k,l):
        return F(1,2)*(int(j==k==0)*h[i][l]+int(i==l==0)*h[j][k]-int(j==l==0)*h[i][k]-int(i==k==0)*h[j][l])
    ric=[[sum(R(a,i,a,j) for a in range(4)) for j in range(4)] for i in range(4)]
    s=tr(ric)
    def W(i,j,k,l):
        wedge=ric[i][k]*int(j==l)+ric[j][l]*int(i==k)-ric[i][l]*int(j==k)-ric[j][k]*int(i==l)
        return R(i,j,k,l)-wedge/2+s/F(6)*(int(i==k)*int(j==l)-int(i==l)*int(j==k))
    wm=[[W(i,j,k,l) for k,l in pairs] for i,j in pairs]
    return scale(F(1,2),mul(mul(plus,wm),trans(plus)))
adj=mat(4)
for i in range(4):
    for j in range(i,4):
        h=mat(4);h[i][j]=h[j][i]=F(1)
        adj[i][j]=adj[j][i]=inner(symbol(h),N2)/(1 if i==j else 2)
assert adj==[[([F(0),F(1,3),F(-1,6),F(-1,6)][i] if i==j else F(0)) for j in range(4)] for i in range(4)]
print('Conformally-flat metric-flow counterexample: adjoint source verified')

```
