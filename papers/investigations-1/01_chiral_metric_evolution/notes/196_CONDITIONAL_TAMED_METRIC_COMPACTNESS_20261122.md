# E196 — Conditional compactness for tamed metric twistor spaces

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B96, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored the unscaled E168 proof, its varying-base extension E182, and the conditional E191 twistor comparison. I did not author E165 or E164. The two B96 premises remain explicit, independently of the concurrent assessments.

## Supplied premises and precise metric conclusion

**\(H_{\rm twistor}\).** For smooth oriented Riemannian four-manifolds with strictly tamed positive *metric* twistor spaces, pointed \(C^1\) convergence by actual smooth orientation-preserving embeddings on compact domains to a smooth oriented locally hyperkähler limit excludes embedded holomorphic spheres on its hyperkähler universal cover. The cover's hyperkähler orientation is the lifted orientation. The conclusion is for any sphere complex structure of that parallel triple. This is the E191 conclusion. E190/E192 separately assessed its fixed-sphere persistence input at the stated regularity and bounded-right-inverse hypotheses. The full twistor comparison remains an explicit premise here. [E191][twistor] · [Persistence assessment][pers]

**\(H_{\rm ALEsphere}\).** Every smooth complete connected nonflat Ricci-flat ASD ALE four-manifold, with \(W^+=0\) in the chosen orientation, has an embedded holomorphic sphere in its positively oriented hyperkähler universal cover for some member of the hyperkähler triple. This is the exact separate B96 premise. Any proof via the Kronheimer classification and the exceptional spheres is a separately assessed dependency. No such classification theorem is imported here. [B96][b96]

Fix finite constants \(K,K_+\ge0\), \(D>0\), \(\chi_0\in\mathbb R\) and \(v>0\). Consider a sequence of smooth closed connected oriented Riemannian four-manifolds \((M_i,g_i)\), with possibly varying smooth types, satisfying

\[
 \begin{gathered}
 |\operatorname{Ric}_{g_i}|_{g_i}\le K,\qquad |W^+_{g_i}|_{\rm op,HS}\le K_+,\qquad
 \operatorname{Vol}(M_i,g_i)\ge v,\\
 \operatorname{diam}(M_i,g_i)\le D,\qquad \chi(M_i)\le\chi_0 .      \tag{1}
 \end{gathered}
\]

Supply strictly tamed metric twistor spaces on their positive chiral bundles, in the sense of Fine's metric curvature inequality or direct taming by the normalized metric Reznikov forms. The Ricci norm is the absolute Hilbert–Schmidt tensor norm and \(W^+\) is the Hilbert–Schmidt endomorphism norm on ordinary self-dual two-forms, in the chosen orientation. In full component tensor norm the positive Weyl block has twice that norm. Full curvature energy uses the full \((0,4)\) Riemann tensor norm. The hypotheses concern positive Riemannian metrics and their Levi–Civita connections, in the original scales of (1).

Under \(H_{\rm twistor}\) and \(H_{\rm ALEsphere}\), there is a subsequence and one fixed smooth oriented reference \(M_{\rm ref}\), chosen as one late member, with smooth orientation-preserving diffeomorphisms \(f_i:M_{\rm ref}\to M_i\). The metrics \(f_i^*g_i\) converge strongly in \(C^{1,1/4}\) to a positive metric in a fixed smooth atlas, and after a further subsequence converge weakly in \(W^{2,8}\) to that same metric. For the class with these fixed bounds there are finitely many oriented diffeomorphism types. This is a conditional metric compactness statement.

## Volume and energy inputs for minimum-radius extraction

Take one \(D'>D\), put \(\kappa=K/3\), and let \(\mathcal V_{-\kappa}\) denote the four-dimensional simply connected model ball volume of sectional curvature \(-\kappa\), with \(\omega_4\) the Euclidean unit ball volume. The Hilbert–Schmidt Ricci bound gives \(\operatorname{Ric}_{g_i}\ge -K g_i=-3\kappa g_i\). Since \(B_{g_i}(y,D')=M_i\) for each \(y\), Bishop–Gromov comparison and the small-ball ratio give

