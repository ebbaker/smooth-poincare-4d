# Completing the hyperbolic pants metric on the retained exterior

26 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Selected lead Astra/ultra, exact serving settings unavailable. B02 construction after the obstruction for the [two inherited longitudes](HYPERBOLIC_EXTERIOR.md). Use the very same marked pants, embedded tubes, cap disk coordinates and closing as the [first trial](MARKED_CONNECTION_ASSEMBLY.md). This construction supplies a complete exterior with zero Weyl energy away from two finite transition bands.

Give the marked pants \(F\) a hyperbolic metric with geodesic boundary. For each boundary curve write its length as \(2\pi\ell\), use its angular arclength coordinate \(\eta\) of period \(2\pi\), and attach a hyperbolic funnel with metric \(dr^2+\ell^2\cosh^2r\,d\eta^2\), \(r\ge0\). The collar on the inside has the same formula in signed distance. On the completed surface times the unit sphere the product has scalar curvature zero and both Weyl blocks zero. Fix the smooth nondecreasing step \(H\) of the first trial. On each funnel let \(h(r)=H(2r-1)\) and set
\[
 B=\int_0^\infty h(s)\tanh s\,\mathrm{sech}\,s\,ds>0,\qquad
 u(r)=B^{-1}\int_r^\infty h(s)\tanh s\,\mathrm{sech}\,s\,ds .
\]
Use \(u=1\) on \(F\). It is constant near the join and for \(r\ge1\) equals \(B^{-1}\mathrm{sech}\,r\). Multiply the four-metric by \(u^2\). With \(\Delta=\operatorname{div}\nabla\),
\[
 R_{u^2g}=-6u^{-3}\Delta_g u,\qquad
 (\cosh r\,u')'=-B^{-1}\big(h'\tanh r+h\,\mathrm{sech}^2 r\big)\le0 .
\]
Thus scalar curvature is nonnegative everywhere and strictly positive on the funnel tails. For \(r\ge1\) put \(v=\arcsin(\mathrm{sech}\,r)\), \(dv=-\mathrm{sech}\,r\,dr\). The metric is exactly
\[
 B^{-2}\big(dv^2+\sin^2 v\,g_{S^2}+\ell^2 d\eta^2\big).
\]
At \(v=0\) the round two-spheres collapse smoothly, leaving the circle parameter \(\eta\). This attaches precisely \(\partial F\times D^3\) to \(F\times S^2\) by the untwisted product marking on every boundary component. The space is the same smoothed \(\partial(F\times D^3)\). To identify it with the first construction fix the identity on the compact face containing the two tubes, use arclength reparametrization on each boundary circle and an increasing collar parametrization for the normal disk radius. These give an orientation-preserving diffeomorphism through each rounded corner. The three fillings contain no relator tubes. The resulting closed presurgery metric has both Weyl tensors zero and positive Yamabe sign by its scalar curvature and connectedness. Restrict the metric to the complete retained region outside the two transition bands. It keeps a region with strictly positive scalar curvature, and its Weyl energy remains zero up to and including the exact outer germs.

Use two positive-facing radius-one hyperbolic disk caps as in the changed trial. On \(0\le s\le1/8\) of both marked tubes, the same convex tensor interpolation as in the first trial now connects the exact cap product to the hyperbolic pants product. Use the hyperbolic pants compactification just constructed everywhere else. One may instead use any smooth positive definite transition on those bands that agrees near both ends. These are smooth closed competitors on the fixed \(M\). Writing \(U_1,U_2\) for the two bands, each has the exact accounting
\[
 E_\pm(M)=E_\pm(U_1)+E_\pm(U_2).
\]
Here and below the integrands use that particular assembled metric. On each band, a zero combined cost is impossible by the longitude holonomy argument. No numerical lower bound approaching the closed budget follows.

The scalar curvature is nonnegative off the bands and strictly positive on an open part of the retained ends. Thus the closed sign is positive if the transitions can be made scalar-nonnegative. More quantitatively, take a nonzero smooth nonnegative potential supported in one of the positive retained tail regions, with \(V\le R\) there. For each smooth connected trial set
\[
 \Lambda(g,V)=\inf_{f\ne0}\frac{6\int_M |df|_g^2+\int_M V f^2}{\|f\|_{L^4(g)}^2}>0 .
\]
Indeed compactness in \(L^2\) and control of constants by \(V\) give a positive first eigenvalue and coercivity in \(H^1\). The continuous critical Sobolev embedding \(H^1\to L^4\) then gives the strict lower bound. Hölder gives a sufficient condition for a positive closed Yamabe sign:
\[
 \big(\|R_-\|_{L^2(U_1)}^2+\|R_-\|_{L^2(U_2)}^2\big)^{1/2}<\Lambda(g,V).
\]
The exterior and the caps now contribute exactly zero to both energy budgets and zero scalar deficit. A fixed retained potential has no uniform positive bound for \(\Lambda\) over unrestricted band metrics, as the volume-inflation example in the [independent reading](../reviews/FUNNEL_READBACK.md) shows. Quantitative upper bounds on the two costs remain open. This supplies a concrete successor on the specified marked smooth type. The standalone Robin problem on the Mazur half is independent of this assembly.
