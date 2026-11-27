# A fixed radial witness for the native Miller–Schupp sign tests

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E computation under master B02. Actual serving model and reasoning effort unavailable. Intake checkout 48f36794f9b1. The [07 trial], [first-jet formula], [band exchange], [harmonic reduction], [mesh fitting code] and [harmonic-measure basis] had working Git blob prefixes e999229fcdf9, ddb5b8b7a6bd, 03f618c377cf, e11efd64a951, 0df43494de5af and 2f2a755b2751. The [Rayleigh script] with controls has blob d5428bea3dfb. This computation uses the actual marked long-cuff band tensors with approximate harmonic data, on the smooth oriented minus Miller–Schupp example. Width is \(1/16\), total band length \(1/8\), and cuff length \(L=2\operatorname{arcosh}5\).

A fixed rational trial profile gives a negative floating-point numerator on both the common three-cuff Neumann domain and the original closed assembly. At the \(128\times112\) marking resolution with full angular quadrature the respective numerators are about \(-4134\) and \(-3474\). The constant trial has a large positive numerator. A proof requires a certified enclosure of the weighted integrals on the exact harmonic marking. The piecewise-affine marking approximants and quadrature supply none.

## Physical calculation

Work in the native exterior chart \((x^1,x^2,\phi,\theta)\) and use \(\xi=16(x^1-\bar c^1(\theta),x^2-\bar c^2(\theta),\phi-\pi/3)\), \(r=|\xi|=1+s\) on band 1. The end tensors there are

\[
 A=dr^2+\sinh^2r\,d\theta^2+r^{-2}(|d\xi|^2-dr^2),
 \qquad B=q_L(x)+d\phi^2+\sin^2\phi\,d\theta^2 .
\]

The code uses the literal word \(XyyxYYY\), the flat step for all letter speeds and the full prescribed switch \(G=(1-a)A+aB\) with \(a=H(16s-1)\). It differentiates the displayed known end coefficients and takes the planar metric and its first derivatives from the harmonic fit. The scalar formula contracts the two prescribed end product curvatures, the product-rule terms from the first two derivatives of \(a\), and the connection products of \(A,B,G\). This is the exact [first-jet formula] for the true metric. With fitted data substituted it is a diagnostic for that formula. In particular the piecewise-affine scalar fit need not itself yield a smooth metric of curvature \(-1\). No second differences of that fit are used.

Let \(d\mu=d\theta\,dA_{S^2}\) in the literal marked slice coordinates. Their volume factor in the exterior chart is \(dV=16^{-3}r^2\sqrt{\det G}\,ds\,d\mu\). Set

\[
 k(s)=6\int_{S^1\times S^2}|ds|_G^2\,\frac{dV}{ds\,d\mu}\,d\mu,
 \qquad
 p(s)=\int_{S^1\times S^2}R_G\,\frac{dV}{ds\,d\mu}\,d\mu .
\]

