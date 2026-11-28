# WIN-E18 · Independent reading of the centered extrema

28 November 2026 UTC, 27 November in America/New_York. Prepared for Edward B.
Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/REQUEST_REPLAY_EXTREMA_R1.md)
lists GPT-6.2 Sol/ultra. Actual serving variant and effort are unavailable.
Baseline `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`. The reader did not
author the centered extrema proof. Input SHA-256 digests follow.

| Input | SHA-256 |
| --- | --- |
| [Centered extrema, revision 1](../notes/CENTERED_EXTREMA.md) | `5ca81169c76e3edec6f097b3eb497db4e6d13da84791ed15e1e84ce45e840b83` |
| [Concentration](../notes/PENCIL_CONCENTRATION.md) | `d6b5cfef1bddefa9a6d685f716639e22169fb9df6023b6fa26ac016af02d59b4` |
| [Spectral estimate](../notes/BALANCED_SPECTRAL_BOUND.md) | `8dff6f0d96d781987d247243c6cd67704b1ea21c61ef810fc0f1409cb1a0250b` |
| [E13 degree and generation](../notes/E13_SPINOR_PENCIL.md) | `c83f9cc8071ee6080032b16c3ce23c675755ab7512672073749d9117c000cfd8` |
| [Pencil rigidity, revision 1](../notes/PENCIL_RIGIDITY.md) | `91df5d33802e285f9eb212296e512e150fa12be18fa1d22c6117cf163ca2503f` |

The stated extrema and class-level attainment replay. This reading imports
the fixed-metric spectral inequality and attained-zero rigidity as two
separate inputs. For each fixed metric the centered admissible family is
nonempty and its infimum \(b(g)\) lies in \([0,\infty)\). Within any
conformal class and any prescribed volume, the infimum over representatives
is zero. On the same fixed smooth manifold, the supremum over all metrics
is infinite already at volume one.

## Density, Gram matrix and fixed-metric existence

Take \(M\) closed, oriented and smooth with the homotopy type of \(S^4\),
with any smooth Riemannian metric \(g\) and positive right quaternionic
half-spin line. A generating pencil has kernel map \(f\colon M\to S^4\)
of degree \(-1\) with the E13 orientation, hence onto. For each unit \(v\)
in \(\mathbb R^5\), the cap preimage \(U_v=\{x:v\cdot f(x)>3/4\}\) is
nonempty and open, so has positive \(g\)-volume. For \(|u-v|<1/4\), the
bound \(u\cdot f(x)>1/2\) holds on \(U_v\). A finite cover of the direction
sphere by these neighborhoods supplies one strictly positive constant
\(c=\min_v\mathrm{Vol}_g(U_v)\), with the minimum over the finite selected
directions. It gives
\[
 Z(a)=\int_M e^{a\cdot f}\,dV_g\ \ge\ c e^{|a|/2}\qquad(a\ne0).
\]
The minimizer exists by coercivity. Differentiation under the integral
gives zero first moment for the associated exponential density. For any
\(V_*>0\), \(w=V_* e^{a\cdot f}/Z(a)\) is smooth, positive, and satisfies
\(\int w\,dV_g=V_*\) and \(\int f w\,dV_g=0\). This construction applies
to each pencil separately.

Write \(K=\ker E\) and \(m=\|E\|_{\rm op}>0\). Then \(E^*E/m^2=I-\Pi_K\).
For a unit vector \(u=(u_0,u_1)\) in \(K\), put \(z=2u_0\bar u_1\),
\(t=|u_0|^2-|u_1|^2\). The matrix \(2\Pi_K-I\) has diagonal \((t,-t)\)
and off-diagonal \((z,\bar z)\). Its five real components are exactly
the unit sphere coordinates of \(f\). In any centered metric of mass
\(V\), the matrix integral of \(E^*E/m^2\) is consequently \(VI/2\).
The common multiplier \(\rho=\sqrt{2/V}/m\) makes the integrated
quaternionic Gram matrix \(I\). It is smooth and positive and leaves
the kernel fixed. At its vanishing parameter the derivative term in
\(P_g(\rho s_k)\) involving \(d\rho\) is zero, while both \(B_xk\) and \(m\)
scale by \(\rho(x)\). Thus this normalization preserves the residue.

For existence on the original \(g\), start with E13's generating pair
and the tilted measure of mass \(V=\mathrm{Vol}_g(M)\). Set
\(\omega_0=dV_g\), \(\omega_1=w\omega_0\), and let \(\omega_s\) be their
linear interpolation. All are positive smooth top forms, and
\(\omega_1-\omega_0=d\alpha\) because the masses agree on the connected
oriented closed manifold. The vector field \(\iota_{X_s}\omega_s=-\alpha\)
is smooth and its flow \(\phi_s\) exists for the full interval by compactness.
Since \(\partial_s\omega_s+\mathcal L_{X_s}\omega_s=0\), its terminal map
satisfies \(\phi^*\omega_1=\omega_0\), or \(\phi_*\omega_0=\omega_1\) as
measures. Thus \(\int(f\circ\phi)\omega_0=\int f\omega_1=0\). To obtain
this kernel map on the existing spin bundle, let \(\tau_x\) denote
parallel transport in \(S_g^+\) from \(x\) to \(\phi(x)\) along
\(s\mapsto\phi_s(x)\). The pair \(\tau_x^{-1}s_i(\phi(x))\) is smooth,
generates each fibre, and has kernel \(K_{\phi(x)}\) by invertibility
and quaternionic linearity of transport. The Gram normalization now
gives an admissible pair on \(g\). The residue is finite by smoothness on
the compact base and \(m>0\). This pullback with bundle transport supplies
existence on the fixed metric. Its residue there is uncontrolled.

