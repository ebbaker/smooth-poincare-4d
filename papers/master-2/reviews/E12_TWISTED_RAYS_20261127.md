# M2-E12 · Constant half-rays on the twisted tube

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving variant and reasoning effort unavailable. Working base `6a422ce`, with the [frozen revision 1 request](../research-progress/handoffs/REQUEST_M2_TWISTED_MODEL_20261127.md) and the [LINE return](../../investigations-2/03_lines_and_broken_fibrations/research-progress/handoffs/TO_MASTER2_LAST_CIRCLE_20261127.md). The local calculation assumes the prepared exact form and adapted almost complex structure. The global comparison uses LINE B02's positive capped \(Y\), actual marked line and irreducible weight-one component.

**Local calculation.** An equivariant union of three distinct equatorial half-rays and both axial half-rays, all with weight one, has signed meridional degree \(+1\). The same twisted tube also admits a single weight-one equatorial half-sheet with a smooth embedded boundary collar of degree \(+1\). Both statements concern the exact tube.

## Model and deck action

Let \(L>0\) be the length of the base circle in the model metric. On \(\widetilde N=(\mathbb R/2L\mathbb Z)\times B_R^3\), use the flat metric \(g_0\), the orientation \(dt\wedge dx\wedge dy\wedge dz\), and
\[
\begin{aligned}
\omega={}&dt\wedge(x\,dx+y\,dy-2z\,dz)
            +x\,dy\wedge dz-y\,dx\wedge dz-2z\,dx\wedge dy,\\
\lambda={}&(x^2+y^2+4z^2)^{1/2}.
\end{aligned}
\]
This is Taubes's self-dual model, with \(|\omega|_{g_0}=\sqrt2\lambda\) in the master norm. Use the convention \(g_0(Ju,v)=\omega(u,v)/\lambda\) off the zero set, so \(\omega(u,Ju)=\lambda|u|^2\). The displayed endomorphism in Taubes (1.4) has the opposite sign with this convention: its first line gives \(\omega(\partial_t,J_{(1.4)}\partial_t)=-\lambda\) when paired with the displayed form (1.1). Either endomorphism gives the same invariant tangent planes. All orientations below use the positive \(\omega\) restriction, consistent with Taubes's Definition 1.2 and the sign \(p-q\) in the proof of Proposition 4.1. [Taubes, *The structure of pseudo-holomorphic subvarieties*, pp. 222–224, 231–232, 251–252](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

Take the twisted quotient \(N=\widetilde N/\langle D\rangle\), with
\[
D(t,x,y,z)=(t+L,x,-y,-z).
\]
The deck action preserves each term of \(\omega\), the metric and the ambient orientation, so it preserves \(J\). Its restriction to the normal fibre is a rotation through \(\pi\) about the \(x\)-axis. The negative eigenline of \(\operatorname{diag}(1,1,-2)\) reverses, while the positive plane carries the reflection \((x,y)\mapsto(x,-y)\). Thus the quotient has twisted zero circle \(Z\), and \(\widetilde Z=\{x=y=z=0\}\) covers \(Z\) twice. This action is the standard twisted mapping torus of the same form. [Perutz, *Zero-sets of near-symplectic forms*, §2, pp. 241–242](https://intlpress.com/site/pub/files/_fulltext/journals/jsg/2006/0004/0003/JSG-2006-0004-0003-a001.pdf)

## Signs, area and boundary

For a unit vector \(v\), write \(C_v=\{(t,sv):0<s<R\}\). The equatorial vectors are \(e_\theta=(\cos\theta,\sin\theta,0)\), and the axial vectors are \(a_\pm=(0,0,\pm1)\). The parametrization has orthonormal coordinate vectors \((\partial_t,\partial_s)\), with \(\partial_s\) always directed radially outward, including on the negative axial ray. From \(J\partial_t=(x\partial_x+y\partial_y-2z\partial_z)/\lambda\), the plane they span is \(J\)-invariant in both cases. The pullbacks of \(\omega\) are \(s\,dt\wedge ds\) on each equatorial direction and \(-2s\,dt\wedge ds\) on either axial direction. The two types are those of Taubes Examples 1.3 and 1.4. [Primary examples](https://msp.org/gt/1998/2-1/gt-v2-n1-p10-p.pdf)

Give each meridian \(S^2_{t,r}=\{t\}\times\{|(x,y,z)|=r\}\) the outward boundary orientation of the fibre ball in \(dx\wedge dy\wedge dz\). At \(rv\), a positive sphere basis \((b_1,b_2)\) makes \((\partial_s,b_1,b_2)\) positive in the fibre. Thus \((\partial_t,\partial_s,b_1,b_2)\) is positive in the ambient tube. Intersecting \(C_v\) once with \(S^2_{t,r}\) gives sign \(+1\) for an equatorial ray and \(-1\) for either axial ray. The same signs give the inner boundary coefficient in the orientation of increasing \(t\) on \(Z\): the outward vector along the inner boundary is \(-\partial_s\), so the boundary tangent is \(+\partial_t\) for an equatorial ray and \(-\partial_t\) for an axial ray. This holds for the boundary at \(s=0\) of the closure, and at \(s=\epsilon\) of an exterior truncation. At \(s=R'\), with \(0<R'<R\), the outer boundary of a truncated model collar has the reversed signs.

Over a base interval of length \(\ell\), a unit-weight sheet truncated to \(0<s<R'\) has flat mass \(\ell R'\). Its positive \(\omega\)-energy is \(\ell(R')^2/2\) on an equatorial ray and \(\ell(R')^2\) on an axial ray. In particular the integration current extends across \(s=0\) as a finite-mass current, with the indicated boundary by Stokes on the smooth parametrized closure. For a finite union with positive integral weights, distinct interiors are disjoint, so mass, energy and signed degrees add with the weights.

In a sufficiently small ambient ball of radius \(b\) centered on \(Z\), the parameter domain of each germ is a Euclidean half-disk. Its flat mass is \(\pi b^2/2\). Integrating \(s\) over this half-disk gives equatorial energy \(2b^3/3\), and the axial energy is twice that.

## Invariant weighted collections and descent

The deck map sends \(C_{e_\theta}\) to \(C_{e_{-\theta}}\) and interchanges \(C_{a_+}\) with \(C_{a_-}\). It preserves their current orientations. For a finite collection of distinct constant rays, deck invariance of the weighted current is equivalent to inclusion of each reflected pair with equal weights, with independent weights on the fixed directions \(\theta=0,\pi\), and an equal weight \(a\) on the two axial rays. A weight of zero means that ray is absent. With \(m_\theta\) the weight of \(e_\theta\), set
\[
 p=m_0+m_\pi+2\sum_{0<\theta<\pi}m_\theta,\qquad
 q_+=q_-=a,\qquad d=p-2a.
\]
The sum runs over the finite set of reflected pairs present. Here \(d\) is the signed intersection at each lifted meridian and the coefficient of the current boundary on \(\widetilde Z\). It is also the degree on each downstairs meridian: each one of its lifted spheres maps diffeomorphically to it with the specified orientation. In particular \(d=+1\) requires \(p=1+2a\), which forces an odd sum of weights on the fixed directions.

The invariant current descends with integral weights by taking its oriented local pushforward from either lift of a downstairs chart. Equivalently, for quotient map \(\pi\) the descended current is \(\tfrac12\pi_*\widetilde T\). Division by two accounts for using both lifts of each point, so it leaves the weight on each germ equal to its upstairs weight. Truncating at \(R'\), its mass is \(LR'(p+2a)\), its \(\omega\)-energy is \(L(R')^2(p/2+2a)\), and its inner boundary is \(d[Z]\). On the cover the same formulas for mass and energy use \(2L\) instead of \(L\).

For each fixed ray, its entire closed collar upstairs quotients to an embedded cylinder with boundary mapping to \(Z\) with absolute degree one. A two-element orbit instead gives one connected cylinder on \(N\setminus Z\). Its abstract closure is obtained by taking the quotient of the disjoint parametrizing half-cylinders including \(s=0\). This parameter cylinder is naturally identified with either one of the two parametrizing cylinders upstairs. Its boundary map to \(Z\) is a two-fold cover, of signed degree \(+2\) for a pair of equatorial rays and \(-2\) for the axial pair. The image still has two distinct half-sheet germs at every point of \(Z\). These boundary degrees describe the abstract parametrizations even when their boundary images coincide.

- **Degree \(+1\) with five germs.** Take \(e_0,e_\theta,e_{-\theta},a_+,a_-\) with \(0<\theta<\pi\) and weight one on each. The three downstairs components in the punctured tube have boundary degrees \(+1,+2,-2\). Both weight one on every germ and degree \(+1\) hold.
- **Degree \(-1\) with three germs.** Take \(e_0,a_+,a_-\) with all weights one. Their downstairs boundary degrees are \(+1,-2\).
- **One-sheet descent.** Take \(e_0\) or \(e_\pi\) alone, of weight one. The quotient closure is parametrized by \((t\bmod L,s)\mapsto[t,se_0]\), or by the same formula with \(e_\pi\), for \(0\le s<R\). The normal derivative at \(s=0\) is nonzero and fixed by monodromy, and the map is injective, so the closure is a smooth embedded collar with boundary \(+[Z]\). A nonfixed equatorial direction alone and either axial direction alone are each exchanged with a different germ, requiring the partner to form an invariant weighted collection of constant rays.

More generally, if the full lift of a punctured-tube curve has exactly one smoothly embedded equatorial half-sheet at every point of \(\widetilde Z\), the deck map sends that sheet germ to the unique germ at the other lift. The closures form a collar after shrinking the tube by compactness of \(\widetilde Z\). The deck action on its closure is free, and the quotient map is a local diffeomorphism. The quotient closure is therefore an embedded collar with its boundary mapped diffeomorphically to \(Z\). This deduction assumes the one-sheet and regularity properties on the entire lifted circle.

The five-germ example is a finite-energy positive current on the exact punctured tube. Its three components continue to the outer edge of the model and it has no prescribed extension there. The [core period calculation](../../investigations-2/03_lines_and_broken_fibrations/notes/CORE_PERIOD.md) applies to global components with compact closure away from the marked line, and [LINE E07](../../investigations-2/03_lines_and_broken_fibrations/reviews/LINE_E07_CAP_DEGREE_REPLAY.md) supplies that global scope for the marked current. Neither extension of the five-germ model to that current nor exclusion of its local pattern from that current is established here. The local examples test the inference from signed degree and the deck condition to the number of germs. The existence of a smooth one-sheet boundary on the marked current remains a separate geometric question.
