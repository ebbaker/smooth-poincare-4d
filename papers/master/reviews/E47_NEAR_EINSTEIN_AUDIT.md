# E47 · Smooth recognition from a small Ricci and chiral spectral defect

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Independent bounded E audit of the proposed compactness proof. Actual serving model and reasoning effort are unavailable. Frozen inputs are [Ricci scales](../manuscript/ricci_scales.tex), SHA-256 `091cd448e8857f105f388160c81c4b501ea200d728ca4cddacc30697ee6a8f6e`, the [master main](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex), `6c47f8fe412eb856f8a36ee601be95e745a95c33a00e9d9379cdb67a5bb93195`, [E05](../notes/E05_CLOSED_STABILITY.md), `c80e502aca58c53892f16612f0c15da6b01915706625bfcbd576d602ec9059eb`, and [E40](../notes/E40_CLOSED_PINCHING.md), `e6296b7530133ac224b370d5d0fce9004633d547417e2197caeda7028d1d4504`. The argument is conditional on the frozen interior harmonic-radius lemma and uses the cited Einstein classification implication.

## Verified recognition statement

Fix \(\delta>0\), \(2<p<\infty\), \(L<\infty\), and \(0\le q<q_*:=1/(3\sqrt6)\). Let \((M,g)\) be a closed oriented smooth homotopy four-sphere with a smooth volume-one positive Yamabe minimizer in its conformal class. Set \(Z_g=\operatorname{Ric}_{0,g}\), \(e=E_+(g)=E_-(g)\), and

\[
 J_q^\pm(g)=\int_M[-\det W_g^\pm-q|W_g^\pm|_{\mathrm{HS}}^3]_+^{2/3}\,dV_g .
\]

The endomorphisms act on real \(\Lambda^\pm\) with the master curvature sign and Hilbert–Schmidt norm. Under \(e\le8\pi^2-\delta\) and \(\|Z_g\|_{L^p(g)}\le L\), there exists \(\varepsilon(\delta,p,L,q)>0\) such that

\[
 \|Z_g\|_{L^2(g)}^2+\min\{J_q^+(g),J_q^-(g)\}<\varepsilon
 \quad\Longrightarrow\quad M\cong S^4\quad\text{smoothly}.
\]

The criterion is uniform over smooth homotopy-sphere types. An equivalent formulation for fixed \(0\le s<1\) uses

\[
 H_s^\pm(g)=\int_M(\lambda_2(W_g^\pm)-s\lambda_3(W_g^\pm))_+^2\,dV_g,
 \qquad \lambda_1\le\lambda_2\le\lambda_3,
\]

and a threshold depending on \(s\). The proof uses the Yamabe inequality in each physical class. It requires no minimization of chiral energy over conformal classes, source Bach control, or criticality for the Weyl functional.

## Uniform harmonic atlas and smooth Einstein limit

Consider any sequence satisfying the band and the \(L^p\) bound for which the indicated sum tends to zero, on possibly different \(M_i\). The physical budget identities use signature, Gauss–Bonnet, volume one and the Yamabe normalization. They give \(\sqrt{48\delta}\le Y_i=R_{g_i}\le8\sqrt6\pi\) and a uniform full-curvature \(L^2\) bound. The physical Yamabe cutoff inequality gives a uniform \(\nu t^4\) lower volume bound for metric balls at \(0<t\le1\). Packing disjoint unit balls along a minimizing segment gives a uniform diameter bound. These steps enclose the whole source in one bounded-scale window without changing its physical gauge. [Master physical budget](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Small-ball estimate and packing](E25_ANNULAR_VOLUME.md)

At every center apply Lemma `lem:ricci-radius` with \(a_i=1\). Then \(P_i(x,1)\le L\). The conclusion is a uniform physical harmonic radius with ellipticity and bounded \(W^{2,p}\) components, at a scale held fixed in \(i\). The lemma explicitly permits varying homotopy spheres and does not require minimization. In its proof, the blow-up Ricci tensor tends to zero directly by physical rescaling and the supercritical bound. The imported part of the complete-limit proof is the curvature, Sobolev and marked ALE link argument preceding same-type descent. For this Ricci-flat blow-up the weak Bach argument from minimization is dispensable, and the exclusion of nontrivial links uses the source topology and energy band. This application uses the lemma, rather than the subsequent Ricci-scale theorem for minimizing sequences. [Frozen interior Ricci lemma](../manuscript/ricci_scales.tex) · [Owning ALE end argument](../manuscript/complete_limits.tex)

