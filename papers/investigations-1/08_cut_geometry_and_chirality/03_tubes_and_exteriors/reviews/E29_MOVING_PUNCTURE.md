# SP4-CUT-TUBE-E29 · Moving-puncture magnetic energy replay

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual model and reasoning effort are unavailable. [Frozen E29
request](../research-progress/handoffs/E29_REQUEST_R1.md), checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, with the subsequent fixed-task
extension to an arbitrary positive-scalar radial bend. Inputs are the
[E05 bent collar](../notes/E05_TWISTED_EXTERIORS.md), [E26 length
formula](../notes/E26_LENGTH_TEST.md) and its [independent
replay](E27_LENGTH_REPLAY.md), and the order-seventeen prism data of
[the E28 request](../research-progress/handoffs/E28_REQUEST_R1.md).
The estimates are analytical, in the parent oriented Riemannian
Hilbert–Schmidt normalization.

The radial transvection-cutoff trial on the order-seventeen prism
exceeds \(8\pi^2/3\) exterior mean Weyl energy at every base length.
This holds for all smooth radial cutoffs between any two embedded
round shells in this construction and for any smooth positive-scalar
radial bend from a product boundary to the inner round shell. The
bound uses no chosen length for the cylindrical part of the bend.

## Prism, marked flow and support

Write the free action on unit quaternions as
\(x\mapsto uxb^{-1}\), with \(u\in Q_8\) and
\(b\in C_{17}=\langle e^{2\pi i/17}\rangle\). Freeness follows since
a fixed point would make \(u\) conjugate to \(b\), and the orders
can agree only at the identity. A pure right deck generator moves
each point by \(2\pi/17\), so the injectivity radius at every point
is at most \(\pi/17\). For the lower bound on the injectivity radius,
the distance of \(p\) from \(upb^{-1}\) is the distance of
\(p^{-1}up\) from \(b\). Compare their angles from the identity.
The \(Q_8\) angles are \(0,\pi/2,\pi\). The \(C_{17}\) angles are
\(2\pi n/17\) with \(0\le n\le8\). The smallest possible difference
for a nontrivial pair is \(\pi/34\). Thus the injectivity radius
is at least \(\pi/68\), and the frozen \(2\rho=1/50\) shell fits
along the entire path.

For \(\Phi(x)=a_0xj^{-1}\), \(a_0=(1+i+j+k)/2\), the deck-adjusted
lifts have the form \(x\mapsto ua_0x(bj)^{-1}\). The angles of
\(ua_0\) are \(\pi/3,2\pi/3\), and every \(bj\) has angle
\(\pi/2\). This gives displacement at least \(\pi/6\); equality
is attained at a lift \(p\) conjugating the axis of \(a_0\) to
the axis of \(j\) in the corresponding direction. Set \(d=\pi/6\)
and use the marked path realizing that distance. Choose a speed
\(v(t)\) along this arc with the centre constant near each time
endpoint. Its length and time parameter give
\(\int_0^1 v(t)^2dt\ge(\int_0^1 |v(t)|dt)^2\ge d^2\).

Let \(0<r_0<R\) be the inner and outer round radii, with \(R\) less
than the local injectivity radii along the whole path. Let \(A_t\)
be the local round transvection moving the first embedded ball to
the ball centred at \(p_t\) on the arc. On the latter ball use the
time-dependent vector field \(v(t)\chi(r_t) Z_t\), where \(Z_t\)
is the unit Killing transvection along the oriented arc,
\(r_t=\operatorname{dist}(p_t,\cdot)\), and \(\chi=1\) for \(r_t\le r_0\)
and \(\chi=0\) for \(r_t\ge R\). Extend it smoothly by zero
and let \(F_t\) be its actual global flow from the identity.
Uniqueness of the flow gives \(F_t=A_t\) on the initial
\(r_0\)-ball, since these transvection trajectories stay at their
original distance from the moving centre.

On the moving punctured fibre, let \(\widetilde h_t\) be the
round metric outside the inner sphere and the same positive radial
bend transported by \(A_t\) inside it. On the fixed punctured
fibre put \(h_t=F_t^*\widetilde h_t\). The material inner annulus
with the bend is fixed as a metric, so \(K=\tfrac12\partial_t h_t\)
and all of its time derivatives vanish there. Outside it
\(h_t=F_t^*h_{\rm round}\), so \(D_0=\operatorname{Ric}_{h_t}^\circ=0\)
there and \(K=F_t^*(\tfrac12\mathcal L_{v\chi Z_t}h_{\rm round})\).
These statements include the smooth transition by continuity.
In the E26 formula \(D_0\) and \(U=(-\partial_tK+HK)^\circ\) have
zero pointwise pairing. The E26 coefficient \(B\) is therefore
exactly the integral of the magnetic square on the half, while
\(C\ge0\). At each time the shell integral can be evaluated in the
round metric via \(F_t\), without a quotient-volume factor because
the whole shell projects injectively.

