# E11 · Native GST meridians and the two fillings

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E execution, Sol 6.2/ultra requested. Actual serving model and effort unavailable. Base revision bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Inputs are [E11 R1](../research-progress/handoffs/E11_REQUEST_R1.md), the [slide handoff](../../04_slide_filters/research-progress/handoffs/TO_TUBE_NATIVE_DISK_DOUBLE_20261127.md) (SHA-256 prefix 3c80a1bcf7d2915d), its [quaternion words and marked exterior derivation](../../04_slide_filters/notes/REPRESENTATIONS_AND_EXTERIORS_20261127.md) (3a5df86a7eca9e0e), and the [framed connection inequality](FRAMED_CONNECTION_BUDGET.md) (84372b4d24a1aacf). Work is smooth and oriented, and curvature is Riemannian with the parent's chiral Hilbert–Schmidt convention and \(T=4\pi^2\).

**Result.** The five representations give explicit two-sign cap thresholds. For sample 5 an umbilic cap in the round-fiber connection class cannot stay below \(2T\) if either corresponding exterior chiral energy is at least \(53\pi^2/20\). The inequality is conditional on a matched metric germ. Both the product and Gluck fillings of each marked disk double are smoothly standard by a relative handlebody-bundle identification and an extension of the boundary twist.

## Exact peripheral evaluation

