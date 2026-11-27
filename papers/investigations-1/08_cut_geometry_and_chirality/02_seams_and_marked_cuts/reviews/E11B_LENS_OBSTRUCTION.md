# SP4-CUT-SEAM-E11B — Independent readback of the marked lens energy obstruction

27 November 2026 (America/New_York packet date). Prepared for Edward B. Baker III with OpenAI Codex assistance. Requested GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Read [E11 request r1](../research-progress/handoffs/E11_REQUEST_R1.md), SHA-256 `ccc3c2e19886dcfe8a012bed9e318f3fb7bda58b4bbf61ccde5b6a8a8c582a30`, [E09A](../notes/E09A_LENS_METRIC.md), `1c1775edb1faf9651a5e51c9ef93d0613553e4e142d4bb89ca27a61be01632ca`, and [E09B](../notes/E09B_LENS_MARKING.md), `a13f8c8a4b197162563c8749ba51b9ddf3d832781aba889632fb4d71f9f0f4d8`. The [07 curvature note](../../../07_positive_subcritical_entry/notes/CONNECTION_CURVATURE.md) at `708236af423b65ebe8bdda01a87ff263aae6705d03b64568c4d702e4c0742bee` supplies a sign comparison. Hashes are SHA-256.

**Verdict.** The unit round half-disk obstruction in E09B holds in each chirality for the marked product exteriors, with arbitrary smooth \(SO(3)\) connection on the unit two-sphere fibre. The same marked ansatz with independent positive constant base curvatures on the two caps has \(E_\pm>501T/250>2T\), by the separate weighted estimate below. Here \(T=4\pi^2\), curvature of a unit sphere is \(+1\), and \(E_\pm\) uses the real HS curvature-operator convention.

## The marked topology and required angle

Each half consists of \(N\times[0,\pi]\), \(N=L(3,1)\setminus B_r(p)\) with \(0<r<\pi/3\), and an \(S^2\) bundle over a spherical half-disk. The half-disk retracts onto its attaching arc, and the sphere bundle is topologically trivial. Thus the cap retracts onto the attaching region and the inclusion of the exterior gives the cyclic group of order three and the homology of \(N\). The two ends of the same product send their deck generators, transported through the product, to the same generator \(u\). Relative to the other half's product generator \(u'\), a gluing preserving the displayed lens pieces and connector has two signs \(\epsilon_\pm\). It forms the pushout with relations \(u=(u')^{\epsilon_-}=(u')^{\epsilon_+}\), so trivial \(\pi_1\) requires opposite signs. For opposite signs the map on integral \(H_1\) is invertible since the determinant is a unit modulo three. Mayer–Vietoris gives homology \(S^4\), so with the given oriented gluing the resulting smooth type is a homotopy four-sphere. Exchanging the end labels leaves the condition unchanged.

A marked conformal map on an end of E09A is conformal for the underlying round lens metric, since the exterior cutoff is a conformal factor. Its lift to the spherical universal cover of \(N\) extends by Liouville to a Möbius map. The conjugacy on the cyclic deck group extends with it. The hyperbolic ball action of that group has the centre as its unique fixed point, so the Möbius normalizer fixes the centre and is round orthogonal. Its conjugation on the generator \(\cos(2\pi/3)I+\sin(2\pi/3)J\) implies \(AJ=\epsilon JA\). Thus the fibre action on the marked puncture tangent sphere sends the Hopf vector of one end to the Hopf vector of its partner with sign \(\epsilon\). Denote the end actions \(Q_\pm\). In the parallel sphere frames on the connector, a marked product isometry has constant action on \(S^2\) because it preserves the two Ricci eigenspaces. The same holds for a conformal map of the connector carrying the two boundary spheres to their marked partners. In the Euclidean annulus scale this Möbius map conjugates the composition of inversions in the two concentric spheres to the analogous composition in its target, hence preserves the unordered pair of fixed points \(0,\infty\). It is a rotation and radial dilation, possibly with orientation reversal or radial inversion, and its angular action is constant. Thus \(Q_+P_1=P_2Q_-\), with \(P_i\) the diameter transport in the exterior product framing and with inversion if required by an endpoint reversal. Opposite signs force \(Q_-^{-1}Q_+\) to send the Hopf vector to its negative, and the transport equation puts the relative action in \(SO(3)\). Its angle is \(\pi\), so
\[
 d(I,P_1)+d(I,P_2)\ge\pi .
\]
This argument uses the actual marked lens ends and the common marked boundary metric. A cap frame change alone gives equality of the physical arc and diameter transports for a flat connection, as the two paths are homotopic in the half-disk rel endpoints.

