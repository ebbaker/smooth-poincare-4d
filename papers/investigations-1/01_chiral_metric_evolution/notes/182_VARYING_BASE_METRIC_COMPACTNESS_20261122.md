# E182 — Metric compactness on varying smooth homotopy spheres

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E execution under B90, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored E168's unscaled chart construction and audited the full-core topology argument in E166. I did not author E165. The varying-domain step below uses the checked analytic and source inputs with their original hypotheses, and reconstructs the comparison maps for the present quantifiers.

## Statement of \(H_{\rm var}\) and conventions

Let \((M_i,g_i)\) be a sequence of smooth closed connected oriented homotopy four-spheres with smooth positive Riemannian metrics and uniform constants \(K,K_+<\infty\), \(v>0\) and \(D<\infty\) such that

\[
 |\operatorname{Ric}_{g_i}|_{g_i}\le K,\qquad |W^+_{g_i}|_{\rm op,HS}\le K_+,
 \qquad \operatorname{Vol}(M_i,g_i)\ge v,\qquad
 \operatorname{diam}(M_i,g_i)\le D.                                  \tag{1}
\]

The Ricci norm is the absolute Hilbert–Schmidt tensor norm. The \(+\) block uses the chosen orientation on each \(M_i\) and the ordinary self-dual two-form space with its Hilbert–Schmidt endomorphism norm. The corresponding \((0,4)\) norm of \(W^+\) is twice that norm, because a full component contraction counts each antisymmetric pair twice. Full curvature energy below always uses the full \((0,4)\) Riemann tensor norm. These are the metric conventions used with native reconstructed metrics in E168, with no rescaling of the unscaled conclusion.

Then there is a subsequence, one fixed smooth oriented homotopy sphere \(M_{\rm ref}\) chosen from its late members, and smooth orientation-preserving diffeomorphisms \(f_i:M_{\rm ref}\to M_i\) such that \(f_i^*g_i\) converges strongly in \(C^{1,1/4}\) to a positive metric. After a further subsequence the convergence is weak in \(W^{2,8}\), with the same limit in a fixed smooth reference atlas. In particular, the agreement of smooth types within this subsequence is a conclusion of the maps. The hypotheses prescribe neither a common smooth base nor injectivity or full-curvature supremum bounds.

## Radius and chart facts on the individual bases

Use E165's explicit scale-invariant harmonic radius with \(p=8\), \(m=2\), and \(\eta=1\) as in E168. An admissible radius \(r\) gives a centered smooth harmonic chart on \(B_g(x,r)\) with matrix \(h\) satisfying \(m^{-1}I\le h\le mI\) and

\[
 r^{1-4/p}\|Dh\|_{L^p}+r^{2-4/p}\|D^2h\|_{L^p}\le\eta               \tag{2}
\]

in coordinate Lebesgue measure. The radius is the supremum of these radii. The powers are positive, so admissibility passes to a centered restriction. On each individual smooth compact manifold, small harmonic coordinates and affine normalization give strict inequalities locally. Restrict and recenter over a smaller neighborhood and use a finite cover of that one manifold to obtain a positive minimum-radius infimum for that metric. A chart on the entire compact manifold is impossible, so the radius is finite. This gives no common lower bound across indices at this stage. Reflection of one coordinate makes each chart orientation preserving without altering any threshold. [E165 radius definition][pre] · [E165/E167 assessed convention][prea]

The following chart margins apply with any common admissible intrinsic radius \(a_0\), on either the scaled or unscaled sequence. Its harmonic image contains \(B(0,a_0/\sqrt m)\). Indeed, a radial coordinate segment shorter than \(a_0/\sqrt m\) has lifted length less than \(a_0\). A first failure would converge to a point inside the intrinsic chart by completeness and could be continued. Fix \(16\sqrt m\,\rho<a_0\). The parametrizations \(\phi_{ia}:B_{4\rho}\to M_i\) at the selected centers are \(\sqrt m\)-bi-Lipschitz for the ambient distance, with the inverse constant \(\sqrt m\). The upper estimate uses a straight segment. For the lower estimate, any minimizing geodesic between their image points has length at most \(8\sqrt m\,\rho\) and starts within \(4\sqrt m\,\rho\) of the center, so it stays in the full \(a_0\)-ball and the coordinate displacement is at most \(\sqrt m\) times its length. For \(0<b<B<4\rho\), the ambient ball of radius \((B-b)/(2\sqrt m)\) about \(\phi_{ia}(u)\), \(|u|\le b\), lies in \(\phi_{ia}(B_B)\) by the same short-geodesic argument. In particular \(B_g(q_{ia},\rho/(2\sqrt m))\subset\phi_{ia}(B_\rho)\) at the chart center. This estimate puts close points in the *same approximating chart on \(M_i\)* and hence will justify transitions and inverse-branch compatibility within each individual base.

