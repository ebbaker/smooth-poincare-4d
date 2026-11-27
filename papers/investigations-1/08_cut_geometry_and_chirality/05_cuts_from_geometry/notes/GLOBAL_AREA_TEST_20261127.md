# A closed angular competitor for a putative Berger filling

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex, selected Astra/ultra lead, serving metadata unavailable. E11 suggested testing a nonsymmetric competitor on both caps of the E06 germ. Here is the test, including a class in which the proposed obstruction cannot be realized. This concerns possible closed completions of that germ, not all entering metrics.

Take a diagonal cohomogeneity-one metric \(ds^2+\sum_{i=1}^3 a_i(s)^2\sigma_i^2\) on a two-pole suspension of the unit quaternions. The left-invariant coframe is unit round when all \(a_i=1\); the polar angular markings at both ends are round quaternionic coordinates up to orthogonal maps. All \(a_i\) are positive on the interior. Smooth polar closure is assumed. Define D by \(\operatorname{Re}q=0\) at every regular orbit, adding both poles. In each polar normal chart this is a hyperplane; D is a smooth embedded S³.

To compute its mean curvature use \(q=x_0+\sum x_i e_i\), left-invariant fields \(E_i=q e_i\), \(m_i=a_i^{-2}\) and \(v^2=\sum m_i x_i^2\). Its unit normal inside the orbit is \(-\sum m_i x_i E_i/v\). There is no radial component. The orbit volume form is a constant multiple of Haar measure on each slice, so \(\operatorname{div} E_i=0\), and this tangential divergence is its ambient divergence too. Differentiating \(E_i x_0=-x_i\), \(E_i x_j=x_0\delta_{ij}+\sum_k\epsilon_{kij}x_k\) gives the divergence
\[
 -\frac{x_0}{v}\sum_i m_i+\frac{x_0}{v^3}\sum_i m_i^2 x_i^2 .
\]
The remaining terms have symmetric weights and alternating indices and vanish. Thus D is a global minimal competitor. At each s its equatorial two-area is the round surface element multiplied by \(a_1a_2a_3\sqrt{\sum_i\omega_i^2/a_i^2}\), by the cofactor formula for surface area under a change of metric. The radial line is a unit tangent. Therefore on a positive-Ricci completion the first width satisfies
\[
 W_1\ \le I:=\int_0^L a_1a_2a_3\left[\int_{S^2}
 \sqrt{\sum_i\omega_i^2/a_i^2}\,d\omega\right]ds
 \ \le\ \frac{4\pi}{\sqrt3}\int_0^L a_1a_2a_3\sqrt{\sum_i a_i^{-2}}\,ds .
\]
The second inequality is Jensen's inequality. A bad central orbit at \(s_0\) has area \(2\pi^2(a_1a_2a_3)(s_0)\). A strict upper estimate for I below this value rules it out as a width realizer, independent of local index. The opposite inequality only says this competitor did not beat it. On the round unit suspension \(a_i=\sin s\), direct integration gives equality \(I=2\pi^2\) at the equator.

There is a global obstruction in the **biaxial** subclass. Write \(a_1=a_2=a\), \(a_3=c\). At both smooth poles the ratio \(c/a\) tends to 1. If it attains an interior maximum at least 2, then there \(c'/c=a'/a\); the orbit is umbilic. In an entering gauge the contracted Gauss equation gives strictly positive orbit scalar. On the other hand its intrinsic Berger scalar is \(2(4-(c/a)^2)/a^2\le0\), a contradiction. Thus **every regular orbit** in such a closed biaxial entering gauge has strictly positive scalar, regardless of its index. This is a two-end compatibility test. The E06 example has two different derivatives for its initially equal short axes, so leaves this subclass immediately. A triaxial completion with the same germ has no such ratio proof here.

For the actual E06 germ, in its coordinates the three central radii are \((1,1,\sqrt{65}/4)\); the area to beat is \(2\pi^2\sqrt{65}/4\). On a collar \(|s|<d\), the contribution to I tends to zero linearly with d, whereas that candidate area stays fixed. The two cap contributions are positive and their size cannot be inferred from the finite jets. This executes the test with all physical data the germ provides, identifies the missing pair of integrals, and gives a concrete first calculation if triaxial caps are supplied.
