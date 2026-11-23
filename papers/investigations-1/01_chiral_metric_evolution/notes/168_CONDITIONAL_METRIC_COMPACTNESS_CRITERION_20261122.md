# E168 — Conditional compactness from harmonic radius and flow continuation

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B85, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored E159 and its inherited E09 transport estimate, audited the E159 manuscript integration in E161, and audited the supplied-core obstruction in E166. I did not author E165. Its conclusion remains an explicit premise in this packet.

## Exact premise and static conclusion

Fix a smooth closed connected oriented homotopy four-sphere \(M\). Consider smooth Riemannian metrics \(g_i\) on this same smooth base satisfying, for constants \(K,K_+<\infty\), \(v>0\), and \(D<\infty\),

\[
 |\operatorname{Ric}_{g_i}|_{g_i}\le K,\qquad
 |W^+_{g_i}|_{\mathrm{op,HS}}\le K_+,\qquad
 \operatorname{Vol}(M,g_i)\ge v,\qquad
 \operatorname{diam}(M,g_i)\le D .                                      \tag{1}
\]

The plus block uses the fixed orientation and the E159 Hilbert–Schmidt norm of the endomorphism of \(\Lambda^+\) with its ordinary two-form pairing. If using the full \((0,4)\) Weyl tensor convention, the norm of the plus component is twice this number. For harmonic coordinates fix \(p=8\), \(m=2\), \(\eta=1\) in E165's admissibility (1). This means a harmonic chart on the metric ball of radius \(r\), centered at its center, with \(m^{-1}I\le h\le mI\) and \(r^{1-4/p}\|Dh\|_{L^p}+r^{2-4/p}\|D^2h\|_{L^p}\le\eta\) in coordinate Lebesgue measure. Use the supremum over admissible radii. Fix \(\alpha=1/4<1-4/p\) for the unscaled metric conclusion.

**Premise \(H_{\rm pre}\).** Assume exactly the extraction conclusion in the frozen E165 note for (1) and its stated harmonic-radius convention. If \(r_i=\inf_M r_h(g_i,\cdot)\to0\) and \(r_h(g_i,x_i)\le(1+i^{-1})r_i\), a subsequence of the pointed rescalings \((M,r_i^{-2}g_i,x_i)\) has a connected complete smooth nonflat Ricci-flat ASD Riemannian limit \((N,h,x_\infty)\). There are smooth based orientation-preserving comparison embeddings on open neighborhoods of every fixed compact subset of \(N\), with pullback convergence there in strong \(W^{2,p}\) and \(C^{1,\beta}\) for each \(0<\beta<1-4/p\). There is a uniform \(c>0\) with \(\operatorname{Vol}_h B_h(y,t)\ge ct^4\) for each \(y\in N\), \(t>0\), and \(\int_N|\operatorname{Rm}_h|^2\,dV_h<\infty\). This is the frozen unassessed E165 extraction at dispatch. [E165][pre]

**Conditional static conclusion.** Under \(H_{\rm pre}\), every sequence (1) has a subsequence and smooth orientation-preserving diffeomorphisms \(f_i:M\to M\) for which \(f_i^*g_i\) converges strongly in \(C^{1,\alpha}\) to a positive metric on the fixed smooth \(M\). The sequence is bounded and, after a further subsequence, weakly convergent in \(W^{2,p}\) in a fixed smooth atlas. Strong \(C^1\) is sufficient for the application.

### Contradiction to vanishing minimum radius

If the infima have a subsequence tending to zero, relabel it and choose approximate minimizing centers as in \(H_{\rm pre}\). The smooth complete candidate of that premise has all inputs to Bando–Kasue–Nakajima Theorem (1.5) in dimension four. Its lower volume bound is valid at the fixed point \(x_\infty\) for every radius, and the curvature integral is the full tensor's finite \(L^2\) integral. Theorem (1.5) gives one ALE end of order four, and Remark (1.8)(1) gives the decay of every metric derivative in the same chart. In the oriented case the finite quotient group acts freely on \(S^3\) and lies in \(SO(4)\). Thus this is a smooth end of the type required by the E162 obstruction. The source concerns this supplied Ricci-flat candidate. It is not the source of the limiting embeddings. [E164 source check][bkn] · [BKN published scan, pp. 313–315 and 335][bknpdf]

