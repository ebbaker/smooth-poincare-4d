# Smooth opposite-half-flat cuts · SP4-CUT-LED-E07

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E07_REQUEST_R1.md) specifies a bounded E packet with `gpt-6.2-sol` / `ultra` as the requested configuration. Actual backend model and reasoning effort were unavailable for independent verification. Input checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`, [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) §§2–3, [child plan](../research-plan/PLAN.md) and [child register](../research-progress/REGISTER.md).

## Smooth obstruction

Let \(M\) be a smooth connected oriented four-manifold without boundary with a smooth positive-definite metric \(g\). Let \(\Sigma\) be a smooth separating hypersurface, with \(M\setminus\Sigma=U\sqcup U'\) and both open sides nonempty. Use the single orientation of \(M\) to define \(W^\pm\) on \(\Lambda^\pm\), and curvature-operator Hilbert–Schmidt norms as in the parent manuscript. If \(W_g^-=0\) on \(U\) and \(W_g^+=0\) on \(U'\), then \(W_g=0\) throughout \(M\). The cut can have arbitrary second fundamental form. The statement also holds with the two signs exchanged.

**Bach-flatness across the cut.** Fix a variation \(g_s=g+sk\) with \(k\) compactly supported inside one open side. On a closed \(M\), the signature identity makes the variation of \(E_+-E_-=12\pi^2\tau(M)\) zero. For a local version, take \(k\) supported in a relatively compact coordinate ball in the side. The Pontryagin transgression in the proof of (3.2) gives zero variation of the same energy difference on the ball since each \(g_s\) agrees with \(g\) near its boundary. The corresponding first variation of the vanishing block's integral is zero. For example, for \(W_s^-=P_s^-W_sP_s^-\) viewed as a full two-form endomorphism, every derivative term of the squared norm times the volume form contains a factor of \(W_0^-\). Hence the variation of \(E_++E_-\) is zero. The full four-index Weyl integral is \(4(E_++E_-)\), whose compactly supported first variation is a nonzero constant times the pairing with the Bach tensor. The fundamental lemma yields Bach-flatness on each side. Since the Bach tensor of a smooth metric is continuous, it vanishes also on \(\Sigma\). This step uses compactly supported interior variations and involves no variation of the cut or of its boundary datum. The dimension-four obstruction equation is exactly the Bach equation up to sign convention. [Bahuaud–Guenther–Isenberg–Mazzeo, §1 and (1.1)][bach] · [Graham–Hirachi, §2, p. 7][gh] · [Lassas–Liimatainen, §3.2, (26)–(28)][ll]

**Analyticity and continuation of one block.** Theorem 2.2 of Lassas–Liimatainen gives smooth conformal harmonic coordinates at every point, including each point on the cut, which is an interior point of \(M\). Theorems 1.3(c) and 3.7(c) give analyticity of \(\widehat g=(\det g)^{-1/4}g\) in any such chart. In dimension four the regularity hypothesis is \(g\in C^r\) with \(r>3\) and the weighted obstruction tensor \((\det g)^{1/4}\mathcal O^{(4)}(g)\) is zero and hence analytic. In a chart compatible with the fixed orientation, the coordinate components of \(W_{\widehat g}\) and \(*_{\widehat g}\) on two-forms are analytic. In particular \(P_\pm W_{\widehat g}P_\pm\) is analytic for \(P_\pm=(1\pm *_{\widehat g})/2\). For a positive rescaling \(\widehat g=cg\), the Hodge star on two-forms is unchanged and the Weyl endomorphism is multiplied by \(c^{-1}\), so the vanishing sets of the two blocks are preserved individually. Theorem 3.8 of the source is stated for the entire Weyl tensor. This blockwise argument uses the preceding regularity theorem and analytic Hodge projection, as in the earlier fixed-cap calculation [SEC-E24][e24]. [Lassas–Liimatainen, Theorems 2.2 and 3.7–3.8][ll]

For either fixed sign, the points with a neighborhood where the specified block vanishes form an open set. At any point in its closure a connected conformal harmonic chart meets that open set. Each component of the analytic projected tensor vanishes on the nonempty open intersection, hence on the whole chart by the real-analytic identity theorem. The set is closed and, by connectedness and the half-flat side for that sign, equals \(M\). Taking both signs proves the assertion. Neither analyticity of the cut nor a globally analytic representative of \([g]\) is required.

**Homotopy spheres and Corollary 3.5.** If \(M\) is a closed homotopy four-sphere, then \(W=0\) gives local conformal flatness. Simple connectivity gives a smooth conformal developing map to \(S^4\). Compactness makes this local diffeomorphism a covering of \(S^4\), and simple connectivity of the target makes it a diffeomorphism. In the parent normalization \(E_+=E_-=e=0\). If the cut is umbilic, both piece signatures vanish as in Corollary 3.3 and the boundary term in (3.2) vanishes, so \(\eta(\Sigma,[h])=0\) with outward-first orientation. The first, single-piece assertion of Corollary 3.5 continues to give the energy of an isolated half-flat filling with umbilic boundary. Its second assertion for a smooth class reduces to the zero-energy case. No Yamabe condition or subcritical bound goes into the obstruction. [Schoen–Yau, p. 47 and §1, pp. 49–50][sy] · [APS I, Theorem (4.14)][aps]

## Regularity and weakly glued pieces

Smoothness can be weakened if the two metrics are smooth up to the cut and the glued metric is \(C^3\) in a common smooth atlas. Its third derivatives are locally Lipschitz, by bounded fourth derivatives up to the cut and agreement of their third-order traces. The fourth distributional derivatives are then the bounded piecewise fourth derivatives. The Bach tensor is represented by its classical expression on the open sides almost everywhere and is zero as a distribution. The same analytic theorem applies with, for example, \(r=7/2\), and the projected Weyl argument goes through. This observation assumes smoothness up to the cut on both sides. It does not assert regularity of general low-regularity distributional solutions. [Lassas–Liimatainen, Proposition 3.5 and Theorem 3.7(c)][ll]

Matching the conformal datum \(([h],B^\circ)\) is weaker. Even a common metric with \(C^{2,1}\) regularity, a totally geodesic cut and smooth halves can have nonzero Weyl curvature with opposite vanishing blocks. The following reflected double tests the distinction on the standard \(S^4\).

Take the Pedersen self-dual Einstein ball, with \(k=m^2>0\) and left-invariant one-forms \(\sigma_i\) in Pedersen's normalization on \(S^3\). In the original formula, multiply by \((1-\rho^2)^2\) to compactify, then multiply near \(\rho=1\) by \([\rho^2(1+k\rho^2)]^{-1}\), using a smooth positive factor that agrees with this second factor near the boundary and equals one near the center. The first compactification is smooth at the center since the original ball metric is smooth there and \(1-\rho^2\) is a smooth radial function. In the resulting collar, let signed arc length \(t\) increase toward the boundary and put \(t=0\) there. Dividing the coefficients of Pedersen's formula gives
\[
 g=dt^2+h(t),\qquad
 h(t)=\sigma_1^2+\sigma_2^2+q(\rho(t))\sigma_3^2,\qquad
 q(\rho)=\frac{1+k\rho^4}{(1+k\rho^2)^2},\qquad
 \frac{d\rho}{dt}=\rho\sqrt{1+k\rho^4}.
\]
Thus \(q_\rho=4k\rho(\rho^2-1)/(1+k\rho^2)^3\), and using \(d/dt=(d\rho/dt)d/d\rho\) gives
\[
 h'(0)=0,\qquad h'''(0^-)=\frac{48k}{(1+k)^{5/2}}\sigma_3^2 .
\]
In particular the boundary is totally geodesic and the trace-free part of the last tensor is nonzero. The compactified ball has the same vanishing Weyl block on its interior as the original ball. [Pedersen, 1985 thesis, Chapter I, §7, (7.14) and following paragraph][ped]

Double via the identity on \(S^3\), using \(h(-|t|)\) in the common collar. The resulting metric on the standard smooth double of the ball is \(C^{2,1}\), with a third normal derivative jump. Reflection reverses the ambient orientation, so the two vanishing Weyl blocks are opposite in the fixed orientation of the double. To see the actual Weyl and Bach behavior, use index \(0\) for \(t\) and \(i,j\) tangent to the cut. At a slice with \(h'(0)=0\), the normal curvature formula gives \(\partial_t R_{i0j0}=-h'''_{ij}/2\) in the parent sphere-positive convention. The first normal derivatives of \(\operatorname{Ric}_{ij}\), \(\operatorname{Ric}_{00}\) and \(R\) are respectively \(-h'''_{ij}/2\), \(-\operatorname{tr}_h h'''/2\), and \(-\operatorname{tr}_h h'''\). Indeed the intrinsic Ricci variation and the derivatives of every term quadratic in \(h'\) vanish. Subtracting the Schouten part gives
\[
 \partial_t W_{i0j0}(0^\pm)
 =-\tfrac14\bigl(h'''(0^\pm)\bigr)^{\circ_h}.
\]
The normal derivative is nonzero on each side, so the Weyl tensor is nonzero in the interiors near the cut. The Weyl tensor is continuous on the cut, and its restrictions from the two sides have opposite vanishing blocks there, so the whole Weyl tensor vanishes pointwise on the cut. In the distributional Bach formula using two covariant divergences of \(W\), the only singular term in the tangential components comes from \(\partial_t^2 W_{i0j0}\). It is the jump of \(\partial_tW_{i0j0}\) times \(\delta(t)\), up to the overall Bach convention. Christoffel and curvature terms in that formula are locally bounded and the two-normal derivative has unit coefficient in the collar. The jump is nonzero. Thus even this matching leaves a surface source in the equation needed for analyticity. [Lassas–Liimatainen, §3.2, (27)][ll]

## Return to B02

The exact smooth opposite-half-flat construction cannot produce a nonflat class on any connected oriented four-manifold in the stated category. For a homotopy four-sphere it is equivalent, at the level of existence, to already supplying a conformally round smooth class. Thus B02 can close its exact smooth, nonflat lane without awaiting a separate one-sided filling existence theorem. The analytic germ and one-sided filling remarks in the parent concern individual pieces. Their existence alone cannot supply the smooth across-cut metric required in Corollary 3.5. The low-regularity double illustrates failure of that implication and gives no smooth extension or new entry construction. Approximate half-flatness and smoothing with nonzero Weyl error are outside this packet.

## Source and evidence record

Selected primary passages inspected on 27 November 2026. No local reading copies were stored.

| Primary version | Passage checked and role |
| --- | --- |
| Matti Lassas and Tony Liimatainen, *Conformal harmonic coordinates*, [arXiv:1912.08030v2, 20 December 2019][llv] | Theorems 1.3(c) and 1.4, p. 4, Theorem 2.2, pp. 8–9, §3.2, (26)–(28), pp. 18–19, Proposition 3.5 and Theorems 3.7(c) and 3.8, pp. 22 and 26–28. These supply the interior coordinate theorem, distributional interpretation and analytic normalization. The single-block continuation is derived above. [Text][ll] · [Canonical record R87][r87] |
| C. Robin Graham and Kengo Hirachi, *The Ambient Obstruction Tensor and Q-Curvature*, arXiv:math/0405068v1, 5 May 2004 | Theorem 1.2 and §2, p. 7 verify the dimension-four identification with the Bach tensor. [Text][gh] · [Canonical record R89][r87] |
| Eric Bahuaud, Christine Guenther, James Isenberg and Rafe Mazzeo, *Linear and nonlinear stability for the Bach flow, I*, arXiv:2508.06633v1, 8 August 2025 | §1 through (1.1), tensor norm and first variation. Only the vanishing of the first variation and its Bach characterization are used. [Text][bach] |
| M. F. Atiyah, V. K. Patodi and I. M. Singer, *Spectral asymmetry and Riemannian geometry. I*, Math. Proc. Cambridge Philos. Soc. 77 (1975), 43–69 | Theorem (4.14), p. 66, product near the boundary. Used in the parent ledger with the parent's eta convention. [Text][aps] |
| Richard Schoen and Shing-Tung Yau, *Conformally flat manifolds, Kleinian groups and scalar curvature*, Invent. Math. 92 (1988), 47–71 | p. 47 and §1, pp. 49–50, Weyl-flatness criterion and development on the simply connected manifold. [Text][sy] |
| Henrik Pedersen, *Geometry and Magnetic Monopoles. Constructions of Einstein Metrics and Einstein–Weyl Geometries*, Oxford D.Phil. thesis, Hilary Term 1985 | Chapter I, §7, (7.14), pp. 43–44, explicit self-dual metric regular on the open ball and its Berger conformal infinity. The conformal factor, normal derivatives and double are calculated above. The later article, *Einstein metrics, spinning top motions and monopoles*, Math. Ann. 274 (1986), 35–59, was identified by DOI 10.1007/BF01458016. The thesis is the inspected version. [Thesis][ped] |
| C. R. LeBrun, Jr., *Spaces of Complex Geodesics and Related Structures*, Oxford D.Phil. thesis, Trinity Term 1980 | Theorem (3.6.1), pp. 101–102, local analytic realization of an analytic positive-definite conformal metric and real second conformal fundamental form by a half-flat positive-definite conformal germ. The parent cites the 1982 *H-Space* article, whose full text was unavailable through the DOI lookup. Olivier Biquard, *Métriques autoduales sur la boule*, arXiv:math/0010188v3, 16 November 2000, was checked at abstract level. Neither is a premise in the obstruction or the weak example. [LeBrun thesis][leb] · [Biquard abstract][biq] |

[llv]: https://arxiv.org/abs/1912.08030
[ll]: https://arxiv.org/pdf/1912.08030
[gh]: https://arxiv.org/pdf/math/0405068
[bach]: https://arxiv.org/html/2508.06633v1#S1
[aps]: https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf
[sy]: https://math.jhu.edu/~js/Math646/schoen-yau.conformal.pdf
[ped]: https://people.maths.ox.ac.uk/hitchin/files/StudentsTheses/pedersen.pdf
[e24]: ../../../03_first_order_twistor/01_sections_and_connections/notes/SEC_E24_20261124.md
[r87]: ../../../../../references/SOURCE_NOTES_SEC_20261124.md#spherical-cap-and-exterior-variation--24-november-2026
[leb]: https://ora.ox.ac.uk/objects/uuid%3Ae29dd99c-0437-4956-8280-89dda76fa3f8/files/m9a6dd0bf9c662338c39481f32f64fdbb
[biq]: https://arxiv.org/abs/math/0010188