For the fixed-axis convention the fibre azimuth has period \(2\pi\); with metric \(d\alpha^2+\sin^2\alpha(d\phi+A)^2\) the transported angle is \(-\int FdA_q\) modulo \(2\pi\) when \(F=*dA\), up to reversal of the loop orientation. Its angle distance is bounded by \(|\int FdA_q|\). For general \(SO(3)\) write \(b=*F_A\) with Lie algebra norm given by angular speed. The arc transport is trivial in the physical exterior product frames. Radial gauge \(A_r=0\) from a central basepoint on an interior disk gives \(A_\theta(R,\theta)=\int_0^R F_{r\theta}(r,\theta)\,dr\). The angular speed of the parallel-transport path around that loop is \(|A_\theta|\). Hence its angle distance to the identity is at most \(\int|F_{r\theta}|dr\,d\theta=\int |b|\,dA_q\). Taking smoothly rounded loops tending to the piecewise smooth boundary gives the same bound for \(P_i\). Write \(\xi_i=\int |b_i|\,dA_{q_i}\). Then \(\xi_1+\xi_2\ge\pi\). For a fixed axis one can replace \(\xi_i\) by the absolute flux.

The cap curvature field \(b\) vanishes on the arc by first-jet matching in the marked product collar. The metric determines the horizontal distribution, whose first derivatives determine the vertical bracket. On the diameter, in base geodesic collar gauge \(A_n=0\), the off-diagonal second fundamental form with one horizontal diameter direction and one vertical direction is, up to a normal sign, \(\langle b\times p,Z\rangle/2\) at fibre point \(p\). It is untouched by subtracting a multiple of the metric. Umbilicity at all fibre points forces \(b=0\) on the diameter. Thus \(|b|\in H^1_0\) on the half-disk and \(|\nabla |b||\le |D_A b|\).

## Local Weyl calculation and the unit base

For a fixed axis take an oriented orthonormal base coframe \(e^1,e^2\) and \(e^3=d\alpha,\ e^4=\sin\alpha(d\phi+A)\). Put \(v=F\sin\alpha\), \(h=\cot\alpha\), \(j_i=(\partial_iF)\sin\alpha\). Cartan's first equation gives
\[
 \omega_{12}=\omega^q_{12}-\tfrac12v e^4,\quad
 \omega_{14}=-\tfrac12v e^2,\quad
 \omega_{24}=\tfrac12v e^1,\quad \omega_{34}=-h e^4,\quad
 \omega_{13}=\omega_{23}=0 .
\]
With \(\Omega=d\omega+\omega\wedge\omega\), the \(12,34\) sectional terms are \(K-3v^2/4,1\), and the only nonzero mixed sectional terms in this frame are \(v^2/4\) for \(14\) and \(24\). The entries \(\mathcal R_{12,34},\mathcal R_{13,24},\mathcal R_{14,23}\) are \(-vh,-vh/2,vh/2\); \(\mathcal R_{12,i4}=-j_i/2\). In the chiral basis beginning \((e^{12}\pm e^{34})/\sqrt2\) and completed by \((e^{13}\mp e^{24})/\sqrt2,(e^{14}\pm e^{23})/\sqrt2\), subtracting \(R/12\) from the compression gives first diagonal \((K+1-v^2)/3\mp vh\) and the other diagonals its negative half. The derivative contribution to the squared HS norm is \((j_1^2+j_2^2)/8\). The odd term in the diagonal square integrates to zero on the fibre.

