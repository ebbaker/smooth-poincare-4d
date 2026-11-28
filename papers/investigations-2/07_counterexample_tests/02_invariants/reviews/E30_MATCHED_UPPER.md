# WIN-E30 B · Replay of the centered upper bound

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [replay request](../research-progress/handoffs/REQUEST_B08_FINAL_REPLAY_R1.md)
specifies a non-author GPT-6.2 Sol/ultra dispatch. Actual serving variant
and effort are unavailable. Baseline `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`.
Replayed [WIN-E28](../notes/E28_MATCHED_UPPER.md) at SHA-256
`8f944be33b5cebf8a853921d50ca9cca6fafe558ee53dbbe3eceeb7c04cda610`
against its [R1 request](../research-progress/handoffs/REQUEST_B08_UPPER_R1.md)
and the [frozen metric](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md)
at SHA-256 `6f14dfe991432fcdf766cb2d187a5bb5e875365b38353b033ab1744d4c2c33fa`.
The replay is analytic, on the fixed smooth oriented Riemannian standard
four-sphere with its right quaternionic positive half-spin bundle.

**Pass.** There is a smooth generating pencil centered for \(dV_g\),
quaternionic \(L^2(g)\)-orthonormal, with
\[
 \sqrt{R_g(E)}\le 4\sqrt 2\,\pi\,\tau^2 a^2=4\sqrt 2\,\pi\,a^{14},
 \qquad a=2^{-256},\quad \tau=a^6.
\]
All normalizations in the upper control are compatible with the domain of
the [lower comparison](../notes/B08_EFFECTIVE_LOWER.md).

## Round lift and centering

The [E10 round family](../notes/E10_ROUND_INSERTION.md) has finite-chart
evaluation \(\Omega^{1/2}(u+yv)\). The invertible constant coefficient
change \((u,v)\mapsto(u,\lambda v)\) gives a global exact round pencil.
Its kernel is \([-\lambda y:1]\) at finite \(y\), and the E10 complementary
chart gives its smooth extension. In the unit Hopf target the last
coordinate is \(T_\lambda(s)=(\lambda^2s^2-1)/(1+\lambda^2s^2)\), and the
first four coordinates are \(-2\lambda y/(1+\lambda^2s^2)\). Their physical
means vanish by the four individual coordinate reflections of \(dV_g\).
This kernel map is a stereographic dilation followed by the E10 round
isometry. Its round dilation is
\(\ell=\lambda(1+s^2)/(1+\lambda^2s^2)\le2\) for \(1/2\le\lambda\le1\).

Put \(g_0=\rho^2\delta\) and \(\alpha=\epsilon\chi(s)(y^1)^2\). The physical
volume is \(dV_g=\sqrt{1-\alpha^2}\,dV_{g_0}\) because \(\rho=1\) wherever
\(\alpha\ne0\). Euclidean inversion has volume Jacobian \(s^{-8}\), and
\(\rho(1/s)=s^2\rho(s)\), so \(dV_{g_0}\) is invariant under inversion. Since
\(T_1(1/s)=-T_1(s)\), its \(g_0\) moment is zero. The volume reduction lies
in \(s\le a\), with a strict decrease on an open subset and \(T_1<0\)
throughout that cap. The actual \(g\) moment of \(T_1\) is positive.

On \(1/2\le s\le1\) the radial cutoff vanishes, giving \(\rho\ge1/2\) and
\[
 T_1(s)-T_{1/2}(s)=\frac{6s^2}{(1+s^2)(4+s^2)}\ge\frac{3}{20}.
\]
The difference is globally nonnegative. Its \(g_0\) integral is at least
\((3/20)(1/16)(15/16)\omega_4=(9/1024)\omega_4\), where \(\omega_4=\pi^2/2\).
The total physical volume reduction is at most \(\tau^2\omega_4 a^4\), since
\(1-\sqrt{1-\alpha^2}\le\alpha^2\le\tau^2\) and the cap is flat for \(g_0\).
Consequently
\[
 \int T_{1/2}\,dV_g\le\omega_4(a^{16}-9/1024)<0.
\]
The integrands are bounded by one and continuous in \(\lambda\). This
gives an axial root in \((1/2,1)\) for the actual physical volume.

## Metric transport and residue constant

