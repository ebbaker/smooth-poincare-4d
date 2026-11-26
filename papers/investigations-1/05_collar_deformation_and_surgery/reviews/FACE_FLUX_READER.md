# Signed chiral flux across a common face, independent readback

26 November 2026, America/New_York · Prepared for Edward B. Baker III with OpenAI Codex assistance. Item 2 of the [frozen reader request](../research-progress/handoffs/TWO_ATTACHMENTS_INDEPENDENT_20261126.md). The request specifies GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. I read [BOUNDARY_TRANSGRESSION.md](../01_collar_deformation_and_adapted_coordinates/notes/BOUNDARY_TRANSGRESSION.md) at SHA-256 `1900b0d44b761f7d550468d53013cfcc15b4d4c9d50d9c02065d0d9d92931491`, recomputed the local and integrated identities, and checked the physical disk and height applications. The input repository commit is `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`.

The oriented relative identity, its coefficient, and the vanishing height test check. The E61 collar gives an incoming imbalance bound and a conditional average over parallel leaves. A finite connector charge and the sign of its endpoint still depend on the physical geometry of the selected marked face.

## Real tangent trace and the orientation sign

On an oriented smooth Riemannian four-manifold, write $F$ for the matrix of curvature two-forms of the real tangent connection. In an orthonormal frame skewness gives

$$
-\tfrac12\operatorname{tr}(F\wedge F)=\sum_{a<b}F_{ab}\wedge F_{ab}
=\operatorname{tr}(\mathcal R^* *\mathcal R)\,dV.
$$

