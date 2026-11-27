# Why the negative Berger germ cannot occur in an entering metric

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex. Selected research lead Astra/ultra, with bounded Sol/ultra assignments and independent readings. Actual serving model and effort were unavailable. Working base bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. The [frozen germ](../research-progress/handoffs/E06_GERM.md), [previous first-width question](../brainstorm/notes/FIRST_WIDTH_IMPASSE_20261127.md) and [meridian formula](GLOBAL_AREA_TEST_20261127.md) are the inputs. This is a smooth oriented Riemannian calculation.

**Result.** No smooth metric on a homotopy four-sphere carrying the prescribed Berger first and second fundamental forms can have either closed chiral Weyl energy below \(75\pi^2\). The entering threshold is \(8\pi^2\). For the exact collar germ the obstruction is visible on each side separately. Each cap has \(4\int_V\sigma_2(A)\,dV<-67\pi^2\). There are smooth closed completions of this germ. On the explicit one below, an angular sweepout excludes the central orbit from the fundamental-class first width.

## The marked central orbit

Take the dual coframe to the left-invariant fields \(X_i(q)=q\mathbf e_i\) on the unit quaternions. Thus \(d\sigma_i=-2\sigma_j\wedge\sigma_k\) cyclically and \(\int_{S^3}\sigma_{123}=2\pi^2\). Orient the collar by \(ds\wedge\sigma_{123}\). The lower cap has outward normal \(+\partial_s\). Write \(c=1/16,\ t=\sqrt{65}/4,\ b=1/\sqrt8\), and take
\[
 h=\sigma_1^2+\sigma_2^2+t^2\sigma_3^2,\qquad
 B=\operatorname{diag}(b,-b,0)
\]
in its orthonormal frame, with \(B(X,Y)=g(\nabla_X\nu,Y)\). Set \(g=ds^2+\sum_i(a_i^0)^2\sigma_i^2\) near zero, where
\[
 \log a_1^0=bs-\tfrac{67}{32}s^2,\quad
 \log a_2^0=-bs-\tfrac{67}{32}s^2,\quad
 \log a_3^0=\log t+\tfrac{129}{32}s^2 .
\]
The central area is \(2\pi^2t=\pi^2\sqrt{65}/2\). The intrinsic scalar curvature is \(-1/8\), while the ambient \(\operatorname{Ric}=cg\), \(R=1/4\) and \(\sigma_2(A)=c^2/6=1/1536\) there, with \(A=(\operatorname{Ric}-Rg/6)/2\). The two ambient inequalities persist on a neighborhood. The central minimal orbit has Jacobi index one and nullity zero. These local facts were established in [E06](../research-progress/handoffs/E06_GERM.md).

## Signed energy determined by the cut

Let \(E_\pm(V)=\int_V |W^\pm|_{\mathrm{HS}}^2\,dV\) in the curvature-operator convention, and put \(D(V)=E_+(V)-E_-(V)\). The signature identity for a product-collar comparison and the transgression back to the actual metric give
\[
 D(V)=12\pi^2\big(\tau(V)+\eta(\partial V,h)\big)
             +\int_{\partial V}\sum_i B_i\wedge(d^\nabla B)_i .
\]
Here \(B_i=B_{ij}e^j\) in a tangential orthonormal coframe. The metric variation uses the outward normal on each side. The odd-signature eta is on even forms with zero eigenvalues omitted. Both caps are homology balls by Mayer–Vietoris for the separating \(S^3\) in a homotopy sphere, so \(\tau(V)=0,\chi(V)=1\). This uses no smooth classification of either filling. [Atiyah–Patodi–Singer, Theorem 4.14](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24) · [Actual boundary correction](../research-progress/handoffs/E16_BERGER_LEDGER.md).

In the chosen lower boundary orientation, integration from the round orbit gives \(\eta(h_t)=-2(t^2-1)^2/3\). Direct differentiation of \(B\) in the Berger connection gives \(\operatorname{curl}B=(t-4/t)B\). Its integral contribution is \(4\pi^2b^2(t^2-4)\). On the upper boundary the normal change negates \(B\) and \(d^\nabla B\) together, and the orientation reversal changes the sign of the integral. [Cotton variation and covariant derivative](../research-progress/handoffs/E16_BERGER_LEDGER.md).