The positive square root \(L=(q^{-1}\gamma)^{-1/2}\) takes oriented
\(q\)-orthonormal frames \((e_i)\) to oriented \(\gamma\)-orthonormal frames
\((Le_i)\). Transporting the spin structure along the positive metric
interpolation gives compatible unitary identifications \(J^\pm\) preserving
the right quaternionic actions. In these frames \(c_\gamma(Le_i)\) agrees
with \(c_q(e_i)\) under \(J^\pm\). At incidence hold a unit kernel parameter
\(k\) fixed. The difference of the two connections after identification
is a zeroth-order tensor applied to the vanishing section \(s_k\). Hence
the \(\gamma\)-derivative along \(Le_i\) there is \(J^+c_q(Le_i)H\), with
\(H=-D_qs_k/4\) by the round twistor equation. The tensor \((c_q(e_i)H)_i\)
is a pure Clifford trace. Indeed if \(C(A)=\sum_i c_q(e_i)A_i\), the adjoint
of \(C\) has components \(-c_q(e_i)\), and \(CC^*=4I\). The twistor
projection is the orthogonal projection onto \(\ker C\) in matched
frames. Subtracting the pure trace contribution gives
\[
 \frac{|P_\gamma(J^+s_k)|_\gamma}{m_\gamma}
 \le \|L-I\|_{\rm HS}\frac{|H|}{m_q}.
\]
In the finite chart, the second component of the unit vanishing
parameter has norm \((1+\lambda^2s^2)^{-1/2}\), whereas
\(m_q=\Omega^{1/2}(1+\lambda^2s^2)^{1/2}\). Differentiating the vanishing
field along a round unit vector gives derivative norm
\(\Omega^{-1/2}\lambda(1+\lambda^2s^2)^{-1/2}\). Dividing by \(m_q\)
gives \(|H|/m_q=\ell/2\le1\). This also agrees with the length factor two
in the unit Hopf incidence map.

On the cap, the eigenvalues of \(q^{-1}\gamma\) are \(1,1,1+\alpha,1-\alpha\).
For \(|z|\le1/4\), the denominator in
\[
 |(1+z)^{-1/2}-1|=\frac{|z|}{\sqrt{1+z}(1+\sqrt{1+z})}
\]
is at least \((3/4)(7/4)>1\). The two unit eigenvalues give zero
contribution to \(L-I\), so \(\|L-I\|_{\rm HS}\le\sqrt 2\,\tau\). Outside
the cap the incidence defect vanishes. On the cap
\(dV_\gamma/dV_q=\sqrt{1-\alpha^2}\le1\), and \(\Omega\le2\) gives
\(\operatorname{Vol}_\gamma(s\le a)\le 16\omega_4 a^4=8\pi^2a^4\). Using
the unnormalized volume in the residue definition,
\[
 R_\gamma\le(\sqrt 2\,\tau)^4\,8\pi^2 a^4=32\pi^2\tau^4a^4.
\]

## Return to the physical representative

For \(g=w^2\gamma\), a \(\gamma\)-orthonormal frame becomes \(g\)-orthonormal
after multiplication by \(w^{-1}\). The unitary spin identification
followed by the common twistor weight \(w^{1/2}\) therefore scales the
incidence derivative by \(w^{-1/2}\). Derivatives of the common factor and
connection differences multiply the zero field value. The Clifford
projection in the identified orthonormal frames is unchanged, and
the evaluation norm scales by \(w^{1/2}\). Thus the fourth power of the
derivative-to-evaluation ratio scales by \(w^{-4}\), and \(dV_g=w^4dV_\gamma\)
gives equality of the two residues. Fiberwise transports preserve the
kernel in the fixed coefficient space.

For the final common factor \(\sqrt{2/V}/m_g\), \(V=\operatorname{Vol}_g(S^4)\),
the pointwise Gram operator is \((2/V)(I-P_K)\). For a unit coefficient
spanning \(K\), if its Hopf coordinates are \((p,z)\in\mathbb H\oplus\mathbb R\),
then \(2P_K-I\) has matrix entries \((z,p;\overline p,-z)\). The physical
centering of these five real components gives \(\int P_K\,dV_g=(V/2)I\).
The global quaternionic Gram operator is exactly the identity. At each
incidence the same common factor multiplies the derivative and evaluation
norm, preserving the residue. The resulting pencil has the required
smoothness, generation, physical centering and normalization.

The square root bound is \(4\sqrt2\,\pi\,a^{14}<18a^{14}\), since
\(\pi<22/7\) and \(32(22/7)^2<18^2\). Together with the lower comparison this yields
\[
 2^{-3664}=2^{-80}a^{14}\le b(g)\le 4\sqrt2\,\pi\,a^{14}<18a^{14}.
\]
The explicitly normalized pencil witnesses the upper bound for this
infimum. The comparison is a quantitative result for the one frozen
metric. Formal verification is pending.
