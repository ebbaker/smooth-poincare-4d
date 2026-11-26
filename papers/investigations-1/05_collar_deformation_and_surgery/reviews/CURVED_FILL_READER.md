# Curved filling and transverse heights, independent readback

26 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded reader for DEF-B02/SUR-B03 at `e2968b2898b5aab00b307f6b6580454d0f325bb4`. The packets specify GPT-6.2 Sol/ultra. Actual serving model and effort were unavailable to the reader. Inputs are the [convex fill freeze](../research-progress/handoffs/CURVED_FILL_READBACK_20261126.md), the [height follow-up](../research-progress/handoffs/HEIGHT_ANGLE_READBACK_20261126.md), the three [pinned drafts](../research-progress/handoffs/INITIAL_MANUSCRIPTS_20261126.md), and the [charged-disk budget](../02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md).

The frozen implication and the transverse-height estimate both check. The marked gluing uses the smooth extension of a boundary diffeomorphism of the standard four-ball. The positivity argument requires coercivity in the Sobolev norm to control the contribution of the thin smoothing strips. A one-sided smoothing can retain the complete exterior metric exactly. The theorem remains a fixed-source criterion.

## Intrinsic reconstruction and the marking

Let $M$ be the oriented smooth homotopy four-sphere and $D$ an actual parametrized standard disk in it. Write $V=M\setminus\operatorname{int}D$. Use the normal $\nu$ from $D$ into $V$, and write $KX=\nabla_X\nu$ for its shape endomorphism, with trace $H$. All traces and endomorphism norms on the face use its induced metric $h$.

In a Ricci eigenframe in dimension three, each eigenvalue $G_i$ of $G=R_h\operatorname{Id}/2-\operatorname{Ric}_h^\sharp$ is the sectional curvature of the complementary two-plane. The three-dimensional curvature tensor is determined algebraically by Ricci. If all $G_i>0$, set $s_i=\sqrt{G_1G_2G_3}/G_i$. Then $s_js_k=G_i$ for distinct $i,j,k$. Thus $S=(\det G)^{1/2}G^{-1}$ is positive and satisfies the full Euclidean Gauss equation. It is the unique positive solution, since Gauss gives $G=(\det S)S^{-1}$. Codazzi is a separate hypothesis.

One can verify the global immersion directly. The connection on $T\partial D\oplus\mathbb R$ given by

$$
\nabla^E_X(Y,f)=(\nabla^h_XY+fSX,\ X(f)-h(SX,Y))
$$

is metric and flat by Gauss and Codazzi. Parallel trivialization is global because $\partial D\simeq S^3$ is simply connected. In this trivialization the vector-valued one-form $X\mapsto(X,0)$ is closed by torsion-freeness and the symmetry of $S$. Its integral $F$ is an isometric immersion, and the image $n$ of $(0,1)$ is a unit normal with $D_Xn=dF(SX)$.