For one band write \(K=\int k(\chi')^2 ds\) and \(P=\int p\chi^2 ds\). These are direct bulk integrals without integration by parts. The pure cap germ \(0\le s\le 1/16\) has \(p=0\), \(k=48\pi^2\sinh(1+s)\), which the script uses there. The other band gives the same integrals by isometric exchange. Their inner constants persist through the exact scalar-flat caps, and the common exterior constant persists through the whole compact retained pants product. For the original closed test continue its outer value across each funnel in the unscaled gauge by \(1-(2/\pi)\arctan(\sinh r_{\rm fun})\), then divide by the specified compactifying multiplier. The funnel contribution is \(6(2/\pi)(4\pi L)\) times the squared outer value, for each of the three cuffs. Thus the exact numerators for this family are

\[
 Q_V=2(K+P),\qquad Q_M=2(K+P)+144L\,\chi(1/8)^2 .
\]

All the extensions are admissible \(H^1\) tests. A strict negative numerator would decide the relevant sign. The funnel charge uses all three actual cuffs. [Band symmetry and closed continuation][band exchange]

Gauss quadrature is used in each letter and in the vertical sphere coordinate, with uniform periodic azimuths. The optional half-letter mode uses the planar symmetries \(z\mapsto\bar z,-z,-\bar z\) to exchange signed letters with their framed sphere coordinates. Reversing the half-letter parameter induces a planar conjugation together with the matching reversal of the exterior longitude. These are isometries for the actual end metrics and preserve the switch. Thus one half-letter accounts for a factor \(14\) on one band, and the band exchange gives a further factor \(2\). The computed full and half-letter values below use different quadrature nodes. Radial Gauss quadrature subdivides at \(s=1/16\) and every chosen trial breakpoint.

## Fixed profile and reproducible diagnostic

The trial is affine between these exact nodes, given as coordinate numerators over \(512\) and value numerators over \(1000\). Preliminary radial solves guided the choice of these rounded values. The same fixed profile is integrated in every reported row.

| \(512s\) | 0 | 48 | 52 | 54 | 56 | 58 | 59 | 60 | 61 | 62 | 64 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| \(1000\chi(s)\) | 1 | 4 | 28 | 68 | 153 | 340 | 514 | 765 | 974 | 1000 | 1000 |

The inner constant is \(1/1000\) and the outer value is \(1\). The kinetic and potential values below each include both bands. Every row uses the same exact three-funnel charge \(144L\approx660.220321\).

| Fit mesh | Radial base cells, Gauss order | Longitude Gauss nodes | Sphere nodes | \(2K\) | \(2P\) | \(Q_V\) | \(Q_M\) |
|---|---|---|---|---:|---:|---:|---:|
| \(28\times24\) | \(64,2\) | \(12\) per letter | \(6\times12\) | 43303.428 | −47233.057 | −3929.629 | −3269.408 |
| \(64\times56\) | \(96,2\) | \(24\) per letter | \(8\times16\) | 43434.474 | −47580.217 | −4145.743 | −3485.522 |
| \(128\times112\) | \(96,2\) | \(24\) per letter | \(8\times16\) | 43440.234 | −47574.191 | −4133.957 | −3473.737 |
| \(64\times56\) | \(96,2\) | \(24\) per half-letter | \(8\times16\) | 43435.969 | −47582.133 | −4146.164 | −3485.944 |
| \(128\times112\) | \(160,3\) | \(48\) per half-letter | \(12\times24\) | 43442.706 | −47524.497 | −4081.790 | −3421.570 |

As a separate check the script assembles the one-dimensional Galerkin form on continuous radial piecewise-affine functions, with the same constant extensions. It compares the form with and without the original endpoint charge. Its positive mass form is the sum of the two band-only radial \(L^2\) forms. The optimized signs are diagnostics, and the quotients are not full-domain eigenvalues. On the \(128\times112\) full row, the peak-one optimized profiles gave respective numerators \(-3933.502\) and \(-3759.739\). The profile optimized for the original form has outer value about \(0.99610\). For the all-ones profile the two numerators on that row are about \(83039.626\) and \(83699.846\).

The pure \(A\) and \(B\) scalar checks in the code use the exact translated half-plane hyperbolic metric for the \(B\) control and verify the \(A\) slice measure and radial kinetic coefficient. A separate direct second-difference curvature check at \(s=0.093\), \(\theta=0.36(2\pi/7)\), \(p=(0.8,0,0.6)\) with the same exact planar control gave scalar values \(18577.1500\) from the first-jet formula and \(18577.0672\) from centered differences of step \(5\times10^{-7}\) in the exterior chart. This checks the contraction in an active switch rather than using the synthetic control as a substitute for the native marking.

Run from the repository root with Python and NumPy. The fitting script and the Rayleigh script both save optional numerical output outside the repository.

~~~sh
python3 papers/master/numerics/native_rayleigh_fit.py --self-test
python3 papers/master/numerics/hopf_cuff_fit.py --angular 128 --radial 112 --output /tmp/hopf_fit_128.npz
python3 papers/master/numerics/native_rayleigh_fit.py --fit /tmp/hopf_fit_128.npz --radial 96 --radial-order 2 --longitude 24 --polar 8 --azimuth 16
~~~

## Sufficient certification margins

For this fixed profile a rigorous one-band upper enclosure \(K\le22000\) and \(P\le-22750\) would give \(Q_V\le-1500\) and \(Q_M<-839\), since \(144L<661\). Those allowances leave about \(280\) above the one-band computed kinetic term and about \(1037\) above its potential term on the \(128\times112\) full row. For comparisons to a reference function in the radial coefficients, the exact unweighted integrals of the fixed profile are

\[
 \int_0^{1/8}(\chi')^2\,ds=\frac{2554803}{31250},
 \qquad
 \int_0^{1/8}\chi^2\,ds=\frac{2246181}{256000000}.
\]

Only the weighted integrals have to be enclosed for this test, so large coefficient uncertainty can be allowed on intervals where the corresponding factor is small. Both the harmonic marking discrepancy and the quadrature error must be included. The mesh comparisons give no rigorous enclosure of either. The [rigorous Weyl exclusion] for the same fixed trial is independent of these scalar diagnostics.

## Allowing uncertainty in the scalar gradient

The [harmonic reduction] writes \(q_L=(\mathcal H+|\Phi|^2/\mathcal H)I+2\operatorname{Re}(\Phi\,dz^2)\) with \(u=\log\mathcal H\). At fixed \(\mathcal H,\Phi,\Phi'\), changing \(\nabla u\) by a planar vector \(\eta\) changes \(\partial_i q\) by \(J\eta_i I\), where \(J=\sqrt{\det q}>0\). The linear coefficients are evaluated by differentiating the cutoff and connection contributions in the [first-jet formula]. For the negative quadratic term in the [harmonic connection calculation], the changes in \(\Gamma^q_{11}\) and \(\Gamma^q_{12}\) are \((J/2)q^{-1}(\eta_1,-\eta_2)\) and \((J/2)q^{-1}(\eta_2,\eta_1)\). With \(M\) the planar block of \(G^{-1}\) and \(W_P\) the planar restriction of \((1-a)aB G^{-1} A\), the scalar increment is

\[
 b\cdot\eta-\gamma|\eta|^2,\qquad
 \gamma=\tfrac{J^2}{2}\det(M)\operatorname{tr}(q^{-1}W_Pq^{-1})>0
\]

on the changing layer. The largest increment over \(|\eta|\le C\) is \(|b|d-\gamma d^2\) for \(d=\min(C,|b|/(2\gamma))\). When \(C=\infty\), it is \(|b|^2/(4\gamma)\). The radial kinetic term is independent of \(\nabla u\).

For the \(128\times112\) fit, \(96\) base radial cells of Gauss order two, \(32\) longitude nodes per half-letter and \(8\times16\) sphere nodes, the unperturbed original numerator is \(-3473.981\). At the same fitted values and Hopf derivatives the diagnostics are

| Radius \(C\) | Two-band scalar gain | Original numerator with gain |
|---:|---:|---:|
| 1 | 2.862 | −3471.120 |
| 8 | 22.873 | −3451.109 |
| 48 | 136.513 | −3337.468 |
| 64 | 181.641 | −3292.340 |
| 256 | 710.138 | −2763.844 |
| Unrestricted | 99383.664 | 95909.682 |

The actual marking satisfies \(|\nabla u|<39\) on the footprints by the analytic estimate in the [harmonic reduction]. Center the gradient ball at zero and use radius \(39\). At that center the trace derivative of \(q\) is determined by \(2\mathcal H^{-1}\operatorname{Re}(\overline{\Phi}\,\partial_i\Phi)\). No derivative of a comparator for \(u\) is needed. On the same diagnostic data and quadrature, the two-band center kinetic and potential are \(43442.068\) and \(-47575.741\). The two-band potential gain for radius \(39\) is \(111.047\). The original numerator including that gain is \(-3362.405\), and the corresponding Neumann numerator is \(-4022.626\). The code checks the gradient gain against direct evaluations with synthetic first-jet changes and the zero-gradient decomposition against an exact conformal model.

A certification can combine this zero-centered bound with the [whole-pants smooth comparator and residual package]. Its parameter box, scalar-height comparison and harmonic-measure estimates concern the same native quantities \(\mathcal H,\Phi,\Phi'\). After enclosing those quantities on the footprints, the remaining scalar step is a rigorous weighted upper integral using the radius-\(39\) envelope. The numbers here hold \(\mathcal H,\Phi,\Phi'\) at their floating-point fit values and leave that step open.

~~~sh
python3 papers/master/numerics/native_rayleigh_fit.py --fit /tmp/hopf_fit_128.npz --radial 96 --longitude 32 --polar 8 --azimuth 16 --half-letter --gradient-slack
python3 papers/master/numerics/native_rayleigh_fit.py --fit /tmp/hopf_fit_128.npz --radial 96 --longitude 32 --polar 8 --azimuth 16 --half-letter --absolute-gradient
~~~

## Analytic enclosure of the first part of the physical band

This partial bound uses the eleven-knot profile and the actual harmonic marking. On the initial scalar-flat germ the one-band integrals are exactly

\[
 K_{[0,1/16]}=48\pi^2(4/125)^2\bigl(\cosh(17/16)-\cosh1\bigr)<.04,\qquad
 P_{[0,1/16]}=0 .
\]

On the **full angular domain** of the changing subinterval \(I=(1/16,27/400)\), equivalent to \(0<x=16s-1<2/25\), the bounds are \(K_I<.0035\) and \(|P_I|<50\). On this interval the same affine segment has \(\chi'=4/125\) and \(\chi\le79/25000\).

Write \(B=F^*g_{\mathrm{target}}\) with \(F=(h_L(z),p(\phi,\theta))\). With domain metric \(A\) and the product target, \(\|dF\|<J_0=101\) and \(\|\nabla dF\|<H_0=136000\) in bilinear operator norm for the Hessian. To verify these bounds on all longitudes, the letter step satisfies \(|H'|<10/3\), \(|H''|<64\). Use reflection in its argument to take \(0<u\le1/2\), and put \(m=-1/u+1/(1-u)\). On \([3/10,1/2]\), \(m'<40/3\), \(|m''|\le2(10/3)^3\), and \(H(1-H)\le1/4\). On \(0<u\le3/10\) writing \(z_0=1/u\) gives \(m'\le z_0^2+3\), \(|m''|\le2z_0^3\) and \(H(1-H)\le e^{10/7-z_0}\). In \(H'=H(1-H)m'\) and \(H''=H(1-H)((1-2H)(m')^2+m'')\), the maxima of \(z_0^j e^{-z_0}\) on \(z_0\ge10/3\) occur at \(10/3\) for \(j=0,2,3\) and at \(4\) for \(j=4\). Substituting \(e^{40/21}>6\) and \(e^{18/7}>12\) gives the bounds. Hence \(|\bar c'|<70/3\) and \(|\bar c''|<1070\) since these are bounded by \(7|H'|\) and \(49|H''|/(2\pi)+49|H'|^2\).

On \(I\) one has \(5/4<\sinh r<13/10\), \(\coth r<4/3\), and \(\delta=1/16\). The vector \((z,\phi-\phi_i)=\delta rp+(\bar c,0)\) has differential norm at most \(\delta r+|\bar c'|/\sinh r<19\) and Hessian norm at most

\[
 \delta(1+\coth r)+|\bar c''|/\sinh^2r+|\bar c'|\coth r/\sinh r<712 .
\]

Combine the [harmonic map bounds](HARMONIC_MARKING_ENCLOSURE_20261127.md#a-uniform-derivative-bound-on-the-two-tube-footprints) \(\|dh_L\|<\sqrt{28}\), \(\|\nabla dh_L\|<360\) with the sphere azimuth factor to obtain \(\|dF\|^2\le28\cdot19^2+(4/5)^2<101^2\). The hyperbolic Hessian component is bounded by \(360\cdot19^2+\sqrt{28}\cdot712\), and the spherical latitude and azimuth components by \(712+\frac12(4/5)^2\) and \((4/3)(4/5)+2\cdot19(4/5)\). Their sum is below \(136000\). [Physical map and Hessian formula](../reviews/NATIVE_TRIAL_INTEGRATION_20261127.md#a-sectional-contrast-of-the-actual-metric)

Let \(T_0=|I|=1/200\), \(A_0=1/90000\) and \(A_1=3/100\). On \(I\), \(a<A_0\), \(0<a'<A_1\) and \(a''>0\), with primes in \(s\). For \(a\) use \(e^{525/46}>90000\), from the Taylor sum through degree \(30\). For \(a'\) use \(16A_0((25/2)^2+(25/23)^2)<A_1\) at the right endpoint, after observing \(a''>0\) from \(1-2a>999/1000\), \(m'\ge x^{-2}\) and \(m''\ge-2x^{-3}\). Since \(G\ge(1-a)A\), put \(\beta=1001/1000>(1-a)^{-1}\). On the three-plane annihilated by \(d\theta\) one has \(B\le28(\delta r)^2 A<(1/7)A\). Hence three of the relative eigenvalues of \(G\) are at most \(1\), and the remaining one is at most \(1+A_0J_0^2\). Thus \(dV_G/dV_A<53/50\), and the slice integral of \(dV_G/ds\) is below \(111\). This gives \(K_I\le6\beta\cdot111(4/125)^2T_0<.0035\).

For the potential set \(D_0=J_0^2+1\). The [sectional product-rule calculation](../reviews/NATIVE_TRIAL_INTEGRATION_20261127.md#a-sectional-contrast-of-the-actual-metric) in an \(A\)-normal chart applies to the physical \(G=A+a(B-A)\). For \(A\)-unit vectors \(v,y\) the first-kind connection covector is bounded by \(aJ_0H_0+\frac32a'D_0\). Each rank-one cutoff Hessian term from \(\nabla^2a=a''ds^2+a'\nabla ds\) has the sectional bound \(D_0(a''+(4/3)a')/2\) after combining its three contractions. The terms with one first derivative of \(a\) and one derivative of \(B\) are bounded by \(4a'J_0H_0\), and the target curvature and Hessian terms by \(a(J_0^4+2H_0^2)\). Passing to \(G\)-orthonormal input vectors costs \(\beta^2\), and each inverse-metric connection pairing costs a further \(\beta\). Integrating these pointwise absolute bounds gives, for any \(G\)-orthonormal pair at each \(s\),

\[
\begin{split}
\int_I|R_G(v,y,y,v)|\,ds\le S_0=\beta^2\bigg[
 &T_0+(J_0^4+2H_0^2)T_0 A_0+\tfrac{D_0}{2}(A_1+\tfrac43 A_0)+4J_0 H_0 A_0\\
 &+4\beta\bigl((J_0H_0)^2 T_0 A_0^2+(\tfrac32D_0)^2 A_1 A_0\bigr)
\bigg].
\end{split}
\]

Here \(\int_I a'<A_0\) and \(\int_I a''<A_1\) use the actual flat left endpoint, and \(\int_I(a')^2\le A_1 A_0\). The six sectional terms in scalar curvature, the volume bound, and the profile weight give \(|P_I|\le12\cdot111(79/25000)^2 S_0<50\), by rational substitution giving less than \(48.024\). Thus it suffices to certify \(K_{[27/400,1/8]}\le21999.95\) and \(P_{[27/400,1/8]}\le-22800\). The early bound covers the full angular band and transfers to the second band by isometry. The remaining switched interval is open.

The frozen smooth comparator gives a separate estimate of nodal sensitivity. Decode the [dyadic scalar and response fields] and evaluate them on \(128\) base radial cells refined by the profile knots and \(s=27/400\), with two Gauss nodes per cell, \(18\) Gauss nodes per half-letter and \(6\times12\) sphere nodes. At each node use the central fields, or one of the four parameter corners of radii \((2\cdot10^{-5},5\cdot10^{-5})\) and an added scalar height of either sign and magnitude \(126\cdot10^{-6}\). Here the scalar height is the conditional error from the [whole-pants smooth comparator and residual package]. Use the radius-\(39\) zero-centered envelope throughout. The \(K\) and enveloped \(P\) figures below are per band.

| Field treatment at the quadrature nodes | \(K\) | \(P\) with the gradient envelope |
|---|---:|---:|
| Central smooth fields | 21722.746 | −23709.659 |
| Independent maximum of each term over the nine samples at each node | 21727.644 | −23700.494 |

The sample variation uses about \(4.9\) of the \(277.3\) nominal kinetic allowance and \(9.2\) of the \(959.7\) nominal potential allowance to the thresholds \(22000\) and \(-22750\). Corner samples do not bound the parameter dependence between corners, and the Gauss sums do not bound the true spatial integral. The estimates indicate which allowances the nodal variation would consume at this resolution. A continuum certificate still needs parameter and spatial enclosures, or a quadrature remainder estimate on the remaining switched interval.

## Why exact cancellation of the normal square needs a trace correction

In coordinates transported by the normal flow, let \(j\) be the density of a slice relative to its initial area density and let \(N\) be the lapse. Completing the normal derivative square in the integrated scalar form gives the homogeneous condition \(f j^{1/3}=\text{constant along each transported label}\). A nonzero constant on the cap and a nonzero constant on the exterior could satisfy it only if the final \(j\) were constant across the labels. Both physical face terms in the signed Gauss formula must still be included.

At a literal longitude pause, the two poles of the framed sphere stay fixed in the normal transport. The initial densities agree. The transport Jacobians also agree at the two poles. Indeed there \(c'=0\), the shift vanishes, and its divergence is
\[
 a\delta^2 r\operatorname{tr}\big([(1-a)I+a\delta^2r^2 q_L(0)]^{-1}(q_L(0)-I)\big)
\]
at both poles. This follows by using \(p_1,p_2\) as sphere coordinates and differentiating the normal–tangential block. At the first band's outer edge the two geometric densities nevertheless have ratio \(\sin(\pi/3+9/128)/\sin(\pi/3-9/128)>13/12\). Consequently this exact cancellation profile fails to match the two constant traces. A corrected profile would incur a normal-square cost and still has angular and lapse terms, both cap and band faces and the three original funnel responses. This calculation applies to that proposed profile. It does not decide the unrestricted sign.


## Verified negative density on a late four-dimensional cell

For \(G=t A+(1-t)B\), let \(D=A-B\), \(n=\nabla^G s/|ds|_G\), and \(h\) be the three-metric tangent to the physical \(s\)-slice. The coefficient of the pure switching Hessian in the scalar is \(-t''|ds|_G^2\operatorname{tr}(h^{-1}D_T)\). If \(V_{ijk}=(t_iD_{jk}+t_jD_{ik}-t_kD_{ij})/2\) is the switching connection of the first kind, write \(E=h^{-1}D_T\). In a \(G\)-orthonormal frame with first vector \(n\), its pure quadratic scalar term reduces to
\[
 Q_G(V,V)=\frac{(t')^2|ds|_G^2}{4}
 \left[3\operatorname{tr}(E^2)-(\operatorname{tr}E)^2+2D_{nn}\operatorname{tr}E\right].
\]
All entries of \(D\) having exactly one normal argument cancel. The [interval replay](../numerics/native_late_cell.py) evaluates the remaining terms using the difference of the two physical connections relative to \(B\). The volume in the variables \((s,\lambda,w,\tan(\psi/2))\) includes the full physical angular Jacobian. At center \((0.120,0.32,0.2,0.4)\), with half-width \(10^{-5}\) in every variable, the weighted potential density is below \(-94268\) and the weighted kinetic density is below \(6140\). Thus this one cell contributes less than \(-1.4100\times 10^{-14}\) to the half-letter integral. The bound retains true marked parameter, scalar and first-derivative uncertainty. An independent reading checked the normal-frame cancellation, measure, native profile segment and the complete cell replay. Ordinary interval evaluation without regrouping straddles zero even at half-width \(10^{-6}\); the regrouped version straddles zero at \(2\times10^{-5}\). This explains the cost of a uniform subdivision using these formulas and leaves the sign of the full integral open.


[07 trial]: ../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md
[first-jet formula]: FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md
[band exchange]: FIXED_WIDTH_BAND_TEST_20261127.md
[harmonic reduction]: NATIVE_HARMONIC_DATA_20261127.md
[mesh fitting code]: ../numerics/hopf_cuff_fit.py
[harmonic-measure basis]: ../numerics/native_harmonic_measures.py
[Rayleigh script]: ../numerics/native_rayleigh_fit.py
[harmonic connection calculation]: THREE_CUFF_RAYLEIGH_20261127.md
[rigorous Weyl exclusion]: ../reviews/NATIVE_TRIAL_INTEGRATION_20261127.md
[whole-pants smooth comparator and residual package]: SCALAR_FIT_RESIDUAL_20261127.md
[dyadic scalar and response fields]: ../numerics/whole_pants_residual_d18.json
