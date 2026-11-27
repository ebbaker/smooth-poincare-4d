# SP4-CUT-SEAM-E12 — Axial moments of the short-axis cap

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI assistance. Requested GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. Working HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Inputs are the [frozen request r1](../research-progress/handoffs/E12_REQUEST_R1.md), SHA-256 `cd53d3fa6aabaf62b84c616d810829836c99148ab64bf1eff5c5790a1ad27d9c`, and [E19](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md), SHA-256 `5333dc4d1816e7ee2c320dee26b93814842a4a9debfc98ddac05a48d23e4148e`, with the other frozen input versions as listed in the request. The derivation uses the [paired-filling reduction](B04_PAIRED_FILLING.md), [marked identification](../reviews/E11A_INTEGRATION.md) and [short-axis return](../../03_tubes_and_exteriors/research-progress/handoffs/TO_SEAM_SHORT_AXIS_RESULT_20261127.md).

**Result.** The axial equation excludes every smooth invariant diagonal cap in the E19 normalization with \(\mathcal V=\int a\,ds\le\mathcal V_*\), where \(\mathcal V_*\) is the exact constant below, approximately \(0.383811\). Over arbitrary normalized volume it also excludes the class with mean squared normalized collapsing-axis length \(\int a^3\,ds/\int a\,ds\le2/5\). Both exclusions hold for the smaller block \(E_+\) in E19's outward-first quaternion orientation and require no scalar or Robin hypothesis. A direct transgression gives \(E_+-E_-=-5\pi^2\).

## Gauge and actual marked end data

Work on the smooth oriented projective-plane normal disk bundle with \(i\) collapsing. In horizontal-area-one gauge write
\[
 g=ds^2+a^2\sigma_1^2+e^{-2u}\sigma_2^2+e^{2u}\sigma_3^2,\qquad
 d\sigma_i=2\sigma_j\wedge\sigma_k
\]
in cyclic order, with the positive volume convention \(ds\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\). The principal orbits are \(Q_8\backslash S^3\) and \(\int\sigma_1\wedge\sigma_2\wedge\sigma_3=\pi^2/4\), from the unit round volume \(2\pi^2\) and the covering degree eight. A smooth diagonal invariant cap has \(a>0\) away from the bolt. At the bolt \(a(s)=4s+O(s^3)\), \(u(s)=u_1s+O(s^3)\). The order-four collapsing circle has period \(\pi/2\), so smooth Euclidean polar circumference sets \(a_s(0)=4\). The horizontal isotropy fixes the common length, and its traceless symmetric tensor has the weight of the normal slice. This gives the odd horizontal anisotropy jet in E19. The smoothness assertions here assume a smooth cap with those actual bolt jets. The displayed expansions are used only as necessary endpoint data.

At the totally geodesic face the orbit lengths are \((A,A,\sqrt3 A)\), with \(A=3^{-1/4}\). Thus \(a=A,\ u=(\log3)/4,\ a_s=u_s=0\). The \(j\)-switch interchanges \(i,j\) and negates \(k\), so it preserves this metric and uses the two distinct short-axis fillings of B04. No interchange of the long axis with the collapsing axis enters the calculation. A smooth diagonal invariant metric with an arbitrary common horizontal scale can first be conformally normalized to this gauge, using its positive product of horizontal lengths. The Hodge splitting and chiral integrals are conformally invariant.

