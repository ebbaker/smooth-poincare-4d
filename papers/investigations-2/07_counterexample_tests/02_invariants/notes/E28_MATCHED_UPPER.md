# WIN-E28 · Centered spinor pencil giving the matching upper bound

28 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The [E28 request](../research-progress/handoffs/REQUEST_B08_UPPER_R1.md)
specifies a bounded GPT-6.2 Sol/ultra helper. Actual serving model and effort
are unavailable. Baseline `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`.
The E28 request has SHA-256
`a03d3fbdaa1d530518b21fcaabed08db4573c99bf3989c06c1b772a80cec9302`.
Use the metric and cutoffs in the [frozen metric request](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md),
the [E10 round spinor formulas](E10_ROUND_INSERTION.md) and the
[incidence convention](PENCIL_RIGIDITY.md). This is a working analytical
upper bound on the fixed smooth, oriented, Riemannian standard sphere
with its unique spin structure and right quaternionic positive half-spin bundle.

Set \(a=2^{-256}\), \(\epsilon=a^4\) and \(\tau=a^6\) as in the request.
There is a smooth, \(dV_g\)-centered, quaternionic \(L^2(g)\)-orthonormal
generating pencil \(E\) with
\[
 b(g)\le \sqrt{R_g(E)}\le 4\sqrt2\,\pi\,\tau^2 a^2
       =4\sqrt2\,\pi\,a^{14}<18a^{14}.
\]

## Exact round pencil with the physical volume centering

Identify the oriented stereographic coordinates \(y\) with \(\mathbb H\).
For \(1/2\le\lambda\le1\), use the exact round pencil
\[
 s_{u,v}^{q}(y)=\Omega(y)^{1/2}(u+\lambda yv),
 \qquad (u,v)\in\mathbb H^2,\qquad \Omega=2/(1+|y|^2).
\]
This is the E10 solution family with an invertible constant coefficient
change, so it gives global smooth twistor sections that generate the
positive half-spin line. In the unit Hopf sphere the kernel map is
\[
 f_\lambda(y)=\left(\frac{-2\lambda y}{1+\lambda^2|y|^2},
                  T_\lambda(|y|)\right),\qquad
 T_\lambda(s)=\frac{\lambda^2s^2-1}{1+\lambda^2s^2}.
\]
The four horizontal means for \(dV_g\) vanish since its density is even
in each \(y^i\). Write \(g_0=\rho^2\delta\) and
\(\alpha(y)=\epsilon\chi(|y|)(y^1)^2\); then
\(dV_g=\sqrt{1-\alpha^2}\,dV_{g_0}\). The inversion
\(y\mapsto y/|y|^2\) preserves \(dV_{g_0}\) by the defining relation
\(\rho(s)=s^{-2}\rho(1/s)\), and \(T_1\) changes sign under inversion.
Thus \(\int T_1\,dV_{g_0}=0\). The volume change is supported in
\(s\le a<1\), where \(T_1<0\). The density decreases strictly on an
open subset there, so \(\int T_1\,dV_g>0\).

Let \(\omega_4=\pi^2/2\) denote the Euclidean unit ball volume. On the
shell \(1/2\le s\le1\) one has \(\rho=(1+s^2)^{-1}\ge1/2\) and
\[
 T_1(s)-T_{1/2}(s)=\frac{6s^2}{(1+s^2)(4+s^2)}\ge\frac3{20}.
\]
This difference is nonnegative everywhere. Its integral against
\(dV_{g_0}\) is at least
\((3/20)(1/16)(15/16)\omega_4=(9/1024)\omega_4\).
On \(s\le a\) one has \(\rho=1\), \(|\alpha|\le\tau\), and
\(1-\sqrt{1-\alpha^2}\le\alpha^2\). Hence
\(\int (dV_{g_0}-dV_g)\le\tau^2\omega_4 a^4=a^{16}\omega_4\).
It follows that \(\int T_{1/2}\,dV_g<0\). Continuity in \(\lambda\)
gives a zero of the axial integral in \((1/2,1)\). Fix this \(\lambda\).
The kernel map is now centered for the physical metric \(g\). Its
round dilation, including the endpoint values by continuity, is
\[
 \ell(y)=\frac{\lambda(1+|y|^2)}{1+\lambda^2|y|^2}\le 1/\lambda\le2.
\]

## Incidence comparison and residue