Moser's Theorem 2 assumes a smooth path of closed nondegenerate forms
with fixed periods on the compact base and gives \(\phi_s^*\omega_s=\omega_0\)
from the identity. In this application positivity and equality of total
volume supply the nondegeneracy and period premises in degree four.
The source derivation of the flow and contraction equation appears in
§4, (10)–(12), pp. 292–293. [Moser, *On the volume elements on a manifold*,
Trans. Amer. Math. Soc. 120 (1965), 286–294](https://people.math.harvard.edu/~dafr/M392C-2018-MorseTheory/Readings/Moser.pdf#page=7)

## Conformal infimum, smooth-metric supremum and fixed-metric qualification

On a fixed representative \(g\), start with the concentrating sequence
whose \(R_g\) tends to zero prior to imposing volume centering. For each
kernel map separately choose its \(w\) with prescribed mass \(V_*\).
Put \(a=w^{1/4}\) and \(h=a^2g=w^{1/2}g\). In dimension four
\(dV_h=a^4dV_g=w dV_g\). The conformal spin isometry \(\beta\) transports
sections with factor \(a^{1/2}=w^{1/8}\), and the norm of their twistor
derivative scales by \(a^{-1/2}\) under the tensor isometry. Thus the
kernel map stays fixed, \(m_h=a^{1/2}m_g\), and \(|B_h k|/m_h\) is
\(a^{-1}=w^{-1/4}\) times \(|B_g k|/m_g\). The fourth power exactly cancels
the volume change. The new metric centers \(f\), and its Gram normalization
preserves \(R\) again. The construction uses the new metric \(h\) for
the resulting centered pair.
[Conformal twistor equation](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L359)

Rigid zero applies to any individual attaining pencil. At class level the
converse uses a unit round representative. Its exact pencil has a spherical
isometry as kernel map to the unit target, hence zero coordinate means.
Constant rescaling to \(V_*\) preserves centering and zero residue. Its
Gram can be normalized as above. Zero infimum over representatives and
existence of an attaining pencil are two different conclusions.

For the other extremum, Colbois–Dodziuk's Theorem 1 on p. 905 gives
unit-volume metrics with arbitrarily large first positive scalar eigenvalue
on each compact manifold in the stated dimension range \(n\ge3\).
Their setting is smooth and connected, and their proof on pp. 905–906
uses a connected sum with a standard smooth sphere and explicitly
identifies the resulting manifold with the underlying \(M\). Thus it
applies on the fixed closed four-manifold here. The proof describes
smooth positive multipliers and a final volume normalization. With
\(V=1\), \(L=\lambda_1\) grows without bound and the submitted fixed-metric
lower bound for every centered pencil grows with it as
\((L^2-16V_0)_+/(408L)\). Taking the infimum over the nonempty family and
then the supremum of the resulting \(b(g)\) gives \(+\infty\). The source
checks used the published texts on 27 November 2026, America/New_York.
[Colbois–Dodziuk, *Riemannian metrics with large* \(\lambda_1\), Proc. Amer.
Math. Soc. 122 (1994), 905–906](https://www.researchgate.net/profile/Jozef-Dodziuk/publication/265433300_Riemannian_Metrics_with_Large_l_1/links/54e5f64e0cf2cd2e028b542e/Riemannian-Metrics-with-Large-l-1.pdf)

On a fixed metric outside the conformally round class, rigidity excludes
zero for an individual pencil. The submitted spectral inequality gives
a positive infimum when \(L>4\sqrt{V_0}\). For a fixed metric outside
that class at or below the threshold, these results leave positivity
and attainment of its infimum undecided. The uncentered fixed-metric
sequence does not impose the volume moments.

If nonround means a metric with nonconstant sectional curvature, a
fixed-metric gap for every nonround metric is false. On the unit round
sphere take the conformal length factor \(a=1+\varepsilon p\) with
\(p=x_1^2-1/5\) in ambient unit sphere coordinates and small nonzero
\(\varepsilon\). Its volume factor \(a^4\) is antipodally even, and the
round pencil kernel map is an isometry to the unit target, hence
antipodally odd as an \(\mathbb R^5\)-valued map. After conformal
transport it is therefore centered for \(h=a^2g_{\rm rd}\). The exact
transported twistor pair and Gram normalization attain \(b(h)=0\).
For the nonnegative scalar Laplacian, \(\Delta p=10p\), as \(p\) is the
restriction of a harmonic homogeneous quadratic. The scalar curvature
of \(h\) is \(a^{-3}(6\Delta a+12a)\), equal to
\((12+72\varepsilon p)/(1+\varepsilon p)^3\). It is nonconstant for
sufficiently small nonzero \(\varepsilon\) since the derivative of
\((12+72y)/(1+y)^3\) at \(y=0\) is \(36\). This fixed metric is within the
conformally round class, where the class-level attained-zero result applies.