For arbitrary \(SO(3)\) the same algebraic entries use \(C=b\times p\), \(v^2=|C|^2\), \(vh=b\cdot p\), after aligning a vertical basis vector with \(C\) where \(C\ne0\). This is valid for the algebraic entries because the horizontal bracket has vertical part \(-b\times p\), and the vertical derivative of its dual one-form is \(2(b\cdot p)dA_{S^2}\), as in the explicit fixed-axis calculation at the given value of \(b\). In base normal frames and a fibre gauge \(A=0\) at the base point, \((\nabla_{e_i}e_j)^V=-F_A(e_i,e_j)\times p/2\) from Koszul. Differentiating gives \((R(e_1,e_2)e_i)^V=(D_i b)\times p/2\); the vertical bracket contribution uses \(\nabla_Ce_i\), whose vertical part vanishes by total geodesy of the fibres. Thus \(u_{i\alpha}=\mathcal R_{12,i\alpha}=-\langle(D_i b)\times p,e_\alpha\rangle/2\). The \(\mathcal R_{34,i\alpha}\) entries vanish by fibre Codazzi. The two first-row chiral off-diagonals are \((u_{13}\mp u_{24})/2,(u_{14}\pm u_{23})/2\). In their HS contribution the signed mixed term is proportional to \(p\cdot(D_1b\times D_2b)\), with zero mean. Together with the diagonal contribution, the sphere moments of \(|b\times p|\) give separately for either chirality
\[
 \frac{E_\pm(\mathrm{cap})}{4\pi}\ \ge\ \int
 \left(\frac{(K+1)^2}{6}+\frac{5-4K}{18}|b|^2+\frac4{45}|b|^4+
 \frac1{12}|D_A b|^2\right)dA_q.
\]
This uses only the listed entries and holds for arbitrary smooth \(SO(3)\) connection and arbitrary positive constant \(K\). The fixed-axis Cartan calculation gives equality. This reads E09B's gradient coefficient \(\pi/3\) per base area in both signs.

On \(K=1\) the base lies in a hemisphere. The positive coordinate normal to the equator is a Dirichlet eigenfunction with eigenvalue \(2\). The ground-state identity and extension of \(|b|\) by zero give \(\int |D_A b|^2\ge 2\int|b|^2\). If the base area is \(\pi B_i\), then the first-jet condition of the round product exterior is \(\cos S_i/\sin S_i=-\cos r_i\), with \(S_i\) the cap radius. Thus \(B_i=1+\cos r_i/\sqrt{1+\cos^2 r_i}>1+1/\sqrt5\). Cauchy–Schwarz gives \(\sum_i\int|b_i|^2\ge\pi/(B_1+B_2)\). The exterior contributes zero Weyl cost and the total pair bound is
\[
 \frac{E_\pm}{T}\ \ge\ \frac23(B_1+B_2)+\frac{2}{9(B_1+B_2)}\ >\ 2.
\]
Indeed the right hand side increases for \(B_1+B_2\ge 2(1+1/\sqrt5)\), and comparison with two at that endpoint reduces to \(6\sqrt5>13\). At E09A's parameters the lower bound is \(100/51+17/225\). First-jet smoothing convergent in \(C^1\cap W^{2,2}\) preserves the strict excess for sufficiently small smoothing parameters. No scalar sign assumption can reduce the Weyl lower bound.

## Independent extension to separately constant base curvatures