The fixed radii and noncollapse also bound the number of small balls required to cover each whole source by a maximal separated net. Take a finite protected harmonic atlas subordinate to such nets. The lemma's compactness argument gives a closed connected limit atlas with weak \(W^{2,p}\) and strong \(C^0\cap W^{1,2p}\) chart convergence, after shrinking the charts and taking a subsequence. The Sobolev exponent check is strict for \(2<p<4\) since \(2p<4p/(4-p)\), and is standard at and above four. Overlaps converge using the harmonic transition equation and the uniform ellipticity. Oriented source charts keep the limiting atlas oriented. In the smooth limit atlas constructed below, the compact marking construction of the lemma gives smooth oriented embeddings of the whole closed limit \(N\) into \(M_i\). A whole embedding is open by equal dimension and closed by compactness. Since \(M_i\) is connected, it is a diffeomorphism. Thus \(N\) itself is a smooth homotopy sphere. This uses whole markings from the finite atlas with protected charts and finite diameter, including all parts of the source.

Fix any \(r\in(2,p)\) and let \(\vartheta\in(0,1)\) satisfy \(1/r=\vartheta/2+(1-\vartheta)/p\). Then \(\|Z_{g_i}\|_r\le\|Z_{g_i}\|_2^\vartheta L^{1-\vartheta}\to0\). Pass to \(Y_i\to Y>0\). In the harmonic charts, uniform ellipticity converts tensor and coordinate norms, and \(\operatorname{Ric}(g_i)=Z_{g_i}+Y_i g_i/4\to Yh/4\) strongly in \(L^r\), where \(h\) is the limiting metric. The harmonic Ricci equation passes to the weak limit using the uniform coefficient convergence, the weak Hessians and the strong \(W^{1,2r}\) convergence for its quadratic first-order term. Thus \(\operatorname{Ric}(h)=Yh/4\). Interior elliptic regularity makes \(h\) smooth. In detail, when \(2<p<4\) the weak \(W^{2,p}\) bound puts the quadratic term in \(L^{2p/(4-p)}\) with exponent greater than \(p\). Freeze the continuous principal coefficients on small balls, apply an interior estimate at the improved exponent and iterate. At exponent four the first derivatives belong to each finite \(L^a\), giving an exponent above four on the next step. Then the coefficients are \(C^{1,\alpha}\) and differentiation and elliptic regularity bootstrap the Einstein equation to smoothness.

Subtract the reduced equations in a fixed chart and use the limiting principal coefficient \(h^{ab}\) on \(D^2(g_i-h)\). The difference of Ricci sources tends to zero in \(L^r\), and so does the quadratic-term difference by strong \(W^{1,2r}\). The coefficient difference multiplying \(D^2g_i\) is bounded by its uniform norm times the uniform \(L^r\) Hessian bound, hence tends to zero. Equivalently, after localization it can be absorbed in the fixed-coefficient interior estimate. This gives strong \(W^{2,r}\) on chart interiors. For the harmonic transition maps, the scalar elliptic equation gives strong \(W^{2,2r}\) on protected overlaps by the same fixed-coefficient estimate. Its differentiated right side, \(Dg_i^{-1}D^2T_i\), converges strongly in \(L^r\) by the two strong \(L^{2r}\) factors. The resulting strong \(W^{3,r}\) convergence of transitions gives the same convergence for the compact coordinate-block markings, using finite gluing and the smooth tubular projection once the limit is smooth. In the metric pullbacks the second-derivative product terms use \(L^{2r}\cdot L^{2r}\subset L^r\). Hence the strong curvature convergence can be read globally through the oriented markings.

## Passage of the defect and the limit classification

Identify the chiral bundles relative to \(h\) by the orientation-preserving positive isometry between the two pointwise metric inner products. Its matrices converge uniformly to the identity. The curvature formula using the Hessians and quadratic first derivatives therefore gives \(W_{g_i}^\pm\to W_h^\pm\) strongly in \(L^r\) and the volume densities converge uniformly. The function \([ -\det W-q|W|^3]_+^{2/3}\) is continuous, including at \(W=0\), and bounded by \(C_q|W|^2\). After taking an almost-everywhere convergent subsequence, the \(L^r\) bound with \(r>2\) gives uniform integrability, so the integrals \(J_q^\pm\) converge. The sorted eigenvalues of symmetric matrices are Lipschitz in the operator norm. The positive-part functions defining \(H_s^\pm\) converge strongly in \(L^2\) before squaring. The integral of \(|W^\pm|^2\) passes to the limit as well. Pick a subsequence with one fixed minimizing chirality in the minimum of the two defect integrals. It has zero defect for \(h\).

