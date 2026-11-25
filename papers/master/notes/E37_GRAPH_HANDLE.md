# E37 · A framed quadratic height trace and the cost of fixing its collars

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution of the specified saddle and matching test. The parent selected the model, and the auxiliary rounding, fixed collar widths and test levels are chosen below. Actual serving model and reasoning effort are unavailable. The mathematical baseline is `2689540e6dae1656b7f5ad4be52504db044995f2`. The exact inputs are the [master immersion section](../manuscript/immersion_entry.tex), SHA-256 `512ef85cfa696497da0b43e6efee36c4c60dd1f7d1eb78f4442b6d078a0b2c8e`, the [E32 bridge](E32_ROTATIONAL_TRANSITION.md), `117212d92c59696ecfe03cbe1c512165c8e88c391a7b67e781ff338ff06fe64b`, the [E34 index and Weyl audit](../reviews/E34_MIDDLE_WEYL_EQUALITY.md), `af154cb515a24a51c9d4fb2aa58a61325fc023cdde5897ec08ea6826f77ec3bc`, and the [immersed-construction handoff](../../investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/continuation-notes/CONTINUATION.md) linked from the [parallel program](../continuation-notes/PARALLEL_PROGRAM_20261125.md), respectively `a95c37633e340e9180ef67cd6475e91091266c091e243a150c9693c04bd891ce` and `558ee0badcbd72841688d22cd35757bcaffa72ad5ef5840535d6ca048939622c`. This is a local construction and a lower bound for the stated fixed collar class.

## Marked domain and actual height

Use the standard orientation on \(z=(x,y)\in\mathbb R^2\times\mathbb R^2\) and on \(\mathbb R^4\times\mathbb R\). Write

\[
 H=D_x^2\times D_y^2,\qquad D=\operatorname{diag}(-1,-1,1,1),\qquad
 q=\frac{|y|^2-|x|^2}{2},\qquad s=\frac{|y|^2+|x|^2}{2}.
\]

