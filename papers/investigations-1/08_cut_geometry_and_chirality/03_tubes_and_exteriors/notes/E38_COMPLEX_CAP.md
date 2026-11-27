# E38 — Complex structures on the marked short-axis cap

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance under [E38_REQUEST_R1](../research-progress/handoffs/E38_REQUEST_R1.md). Sol 6.2/ultra requested. Actual model and effort unavailable. Base checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Fixed inputs are [E18](E18_QUATERNIONIC_PAIR.md) (SHA-256 af12d1bee2cad22c), [E20](../reviews/E20_SHORT_AXIS_READBACK.md) (522663791ad76fb5) and the [quaternion marking](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md) (84c2f83a2a6cfcb3). The analysis uses smooth Riemannian metrics and real chiral Hilbert–Schmidt Weyl norms.

**Result.** The actual disk bundle has no invariant almost complex structure. Its connected twofold cover admits invariant Kähler germs at the bolt, but an invariant compatible complex structure cannot reach the exact umbilic Berger face with the collapsing circle on a short axis. Positive reflective doubling also rules out a global conformally Kähler structure in an invariant conformal class on either cap, even when the conformal factor and complex structure are initially allowed to vary along the orbits.

## Principal isotropy and the actual cover

Write \(W_i\) for the disk over \(\mathbb{RP}^2\) with marked collapsing circle \(i\). Use the group diagram from E18/E20 with singular stabilizer \(H_i=C_i\cup j C_i\), \(C_i=\{\exp(\alpha i)\}\), and principal stabilizer \(Q_8\). The normal slice rotates by \(4\alpha\) under \(\exp(\alpha i)\) and reflects under \(j\). In geodesic normal orbit coordinates the principal tangent representation is \(\mathbb R\partial_s\oplus\mathfrak{su}(2)\), with \(Q_8\) acting trivially on \(\partial_s\) and by the adjoint sign changes on the orbit summand. The fixed subspace is one-dimensional. An invariant endomorphism \(J\) must preserve this fixed space, so it cannot square to \(-1\). This obstruction requires neither orthogonality nor integrability.

The inclusion of the boundary maps \(Q_8\) onto \(\pi_1(W_i)=C_2\) with kernel \(\langle i\rangle\). The connected twofold cover \(\widetilde W_i\) has bolt \(S^2\), stabilizer \(C_i\) there, and boundary \(\langle i\rangle\backslash SU(2)\). Thus its principal isotropy fixes the radial and \(i\) directions and negates the \(j,k\) plane. The normal angular period is still \(\pi/2\) in the generator \(i\), so in unit radial arclength the collapsing length has initial slope \(4\). The regular orbit's universal \(S^3\) cover is not the restriction of a smooth unbranched cover of \(W_i\), whose fundamental group is \(C_2\).

## Integrability at the exact Berger face