\[
 \operatorname{Vol}(M_i,g_i)\le\mathcal V_{-\kappa}(D'),\qquad
 \operatorname{Vol}_{g_i}B_{g_i}(y,\ell)
       \ge \frac{v\,\mathcal V_{-\kappa}(\ell)}{\mathcal V_{-\kappa}(D')}
       \ge c\ell^4,\quad c=\frac{v\omega_4}{\mathcal V_{-\kappa}(D')},
       \quad 0<\ell\le D'.                                        \tag{2}
\]

The full-tensor Chern–Gauss–Bonnet identity on each smooth closed four-manifold gives

\[
 \begin{aligned}
 \int_{M_i}|\operatorname{Rm}_{g_i}|^2\,dV_{g_i}
   &=32\pi^2\chi(M_i)+\int_{M_i}\bigl(4|\operatorname{Ric}_{g_i}|^2-s_{g_i}^2\bigr)\,dV_{g_i}\\
   &\le 32\pi^2\chi_0+4K^2\mathcal V_{-\kappa}(D')=:C_E .          \tag{3}
 \end{aligned}
\]

The sum in (3) uses the full \((0,4)\) norm, with coefficient \(32\pi^2\), rather than the curvature-operator Hilbert–Schmidt norm. The full energy is unchanged by constant metric scaling in dimension four. If \(C_E<0\), there are no members by the nonnegative left side. In every nonempty case one may use \(\max(1,C_E)\) as a positive bound. Equations (2)–(3) replace the use of \(\chi(M_i)=2\) in the extraction. They use no lower Euler bound or common smooth structure. [Pre-ALE assessment][prea] · [Varying-base assessment][vary]

Use exactly the E165 harmonic-radius criterion with \(p=8\), \(m=2\), and \(\eta=1\) as in E182. In a centered smooth harmonic chart on the intrinsic ball of radius \(r\), require \(m^{-1}I\le h\le mI\) and \(r^{1-4/p}\|Dh\|_p+r^{2-4/p}\|D^2h\|_p\le\eta\) in coordinate Lebesgue measure. Take the supremum of admissible radii. Smoothness and compactness of each individual \(M_i\) give a positive infimum for each metric, by local normalization, restriction, and a finite cover. Suppose a subsequence has infima \(r_i\to0\). Choose approximate minimizing centers \(x_i\) of radius at most \((1+i^{-1})r_i\). Rescale by \(\bar g_i=r_i^{-2}g_i\), making the radius at least one everywhere and at most \(1+i^{-1}\) at \(x_i\). The Ricci and Weyl-block norms now satisfy

\[
 |\operatorname{Ric}_{\bar g_i}|\le Kr_i^2,\qquad
 |W^+_{\bar g_i}|_{\rm op,HS}\le K_+r_i^2 .                          \tag{4}
\]

The pointwise Hodge splitting on two-forms is invariant under the positive constant scaling. In these rescaled metrics (2) gives

\[
 c t^4\le \operatorname{Vol}_{\bar g_i} B_{\bar g_i}(y,t)
                \le\mathcal V_{-\kappa r_i^2}(t)
       \qquad(r_i t\le D') .                                     \tag{5}
\]

Here the upper bound actually holds at all radii. The cutoff \(r_i t\le D'\) is enough for any fixed-radius pointed argument. Formula (5) supplies uniform packing bounds on fixed pointed balls in each individual \(M_i\), by disjoint small-ball lower volumes and a larger-ball upper volume. It also supplies the limit's positive Euclidean volume growth after the actual compact comparisons below. [E165][pre] · [E165/E167 assessed estimates][prea]

## Exactly which parts of the pre-ALE argument transfer

The fixed-type wording of E165/E167 is not invoked as a theorem with a deleted premise. The analytic construction is the one checked for varying targets in E182/E185. Its uniform inputs are (3)–(5), dimension and the rescaled harmonic-radius floor. The checks for replacing the ambient topology are as follows.

1. **Pointed metric space and collars.** Finite nets on successively larger balls with the estimates (5), followed by a diagonal subsequence of their distance arrays, give a proper geodesic pointed distance limit \((N,d,x_\infty)\). Pointed approximations use labels and distances separately in the respective \(M_i\). In the rescaled harmonic coordinates of intrinsic radius \(a_0=1/2\), choose \(\rho>0\) with \(16\sqrt m\rho<a_0\). The fixed Euclidean chart balls \(B_{4\rho}\) have uniformly bi-Lipschitz distance comparison and uniform interior margins because short geodesics between their points stay in the full intrinsic chart. An ambient ball of radius \((b'-b)/(2\sqrt m)\) about a point with coordinate norm at most \(b\), \(0<b<b'<4\rho\), stays in the coordinates of radius \(b'\). Metric approximations, compact coordinate closures and these margins yield limit charts and persistent overlaps from a countable set of comparison centers. A transition \(\phi_{ib}^{-1}\phi_{ia}\) always has both charts on the same \(M_i\). Neither the pointed space nor a reference smooth structure is supplied in advance.
2. **Smooth limit and strong local convergence.** The chart arrays are uniformly \(W^{2,8}\) and positive, hence subsequentially strong \(C^{1,\alpha}\), \(0<\alpha<1/2\). The harmonic Ricci equation is a uniformly elliptic nondivergence equation with principal coefficient \(h_i^{-1}\) and a smooth quadratic first-jet term. Its Ricci right side tends to zero by (4). The weak \(W^{2,8}\) equation and elliptic bootstrapping give smooth Ricci-flat limit arrays. Subtract the limit equation using \(h_i^{-1}\) as leading coefficient. Its right side tends to zero in \(L^8\) by first-jet convergence, the Ricci bound and the vanishing coefficient difference against the smooth limiting Hessian. An interior estimate gives strong \(W^{2,8}\) chart convergence. The transition components are harmonic. The difference equation and one differentiated interior estimate give strong local \(W^{3,8}\) and \(C^2\) convergence of transitions, preserving orientation by their positively oriented approximants and invertible smooth limits. The short-geodesic margins identify the local distance of the smooth glued metric with \(d\). Its global length distance is \(d\) because the latter is geodesic. Thus the limit \((N,h)\) is complete, connected, smooth and oriented.
3. **Actual comparison maps and whole-ball coverage.** On a neighborhood of each fixed compact limit region take finitely many cutoff-coordinate blocks \((\zeta_a,\zeta_a u_a)\), positive for some \(a\) at each point. They embed that part of the smooth limit in a finite Euclidean space. Use the same blocks on the approximating charts in the individual \(M_i\), with \(W^{3,8}\) and \(C^2\) convergence in the chart representations. The projection is to a tube of the *smooth pointed limit* near that compact region. Compose the approximating cutoff maps with its tube projection and inverse embedding to get local maps from parts of \(M_i\) to \(N\). Their representations are close to the identity in \(C^2\) and \(W^{3,8}\). The inverses exist on smaller concentric balls and agree on overlaps, since conflicting candidates project to nearby metric points in one larger approximating chart, where the near-identity derivative gives injectivity. This gives smooth orientation-preserving embeddings \(F_i:U_L\to M_i\) for a neighborhood \(U_L\) of each fixed compact set \(L\subset N\). The assessed small compactly supported domain translation makes \(F_i(x_\infty)=x_i\) where needed. Derivatives of the inverse coordinates through order three, bounded inverse Jacobians, and the tensor pullback formula give strong local \(W^{2,8}\) and \(C^{1,\alpha}\) convergence of \(F_i^*\bar g_i\) to \(h\). The same metric approximations and local inverses put \(B_{\bar g_i}(F_i(y),t-\epsilon)\) inside \(F_i(B_h(y,t))\) and that image inside \(B_{\bar g_i}(F_i(y),t+\epsilon)\), for any fixed ball and small fixed \(\epsilon>0\), after covering a sufficiently large compact neighborhood. Distance spheres of smooth complete \(h\) are null in volume since they are contained in the exponential image of tangent spheres. Volume convergence and (5) therefore give \(\operatorname{Vol}_h B_h(y,t)\ge ct^4\) at every center and every \(t>0\), not merely a bound on selected chart balls.
4. **Curvature, energy and the radius-two test.** Strong local \(W^{2,8}\) and \(C^1\) metric convergence give strong local curvature convergence in \(L^8\). The positive maps preserve the vanishing-chiral-block conclusion \(W_h^+=0\) from (4). Exhaustion and the embedded compact pullbacks bound the full curvature energy of \(h\) by (3), with no multiplicity issue because the maps are embeddings. The flat alternative in E165 depends only on the established geometry. For a complete flat limit any nontrivial free Euclidean deck motion has a nonzero translation along its fixed linear subspace, so its cyclic intermediate quotient has cubic upper volume growth in a fundamental slab. This contradicts the lower quartic bound on the limit. The only flat candidate is therefore Euclidean. In that case the based compact pullbacks are strong \(W^{2,8}\)-close to the Euclidean metric on the radius-four ball. The harmonic coordinate Dirichlet solve with Euclidean boundary coordinate values gives corrections small in \(W^{3,8}\) on a radius-three ball, using the interior differentiated estimate in E165. These are genuine smooth coordinates by the derivative estimate and convexity. The ball inclusions in step 3 cover the whole intrinsic radius-two ball about \(x_i\), where the harmonic matrices satisfy the fixed distortion and weighted derivative requirements strictly. This contradicts its rescaled radius at most \(1+i^{-1}\). No continuity of harmonic radius enters. The candidate is nonflat.

All analytic steps here concern the uniform chart and metric data, and the only Euler input was (3). The integral homology-sphere assumption was used later in E182 to forbid an embedded full core, not in any of these analytic steps. That conclusion is replaced below. In particular E196 invokes neither the integral homology calculation nor smooth or topological finiteness in constructing these compact maps. [E165 analytic and flatness steps][pre] · [Independent pre-ALE assessment][prea] · [E182 varying domains][varyproof] · [E182/E185 assessment][vary]

## Taming, hyperkähler orientation and the contradiction

The smooth complete nonflat Ricci-flat four-dimensional \((N,h)\) just constructed has positive Euclidean growth and finite *full* curvature \(L^2\) energy. The checked Bando–Kasue–Nakajima Theorem (1.5) and Remark (1.8)(1) give one smooth ALE end of order four with the indicated all-order decay. Theorem (1.5) applies to this supplied candidate, with a lower volume bound at one center for all radii and finite curvature energy. The smooth quotient-end chart has group in \(SO(4)\) for the oriented candidate. Its derivative decay meets the ALE definition needed for \(H_{\rm ALEsphere}\). This uses the checked published-scan passages in E164, pp. 313–315 and proof conclusion p. 335. The different Einstein-sequence theorem (5.5) supplies no extraction used here. [BKN source assessment][ale] · [Canonical R37][r37]

By (4) and the oriented comparison, \(\operatorname{Ric}_h=0\) and \(W_h^+=0\). Consequently the metric positive-chiral connection is flat. In the ordinary Hodge decomposition its curvature is determined by \(\mathsf A=W^++(s/12)I\) and the off-diagonal traceless-Ricci block \(B\). Both vanish. On the universal cover, with the lifted orientation, parallel transport of one positive orthonormal frame of \(\Lambda_h^+\) gives a global parallel frame. With the ordinary two-form norm convention, multiplying the frame by \(\sqrt2\) gives the fundamental forms of the corresponding orthogonal complex structures. Choose the initial quaternionic frame in the natural orientation so that these satisfy the quaternionic identities. The parallel structures are integrable by torsion-freeness and are Kähler for the lifted metric. Thus the orientation of this hyperkähler triple agrees with the positive chirality used in \(H_{\rm twistor}\) and \(H_{\rm ALEsphere}\).

Taming of the prelimit metric twistor structures passes to \(\bar g_i\) at the same sign. For Fine's curvature formulation,

\[
       |\langle\mathsf A\theta,\theta\rangle|>|B\theta|\,|\theta|
                  \qquad(0\ne\theta\in\Lambda^+) .                  \tag{6}
\]

Under the pointwise orthonormal identifications at a constant positive rescaling \(g'=b^2g\), both curvature blocks are multiplied by \(b^{-2}\). Thus (6) and \(\operatorname{sign}\det\mathsf A\) are unchanged, in particular for \(b=r_i^{-1}\). The normalized sphere map at such a rescaling is \(\alpha\mapsto b^2\alpha\) from unit two-forms for \(g\) to unit forms for \(g'\). It is a positive isometry on the corresponding metric fibers, preserves the identified tangent complex structure, and intertwines the chiral connections because the Levi–Civita connection is unchanged by constant scaling. Hence it intertwines the horizontal splittings and the projected vertical connections defining the Reznikov forms. This also proves scale invariance if taming is supplied directly for one canonical structure. Each connected pointed prelimit has a sign, and a subsequence fixes one sign. The hypothesis remains supplied strict taming, not a bound on its strength uniform over the sequence. [E191 twistor conventions and metric comparison][twistor] · [Canonical R38][r38]

The smooth comparison embeddings \(F_i\) in step 3 supply exactly the pointed \(C^1\) hypothesis of \(H_{\rm twistor}\) on every compact domain after scaling, including the compact set needed over a proposed sphere. On a comparison domain \(F_i\) is an orientation-preserving isometry from its smooth pullback metric to its image, so the corresponding metric twistor taming is valid there by naturality. The conclusion of \(H_{\rm twistor}\) excludes embedded holomorphic spheres in the positively oriented hyperkähler cover of \(N\). The supplied \(H_{\rm ALEsphere}\) for this nonflat smooth ASD Ricci-flat ALE candidate provides one. This is the contradiction to \(r_i\to0\). It replaces the full-core homology obstruction. In particular no compact region has to embed in a homology sphere for this contradiction. Therefore the infima of the unscaled harmonic radii have a common positive lower bound \(r_*\). The same argument excludes arbitrarily small infima over the class with these fixed bounds by selecting a vanishing-infimum sequence. No numerical floor is asserted. [B96][b96] · [E191][twistor]

## Inter-base diffeomorphisms from the unscaled radius floor

The global argument uses the assessed E182/E185 construction. Here the needed inputs are compactness and connectedness of the individual manifolds, the volume packing of (2), bounded diameter, and \(r_*>0\). None is a specified common topology. For clarity the exact comparison maps and the quantifier order are as follows.

First take \(a_0=r_*/2\) and \(16\sqrt m\rho<a_0\) in the unscaled metrics. Global finite nets from (2) and bounded diameter give a compact distance limit and metric approximations. Choose a finite \(\rho/(16\sqrt m)\)-net on that space and nearby centers on each \(M_i\). For large \(i\), every source point is within \(\rho/(2\sqrt m)\) of one selected center. Accordingly the inner \(B_\rho\) images of the harmonic charts \(\phi_{ia}:B_{4\rho}\to M_i\) cover every late \(M_i\). Positively oriented charts and the uniform collars again give persistent overlaps. The chart coefficients \(h_{ia}=\phi_{ia}^*g_i\) are uniformly \(W^{2,8}\) and converge strongly locally in \(C^{1,\alpha_0}\) with \(\alpha_0=5/12\). Each transition solves a harmonic equation with uniform \(C^{1,\alpha_0}\) coefficients. Interior Schauder bounds and their differentiated version give local \(C^{3,\alpha_0}\) bounds and strong convergence at \(\alpha_1=1/3\) in that order. No use is made of an unscaled Einstein equation or smoothness of the distance limit.

Use finitely many cutoffs \(\zeta_a=1\) on \(B_{2\rho}\), supported strictly in \(B_{3\rho}\), and set \(I_i:M_i\to\mathbb R^{5A}\) from the blocks \((\zeta_a,\zeta_a u_a)\), extended by zero outside the charts. Here \(A\) is the number of charts. The scalar and vector blocks recover the coordinate near each point of an inner chart, giving a global smooth embedding. In chart \(a\), \(F_{ia}=I_i\phi_{ia}\) converge in \(C^{3,\alpha_1}\) on \(\overline B_{7\rho/4}\) by the transition estimates and the closed support margins. Choose a common first- and second-derivative bound \(L\ge1\). The coordinate block indexed by \(a\) implies \((DF_{ia})^TDF_{ia}\ge I\) on that ball. The positive scalar block at the other point gives the separation estimate \(|u-w|\le C_b d_e\), with \(C_b=2(1+2\rho)\), when \(|u|\le3\rho/2\) and the ambient images of \(\phi_{ia}(u)\) and the other point are at distance \(d_e<1/2\). In fact the other point must be in chart \(a\) with cutoff scalar \(s\ge1-d_e\), and the vector block gives \(|sw-u|\le d_e\).

Fix the uniform tube before any reference index. Take \(r<\min\{1/4,\rho/(4C_b),[2L(1+2LC_b)]^{-1}\}\). If two nearest points to an ambient point lie within distance \(r\), choose the first in an inner chart. The separation estimate bounds their coordinate distance by \(2C_b r<\rho/2\), so their straight segment lies in \(B_{3\rho/2}\). The squared-distance Hessian there is at least \(I-Lr(1+2LC_b)I\ge I/2\), by the derivative and segment bounds. Two critical points are impossible. Compactness gives existence of the nearest point and continuity when it is unique. The Hessian and the implicit function theorem give smooth projection in this tube.

Put \(C_q=4L(1+LC_b)\). Choose \(0<d_0<\min\{r/2,1/4,\rho/(16C_b),1/(2C_q)\}\) before choosing a reference. The chart convergence is Cauchy in \(C^1\), so take one smooth late member \(M_{\rm ref}=M_{i_0}\) for which \(\max_a\|F_{ia}-F_{i_0a}\|_{C^1(\overline B_{7\rho/4})}<d_0\) for all sufficiently large \(i\). Let \(\pi_{\rm ref}\) be the smooth nearest projection onto \(I_{i_0}(M_{i_0})\). The inner charts show the whole image of \(I_i\) is in its tube. Define

\[
        P_i=I_{i_0}^{-1}\pi_{\rm ref} I_i:M_i\longrightarrow M_{\rm ref}. \tag{7}
\]

In corresponding charts, \(q_{ia}=\phi_{i_0a}^{-1}P_i\phi_{ia}\) is defined on \(B_{3\rho/2}\) and satisfies \(|q_{ia}-u|\le2C_b d_0\). The coordinate of the nearest point thus lies in \(B_{7\rho/4}\). With \(F_0=F_{i_0a}\), \(q=q_{ia}(u)\), its equation is \((DF_0(q))^T(F_0(q)-F_{ia}(u))=0\). Differentiating yields \(Dq=H^{-1}(DF_0(q))^TDF_{ia}(u)\), with Hessian \(H\ge I/2\). The residual \(|F_0(q)-F_{ia}(u)|\le d_0\), together with \(\|DF_{ia}(u)-DF_0(q)\|\le(1+2LC_b)d_0\), gives \(\|Dq-I\|\le C_q d_0<1/2\). Thus \(P_i\) is a local diffeomorphism of positive orientation. Two source points with the same foot have image distance at most \(2d_0\). They belong to one larger convex chart on that same \(M_i\) by separation, where the derivative estimate proves injectivity. The global image is open and compact, hence equals the connected \(M_{\rm ref}\). Therefore \(f_i=P_i^{-1}\) are actual smooth orientation-preserving diffeomorphisms in the required direction.

After fixing \(i_0\), the fixed smooth projection and inverse reference charts give local \(C^{3,\alpha_1}\) convergence of \(q_{ia}\) on smaller subballs. The strict displacement and derivative margins give their inverse branches \(v_{ia}=\phi_{ia}^{-1} f_i\phi_{i_0a}\) on a neighborhood of \(\overline B_\rho\), by contraction on balls strictly inside \(B_{3\rho/2}\). These are the global inverses there. The first two inverse differentiation formulas give strong \(C^2\) convergence, and the third gives uniform third derivatives. Interpolation then gives strong \(C^{2,1/4}\) convergence. The exact metric pullback in the reference charts is

\[
       (\phi_{i_0a})^*(f_i^*g_i)=(Dv_{ia})^T h_{ia}(v_{ia})Dv_{ia}.   \tag{8}
\]

The strong \(C^{1,5/12}\) convergence of \(h_{ia}\) and the inverse map estimates give strong \(C^{1,1/4}\) convergence. The limit is positive by chart ellipticity and invertibility of the limit inverse derivatives. The \(W^{2,8}\) norm is uniformly bounded in the fixed smooth reference charts because the chain and product rules use at most three inverse-coordinate derivatives, uniform change-of-variable Jacobians, and the second derivatives of \(h_{ia}\) in \(L^8\). Weak subsequential compactness in that fixed finite atlas gives the same limit by strong convergence. This supplies exactly (7)–(8) without any prior common smooth type or smoothness assertion for the limiting unscaled metric. [Varying-domain construction][varyproof] · [E185 assessment][vary]

## Consequence, scope and provenance

For one set of bounds in (1), infinitely many oriented diffeomorphism types would supply a sequence of representatives of pairwise different oriented types. The sequential conclusion just proved makes every member of the extracted tail orientation-preservingly diffeomorphic to one late reference, a contradiction. This yields the conditional finiteness statement by the comparison maps themselves.

The proof uses the same local metric construction as the earlier assessed compactness result, with the Euler upper bound at the energy step and the explicit twistor/ALE-sphere contradiction in place of the full-core topology. Taming remains a hypothesis of the metric Levi–Civita geometry. The theorem supplies no native connection positivity, flow continuation for general bases, smooth unscaled convergence, or new assertion about metric orbifold extraction. Both \(H_{\rm twistor}\) and \(H_{\rm ALEsphere}\) remain conditional in this artifact. Canonical R29's harmonic-coordinate method retains its original theorem hypotheses. R37 supplies only the checked smooth candidate's ALE end. R38 supplies the inspected source geometry and its own distinct \(C^2\) theorem with taming. E191's \(C^1\) assertion is the explicit premise, not attributed to Fine. No primary source was reopened for E196. [B96][b96] · [Exact pre-ALE locators][prea] · [Canonical R37][r37] · [Canonical R38][r38]

| Input | SHA-256 |
| --- | --- |
| [E196 request][req] | `81f2d106e8addf774ed7f306f467da974fe2d05e59164904765713f0d865b6df` |
| [B96][b96] | `504953dd99e8c85c4c40720ba39a308b4322b5b9c6b67f301d8fabe4b231610e` |
| [E191][twistor] | `e2426b287fcf7d85381948bdf404aa5563c82f0b408f32da170de9a24cbf22fa` |
| [E190/E192 persistence assessment][pers] | `cb7c27443cb70b5b1b6345c67e419c1b3e6bc0d8f25354bf6d5addf3b64eb871` |
| [E165/E167 pre-ALE assessment][prea] | `2bbdb056d7a54440eccbf09ee65511252d71daa310f129a01718670aa08c8b63` |
| [E164 ALE assessment][ale] | `926866580b9cb6b4857283ece89f6484db4d03e90a17f7018ca111f96425e566` |
| [E182/E185 assessment][vary] | `0f55dfd759e5dfd1f86e69cc7bd201688de0a2cf5e2bd9ce68414f9ffe96761f` |
| [E165 analytic proof, transitive input][pre] | `3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2` |
| [E182 varying-base proof, transitive input][varyproof] | `dc63807bccadbd2d089cfb95c962d3f4f0ec5342272f3d4ede6e97e8af0c717e` |

[req]: ../research-progress/handoffs/SP4-CME-E196_REQUEST_v1.md
[b96]: ../brainstorm/notes/B96_TAMED_METRIC_COMPACTNESS_20261122.md
[twistor]: 191_CONDITIONAL_C1_TWISTOR_LIMIT_20261122.md
[pers]: ../reviews/E190_E192_C0_PERSISTENCE_ASSESSMENT_20261122.md
[prea]: ../reviews/E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md
[ale]: ../reviews/E164_RICCI_FLAT_ALE_SOURCE_ASSESSMENT_20261122.md
[vary]: ../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md
[pre]: 165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md
[varyproof]: 182_VARYING_BASE_METRIC_COMPACTNESS_20261122.md
[r37]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r37-selected-theorem-upgrade--e164
[r38]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r38--fine-twistor-limit-comparison