The attaching face is \(|x|=1\), the outgoing face is \(|y|=1\), and their corner is the product torus. For a smooth rounding, take \(0<\delta<1/2\) and let \(\rho\) be the convolution of \(|\cdot|\) with a nonnegative smooth even mollifier of integral one supported in \((-\delta,\delta)\). Then \(\rho=|\cdot|\) outside that interval, \(|q|\le\rho(q)\le |q|+\delta\), and \(|\rho'|\le1\). Put \(\Omega=\{s+\rho(q)\le1\}\). This agrees with the box except in a neighborhood of the corner. Where the boundary has \(|q|<\delta\), both radii are positive and \(\partial_s(s+\rho(q))=1\). Away from the rounding the boundary is a smooth face of the original product. The rounded domain is star-shaped since \(s+\rho(q)\) is nondecreasing in each of \(|x|^2,|y|^2\).

For \(R>0\) and \(0<t\le1\), use

\[
 F_{R,t}(z)=(Rz,Rtq(z)),\qquad h=\langle F_{R,t},e_5\rangle=Rtq.
\]

It is a smooth embedding on this patch since its horizontal differential is \(RI\) and its horizontal projection is injective. The actual vertical height has just one interior critical point at zero, with Hessian \(RtD\) and index two. The two original product faces are transverse collar markings and generally have varying height. To identify the Morse levels, fix \(\delta<\lambda<1/2\) and restrict to \(T_\lambda=\Omega\cap\{|q|\le\lambda\}\). Its regular levels \(h=\pm Rt\lambda\) are the solid tori

\[
 (\theta,v)\longmapsto (\sqrt{2\lambda+|v|^2}\,\theta,v),\quad |v|\le\sqrt{1-2\lambda},
 \qquad
 (w,\phi)\longmapsto (w,\sqrt{2\lambda+|w|^2}\,\phi),\quad |w|\le\sqrt{1-2\lambda}.
\]

The maps are in the domain and are followed by \(F_{R,t}\) for the actual horizontal slices. The lateral side is the product with coordinates \((q,\theta,\phi)\) given by radii \(\sqrt{1-\rho(q)-q}\) and \(\sqrt{1-\rho(q)+q}\). These radii are positive throughout the trace, and \(h\) is a submersion on that side. The negative gradient of \(h\) in the induced metric has the same trajectories as \((x,-y)\). Its unstable and stable disks are the respective coordinate disks \(y=0\) and \(x=0\). The parametrization at the lower level has the attaching circle \(v=0\) and its two marked normal vectors \(\partial_{v_1},\partial_{v_2}\). At the circle these vectors are exactly the \(y\) coordinate vectors, since the radial factor has zero \(v\) derivative there. The outgoing parametrization records the belt circle \(w=0\) and the corresponding \(x\) framing. On the lateral torus the angle \(\theta\) at the lower level remains \(\theta\) at the upper level, and the same holds for \(\phi\). This identifies the framed surgery, including the product side. Its framing in an exterior is the image of this marked product framing under the supplied exterior attachment.

## Quadratic energy and matching estimates

The normal is \(\nu=(-tDz,1)/w\), where \(w^2=1+t^2|z|^2\), with convention \(d\nu=-dF\circ A\). For \(R=1\), \(g=I+t^2Dz\otimes Dz\), the second fundamental form is \(tD/w\), and the volume density is \(w\). In an induced orthonormal frame the symmetric matrix for \(A\) is \(t g^{-1/2}Dg^{-1/2}/w=tD+O(t^3)\) uniformly. Congruence gives signature \((2,2)\) throughout. The exact determinant and scalar curvature at general \(R\) are

\[
 \det A=\frac{t^4}{R^4w^6},\qquad dV_g=R^4w\,dz,\qquad
 \operatorname{Scal}_g=-\frac{2t^2(2+t^2|z|^2)}{R^2w^4}.
\]

For the scalar formula, \(\operatorname{Scal}=(\operatorname{tr} A)^2-|A|^2\) and \(g^{-1}=I-t^2Dz\otimes Dz/w^2\) at \(R=1\). The chiral principal-curvature formula in the master gives leading eigenvalues \((4/3,-2/3,-2/3)t^2/R^2\) on either chiral block. With \(E_\pm\) the squared Hilbert–Schmidt Weyl integral in the induced Riemannian metric, and \(B^2(V)=\int_V|A^\circ|^4\,dV_g\), every measurable \(V\subset\Omega\) satisfies

\[
 \begin{aligned}
 E_\pm(g;V)&=\tfrac83 |V|t^4+O(|V|t^6),&
 \int_V\det A\,dV_g&=|V|t^4+O(|V|t^6),\\
 B^2(V)&=16|V|t^4+O(|V|t^6),& J(V)&=0 .
 \end{aligned}
\]

Here \(|V|\) is horizontal coordinate volume, and constants are uniform in \(V\) and \(R\). Ambient dilation changes neither energy nor Gauss mass. Small energy comes from the dimensionless amplitude \(t\). The induced scalar curvature is negative even before adding matching bands. [Master operator normalization and Gauss equation](../manuscript/immersion_entry.tex)

For matching, fix a width \(\epsilon>0\), small compared to one, in the normalized coordinates. Suppose the two prescribed graph germs in the same horizontal marking are \((Rz,Rt k_{x,t}(z))\) on \(r_x>1-\epsilon\) and \((Rz,Rt k_{y,t}(z))\) on \(r_y>1-\epsilon\), where \(r_x=|x|\), \(r_y=|y|\). Require equality on the common collar and a uniform \(C^2\) bound on the two functions. For an exterior application the graphs are supplied across the gluing seam. A common height translation can be included throughout. Let \(k_t\) denote the combined function on the union. Choose smooth radial \(\chi_x,\chi_y\) supported in these regions, equal to one for the corresponding radius at least \(1-\epsilon/2\), with derivatives through order two bounded by \(C\epsilon^{-j}\). Then use

\[
 \chi=1-(1-\chi_x)(1-\chi_y),\qquad
 f_t=q+\chi(k_t-q),\qquad F(z)=(Rz,Rt f_t(z)).
\]

The added term extends smoothly by zero. Take \(\sqrt{1-\delta}>1-\epsilon/2\), so a neighborhood of the whole rounded boundary, including its corner patch, has \(\chi=1\). The map equals both prescribed germs on those neighborhoods and equals the quadratic graph away from the two collar supports. The horizontal differential is still \(RI\). With \(M_j=\sup |D^j(k_t-q)|\) on the collar union for \(0\le j\le2\), the Hessian bound there has the form \(K=C(1+M_2+\epsilon^{-1}M_1+\epsilon^{-2}M_0)\).

For a graph of a function \(l\) at \(R=1\), \(|A|\le|D^2l|/(1+|Dl|^2)^{1/2}\) and \(dV=(1+|Dl|^2)^{1/2}dz\). The quantities \(|W^\pm|^2,|\det A|,|A^\circ|^4,\operatorname{Scal}_-^2\) are bounded by a constant times \(|A|^4\). On each of the attaching collar outside the outgoing collar, the outgoing collar outside the attaching collar, and their overlap, the integral of each quantity over \(V\) is at most \(C|V|t^4K^4\). This also holds at any \(R\). These regions and the core form a partition up to boundaries of measure zero. Uniform bounds give \(O(t^4)\) cost at fixed \(\epsilon\), while the estimate displays the derivative losses if one shrinks the normalized collar widths.

## Height after matching

Bounded normalized jets suffice for the preceding energy estimate. For the index and the actual framing after matching, one sufficient extra condition is sufficiently small \(\|\eta_t\|_{C^1(\Omega)}\), where \(\eta_t=\chi(k_t-q)\). Fix \(\sigma>0\) so \(\lambda+2\sigma<1/2\) and choose \(\epsilon\) with \(1-\epsilon>\sqrt{2(\lambda+2\sigma)}\). The perturbation then vanishes on neighborhoods of both core disks through the larger trace \(|q|\le\lambda+2\sigma\). On its support \(|Dq|\ge1-\epsilon\), and the side derivative of \(q\) in the product coordinate is one. By compactness and the chosen margins, all \(q+u\eta_t\), \(0\le u\le1\), have just the original interior critical point, and are submersive on the side in the level range containing \(\pm\lambda\). The gradient and Hessian at zero are the unmodified ones. The actual regular levels after matching are \(F(\{f_t=\pm\lambda\})\).

For the marking, on a fixed slightly larger trace choose smooth \(Z_u\) with \(d(q+u\eta_t)(Z_u)=1\) near the support of \(\eta_t\) in the desired level band, with \(Z_u\) tangent to \(\partial\Omega\) along the side. Such fields exist by the interior and side submersions and a partition of unity. Multiply \(-\eta_t Z_u\) by a cutoff supported within the larger trace and equal to one on the smaller band. Its flow fixes neighborhoods of the core disks, preserves the side, and transports the original marked levels and the intervening trace because \(\partial_u(q+u\eta_t)+d(q+u\eta_t)(-\eta_t Z_u)=0\) there. Thus the incoming and belt framings agree as germs along their circles and the full solid-torus coordinates are transported by this flow. For a prescribed product side marking that must agree as a map, one may impose \(k_t=q\) there or require the exterior identification to use the indicated transport. For an exact untransported parametrization of the two original levels, impose \(\eta_t=0\) near them. A bounded normalized jet family alone can introduce extra height critical points. Global regularity of the selected levels also requires regularity on the supplied exterior.

## Directional charge and fixed collar obstruction

A graph with slope at most \(S\) has all upward normals in the cap of angular radius \(\arctan S\) about \(e_5\). Its height critical directions are in this cap or its antipodal cap. The measure of either cap is \(|S^3|\int_0^{\arctan S}\sin^3\theta\,d\theta=O(S^4)\) as \(S\to0\). For the bounded matched graphs, \(S=O(t)\). For the quadratic graph write \(N_t=\nu_{F_{R,t}}(\Omega^\circ)\) in the upper hemisphere. The normal is injective and its Jacobian gives the exact directional area

\[
 \sigma_4(N_t)=t^4\int_\Omega(1+t^2|z|^2)^{-5/2}\,dz>0 .
\]

There is exactly one index-two critical point in the patch for each direction in \(N_t\cup(-N_t)\). A fixed nonhorizontal collar already bounds the attainable slope below. In a putative nonstandard closed completion the master requires middle-signature determinant mass at least \(\omega=8\pi^2/3\). If a finite number of these patches with uniformly bounded normalized collar data has amplitudes \(t_i\), the remaining domain must supply at least \(\omega-O(\sum_i t_i^4)\), by the preceding patch determinant bounds. [Master indexed area formula](../manuscript/immersion_entry.tex)

There is a stronger obstruction for one fixed quadratic collar. Fix \(R>0,t_0>0\) and suppose any smooth immersion \(G:\Omega\to\mathbb R^5\) equals \(F_{R,t_0}\) on a neighborhood of the entire rounded boundary in the given marking. The following estimate allows arbitrary smooth immersed interiors and self-intersections:

\[
 E_\pm(G^*\delta;\Omega)>\frac83\sigma_4(N_{t_0}).
\]

To see this, let \(u\in N_{t_0}\) be a regular value for both signs of the Gauss map of \(G\). Such directions have full measure in \(N_{t_0}\) by Sard on the interior. The reference height \(h_0=\langle F_{R,t_0},u\rangle\) on \(\mathbb R^4\) has one critical point \(z_0\in\Omega^\circ\) with index two. Completing the square gives \(h_0=c+bq(z-z_0)\) for \(b=Rt_0 u_5>0\) and a constant \(c\). Extend \(h_G=\langle G,u\rangle\) from the given patch by \(h_0\) to all of \(\mathbb R^4\). The extension is smooth by germ equality. Choose \(L>0\) larger than both \(|h_G-c|\) and \(|h_0-c|\) on \(\Omega\). Take an auxiliary centered rounded product box about \(z_0\), using the same construction at sufficiently large radius, and truncate it by \(|h_0-c|\le L\). This auxiliary trace contains \(\Omega\) in its interior. Its incoming face at \(c-L\) is a solid torus, its side is a product in \(h_0\), and the trace is star-shaped by radial contraction toward \(z_0\). For \(h_G\) the same two faces and side are unchanged, and \(c\pm L\) are actual regular end levels because the modification lies strictly between them. The relative second homology of the trace and its incoming face is \(\mathbb Z\).

The Morse cell argument applies with this product side. One implementation is to double the trace along the side in coordinates \((q,R_{\rm aux}^2-s-\rho(q),\theta,\phi)\) centered at \(z_0\), where \(R_{\rm aux}\) is the auxiliary box radius and \(\rho\) its chosen smoothing function. The height is independent of the inward coordinate near the side. Thus the double is a smooth compact cobordism with height a product near its incoming and outgoing boundaries. Its relative second homology contains that of the original trace by the folding retraction of pairs. The no-critical-level deformation and local index-cell attachment apply on the double, after adding product collars beyond the two regular levels. Their bands are compact. If necessary, equal critical values may be separated by small bumps constant near the critical points, preserving all indices and critical locations. With no index-two points, relative degree-two homology would vanish. As all critical points of the doubled height lie in the copies of \(\Omega^\circ\), \(G\) has at least one index-two point for almost every \(u\in N_{t_0}\). [Milnor, *Morse Theory*, 1963, Theorems 3.1–3.2, compact regular-band deformation and single-critical-point attachment, passages inspected 25 November 2026](https://pagine.dm.unipi.it/~a019210/Milnor_Morse%20theory.pdf)

Put \(U_G=\{A_G\text{ has signature }(2,2)\}\) and include both signs of the Gauss normal in the height count. Since \(N_{t_0}\) and \(-N_{t_0}\) are disjoint, the area formula gives \(\int_{U_G}\det A_G\,dV\ge\sigma_4(N_{t_0})\) without a factor of two. The local E34 Weyl comparison is strict after integration over any nonempty open middle-signature locus, by its Euclidean Codazzi argument. This proves the displayed lower bound. Its right side is independent of \(R\), and in the small-\(t_0\) regime the unmodified graph has the same leading coefficient \((8/3)|\Omega|t_0^4\) as the lower bound. [E34 pointwise comparison and local strictness](../reviews/E34_MIDDLE_WEYL_EQUALITY.md#sharp-pointwise-estimate-and-strict-integrated-estimate)

## Exterior premise for an assembled immersion

The cheap framed-height construction uses compatible collar heights and slopes of order \(t\) in normalized coordinates and leaves the full exterior budget to be supplied. A fixed horizontal plane germ satisfies the energy estimate alone, but a completely flat side fails the height submersion condition. For exact attachment the exterior already carries the specified product and corner markings in the common graph coordinates. If the exterior is modified to realize them, charge that modification to the same induced metric and count overlaps once. The fixed quadratic collar estimate rules out vanishing local cost for its class even if the filling ceases to be a graph. It gives a local threshold in terms of the fixed normal image, with no universal positive bound as the boundary amplitude tends to zero. E32 concerns a different interface with spherical faces and a fixed negative determinant charge. Here the quadratic height carries positive middle determinant mass, and the local scalar-curvature and energy analysis supplies no closed Yamabe sign or arbitrary marked extension. [E32 marked bridge and its separate exterior hypotheses](E32_ROTATIONAL_TRANSITION.md)