The adjoint map of \(a_0\) cycles the three quaternion generator
axes, and \(j\) inverts \(C_{17}\). Hence \(\Phi\) normalizes the
deck action. At \(t=1\), \(A_1\) and \(\Phi\) agree on the centre
and differ by an orthogonal change of the round polar coordinates.
The radial bend is invariant under this change, so
\(\widetilde h_1=\Phi_*h_0\) and
\(h_1=(\Phi^{-1}F_1)^*h_0\). The based endpoint map
\(\psi=\Phi^{-1}F_1\) preserves the original puncture and its
collar, acting orthogonally in the angular coordinate there.
The time plateaus give smooth mapping-torus jets. The product
normal collar of the bend is independent of time in the pullback
and doubles smoothly. The inverse based correction \(F_1^{-1}\Phi\)
gives the same construction with the base direction reversed,
which exchanges chiral energies and preserves the mean and the
Yamabe test. Reversing the base, or choosing a deck-adjusted lift
for the same arc, leaves the group quotient conclusion unchanged.
In the quotient by the meridian, the quaternion generators
become equal up to the central sign from an inner adjustment.
They then commute, so the central sign dies and quaternion
multiplication kills all three. Inversion kills the odd-order
\(C_{17}\) factor. This checks that the metric path retains the
intended meridian relation.

## Magnetic square and radial moment