## Vanishing-radius alternative on the varying bases

### Uniform pointed geometry and analytic charts

Suppose along a subsequence \(r_i=\inf_{M_i}r_h(g_i,\cdot)\to0\). Select \(x_i\in M_i\) with \(r_h(g_i,x_i)\le(1+i^{-1})r_i\). In \(\bar g_i=r_i^{-2}g_i\) the radius rescales by \(r_i^{-1}\), the global radius is at least one, and its value at \(x_i\) is at most \(1+i^{-1}\). The native norm bounds become \(|\operatorname{Ric}_{\bar g_i}|\le Kr_i^2\) and \(|W^+_{\bar g_i}|_{\rm op,HS}\le K_+r_i^2\). Positive constant scaling preserves the Hodge splitting on two-forms. Orientation is the one already chosen separately on each \(M_i\).

Take \(D'>D\), \(\kappa=K/3\), and let \(\mathcal V_{-\kappa}\) denote four-dimensional model ball volume, with Euclidean unit volume \(\omega_4\). Bishop–Gromov at radii \(r_i t\le D'\) and \(D'\), and the small-radius upper bound, give for every center \(y\in M_i\)

\[
 c t^4\le \operatorname{Vol}_{\bar g_i} B_{\bar g_i}(y,t)
          \le \mathcal V_{-\kappa r_i^2}(t),
            \qquad c=\frac{v\omega_4}{\mathcal V_{-\kappa}(D')}>0 .  \tag{3}
\]

Here \(B_{g_i}(y,D')=M_i\) on each base. The same comparison bounds \(\operatorname{Vol}(M_i,g_i)\le\mathcal V_{-\kappa}(D')\). Thus separated points on any fixed rescaled pointed ball have uniformly bounded cardinality at any fixed separation, by comparing disjoint smaller balls with a single larger ball. At every integral radius take a finite dyadic mesh net with the basepoint, pad to fixed cardinalities for that scale, and diagonalize the mutual distances of all the labels. Quotient the resulting pseudometric by zero distances and complete. Each bounded ball has finite nets by the finite-minimum passage from the approximants, so the limit \((N,d,x_\infty)\) is proper. Nearest labels in successively finer nets give pointed maps with distance-distortion and density errors tending to zero on bounded regions. Limiting midpoints of geodesics show that \(d\) is geodesic. This constructs the pre-ALE comparison metric space using no point in common between different bases. [E165 packing and pointed limit][pre] · [Assessed volume inputs][prea]

Choose a countable dense set on \(N\) including \(x_\infty\), lift its centers by these metric approximations to each \(\bar g_i\) (with \(x_i\) for the basepoint), and apply the chart margins with \(a_0=1/2\). The metric arrays \(h_{ia}=\phi_{ia}^*\bar g_i\) on the fixed Euclidean balls have uniform ellipticity and local \(W^{2,p}\) bounds. The Lipschitz estimates and a countable coordinate-point diagonalization give uniform metric convergence of the parametrizations on compact subballs. The limit maps are bi-Lipschitz onto open images because the interior-ball inclusion passes to the limit, using approximate preimages and compactness of the larger coordinate ball. The inner chart images cover \(N\) by density of the centers. Rellich–Morrey gives strong local \(C^{1,\beta}\), \(0<\beta<1-4/p\), and weak \(W^{2,p}\) convergence of the arrays. If a compact coordinate set lies in an overlap with the other limiting coordinates in a compact subball, the corresponding two images in \(M_i\) are uniformly close in distance. The interior margin puts them in the same second approximating chart, giving both existence and \(C^0\) convergence of \(\phi_{ib}^{-1}\phi_{ia}\) on smaller overlaps. These comparisons use distances in \(M_i\) alone.

In the chart the harmonic Ricci equation is \(-a_{ia}^{jk}\partial_{jk}h_{ia}/2+Q(h_{ia},Dh_{ia})=\operatorname{Ric}(h_{ia})\) with \(a_{ia}=h_{ia}^{-1}\) and smooth lower expression quadratic in first derivatives. The right side tends uniformly to zero in components. The weak second-derivative and strong first-derivative limits give the same equation with zero right side, and the checked interior estimate and Schauder bootstrapping give smooth limit arrays \(h_a\). Subtract the limiting equation with coefficient \(a_{ia}\). The difference equation's right side is the first-jet expression difference, the vanishing Ricci term, and the coefficient difference times the smooth \(D^2h_a\). All three tend to zero in \(L^p\) locally. The interior \(W^{2,p}\) estimate gives strong local \(W^{2,p}\) convergence.

Each transition component solves \(a_{ia}^{jk}\partial_{jk}\theta_{iab}=0\). Coefficient convergence, interior estimates, and the \(C^0\) limit identify its equation with smooth limiting coefficients. The transitions and reverse transitions are smooth. The difference equation has right side \((a_a^{jk}-a_{ia}^{jk})\partial_{jk}\theta_{ab}\), tending to zero in \(W^{1,p}\) locally. Apply the interior \(W^{2,p}\) estimate to the difference and then to its first derivative. The extra term is \(-\partial_\ell a_{ia}^{jk}\partial_{jk}(\theta_{iab}-\theta_{ab})\), which tends to zero in \(L^p\). This gives strong \(W^{3,p}\) and \(C^2\) convergence locally. Since the reverse transitions are also smooth, the limits are diffeomorphisms on the overlaps, with positive Jacobians inherited from the positive charts. The metric transition identity passes to give a smooth oriented positive metric \(h\) on \(N\). The short-geodesic inclusion and convergence of coefficient matrices identify the local distance with the local metric length distance. Globally the equality follows from the length property on both sides and geodesicity of \(d\). Thus \(h\) is complete as \(d\) is proper. The analytic equations in this paragraph are on common Euclidean coordinates, irrespective of the input smooth types. [E165 harmonic-coordinate derivation][pre] · [E167 assessment][prea]

### Compact embeddings into the separate \(M_i\)

Fix a compact region in \(N\) including \(x_\infty\) and a compact neighborhood on which finitely many inner charts cover. Take smooth scalar cutoffs \(\zeta_a\) of compact support in those charts, with at least one positive at every point of the region's neighborhood. Assemble the finite blocks \((\zeta_a(u),\zeta_a(u)u)\) in the limit charts to define \(I\), and in the approximating charts to define \(I_i\) on \(M_i\), extending each block by zero. Wherever a scalar block is positive its division into the vector block recovers the corresponding coordinates. Thus \(I\) is a smooth embedding on the positive-cutoff neighborhood. Each \(I_i\) is smooth there in its own analogous region, with the same coordinate recovery. On compact coordinate subballs meeting the chosen region, \(I_i\phi_{ia}\to I\phi_a\) strongly in \(W^{3,p}\) and \(C^2\). Indeed, a neighborhood of a point in the limiting support of another block lies inside the overlap, so the transition convergence applies. Off the closed support at positive distance the block is eventually zero. A finite subcover gives the assertion.

Use the smooth nearest tubular projection to the smooth limit image near the compact region and set \(R_i=I^{-1}\pi_{\rm tub}I_i\) there, a map from part of \(M_i\) to \(N\). The projection is to the *smooth pre-ALE limit* and fixed before varying \(i\). In charts \(R_i\) approaches the identity in \(C^2\) and \(W^{3,p}\). For finitely many nested chart balls, the derivative close to the identity gives injectivity in the larger convex coordinate ball. Its range contains the smaller ball by contraction for the equation \(u+(R_i^{\rm coord}(u)-u)=w\) within the larger ball. On an overlap, candidates from two inverse branches both map under the metric approximations to the same limit point up to uniform vanishing error. Applying the interior margin at a chart containing that point places both candidates in the same larger coordinate ball on \(M_i\), where local injectivity proves equality. This gives a smooth \(F_i\) on a neighborhood of the compact region, with \(R_i F_i=\mathrm{id}\). In particular it is a smooth embedding into the corresponding \(M_i\). A compactly supported coordinate translation in the domain tending smoothly to the identity corrects the basepoint, since \(R_i(x_i)\to x_\infty\). The resulting maps are based and orientation preserving by their positive local Jacobians.

Differentiating the local inverse relation through order three gives \(W^{3,p}\) and \(C^2\) convergence of these branch coordinates, with bounded inverse Jacobians for changes of variables. The metric pullback formula, the strong \(W^{2,p}\) convergence of the chart matrices and smoothness of \(h_a\) give strong \(W^{2,p}\) and \(C^{1,\beta}\) convergence of \(F_i^*\bar g_i\) on compacts. For any fixed radius \(t\) choose the region to contain a neighborhood of \(\overline B_h(y,t+1)\). For small fixed \(\epsilon>0\), the comparison gives

\[
 B_{\bar g_i}(F_i(y),t-\epsilon)\subset F_i(B_h(y,t))
               \subset B_{\bar g_i}(F_i(y),t+\epsilon).             \tag{4}
\]

For the outer inclusion use the distance approximations. For the inner, a point in the smaller approximating ball lies metrically close to a limit point in a slightly smaller limiting ball. The finite cover and the interior margins place it in an approximating chart where \(R_i\) is defined and whose image lies in \(B_h(y,t)\). The local inverse returns the original point. The small based correction preserves the strict margins. Thus the Euclidean projections give actual whole-compact comparison embeddings and ball coverage within each \(M_i\). No global target for these pointed maps is presumed. [E165 compact maps, including ball inclusions][pre] · [Assessed comparison proof][prea]

### Full energy, nonflatness, and the full ALE core

Since distance spheres for smooth complete \(h\) have volume zero, (4) and pullback convergence pass (3) to \(\operatorname{Vol}_h B_h(y,t)\ge ct^4\) for every center and radius. The distance-sphere fact follows by exponentiating the fixed-radius tangent sphere using completeness. Strong \(W^{2,p}\) and \(C^1\) convergence give strong local \(L^p\) curvature convergence and, by orientation, convergence of the positive Weyl block. Thus \(\operatorname{Ric}_h=W_h^+=0\). The uniform full curvature energy is supplied separately on each smooth closed \(M_i\) by Chern–Gauss–Bonnet. With its full tensor convention,

\[
 \begin{aligned}
 \int_{M_i}|\operatorname{Rm}_{g_i}|^2\,dV_{g_i}
   &=32\pi^2\chi(M_i) + \int_{M_i}(4|\operatorname{Ric}_{g_i}|^2-s_{g_i}^2)\,dV_{g_i}\\
   &\le 64\pi^2+4K^2\mathcal V_{-\kappa}(D').
 \end{aligned}                                                       \tag{5}
\]

This uses \(\chi(M_i)=2\) for every homotopy sphere. Energy is invariant under the constant rescaling in dimension four. By strong local curvature convergence under the embeddings, their pullback energies on compact regions are bounded by (5), and exhaustion gives finite total full curvature energy on \(N\).

The nonflatness test is also intrinsic to the pointed constructions. If \(h\) is flat, its complete simply connected cover is Euclidean. If a deck motion \(x\mapsto Ax+b\) is nontrivial, freeness requires the component of \(b\) in \(\ker(I-A)\) to be nonzero, since otherwise \((I-A)x=b\) has a solution. Centering the orthogonal affine component, a cyclic intermediate quotient by this motion has a fundamental slab of finite length \(\ell>0\) in its invariant translation direction. Transverse distance is well-defined and Lipschitz on it, so a radius-\(t\) ball centered on the axis has volume at most \(\ell\omega_3 t^3\). Lifting paths shows that a ball in the further quotient \(N\) is the image of the ball upstairs, violating the lower \(ct^4\) growth. Hence a flat limit must be Euclidean.

In the Euclidean case choose the based embeddings on the closed radius-five ball. Put \(k_i=F_i^*\bar g_i\) so \(k_i\to I\) strongly in \(W^{2,p}\) on the radius-four ball. Write \(\Delta_{k_i}=a_i^{jk}\partial_{jk}+b_i^j\partial_j\), with \(a_i\to I\) in \(W^{2,p}\) and \(b_i\to0\) in \(W^{1,p}\). Solve the harmonic Dirichlet problem with coordinate boundary values there. The correction \(w_i\) to the Euclidean coordinates goes to zero in \(W^{2,p}\) by the Euclidean Dirichlet inverse, using the small \(C^0\) coefficient errors as a contraction. Differentiating the corrected equation and using \(Da_i\) bounded in \(C^0\), \(Db_i\to0\) in \(L^p\), and \(Dw_i\to0\) uniformly yields \(w_i\to0\) in \(W^{3,p}\) on the radius-three ball by the interior estimate. There \(x+w_i(x)\) is a genuine harmonic coordinate diffeomorphism onto its image by the derivative bound and convexity. The metric matrices in those coordinates tend to \(I\) in \(W^{2,p}\) and uniformly by the inverse-coordinate formula. Recenter at \(x_i\). By (4) the chart contains the whole intrinsic radius-two ball about \(x_i\), so restriction gives the admissibility (2) at radius two with strict inequalities for large \(i\). This contradicts its rescaled radius at most \(1+i^{-1}\). Here the Dirichlet calculation is on one fixed Euclidean ball reached by the individual embeddings. No harmonic-radius continuity or common ambient smooth type enters. [E165 energy and nonflatness][pre] · [Assessed nonflatness argument][prea]

The smooth complete nonflat Ricci-flat candidate now has all hypotheses of the checked Bando–Kasue–Nakajima Theorem (1.5) and Remark (1.8)(1) in dimension four. These give one smooth ALE end of order four with the derivative decay needed by the smooth core obstruction. The oriented quotient group lies in \(SO(4)\) and acts freely on the round \(S^3\) section. Fix one sufficiently large smooth full radial truncation of \(N\), with its entire product exterior. The compact comparison maps above restrict to its smooth orientation-preserving embeddings into the individual \(M_i\) for all sufficiently late indices. Each target is a closed oriented *integral* homology four-sphere, so the assessed full-core obstruction applies on each target separately. It is immaterial whether any two targets are diffeomorphic. This contradiction excludes a subsequence with \(r_i\to0\). Thus there is a common positive harmonic-radius lower bound on the sequence. [Assessed BKN implication][ale] · [Assessed full-core obstruction][core]

## Unscaled maps to one actual smooth reference

Let \(r_*>0\) be a common lower bound and use the chart margins with \(a_0=r_*/2\). On the unscaled sequence, (1) and the same Bishop–Gromov comparison give global upper volume and lower volumes of all balls at each fixed small radius. Diagonal finite global nets therefore give a compact distance limit \(Y\) with approximations \(e_i:M_i\to Y\) whose distortion and density errors vanish. This uses bounded diameter, so the pointed labels can be replaced by finite global lists at each mesh. Choose a finite \(\rho/(16\sqrt m)\)-net \(y_a\) in \(Y\), and centers \(q_{ia}\) with \(e_i(q_{ia})\to y_a\). Every point of \(M_i\) is within \(\rho/(2\sqrt m)\) of some \(q_{ia}\) for large \(i\). Hence the positive harmonic charts \(\phi_{ia}:B_{4\rho}\to M_i\) at these centers cover \(M_i\) by their inner \(B_\rho\) images. Their Euclidean parametrizations have metric limits as above and persistent overlaps by the interior margins. Neither a smooth reference map nor smoothness of \(Y\) is needed here.

Set \(\alpha_0=5/12\), \(\alpha_1=1/3\), \(\alpha=1/4\). The unscaled matrices \(h_{ia}=\phi_{ia}^*g_i\) are uniformly bounded in \(W^{2,8}\) and converge locally in \(C^{1,\alpha_0}\) on the chart balls. In an overlap, the coordinate transition components satisfy \(a_{ia}^{jk}\partial_{jk}\theta_{iab}=0\) with uniform ellipticity and \(C^{1,\alpha_0}\) coefficient bounds. The interior Schauder estimate yields uniform \(C^{2,\alpha_0}\) on smaller overlaps. Differentiating once produces right side \(-\partial_\ell a_{ia}^{jk}\partial_{jk}\theta_{iab}\) uniformly in \(C^{\alpha_0}\), so a second interior estimate gives uniform \(C^{3,\alpha_0}\) still farther inside. Compact embedding and the metric \(C^0\) transition limits yield local \(C^{3,\alpha_1}\) convergence. This uses harmonic coordinate functions. It assumes no convergence of the unscaled Ricci tensors and no smooth Einstein limit. [E168 unscaled chart estimates][unscaled] · [Assessed unscaled compactness][metric]

Choose smooth nonnegative cutoffs \(\zeta_a\) equal to one on \(B_{2\rho}\) and compactly supported in \(B_{3\rho}\). In a common Euclidean space form the maps

\[
 I_i:M_i\longrightarrow\mathbb R^{5A},\qquad
 I_i(x)=\bigl((\zeta_a,\zeta_a u)(\phi_{ia}^{-1}(x))\bigr)_{a=1}^A, \tag{6}
\]

where \(A\) is the fixed number of charts and each block is extended by zero. Each \(I_i\) is a global smooth embedding because the inner charts cover. At a point in an inner chart, the corresponding block recovers the coordinate and gives immersion. Equality of two images forces the second point to be in that same chart with the same coordinate. Compactness gives a homeomorphism onto the image. In chart notation \(F_{ia}=I_i\phi_{ia}\) converges in \(C^{3,\alpha_1}\) on \(\overline B_{7\rho/4}\). For each other block use persistent overlaps at points in its closed limiting support, and its eventual vanishing off that support at positive distance, with the finite chart cover. Consequently \(\|D F_{ia}\|,\|D^2 F_{ia}\|\le L\) uniformly there, with \(L\ge1\), and \((DF_{ia})^TDF_{ia}\ge I\) from the identity block in chart \(a\).

The embedding also has a uniform separation estimate on each individual manifold. Suppose \(x=\phi_{ia}(u)\), \(|u|\le3\rho/2\), and \(|I_i(x)-I_i(y)|\le d_e<1/2\). Then the same scalar block at \(y\) is \(s\ge1-d_e\), so \(y=\phi_{ia}(w)\). The vector block gives \(|sw-u|\le d_e\), hence \(|w-u|\le C_b d_e\) with \(C_b=2(1+2\rho)\).

Fix a uniform open tube radius \(r<\min\{1/4,\rho/(4C_b),1/[2L(1+2LC_b)]\}\) before choosing any reference. If a point of the tube has two nearest points on \(I_i(M_i)\), choose an inner chart at the first point. Their ambient separation is at most \(2r\), so both coordinates and their straight segment are in \(B_{3\rho/2}\). Along this segment the squared-distance Hessian for \(\frac12|F_{ia}-z|^2\), with \(z\) the ambient point, is bounded below by

\[
 (DF_{ia})^TDF_{ia}+\langle F_{ia}-z,D^2F_{ia}\rangle
               \ \,\ge I-Lr(1+2LC_b)I\ge I/2 .                    \tag{7}
\]

Here the segment length is at most \(2C_b r\) and \(|F_{ia}-z|\le r(1+2LC_b)\). Thus it has at most one critical point there. A nearest point exists by compactness and is unique. For each fixed image, compactness and uniqueness make it continuous in \(z\). The positive Hessian and the implicit function theorem then make it smooth in the open tube. This yields the uniform nearest projection neighborhoods in the common Euclidean space without comparing smooth structures of the embedded images.

Set \(C_q=4L(1+LC_b)\) and choose \(0<d_0<\min\{r/2,1/4,\rho/(16C_b),1/(2C_q)\}\), again before choosing a reference. By the chart Cauchy property choose one late index \(i_0\) such that \(\max_a\|F_{ia}-F_{i_0a}\|_{C^1(\overline B_{7\rho/4})}<d_0\) for every sufficiently large \(i\). Let \(M_{\rm ref}=M_{i_0}\), \(I_{\rm ref}=I_{i_0}\), and let \(\pi_{\rm ref}\) be its smooth nearest projection on the tube. The entire \(I_i(M_i)\) is within \(d_0\) of the reference image, as seen in each inner chart. Define the actual smooth map

\[
       P_i=I_{\rm ref}^{-1}\pi_{\rm ref}I_i:M_i\longrightarrow M_{\rm ref} .  \tag{8}
\]

In chart \(a\) write \(q_{ia}=\phi_{i_0a}^{-1}P_i\phi_{ia}\) on \(B_{3\rho/2}\). The foot lies within \(2d_0\) of \(F_{i_0a}(u)\), so \(|q_{ia}(u)-u|\le2C_b d_0\) by the reference scalar block. This keeps its coordinate inside \(B_{7\rho/4}\). Writing \(F_0=F_{i_0a}\), \(q=q_{ia}(u)\), differentiation of the foot equation gives

\[
 (DF_0(q))^T(F_0(q)-F_{ia}(u))=0,
 \qquad Dq_{ia}=H^{-1}(DF_0(q))^T DF_{ia}(u),
\]

where \(H=(DF_0)^TDF_0+\langle F_0(q)-F_{ia}(u),D^2F_0\rangle\ge I/2\). The residual is at most \(d_0\), and \(\|DF_{ia}(u)-DF_0(q)\|\le(1+2LC_b)d_0\). Subtracting \(H\) from the numerator gives \(\|Dq_{ia}-I\|\le C_qd_0<1/2\). Thus \(P_i\) is a positive local smooth diffeomorphism everywhere. If two points have the same foot, their images under \(I_i\) are at most \(2d_0\) apart. Choose an inner chart at one point. The separation estimate on \(M_i\) puts the other in that same larger convex chart, where the derivative bound gives injectivity. So \(P_i\) is globally injective. Its image is open by the local diffeomorphism property and closed by compactness. The target \(M_{\rm ref}\) is connected, so \(P_i\) is onto. This constructs the smooth orientation-preserving diffeomorphisms \(f_i=P_i^{-1}:M_{\rm ref}\to M_i\). The target argument needs neither a degree calculation nor a common differentiable type. [E168 tube and foot estimates][unscaled] · [Assessment of the global argument][metric]

For fixed \(i_0\), the maps \(q_{ia}\) converge in \(C^{3,\alpha_1}\) on smaller subballs by composition with the fixed smooth tube and reference coordinates. Their inverses \(v_{ia}=\phi_{ia}^{-1} f_i\phi_{i_0a}\) are defined on neighborhoods of \(\overline B_\rho\). For instance on \(B_{5\rho/4}\) one solves \(q_{ia}(w)=u\) by contracting \(w\mapsto u-(q_{ia}(w)-w)\) on the radius-\(\rho/8\) closed ball about \(u\) inside \(B_{3\rho/2}\). The strict displacement margin and derivative bound apply there. Local inverses agree with the global ones from (8). Uniform convergence, twice differentiating the inverse identity, and the Jacobian lower bound give strong \(C^2\) inverse convergence. Uniform third derivatives follow from the third differentiated identity. With the spare exponent this gives strong \(C^{2,\alpha}\) inverse convergence. In the fixed reference atlas the metric matrices are

\[
 (\phi_{i_0a})^*(f_i^*g_i)=(Dv_{ia})^T h_{ia}(v_{ia})Dv_{ia}.          \tag{9}
\]

The strong \(C^{1,\alpha_0}\) convergence of \(h_{ia}\), positive ellipticity, and invertible limits of the first coordinate derivatives give strong \(C^{1,\alpha}\) convergence to positive matrices. They patch on the fixed smooth reference atlas because each pullback is a tensor there. The (W^{2,8}) bound follows from the chain and product rules. Terms with second derivatives of \(h_{ia}\) are controlled by their chart \(L^8\) bounds and the uniformly bounded Jacobians for change of variables. The other terms use the uniform derivatives of \(v_{ia}\) through order three. Weak \(W^{2,8}\) subsequential convergence follows in that fixed finite atlas and has the same limit as the strong convergence. The reference is one actual smooth \(M_i\) and its atlas derives from its smooth harmonic charts. This finishes \(H_{\rm var}\) at the requested regularity.

## Fixed-base dependency ledger

| Stage | Uniform data retained on the varying sequence | Identification actually used or constructed |
| --- | --- | --- |
| E165 radius definition and near-minimum | Dimension, fixed \(p,m,\eta\), smooth completeness and compactness separately for each metric | Center \(x_i\) and rescaled coordinate charts on \(M_i\) |
| E165 pointed packing and harmonic equations | Absolute Ricci, volume, diameter, global rescaled radius floor, rescaled Weyl control | Finite labels in individual distance spaces and common Euclidean coordinate balls, with every transition within one \(M_i\) |
| E165 smooth pointed atlas and compact recovery | Persistent local chart collars, elliptic limits, orientation, finite coverage on compacts | Smooth limit \(N\) and actual based maps \(F_i:U\subset N\to M_i\) |
| E165 energy and flatness test | Each \(\chi(M_i)=2\), volume upper bound, Ricci bound, strong local pullback convergence, normalized near-minimum | Curvature compared on the pulled-back compact domains. The harmonic Dirichlet test is on one Euclidean ball reached by the \(F_i\) |
| E164/E166 end obstruction | BKN candidate hypotheses on \(N\), integral homology-sphere property of each oriented target | The same full smooth ALE core embedded into each corresponding \(M_i\), with contradiction already on one such target |
| E168 unscaled charts and cutoffs | Uniform harmonic-radius floor, volume packing, bounded diameter, smooth oriented connected inputs | Finite labeled charts and global embeddings of the \(M_i\) into one Euclidean space |
| E168 unscaled projection and limit | Uniform coordinate margins and tube bounds, compact source and connected target | One late smooth \(M_{\rm ref}\), actual positive \(P_i:M_i\to M_{\rm ref}\), and inverses \(f_i\). A fixed smooth atlas arises only after choosing this reference |

The only shared input topology used in the proof is the per-member Euler characteristic and integral homology-sphere property, with smooth closed connected orientation. The source uses retain the inspected roles. Anderson R29 gives the harmonic-coordinate framework and estimates, with the original injectivity hypothesis retained for its own compactness theorem. BKN R37 applies only to the supplied smooth Ricci-flat candidate. Wright R31 applies to the supplied smooth ASD ALE core through the already assessed topology argument. No new source or finiteness theorem entered. The bundle and dynamical implication is a separate B90 task. [Pre-ALE assessment and corrected R29 locators][prea] · [BKN assessment][ale] · [Wright/core assessment][core]

## Frozen inputs

| Input | SHA-256 |
| --- | --- |
| [E182 request][req] | `390f35777b2399a39b48a8856496067a82a0213c379c899754a3cf688cafcec0` |
| [B90][b90] | `65f096442774df5a78d99b75dc6fa23b09a0b1b28028511ece93efb56527a2d4` |
| [E168/E169 metric assessment][metric] | `6dbf39d42f980e1d04eeeba60cfad575d16e1a13a91c5ffb7531bd77ead04d1f` |
| [E168 unscaled argument][unscaled] | `110a1dfe4f288f82e93db40aace8972efe5aa02a3b61f6d96ab832e3aebda487` |
| [E165 minimum-radius argument][pre] | `3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2` |
| [E165/E167 pre-ALE assessment][prea] | `2bbdb056d7a54440eccbf09ee65511252d71daa310f129a01718670aa08c8b63` |
| [E164 ALE assessment][ale] | `926866580b9cb6b4857283ece89f6484db4d03e90a17f7018ca111f96425e566` |
| [E166 core audit assessment][core] | `385afa7dbedadc0ce7c3036ba6a4bc016474d48559b218585c2a09e857645f18` |

[req]: ../research-progress/handoffs/SP4-CME-E182_REQUEST_v1.md
[b90]: ../brainstorm/notes/B90_VARYING_BASE_COMPACTNESS_AND_UNIFORM_ENTRY_20261122.md
[metric]: ../reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[unscaled]: 168_CONDITIONAL_METRIC_COMPACTNESS_CRITERION_20261122.md
[pre]: 165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md
[prea]: ../reviews/E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md
[ale]: ../reviews/E164_RICCI_FLAT_ALE_SOURCE_ASSESSMENT_20261122.md
[core]: ../reviews/E166_ALE_CORE_AUDIT_ASSESSMENT_20261122.md
