# A hyperbolic reference for a marked convex height

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution CDS-B03/E02h, [issue 1](../research-progress/handoffs/TWO_ATTACHMENTS_AND_FACE_ERROR_20261126.md), on input commit `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. The dispatch specifies GPT-6.2 Sol/ultra for this calculation and GPT-6.2 Astra/ultra for the lead. Independent serving model and effort telemetry are unavailable. This is an analytical boundary reconstruction, a smooth standard-sphere control and a fixed-source comparison. It uses the [previous assessment](../reviews/PENULTIMATE_CUTS_AND_CURVED_FILLINGS_20261126.md), [curved fill readback](../reviews/CURVED_FILL_READER.md) and [physical source audit](SOURCE_WITNESSES.md). Source version receipts are below.

There is a global nonround rotational height with exact trace-free matching to a negative constant curvature cap. The cap's scalar sign involves an extra normal derivative in its flat conformal coordinates. The explicit height passes that test near the round slice, including examples with positive charge on both complete sides. The comparison stays in the original marking and the original exterior metric. Applying the same test to the selected E61 disk requires its physical boundary tensors.

## The intrinsic Gauss test and the two-eigenvalue case

Work on the actual boundary $\Sigma$ of a smoothly parametrized disk $D$ in an oriented smooth Riemannian homotopy four-sphere $(M,g)$. Write $V=M\setminus\operatorname{int}D$, $h=g|_{T\Sigma}$, $K=\nabla^g\nu|_{T\Sigma}$ for the disk-to-exterior normal, and $H=\operatorname{tr}K$. Use Hilbert–Schmidt chiral Weyl energies $E_\sigma$, $\sigma\in\{+,-\}$, $T=4\pi^2$, and $I=I^+(M)$ as in the master. All boundary endomorphisms have their traces and eigenvalues in the physical metric $h$.

For a strictly convex reference in sectional curvature $\kappa$, set

$$
G_\kappa=\tfrac12R_h\operatorname{Id}-\operatorname{Ric}_h^\sharp-\kappa\operatorname{Id},
\qquad S_\kappa=\sqrt{\det G_\kappa}\,G_\kappa^{-1}\quad(G_\kappa>0).
$$

In a Ricci eigenframe, the eigenvalues of $G_\kappa$ are the complementary sectional curvatures minus $\kappa$. The Gauss equation for a positive shape $A$ in that space form requires $G_\kappa=(\det A)A^{-1}$; conversely the formula for $S_\kappa$ then gives the full Gauss tensor in dimension three. The sign $G_\kappa>0$ is necessary for this positive branch. The remaining integrability test is the Codazzi equation for $S_\kappa$.

On a regular Euclidean height assume the face is embedded with positive Euclidean outward shape $S$ in its height hyperplane, and write its outward conormal in $(M,g)$ as $a\,e_z+b\,n$ under the induced immersion. Here $n$ is the planar outward normal, $a^2+b^2=1$ and $a\ne0$. Then $K=bS$ by tangential differentiation. Exact trace-free matching means $S_\kappa=bS+c\operatorname{Id}$ for $c=(\operatorname{tr}S_\kappa-H)/3$. Writing $s_j>0$ for the eigenvalues of $S$, Gauss gives, for every pair,

$$
\kappa=(1-b^2)s_i s_j-bc(s_i+s_j)-c^2,\qquad
0=(s_j-s_\ell)[(1-b^2)s_i-bc].
$$

- Three distinct eigenvalues preclude a fit because the second equation would make each eigenvalue equal to $bc/(1-b^2)$.
- If the eigenvalues are $(u,u,v)$ with $u\ne v$, the second equation forces $bc=(1-b^2)u>0$. Consequently

  $$
  c=\frac{(1-b^2)u}{b},\qquad
  \kappa=-\frac{(1-b^2)u^2}{b^2},\qquad
  S_\kappa=\operatorname{diag}\left(\frac{u}{b},\frac{u}{b},bv+c\right).
  $$

  Positivity forces $b>0$, so $\kappa=-k^2<0$. Equivalently $U=\sqrt{u^2+k^2}$, $b=u/U$, $c=k^2/U$, and $S_{-k^2}$ has eigenvalues $(U,U,(uv+k^2)/U)$. In particular $u^2(1-b^2)/b^2$ must have the **same** value on all nonumbilic points of the face.
- At an umbilic point $s_i=u$, trace-free matching holds whenever $u^2>\kappa$. On a connected entirely umbilic Euclidean face $u$ is constant by Codazzi and the face is round.

For a fixed $k>0$, this algebraic test makes $S_{-k^2}$ Codazzi on a Euclidean height that passes it everywhere. On a nonumbilic patch the two-dimensional eigenspace $E$ of $u$ annihilates $du$: project $(\nabla_X S)Y=(\nabla_Y S)X$ for $X,Y\in E$ back onto $E$. On that patch the antisymmetric derivative of $bS+c\operatorname{Id}$ equals

$$
db(X)SY-db(Y)SX+dc(X)Y-dc(Y)X.
$$

For $X,Y\in E$ it vanishes, and for $X\in E^\perp,\ Y\in E$ it is $(u\,db(X)+dc(X))Y=0$, since $b=u/U,\ c=k^2/U$. It vanishes on the remaining pairs by alternation. The formula for $S_{-k^2}$ from $G_{-k^2}$ is smooth across the umbilic set, and on its interior the scalar Euclidean shape is locally constant. Hence Codazzi holds on the whole face.

Here Gauss and Codazzi give a global convex hyperbolic ball. On $T\Sigma\oplus\mathbb R\oplus\mathbb R$ with the last factor timelike, use the connection

$$
\nabla^L_X(Y,\alpha,\beta)=
(\nabla^h_XY+\alpha S_{-k^2}X+k\beta X,
\quad X\alpha-h(S_{-k^2}X,Y),\quad X\beta+k h(X,Y)).
$$

It is metric and flat. The tangent curvature is the sum of the intrinsic curvature, the negative shape product, and the $+k^2$ constant curvature tensor. The other terms cancel by symmetry and Codazzi. Since $\Sigma\simeq S^3$ is simply connected, trivialize the bundle in $\mathbb R^{4,1}$ and use $F=k^{-1}(0,0,1)$ in that trivialization. Then $dF(X)=(X,0,0)$, $F$ lies on a hyperboloid sheet of curvature $-k^2$, and the unit normal $N=(0,1,0)$ has $dN(X)=dF(S_{-k^2}X)$. Choose the future sheet by the Lorentz frame. For the Klein projection $q=F'/F_0$, the spatial part $N'$ is a Euclidean normal because $N'\cdot q=N_0$ and $N'\cdot dq=0$. Differentiating $F=F_0(1,q)$ gives $N'\cdot D_Xdq(X)=-h(S_{-k^2}X,X)/F_0$. Thus the Klein image has positive Euclidean shape. Its Gauss map is a local diffeomorphism from $S^3$ onto $S^3$, hence a diffeomorphism. Every Euclidean height has one maximum and its supporting hyperplane contacts at that point. This proves embedding as the boundary of its strictly convex hull. The hull lies in the open Klein ball by compactness and is a smooth standard disk by radial parametrization from an interior point, chosen linear near the center. This uses the same convexity argument as the [flat reference](../reviews/CURVED_FILL_READER.md#intrinsic-reconstruction-and-the-marking).

## The scalar form and a finite-width comparison

Let $g_{\mathrm H}$ be the resulting hyperbolic cap on the ball $C$ and use the induced boundary isometry from the measured face. Give $C$ the compatible orientation. An orientation-compatible marking of $S^3$ extends over the two standard balls. This is the components theorem for $\operatorname{Diff}(S^3)$ as stated by Hatcher on p. 553, followed by extending the angular isotopy in a collar and the orthogonal representative on the remaining ball. Match signed Gaussian coordinates at the seam. The capped $V$ then identifies with the original oriented smooth $M$ by the inverse marking on its seam and the identity on $V$. [Hatcher, author copy, p. 553](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf) · [Canonical source record R122](../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md)

Choose $\mu>0$ smooth on $C$ with $\mu=1$ and $\partial_{\nu_{\mathrm H}}\log\mu=-c$ at the boundary, using a cutoff on a collar of the reference. The cap metric $p=\mu^2g_{\mathrm H}$ has shape $S_{-k^2}-c\operatorname{Id}=K$ there. In Poincaré coordinates centered at any chosen hyperbolic point, write

$$
g_{\mathrm H}=\Omega^2g_{\mathrm E},\qquad
\Omega=\frac{2}{1-k^2|x|^2},\qquad
\ell=\partial_{\nu_{\mathrm H}}\log\Omega .
$$

The coordinate ball has Euclidean radius $1/k$ and the closed cap is compactly inside it. Put $U_c=\mu\Omega$. The cap contribution to the limiting closed four-dimensional conformal-Laplacian quadratic form is

$$
 Q_p(f)=6\int_C |d(U_c f)|_{g_{\mathrm E}}^2\,dV_{g_{\mathrm E}}
          +6\int_\Sigma(c-\ell)f^2\,dA_h .
$$

Indeed $R_{U_c^2g_{\mathrm E}}=-6U_c^{-3}\Delta_{g_{\mathrm E}}U_c$ with $\Delta=\operatorname{div}\operatorname{grad}$. Expanding $|d(U_cf)|^2$ and integrating the cross term leaves $-6\int_{\partial C}U_c f^2\,\partial_{\nu_{\mathrm E}}U_c\,dA_{g_{\mathrm E}}$. At the face $\mu=1$, $\nu_{\mathrm E}=\Omega\nu_{\mathrm H}$ and $dA_{g_{\mathrm E}}=\Omega^{-3}dA_h$, giving the stated coefficient. If $H_{\mathrm E}$ is the Euclidean mean trace on this Poincaré image, then $H_{\mathrm E}/\Omega=\operatorname{tr}S_{-k^2}-3\ell$, so the boundary coefficient is also $2(H_{\mathrm E}/\Omega-H)$. The mean gap $\operatorname{tr}S_{-k^2}-H=3c$ omits the flattening term $3\ell$. If the pointwise bound $c\ge\ell$ fails, the relevant test is coercivity of the sum of the exterior form, the weighted-trace Euclidean Dirichlet energy, and this boundary integral.

For $R_g>0$ on the compact $V$ and $c\ge\ell$, the joined form is coercive. The exterior form controls its full $H^1$ norm and the trace, and the Dirichlet contribution combined with the trace controls the cap $H^1$ norm of $U_cf$ by the Poincaré inequality with boundary term. All smooth positive multiplication and trace norms use fixed comparable metrics. This also works with any available coercivity of the exterior free-trace form.

At a fixed source let $w$ be less than its supplied inward width and both regular Gaussian radii for the original metric and $p$. Use the original extension of $g$ into $D$ near $t=0$, interpolate in $-w<t<0$ with $p$ outside the strip, and retain the whole $V$ literally. In signed Gaussian coordinates the tangential families agree at the face through first order, so their difference is $O_i(t^2)$, its first derivative is $O_i(|t|)$, and its second derivative is bounded. A fixed profile with derivatives of order $w^{-1},w^{-2}$ therefore keeps curvature bounded, with volume $O_i(w)$ on the strip. For the smooth endpoint $p_w$ put $C_w^\sigma=E_\sigma(p_w;D)$, which is supported in that strip. On the full source the two expenses are

$$
0\le C_w^\sigma\le C_iw,\qquad
E_\sigma(p_w;M)=E_\sigma(g;V)+C_w^\sigma
               =e-m_D^\sigma+C_w^\sigma.
$$

The scalar potentials and coefficients of the limiting joined form differ from the smooth ones only on the strip. Uniform ellipticity, the $O_i(w^2)$ metric discrepancy and the $H^1\to L^4$ bound in dimension four make the form error at most $C_i(w^2+w^{1/2})\|f\|_{H^1}^2$. Choose a positive width small enough relative to the coercivity constant. This gives $Y([p_w])>0$, and

$$
 I\le e-m_D^\sigma+C_w^\sigma,\qquad
 m_D^\sigma\le e-I\quad(\sigma=\pm)
$$

after sending $w\downarrow0$ at that same index. If $m_D^\sigma>e-I$, a strictly positive width with $C_iw<m_D^\sigma-(e-I)$ already gives the contradiction. Independently of positivity, closed signature gives $m_D^+=m_D^-$ as $w\downarrow0$, and $C_w^+=C_w^-$ at each width by the equality of the retained full exterior charges. This is an endpoint calculation for arbitrary matched data. The entire disk is consumed by the cap.

## A global ellipsoid height

Use the induced metric on the smooth closed hypersurface

$$
 M_{A,B,C}=\left\{(x,y,z)\in\mathbb R^3\times\mathbb R\times\mathbb R:
 \frac{|x|^2}{A^2}+\frac{y^2}{B^2}+\frac{z^2}{C^2}=1\right\}.
$$

Fix $0<\tau<1$ and put $z_0=\tau C$. Take the actual upper disk $D=\{z\ge z_0\}$ with its standard marking from a round cap by linear dilation. Its scalar curvature is positive by strict Euclidean convexity and the hypersurface Gauss equation. The face is the ellipsoid with semiaxes $A_f=A\sqrt{1-\tau^2}$, $B_f=B\sqrt{1-\tau^2}$ in its plane. With $p_0=(x/A^2,y/B^2)$ and $d=z_0/C^2>0$, the outward conormal of $D$ and the repeated principal curvature of the face are

$$
 \nu=\frac{-|p_0|e_z+d\,n}{\sqrt{|p_0|^2+d^2}},\qquad
 u=\frac{1}{A^2|p_0|}.
$$

In the two directions tangent to the rotation orbits this eigenvalue follows by differentiating the planar unit normal $n=p_0/|p_0|$. Thus $b=d/\sqrt{|p_0|^2+d^2}=u/\sqrt{u^2+k^2}$ with $k=1/(A^2d)=C/(\tau A^2)$, constant on this physical face. The meridional principal curvature differs from $u$ off the two poles if $B\ne A$.

For an explicit filling, parameterize the face by the arclength $s$ of its meridian $(r(s),y(s))$, with $r=A_f\sin\theta,\ y=-B_f\cos\theta,\ 0\le\theta\le\pi$, and $h=ds^2+r^2\gamma_{S^2}$. Then $u=y'/r$ and $v=-r''/y'$ away from the poles, and $r'^2+y'^2=1$. In hyperbolic Fermi coordinates around an axis use

$$
 g_{\mathrm H}=d\rho^2+\cosh^2(k\rho)\,dZ^2
                       +k^{-2}\sinh^2(k\rho)\,\gamma_{S^2},\quad
 \rho(s)=k^{-1}\operatorname{arsinh}(kr(s)),\quad
 Z'(s)=\frac{r(s)\sqrt{u(s)^2+k^2}}{1+k^2r(s)^2}.
$$

Center $Z$ at the equator. Since $1+k^2r^2-r'^2=r^2(u^2+k^2)$, this profile induces exactly $h$. Its outward normal is $\sqrt{1-\rho'^2}\,\partial_\rho-\rho'(\cosh(k\rho))^{-1}\partial_Z$, so the repeated angular curvature is $\nu_{\mathrm H}(\log r)=\sqrt{u^2+k^2}$. Gauss gives the remaining $(uv+k^2)/\sqrt{u^2+k^2}$, hence the required shape and trace adjustment at every point.

In the smooth axis coordinates $(r\omega,Z)$ on the hyperboloid,

$$
 F_0=k^{-1}\sqrt{1+k^2r^2}\cosh(kZ),\quad
 F_{1,2,3}=r\omega,\quad
 F_4=k^{-1}\sqrt{1+k^2r^2}\sinh(kZ).
$$

The meridian speed with parameter $\theta$ is $L=\sqrt{A_f^2\cos^2\theta+B_f^2\sin^2\theta}$, with $u=B_f/(A_f L)$. Thus $dZ/d\theta$ is $\sin\theta$ times a smooth positive function of $\cos^2\theta$, including at the poles. This makes $Z=\mathcal Z(-\cos\theta)$ with smooth strictly positive derivative on the closed interval and a smooth monotone extension just beyond its ends. The interior of the planar ellipsoid is mapped by $(x,y)\mapsto(r\omega=x,\,Z=\mathcal Z(y/B_f))$ onto the whole filling, yielding the global marked ball through both poles.

When $B=A$, the hyperbolic face is the sphere centered at $r=Z=0$ with intrinsic round radius $R=A_f$. Its geodesic radius $L_{\mathrm H}$ satisfies $kR=\sinh(kL_{\mathrm H})$. In the centered Poincaré model $\Omega=1+kF_0$, so at the face

$$
 c=\frac{k^2R}{\sqrt{1+k^2R^2}},\quad
 \ell=\frac{k^2R}{1+\sqrt{1+k^2R^2}},\quad
 c-\ell=\frac{k^2R}{\sqrt{1+k^2R^2}(1+\sqrt{1+k^2R^2})}>0 .
$$

All tensors in this comparison depend smoothly on the ellipsoid parameters on the compact face, with the same chosen center. For $B$ sufficiently close to $A$ at fixed $A,C,\tau$, the strict gap persists. The upper disk is therefore replaceable by a smooth positive cap at a positive width, including nonround faces $B\ne A$. No change of physical gauge on the exterior is used.

## Charged controls and a joined path near round

Choose $B\ne A$ and $C\ne A$ both sufficiently close to $A$, with $A,\tau$ fixed. On $y=0$, at points with $x\ne0$ and $0<z<C$, the Euclidean principal curvatures of the four-dimensional ellipsoid are $(p,p,q,r_1)$, where $p=A^{-2}/N_0,\ q=B^{-2}/N_0$, $N_0=\sqrt{|x|^2/A^4+z^2/C^4}$, and $r_1N_0$ is a strict convex combination of $A^{-2}$ and $C^{-2}$ in the meridional direction. The Gauss curvature operator is diagonal in principal planes, its Weyl entries agree in complementary planes, and $W_{1212}=(p-q)(p-r_1)/3$. The blocks $W^\pm$ therefore each have a nonzero entry there. Such points occur in the interior of each complete side. Both individual chiral charges are strictly positive in $D$ and $V$. The case $A=C$ has a principal eigenvalue of multiplicity at least three globally and is conformally flat. The two unequal parameters remove this degeneracy.

There is also a joined positive path on these control sources. Set $\delta=|B/A-1|+|C/A-1|$. At $\delta=0$, identify the centered hyperbolic ball with the original round spherical cap by the radial dilation between its Poincaré coordinates and the spherical cap's stereographic coordinates, with angular marking fixed. Since the same radius-$R$ metric is induced at the face, the spherical metric in these coordinates is $\mu_0^2g_{\mathrm H}$ with $\mu_0=1$ on the face. Its outward logarithmic derivative equals $-c$ by shape matching.

Use the explicit profile embeddings and the planar ellipsoid dilations to transport this identification smoothly for small $\delta$. Transport $\mu_0$ and correct its logarithmic normal derivative to $-c$ by multiplying the boundary derivative correction by signed hyperbolic distance and a fixed collar cutoff in the logarithm. Correct the identification near the face to the paired Gaussian one for $g$ and $\mu^2g_{\mathrm H}$. The two identifications coincide at $\delta=0$; at small $\delta$ their relative collar map fixes the boundary and is smoothly close to the identity, so it extends over the disk by cutting off its displacement in a fixed collar. The resulting pullback cap is smooth in the parameters, equals the original metric at the round parameters and matches the first jet on the identified face. In their paired Gaussian chart, the bounds for the difference and its first and second derivatives improve to $O(\delta t^2),O(\delta|t|),O(\delta)$, including the tangential derivatives used by the smoothing. A uniform positive collar width $w_0$ is available in this compact smooth parameter family.

For $0<w<w_0$, the one-sided endpoint remains $O(\delta)$-close to round in $C^2$ on the fixed marked manifold, uniformly in $w$. The affine path $g_s=(1-s)g+s p_w$, $0\le s\le1$, also has this bound and stays PSC for small $\delta$. The full cost estimates, in each sign, are

$$
 \sup_{0\le s\le1}E_\sigma(g_s;M)\le E_\sigma(g;V)+C_1\delta^2,\qquad
 E_\sigma(p_w;M)=E_\sigma(g;V)+C_w^\sigma,\quad
 0\le C_w^\sigma\le C_2\delta^2 w .
$$

Here the whole exterior has its incoming integral at all times. The interior path integrals are bounded by its uniform $O(\delta)$ Weyl norm and bounded volume, and at the endpoint the Weyl norm of the conformally flat cap vanishes beyond the strip. At each charged control choose $w$ so $C_2\delta^2w<m_D^\sigma$ for both signs. Then both signed endpoint gains are strict and the joined peak is below $2T$ at sufficiently small $\delta$. This path uses closeness of the entire control metric to round, including the interior. The ellipsoids have the standard smooth type, whose $I$ is zero, and the control uses an induced metric with $R_g>0$ without asserting it is a Yamabe minimizer. Volume normalization by a constant dilation is compatible with the whole calculation and preserves the signed energies.

## The selected physical disk

On the volume-one positive Yamabe sequence of [E61, the marked bicollar](../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex), there is at fixed tolerance one subsequence and an actual disk $D_i$ with a smooth two-sided bicollar inside $B_i(r)$. Both complete sides carry at least $b_*>0$ in the selected sign. Its raw full curvature and collar chiral measure satisfy $\nu_i(B_i(r))<\zeta$ and $(\nu_i+\lambda_i^{s_*})(A_i)<\eta m_i^{s_*}$. The comparison ball is defined using the auxiliary location metric while $\nu_i$ uses the ordered tensor norm in the physical $g_i$. The floor, radius and marking may depend on the tolerance. The original Yamabe metric supplies $R_{g_i}>0$ on the entire exterior, and each fixed index provides some inward smooth width. The corollary supplies no measured $G_\kappa,K$, Codazzi residual, constant $\kappa$ fit, or lower bound on $c-\ell$ in a constructed cap. Its smooth disk sandwich gives no height immersion hypothesis for the same physical source and marked sphere. Small incoming collar measures do not measure a cap's first jet, or prove uniform usable widths.

For $d_i=e_i-I<m_i^{s_*}$, any exact hyperbolic fit passing the scalar test would contradict the infimum at a positive finite width. If the two raw disk masses differ, the exact match is excluded already by signature. The same comparison applies at a fixed balanced enlargement, which has its own face data. At fixed dyadic depth at least one its full retained raw exterior is eventually below $T$ in both signs under the strict band. [Balanced-disk source](../../../master/manuscript/balanced_disk.tex)

The [connected repair](../../../master/01_fixed_type_variational_descent/manuscript/connected_repair.tex) prices a thin physical shaft and a clamped cutoff, and has separate costs at the tips and full boundary. The [core variation](../../../master/01_fixed_type_variational_descent/manuscript/core_variation.tex) bounds the supported first and second variations using the minimizing excess and the physical curvature. Neither construction produces a compatible cap on the E61 face. The [exact overlap chart](../../../master/01_fixed_type_variational_descent/manuscript/exact_alternatives.tex) uses an exact Bach-flat hypothesis and its own marked disk. The [positive-time flow](../../../master/01_fixed_type_variational_descent/reviews/E71_CHARGED_FLOW.md) and [initial extension audit](../../../master/01_fixed_type_variational_descent/reviews/E72_INITIAL_EXTENSION.md) use rescaled modified sources and furnish no smooth initial identification of the physical E61 face. A conformally flat comparison carrying the protected E61 core in one fixed compact under the strong local energy-convergence hypothesis would instead force its positive charge to tend to zero. The hyperbolic model is a reference for the replacing ball, with a measured jet on its own height. It establishes no such comparison on the E61 disk.

### Input receipt

At the frozen commit, the three 05 manuscript SHA-256 values match the [preceding assessment](../reviews/PENULTIMATE_CUTS_AND_CURVED_FILLINGS_20261126.md#revision-and-review-receipt). The file SHA-256 prefixes checked for this packet are `8861a4e78e8a192e` (issue), `1742dded8c0f7696` (curved fill readback), `181dbbd51434ca0b` (physical source audit), `8063d76ad6875e80` (spectral windows), `2b8c64408c8dc45c` (connected repair), `65c76bc676af0725` (core variation), `75493d1a5acf2722` (exact alternatives), and `044c5e0c1ea3f5e4` (balanced disk). The components result in Hatcher's original publication was checked at p. 553 on 26 November 2026; the geometric formulas above are derived here. No numerical or Lean verification is claimed.
