# E25 · Annular components and the physical shell volume

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Independent bounded execution for SP4-MASTER-B03, frozen revision 1 at `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`. Requested GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. The master main, complete-limits and physical-volume input hashes begin `c8a9f68da492`, `8b5692f2bcab` and `b972bc546624`. [Frozen request](../research-progress/handoffs/E25_ANNULAR_VOLUME.md)

**Result.** A uniform physical upper bound \(\operatorname{Vol}_g A(x,s,2s)\le Cs^4\) and a sufficiently large ratio \(R/s\) rule out two through components of the full physical distance annulus \(A(x,s,R)\). A sharper necessary bound for two through components is of order \(s^2\min\{1,R-2s\}^2\). The test uses the smaller **full exterior component**. The separated-quantile construction has yet to supply the needed scale-dependent volume bound or the marked spherical collar.

## The full distance annulus

Let \((M^4,g)\) be closed, connected and smooth, with \(H_1(M;\mathbb Z)=0\), \(\operatorname{Vol}_g M=1\), and \(g\) a Yamabe minimizer with \(R_g=Y([g])=Y\ge y_0>0\). A smooth homotopy four-sphere with the master's positive Yamabe band meets these hypotheses. All distances, volumes and gradients here are physical. Write \(d=d_g(x,\cdot)\), \(B_R=\{d<R\}\), \(U_s=\{d>s\}\), and \(A(x,s,R)=B_R\cap U_s\). A through component means a connected component of this full annulus with supremum of \(d\) equal to \(R\). The same proof tests any two components that reach a common specified smaller outer depth. Open components here are path connected. The distance ball \(B_R\) is path connected by minimizing geodesics from \(x\).

For the open cover \(B_R\cup U_s=M\), the relevant Mayer–Vietoris segment is

$$
H_1(M;\mathbb Z)\longrightarrow H_0(A(x,s,R);\mathbb Z)
\longrightarrow H_0(B_R;\mathbb Z)\oplus H_0(U_s;\mathbb Z).
$$

