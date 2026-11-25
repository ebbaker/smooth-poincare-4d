# SP4-MASTER-E45 · Exact sign test for marked round ends

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Independent bounded verification of the exterior-entry test. Actual serving model and reasoning effort are unavailable. The clean TeX inputs are from `a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`, byte-identical in the passages checked to the manuscript baseline `2689540e6dae1656b7f5ad4be52504db044995f2`.

| Checked input | SHA-256 |
| --- | --- |
| [Main TeX, physical budget and collar replacement](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex) at the clean revision | `6c47f8fe412eb856f8a36ee601be95e745a95c33a00e9d9379cdb67a5bb93195` |
| [Variational comparison, short marked cut](../manuscript/variational_comparison.tex) | `0c9b1dce4aa655be19b124b28c5e1c98d97645184561a9a00c05260b15c029db` |
| [Marked cut, smooth caps and localization](../manuscript/marked_cut.tex) | `3f3722b56d34f2cf76cf6135ac30d840e00aa7c810931eda821750e730c638ce` |
| [E39, positive assembly by a boundary form](../notes/E39_MARKED_COMPETITOR.md), inspected working file | `12ccdc604b69034ab6947524187be03f52d1597642da89dc32674cb482b2c489` |

The primary covariance source checked was John M. Lee and Thomas H. Parker, *The Yamabe Problem*, Bull. Amer. Math. Soc. (N.S.) 17 (1987), 37–91, [DOI](https://doi.org/10.1090/S0273-0979-1987-15514-5), [author-hosted published version](https://users.math.msu.edu/users/parker/YamabeProblem.pdf). The checked passages are §1, (1.3)–(1.5), and §2, (2.5)–(2.7) and the intervening Weyl transformation statement. The browser exposed the passage text and a direct PDF-byte download failed at DNS, so no PDF byte hash is reported. The spectral boundary form and capacity argument below were rederived.

## Fixed metric and smooth marked compactification

Let \(M\) be a smooth closed oriented homotopy four-sphere, and let \(P\) be obtained by removing the interiors of finitely many pairwise disjoint smoothly parametrized closed standard four-balls. Give \(P\) a smooth Riemannian metric \(h\), exactly \(dt^2+\gamma\) on a collar of each boundary sphere. Here \(\gamma\) has sectional curvature one, \(t=0\) at the boundary and \(t\) increases out of \(P\), into the deleted ball. Use the prescribed markings in the product collars, so the caps can be glued back by the original parametrizations. Attach one copy of \([0,\infty)\times S^3\) with this product metric at each face, obtaining the smooth complete metric \(g_X\) on \(X\). If a different round angular parametrization is given, its comparison with the original marking extends over the standard ball by isotopy to an orthogonal map. Only the component statement of [Hatcher, *A proof of the Smale Conjecture*, Ann. of Math. 117 (1983), 553–607, p. 553](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf) is needed in that variant.

Choose a smooth positive multiplier \(f=1\) on \(P\) and on a short outward collar, and \(f=e^{-t}\) beyond a finite parameter on each end. On each end \(r=e^{-t}\) gives

$$
 e^{-2t}(dt^2+\gamma)=dr^2+r^2\gamma.
$$

Thus \(\widehat h=f^2g_X\) extends as a smooth metric over each added point using the standard radial smooth structure. With the boundary markings this compactification is the original oriented smooth type. The entire end metric is conformally flat because \(dt^2+\gamma\) is conformal to the flat punctured ball, including through the interval where \(f\) changes. The seam is a smooth product and has zero four-volume. Hence

$$
 E_+(\widehat h;M)=E_+(h;P)
$$

in the fixed positive chirality and Hilbert–Schmidt Weyl-operator convention. No initial Yamabe sign has been assumed. Two choices of \(f\) with the indicated tails give smoothly conformally related compactifications. The product hypothesis also fixes the collar regularity at the seam. Merely specifying a round induced boundary metric would leave the matching of higher normal jets unproved.

## The conformal change on Sobolev tests

Use \(\Delta=\operatorname{div}\nabla\), with nonpositive spectrum on a closed manifold, and write

$$
 Q_g(u)=\int(6|du|_g^2+R_g u^2)\,dV_g.
$$

On smooth tests \(w\) supported away from the added points, set \(u=fw\). The global conformal Laplacian identity is \(L_{\widehat h}w=f^{-3}L_{g_X}(fw)\), and gives \(Q_{\widehat h}(w)=Q_{g_X}(u)\) and \(\|w\|_{4,\widehat h}=\|u\|_{4,g_X}\). The compact \(L^2\) norm transforms as \(\|w\|_{2,\widehat h}^2=\int_X f^2u^2\,dV_{g_X}\). This calculation is on the punctured joined space, so there is no seam boundary term in conformal covariance.

The map really identifies the full compact \(H^1\) space with the ordinary, unweighted cylindrical \(H^1(X,g_X)\). To show this, choose \(C>0\) large enough that \(Q_{\widehat h}(w)+C\|w\|_{2,\widehat h}^2\) is an equivalent squared compact \(H^1\) norm and \(R_h+C\ge1\) on \(P\). Its transfer is \(Q_{g_X}(u)+C\int_X f^2u^2\,dV_{g_X}\). The transferred potential is at least one on \(P\) and is at least six on the rest, where the product scalar curvature is six. It is also bounded above, so this transferred form is equivalent to the unweighted squared \(H^1(X,g_X)\) norm. The compact smooth tests away from the added points are dense in compact \(H^1\). For each smooth w, use cutoffs at radii \(\epsilon\) and \(2\epsilon\) around those finitely many points. The squared gradient cost is \(O(\epsilon^2)\) per cutoff in four dimensions and the lost volume is \(O(\epsilon^4)\). Approximate general \(H^1\) functions by smooth functions before using these cutoffs. Compactly supported smooth tests are also dense on \(X\), by truncating each cylindrical tail and then smoothing. Multiplication by \(f\) is a bijection between the two dense smooth test spaces. The equivalence of norms extends it to an isomorphism and transfers the quadratic form to all tests. This justifies using noncompactly supported end solutions of finite unweighted energy.

## Eliminate each round cylinder

For a boundary trace \(\tau\in H^{1/2}(S^3)\), expand \(\tau=\sum_{k,\ell}\tau_{k\ell}Y_{k\ell}\) in an orthonormal real basis on the unit sphere. The spherical eigenvalues are \(-\Delta_\gamma Y_{k\ell}=k(k+2)Y_{k\ell}\), obtained by restricting degree-\(k\) homogeneous harmonic polynomials in \(\mathbb R^4\) and using the polar Laplacian. These span the spherical polynomials by homogeneous harmonic decomposition and are complete. Set \(A=\sqrt{1-\Delta_\gamma}\), so \(A Y_{k\ell}=(k+1)Y_{k\ell}\). The scalar cylinder form is

$$
 Q_{\rm cyl}(u)=6\int_0^\infty\int_{S^3}
 (|\partial_tu|^2+|d_{S^3}u|^2+|u|^2)\,dA_\gamma\,dt.
$$

For one mode \(a=k+1\), integration by parts gives

$$
 \int_0^\infty(|w'|^2+a^2|w|^2)\,dt
 =a|w(0)|^2+\int_0^\infty |w'+aw|^2\,dt .
$$

An \(H^1\) function on the half-line has limit zero at infinity, as follows from the integrability of \((w^2)'=2ww'\) and of \(w^2\). Thus the minimum is attained by the decaying mode \(w(t)=e^{-at}w(0)\), and for all modes together the minimizer \(e^{-tA}\tau\) is in \(H^1\) because \(\sum (k+1)|\tau_{k\ell}|^2<\infty\). The exact minimized cost is

$$
 6\langle\tau,A\tau\rangle
 =6\sum_{k,\ell}(k+1)|\tau_{k\ell}|^2.
$$

The pairing is a quadratic form on \(H^{1/2}\) with the unit-sphere induced area. The outward unit normal of the cylinder at \(t=0\) is \(-\partial_t\), giving the positive conormal \(6A\tau\). For the retained piece the zero-energy equation would use \(6\partial_{\nu_P}v+6A\tau=0\) at the interface. The constant mode costs six times its squared trace norm. The flat-ball harmonic Dirichlet-to-Neumann eigenvalues \(k\) alone would miss this term. In the marked product gauge the four-dimensional conformal factor contributes the extra one, and the compact metric equals the retained product near the seam.

## Necessary and sufficient condition at one index

Write \(\tau_b(v)\) for the trace on face \(b\). Define

$$
 F_h(v)=Q_{h;P}(v)+6\sum_b\langle\tau_b(v),A\tau_b(v)\rangle,
 \qquad v\in H^1(P).
$$

For every fixed retained \(v\), glue the minimizing extension \(e^{-tA}\tau_b(v)\) on each end. The matching traces give a global \(H^1(X)\) function with energy exactly \(F_h(v)\). Conversely every global \(H^1(X)\) test has energy at least \(F_h(v)\) for its restriction to \(P\), with the nonnegative surplus equal to the sum of the one-dimensional squares. If the restriction is zero and the global test is nonzero, its cylinder energy is strictly positive. By conformal transfer,

$$
 Y([\widehat h])>0\quad\Longleftrightarrow\quad
 F_h(v)>0\quad\text{for every nonzero }v\in H^1(P).
$$

For the implication from right to left, strict positivity of the compact quadratic form on every nonzero test makes the first conformal-Laplacian eigenvalue positive. It is attained by the direct method on the fixed closed smooth manifold. Bounded scalar potential and the positive eigenvalue then give control of the compact \(H^1\) norm by the form, and Sobolev gives a positive constant for the \(L^4\) denominator. The other implication follows at once from the positive Yamabe inequality and the minimizing extensions. The argument also distinguishes zero sign from negative sign. A negative test for \(F_h\) gives negative sign, whereas a nonnegative \(F_h\) with a nonzero zero test gives zero sign. In particular all compactly supported tests in the interior of \(P\) already have to pass their own test, since the boundary term vanishes on them.

Since \(A\ge1\) spectrally, the scalar Robin condition

$$
 Q_{h;P}(v)+6\sum_b\|\tau_b(v)\|_{2,\gamma}^2>0
 \qquad (v\ne0)
$$

suffices. In flux convention it is the coefficient \(+6\) in \(6\partial_{\nu_P}+6\), or coefficient \(+1\) after dividing the boundary operator by six. The implication uses the full \(H^1(P)\) form. Positive Dirichlet eigenvalue alone leaves the trace term to test, while the scalar Robin lower bound discards the additional cost on higher modes and is not asserted to be necessary.

For fixed \(h\), \(F_h+C\|v\|_2^2\) is equivalent to the squared \(H^1(P)\) norm for large \(C\), using the trace map and the bounded scalar term. The lowest \(L^2(P)\)-Rayleigh value of \(F_h\) is attained by compactness and is positive exactly when the test above holds. One finite certificate, if actual spectral enclosures are supplied, uses the positive form

$$
 B(v)=6\|dv\|_2^2+6\sum_b\langle\tau_b(v),A\tau_b(v)\rangle+\|v\|_2^2.
$$

Its \(L^2(P)\) eigenbasis has eigenvalues \(\nu_j\to\infty\). Write \(V=R_h-1\) and \(\beta=\|V\|_\infty\). On the first \(N\) eigenvectors of \(B\), let \(\mu_N\) be the smallest eigenvalue of the matrix for \(F_h\). On the orthogonal complement, \(F_h\ge(\nu_{N+1}-\beta)\|v\|_2^2\). The cross term is at most \(2\beta\|v_{\rm low}\|_2\|v_{\rm high}\|_2\) because \(B\) is diagonal in this decomposition. Thus \(\mu_N>0\), \(\nu_{N+1}>\beta\) and \(\mu_N(\nu_{N+1}-\beta)>\beta^2\) are a finite sufficient certificate. These inequalities eventually hold for each strictly positive fixed \(F_h\) by its positive lowest Rayleigh value. This is an analytic certificate, with no spectral enclosures computed here. A sequence requires the sign test at the indices where the competitor is used. No uniform Rayleigh gap of these retained forms has been proved or is needed for indexwise admissibility.

## Scope for entry and replacement

For a connected retained piece with nonempty boundary, \(R_h\ge0\) makes the scalar Robin form strictly positive. A zero test would have zero gradient and zero trace, and thus be the zero constant. This includes \(R_h>0\), as well as metrics with vanishing scalar on portions away from the round collars. A sign-changing sufficient case is \(\|(R_h)_-\|_\infty<6\lambda_{\rm Rob}\), where \(\lambda_{\rm Rob}>0\) is the first eigenvalue of \(-\Delta_h\) for the form \(\int_P|dv|^2+\sum_b\int_{S^3}|\tau_b|^2\). Its positivity follows in the same way using compactness. With no holes the criterion reduces to the closed form on \(P=M\), and the no-boundary case needs its own scalar positivity or eigenvalue hypothesis.

The sign conclusion concerns the compact conformal class. With the exact normalization \(f=e^{-t}\) at infinity, the added cap itself has some negative scalar curvature. Indeed nonnegative compactified scalar curvature on the cylinder would require \((\partial_t^2+\Delta_\gamma)f\le f\), so the spherical average \(m(t)\) would satisfy \(m''\le m\). Then \(e^{-t}(m'+m)\) is nonincreasing and vanishes in the tail, giving \((e^t m)'\ge0\) everywhere. It strictly increases where \(m=1\) near the seam, precluding the normalized tail \(e^t m=1\). A different representative of the same positive class supplies positive scalar curvature.

For a supplied marked \(h\), strict positivity of the form and \(E_+(h;P)<8\pi^2\) give positive subcritical entry directly on the original smooth type. The form can therefore certify an exterior construction before an initial positive closed source or a subcritical path is available. For a minimizing comparison, one may use it directly on the retained assembly and separately check strict chiral energy gain. No Weyl cost has been assigned to building \(h\) or to any splice that precedes the exact product boundary.

Conversely, a known positive closed class has such round-ended presentations with chiral energy arbitrarily close to its own. In normal coordinates at finitely many points, flatten the metric in small balls of radius \(\epsilon\) with cutoffs on annuli of comparable radii. The normal jets give \(g-\delta=O(\epsilon^2)\), \(Dg=O(\epsilon)\), and bounded second derivatives there. The modified metrics remain smooth, with bounded curvature on changed sets of volume \(O(\epsilon^4)\). Their energy tends to the original energy. The gradient densities converge uniformly and the scalar densities differ by an \(L^2\) term tending to zero, so the quadratic-form comparison with the fixed positive Yamabe inequality preserves positivity. Remove smaller balls in the exact flat germs and conformally make the new boundary collars unit products by the usual inverse-radius multiplier. Replacing the punctures by the round compactifications above returns the same conformal class of the flattened metric, since their factors differ by a smooth positive factor constant near each puncture. Thus the exterior formulation provides a test for a genuine construction, while supplying no general existence of a low-energy retained exterior on arbitrary hypothetical nonstandard smooth types. The same-type closure and subcritical threshold are independent checks.