The Gauss map $n$ is a local diffeomorphism and hence a diffeomorphism onto the unit $S^3$, by compactness and simple connectivity. For each unit $v$, the function $\langle F,v\rangle$ has exactly two critical points. Its Hessian at $n=\pm v$ is $\mp h(S\cdot,\cdot)$, so the point with $n=v$ is its unique maximum. This gives injectivity, and every supporting hyperplane of the convex hull meets it in the single maximizing point of $F$. The convex hull has nonempty interior and boundary exactly $F(\partial D)$, with $n$ outward. For an interior center the boundary is a smooth radial graph with positive radial function $\rho(\omega)$. A smooth diffeomorphism from a round ball is obtained by taking radial coordinate $r[c+\chi(r)(\rho(\omega)-c)]$, where $0<c<\min\rho$ and $\chi$ rises monotonically from zero near $0$ to one near $1$. Its radial derivative is strictly positive, and it is linear near the center. [Hadamard theorem, as stated by Alexander](https://doi.org/10.1090/S0002-9939-1977-0448262-6)

Write $C$ for this convex ball with its Euclidean metric $b$. Choose its orientation so the boundary identification $F\colon\partial D\to\partial C$ preserves induced boundary orientations. Since $C$ and $D$ are standard smooth balls, the attaching diffeomorphism extends over them by the components theorem for $\operatorname{Diff}(S^3)$. Use the isotopy on an angular collar and the orthogonal representative on the smaller ball. Matching the normal collar coordinates then gives a smooth oriented identification of the capped manifold with $M$, fixed on the exterior away from its collar. This is needed even though both abstract caps are standard balls. [Hatcher, p. 553](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf) · [Marked disk reference](../02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md)

## First jets and individual signed expenses

Set $\alpha=(H-\operatorname{tr}S)/3$ on the glued face. A positive smooth $u$ on $C$ with $u=1$ and $\partial_nu=\alpha$ there exists by a cutoff in an inward Euclidean normal collar. For example the local formula is $1+t\alpha$ in signed normal distance $t\le0$, with $t$ increasing outward, and one can cut off the added term inside a sufficiently short collar to keep $u>0$. The endomorphism of $u^2b$ at the boundary is $S+\alpha\operatorname{Id}$. Thus $S^0=K^0$ implies equality of the full shape tensors. The boundary metrics also agree. Use Gaussian coordinates for $u^2b$ and the source metric, with the same $t$ direction and the angular marking $F$. In these coordinates both have normal coefficients $g_{tt}=1$, $g_{ta}=0$, tangential value $h$, and tangential normal derivative $2h(K\cdot,\cdot)$ at the seam. Tangential derivatives of the face values agree. The piecewise metric $g_0$ is $C^{1,1}$ in this gluing atlas. Its curvature is bounded and its distributional scalar curvature has no surface measure.

For two-sided smoothing, choose positive subwidths $w_C,w_V$ within the actual normal collars. Interpolate from each side's tangential metric to the common smooth tensor $h+2t h(K\cdot,\cdot)$ using a fixed profile equal to one near zero and zero near the chosen outer width. This tensor is positive for sufficiently small $|t|$. The mismatch on each side is $O(t^2)$, with one normal derivative $O(|t|)$ and two bounded. These estimates also give bounds for the mixed and tangential derivatives needed for curvature. The cutoff derivatives therefore give bounded second derivatives, independently of the chosen subwidths, in a fixed atlas for this source and cap. Uniform ellipticity, bounded curvature and strip volume $O(w_C+w_V)$ follow. The same proof gives a one-sided variant. Extend the exterior Gaussian tangential metric smoothly to negative $t$ using the actual original disk collar. Interpolate to that extension only on the cap side. The resulting smooth metric keeps $g|_V$ exactly and spends at most $C_gw_C$ in either sign on the cap.

The cap metric away from the strips is conformally Euclidean, so both Weyl signs vanish there. For the two-sided smoothing,

$$
\left|E_\sigma(g_{w_C,w_V};M)-E_\sigma(g;V)\right|
\le C_g(w_C+w_V),\qquad \sigma=+,- .
$$

Here $E_\sigma$ uses the Hilbert–Schmidt norm of the Weyl operator on real two-forms and the chosen orientation. For one-sided smoothing the difference is nonnegative and at most $C_gw_C$. Signed exterior energies refer to the complete $V$. The closed signature identity gives equal energies for the original metric and for every smooth reassembly individually. Passing to the limit shows $E_+(g;V)=E_-(g;V)$ and therefore $m_D^+=m_D^-$ for the original disk masses. No scalar sign, energy wall, or deformation of the original disk interior is used for this identity.

## Positivity and the finite comparison

For a real $H^1$ test function $f$ on the glued manifold, the restrictions have common trace $\varphi$. Use $\Delta=\operatorname{div}\nabla$. The cap scalar is $R_{u^2b}=-6u^{-3}\Delta_bu$. Upon setting $F_0=uf$ on $C$, the cap part of the quadratic form is

$$
\int_C\bigl(6|\nabla f|_{u^2b}^2+R_{u^2b}f^2\bigr)\,dV_{u^2b}
=6\int_C|\nabla F_0|_b^2\,dV_b-6\int_{\partial C}\alpha\varphi^2\,dA_h .
$$

This follows by expanding the square and integrating the divergence of $f^2u\nabla_bu$. The sign is from the outward normal of the **cap**, which points into $V$. In particular the surface coefficient is $2(\operatorname{tr}S-H)$. There is no singular surface scalar term from the seam. The boundary term here comes from integration by parts in the smooth conformal cap. [Lee–Parker, §2](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

When $R_g>0$ on the compact $V$, the external term $Q_V(f)$ controls $\|f\|_{H^1(V)}^2$. If $H\le\operatorname{tr}S$, the positive cap gradient and this exterior bound give full coercivity. Indeed,

$$
\|F_0\|_{L^2(C)}^2\le C\bigl(\|\nabla F_0\|_{L^2(C)}^2+\|\varphi\|_{L^2(\partial C)}^2\bigr),
\qquad
\|\varphi\|_{L^2(\partial C)}\le C'\|f\|_{H^1(V)} .
$$

The first inequality follows from the ordinary Poincaré inequality and the bounded trace, or by compactness and exclusion of nonzero constants with zero trace. Multiplication by $u^{\pm1}$ is bounded on $H^1(C)$. In particular $Q_0(f)\ge c_g\|f\|_{H^1(M)}^2$ in a fixed smooth reference norm. For a smoothing $g_w$, its leading form coefficients converge uniformly. Its scalar density differs from the piecewise scalar density by a bounded function supported on the shrinking strips $A_w$. Thus

$$
\int_{A_w}|f|^2\,dV\le C\operatorname{Vol}(A_w)^{1/2}\|f\|_{H^1(M)}^2
$$

by the dimension-four Sobolev inequality. The scalar form error and the leading error together are $o(1)\|f\|_{H^1(M)}^2$. Hence the smooth Yamabe quotients have a strictly positive source-dependent lower bound for all sufficiently small positive widths. This continuity statement uses the support and curvature estimates. Volume normalization, if desired, leaves the sign and the two chiral energies unchanged.

Let $e=E_\pm(g;M)$, $I=I^+(M)$, and $m_D^\sigma=E_\sigma(g;D)$. For all sufficiently small **positive** widths, the smooth positive competitors satisfy

$$
I\le E_\sigma(g_w;M)\le e-m_D^\sigma+C_g(w_C+w_V) .
$$

At the tested source one first chooses widths below the positivity and Gaussian-chart bounds. If $m_D^\sigma>e-I$, choose them also with $C_g(w_C+w_V)<m_D^\sigma-(e-I)$. This produces an actual positive competitor strictly below $I$. Taking widths to zero at that same source gives $m_D^+=m_D^-\le e-I$. The argument uses the scalar sign of the endpoint class and gives no joined energy peak. It does not require $e<2T$.

The pointwise curvature hypothesis can be replaced by coercivity of $Q_V$ on $H^1(V)$ with free boundary values. A slightly negative boundary coefficient can also be absorbed using the displayed exterior trace bound. More generally the boundary form to test is the sum of the minimal external energy with trace $\varphi$, six times the minimal Euclidean Dirichlet energy on $C$ with that trace, and $2\int_{\partial C}(\operatorname{tr}S-H)\varphi^2$. Under $Q_V$ coercivity it suffices that the sum be bounded below by $c\|\varphi\|_{H^{1/2}}^2$ with $c>0$. Decompose into the minimizing extensions and the zero-trace remainders, whose energies are positive by coercivity and the Dirichlet Poincaré inequality. These tests use only the exterior and boundary data.

## Transverse Euclidean height

Let $F_M\colon(M,g)\to\mathbb R^5$ be a Euclidean hypersurface immersion with its induced metric, $v$ a fixed unit vector, and $z=\langle F_M,v\rangle$. Assume a component of a regular level is embedded by $F_M$ as a closed hypersurface in the affine height hyperplane $\mathbb R^4$ with positive definite outward shape. Its outward unit normal is $n$, with shape $S>0$ for $D_X n=dF_M(SX)$. The Euclidean Gauss equation identifies this $S$ with the intrinsic reconstruction above.

At the level the ambient orthogonal complement of the image of its tangent space is $\operatorname{span}(v,n)$. The chosen unit conormal $\nu$ in $M$ therefore has $dF_M(\nu)=av+bn$, with

$$
a^2+b^2=1,\qquad a=\nu(z)=\pm|\nabla^g z|\ne0 .
$$

Pair $D_X(av+bn)$ with any level tangent to get $h(KX,Y)=b h(SX,Y)$. Derivatives of $a$ and $b$ are normal to the level, and $v$ is parallel. With the disk-to-exterior choice for $\nu$ this yields

$$
\operatorname{tr}S-H=(1-b)\operatorname{tr}S>0,\qquad
|K^0-S^0|_h=(1-b)|S^0|_h
=\frac{|\nabla^g z|^2}{1+b}|S^0|_h
\ge \frac12|\nabla^g z|^2|S^0|_h .
$$

The denominator is positive by regularity. Flipping $\nu$ changes $a$ and $b$ together and the mean inequality remains strict. Exact trace-free matching everywhere forces $S=\lambda\operatorname{Id}$ everywhere. Codazzi on the connected slice forces $\lambda$ to be constant and $d(F_M-\lambda^{-1}n)=0$ on it, giving a round Euclidean sphere. This comparison uses the induced metric. For $\widehat g=w^2g$ with $w=c$ constant on the level, normalizing the Euclidean embedding by dilation scales both shape endomorphisms' trace-free parts by $c^{-1}$. A nonconstant boundary factor changes the reconstructed shape and requires a separate check. The mismatch is pointwise and supplies neither a smoothed energy lower bound nor a marked disk, positive Yamabe representative with compatible jets, or charge separation for this level. [Immersed-entry hypotheses](../../../master/manuscript/immersion_entry.tex)

## Controls and charged-disk scope

On the exact round Yamabe sphere a standard geodesic ball of radius $0<r<\pi$ has $h=\sin^2(r)\gamma_{\rm rd}$, $S=\csc(r)\operatorname{Id}$ and $K=\cot(r)\operatorname{Id}$ in the round radius-one normalization. Thus the mean inequality is strict and both chiral masses vanish. Conversely in a constant positive sectional curvature ambient metric, $S=K+c\operatorname{Id}$ and the two Gauss equations imply $\kappa=c(k_i+k_j)+c^2$ for every distinct pair of principal curvatures of $K$. At a nonumbilic point two pair sums differ, forcing $c=0$ and then $\kappa=0$. Thus that ambient control cannot yield a nonumbilic matching face.

The weaker pointwise PSC hypothesis allows a nonumbilic control. Use the stereographic round conformal factor $u_0=2/(1+|x|^2)$ on standard $S^4$. Replace its unit Euclidean sphere by a small nonspherical ellipsoid. Extend $1-u_0|_{\partial C}$ from the ellipsoid along a fixed short collar with a smooth cutoff, and add it to $u_0$. The resulting $u$ is $C^2$-close to $u_0$, equals one on the ellipsoid, has negative outward derivative there, and agrees with $u_0$ off a compact set. The metric $u^2b$ is smooth PSC on $S^4$. Its face metric is the metric induced by the ellipsoid in Euclidean space, with $K^0=S^0$ and $H<\operatorname{tr}S$. A sufficiently small metric perturbation supported strictly inside the ellipsoid can give the original disk positive chiral charge and preserve PSC and the seam. For instance, use a quadratic perturbation in a local normal chart with prescribed nonzero algebraic Weyl curvature at its center and a cutoff supported in the disk interior. The exterior stays conformally flat, and replacing the disk with the unperturbed metric gives a smooth positive competitor of zero energy. This is a marked PSC control on the standard type, whose infimum is zero. The verification uses the scalar curvature of the chosen representative.

On the original charged minimizing subsequence use the width estimates separately at each fixed source. Once $e_i-I<a\le m_{D_i}^{s_*}$ the three matching hypotheses together with the mean inequality (or the coercive boundary test) are excluded on that marked disk. A protected enlargement containing $D_i$ has at least the same incoming disk charge in the selected sign, so the same conditional exclusion applies to its own boundary there. Already at fixed balancing depth at least one, the raw retained exterior is eventually strictly below $T$ in both signs under the strict band. An exact matching positive fill would then give a finite positive competitor strictly below $T$, hence recognition. This information supplies no compatibility of those enlarged face jets. Replacing the enlarged disk by the convex cap consumes its whole core, so it does not furnish a path preserving that core. [Charged disk and balanced budgets](../02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md)