For the determinant statement, smoothness and zero integral give \(\det W_h^\pm\ge -q|W_h^\pm|^3\) everywhere. Reverse orientation if this is the negative block. Catino–Dameno Corollary 1.5 applies to a compact oriented Einstein four-manifold with a block that is nonzero somewhere, allows its zero locus, and imposes exactly \(0\le q<1/(3\sqrt6)\). Their curvature sign and operator normalization are confirmed by the trace-free eigenvalue formula in §1 and the positive Kähler eigenvalue \(R/6\) in §4. For \(H_s\), zero integral gives the eigenvalue inequality everywhere, so Theorem 1.4 applies directly under the same nonzero-block alternative. Either theorem gives a conformally Kähler metric after at most a double cover. Each connected covering component of the simply connected \(N\) is diffeomorphic to \(N\). A Kähler form gives a nonzero class in \(H^2(N;\mathbb R)\) by its positive volume integral, which is impossible on a homotopy sphere. Thus the chosen block is identically zero. Signature and smoothness give zero for the other block. Since \(h\) is Einstein with positive scalar \(Y\), its sectional curvature is identically \(Y/12\). The complete simply connected manifold \((N,h)\) is round. [Catino–Dameno, *Conformal Kähler Rigidity of Einstein Four-Manifolds*, preprint proof rendition, Theorem 1.4, Corollary 1.5, and §4, pp. 4 and 20–22, inspected 25 November 2026](https://cvgmt.sns.it/document/11018/)

Thus any putative sequence of nonstandard counterexamples with defects tending to zero has a round limit through smooth diffeomorphisms, a contradiction. The same argument shows that on any sequence with these hypotheses and vanishing defects, \(e_i\to0\). Equivalently, for every fixed target energy \(\eta>0\), some threshold for the two defects forces \(e<\eta\). The thresholds come from subsequence compactness, without effective values.

## Comparison of the two tests and earlier bounds

On a nonzero trace-free chiral block, put \(w=\lambda_2/\lambda_3\in[-1/2,1]\). Then \(\lambda_3>0\), \(|W|^2=2\lambda_3^2(1+w+w^2)\), and \(-\det W/|W|^3=f(w)\) for

\[
 f(w)=\frac{w(1+w)}{2^{3/2}(1+w+w^2)^{3/2}}.
\]

This increases strictly on \([-1/2,1]\) and has \(f(1)=q_*\). For paired parameters \(q=f(s)\), the two defects have the same zero set. On \([s,1]\), the ratio \((f(w)-f(s))/(w-s)\) has a continuous positive extension at \(s\) and is bounded above and below for each fixed \(s<1\). Therefore the determinant integrand is comparable to \(|W|^2(w-s)_+^{2/3}\) with constants depending on \(s\). The eigenvalue integrand is comparable to \(|W|^2(w-s)_+^2\). Using \((w-s)_+\le1\) and Hölder yields for either block

\[
 H_s^\pm\le C_s J_{f(s)}^\pm,
 \qquad J_{f(s)}^\pm\le C'_s(E_\pm)^{2/3}(H_s^\pm)^{1/3}.
\]

Taking minima preserves these estimates since \(E_+=E_-\). Thus the two smallness conditions give interchangeable existence statements for a fixed energy band and paired parameters. At \(s=1\) or \(q=q_*\) the corresponding defect is zero for every trace-free block, so the imported spectral classification step would be unavailable.

E05 gives a non-effective energy-only gap for exact positive Einstein metrics, with the explicit correction from the *lower* eigengap. E40 strengthens that correction and gives the pointwise upper-eigenvalue ratio and determinant restrictions for a surviving exact Einstein block. The present argument uses the *upper* gap, converts its violation to either integrated defect, and transfers classification through a sequence of positive Yamabe metrics with small trace-free Ricci and bounded supercritical Ricci. Restricting to exact Einstein metrics, E05's positive energy gap combined with \(e_i\to0\) also shows a positive non-effective lower bound on the minimum of either integrated defect for **every nonround** metric in the fixed band. These tests supply no reason that a metric meeting the smallness hypotheses exists on each smooth type. [E05 exact Einstein gap](../notes/E05_CLOSED_STABILITY.md#uniform-gap-in-the-homotopy-sphere-class) · [E40 exact Einstein spectral restrictions](../notes/E40_CLOSED_PINCHING.md)
