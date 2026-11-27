# Independent reading of the native scalar upper test

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded analytical reading under master B02. Actual serving model variant and reasoning effort were unavailable. Intake HEAD `48f36794f9b1`. The readback concerns the original smooth Riemannian \(L=2\operatorname{arcosh}5\), width-\(1/16\) metric, both isometric bands with radius-one caps, the unscaled three-cuff core, and the three original compactifications. Working Git blob prefixes were `6091cb595ce5` for the [Rayleigh note][rayleigh], `ddb5b8b7a6bd` for the [curvature identity][jets], `f103fccfd777` for the [marking bounds][harmonic] and `03f618c377cf` for the [exchange and exterior][exchange].

**Result.** The negative quadratic in the harmonic connection, the two scalar upper bounds, the near-face sign, the derivative constants and the original closed funnel correction all agree with an independent calculation. The upper Rayleigh bound requires certified metric values and integration to decide a sign.

## Scalar contraction and endpoint

The harmonic tension of the identity from the Euclidean domain to \(q_L\) is the Euclidean trace of its connection. Thus the planar entries \(S_{ab}\) determined by \(S_{11}=u,\ S_{12}=v,\ S_{22}=-u\) suffice. In the first-jet identity the differentiated-switch term is affine in \(S\), and the quadratic coefficient of the remaining connection terms is \(a^2 B G^{-1}B-aB=-W\) on its output slots. At \(0<a<1\), writing \(A_1=(1-a)A,\ B_1=aB\), the matrix \(W=B_1 G^{-1} A_1\) has inverse \(A_1^{-1}+B_1^{-1}\). Therefore its planar restriction \(W_P\) is positive definite. For a scalar symmetric \(2\times2\) matrix \(T\) comprising the components of \(S\) in an orthonormal basis for \(W_P\), the quadratic scalar contraction is
\[
 (\operatorname{tr}(MT))^2-\operatorname{tr}((MT)^2)
   =2\det(M)\det(T).
\]
Because \(\operatorname{tr}T=0\) in the Euclidean planar coordinates, this is \(-2\det M(T_{11}^2+T_{12}^2)\). Summing the two output components verifies the negative term in (1), including the factor of two and the sign. Completion of the square in each output variable gives \(1/(8\det M)\) multiplying the dual \(W_P^{-1}\)-norms of the two linear coefficients. From \(|\nabla dh_L|^2=2[q_L(u,u)+q_L(v,v)]\), the independent \(360\) bound and Cauchy–Schwarz give the factor \(360/\sqrt2\) in (3). [First-jet identity][jets] · [Harmonic bound][harmonic] · [Equations (1)–(3)][rayleigh]

For the \(a''\) term, put \(D=B-A\) and \(X=G^{-1}ds\). Contraction of the \(a''\,ds\otimes ds\otimes D\) term in the first-jet tensor has coefficient
\[
 D(X,X)-|ds|_G^2\operatorname{tr}_G D
 =-N^{-2}\operatorname{tr}_h(D|_{T\Sigma_s}).
\]
The end ratios in the actual trial bound this trace above by \(-40/7\) when \(a\ge7/8\). At the outer face put \(t=2-16s\). For \(t\downarrow0\), \(\alpha=1-a\) is asymptotic to \(\exp(-1/t+1/(1-t))\), \(a'\sim16t^{-2}\alpha\), and \(a''\sim-256t^{-4}\alpha\). Consequently the positive coefficient of \(a''\) dominates the terms of size \(O(\alpha+|a'|+(a')^2)\) in the envelope from (3). The endpoint continuity of the minimum envelope follows by squeezing it between the actual smooth \(R_G\) and the right-hand side of (3), both tending to zero at the flat ends. The estimates are uniform in the angles for this fixed smooth positive marking. [Band exchange and last outer layer][exchange] · [Envelope and flat ends][rayleigh]

## Metric-value and integral constants

For the Hessian bound, \(\Delta |S|^2\ge-12 E |S|^2\), with \(E=|dh_L|^2\), follows from commuting the pullback connection and using harmonicity. The curvature-\(-1\) estimate bounds each of the six resulting terms, with its multiplicity, by \(E|S|\). At a point within \(1/64\) of a native footprint the effective distance radius is \(85/128\). The comparisons
\[
 \frac{2(127/50)^2}{(85/128)^2}<30,\qquad
 \frac{2(127/50)^2}{(85/128-1/6)^2}<53
\]
hold by integer cross multiplication. The disk Green identity on radius \(1/6\), with \(\Delta E\ge2|S|^2\), bounds the \(S\)-square integral on radius \(1/12\) by \(53\pi/\log 2\). The subharmonic function \(|S|^2 e^{\sqrt{636}\,t}\) in the three-ball of radius \(1/12\) then bounds its center value by \(3e^{\sqrt{636}/12}53/[2(1/12)^2\log2]\). The inequalities \(e^{\sqrt{636}/12}<9\) and \(\log2>2/3\) make this less than \(154548<400^2\). For the first inequality use \(\sqrt{636}/12<13/6<\log9\), the latter following from the first three terms of \(4\operatorname{artanh}(1/2)\). For a center on the native footprint the analogous \(E<50\) and \(e^{\sqrt{600}/12}<8\) recover the strict \(360\) bound. The segment-to-stretch comparison uses only these derivative bounds. Image length gives the upper displacement bound with error \(400h/2\) after dividing by segment length \(h\), and the signed distance to the perpendicular geodesic gives the lower bound with error \((400+30)h/2\). Two position errors bounded by \(\eta\) give \(2\eta/h\). [Marking footprint and Hessian estimates][harmonic] · [Metric-value certificate][rayleigh]

In the actual core, the caps and compact retained product contribute zero to the quadratic form for the respective constant extensions. The radial weight on either band is \(NJ\,d\mu\,ds\), with \(|d\chi|_G^2=N^{-2}|\chi'|^2\). The two identical band inequalities therefore give the stated Neumann upper bound. For the original closed assembly let \(\beta=\chi(1/8)\). On each unscaled funnel the constant angular mode is \(v(r)=\beta(1-2\arctan(\sinh r)/\pi)\). It has \(\int_0^\infty\cosh r\,|v'|^2dr=(2/\pi)\beta^2\). Dividing by the original conformal multiplier \(w(r)\) yields an admissible extension on the compactified funnel. On the exact tail \(w\) is proportional to \(\operatorname{sech}r\), and the ratio is proportional to \(\arcsin(\operatorname{sech}r)/\operatorname{sech}r\), which is smooth and even in the disk radius coordinate at zero. The conformal boundary term vanishes since \(w\) is constant at the waist and \(w,\partial_r w=O(e^{-r})\) against area \(O(e^r)\) on the remote boundary. Thus the extra cost is exactly \(3\cdot6\cdot 4\pi L\cdot(2/\pi)\beta^2=144L\beta^2\) in the full closed test. This verifies an upper bound for the original Rayleigh numerator. A negative certified value would settle its sign. The fixed-width scalar signs and both chiral costs remain open here. [Original compactification][funnels] · [Core and full form][trace] · [Exchange of the two bands][exchange]

[rayleigh]: ../notes/THREE_CUFF_RAYLEIGH_20261127.md
[jets]: ../notes/FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md
[harmonic]: ../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md
[exchange]: ../notes/FIXED_WIDTH_BAND_TEST_20261127.md
[trace]: ../notes/HOPF_NEUMANN_TEST_20261127.md
[funnels]: ../../investigations-1/07_positive_subcritical_entry/notes/FUNNEL_EXTERIOR.md