For a spherical base of curvature \(K>0\) write \(S=\sqrt K\,s_0\) for the angular radius. Its circle radius is \(\sin(\sqrt K\,s)/\sqrt K\); the matched logarithmic derivative at the arc is \(-\cos r\). Thus put
\[
 \eta=-\cos S=\frac{\cos r}{\sqrt{K+\cos^2r}}>\frac1{\sqrt{4K+1}},
 \qquad |D|=\frac{\pi(1+\eta)}{K}.
\]
A round disk of nonpositive constant curvature with regular centre has positive radial derivative of the circle radius and cannot give this first-jet match. On the corresponding *unit* spherical domain the positive function \(y=\sin s\sin\theta\), \(0<\theta<\pi\), satisfies \(-\Delta y=2y\). For a compactly supported test \(f\), the ground-state identity is
\[
 \int_D(|\nabla f|^2-2 f^2)=\int_D y^2|\nabla(f/y)|^2 .
\]
At fixed \(\theta\) the right hand side includes the radial form with weight \(\sin^3s\sin^2\theta\). For \(g=f/y\) use \(g(s)=-\int_s^S g'(t)\,dt\), weighted Cauchy–Schwarz, and integrate over \(s\). This gives a lower bound by \(I(-\eta)^{-1}\int f^2\), where
\[
 I(-\eta)=\int_0^S\frac{\int_0^t\sin^3s\,ds}{\sin^3 t}\,dt
 =\frac{\log(2/(1-\eta))+(1-\eta)^{-1}-1/2}{3}.
\]
Smooth compactly supported approximation gives the resulting Dirichlet lower bound for \(|b|\); restoring curvature \(K\) multiplies it by \(K\). This derivation imposes no radial symmetry on \(b\).

Write \(f_0=(K+1)^2(1+\eta)/(6K)\), \(\beta=(5-K)/18+K/(12I(-\eta))\) and \(q=K\beta/(1+\eta)\). When \(\eta<2/3\) one has \(\beta>0\), as quantified below. From the fibre curvature bound, the Dirichlet constant and Cauchy–Schwarz on the cap,
\[
 \frac{E_\pm(\mathrm{cap})}{T}
 \ge f_0+q(\xi/\pi)^2
 \ge f_0-\frac1{64q}+\frac{\xi}{4\pi}.
\]
All omitted terms are nonnegative. The following rational bounds are uniform on the permitted \(K,\eta\).

- For \(1/2\le\eta<2/3\), \(I<3/2\) since \(\log6<2\), so \(\beta\ge5/18\). Hence \(f_0-1/(64q)\ge (1+\eta)(1/3+K/6+53/(480K))\ge (1+\sqrt{53/80})/2>7/8+1/500\).
- For \(\eta\le1/2\), \(I<1\) since \(\log4<3/2\), so \(\beta\ge(10+K)/36\). This yields
\[
 f_0-\frac1{64q}\ge
 \left(1+\frac1{\sqrt{4K+1}}\right)\left(\frac13+\frac K6+\frac{53}{480K}\right)=:G(K).
\]
Putting \(x=\sqrt{4K+1}>1\), we have \(120x(x-1)(G(K)-7/8)=P(x)=5x^4-75x^2+105x+18\). For \(y=x-9/4>-5/4\), Taylor expansion gives \(P(x)\ge 693/256-75y/16+(165/8)y^2>2\), since the discarded quadratic coefficient is nonnegative and the displayed quadratic minus 2 has negative discriminant. For \(x\le3\) this gives \(G(K)-7/8>1/360>1/500\). For \(x\ge3\), \(P(x)-(6/25)x(x-1)\) is positive at 3 with positive first derivative and positive second derivative on that ray. Thus \(G(K)-7/8>1/500\) here as well.
- If either cap has \(\eta\ge2/3\), its baseline already gives \(f_0\ge10/9\). The baseline applies directly when the net curvature terms might otherwise involve a negative \(\beta\): fibre energy is not bounded below by the baseline pointwise for every \(K\), but for \(K\le5\) the hemisphere Dirichlet constant alone gives combined term \((5-K)|b|^2/18\ge0\). For \(K>5\), completing the square in the remaining \(|b|^2\) and \(|b|^4\) terms gives the cap lower bound \((1+\eta)((K+1)^2/6-5(K-5)^2/576)/K>10/9\). Indeed this expression is at least its value for \(\eta=0\); the quotient there is increasing on \(K\ge5\) and begins at \(6/5>10/9\). For any other cap with \(K\le5\) the baseline is \(>8/9+1/250\): for \(K\le15/8\) use \(1+1/\sqrt{4K+1}>47/35\) and \((K+1)^2/(6K)\ge2/3\); for \(15/8\le K\le2\) use \(529/720\) times \(4/3\); for \(2\le K\le3\) use \((3/4)(5/4)\); for \(3\le K\le4\) use \((8/9)(6/5)\); and for \(4\le K\le5\) use \(25/24\). For \(K>5\) the above quartic estimate also gives \(>8/9+1/250\).

The last case gives the pair bound from the two separate lower bounds. In the first two cases sum the completed squares and use \(\sum_i\xi_i/\pi\ge1\). In all cases this proves \(E_\pm/T>2+1/250=501/250\), with no equality assumption on the two constants \(K_i\) or restriction to a fixed curvature axis. The argument uses the topological marking requirement and the round base and fibre geometry throughout.

## Readback of E10

The [E10 flux argument](E10_LENS_FLUX.md), SHA-256 `215af486411261a52d0be321aaddc75b5a4c5e608f1f3d02a5b6f1581db8861b`, is verified in its own fixed-axis scope. Its actual two-twist-spun-trefoil decomposition uses the two page faces of the compact fibre bundle cut into intervals. The extra \(S^2\times D^2\) attaches to the exterior interval piece along one puncture arc times \(S^2\), preserving the marked end injections. The §4.2 construction identifies the trefoil fibre as the punctured \(L(3,1)\); the opposite signs then follow from the integral \(H_1\) map of the actual \(S^4\). [Zeeman, main theorem and Corollary 5, pp. 486–487](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/zeemantwist.pdf#page=16) · [Burke–Burton–Spreer, §4.2](https://link.springer.com/article/10.1007/s00454-026-00818-w#Sec10)

The conformal end and annulus calculation checks by the separate Möbius arguments above. For the torsion bound, layer cake gives \(\int|f|=\int\mu(t)\,dt\). On regular levels coarea bounds the gradient form below by \(\int L(t)^2/(-\mu')\,dt\). Cauchy–Schwarz with this density and \(L^2\ge4\pi\mu-c\mu^2\), followed by monotonicity of \(\mu\), bounds the complementary factor by \(\int_0^A s/(4\pi-cs)\,ds\le A^2/[2(4\pi-cA)]\). Any singular variation in \(\mu\) only reduces the integral over regular levels. This gives E10 equation (4) with \(A=\pi a/c\). Splitting at \(c=5/4\) handles the sign of \(5-4c\) by using the flux bound for the nonnegative potential and the hemisphere inequality to absorb the negative potential, keeping fraction \((5-c)/(3c)\) of the gradient term. The two \(Q\)'s agree at \(5/4\). Completing the square with slope \(1/5\) subtracts \(1/(100Q)\). The \(a>8/5\) branch uses \(c<16/9\), while the three lower formulas for \(a\le8/5\) follow from \((4-a)/a\ge3/2\). I independently checked every endpoint and product of the eight table rows using exact rational comparisons, including the minimum \(4510083/5000000>451/500\). For \(c\ge3\) the separate baseline and quartic comparisons give E10's \(551/500\) cap bound. Finally, \(\min(x_1,1)+\min(x_2,1)\ge1\) for \(x_1+x_2\ge1\) and \(x_i\ge0\). These steps give E10's \(501/250\) pair constant. With the proved covariant derivative coefficient and holonomy bound, the same scalar estimates can use the \(H^1_0\) function \(|b|\), flux \(\xi\), and \(|\nabla |b||\le |D_A b|\). The weighted proof above supplies a separate route to the margin without spherical isoperimetry. [Ros, §1.3, printed p. 179](https://www.claymath.org/wp-content/uploads/2022/03/cmip02.pdf)

## Primary passages and scope

AHS §1, p. 427, Eq. (1.1) and following sentences identify the Weyl operators as the trace-free diagonal Hodge blocks of the curvature operator. The local [AHS PDF](../../../../../references/Atiyah.pdf), PDF p. 4, is the previously read primary copy (SHA-256 `a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6`). The computation above fixes all representation and norm factors directly. The Liouville passage on p. 47 of Schoen–Yau, *Conformally flat manifolds, Kleinian groups and scalar curvature* (1988), identifies conformal maps of open spherical charts with Möbius restrictions. The group normalizer and transport arguments follow from the deck action and the parallel-transport ODE. [Schoen–Yau](https://math.jhu.edu/~js/Math646/schoen-yau.conformal.pdf)

This excludes the model with a unit sphere fibre, spherical constant-curvature bases admitting the displayed first-jet match, genuine product exteriors in the marked collar, and common boundary conformal identification carrying the assigned lens ends and connector to their partners. It leaves general fillings, nonconstant curvature bases and changes of fibre geometry or marking as separate problems under the [paired filling criterion](../notes/B04_PAIRED_FILLING.md). The explicitly constructed E09A positive Robin half realizes the smaller untwisted budget. Its untwisted transport does not realize the opposite signed projections.