On the diagonal invariant regular metric \(g=ds^2+\sum_{a=1}^3 l_a^2\sigma_a^2\), use \(1=i,2=j,3=k\) and \(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclically. Any invariant \(g\)-orthogonal \(J\) on the cover preserves the two principal isotropy planes. Up to replacing \(J\) by \(-J\), take its \((1,0)\)-coframe to be
\[
 \alpha=ds+\mathrm i\,l_1\sigma_1,\qquad
 \beta=l_2\sigma_2+\mathrm i\,\varepsilon l_3\sigma_3,\qquad
 \varepsilon\in\{1,-1\}.
\]
In the outward-first orientation \(ds\wedge\sigma_{123}\), its complex orientation has sign \(\varepsilon\), and the fundamental form is \(\omega_g=l_1ds\wedge\sigma_1+\varepsilon l_2l_3\sigma_2\wedge\sigma_3\). Under the nontrivial deck map, represented by \(j\), the signs of \(\sigma_1,\sigma_3\) change and that of \(\sigma_2\) stays fixed. Both terms of \(\omega_g\) change sign, so these structures on the lifted quotient metric are paired with their complex conjugates by the deck map.

Put \(k_a=l_a'/l_a\) and \(P=l_1l_2l_3\), with primes in \(s\). The \((0,2)\) part of \(d\alpha\) vanishes and that of \(d\beta\) is
\[
 (d\beta)^{0,2}
  =\tfrac14\left(k_2-k_3+\frac{2\varepsilon(l_2^2-l_3^2)}{P}\right)
      \bar\alpha\wedge\bar\beta .
\]
For example, the radial part contributes \((k_2-k_3)/4\), while the two orbit derivatives contribute \(\varepsilon l_2/(2l_1l_3)\) and \(-\varepsilon l_3/(2l_1l_2)\). Integrability therefore requires
\[
  (\log(l_2/l_3))'=\frac{2\varepsilon(l_3^2-l_2^2)}{P}.
\]
For a radial positive conformal factor \(f\), set \(\tilde l_a=f l_a\) and \(d\tilde s=f\,ds\). Both sides of this last equation scale by \(f^{-1}\), as they must since the complex structure is unchanged.

At an umbilic face \(k_1=k_2=k_3\). The integrability equation forces \(l_2=l_3\) there, in contradiction with the prescribed \(l_1=l_2=B,\ l_3=\sqrt3 B\) for any \(B>0\). The same endpoint test applies to an independent invariant metric on the cover that is not diagonal throughout its interior. In geodesic normal gauge the \(i\) line is orthogonal to the \(j,k\) plane by the principal isotropy. The first normal derivative of the whole orbit metric is a scalar multiple of the orbit metric at an umbilic face. In the marked axes, a transverse off-diagonal entry and its first derivative therefore vanish at that face. The compatible \(J\) on each oriented plane is fixed by the metric, so the \((0,2)\) calculation depends at the face on these same diagonal first jets. This is a local obstruction to an invariant compatible integrable complex structure there, of either orientation. It uses the short-axis marking as well as umbilicity.

## Closure and the smooth bolt

For a radial conformal factor \(\tilde g=f^2g\), the fundamental form is \(f^2\omega_g\). Its closure is equivalent to
\[
 (f^2p)'=2\varepsilon f^2 l_1,\qquad p=l_2l_3 .
\]
In particular, for \(f=1\) an umbilic Kähler face would need common principal curvature \(k_a=\varepsilon l_1/p\), hence could not itself be totally geodesic. In a conformal Kähler representative, the scale derivative \(f'/f=\varepsilon l_1/p-(k_2+k_3)/2\) can supply this mean curvature. It cannot alter the integrability obstruction from the difference \(k_2-k_3\).

At the cover bolt, \(l_1=4s+O(s^3)\), \(l_2,l_3\to b>0\) and \(u=\log(l_2/l_3)\to0\). The two isotropy rotations on the normal and tangent planes have weights \(4\) and \(2\) and admit oriented orthogonal quarter turns. The diagonal radial ansatz extends these turns smoothly when its metric extends smoothly: use the normal disk connection to separate the vertical and horizontal planes, apply their metric quarter turns and choose their signs. The horizontal metric trace is smooth even in \(s\), and a smooth triaxial difference can start at order \(s\) because its trace-free tensor rotates with weight \(4\). These parity conditions agree with the marked smooth slice model. [E20, core regularity](../reviews/E20_SHORT_AXIS_READBACK.md)

In the regular region the integrability equation is \(u'=-4\varepsilon\sinh(u)/l_1\). Equivalently \(v=\tanh(u/2)\) solves \(v'=-4\varepsilon v/l_1\). With \(l_1=4s+O(s^3)\), a nonzero \(v\) has leading power \(s^{-\varepsilon}\). Hence \(\varepsilon=1\) forces \(u=0\) in any solution reaching the smooth bolt. For \(\varepsilon=-1\) the linear shear is compatible with the bolt. For instance, with \(f=1\), the exact local profiles
\[
 l_1=4s,\qquad p=b^2+4\varepsilon s^2,\qquad
 l_2=\sqrt p\,e^{u/2},\qquad l_3=\sqrt p\,e^{-u/2}
\]
give smooth Kähler germs with \(u=0\) for either sign, and also with \(u=2\operatorname{artanh}(c s)\) for \(\varepsilon=-1\), for constant \(c\) and sufficiently small \(s\). In the latter case \(l_2^2+l_3^2=2p\cosh u\) is even and \(l_2^2-l_3^2=2p\sinh u\) is \(s\) times a smooth function of \(s^2\). The normal coefficient is the usual smooth polar disk coefficient because \(l_1/4=s\). For an already smooth invariant Hermitian metric on the cover the displayed closure equation gives a smooth positive radial \(f\) locally once the integrability condition is met, since its logarithmic derivative is smooth odd. These germs check the core independently of the obstruction at the boundary.

## Global conclusion in the invariant conformal class

Assume the double is of positive Yamabe type, using a totally geodesic representative of the umbilic class. For the reflected quadratic form, the even sector has the Neumann Rayleigh quotient on the cap and the odd sector has the Dirichlet quotient. The lowest Dirichlet value is at least the lowest Neumann value by domain inclusion. Strict positivity of the first eigenvalue gives coercivity against the \(H^1\) norm and hence positivity of the Yamabe quotient by Sobolev embedding. The orientable disk cover has normal Euler number of magnitude four, measured by the degree-four circle-bundle quotient above \(S^2\). The identity double of that disk cover is the sphere bundle of the normal plane plus a trivial real line. The clutching class becomes zero in \(\pi_1(SO(3))=C_2\), so the smooth double is \(S^2\times S^2\) with \(\chi=4\), \(\tau=0\), \(b_2^+=1\). If the starting sign is on the quotient, smooth approximations preserving the sign give positive conformal representatives that lift to the cover. Their lifted energies converge to the reflected energies, as in E04. [E20, topology and energy](../reviews/E20_SHORT_AXIS_READBACK.md) · [E04, §5](../reviews/E04_PARENT_AND_BOUND.md#5-seam-atlas-and-the-scope-of-its-one-tube-use)

For the cover double, Gursky's positive Yamabe inequality gives \(E_+\ge (4\pi^2/3)(2\chi+3\tau)=32\pi^2/3\) in these norms. Reflection exchanges the two signs, so this is twice the mean on the lifted cap. Thus \(e_{\widetilde W_i}\ge16\pi^2/3\), and \(e_{W_i}\ge8\pi^2/3\) when the metric is a pullback. The exact APS defect is \(E_+-E_-=-5\pi^2\) on \(W_i\) and \(-10\pi^2\) on its cover. The latter defect also holds for any independent metric with the same marked umbilic conformal boundary on that cover, by the signature formula with vanishing transgression in a totally geodesic representative and comparison to the lift of the known E14 metric. Therefore each chirality has positive energy on either cap. [Fu, *Four-manifolds with positive Yamabe constant*, Theorem A and its proof, reproducing Gursky](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf) · [E14, signed energy](E14_SHORT_AXIS.md#signed-energy-and-the-closing-budget)

Now suppose \(\tilde g=f^2g\) is Kähler on a whole cap in the indicated invariant conformal class, with \(f>0\) smooth and with neither \(f\) nor \(J\) assumed invariant. In the complex orientation \(W^+_{\tilde g}\) has eigenvalues \((R_{\tilde g}/6,-R_{\tilde g}/12,-R_{\tilde g}/12)\) with the Kähler form as the simple eigenline wherever \(R_{\tilde g}\ne0\). The same eigenline occurs for \(g\), since the Hodge decomposition is conformally unchanged and the Weyl endomorphism rescales. The scalar curvature cannot vanish identically because this would make the corresponding chiral energy zero. On each component of the nonzero set of that block, the connected \(SU(2)\) action preserves \(\omega_g=f^{-2}\omega_{\tilde g}\): it preserves the line and the constant length, and continuity from the identity fixes the sign. On \(W_i\) the principal isotropy contradiction already applies on such an open set. [Derdziński, *Self-dual Kähler manifolds and Einstein manifolds of dimension four*, Proposition 2](https://www.numdam.org/article/CM_1983__49_3_405_0.pdf)

On the cover, \(d\omega_g=-2d\log f\wedge\omega_g\) determines \(d\log f\) on that open set, since wedging with a nondegenerate two-form is injective on one-forms in dimension four. Thus \(a^*f/f\) is a positive constant on a component for each \(a\in SU(2)\). It equals one by evaluating the maximum of \(f\) over an orbit in that component. The two-form \(\psi=f^{-3}\omega_{\tilde g}=f^{-1}\omega_g\) is conformal Killing for \(g\), by covariance for two-forms. It agrees with \(a^*\psi\) on a nonempty open set. Semmelmann's prolongation identifies \((\psi,d\psi,d^*\psi,dd^*\psi)\) with a parallel section of a smooth connection. Applying that connection to the difference extends the equality over the connected interior, and smoothness extends equality to the boundary. Now \(f=\sqrt2/|\psi|_g\) and \(J\) are invariant, and the local umbilic calculation excludes the prescribed face. [Semmelmann, *Conformal Killing forms on Riemannian manifolds*, Proposition 2.6 and §5 prolongation](https://www.igt.uni-stuttgart.de/dokumente/semmelmann/semmelmann_Publ/2003mz_24.pdf)

The result concerns the specified invariant conformal classes and their smooth cover. The mean-energy comparison for unrestricted positive short-axis caps remains open.