Choose a single sufficiently large smooth radial truncation \(K_N\subset N\) in that end chart. Its whole exterior is a product on the spherical quotient. The comparison embedding supplied for a neighborhood of \(K_N\) by \(H_{\rm pre}\) restricts to an orientation-preserving smooth embedding of the full truncation into the underlying smooth \(M\). The constant rescaling does not change the target smooth structure. The ambient homotopy sphere is a closed oriented integral homology sphere, so the assessed E162 result rules out the embedding. The argument excludes any subsequence with infima tending to zero. In particular there is a positive common radius lower bound on the sequence under consideration. The complementary compactness step below only uses this lower bound together with the Ricci, volume and diameter bounds. [E162 assessment][core]

## Unscaled compactness with a harmonic-radius floor

### Finite chart construction

Suppose \(r_h(g_i,x)\ge r_*>0\) for all \(i,x\). Put \(a_0=r_*/2\) and fix a positive \(\rho\) with \(16\sqrt m\,\rho<a_0\). Every center has a chart on its intrinsic \(a_0\)-ball by restriction from a radius greater than \(a_0\). Its image contains the Euclidean ball of radius \(a_0/\sqrt m\). Indeed, a radial segment starting at the center and shorter than that radius lifts to length less than \(a_0\). A first failure to continue would converge, by completeness, to a point inside the original chart. Reflect one coordinate if needed to make all charts positive. Write \(\phi_{ia}:B_{4\rho}\to (M,g_i)\) for the parametrizations at centers specified below. Their Euclidean domains are fixed. Their coefficient matrices \(h_{ia}=\phi_{ia}^*g_i\) are uniformly positive and bounded in \(W^{2,p}\).

On \(B_{4\rho}\) these maps are bi-Lipschitz for the ambient distances with factors \(\sqrt m\) and \(1/\sqrt m\). The upper bound is from the straight segment. A minimizing geodesic has length at most \(8\sqrt m\,\rho\), and its first point lies within \(4\sqrt m\,\rho\) of the center, so it stays in the full \(a_0\)-ball. The lower bound follows from the coordinate displacement of that path. In addition, for \(0<b<B\le4\rho\), the ambient ball of radius \((B-b)/(2\sqrt m)\) at \(\phi_{ia}(u)\), \(|u|\le b\), lies in \(\phi_{ia}(B_B)\). A shortest path of that length stays in the full harmonic chart by the same radius calculation, and its coordinate displacement is less than \((B-b)/2\). At the center the same argument shows that the ambient ball of radius \(\rho/(2\sqrt m)\) lies in \(\phi_{ia}(B_\rho)\).