The second arrow is injective. If two distinct annular components lay in the same full exterior component, the difference of their two \(H_0\) generators would map to zero, since \(B_R\) is connected. Conversely each component \(U\) of \(U_s\) meets \(A(x,s,R)\). For a point of \(U\) at distance at least \(R\), follow a minimizing geodesic back towards \(x\) until its distance is strictly between \(s\) and \(R\), staying in \(U_s\) on this segment. Hence the inclusion gives a bijection on components. Every full exterior component that reaches farther than the inner place of interest can be tested using this bijection. The exact sequence works with arbitrarily many components and needs no regularity of the distance spheres. It applies to the full actual annulus. If comparison charts cover only a subset of the annulus, two of their components could belong to the same full component. [Hatcher, Algebraic Topology, §2.2, pp. 149–150](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf#page=158) · [Owning marked whole-domain use of Mayer–Vietoris](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L504)

## The cutoff on the smaller full arm

Given two candidate arms, choose the one whose full exterior component \(U\) has smaller volume. The two full components are disjoint and \(\operatorname{Vol}_g U\le1/2\). Define a test on \(M\) by

$$
\chi(z)=\begin{cases}
\min\{1,(d(z)-s)/s\},&z\in U,\\[2pt]
0,&z\notin U.
\end{cases}
$$

On \(U\) this is \(1/s\)-Lipschitz. For points on different sides of \(U\), a minimizing path between them must leave \(U_s\) if it starts in \(U\), so its length is at least \(d(z)-s\) for the initial point \(z\in U\). This proves the same global Lipschitz constant. Distance spheres have zero four-volume, for example by polar geodesic integration, and the weak gradient is supported in \(A(x,s,2s)\cap U\) up to a null set. The Yamabe inequality applies by \(H^1\) and \(L^4\) smooth density on the fixed closed manifold. If smooth tests with support in \(U\) are desired, place the Lipschitz transition between \(s+\epsilon\) and \(2s-\epsilon\) first. Its support then has positive distance from \(M\setminus U\). Approximate it in \(H^1\) and \(L^4\) by smooth functions supported in \(U\) using local mollification and a partition of unity on a neighborhood of that compact support. Taking the smoothing limit and then \(\epsilon\downarrow0\) gives the displayed test and its sharp transition bound. No smooth model for the two distance levels or common chart across the transition is needed. [Lee–Parker, §1, equations (1.1)–(1.3), and §2](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Owning physical small-support Yamabe estimate](../manuscript/physical_volume.tex#L57)

Set \(a=1-2^{-1/2}\) and \(P=U\cap\{d\ge2s\}\). Using constant scalar curvature in the physical gauge gives

$$
y_0 a\,\operatorname{Vol}_g(P)^{1/2}
\le Y a\,\|\chi\|_{L^4(g)}^2
\le 6\int_M|d\chi|_g^2\,dV_g
\le 6s^{-2}\operatorname{Vol}_g(A(x,s,2s)\cap U).
$$

The middle inequality uses \(\|\chi\|_2^2\le\operatorname{Vol}_g(U)^{1/2}\|\chi\|_4^2\). The half-volume restriction is on the support component \(U\) in the full closed source and cannot be obtained by comparing the volumes of the two truncated annuli. In particular, with \(D_s=\operatorname{Vol}_g A(x,s,2s)\le Cs^4\),

$$
\operatorname{Vol}_g(P)\le
\left(\frac{6D_s}{a y_0s^2}\right)^2
\le\left(\frac{6C}{a y_0}\right)^2s^4 .
$$

## Noncollapse and the scale ratio

For any center \(z\), set \(V_z(t)=\operatorname{Vol}_g B_g(z,t)\). The linear cutoff equal to one on the \(t/2\)-ball and zero outside the \(t\)-ball gives

$$
YV_z(t/2)^{1/2}\le (24/t^2+Y)V_z(t).
$$

Writing \(F_z(t)=V_z(t)/t^4\) gives \(F_z(t)\ge[Y/(4(24+Yt^2))]F_z(t/2)^{1/2}\). For \(0<t\le1\) the coefficient is at least \(b_0=y_0/[4(24+y_0)]\). Iterate and use \(F_z(t/2^j)\to \pi^2/2\) for each fixed smooth metric. It follows that \(V_z(t)\ge c_0t^4\) for \(t\le1\), where \(c_0=b_0^2>0\). Along a minimizing segment the open unit balls at arclength intervals of two are disjoint. Their total volume is at most one, so the diameter is bounded above by \(D=2/c_0\). This derivation needs no curvature comparison sign. [Master physical small-ball iteration and diameter packing](../manuscript/complete_limits.tex#L183)

For \(z\in U\) with \(d(z)>2s\), the physical ball centered at \(z\) with radius \(t=\min\{1,d(z)-2s\}\) lies in its plateau \(P\). Along every minimizing segment in this ball from \(z\), the distance from \(x\) stays strictly above \(2s\). This verifies containment in the **same** global arm. These segments also realize the ambient ball by paths internal to that plateau. Applying noncollapse yields

$$
D_s\ge \frac{a y_0\sqrt{c_0}}{6}\,s^2
\min\{1,d(z)-2s\}^2.
$$

If two arms reach depth \(R>2s\), let \(d(z)\uparrow R\) in the chosen smaller arm. This gives the stated necessary lower bound for \(D_s\). If \(D_s\le Cs^4\) and \(C>0\), set \(\kappa=(6C/(a y_0\sqrt{c_0}))^{1/2}\). When \(\kappa s<1\), every full exterior component of volume at most one half then lies in \(\{d\le(2+\kappa)s\}\). For through components \(R\le D\). Therefore

$$
R/s>\max\{\,2+\kappa,\,\kappa D\,\}
$$

is sufficient to exclude two of them, even if one of the original arms has positive limiting physical volume. The case \(C=0\) is excluded for two through arms directly by the displayed necessary lower bound. If a deep component exists and \(\kappa s<1\), every point with \(d>(2+\kappa)s\) lies in that one global exterior component. This concerns where complete raw sets at those distances can lie. A cut through an embedded \(S^3\) still requires the marked collar to separate the full inner and outer crossing sets. Connectivity of the through component supplies neither a spherical link, metric comparison on its splices, nor separation by the middle sphere of a chart that covers only some of that component. [Required full-side inclusion in the short-cut argument](../manuscript/variational_comparison.tex#L22) · [Owning balanced marked criterion](../manuscript/marked_cut.tex#L230)

## Separated quantiles and the missing upper bound

The separated chiral quantiles give a buffer of many logarithmically spaced physical annuli. The physical full-curvature budget selects a subblock with \(\nu(A)\to0\) at fixed relative width in the source, where \(\nu=|\operatorname{Rm}|_{\rm tens}^2dV_g\). In four dimensions \(|\operatorname{Rm}|_{\rm tens}^2\ge R_g^2/6\), so this shows \(\operatorname{Vol}_g(A)\le 6y_0^{-2}\nu(A)=o(1)\). To use the sufficient condition \(D_s\le Cs^4\) by this estimate would require a bound of order \(s^4\) on the annular curvature integral. Even the weaker two-arm criterion needs control against \(s^2\min\{1,R-2s\}^2\). Neither rate follows from an absolute \(o(1)\) as the radii shrink. An application of the same cutoff to the inner ball with nonzero support volume at most one half gives

$$
\operatorname{Vol}_g A(x,s,2s)\ge
\frac{a y_0}{6}\,s^2\operatorname{Vol}_g B_g(x,s)^{1/2},
$$

again a **lower** bound. Noncollapse strengthens its right side to a multiple of \(s^4\) for \(s\le1\). Choosing the inner radius in a region where Euclidean infinitesimal volume asymptotics hold is possible for each fixed metric. The quantile selection needs that radius above the smaller chiral quantile radius, and the available hypotheses give no uniform relation between those scales. Bishop volume comparison in the auxiliary positive-Ricci metric concerns its own volume and radii. Pulling back that comparison to the physical shell would require additional control of the conformal factor and of the locations of the distance levels. Thus the corrected component test is conditional in the frozen setting, with an explicit missing physical upper volume estimate. [Master separated-quantile selection](../manuscript/complete_limits.tex#L280) · [Physical and positive-Ricci gauges](../manuscript/physical_volume.tex#L7) · [Physical full-curvature norm decomposition](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/physical_volume_and_marked_conformal_limits.tex#L266)