Use the round polar coordinates \(h=dr^2+\sin^2r\,g_{S^2}\)
centred at \(p_t\). If the unit direction of motion is represented
by a unit tangent vector \(u\), put \(f(y)=\langle y,u\rangle\)
on the polar unit sphere. The Killing transvection is rotation
in the real plane spanned by \(p_t,u\). Differentiating
\(x=\cos r\,p_t+\sin r\,y\) in that plane gives
\[
  Z^\flat=f\,dr+\sin r\cos r\,df,\qquad
  d(\chi Z^\flat)
    =(\chi'\sin r\cos r-2\chi\sin^2r)\,dr\wedge df .
\]
Write \(Y^\flat_{S^2}=*_{S^2}df\), so \(Y\) generates axial rotations
of angular speed one on the unit sphere. Taking
the three-dimensional Hodge star in the polar metric gives
\[
 \operatorname{curl}(\chi Z)=w(r)Y,\qquad
 w(r)=\chi'(r)\cot r-2\chi(r).
\]
The factor \(\sin^2r\) in the angular metric is included when
raising the index. The vector field \(Y\) is Killing on the
round shell and \(\int_{S^2}|Y|_{g_{S^2}}^2\,d\Omega=8\pi/3\).

For \(K_{ij}=(\nabla_iV_j+\nabla_jV_i)/2\) on a round region,
contract \(\epsilon_j{}^{kl}\nabla_kK_{li}\). The term
\(\epsilon_j{}^{kl}\nabla_k\nabla_lV_i\) reduces to a curvature
commutator, skew in \(i,j\) on a space form. Commuting
\(\nabla_k\) and \(\nabla_i\) in the other term contributes
another skew matrix, leaving
\[
 \operatorname{sym}_{ij}(\epsilon_j{}^{kl}\nabla_kK_{li})
    =\tfrac12\operatorname{sym}_{ij}
                 \nabla_i(\operatorname{curl} V)_j .
\]
Here \(\operatorname{sym}\) averages the two orderings.
For \(V=v(t)\chi Z\), the symmetric derivative of \(wY\) is
\(\tfrac12 w'(dr\otimes Y^\flat_h+Y^\flat_h\otimes dr)\),
with squared norm \((w')^2|Y|_h^2/2\). The E26 magnetic block \(M\)
is minus one half that symmetric derivative, multiplied by \(v(t)\).
The round spatial integral at each time is therefore
\[
 \int_P |M|^2\,dV_{h_t}
     =\frac{\pi}{3}\,v(t)^2\int_{r_0}^R(w')^2\sin^4r\,dr .
\]
In the inner Killing and outer zero regions the symmetric derivative
vanishes. This verifies both the angular factor and the Hilbert–Schmidt
normalization.

The identity \((\chi\cos^2r)'=w\sin r\cos r\), together with
\(\chi(r_0)=1,\ \chi(R)=0,\ w(R)=0\), gives the moment
\[
 \cos^2r_0=\frac12\int_{r_0}^R
       w'(r)(\sin^2r-\sin^2r_0)\,dr .
\]
One can derive it by substituting \(w(r)=-\int_r^Rw'(u)\,du\)
and exchanging the integrals. Cauchy–Schwarz with the weight
\(\sin^4r\), using
\(0\le1-\sin^2r_0/\sin^2r\le1\) on this interval, yields
\[
 B\ \ge\ \frac{4\pi d^2\cos^4r_0}{3(R-r_0)} .
\]
No monotonicity of \(\chi\) enters. At \(r_0=\rho,\ R=2\rho\)
this is exactly the frozen shell estimate.

## Intrinsic coefficient and the all-length bound

For the frozen constant-radius product collar with radius and
proper length both \(a\), the intrinsic coefficient satisfies
\(A\ge2\pi/(3a)\).
Indeed \(|\operatorname{Ric}_h^\circ|^2=2/(3a^4)\) there and its
area factor is \(4\pi a^2\). Combined with the shell estimate
this excludes the frozen trial with \(a<\rho/4\).

For the stronger bound, write a general positive-scalar radial
bend as \(ds^2+f(s)^2g_{S^2}\), with \(f>0\), \(f'(0)=0\) at
the totally geodesic boundary and
\((f,f')=(\sin r_0,\cos r_0)\) at the round exit \(s=S\).
Use the last zero \(s_*\) of \(f'\) and put \(a=f(s_*)\). It
exists by compactness and \(f'(S)>0\). On the remaining interval
\(f'>0\) and the mass \(\mu=f(1-f'^2)\) satisfies
\[
 \mu'=f'(1-f'^2-2ff'')=\tfrac12 f'f^2R_h>0 .
\]
Thus \(f'\le1\) there, since \(\mu\ge a>0\), and
\(a\le\sin r_0\). The same mass comparison even gives
\(a\le\sin^3r_0\). Set \(G=f''+(1-f'^2)/f\). The radial and
tangential sectional curvatures differ by \(-G/f\), so
\[
 A\ \ge\ \frac{2\pi}{3}\int_{s_*}^S G^2\,ds .
\]
On this interval \(H=(1-f'^2)/f^2\) decreases in total from
\(1/a^2\) to \(1\), and satisfies \(H'=-2f' G/f^2\).
Therefore, regardless of the sign of \(H'\) pointwise,
\[
 \frac{1-a^2}{2a^2}
     =\int_{s_*}^S \frac{f'G}{f^2}\,ds,\qquad
 \int_{s_*}^S\frac{(f')^2}{f^4}\,ds
     \le\int_{s_*}^S \frac{f'}{f^4}\,ds\le\frac{1}{3a^3}.
\]
Cauchy–Schwarz gives \(A\ge\pi(1-a^2)^2/(2a)\).

For every \(L>0\) E26 now gives
\[
\begin{aligned}
 e_X(L)
 &\ge AL+B/L
 \ge 2\sqrt{AB}\\
 &\ge 2\pi d\sqrt{\tfrac23}\,
      \frac{(1-a^2)\cos^2r_0}{\sqrt{a(R-r_0)}}\\
 &\ge 4\pi\sqrt{\tfrac23}\,(d/R)\cos^4 R .
\end{aligned}
\]
The last step uses \(a\le\sin r_0\le r_0\), then
\(a(R-r_0)\le R^2/4\) and
\((1-a^2)\cos^2r_0\ge\cos^4 R\). From \(R\le\pi/17\) and
\(d=\pi/6\) the final expression is at least
\((34\pi/3)\sqrt{2/3}\cos^4(\pi/17)>8\pi^2/3\).
For an exact strict comparison use \(\pi<22/7\),
\(\sqrt{2/3}>4/5\), and the cosine bound
\(\cos^4(\pi/17)\ge1-2(\pi/17)^2>93/100\).
Then \(17(4/5)(93/100)>88/7>4\pi\).

The scalar assumption is on the transported radial three-metric.
Every such fixed smooth path gives a positive four-dimensional
double for sufficiently long \(L\) by E26. The energy obstruction
holds for every Yamabe sign. It is
specific to purely radial local transvection cutoffs, the
isometrically transported radial bend, and the constant-lapse
zero-shift mapping-torus metric. It places no lower bound on an
arbitrary metric of the marked prism exterior.