Put \(G=q^{-1}\gamma\) and \(L=G^{-1/2}\), so \(L\) maps oriented
\(q\)-orthonormal frames to oriented \(\gamma\)-orthonormal frames.
Its spin lift continuous from the identity along the positive metric
interpolation defines the unitary identifications \(J^\pm\) of the two
half-spin bundles. Transport the preceding pair by \(J^+\). For a
fixed point \(p\), choose a unit parameter \(k\) in the common kernel,
and hold it fixed when differentiating. At \(p\) the field \(s_k^q\)
vanishes. The connection difference between the identified bundles is
tensorial, so it vanishes when applied to \(s_k^q(p)\). Consequently
\(\nabla_X^\gamma(J^+s_k^q)=J^+\nabla_X^q s_k^q\) there for every \(X\).
Write \(\nabla_X^q s_k^q=c_q(X)H\) at \(p\), with \(H=-D_qs_k^q/4\).
For a \(q\)-orthonormal frame \(e_i\), Clifford compatibility gives
\[
 \nabla_{L e_i}^\gamma(J^+s_k^q)=c_\gamma(L e_i)J^-H
              +J^+c_q((L-I)e_i)H.
\]
The first term is a Clifford trace tensor. The twistor operator applies
the orthogonal projection onto the kernel of Clifford contraction to
this derivative. Since Clifford multiplication by a vector scales
spinor norms by the length of that vector, one gets
\[
 |B_\gamma k|\le \|L-I\|_F |H|.
\]
Only the incidence jet enters. There is no term containing a derivative
of the metric in this estimate.

In the finite chart the evaluation norm is
\(m_q=\Omega^{1/2}(1+\lambda^2s^2)^{1/2}\). Write the fixed unit
kernel parameter as \((u,v)\), so \(u+\lambda yv=0\) at the
incidence and \(|v|=(1+\lambda^2s^2)^{-1/2}\). In the round spin frame
at that point the derivative along a round unit vector \(X\) has norm
\(\Omega^{1/2}\lambda |dy(X)||v|=\Omega^{-1/2}\lambda |v|\).
Thus \(|H|/m_q=\ell/2\le1\); this extends by continuity at infinity.
The metric comparison is unitary, so \(m_\gamma=m_q\).

Outside \(s\le a\), \(G=I\). On the cap it has eigenvalues
\(1,1,1+\alpha,1-\alpha\). For \(|t|\le1/4\) the identity
\[
 |(1+t)^{-1/2}-1|
    =\frac{|t|}{\sqrt{1+t}(1+\sqrt{1+t})}\le |t|
\]
gives \(\|L-I\|_F\le\sqrt2\,\tau\). The auxiliary volume satisfies
\(dV_\gamma=\sqrt{1-\alpha^2}\,dV_q\le dV_q\), and
\(\operatorname{Vol}_q(\{s\le a\})\le16\omega_4a^4=8\pi^2a^4\).
It follows that the transported pair has
\[
 R_\gamma(E_\gamma)\le(\sqrt2\,\tau)^4(8\pi^2a^4)
                     =32\pi^2\tau^4 a^4.
\]

## Return to the physical metric and normalize

Write \(g=w^2\gamma\) with \(w=\rho/\Omega>0\) and use the
conformal spin comparison with the spinor weight \(w^{1/2}\). At
incidence the derivative of this weight and the connection difference
both multiply the zero field value. Evaluating on \(g\)-unit vectors
then scales the projected derivative norm by \(w^{-1/2}\), while
\(m_g=w^{1/2}m_\gamma\). The ratio \(|B_gk|/m_g\) scales by \(w^{-1}\),
so the volume factor \(w^4\) gives \(R_g=R_\gamma\). The kernel map
stays \(f_\lambda\), hence stays centered for \(dV_g\).

Finally multiply both positive generators by
\(\sqrt{2/\operatorname{Vol}_g(S^4)}/m_g\). This is smooth and positive
because the pair generates every fibre. The pointwise Gram operator
becomes \(2(I-P_K)/\operatorname{Vol}_g(S^4)\). The Hopf coordinates
express \(P_K-I/2\) as a real-linear function of \(f_\lambda\), so
centering makes the global Gram operator the identity. The factor
also cancels between the incidence derivative and \(m_g\), preserving
the residue. This is the compatible round lift and exact common
normalization of the displayed upper control.
