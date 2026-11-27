# A lower Weyl bound at the prescribed long-cuff width

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Master B02, selected scientific lead GPT-6.2 Astra/ultra. The [independent reading](PAUSE_STRIP_INDEPENDENT_20261127.md) was assigned to GPT-6.2 Sol/ultra and verified the fixed-width energy obstruction. Independent serving telemetry unavailable. The intake revision was `48f36794f9b1`. Working input blob prefixes were `e999229fcdf9` for the [fixed trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md), `59c3993e018e` for the [timed tubes](../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md), `f103fccfd777` for the [harmonic-map enclosure](../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md), `ddb5b8b7a6bd` for the [curvature conventions](../notes/FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md), `51f66f28665d` for the [single-relator closings](../../investigations-1/07_positive_subcritical_entry/notes/SINGLE_RELATOR_CLOSURES.md), and `03f618c377cf` for the [band exchange](../notes/FIXED_WIDTH_BAND_TEST_20261127.md).

**Result.** For the smooth oriented Riemannian minus Miller–Schupp trial with both prescribed convex transitions of width \(1/16\) and harmonic marking at \(L=2\operatorname{arcosh}5\), each complete band satisfies
\[
 E_+(U_i)=E_-(U_i)>\frac{169}{25}\pi^2 .
\]
Consequently each closed chiral integral exceeds \((338/25)\pi^2\). The strict entry budget is \(8\pi^2\). The closed conformal-Laplacian sign is undetermined by this estimate. The calculation concerns the specified metric on one presentation.

## Two small regions with large anisotropic curvature

Write \(r=1+s\), \(x=16s-1\), \(p\in S^2\), \(\delta=1/16\), and use the prescribed physical longitude \(\theta\) of period \(2\pi\). For either band restrict to
\[
 3/20\le x\le1/5,\qquad
 u\in[0,1/20]\cup[19/20,1],
\]
where \(u\) is the affine phase in each of the seven letter intervals. Include the entire framed two-sphere at every such point. The longitude measure is exactly one tenth of \(2\pi\). Let \(F\) be the actual outer product map to the hyperbolic pants times the unit round sphere,
\[
 F=(h_L(z),p(\phi,\theta)),\quad
 z=c_i(\theta/2\pi)+\delta r(p_1,p_2),\quad \phi=\phi_i+\delta r p_3 .
\]
Write \(B=F^*g_{\rm target}\) and \(A=ds^2+\sinh^2r\,d\theta^2+\sigma\). On this region the smooth conformal representative
\[
 \bar g=A+tB,\qquad t=\frac{H(x)}{1-H(x)}=\exp(-1/x+1/(1-x))
\]
has the same chiral densities times volume as the physical metric. In particular \(0<t<1/40\); the calculation only uses this representative on the displayed subset. Write \(J=dF\) and \(H_F=\nabla dF\) for the covariant Hessian with domain metric \(A\) and product target metric. Unsubscripted operator bounds here use these two metrics. Decimal bounds in the proof are exact finite decimals.