For \(L_{3,1}=Q\cup V_3\) the incoming markings are \((G_r,s)\) for the double of the \(Q\)-disk and \((G_s,r)\) for the double of the \(V_3\)-disk, where
\[
r=yxy(xyx)^{-1},\qquad s=x^4y^{-3},\qquad
G_w=\langle x,y\mid w=1\rangle .
\]
These are meridians of the smooth doubled disks, up to conjugacy and inversion. The native zero-surgery cuts used to obtain the groups differ from the \(S^1_\mu\times S^2\) closing boundaries. The five quaternions \((\xi,\upsilon)=(\rho(x),\rho(y))\) are used in the order of the [slide table](../../04_slide_filters/notes/REPRESENTATIONS_AND_EXTERIORS_20261127.md#five-exact-evaluations).

For rows 1, 3 and 4, \(\operatorname{Re}\xi=a=1/\sqrt2\), \(\operatorname{Re}\upsilon=b=1/2\), and \(\xi^4=\upsilon^3=-1\). Put \(c=\operatorname{Re}(\xi\upsilon)\). The identities \(\xi\upsilon\xi=2c\xi-\upsilon^{-1}\) and \(\upsilon\xi\upsilon=2c\upsilon-\xi^{-1}\) give the real part of \(r\) as the Euclidean inner product of the two triple products:
\[
\operatorname{Re}\rho(r)
=(1+4c^2)(2ab-c)-2c(2a^2+2b^2-2)
=\frac{1+4c^2}{\sqrt2}-4c^3 .
\]
The three values of \(c\) are \(3/(4\sqrt2),15/(32\sqrt2),-5/(16\sqrt2)\), respectively. For rows 2 and 5, writing \(\xi=q^{-1}p,\ \upsilon=p^{-1}q^2\) with \(p=i\) and \(p^2=q^3=-1\) gives \(\xi\upsilon\xi=\upsilon\xi\upsilon\). Here \(\operatorname{Re}\xi=\operatorname{Re}\upsilon=a\). The Chebyshev polynomials \(T_j,U_j\) give \(\xi^j=T_j(a)+U_{j-1}(a)\operatorname{Im}\xi\) and therefore
\[
\operatorname{Re}\rho(s)=T_4(a)T_3(a)+
 U_3(a)U_2(a)\operatorname{Im}\xi\cdot\operatorname{Im}\upsilon .
\]
The two values of \((a,\operatorname{Im}\xi\cdot\operatorname{Im}\upsilon)\) are \((3/5,-7/50)\) and \((-17/20,89/400)\). These evaluations recover all five scalars by rational arithmetic or arithmetic in \(\mathbb Q(\sqrt2)\).

Write \(u_i=\operatorname{Re}\rho_i(\mu)\). The exact principal angle in \(SO(3)\) is \(2\arccos|u_i|\). In the disk trivialization the dimensionless \(SU(2)\) distances of the two possible lift endpoints are
\[
\delta_i^{\rm given}=\frac{\arccos u_i}{\pi},\qquad
\delta_i^{\rm opp}=1-\frac{\arccos u_i}{\pi}.
\]
An odd turn of the boundary frame exchanges the lifts. Conjugation and reversal of the marked meridian preserve the scalar, so neither changes these values. The given lift of a representation on the exterior is an algebraic datum. Identifying it with the disk-extending lift requires the geometric frame used in the matching.

## Cap budget and a strict exclusion at an umbilic seam

Normalize the fiber radius to one by conformal rescaling. For a round-fiber connection metric on \(S^2\times D^2\), write \(q\) for the normalized disk metric and \(D=(2\pi)^{-1}\int K_q\,dA_q\). Use \(J_\pm=E_\pm(\mathrm{cap})/\pi^2\) and \(x_\pm=E_\pm(X_J)/\pi^2\). The [framed bound](FRAMED_CONNECTION_BUDGET.md) gives
\[
J_\pm\ge \lambda D+
C_\lambda \delta,\qquad
C_\lambda=2\sqrt{(\lambda-3\lambda^2/16)(4-2\lambda/3)},\quad
0\le\lambda\le16/3 .
\]
In particular the tangent line to \(\tfrac43(K+1-2|b|^2/3)^2\) leaves the terms \((\lambda-3\lambda^2/16)U+(4-2\lambda/3)\int |b|^2\,d\mu\) after extracting \(\lambda D\), with \(U=(2\pi)^{-1}\operatorname{Area}_q(D^2)\). The lifted holonomy distance bounds \((2\pi)^{-1}\int |b|\,dA_q\) below by \(\delta\). Cauchy–Schwarz and the arithmetic–geometric mean give the displayed area-independent bound. It applies to each chirality, since the odd fiber term already cancels in each of the two curvature estimates. The cap may have a nonabelian connection and need not have circle symmetry.

For an **umbilic** seam in this ansatz, \(D=1\). Indeed the unit normal is the horizontal lift of the normal to \(\partial D^2\) in \(q\). Its flow along base normal curves acts by fiber isometries, so the fiber–fiber restriction of \(B\) vanishes. Umbilicity is conformally invariant and now forces \(B=0\) in the normalized gauge. The horizontal tangent then has vanishing geodesic curvature \(k_q\) along \(\partial D^2\). Disk Gauss–Bonnet gives \(D=1-(2\pi)^{-1}\oint k_q\,d\ell_q=1\). A value \(D>1\) would instead apply to a different seam in this ansatz.

For every row, the corresponding signed budget excludes the strict band if \(x_\pm\ge 8-\lambda D-C_\lambda\delta\) for either chirality. This follows by additivity and \(E_+=E_-\) on a homotopy four-sphere. The same inequality with \(x=(x_++x_-)/2\) gives a valid mean-energy obstruction. For an unknown sign it suffices to use \(\min(\delta_i^{\rm given},\delta_i^{\rm opp})\), or the two sign-specific thresholds can be retained as below. At an umbilic seam take the one rational test value
\[
\lambda=\frac{133}{25},\qquad C_\lambda=\sqrt{\frac{4522}{187500}} .
\]
Here the exact thresholds for \(x_\pm\) are \(\frac{67}{25}-C_\lambda\delta_i^{\rm given}\) and \(\frac{67}{25}-C_\lambda\delta_i^{\rm opp}\). The decimal values are orientation aids at this fixed \(\lambda\), with no claim of optimization or numerical certification.

| Row | Disk and meridian | Exact scalar \(u_i\) | \(\delta_i^{\rm given}\) | \(\delta_i^{\rm opp}\) | Threshold, given lift | Threshold, opposite lift |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| 1 | \(V_3,\ r\) | \(41\sqrt2/64\) | 0.139135 | 0.860865 | 2.658393 | 2.546310 |
| 2 | \(Q,\ s\) | \(64893/78125\) | 0.187980 | 0.812020 | 2.650807 | 2.553895 |
| 3 | \(V_3,\ r\) | \(20209\sqrt2/32768\) | 0.162701 | 0.837299 | 2.654733 | 2.549969 |
| 4 | \(V_3,\ r\) | \(2573\sqrt2/4096\) | 0.151837 | 0.848163 | 2.656420 | 2.548282 |
| 5 | \(Q,\ s\) | \(-13854473/20000000\) | 0.743589 | 0.256411 | 2.564522 | 2.640180 |

**Exact sample 5 exclusion.** Its scalar satisfies \(u_5^2<1/2\), so both lift distances satisfy \(\delta>1/4\). Since \(C_\lambda>3/20\), each cap chirality obeys \(J_\pm>133/25+3/80\). Consequently an exterior with \(x_\pm\ge53/20\) for either sign has the corresponding total
\[
x_\pm+J_\pm>\frac{53}{20}+\frac{133}{25}+\frac3{80}
=8+\frac3{400}.
\]
The exterior test value \(53\pi^2/20=(53/80)T\) is strictly below \((2/3)T\). The angle and threshold comparisons follow by squaring positive rationals. An independent exact fraction replay checked all five scalar coefficients, \(C_\lambda^2\), and the inequality. The threshold requires neither a cap area nor a choice of lift sign for this sample.

## Smooth type of both fillings

Let \(J=Q\) or \(V_3\), \(J'\) be the other component of \(L_{3,1}\), and \(Y_J=S^3_0(J)\). In the slide handoff, the actual disk exterior \(W_J\) is obtained from the marked incoming \(Y_J\) by the remaining 0-framed handle on \(J'\), the two 3-handles and a 4-handle. The disk has a collared product normal bundle. The product filling of the double exterior restores the double of the specified smooth \(B^4\), which is standard \(S^4\). Here GST §§7–8 provide the 2R-link and the actual disk, including the assertion at p. 2334 that the pictured ball is standard. [GST, Geom. Topol. 14 (2010), 2305–2347](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=30).

There is a relative use of Meier–Zupan's derivative theorem on the **actual** exterior. Both \(Q=Q_{3,2}\) and \(V_3=Q_{4,3}\) are nontrivial fibered generalized square knots, of genera \(g=2,6\). First their Lemma 3.10 puts the framed \(J'\) into a closed fiber by isotopy in \(Y_J\). The end of the proof of Theorem 1.5, Claim 2, gives a framed slide equivalence of \(J'\sqcup U\) to a \(g\)-component Casson–Gordon derivative \(L^+\) in this same \(Y_J\). Here \(U\) is a split 0-framed \((g-1)\)-component unlink. The relative statement in the proof, before lifting the slides to the \(S^3\) diagram, keeps the incoming boundary fixed. Introduce these split handles in the upper collar of \(Y_J\) as canceling 2/3 pairs. Slide them and \(J'\) in that collar. The framed trace diffeomorphism is the identity on the incoming \(Y_J\). Its outgoing boundary is \(\#_{g+1}(S^1\times S^2)\). The induced diffeomorphism there extends over the upside-down 1-handlebody of the 3/4-handles by Laudenbach–Poénaru. This keeps the trace diffeomorphism relative to the original \(Y_J\). [Meier–Zupan, *Generalized square knots and homotopy 4-spheres*, J. Differential Geom. 122 (2022), Lemma 3.10 p. 87 and Theorem 1.5 Claim 2 p. 90](https://par.nsf.gov/servlets/purl/10464744) · [Laudenbach–Poénaru, Bull. Soc. Math. France 100 (1972), §2, p. 342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf).

The defining monodromy extension of the derivative, and the relative handle construction in Lemma 2.5, now identify \(W_J\) with the handlebody mapping torus over \(S^1\), restricting on \(Y_J\) to the original closed knot fibration. Taking the relative diffeomorphism on both halves preserves \(E(J)\subset Y_J\) and the solid-torus product on its complement. The doubled exterior therefore fibers over \(S^1_\mu\) with fiber the double of \(H_g\) along its boundary minus the capping disk, namely \((\#_g S^1\times S^2)\setminus\operatorname{int}B^3\). The \(S^2\) boundary is the double of the capping disk. This argument uses an actual relative trace diffeomorphism and leaves the specific meridian fixed. A group isomorphism, or merely the existence of some fibered slice disk for \(J\), would not suffice. [Meier–Zupan 2022, Lemma 2.5 and Proposition 2.6, pp. 78–79](https://par.nsf.gov/servlets/purl/10464744).

For this punctured fiber, the Gluck loop extends **smoothly**. Start with the standard circle actions rotating the \(S^2\) factors of \(S^1\times S^2\). Form equivariant connected sums at fixed points with tangent representation a rotation plane plus a fixed line. An orientation-reversing reflection of the fixed line gives an equivariant identification of the gluing spheres. Remove a small invariant ball around a remaining fixed point. There is then a loop \(A_\theta\) of diffeomorphisms of the punctured fiber that restricts to a single rotation on the boundary sphere. In an interior product interval of the mapping torus over \(S^1_\mu\), act by \((x,t)\mapsto(A_{\theta(t)}x,t)\) as \(\theta(t)\) goes smoothly from \(0\) to \(2\pi\), constant near each end. Extend by identity outside the interval. This is a smooth diffeomorphism of the exterior and its boundary action is the Gluck generator, by \(\pi_1(SO(3))=\mathbb Z/2\) in the smooth \(S^1\times S^2\) boundary group. Smooth collar isotopy accommodates the actual boundary parametrization. This is the localized extension used in Gluck's spin criterion, with a smooth rotation loop constructed directly here. Thus gluing a cap by the nontrivial twist gives a diffeomorphism of the filled manifold, carrying its cap core to the corresponding core. Both fillings of either specified exterior are diffeomorphic to \(S^4\), hence also homeomorphic. [Gluck, Trans. Amer. Math. Soc. 104 (1962), Theorem 17.1](https://www.maths.gla.ac.uk/~mpowell/Gluck-MCG-S2xS1-Trans-AMS.pdf) · [Hatcher, smooth boundary diffeomorphism theorem, author revision p. 1](https://www.maths.gla.ac.uk/~mpowell/Hatcher-newDiffS1xS2.pdf) · [Gay–Meier, Math. Proc. Cambridge Philos. Soc. 172 (2022), §5.2, smooth scope for fibered homotopy-ribbon twins](https://doi.org/10.1017/S0305004121000165).

This verification does not use the stronger spun-pair identification of Meier–Zupan 2025, Proposition 4.2. The passage from unmarked zero surgery to an identified spun exterior in that proof would require matching the surgery core. That matching should receive its own audit before using the stronger statement on the native meridians. Neither the ribbonness of the original individual disks nor a periodic exterior monodromy is required by the extension above. [Meier–Zupan, *Knots bounding nonisotopic ribbon disks*, J. Topol. (2025), Proposition 4.2](https://doi.org/10.1112/topo.70047).

## Scope and first missing input

The group representations supply marked **flat bundles** and meridional conjugacy classes. Their holonomy has not been realized as the connection of a round-fiber boundary germ of an exterior metric. The first missing geometric input is an actual matched umbilic Cauchy datum on \(X_J\) with that connection, including the induced framing, signed exterior energies and the positivity of the relevant doubles if invoking the seam atlas. The inequalities test such data once supplied. No cap or exterior metric, scalar-curvature claim for these exteriors, or closed entry trial is produced. Even a successful geometric realization on these two exteriors would be on an already recognized smooth type.

All source passages cited here were inspected on 27 November 2026. The quaternion replay, conditional cap thresholds and smooth boundary extension are analytical or exact rational evidence. The displayed decimals are floating evaluations of the exact threshold expressions.