There is a compact distance limit \(Y\) with approximations \(e_i:(M,d_{g_i})\to Y\) whose distance distortion and image-density errors tend to zero. Here only metric-space compactness is needed, and it follows directly from finite nets. For \(D'>D\) and \(\kappa=K/3\), Bishop–Gromov gives the upper total volume \(\mathcal V_{-\kappa}(D')\) and the lower bound \(v\mathcal V_{-\kappa}(s)/\mathcal V_{-\kappa}(D')\) for every ball of fixed radius \(0<s\le D'\). The notation \(\mathcal V\) denotes the four-dimensional constant curvature model volume. A separated net at each dyadic mesh has bounded cardinality by the disjoint smaller balls. Pad the net lists to constant finite lengths and diagonalize the distances between all net labels. The limiting pseudometric, after identifying zero distances and completing, gives \(Y\). Each list at its fixed mesh is a net for every limiting label by the finite minimum property, hence for the completion. Thus \(Y\) is compact. Matching the nearest points in a slowly increasing sequence of those lists to their limiting labels gives the maps \(e_i\), with errors bounded by the mesh and the finite-list distance errors. No differentiability of \(e_i\) is used.

Choose finitely many centers \(y_a\) forming a \(\rho/(16\sqrt m)\)-net in \(Y\), and \(q_{ia}\) with \(e_i(q_{ia})\to y_a\). For large \(i\), every point of \(M\) has ambient distance less than \(\rho/(2\sqrt m)\) to one \(q_{ia}\). Hence the inner \(B_\rho\) charts cover the entire manifold. Extraction on countably many coordinate points and the uniform bi-Lipschitz estimates give uniform limits \(\phi_a=\lim_i e_i\phi_{ia}\) on compact coordinate subballs. The same estimates make each \(\phi_a\) a bi-Lipschitz map onto its image. The interior-ball property passes to the limit: approximate any nearby \(Y\)-point by points in the approximants, use the ambient distance margin to put them in the fixed larger coordinate ball, and pass through a convergent coordinate subsequence. In particular the limit charts are open, and their inner images cover \(Y\). The proof that follows uses these charts to compare the embeddings and metric matrices. It does not identify \(Y\) with a smooth reference manifold.

### Transitions and coefficient bounds

Let \(\alpha_0=5/12\) and \(\alpha_1=1/3\), so \(\alpha<\alpha_1<\alpha_0<1-4/p\). Rellich–Morrey compactness gives \(h_{ia}\to h_a\) strongly in \(C^{1,\alpha_0}\) on compact chart subballs, with uniform local \(W^{2,p}\) control. The limit matrices retain their positivity. On any relatively compact coordinate subset of an overlap with limiting image strictly inside the other chart, the maps \(\theta_{i,ab}=\phi_{ib}^{-1}\phi_{ia}\) are defined for all large \(i\). Indeed, the limit point in the second chart has coordinates in a compact interior set, and the distance between the corresponding two approximating chart points tends uniformly to zero. The interior-ball estimate for the second chart gives the asserted domain. The same bi-Lipschitz estimate gives uniform convergence to \(\phi_b^{-1}\phi_a\) there.

Each component of \(\theta_{i,ab}\) is harmonic in the first chart and solves \(h_{ia}^{jk}\partial_j\partial_k\theta_{i,ab}=0\), with \((h_{ia}^{jk})=h_{ia}^{-1}\). The coefficients are uniformly elliptic and bounded in \(C^{1,\alpha_0}\). Uniform \(C^0\) bounds and an interior Schauder estimate give \(C^{2,\alpha_0}\) bounds on smaller overlaps. Differentiating once gives, for each coordinate derivative of the transition, an equation with right side \(-\partial_\ell h_{ia}^{jk}\partial_j\partial_k\theta_{i,ab}\) bounded in \(C^{\alpha_0}\). A further interior estimate gives \(C^{3,\alpha_0}\) bounds on still smaller overlaps. By compact Hölder embedding and the already identified uniform limits, the transitions converge locally in \(C^{3,\alpha_1}\). This uses the harmonic equations for the coordinate functions. It uses no convergence of Ricci tensors or Einstein equation for the unscaled limit.

### Euclidean embeddings and a uniform projection neighborhood

Choose smooth nonnegative cutoff functions \(\zeta_a\) on \(B_{4\rho}\), equal to one on \(B_{2\rho}\), compactly supported in \(B_{3\rho}\). Define

\[
 I_i(x)=\bigl((\zeta_a,\zeta_a u_a)(\phi_{ia}^{-1}(x))\bigr)_a
     \in\mathbb R^{5A},                                               \tag{2}
\]

with each block extended by zero outside its chart and \(A\) the number of charts. Each \(I_i\) is a smooth embedding on all of \(M\). At any point in an inner chart the scalar block is one and the vector block is its coordinate, giving immersion. If two images agree, that same block is nonzero for both and division gives the same coordinate, proving injectivity. Compactness gives a homeomorphism onto the image.

Set \(F_{ia}=I_i\phi_{ia}\). On \(\overline B_{7\rho/4}\) these maps converge in \(C^{3,\alpha_1}\) to coordinate maps determined by the finite limit charts. To verify this for each block \(b\), near a point mapped into the closed limiting cutoff support choose a neighborhood with compact closure in the overlap with chart \(b\). The transition estimates apply there, followed by composition with the fixed cutoff. At any point outside that closed image there is a neighborhood of positive distance from the support, and the block is eventually zero there by uniform metric chart convergence. A finite cover of the compact coordinate ball gives the assertion. In particular there are uniform bounds \(\|D F_{ia}\|,\|D^2 F_{ia}\|\le L\) on this ball, and \((D F_{ia})^T D F_{ia}\ge I\) because the own vector block is the identity there.

The cutoff scalar gives uniform separation. If \(x=\phi_{ia}(u)\) with \(|u|\le 3\rho/2\) and \(|I_i(x)-I_i(y)|\le\delta<1/2\), then the same scalar block for \(y\) has value \(s\ge1-\delta\). It is positive, so \(y=\phi_{ia}(v)\), and the vector block gives \(|sv-u|\le\delta\). Hence

\[
 |v-u|\le 2(1+2\rho)\delta=:C_b\delta .                            \tag{3}
\]

There is a radius \(r_{\rm tub}>0\), independent of \(i\), on which nearest-point projection to \(S_i=I_i(M)\) is uniquely defined and smooth. To see this, let \(w\) have distance at most \(r_{\rm tub}\) from \(S_i\), and let \(I_i(x)\) be a nearest point, which exists by compactness. Choose \(x=\phi_{ia}(u)\) in an inner chart. A second nearest point has Euclidean distance at most \(2r_{\rm tub}\) from the first and hence the corresponding coordinate \(v\) has \(|u-v|\le2C_b r_{\rm tub}\) by (3). Choose \(r_{\rm tub}<\min\{1/4,\rho/(4C_b),[2L(1+2LC_b)]^{-1}\}\). The entire straight coordinate segment lies in \(B_{3\rho/2}\) because \(|u|<\rho\) and \(|u-v|<\rho/2\). On that ball the identity block and the second-derivative bound both hold. Along the segment,

\[
 D^2\!\left(\tfrac12|F_{ia}-w|^2\right)
  =(D F_{ia})^T D F_{ia}+\langle F_{ia}-w,D^2 F_{ia}\rangle
  \ge I-Lr_{\rm tub}(1+2LC_b)I .                                    \tag{4}
\]

The choice of radius makes the right side at least \(I/2\). Two nearest points would give two distinct critical points along this segment, impossible by strict convexity. At the unique minimizer the same positive Hessian gives a smooth local foot map by the implicit function theorem. For each fixed smooth \(S_i\), uniqueness and compactness ensure continuity of the minimizer as \(w\) varies in the open tube, so these smooth local maps are its nearest projection. This proves uniform tubular existence with quantitative separation. No uniform bounds on high derivatives of the projections are needed.

### Global comparison on a fixed smooth reference

Set \(C=4L(1+LC_b)\) and choose \(0<\delta<\min\{r_{\rm tub}/2,1/4,\rho/(16C_b),1/(2C)\}\) before choosing the reference. These constants are uniform for the original subsequence. The chart convergence is Cauchy, so choose a single sufficiently late smooth reference member \(i_0\) so that \(\max_a\|F_{ia}-F_{i_0a}\|_{C^1(\overline B_{7\rho/4})}\) is less than \(\delta\) for all sufficiently large \(i\). Write \(I_0=I_{i_0}\), \(F_{0a}=F_{i_0a}\), \(\phi_{0a}=\phi_{i_0a}\), and let \(\pi_0\) be the smooth nearest projection to \(S_0\). For each \(x\), using an inner chart gives \(\operatorname{dist}(I_i(x),S_0)\le\delta\), so the map

\[
 P_i=I_0^{-1}\pi_0 I_i:M\longrightarrow M                            \tag{5}
\]

is defined and smooth everywhere. Here \(I_0^{-1}\) is the smooth inverse on the smooth embedded reference, including locally in each reference chart.

For \(|u|<3\rho/2\), the foot of \(F_{ia}(u)\) is within \(2\delta\) of \(F_{0a}(u)\). By (3) it belongs to the reference chart with coordinate \(q_{ia}(u)=\phi_{0a}^{-1}P_i\phi_{ia}(u)\) satisfying \(|q_{ia}(u)-u|\le2C_b\delta\). The preselected smallness bound places \(q_{ia}\) in \(B_{7\rho/4}\). At its foot equation,

\[
 D F_{0a}(q)^T(F_{0a}(q)-F_{ia}(u))=0,
\quad
 Dq=H^{-1}D F_{0a}(q)^T D F_{ia}(u),                                 \tag{6}
\]

where \(H=D F_{0a}(q)^T D F_{0a}(q)+\langle F_{0a}(q)-F_{ia}(u),D^2 F_{0a}(q)\rangle\). The operator \(H\ge I/2\) by the identity block and the bound on the residual. The residual \(|F_{0a}(q)-F_{ia}(u)|\le\delta\), and \(|D F_{ia}(u)-D F_{0a}(q)|\le\delta+2LC_b\delta\). Subtracting \(H\) from the numerator of (6) therefore gives \(\|Dq-I\|\le C\delta\) with the specified uniform value of \(C\). By construction \(C\delta<1/2\). This quantitative comparison uses only the uniform first and second derivative bounds before fixing the reference. No higher uniform derivative bound on the tube map is invoked.

The inner charts cover \(M\), so \(P_i\) is a local diffeomorphism. It is orientation preserving because all source and reference charts are positive and \(Dq\) lies within \(1/2\) of the identity. If \(P_i(x)=P_i(y)\), the two Euclidean images have the same foot on \(S_0\), so their distance is at most \(2\delta\). Choose an inner approximating chart at \(x\) and apply (3) to put \(y\) in the same \(B_{3\rho/2}\) chart. In this convex ball \(q_{ia}\) is injective by the derivative bound along segments. Thus \(P_i\) is globally injective. Its image is compact and open, so connectedness of the target makes it surjective. Define \(f_i=P_i^{-1}\), a smooth orientation-preserving self-diffeomorphism of the actual fixed smooth base.

For this fixed \(i_0\), the local maps \(q_{ia}\) converge in \(C^{3,\alpha_1}\) on smaller subballs of \(B_{3\rho/2}\), by composition of \(F_{ia}\) with the fixed smooth reference projection and reference inverse coordinates. This composition is taken on a fixed compact neighborhood strictly inside the tube and the reference chart, by the margins above. Their inverses \(v_{ia}=\phi_{ia}^{-1} f_i\phi_{0a}\) are defined on a neighborhood of \(\overline B_\rho\), with images strictly inside the first chart. In fact, for target \(|u|<5\rho/4\) solve \(q_{ia}(v)=u\) by the contraction \(v\mapsto u-(q_{ia}(v)-v)\) on the closed radius-\(\rho/8\) ball about \(u\), since \(2C_b\delta<\rho/8\). This ball stays strictly inside \(B_{3\rho/2}\), and the global inverse agrees with that branch. The same works for the local limiting map. Uniform convergence of the inverses follows by the derivative lower bound and convergence of the maps. Differentiating the inverse identity once and twice gives strong \(C^2\) convergence. Differentiating a third time gives uniform third derivatives, so the inverses also converge in \(C^{2,\alpha}\) by interpolation. The inverse Jacobians and their reciprocals are uniformly bounded in these coordinates.

In the reference charts the pullback matrices are

\[
 (\phi_{0a})^*(f_i^*g_i)=(Dv_{ia})^T h_{ia}(v_{ia})Dv_{ia}.            \tag{7}
\]

The \(C^{1,\alpha_0}\) convergence of \(h_{ia}\) and inverse map convergence give strong \(C^1\) and, with the spare Hölder exponent, \(C^{1,\alpha}\) convergence. The limiting matrix is positive because \(h_a\ge m^{-1}I\) and the limit inverse derivative is invertible. The chain and product rules up to order two give a common \(W^{2,p}\) bound. The only terms with second derivatives of \(h_{ia}\) are controlled by their chart \(L^p\) bound and the coordinate change with bounded Jacobians. The remaining terms use uniform lower-order coefficient bounds and uniform derivatives of \(v_{ia}\) through order three. Use the finite smooth reference cover to pass to a weakly convergent \(W^{2,p}\) subsequence with the same positive metric limit. This completes the global compactness step under a harmonic-radius floor.

## Conditional original-flow consequence

Let \(P\to M\) be a fixed smooth principal \(SO(3)\) bundle over the homotopy four-sphere, and let \(A(\tau)\) be a supplied smooth solution of the original Fine flow in its fixed identification for \(0\le\tau<\tau_*<\infty\), \(\tau_*>0\). Assume positive curvature planes and the round-compatible curvature-map sign throughout that interval. Work in native time, negative Killing pairing and reconstructed Riemannian metric. Suppose there is one sequence \(\tau_i\to\tau_*\) in the interval, and simultaneous constants \(P_0,D_0<\infty\) such that \(\sup_M\Psi(\tau_i)\le P_0\) and \(\operatorname{diam}(M,g_{A(\tau_i)})\le D_0\) for every \(i\). Here \(\Psi=\|D_\Gamma\mathcal R\|_{L_f^2}+\|\mathcal R\|_{L_f^2}^2\) is the E159 real whole-fiber quantity, with its specified \(\Gamma\)-horizontal derivative on the unit target sphere and live full base covector derivative.

The native wedge identity gives \(dV_g=\frac13\langle F_A\wedge F_A\rangle\). In a fixed smooth identification, Bianchi and metricity give \(\partial_\tau dV_g=\frac23 d\langle\partial_\tau A\wedge F_A\rangle\). Integration on the closed base yields the constant positive native volume \(v=\operatorname{Vol}(M,g_{A(0)})\). Only total volume conservation is needed for (1).

The exact E159 bounds on these slices, with \(k^2=4\pi/5\), are

\[
 B=\frac{1+4\sqrt3}{k^2}P_0,\qquad
 |\nabla^A T|+|T|^2\le B,\qquad
 |T|+|\nabla^A T|\le\sqrt B+B,\qquad
 Z_0=\frac{\sqrt6}{2}+(42+8\sqrt3)B.                               \tag{8}
\]

The floor-free chiral bound in native units is

\[
 \left(|W^+|_{\mathrm{op,HS}}^2+\tfrac14|\mathrm{Ric}_0|_g^2
                   +\tfrac1{48}(s_g-6)^2\right)^{1/2}
 \le \tfrac12|Q-I|+6|\nabla^AT|+(42+8\sqrt3)|T|^2\le Z_0.             \tag{9}
\]

Here \(|Q-I|\le\sqrt6\) follows from positive trace-three \(Q\). The old scalar target \(12K\) becomes \(6\) under \(g=2K\widehat g\). The block gives \(|W^+|_{\mathrm{op,HS}}\le Z_0\), \(|\mathrm{Ric}_0|_g\le2Z_0\), and \(|s_g-6|\le4\sqrt3 Z_0\). With \(|g|_g=2\), this yields the absolute native Hilbert–Schmidt Ricci bound \(|\mathrm{Ric}|_g\le 3+(2+2\sqrt3)Z_0\). These are the bounds (1) together with the volume and diameter. [E159][geom] · [Lead assessment][geoma]

Apply the conditional static conclusion to the selected metrics. It gives smooth orientation-preserving normalizers and positive strong \(C^1\) metric convergence. The assessed E155/E157–E159 static pair result uses \(|T|+|\nabla^AT|\) from (8) and the homotopy-sphere topology, producing a uniform positive compatible pair limit under smooth lifts to the given bundle. The topology replaces the assumed eigenvalue floor for these pairs. The assessed E148 sequential criterion then starts from one late smooth slice and gives smooth definite continuation of the original solution past \(\tau_*\) in its original identification. The subsequence of times still tends to \(\tau_*\). Thus, conditional on \(H_{\rm pre}\), a finite maximal smooth definite solution admits no late sequence with both uniform \(\Psi\) and diameter bounds. The bounds are used only on the same selected sequence. [Static pair and topology assessment][geoma] · [Sequential criterion assessment][seq]

## Evidence boundary

The unscaled compactness argument assumes a harmonic-radius floor and constructs smooth same-base diffeomorphisms. Its limiting metric has the regularity proved above. The separate smooth Einstein limit belongs only to \(H_{\rm pre}\). The conditional composition does not invoke R29 Theorem 2.2 with a missing premise. No uniform injectivity floor, full-curvature supremum bound, time-dependent normalizer bound, initial definite connection, a priori flow estimate or long-time result is claimed. The BKN and Wright inputs retain the inspected versions and applicability scopes recorded in the supplied E164 and E162 evidence. No new primary work was inspected in E168.

## Frozen inputs

| Input | SHA-256 |
| --- | --- |
| [E168 request][req] | `c9c596296b7cb7534a966a48f9ad0ce98d09559dfd27765759aba81bcb097b88` |
| [B85][b85] | `e770687740c0a936fbfcef433b91ab8b9156ab8be9ddc6293cfa852e9814444e` |
| [E165][pre] | `3d209fb8ae59fce264e641b9d655d40cffa3f73dc825b1cb55a02dbdd3ee93a2` |
| [E164 source check][bkn] | `5d8e17d8388945c0f8b5ab8622ca8c58d3d274d626ed9aa321b8d5b384972502` |
| [E162 assessment][core] | `2af867adb243f960c689967a443dc8d78279c38cd6b0c7afe4b4b611a0ab4345` |
| [E157–E159 assessment][geoma] | `b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52` |
| [E159][geom] | `eb5a66fc93fcf8e04e41870caa426e09399944be2a302b008befffb513851156` |

[req]: ../research-progress/handoffs/SP4-CME-E168_REQUEST_v1.md
[b85]: ../brainstorm/notes/B85_METRIC_COMPACTNESS_COMBINATION_20261122.md
[pre]: 165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md
[bkn]: ../reviews/E164_RICCI_FLAT_ALE_SOURCE_CHECK_20261122.md
[bknpdf]: https://www.math.stonybrook.edu/Courses/MAT683/201001/MAT683S10.pdf
[core]: ../reviews/E162_ALE_CORE_TOPOLOGY_ASSESSMENT_20261122.md
[geoma]: ../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
[geom]: 159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md
[seq]: ../reviews/E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md