Set
\[
 v=\int_0^s a(\hat s)\,d\hat s,\quad \mathcal V=v(s_{\rm face}),\quad
 z=a^2,\quad P=2\cosh(2u),\quad d=2\sinh(2u),\quad
 J=d^2/z+z(u')^2 ,
\]
where primes denote \(v\) derivatives. Since \(v=2s^2+O(s^4)\), the bolt values of \((z,z',P)\) are \((0,8,2)\). Their face values are \((1/\sqrt3,0,4/\sqrt3)\). Near the bolt \(u'=O(v^{-1/2})\), \(d=O(v^{1/2})\), \(z=8v+O(v^2)\), and \(J\) and \(P'\) are bounded. All integrations below can be made first away from the singular orbit and then passed to the limit with these estimates.

## Axial equation and exponentials

For \(a_i=(a,e^{-u},e^u)\), E19 uses \(k_i=(a_i)_s/a_i\), \(\mu_i=2a_i/(a_ja_k)\) and \(f_i=(\mu_j+\mu_k-\mu_i)/2\). Its spin-independent Cartan formulas give \(A_1=-a_{ss}/a\), \(T_1=f_1\mu_1-f_2f_3-k_2k_3\), \(M_1=-\mu_1k_1+f_3k_2+f_2k_3\). Substituting \(f_1=P/a-a,\ f_2=a+d/a,\ f_3=a-d/a\) yields
\[
 T_1=2P-3a^2+d^2/a^2+u_s^2,\qquad M_1=-2a_s+2(d/a)u_s .
\]
Also \(\sum_i A_i=-a_{ss}/a-2u_s^2\) and \(\sum_i T_i=2P-a^2-d^2/a^2+u_s^2\). For the second sum, \(\sum f_i\mu_i=4P-2a^2-2d^2/a^2\), \(\sum_{\rm cyc}f_jf_k=2P-a^2-d^2/a^2\), and \(\sum_{\rm cyc}k_jk_k=-u_s^2\). This reproduces \(R/2\) in E19.

Let \(\lambda_i^\pm=(A_i+T_i)/2-R/12\pm M_i\) and \(V_+=\lambda_1^+\), \(W_+=\lambda_2^+-\lambda_3^+\). The positive block is the compression in the basis \((e^{0i}+e^{jk})/\sqrt2\). The traceless block has HS squared norm \((3V_+^2+W_+^2)/2\), so the orbit volume gives
\[
 \frac{E_+}{\pi^2}=\frac18\int_0^{\mathcal V}(3V_+^2+W_+^2)\,dv.
\]
Using \(a_s=z'/2,\ a_{ss}/a=z''/2,\ u_s=a u'\) and \(P'=2du'\), the axial equation is
\[
 6V_+=-(D+2)(D+4)z+4P+6P'+4J,\qquad D=\partial_v .
\]
For \(\phi_k=e^{k(v-\mathcal V)}\), \(k=2,4\), the adjoint operator kills \(\phi_k\). Integrating by parts at both endpoints gives the exact moments
\[
 6\int_0^{\mathcal V}\phi_k V_+\,dv
 =\frac{k+18}{\sqrt3}-4e^{-k\mathcal V}
   +\int_0^{\mathcal V}\phi_k[(4-6k)P+4J]\,dv .
\]
The boundary term is \([-\phi_k z'+(\phi_k'-6\phi_k)z+6\phi_k P]_0^{\mathcal V}\), which fixes the signs.

## Short normalized volume and an all-length class

For \(k=2\) the square \(z(u'+d/z)^2=J+P'\) gives an exact form with only endpoint forcing and a nonnegative remainder:
\[
 6V_+=-(D+2)(D+4)z+2(D+2)P+4z(u'+d/z)^2,
\]
\[
 6\int\phi_2V_+\,dv
 =\frac4{\sqrt3}+4e^{-2\mathcal V}+4\int\phi_2 z(u'+d/z)^2\,dv .
\]
Because \(J\ge |P'|\), the square is at least \(2(P')_+\). Also \(\phi_2\ge e^{-2\mathcal V}\) and \(\int (P')_+\ge4/\sqrt3-2\). Consequently
\[
 6\int\phi_2 V_+\,dv\ge A_0+C_0 x,\qquad
 x=e^{-2\mathcal V},\quad A_0=\frac4{\sqrt3},\quad C_0=\frac{32}{\sqrt3}-12 .
\]
Cauchy–Schwarz, \(\int\phi_2^2=(1-x^2)/4\) and the axial part of the HS norm give
\[
 \boxed{\quad \frac{E_+}{\pi^2}\ \ge\
        \frac{(A_0+C_0 x)^2}{24(1-x^2)}.\quad}
\]
The right side increases strictly in \(x\in(0,1)\). It is at least \(3/2\) exactly when \(x\ge x_*\), where
\[
 x_*=\frac{-A_0 C_0+6\sqrt{C_0^2+36-A_0^2}}{C_0^2+36},
 \qquad \mathcal V_*=-\tfrac12\log x_* .
\]
The decimal value above is diagnostic. An elementary strict comparison is \(x\ge1/2\), when \(A_0+C_0x\ge20/\sqrt3-6>3\sqrt3\) since \(11>6\sqrt3\). Thus \(\mathcal V\le(\log2)/2\) already gives a strict energy excess. The E19 profile has
\[
 \mathcal V_{\rm E19}
 =\frac L2\left(\frac{4L}{3}+\frac{3A}{4}
       -\frac{0.235767}{12}+\frac{0.148703}{30}-\frac{0.047647}{60}\right)
 <\frac14.
\]
The formula is the exact integral of \(p(q)\) in E19. The strict bound uses \(L<2/5,\ A<4/5,\ 0.148703/30<1/200\) and drops two negative terms. It is independent of interval enclosure of the curvature.

For a length-unrestricted class integrate the axial equation unweighted using \(J\ge P'\). Write \(B_0=34/\sqrt3-12>0\) and \(\bar z=\mathcal V^{-1}\int_0^{\mathcal V} z\,dv\). Then \(P\ge2\) gives
\[
 6\int_0^{\mathcal V} V_+\,dv
 \ \ge\ B_0+8(1-\bar z)\mathcal V .
\]
If \(\bar z<1\), Cauchy–Schwarz and the arithmetic–geometric mean inequality give
\[
 \frac{E_+}{\pi^2}\ge
 \frac{[B_0+8(1-\bar z)\mathcal V]^2}{96\mathcal V}
 \ge \frac{B_0}{3}(1-\bar z).
\]
In particular \(\bar z\le2/5\) implies \(E_+/\pi^2\ge B_0/5>3/2\), since \(68^2>3\cdot39^2\). This is a geometric average in the defined gauge, \(\bar z=\int a^3\,ds/\int a\,ds\). A necessary condition for a strict trial in this diagonal family is \(\mathcal V>\mathcal V_*\) and \(\bar z>1-9/(2B_0)\), whose latter diagnostic value is approximately \(0.410216\). The average condition by itself supplies no upper energy or Robin estimate.

## Direct signed transgression and normalization checks

Set \(X_i^\epsilon=-(a_i)_s+\epsilon f_i a_i\), \(\epsilon=\pm1\), so that \(\omega_{0i}+\epsilon\omega_{jk}=X_i^\epsilon\sigma_i\). Cartan's second equation gives
\[
 \Omega_{0i}+\epsilon\Omega_{jk}
  =d(X_i^\epsilon\sigma_i)-\epsilon X_j^\epsilon X_k^\epsilon
       \sigma_j\wedge\sigma_k .
\]
The sum of wedge squares of these curvature forms over both signs and all \(i\) is \(2(|W^+|^2_{\rm HS}-|W^-|^2_{\rm HS})\,dV_g\). Indeed, division of each curvature form by \(\sqrt2\) gives the curvature-operator image of one normalized chiral frame element. In the sum of \(\langle \zeta,*\zeta\rangle\) over the images the two trace-free Ricci contributions cancel by symmetry, and the equal scalar contributions cancel because the Weyl blocks are trace-free. Wedge squaring the displayed connection forms and integrating the orbit gives
\[
 \frac{E_+-E_-}{\pi^2}
 =\frac14
 \left[\sum_{\epsilon=\pm 1}
 \left(\sum_i (X_i^\epsilon)^2-\epsilon X_1^\epsilon X_2^\epsilon X_3^\epsilon\right)
 \right]_{\rm bolt}^{\rm face}.
\]
At the bolt, using \(d/a\to u_1\), the triples are \(X^+=(-2,2u_1,-2u_1)\), \(X^-=(-6,0,0)\). Their respective polynomials are \(4\) and \(36\), independent of \(u_1\). At the marked face \(f_i a_i=(\sqrt3,\sqrt3,-1)\), \(X_i^\epsilon=\epsilon f_i a_i\), and each polynomial is \(10\). Thus \((20-40)/4=-5\), with no residual bolt term or sign convention inferred from numerical ordering.

This is consistent with the marked ledger, where \(\eta=-5/12\), real signature is zero and the totally geodesic boundary has no second-fundamental-form correction. The product-boundary version of the Atiyah–Patodi–Singer theorem applies after smoothing the outer jets to product in a shrinking collar. The curvature integrals converge because the initial metric and product agree through first order and their cutoff second derivatives remain bounded. The boundary metric and eta are fixed. The direct endpoint derivation above supplies the signed difference independently of the eta computation. [Marked eta calculation](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md) · [APS I, Theorem (4.14), printed p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24)

For two copies with the exact \(j\)-switch, orientation reversal on the second copy exchanges the blocks. The limiting glued chiral energy is \(E_++E_-=2E_++5\pi^2\) in either sign. Hence the strict \(2T=8\pi^2\) budget really requires \(E_+<3\pi^2/2\), and the two exclusions above reach that threshold. The separately required whole-side Robin sign remains part of a successful construction.

**Primary passages.** Atiyah–Hitchin–Singer, *Self-duality in four-dimensional Riemannian geometry*, §1, Eq. (1.1) and the following decomposition, printed p. 427, supplies the trace-free diagonal block convention for oriented real Riemannian four-metrics. Checked the [local primary copy](../../../../../references/Atiyah.pdf), PDF p. 4. The APS passage above was checked for its compact oriented product-boundary hypothesis. All bolt, axial, and transgression factors were evaluated in E19's frame.

The estimates return a rigorous short-volume exclusion, an all-length exclusion under the displayed average condition, and a signed check of both endpoint jets. They leave longer caps with larger normalized mean in the diagonal family, along with the unrestricted filling and its Robin sign, open.