The harmonic-map enclosure supplies \(\|dh_L\|\le\sqrt{28}\) and \(\|\nabla dh_L\|<360\) in the flat planar chart on both entire footprints. Its argument uses the flat-domain, curvature-minus-one-target Bochner identity with the full Hilbert–Schmidt norms. [Local enclosure and disk estimates](../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md#a-uniform-derivative-bound-on-the-two-tube-footprints) · [Eells–Sampson, equation (16), pp. 123–124](https://math.jhu.edu/~js/Math646/eells-sampson.pdf)

For the planar letter path let primes denote derivatives in the actual longitude. On the two phase intervals \(|c'|<0.00002\) and \(|c''|<0.01\). Indeed \(|c'|=7H'(u)\) and \(|c''|\le49(|H''(u)|+2\pi H'(u)^2)/(2\pi)\). For \(0<u\le1/20\) one has \(H\le3e^{-1/u}\), \(H'\le3.01e^{-1/u}u^{-2}\), and \(|H''|\le3.34e^{-1/u}u^{-4}\), by differentiating the exponential odds. Each right side increases up to \(1/20\), and reflection gives the other end. For instance \(e^{20}>480000000\) follows by summing its Taylor series through degree 35.

The affine three-vector \(w=(z,\phi-\phi_i)=\delta rp+(c,0)\) obeys \(\|dw\|<.068\) and \(\|\nabla dw\|<.16\). Here \(r<1.08\), \(1.28<\sinh r<1.31\), \(\coth r<1.3\), and \(.82<\sin\phi<.91\) on both bands. The vector differential of \(rp\) has norm at most \(r\) by radial–tangential orthogonality on the sphere. Its Hessian is
\[
 dr\otimes dp+dp\otimes dr
 +p\big(\coth r\, e^1\otimes e^1-r\sigma\big),\qquad
 e^1=\sinh r\,d\theta.
\]
On two unit vectors the first term together with its transpose has norm at most one by Cauchy–Schwarz, and the coefficient of \(p\) has operator norm at most \(1.3\). Also \(\|\nabla d\theta\|=\coth r/\sinh r\). The bound for \(\nabla dw\) follows by adding \(.01/(1.28)^2+.00002(1.3)/1.28\) to \(\delta(1+1.3)\).

In particular \(\|J\|<.85\), since \(\|J\|^2\le28(.068)^2+(.91/1.28)^2\). The hyperbolic Hessian of the composed map has norm at most \(360(.068)^2+\sqrt{28}(.16)\). The spherical Hessian in the orthonormal latitude and azimuth directions is
\[
 \nabla d\phi-\sin\phi\cos\phi\,d\theta^2,\qquad
 \sin\phi\,\nabla d\theta+\cos\phi(d\phi\otimes d\theta+d\theta\otimes d\phi).
\]
The norms of these components are at most \(.16+.5/(1.28)^2\) and \(1.3/1.28+2(.068)/1.28\). Taking the Euclidean sum of the three squared component bounds gives \(\|H_F\|<3\). In the estimates below we allow the coarser bound \(4.5\).

## A sectional contrast of the actual metric

Use a \(\bar g\)-orthonormal frame consisting of the unit normal \(n\) to \(s=\mathrm{const}\) and three tangential eigenvectors of \(B\) relative to \(\bar g\). Denote a largest, smallest and remaining eigenvector by \(m,l,k\), respectively. All these vectors have \(A\)-norm at most one. Set \(j_v=|Jv|\). We use
\[
 j_n\le.35,\qquad j_m\le.85,\qquad j_k,j_l\le.36 .
\]
To verify the last two bounds, the two-plane tangent to the framed sphere has \(B\le28(\delta r)^2 A<.36^2 A\), and \(\bar g\ge A\). Min–max bounds the two smallest tangential eigenvalues. For the first bound, \(|J\partial_s|\le\sqrt{28}\delta\). With the adjoint in \(A\), \(J(I+tJ^*J)^{-1}=(I+tJJ^*)^{-1}J\), and \(|ds|^2_{\bar g}\ge(1+t(.85)^2)^{-1}\). Normalization therefore gives \(j_n\le\sqrt{1+t(.85)^2}\sqrt{28}\delta<.35\).

In the \(A\)-unit longitude direction \(B\ge(.82/1.31)^2>.39\), and on the sphere tangent plane \(B<.13A\). The eigenvalues \(\lambda\) of \(B\) relative to the tangential \(A\) become \(\lambda/(1+t\lambda)\) relative to the tangential \(\bar g\). It follows that
\[
 \tfrac12|ds|_{\bar g}^2(B_{mm}-B_{ll})
 \ge \frac{.39-.13}{2(1+.025(.85)^2)^3}>.12 .
\]

For two of these frame vectors \(v,y\), write \(K_{vy}=R_{vyyv}(\bar g)\), and set \(t_v=dt(v)\), with Hessians of functions taken in \(A\). At the point choose \(A\)-normal coordinates on the domain and target normal coordinates at \(F\). The sectional curvature formula in those coordinates is
\[
\begin{split}
 K_{vy}={}&R_A(v,y,y,v)+tR_{\rm target}(Jv,Jy,Jy,Jv)
 +t(\langle H_{vv},H_{yy}\rangle-|H_{vy}|^2)\\
 &+(\nabla dt)_{vy} B_{vy}
 -\tfrac12[(\nabla dt)_{vv} B_{yy}+(\nabla dt)_{yy}B_{vv}]\\
 &+t_v(\langle Jv,H_{yy}\rangle-\langle Jy,H_{vy}\rangle)
 +t_y(\langle Jy,H_{vv}\rangle-\langle Jv,H_{vy}\rangle)\\
 &+|G_{vy}|^2_{\bar g^{-1}}-\langle G_{vv},G_{yy}\rangle_{\bar g^{-1}},
\end{split}
\]
where \(H_{vy}=(H_F)_{vy}\), and the first-kind connection difference at the point is the covector
\[
 G_{vy}=t\langle H_{vy},J(\cdot)\rangle+
 \tfrac12\big(t_v B(y,\cdot)+t_y B(v,\cdot)-dt\, B_{vy}\big).
\]
Indeed the second derivative part of \(R_{vyyv}\) is \(\partial_v\partial_y\bar g_{vy}-(\partial_v^2\bar g_{yy}+\partial_y^2\bar g_{vv})/2\) for constant coordinate extensions. Substituting \(\langle Jv,Jy\rangle\) cancels the third coordinate derivatives of \(F\); the second derivatives of the target metric at its normal-coordinate origin give its indicated curvature term. The residual quadratic connection contractions have the displayed signs. This calculation avoids inversion of the native planar metric.

Consider
\[
 D=K_{nm}-K_{nl}-K_{km}+K_{kl}.
\]
Dots below denote derivatives of \(t\) in \(s\). In \(\nabla dt=\ddot t\,ds^2+\dot t\,\nabla ds\), only the first two sections of \(D\) contain \(\ddot t\). Their combined coefficient is \(-|ds|^2_{\bar g}(B_{mm}-B_{ll})/2\). To bound the other terms in absolute value:

- The first line of the sectional formula costs at most \(4(1+.025(.85)^4+2(.025)(4.5)^2)<8.11\) in the contrast. Both product metrics have absolute sectional curvature at most one on orthonormal planes.
- The positive rank-one Hessian \(\nabla ds=\coth r\,e^1\otimes e^1\) contributes at most \(\dot t(1.3)(.85)^2/2\) per plane. Indeed its combination with \(B\) is \(-\coth r\,|J(e^1(v)y-e^1(y)v)|^2/2\), and contraction of the unit one-form with \(v\wedge y\) has \(A\)-norm at most one. The first-order terms in \(t_v,t_y\) occur in the two sections containing \(n\), and together cost at most \(4.5(2(.35)+.85+.36)\dot t\).
- Put \(z=.096\), an upper bound for \(t(4.5)(.85)\). Since \(\bar g^{-1}\le A^{-1}\), \(|G_{vy}|_{\bar g^{-1}}\le z+d_{vy}\dot t\). In the order \(nn,mm,kk,ll,nm,nl,km,kl\) the coefficients \(d_{vy}\) can be bounded by \((.36,.362,.065,.065,.510,.216,.153,.065)\). For example the \(nm\) coefficient is at most \(((.85)^2+.35(.85))/2=.510\). Adding \((z+d_{vy}\dot t)^2+(z+d_{vv}\dot t)(z+d_{yy}\dot t)\) over the four planes gives at most \(8z^2+.35\dot t+.53\dot t^2\).

Combining these estimates gives throughout the chosen subset
\[
 |D|\ge .12\ddot t-9-11\dot t-.53\dot t^2 >130 .
\]
For the last step divide the interval in \(x\) into the fifty cells \([a,b]=[i/1000,(i+1)/1000]\), \(150\le i<200\). Write \(T(h)=\exp(-1/h+1/(1-h))\). A lower bound for \(\ddot t\) and an upper bound for \(\dot t\) on each cell are
\[
 256T(a)\big[(b^{-2}+(1-a)^{-2})^2-2a^{-3}+2(1-a)^{-3}\big],
 \qquad 16T(b)\big[a^{-2}+(1-b)^{-2}\big].
\]
The bracket in the first expression is positive on every cell. The following exact rational calculation reproduces a conservative floor for all fifty evaluations. It uses the positive exponential series with its remaining terms bounded by a geometric series.

```python
from fractions import Fraction as Q
from math import factorial

def odds_bounds(x):
    u = 1 / x - 1 / (1 - x)
    partial = sum(u**j / factorial(j) for j in range(31))
    tail = u**31 / factorial(31) / (1 - u / 32)
    return 1 / (partial + tail), 1 / partial

values = []
for i in range(150, 200):
    a, b = Q(i, 1000), Q(i + 1, 1000)
    slope = 16 * odds_bounds(b)[1] * (a**-2 + (1-b)**-2)
    bracket = (b**-2 + (1-a)**-2)**2 - 2*a**-3 + 2*(1-a)**-3
    assert bracket > 0
    curvature = 256 * odds_bounds(a)[0] * bracket
    values.append(Q(12, 100)*curvature - 9 - 11*slope - Q(53, 100)*slope**2)
assert 135 < min(values) < 136
```

## Complete band and closed energies

The four Schouten terms cancel in \(D\) in the orthonormal frame. For either orientation, each Weyl sectional value is half the sum of the matching two diagonal Weyl entries in the self-dual and anti-self-dual bases formed from complementary oriented simple two-vectors. Its complementary plane has the same Weyl sectional value. Thus \(D\) is the difference of the two paired diagonal sums. Cauchy–Schwarz on these four entries gives \(D^2\le4(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)\). The measure on the subset satisfies \(dV_{\bar g}\ge dV_A=\sinh r\,ds\,d\theta\,dA_\sigma\). The radial length is \(1/320\) and longitude occupies one tenth of its period, so its volume is strictly greater than \(8\pi^2(1.28)/3200\).

The complete per-band equality \(E_+(U_i)=E_-(U_i)\) holds by signature zero on the single-relator closure with its complementary Weyl-flat pieces. Integrating the combined pointwise inequality on the subset and using positivity on the rest of the band gives each complete chiral energy strictly greater than
\[
 \frac{130^2}{8}\,\frac{8\pi^2(1.28)}{3200}
   =\frac{169}{25}\pi^2 .
\]
This last use of the complete closure matters because the restricted subset need not have equal chiral integrals. The two disjoint complete bands in the original marked assembly give the claimed closed floor. All estimates apply directly to both relators, and their isometric exchange gives the same common cost \(c\). A low-energy trial on this smooth type would require a different metric. This obstruction decides the joint entry test for the specified width and leaves the scalar sign as an independent question.

## Can a cap-extended scalar test use the same shoulder?

Let a real \(H^1\) test on the closed original assembly vanish beyond the outer edge \(x=1/5\) of these shoulders and be supported in their longitude strips wherever \(0<x<1/5\). Allow arbitrary extensions to both scalar-flat caps and their entire inner germs, including constant cap values whenever the traces allow them. Every nonzero such test has **strictly positive** conformal-Laplacian numerator. Thus a negative test using a cap would have to use other angles, extend farther across a changing band, or change its support elsewhere on the closed assembly.

To prove this, conformally rescale the test and the metric together as above through \(x=1/5\). The scale equals one on the inner germ and extends smoothly and positively past the test's zero outer trace. Conformal covariance preserves the integrated numerator. On \(0<x\le1/5\) one has \(1.26<\sinh r<1.31\), \(\coth r<1.3\), and the preceding derivative estimates using \(1.26\) in place of \(1.28\) still give \(\|J\|<.85\) and \(\|H_F\|<4.5\). In this interval
\[
 t<.025,\quad 0\le\dot t<11,\quad 0\le\ddot t<5000.
\]
Indeed \(t\le3.5e^{-1/x}\), the logarithmic \(x\)-slope is at most \((17/16)x^{-2}\), and its square plus its derivative is positive and at most \(1.14x^{-4}\). Positivity follows from \(x^{-4}-2x^{-3}>0\). Both \(e^{-1/x}x^{-2}\) and \(e^{-1/x}x^{-4}\) increase up to \(1/5\), and \(e^5>140\).

In an arbitrary \(\bar g\)-orthonormal plane the \(\ddot t\) term of the sectional formula is bounded in absolute value by \(5000(.85)^2/2\) using its rank-one expression. The \(\dot t\nabla ds\) part is bounded by \(11(1.3)(.85)^2/2\). The linear \(JH_F\) terms together are bounded by \(4(11)(.85)(4.5)\), and each first-kind covector by \(.096+3(11)(.85)^2/2\). Including the first line of the sectional formula, these bounds give \(|K_{vy}|<2500\). Since scalar curvature is twice the sum over six orthonormal planes, \(|R_{\bar g}|<30000\).

For the rescaled test \(f\), fix \(\theta,p\) and integrate on the radial interval \(I\) with \(0\le x\le1/5\). Its \(s\)-length is \(1/80\). Cauchy–Schwarz from the vanishing outer trace and integration in \(s\) give
\[
 \int_I f^2\,ds\le\frac{1}{2(80)^2}\int_I |\partial_s f|^2\,ds .
\]
In the angular strips, \(\bar g\le(1+.025(.85)^2)A\), whence \(|df|^2_{\bar g}\ge .98|\partial_s f|^2\) and \(dV_A\le dV_{\bar g}\le1.05dV_A\). Fubini therefore gives a lower bound for the numerator on that interval of
\[
 \left[6(.98)(1.26)-\frac{30000(1.05)(1.31)}{2(80)^2}\right]
 \int |\partial_s f|^2\,ds\,d\theta\,dA_\sigma .
\]
The bracket exceeds four. The omitted cap and inner germ have nonnegative Dirichlet energy and zero scalar curvature. Equality at zero would force the radial derivative to vanish in the strips, hence the test to vanish there by its outer trace. Vanishing energy in the connected caps and inner germs would make the test constant there and zero by matching traces. The result only excludes the specified support class; it does not estimate the unrestricted closed sign.

## Error budget for a test reaching the original funnels

The outer-focused radial test has positive constant value on each cap,
uses both complete bands and reaches all three original funnels. Fix the
piecewise affine profile with knots \(512s=(0,48,52,54,56,58,59,60,61,62,64)\)
and values \(1000\chi=(1,4,28,68,153,340,514,765,974,1000,1000)\).
Extend by the actual outer constant across the compact retained pants
product and by its decaying constant mode across each funnel in the
unscaled gauge. In the notation
\[
 G(s)=6\int_{\Sigma_s}|ds|_g^2\,dV_g/ds,\qquad
 V(s)=\int_{\Sigma_s}R_g\,dV_g/ds,
\]
the original numerator is \(2\int_0^{1/8}[G(\chi')^2+V\chi^2]ds+144L\).
Here \(dV_g/ds\) denotes the density in the literal framed angle
coordinates at fixed \(s\). The cap contributes zero. The sign
implication is strict negativity of this one numerator.

In the [fitted physical-band calculation](../numerics/native_rayleigh_fit.py)
with the [native cuff fit](../notes/HOPF_CUFF_FIT_20261127.md), the fine
128-fit calculation gives kinetic \(+43440.23\), potential \(-47574.19\),
and the exact funnel cost \(144L\) is approximately \(660.22\), for
a diagnostic total of \(-3473.74\). The corresponding 64-fit total is
\(-3485.52\). The two working arithmetic returns had SHA-256 prefixes
`d26eab4276707ff6` and `2a22da56421c13e0`, respectively. These are
floating-point evaluations on fitted coefficients.

For the exact specified profile, integrating its affine segments gives
\[
 2\int(\chi')^2ds=\frac{2554803}{15625},\qquad
 2\int\chi^2ds=\frac{2246181}{128000000}.
\]
Suppose explicit approximants \(\widetilde G,\widetilde V\) could be
certified on every original slice with
\(G\le\widetilde G+8\), \(V\le\widetilde V+80000\).
If their complete integrated numerator were at most \(-3473+600\),
allowing a total quadrature and rounding error of 600, the original
numerator would be at most
\[
 -3473+600+8(163.507392)+80000(.0175482890625)<-161 .
\]
The same comparison works with local upper errors weighted by the exact
integrals of \((\chi')^2\) and \(\chi^2\) on each cell. In particular
the scalar potential can be bounded from above with the
[concave first-jet envelope](../notes/THREE_CUFF_RAYLEIGH_20261127.md)
where that is sharper.

A relative metric estimate can control the kinetic part directly.
If \((1-\eta)\widetilde q\le q_L\le(1+\eta)\widetilde q\) on the
footprints, \(0<\eta<1\), then
\(G\le(1+\eta)\widetilde G/(1-\eta)\). Indeed the full band metrics
satisfy the same relative inequalities and vary only in the pullback
of the planar two-block. At most two eigenvalues of the relative
four-metric differ from one. The volume ratio is at most \(1+\eta\)
and the inverse norm of \(ds\) squared gains at most \((1-\eta)^{-1}\).
For instance a one-percent relative enclosure would contribute at
most \((1.01/.99-1)\) times a certified approximate kinetic integral,
about 878 at the quoted scale. The available absolute upper bounds
and the global positive ellipticity lower bound do not give this
one-percent enclosure around the fitted metric. The fitted scalar
field has a discrete weak residual. A continuum cuff-parameter and
scalar-field enclosure with a verified first-jet or potential bound,
and angular and radial quadrature enclosures, remain missing. No
negative original closed sign follows from these runs.
