# SP4-TWA-E33 · Independent amplitude and transverse-envelope replay

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E33_REQUEST_v1.md)
records GPT-6.2 Sol/ultra as the non-author helper configuration. Independent
serving model and effort telemetry were unavailable. Checkout
`7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`. All four frozen SHA-256
digests matched. The reviewer authored none of the frozen inputs.

**Pass.** The zero-index count, fixed-angular-field flux dual and endpoint
comparison with transverse envelopes hold on the stated cylinder. The dual
also gives an obstruction to restricting the allowed flux directions, even
for a single favorable helix. All calculations use the oriented flat
Riemannian product \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), the periodic
spin lift, real quaternionic pairing and positive half-spinors of E14.
The action is \(S=J^4=\int_M Q^2\), with \(Q=|P\psi|^2/|\psi|^2\)
and full traces \(e^{\pm b}\sigma\). The radial value is \(9b^4/8\).
[E14](../notes/E14_FIRST_NEGATIVE_MODE.md) ·
[Friedrich, published §1, p. 59 and (1.1)](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

## Zero count

At a compatible zero \(p\), \(P\psi(p)=0\) gives
\(d\psi_p(X)=Xq\) in the E14 positive factor, with
\(q=-D\psi(p)/4\) in the negative factor. In the oriented real basis
\((1,\mathbf i,\mathbf j,\mathbf k)\) this is right multiplication by
\(q\). Its norm dilation is \(|q|\), and its determinant is positive
since \(\mathbb H\setminus\{0\}\) is connected and the determinant at
\(q=1\) is positive. Thus each transverse compatible zero has degree
\(+1\) in this choice of target orientation. On the cylinder with small
balls removed the pullback of the normalized closed volume form on
\(S^3\) has outer-boundary integral zero, because each end map is
constant. The ball boundary orientations in the punctured domain are
opposite to those of the outward spheres of the balls. Stokes therefore
makes the sum of the individual degrees zero. Finite transversality and
compatibility are the admitted zero assumptions. Every field in that
smooth trace class is zero-free. [Global amplitude](../notes/B09_GLOBAL_AMPLITUDE.md)

## Fixed-angular-field minimization

For a smooth unit \(g\) with end value \(\sigma\), let
\(\psi=e^{bt+u}g\), \(u|_{\partial M}=0\), and \(C=3/4\).
The projection identity gives
\(L_g^*L_g=CI\) for \(L_g z=\Pi(z\otimes g)\). Clifford
skew-adjointness yields \((L_g z,Pg)=z\cdot K/4\), with
\(K_i=\sum_{j\ne i}(g,c_ic_j\partial_jg)\). Projection onto the
range of \(L_g\) has squared norm \(|K|^2/(16C)=|K|^2/12\) on
\(Pg\). Consequently \(V=|Pg|^2-|K|^2/12\ge0\) pointwise,
and with \(p=b\,dt+K/3\) one has
\[
Q=C|p+du|^2+V.
\]

The functional \(\int_M F_V(p+du)\) for
\(F_V(z)=(C|z|^2+V)^2\) is coercive on the zero-trace
\(W^{1,4}(M)\) space by \(F_V(z)\ge C^2|z|^4\),
the triangle inequality for \(p+du\), and zero-end Poincaré.
Convex weak lower semicontinuity gives a minimizer. The
\(C^2|z|^4\) term is strictly convex even at \(z=0\),
so the gradients of any two distinct minimizers must agree.
Zero traces then give uniqueness. Strong \(W^{1,4}\) approximation
by smooth zero-end functions gives convergence in energy, since the
bounded \(p,V\) and the strong convergence of gradients give
\(C|p+du_m|^2+V\to C|p+du_*|^2+V\) in \(L^2\).
Each smooth approximation gives a smooth positive amplitude
\(e^{bt+u_m}\) and the exact traces.

For \(j\in L^{4/3}\), the condition \(\operatorname{div}j=0\) in
interior distributions is equivalent by density to
\(\int j\cdot du=0\) for every zero-trace \(u\in W^{1,4}\).
If the normal data are recorded, their weak pairing with the trace of
\(v\in W^{1,4}\) is \(\int j\cdot dv\), independent of the
extension. Divergence imposes zero total outward flux, obtained by taking
\(v=1\), with no separate zero-flux condition at either face.
For example \(j=\ell\,dt\) has normal values \((-\ell,\ell)\)
and is admissible.

The pointwise Fenchel conjugate is
\[
F_V^*(j)=3C^2r^4+2CVr^2-V^2,qquad
4Cr(Cr^2+V)=|j|,\quad r\ge0 .
\]
For \(j\ne0\) the maximizing vector is along \(j\), and for
\(j=0\) it is zero, giving \(-V^2\) in that case. Fenchel's
inequality and the annihilation of zero-end gradients give the frozen
dual objective as a lower bound for every amplitude. The first variation
at the Sobolev minimizer gives
\(j_*=4C(C|p+du_*|^2+V)(p+du_*)\in L^{4/3}\) with distributional
divergence zero. Pointwise Fenchel equality gives dual attainment and
recovers the primal value. A strict deficit in the optimized value for
any fixed smooth angular map thus recovers a strict smooth trial.
The endpoint comparison requires the common primal and dual value
to be at least \(9b^4/8\) for every smooth angular map at
\(b=51\pi/16\). [B09 global amplitude](../notes/B09_GLOBAL_AMPLITUDE.md) ·
[E17 polar identity](../notes/E17_POLAR_LOWER_BOUND.md)

## Transverse-envelope theorem

For \(h=a(t,y)+e^{\mathbf i kx_1}c(t,y)\mathbf j\), with
\(y=(x_2,x_3)\), \(k=\pm2\pi\), and trace \((a,c)=(1,0)\),
the norm square \(R=|a|^2+|c|^2\) is independent of \(x_1\).
A zero would be a whole \(x_1\)-circle, so admissibility already
implies \(R>0\). Let \(N\) and \(E\) be the row restrictions of
\(d(e^{bt}h)\) to \((t,x_1)\) and \((x_2,x_3)\), respectively.
The contraction from the positive spinors to the negative ones acts by
left multiplication with \(-1,\mathbf i,\mathbf j,\mathbf k\) in
those coordinates. The \(N\) contraction has its constant component
in \(\mathbb C_{\mathbf i}\) and its rotating component in
\(\mathbb C_{\mathbf i}\mathbf j\). The \(E\) contraction has
these planes reversed, and its rotating part still has nonzero
frequency. The same-frequency real pairings vanish by orthogonality
and the constant with rotating pairings vanish upon averaging.
The unprojected gradient cross term vanishes by disjoint rows.
Since \(|c(E)|^2\le2|E|^2\), the \(x_1\) mean of \(Q\)
is at least \(Q_N\), independently of \(x_1\); in fact it gains
the nonnegative mean of \(|\Pi E|^2/|\psi|^2\ge |E|^2/(2|\psi|^2)\).
Jensen then yields the mean-square bound by \(Q_N^2\).

Writing \(\alpha=a_t+ba\), \(\gamma=c_t+bc\), the contraction of
the two normal rows is
\(-e^{bt}(\alpha+e^{\mathbf i kx_1}(\gamma+kc)\mathbf j)\).
Subtracting a quarter of its squared norm from \(|N|^2\) gives
\[
Q_N=\frac{C}{R}\left(|\alpha|^2+|c_t+(b-k/3)c|^2+\frac{8k^2}{9}|c|^2\right).
\]
For each complex coefficient \(z\) and real \(s\),
\(|z_t+sz|^2\ge ((|z|)_t+s|z|)^2\) almost everywhere, by the
radial projection for \(z\ne0\) and the zero derivative almost
everywhere on the zero set. Replacing \(a,c\) by their moduli thus
lowers \(Q_N\). Write the moduli as
\(e^u(\cos\theta,\sin\theta)\) with \(u=\frac12\log R\) and
\(0\le\theta\le\pi/2\). On each slice these functions are
Lipschitz with zero end values: the radius is bounded away from zero
and the quadrant angles are bounded by a constant times chordal
distance on the unit circle. They admit strong zero-end
\(W^{1,4}(-1,1)\) approximants, with uniform convergence and strong
\(L^2\) convergence of \(Q\), giving convergence of \(S\).
The analytic E26 inequalities also apply directly
to these Lipschitz time profiles.

In E26 variables with \(x=\omega t\), \(\omega=\pi/2\),
\(a_{m E26}=(b+u_t)/\omega\), \(w=\sin^2\theta\),
\(d=4/3\) and \(\eta=k/(2\pi)\), the completed density is
\[
\frac{Q_N(\mathrm{moduli})}{C\omega^2}
=(a_{\rm E26}-\eta d w)^2+
(\theta_x-\eta d\sin\theta\cos\theta)^2+(16-d^2)w.
\]
The mean of \(a_{\rm E26}\) is \(B=51/8\).
For \(\eta=-1\), Jensen on the first term gives the lower bound
\((B+d\mu)^2+(16-d^2)\mu\) on the mean of this normalized
density, where \(\mu\) is the mean of \(w\). It is strict
when \(\mu>0\). For \(\eta=1\), the tangent comparison at
\(L=B^2+5(w-\mu)=W+5w\) and completion in
\(a_{\rm E26}-B\) give the coefficient
\(G(w)=25/2+(7B/2+5dw)^2/(W+5w)\) on the centered
\(w\)-square. The derivative of \(w\) against \(L\) integrates
to zero. The identity
\((\partial_x\sin\theta)^2=(1-w)\theta_x^2\) gives the
nonnegative Dirichlet term with coefficient \(W\). The remaining
positive term is bounded by
\(4w\theta_x^2\ge(1+w)w_x^2\) and periodic Poincaré for
\(w^{3/2}\). The divided-difference estimate used there yields
\(\operatorname{Var}(w^{3/2})\ge
\mathbb E[w(w-\mu)^2]+\mu\operatorname{Var}(w)\).
Using \(G'(s)<11\), \(G(0)\le99/4+2\mu\), and
\(4(W+5)/9>18\) leaves the bracket
\((W+5)n^2-119/4+16\mu\) in the Fourier estimate with
\(w\) vanishing at its identified endpoints. It exceeds \(15\)
at \(n=1\) and \(32n^2\) thereafter. Weighted Cauchy–Schwarz
against that endpoint condition costs at most \(173/192\) of
this Fourier lower bound, leaving the normalized action gap at
least \((95/32)\operatorname{Var}(w)\) plus the nonnegative
Dirichlet term. These steps require only the stated time approximation
or the Lipschitz chain rule and periodic \(H^1\) of \(w,w^{3/2}\).
The E26 multiplier step at fixed smooth angle uses the strictly
increasing positive root of \(r^3+H_\eta r=\ell\), with mean
ranging from zero to infinity as \(\ell\) increases, consistently
with the strict convexity of the reduced action.

For either sign equality needs \(w=0\) and
\(a_{\rm E26}=B\), by the end conditions and strict convexity of
the fourth power in the remaining amplitude. The slice inequality
and continuity therefore give \(|a|=1,c=0\) everywhere in the
envelope equality case. There \(Q_N=C(b^2+|a_t|^2)\)
forces \(a_t=0\), and the end value fixes \(a=1\).
The quaternionic axes can be cycled in the oriented torus frame,
and either frequency sign is already included.
[B09 transverse envelopes](../notes/B09_TRANSVERSE_ENVELOPES.md) ·
[E26 analytic inequality](../notes/E26_FINITE_HELIX.md)

## Consequences and a restriction on flux certificates

- The slope convexity argument applies to this fixed class of normalized
  envelopes. Time-space inversion preserves the class and reverses the
  slope. At \(b\ne0\), \(S(e^{bt}h)/b^4\) is strictly convex as a
  function of \(1/b\) for \(h\ne1\), with value \(9/8\) at
  \(1/b=0\). An endpoint lower bound at \(b_*=51\pi/16\) therefore
  gives a strict bound for the same \(h\) at \(0<|b|<b_*\).
  At \(b=0\) equality follows only for \(h=1\) by the flat
  zero-trace twistor identity. The E14 strictly cheaper helical trial
  above the crossing belongs to this class. Its radial-minimization
  interval is exactly \([-b_*,b_*]\).
  [B08 slope convexity](../notes/B08_GLOBAL_TRANSITION.md) ·
  [E14 trial](../notes/E14_FIRST_NEGATIVE_MODE.md)
- A separate all-slope sector consists of smooth unit angular fields
  satisfying \(\operatorname{div}K=0\), with arbitrary smooth
  zero-end log amplitude. Indeed the spatial mean of \(K_0\) is then
  constant in time and vanishes because each end map is constant.
  Also \(\int_M du\cdot K=0\). The integrated polar identity
  reduces to \(\int_M Q=2Cb^2+C(\|du\|_2^2+\|dg\|_2^2)\),
  so Jensen gives strict inequality unless \(u=0,g=\sigma\).
  This sector includes \(\operatorname{rank}_{\mathbb R}dg\le1\):
  if \(z_i=(\partial_i g)g^{-1}\), then
  \(\partial_i z_j-\partial_j z_i=[z_i,z_j]\).
  The antisymmetric constant Clifford coefficients in \(K\) make
  \(\operatorname{div}K\) a contraction of these commutators.
  All commute when the image of \(dg\) has real dimension at most one.
  [E17](../notes/E17_POLAR_LOWER_BOUND.md) ·
  [E30 commutator formula](../notes/E30_SLICE_COMPARISON.md)

For an obstruction concerning the actual quartic dual, take the E27
favorable helix \(g=\cos\theta+\sin\theta\,n\) with
\(\theta=\epsilon F\), \(F=\cos(\omega t)\),
\(n=\mathbf j\cos(\lambda x_1)+\mathbf k\sin(\lambda x_1)\),
and \(\lambda=2\pi\). E14 gives
\[
K_0=-\lambda\sin^2\theta,\qquad K_1=0,\qquad
(K_2,K_3)=(\theta'+\lambda\sin\theta\cos\theta)
 (\cos(\lambda x_1),\sin(\lambda x_1)).
\]
Write \(K_\perp=K_2dx_2+K_3dx_3\). For any flux with
\(j_2=j_3=0\), Fenchel applied at the vector \(p-K_\perp/3\)
bounds its dual objective by
\(\int_M (Q|_{u=0}-|K_\perp|^2/12)^2\), since the discarded
vector pairs to zero with \(j\) pointwise. At \(b=b_*\) the
order-two action excess of the fixed-amplitude critical helix is zero.
The pointwise squared current obeys
\(|K_\perp|^2=\epsilon^2(F'+\lambda F)^2+O(\epsilon^4)\)
uniformly. From the helix density and \(\int F F'=0\) the relaxed
dual bound becomes
\[
 \int_M (Q|_{u=0}-|K_\perp|^2/12)^2
 =\frac{9b_*^4}{8}
 -\frac{Cb_*^2}{6}(\omega^2+\lambda^2)\epsilon^2
 +O(\epsilon^4).
\]
It is strictly below the target for sufficiently small nonzero
\(\epsilon\). Thus even allowing arbitrary divergence-free fluxes
valued in the \((dt,dx_1)\) plane misses this strict positive
comparison, including the constant normal flux choice.

For this very same angular field the exact amplitude infimum is
attained by a smooth time-only amplitude. The E27 spatial Jensen
argument averages away \(x_2,x_3\), then uses \(K_1=0\) and
the time-only remaining coefficients to average away \(x_1\).
E26 then gives strict excess. In the full dual the optimizing flux has
\(j_0\) constant given by the time multiplier and transverse
components \(4C Q K_\perp/3\). They contribute zero divergence
since their coefficients are independent of \(x_2,x_3\).
This obstruction holds for the specified flux restriction at the crossing.
The unrestricted angular inequality for general \(g\) remains open.
[E27](../notes/E27_POLAR_DEFECT.md) · [E26](../notes/E26_FINITE_HELIX.md)
