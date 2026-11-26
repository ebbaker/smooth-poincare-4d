# Signed chiral energy at a face shared by two fillings

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. SUR-B03/DEF-E03d, [issue 1](../../research-progress/handoffs/TWO_ATTACHMENTS_AND_FACE_ERROR_20261126.md), input commit `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. The packet specified GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. This is a relative identity for smooth oriented Riemannian metrics, with finite-source consequences and a checked immersed-height case. The [preceding assessment](../../reviews/PENULTIMATE_CUTS_AND_CURVED_FILLINGS_20261126.md) pins the three manuscript inputs.

## Orientation and characteristic normalization

Let $D$ be a smoothly parametrized closed four-ball in an oriented homotopy four-sphere $(M,g)$, $V=M\setminus\operatorname{int}D$, and $Y=\partial D$ with outward-first orientation. The unit normal $\nu$ on $Y$ points from $D$ into $V$. Write $h=g|_{TY}$ and $KX=\nabla_X^g\nu$. Let $(B,b)$ be a compact oriented smooth filling with an identified entire boundary. Pull back its face metric and shape along an orientation-preserving boundary isometry $Y\to\partial B$, so its face metric is also $h$ and its outward shape is $S$. The initial Euclidean case uses a strictly convex ball $B$ with its convex outward shape. Set

$$
\delta_g(U)=E_+(g;U)-E_-(g;U),\qquad
\Theta_g=(|W_g^+|_{\mathrm{HS}}^2-|W_g^-|_{\mathrm{HS}}^2)dV_g.
$$

For the curvature form $F_g$ of the real tangent connection,

$$
\Theta_g=-\tfrac12\operatorname{tr}(F_g\wedge F_g)=4\pi^2p_1(\nabla^g).
\tag{1}
$$

Indeed $F_{ba}=-F_{ab}$ in an orthonormal frame and the first trace expression is $\sum_{a<b}F_{ab}\wedge F_{ab}$. Its coefficient relative to $dV_g$ is $\operatorname{tr}(\mathcal R^* *\mathcal R)$ on real two-forms. The squared norms of the two off-diagonal Ricci blocks cancel, as do the squared scalar terms. The scalar-Weyl cross terms vanish by trace-freeness. The real trace convention $p_1=-\operatorname{tr}(F\wedge F)/(8\pi^2)$ therefore gives $\int_X\Theta=12\pi^2\tau(X)$ on closed oriented smooth four-manifolds. [Master normalization](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Hirzebruch, §4, (16)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirzrem.pdf)

Let $k$ and $s$ be the $TY$-valued one-forms $X\mapsto KX$ and $X\mapsto SX$, and let $\mathsf D=d_{\nabla^h}$. For $TY$-valued forms $u,v$, use $\langle u\wedge v\rangle=\sum_a u^a\wedge v^a$ in an $h$-orthonormal frame. Put $q_h(K)=\langle k\wedge\mathsf D k\rangle$. On $TY\oplus\mathbb R$, in the splitting with outward unit normal in the last component, the pullback tangent connection from $D$ has matrix

$$
\nabla^0+A_k,qquad
\nabla^0=\nabla^h\oplus d,\qquad
A_k=\begin{pmatrix}0&k\\-k^{\mathsf T}&0\end{pmatrix}.
$$

For two connections on a common real bundle put $A=\nabla_1-\nabla_0$. Along the affine connection path the Bianchi identity gives $\partial_t\operatorname{tr}(F_t\wedge F_t)=2d\operatorname{tr}(A\wedge F_t)$. Thus their signed-density transgression is

$$
\Theta_1-\Theta_0=dQ,\qquad
Q=-\tfrac12\operatorname{tr}\left(A\wedge(F_1+F_0)-\tfrac13A\wedge A\wedge A\right).
\tag{2}
$$

Against the product boundary connection only $-\tfrac12\operatorname{tr}(A_k\wedge d_{\nabla^0} A_k)$ contributes. The terms with product curvature or three off-diagonal factors have zero trace. In the surviving trace the tangent and normal diagonal entries each give $-\langle k\wedge\mathsf D k\rangle$. This gives $q_h(K)$ with coefficient $+1$ in (1). [Chern–Simons, §3, Proposition 3.2, (3.3)–(3.4) and Proposition 3.8](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf) · [Master connected repair](../../../../master/01_fixed_type_variational_descent/manuscript/connected_repair.tex)

Replace both metric germs by product germs with the same $h$, using a smooth cutoff within their own collars. Formula (2) gives the signed change between each original filling and its productized representative as $\int_Y q_h$ of that filling's outward shape. The productized metrics glue smoothly on $X=D\cup_Y(-B)$, so the exact relative identity is

$$
\boxed{\delta_g(D)-\delta_b(B)=12\pi^2\tau(D\cup_Y(-B))
       +\int_Y\bigl(q_h(K)-q_h(S)\bigr).}
\tag{3}
$$

The topological term is zero for two balls by Mayer–Vietoris over $\mathbb R$, since their common boundary is $S^3$. For other fillings of $S^3$ it is $-12\pi^2\tau(B)$, with signature taken on the relative intersection form. In fact the maps $H_2(B)\to H_2(B,\partial B)$ and $H_2(B)\to H_2(X)$ are isomorphisms over $\mathbb R$, and the latter preserves intersection in the $B$ orientation before the reversal. The spherical face has no integer ambiguity in (3). On the original homotopy sphere, $\delta_g(V)=-\delta_g(D)$. Taking the exterior outward normal replaces $K$ by $-K$, which leaves $q_h$ unchanged as a form. Reversing the orientation of $Y$ changes the sign of its integral. Gluing $B$ as a metric replacement on the same smooth type also requires the actual boundary identification to extend across the parametrized disk. For a convex Euclidean ball this is the extension used in the [preceding filling check](../../reviews/CURVED_FILL_READER.md#intrinsic-reconstruction-and-the-marking).

## The trace-free difference and finite bounds

Use $A=(K-S)^\circ$ and $a(X)=AX$. For any symmetric shape $K$ and smooth function $f$, $q_h(K+f\operatorname{Id})=q_h(K)$ pointwise. To see this, write $\vartheta(X)=X$. Then $\mathsf D\vartheta=0$ by torsion-freeness, and $\langle k\wedge\vartheta\rangle=0$ by symmetry. Differentiating the zero pairing also gives $\langle\vartheta\wedge\mathsf D k\rangle=0$. All added terms vanish, including those involving $df$. The same reasoning allows trace removal in the mixed pairings below. On the closed face integration by parts yields

$$
\mathcal F_Y:=\int_Y(q_h(K)-q_h(S))
    =\int_Y\left(\langle a\wedge\mathsf D a\rangle+2\langle a\wedge\mathsf D s\rangle\right).
\tag{4}
$$

After the trace is removed, the integrands differ by the exact term $-d\langle s\wedge a\rangle$. Equivalently the affine path between the two restricted connections, identifying the face normals and using their common $\nabla^h$, gives the integrand on the right as its relative $Q$. Euclidean and space-form shapes are Codazzi, so $\mathsf D s=0$ there. In particular, for a Euclidean reference $\delta_g(D)=\mathcal F_Y$, exactly quadratic in the trace-free defect and its tangential exterior covariant derivative. For a curved reference the mixed term is generally present and $\delta_b(B)$ is part of the raw signed balance. If $A=0$, the right side of (4) vanishes for any reference. These calculations require identical induced face metrics. With different face metrics there is also an intrinsic connection difference in (2).

With ordinary exterior-form norms, the Euclidean estimates at a physical face are

$$
|\mathcal F_Y|\le\|a\|_{L^p(Y,h)}\|\mathsf D a\|_{L^{p'}(Y,h)},\qquad
|\mathcal F_Y|\le\|a\|_{L^2(Y,h)}\|\mathsf D k\|_{L^2(Y,h)}.
\tag{5}
$$

The second follows since $\mathsf D s=0$ and the removed trace term pairs to zero. In the general curved case add $2\|a\|_{L^p}\|\mathsf D s\|_{L^{p'}}$ to the first bound. The pair $p=3$, $p'=3/2$ is scale invariant in physical length, since shape has inverse-length units and its tangential derivative has inverse-square units. At one fixed face bounded $C^1$ defect of size $\epsilon$ gives $O(\epsilon^2)$ for a Codazzi reference and generally $O(\epsilon)$ for a curved reference with bounded $\mathsf D s$. A bound on $K-S$ alone supplies no bound on the differentiated factor without independent mixed-curvature control. By Codazzi $\mathsf Dk(X,Y)=R^g(X,Y)\nu$. Its Schouten contribution is of the form $\beta\wedge\vartheta$ for a one-form $\beta$, and pairs to zero with $a$. Thus the $L^2$ factor in the second bound of (5) can also be taken to be the face $L^2$ norm of the mixed Weyl form $W^g(X,Y)\nu$.

Both orders are attained by smooth ball germs. On the unit round $S^3$ take a positive left-invariant frame with $[e_i,e_j]=2\epsilon_{ijk}e_k$ and a nonzero constant diagonal trace-free endomorphism $L$ in that frame. For any diagonal shape with eigenvalues $l_i$, $\mathsf D l(e_j,e_k)=(l_j+l_k-2l_i)e_i$ on each cyclic triple. Thus $q_h(L)=-3|L|^2dA_h$. The flat reference $S=\operatorname{Id}$ and $K=\operatorname{Id}+\epsilon L$ produce $\mathcal F_Y=\epsilon^2\int_Y q_h(L)$. With $S=c\operatorname{Id}+L$ and $K=c\operatorname{Id}+(1+\epsilon)L$, the difference is $(2\epsilon+\epsilon^2)\int_Y q_h(L)$. Every prescribed smooth symmetric shape here is realized by the positive Gaussian tangential tensor $h+2t h(K\cdot,\cdot)$ on a sufficiently short inward collar, extended into a ball by blending smooth positive metrics. The second example uses a curved reference and does not impose a scalar sign.

## What the identity measures on a physical disk

Fix one source index of the positive volume-one Yamabe minimizing sequence. Set $e_i=E_+(g_i;M)=E_-(g_i;M)$, $I=I^+(M)$, $d_i=e_i-I$, and $m_i^\pm=E_\pm(g_i;D_i)$ on its actual selected marked disk. A Euclidean reference for its actual physical face would require an isometric convex embedding. Its candidate $S$ is determined by the face metric from the Gauss equation, with positivity and Codazzi to be checked. Equations (4)–(5) then require the trace-free normal shape difference and the tangential Codazzi derivative on that face, or a bound on the mixed Weyl trace together with the trace-free difference. The incoming masses give their signed difference by integration but supply neither of those boundary norms. [Gauss reconstruction](../../reviews/CURVED_FILL_READER.md#intrinsic-reconstruction-and-the-marking) · [E61 source audit](../../notes/SOURCE_WITNESSES.md) · [E61 thin raw collar](../../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex)

The raw E61 bound $\nu_i(B_i(r))<\zeta$ with $D_i\subset B_i(r)$ and $\nu_i=|\mathrm{Rm}_{g_i}|_{\mathrm{tens}}^2dV_{g_i}$ gives $|m_i^+-m_i^-|\le\zeta/4$. For two parallel faces inside a raw collar $U_i$, the change in signed disk balance is at most $\nu_i(U_i)/4$. These statements use the full incoming curvature integral, since $|\Theta|\le |\mathrm{Rm}|_{\mathrm{tens}}^2dV/4$. A native Gaussian substrip of known width $w>0$ gives at least one parallel face with $\|\mathsf D k_t\|_2^2\le\nu_i(U_i)/(4w)$ by coarea and the mixed component bound. In the mixed Weyl version the numerator may instead be the two-sign Weyl integral, without the factor $1/4$. Using this average in (5) still requires a reference and a mismatch bound at the same chosen face. The existing raw-smallness bounds allow reselection as tolerances change and have no uniform physical width or matched face jet. They therefore give no smallness rate for these norms on the original marked face and no quantitative control relative to its charge from the curvature tolerance alone.

If a one-sided smoothing on a marked replacement ball keeps the complete $V_i$ and agrees with a reference $b$ off the cap-side strip, its increment over the reference satisfies $\Delta C^+-\Delta C^-=\mathcal F_Y$ for every smooth positive width. Its outer shape is $K$, and the relative ball signature vanishes. For a conformally flat reference the entire new cap charges $c_\pm$ are strip charges, so $c_+-c_-=m_i^+-m_i^-$ and $c_\pm\ge \max\{0,\pm\mathcal F_Y\}$. Subtracting the two common imbalances shows that the common full energy gain is $\min_\pm m_i^\pm-\min_\pm c_\pm$. If the same-type endpoint independently has positive Yamabe sign, necessarily $\min_\pm c_\pm\ge\min_\pm m_i^\pm-d_i$. The flux controls the difference of the connector charges. A small or zero flux places no upper bound on their common part or on the scalar-form error. [One-sided connector](FINITE_CURVED_CONNECTOR.md)

The master's connected-repair flux and (4) are evaluations of the same relative form (2). The general common-bundle formula prices a supplied modification across a transverse shaft slice even when its induced face metrics differ. The shape formula requires the matched face metric. On a slice with boundary the exact tangential term cannot be discarded unless its edge contribution is controlled, as when the connection difference vanishes in a clamped lateral germ. A small flux at one external face gives no bound on the curvature or connection norms of the joining shaft. [Connected repair and its independent readback](../../../../master/01_fixed_type_variational_descent/reviews/E64_REPAIR_AND_RICCI.md#e64a--local-chiral-transfer-along-a-marked-shaft)

## Convex Euclidean height control and marking

For an immersed hypersurface in $\mathbb R^5$ use its induced metric and a transverse height face whose image in the height hyperplane is a smooth closed convex embedded hypersurface with $S>0$. Writing the disk-to-exterior conormal as $dF(\nu)=\alpha v+\beta n$, for constant height direction $v$ and convex outward normal $n$, gives $K=\beta S$. Here $|\beta|<1$ and $1-\beta^2=|\nabla z|^2$. The flat reference has $\mathsf D s=0$, and $q_h(K)=\beta\langle s\wedge(d\beta\wedge s)\rangle=0$ pointwise. This test vanishes even for a nonround slice with $K^\circ-S^\circ\ne0$ somewhere. Moreover on any Euclidean four-dimensional hypersurface the Gauss equation gives a curvature operator diagonal on coordinate two-forms in a principal frame. Since the Hodge star exchanges complementary coordinate two-forms, $\operatorname{tr}(\mathcal R^* *\mathcal R)=0$ pointwise. Both Weyl measures therefore agree on every actual set, also in a conformally related physical metric. A nonconstant boundary conformal factor can change the convex realization and the normal jets used by (4). [Height calculation](../../reviews/CURVED_FILL_READER.md#transverse-euclidean-height) · [Chern–Simons, §5, Theorem 5.14, the Pontryagin form obstruction for a global Euclidean conformal immersion](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf)

The height's abstract Euclidean cap is supplied by the embedded level in its height hyperplane. The computation identifies its boundary with that level. A disk reassembly requires a parametrized standard disk on the original side and its outward normal, and the E61 comparison requires the very same marked physical disk and face metric from the minimizing sequence. Neither identification follows from a convex height image. The exact signed balance thus supplies a necessary charge check on actual proposed replacements, including curved ones. It leaves the finite two-sign cost, the positivity test and the selected marking as independent inputs.