The six forms in the sum are the six rows of the curvature operator $\mathcal R$ in the orthonormal simple two-form basis, up to the uniform row sign used for curvature forms. In the $\Lambda^+\oplus\Lambda^-$ frame, the positive and negative output traces cancel the paired Ricci off-diagonal blocks. The equal scalar diagonal terms cancel, including their cross terms with Weyl since both Weyl blocks are trace-free. Thus the expression is $\Theta=(|W^+|_{\rm HS}^2-|W^-|_{\rm HS}^2)dV$. The factor in the standard real Pontryagin polynomial is $-1/(8\pi^2)$ times the same trace, so $\Theta=4\pi^2p_1$. On a smooth oriented closed four-manifold $\int p_1=3\tau$, giving $12\pi^2\tau$ for the signed energy. [Chern–Simons, real trace polynomial in §6, p. 64](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf) · [Hirzebruch, §4, (16)](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/84/1/signature%20theorem.pdf) · [Master norm convention](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

For two connections on the same bundle with difference $A=\nabla_1-\nabla_0$, differentiation of $\Theta_t$ and the Bianchi identity give $d[-\operatorname{tr}(A\wedge F_t)]$. Integrating

$$
F_t=F_0+t\,d_{\nabla_0}A+t^2A\wedge A
$$

gives $Q=-\tfrac12\operatorname{tr}[A\wedge(F_1+F_0)-A\wedge A\wedge A/3]$ with $\Theta_1-\Theta_0=dQ$. The form $Q$ is defined on the common bundle, with its frame-invariant matrix trace. [Chern–Simons, §3, Proposition 3.2 and (3.3)–(3.4)](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf) · [Master connected repair](../../../master/01_fixed_type_variational_descent/manuscript/connected_repair.tex)

Let $Y=\partial D$ have the outward-first orientation from the disk. The boundary splitting $TY\oplus\mathbb R\nu$ uses $\nu$ pointing from $D$ to the complete exterior $V$. For $k(X)=\nabla_X^g\nu$ and $\mathsf D=d_{\nabla^h}$ the product-to-source connection difference has upper-right block $k$, lower-left $-k^{\mathsf T}$, and zero diagonal. The product curvature is block diagonal. In the trace of $A\wedge F_t$ only the product of $A$ with the mixed curvature $t\,d_{\nabla^0}A$ contributes. In fact

$$
\operatorname{tr}(A\wedge d_{\nabla^0}A)=-2\sum_jk^j\wedge\mathsf D k^j.
$$

One copy comes from the tangent diagonal entries and one from the normal entry. Integrating $-t$ against this trace gives $+q_h(K)=+\langle k\wedge\mathsf Dk\rangle$. For a reference filling $(B,b)$ with identical face metric and boundary isometry preserving the two outward-first orientations, its analogous term is $+q_h(S)$ relative to its own product reference. Subtracting productized fillings glues $D\cup_Y(-B)$, producing

$$
\delta_g(D)-\delta_b(B)=12\pi^2\tau(D\cup_Y(-B))+\int_Y(q_h(K)-q_h(S)),\qquad \delta_g=E_+-E_-.
$$

For two balls, Mayer–Vietoris gives zero middle homology over $\mathbb R$. For general $B$ with $\partial B\simeq S^3$, the long exact pair sequence identifies absolute and relative middle groups and the intersection pairing enters with the sign of $-B$. The topological term is then $-12\pi^2\tau(B)$. This is a real equality from the productized gluing. The outward normal of $V$ is $-\nu$ and reverses $K$, giving $q_h(-K)=q_h(K)$. The opposite boundary orientation gives the minus sign for the exterior integral. This agrees with $\delta_g(V)=-\delta_g(D)$ on the homotopy sphere.

## Trace, curvature derivatives and the height case

Let $\vartheta(X)=X$ on $TY$. For the one-form $u$ of any symmetric endomorphism, $\langle u\wedge\vartheta\rangle=0$. Torsion-freeness gives $\mathsf D\vartheta=0$ and differentiating the pairing gives $\langle\vartheta\wedge\mathsf Du\rangle=0$. Thus terms added by $u\mapsto u+f\vartheta$ vanish in $q_h$ pointwise, including the term from $df\wedge\vartheta$. Put $a(X)=(K-S)^\circ X$, $s(X)=SX$. Before integration the difference is

$$
q_h(K)-q_h(S)=\langle a\wedge\mathsf Da\rangle+2\langle a\wedge\mathsf Ds\rangle-d\langle s\wedge a\rangle.
$$

Here $d\langle s\wedge a\rangle=\langle\mathsf Ds\wedge a\rangle-\langle s\wedge\mathsf Da\rangle$. This fixes the exact-term sign. The integral on the closed face drops the last term. Direct transgression from $s$ to $k$ gives the first two terms with the same coefficient. In a space form $\mathsf Ds=0$ by Codazzi. More generally if the reference is conformally flat, its mixed curvature in Codazzi arises only from the Schouten tensor and is of the form $\beta\wedge\vartheta$. It pairs to zero with $a$, so the mixed term also vanishes in that case. The corresponding source-side replacement of $\mathsf D k$ by the mixed Weyl form in the Euclidean estimate uses exactly this cancellation. An edge term survives on a face with boundary unless its trace is controlled, for example by lateral clamping of the metric on a shaft. [Connected repair](../../../master/01_fixed_type_variational_descent/manuscript/connected_repair.tex)

The frozen examples give the stated orders. In the oriented round left-invariant frame, $\nabla_{e_j}e_k=\epsilon_{jki}e_i$. For a constant diagonal shape with eigenvalues $l_i$, the $e_i$ component of $\mathsf Du(e_j,e_k)$ along a cyclic triple is $l_k+l_j-2l_i$. It yields $q_h(L)=((\operatorname{tr}L)^2-3|L|^2)dA_h$. A trace-free $L$ therefore gives a genuinely quadratic example over the Euclidean reference and a nonzero linear term over a curved reference with prescribed $L$ jet.

For the transverse Euclidean height, decompose the unit conormal of the four-manifold as $\alpha v+\beta n$, where $v$ is the unit height vector and $n$ the outward convex normal in the height plane. Tangential differentiation yields $K=\beta S$ with $|\beta|<1$. Since $\mathsf Ds=0$ for the Euclidean height filling, $\mathsf Dk=d\beta\wedge s$. Every term in $\langle k\wedge\mathsf Dk\rangle$ wedges the corresponding component $s^j$ twice, so the flux vanishes pointwise. The trace-free mismatch is still $(\beta-1)S^\circ$. Independently the four-dimensional hypersurface's principal frame diagonalizes $\mathcal R$ on simple two-forms. The Hodge star has zero diagonal in that basis, so the two chiral densities agree at every point. Their equality persists under smooth positive conformal changes. An angularly varying conformal change can alter the face metric and its convex realization, so the shape computation refers to the induced gauge. Conformal immersion does not identify this height with the particular E61 marked disk. [Convex height readback](CURVED_FILL_READER.md#transverse-euclidean-height) · [Chern–Simons, Theorem 5.14, p. 64](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf)

## What carries through on the E61 marking

Pointwise $|\Theta_g|\le (|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)dV\le |\mathrm{Rm}_g|_{\rm tens}^2dV/4$. The factor $1/4$ converts the ordered four-index tensor norm to the Hilbert–Schmidt norm of the real two-form curvature operator. It bounds the disk imbalance by $\zeta/4$ under the physical comparison-ball ceiling, and also bounds its change between parallel faces by one quarter of the intervening raw curvature integral. The mixed Codazzi form is one off-diagonal block for $\Lambda^2=(\nu\wedge TY)\oplus\Lambda^2(TY)$. The two off-diagonal blocks have equal squared Hilbert–Schmidt norms, so in ordinary exterior-form norms one can sharpen the frozen conservative coarea factor $1/4$ to $1/8$ of the tensor curvature integral. Specifically a supplied normal strip of width $w$ contains a face with $\|\mathsf D k_t\|_2^2\le\nu_i(U_i)/(8w)$. The mixed Weyl block likewise costs at most one half of $|W^+|^2+|W^-|^2$ pointwise. Neither averaged statement controls the original face. The reference metric, trace-free mismatch and derivative would have to be supplied on the same parallel face as the estimate. Corollary `cor:thin-raw-collar` permits reselection with the tolerance and gives no uniform physical Gaussian width or derivative bound. [E61 selection and thin raw collar](../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) · [Physical source audit](../notes/SOURCE_WITNESSES.md)

For a one-sided smoothing on a marked replacement ball, the entire exterior $V_i$ is unchanged and the smoothed cap's outward shape is the source $K$. The increment of its signed energy relative to its reference is $\mathcal F_Y$ from the relative formula, at every smooth connector width. A conformally flat reference leaves only the strip energies $c_\pm$, so $c_+-c_-=m_i^+-m_i^-$. Consequently $c_\pm\ge\max(0,\pm\mathcal F_Y)$, and $m_i^+-c_+=m_i^--c_-=\min_\pm m_i^\pm-\min_\pm c_\pm$. This is the common full gain because the complete exterior energies cancel in each signed comparison. When the ball replacement extends in the actual marking and has positive Yamabe sign, that common gain is at most $d_i=e_i-I^+(M)$. The identity constrains the difference of charges even when the trace-free mismatch forces both charges to grow as the width decreases. A small flux thus leaves the two-sign cost and the endpoint sign to their independent estimates. Neither the height calculation nor the raw E61 estimates supply a tested positive strict saving on an actual selected disk. [Finite connector](../01_collar_deformation_and_adapted_coordinates/notes/FINITE_CURVED_CONNECTOR.md)