| Outward-oriented cap | \(12\pi^2\eta\) | Extrinsic correction | \(D(V)\) |
| --- | ---: | ---: | ---: |
| \(s<0\) | \(-2401\pi^2/32\) | \(+\pi^2/32\) | \(-75\pi^2\) |
| \(s>0\) | \(+2401\pi^2/32\) | \(-\pi^2/32\) | \(+75\pi^2\) |

The polar-frame calculation fixes the integer framing ambiguity independently. For \(u_i=a_i'\), \(v_i=(a_j^2+a_k^2-a_i^2)/(a_ja_k)\), the tangential Chern–Simons form of the ambient connection is \(4P\sigma_{123}\), where
\[
 P=\sum_i(u_i^2+v_i^2)-v_1v_2v_3-\sum_{\rm cyc}v_i u_j u_k .
\]
Both polar references have \(v_i\to1\) and \(u_i\to+1\) at the lower pole, \(-1\) at the upper pole. Both give \(P=2\). At the cut, \(v=(t,t,2-t^2)\), \(u=(b,-b,0)\), giving \(P-2=2(t^2-1)^2+b^2(4-t^2)=75/4\). Since \(D=-4\pi^2[P]_{\mathrm{initial}}^{\mathrm{final}}\) on a regular annulus, this reproduces both entries with their actual polar gauges. The boundary identity above extends the result to nonsymmetric interiors. [Polar connection and trace derivation](../research-progress/handoffs/E17_POLAR_TRANSGRESSION.md) · [independent reading](../reviews/BERGER_FLUX_REPLAY.md).

The homotopy sphere has \(E_+(M)=E_-(M)=e\). Nonnegativity gives \(e\ge75\pi^2\). Equality would force \(W^+=0\) on the lower side and \(W^-=0\) on the upper side. Continuity would give \(W=0\) on the cut, contrary to its nonzero magnetic block \(\operatorname{sym\,curl}B\). Hence \(e>75\pi^2\). Closed Weyl energy is conformally invariant in dimension four, so changing the closed conformal representative cannot restore entry.

## A negative Schouten integral on each cap

Conjugation by \((\mathbf i+\mathbf j)/\sqrt2\) defines an orientation-preserving involution \(\phi\) of \(S^3\), interchanging the first two axes and negating the third. The **full** specified germ has \(\phi^*h_{-s}=h_s\). Double either cap with a reversed copy of itself over \(\phi\). All normal derivatives agree in the reflected collar chart. The result is smooth, has Euler characteristic two and has twice the original total Weyl energy and twice the Schouten integral. This works separately for two unrelated interiors. Chern–Gauss–Bonnet on this double gives
\[
 8\pi^2=E_+(V)+E_-(V)+4\int_V\sigma_2(A)\,dV .
\]
The factor four comes from \(A_{\rm CGY}=2A\). On the central orbit the magnetic block has zero \(33\) entry and the electric entry is \(2c/3-2t^2=-97/12\), from \(K_{\nu3}=c-2t^2\) and the central Einstein condition. Both chiral blocks are therefore nonzero in a collar on both sides. It follows that \(E_+(V)+E_-(V)>|D(V)|=75\pi^2\). Each cap has negative \(\sigma_2(A)\) somewhere in its interior, despite the strictly positive value at the cut. [Chang–Gursky–Yang, (0.2)](https://arxiv.org/pdf/math/0409583#page=2) · [doubling and strictness check](../reviews/BERGER_FLUX_REPLAY.md).

## Complete two-pole area test

To specify one smooth metric take \(-1/4\le s\le1/4\) and put \(r=1/4-|s|\). With \(F(v)=e^{-1/v}\) for \(v>0\) and zero otherwise, set \(z=32|s|-1\), \(\chi=F(1-z)/(F(z)+F(1-z))\). On regular orbits set
\[
 a_i=\exp\big(\chi\log a_i^0+(1-\chi)\log\sin r\big).
\]
This preserves the exact collar for \(|s|\le1/32\) and gives the unit round sine metric for \(r\le3/16\) at each pole. The ordinary charts \(y=rq\in\mathbb R^4\) close both ends smoothly on the standard \(S^4\), with \(a_i'\to+1,-1\) respectively in the common \(s\) coordinate. The polar neighborhoods have \(R=12\), \(\sigma_2(A)=3/2\). Each midpoint orbit \(s=\pm3/64\) has \(R<-32050\) by direct differentiation of this cutoff. The negative Schouten integral on each cap follows independently of this scalar witness. [Profiles, pole charts and midpoint estimates](../research-progress/handoffs/E18_SHORT_SUSPENSION.md).

For \(D_0=\{\operatorname{Re}q=0\}\) adjoin the two poles. This gives a smooth embedded minimal three-sphere. Its area in the actual metric, including the sine ends, is
\[
 I=\int_{-1/4}^{1/4}\int_{S^2}
        \sqrt{(a_2a_3)^2\omega_1^2+(a_3a_1)^2\omega_2^2
                     +(a_1a_2)^2\omega_3^2}\,d\omega\,ds.
\]
The cofactor bound \(a_ja_k<3\) on the central interval of length \(1/8\) and the exact polar integrands \(\sin^2r\) give \(I<777\pi/512\). A separate integer interval integration gives
\[
 1.901985\ \le I\le\ 1.903738
 \quad\text{while}\quad \operatorname{Area}(\Sigma_0)=\pi^2\sqrt{65}/2\simeq39.7856473 .
\]
An independent tensor quadrature at orders 48 and 72 returned \(1.90292651462645\) to the displayed precision. The enclosure above is the certified result. [Area certificate](../numerics/berger_meridian_area.py) · [calculation record](../research-progress/handoffs/E21_ANGULAR_AREA.md).

For \(-1<z<1\), take the boundary currents of the increasing sublevel sets \(\{\operatorname{Re}q<z\}\) on the regular part. On the angular level \(q=z+\sqrt{1-z^2}\,\omega\), the round unit normal has components \(-\omega_i\) in the left frame. The cofactor is unchanged and the round two-area acquires the factor \(1-z^2\). The mass is exactly \((1-z^2)I\). In either pole chart the slice is a finite-perimeter cone, with mass at most \(4\pi\epsilon^3/3\) in a polar ball of radius \(\epsilon\), uniformly in \(z\). The sublevel volumes vary continuously from empty to full. Their boundaries are flat-continuous with no mass concentration, and the filling differences telescope to the fundamental class. Continuous-to-discrete interpolation yields
\[
 \mathbf W_1(g)\le I<\operatorname{Area}_g(\Sigma_0).
\]
This proves a strict first-width exclusion on the **specified nonentering metric**. It uses a sweepout transverse to the orbits and establishes no value for the exact first width. [Zhou, Theorems 5.5 and 5.8](https://arxiv.org/pdf/1210.2112v2) · [independent sweepout reading](../reviews/BERGER_COMPLETION_REPLAY.md).

## Which changes could reopen the question?

Within the original E06 family with \(\delta=t^2-4\in(0,1/16]\) and \(b^2=1/16+\delta\), the boundary defect has magnitude \(\pi^2(72+191\delta/4+4\delta^2)\). The entire interval exceeds the entering threshold. [Family computation](../reviews/BERGER_FLUX_REPLAY.md).

Even freeing the magnitude of the horizontal shear while keeping the endpoint \(h\) and \(B=\operatorname{diag}(b,-b,0)\) cannot give an index-one cut in an entering gauge. The boundary formula would require \(2145/8<b^2<2657/8\) for \(|D|<8\pi^2\). Each real quaternionic coordinate is an eigenfunction of \(-\Delta_h\) with eigenvalue \(2+t^{-2}=146/65\), since \(X_i^2 f=-f\). On the span of one coordinate and the constant, the Dirichlet quotient is at most \(146/65\). With \(\operatorname{Ric}(\nu,\nu)>0\), index one for the Jacobi operator forces \(2b^2<146/65\), even allowing nonconstant normal Ricci curvature. In an entering gauge the positive Ricci premise follows from \(R>0,\ \sigma_2(A)>0\). The incompatible bounds exclude this alteration on the same central orbit. [Independent shear calculation](../reviews/BERGER_SHEAR_REPLAY.md).

The general G3 question remains open for different marked Cauchy data. The [continuation](../continuation-notes/AFTER_BERGER_OBSTRUCTION_20261127.md) gives a different intrinsic three-metric to test and the boundary condition it is designed to satisfy.
