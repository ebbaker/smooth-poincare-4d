# SP4-CUT-TUBE-E53 · Finite flat-collar test and marked torus transport

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable. Baseline
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. This independent read uses
the [E45 negative cylinder test](E45_TORUS_END.md),
[E40 actual torus transport](E40_TORUS_REPLAY.md),
[E26 Weyl and Yamabe forms](../notes/E26_LENGTH_TEST.md), and the
[prism geodesic marking](../notes/E39_PRISM_FILLINGS.md).
The base metric and both chiral energies use the parent's oriented
Riemannian and Hilbert–Schmidt conventions.

The finite-cylinder Dirichlet-to-Neumann formula gives an exact
negative-test criterion for any fixed core function with a positive
infinite-cylinder margin. Equality excludes strict positive Yamabe
type by an \(H^1\) test. The E40 round transport and its chiral
cancellation replay. For its changed torus, the stated absolute
lower bound on the minimum of the longitudinal radius holds.
The finite collar applies to a static product-ended complement and
does not use the unchanged round-complement scalar integral.

## From a compact negative test to a finite length

Fix the actual three-dimensional prism geodesic complement \(N\)
with smooth metric \(h\), product \(d\tau^2+k\) at its torus face,
where \(k\) is a fixed flat metric. Write
\[
 Q_N(u)=\int_N (6|du|_h^2+R_hu^2)\,dV_h .
\]
Choose a smooth compactly supported negative test on \(N_\infty\)
from E45 and restrict it to \(u\) on \(N\). Let \(b\) be the trace
on the face. Write \(b_j\) in an orthonormal real or complex basis
of torus eigenfunctions of \(-\Delta_k\), with eigenvalues
\(0=\mu_0<\mu_1\le\cdots\) counting multiplicities. The measure
for orthonormality is \(dA_k\); specifically
\(b_0=\operatorname{Area}(T,k)^{1/2}\overline b\), with \(\overline b\)
the torus average. On the infinite flat cylinder the trace energy
has infimum
\[
 6P_b,\qquad P_b=\sum_{\mu_j>0}\sqrt{\mu_j}|b_j|^2.
\]
Indeed, for \(a=\sqrt{\mu_j}>0\) and scalar coefficient \(c\) with
trace \(c(0)=b_j\),
\(\int_0^\infty(|c'|^2+a^2|c|^2)
 =a|b_j|^2+\int_0^\infty|c'+ac|^2\) for compact support.
The decreasing exponential and long truncations approach that
bound, and the zero mode can be cut off over a long interval
at energy approaching zero. A general nonzero trace need not
attain this infimum among compactly supported extensions.
The chosen compact test has total negative numerator, so
\[
                  \kappa=-\bigl(Q_N(u)+6P_b\bigr)>0 .
\]

On a finite collar \(0\le\tau\le S\) prescribe value zero at
\(S\). In each mode the unique minimizing coefficient is
\[
 c_j(\tau)=
 \begin{cases}
   b_0(1-\tau/S),&\mu_j=0,\\[2pt]
   b_j\,\sinh(\sqrt{\mu_j}(S-\tau))/\sinh(\sqrt{\mu_j}S),
       &\mu_j>0 .
 \end{cases}
\]
It has trace \(b_j\) at zero and solves \(c_j''=\mu_j c_j\).
Subtracting it from any competitor leaves a nonnegative
energy of a zero-trace difference. Integration of
\((c'_j\overline{c_j})'\) gives the mode cost
\(\sqrt{\mu_j}\coth(\sqrt{\mu_j}S)|b_j|^2\) or
\(|b_0|^2/S\). Consequently the least total form with this
fixed core and zero far trace is \(-\kappa+\mathcal C(S)\), where
\[
 \mathcal C(S)=6\left[\frac{|b_0|^2}{S}
 +\sum_{\mu_j>0}\frac{2\sqrt{\mu_j}|b_j|^2}
                    {e^{2\sqrt{\mu_j}S}-1}\right].
\]
This is exact for the prescribed core. The series is finite
as a quadratic form on any smooth trace, or on \(H^{1/2}\).
If \(b\ne0\), \(\mathcal C(S)\) is strictly decreasing and
continuous from \(+\infty\) to zero, so its equality with
\(\kappa\) gives one critical length for this test. If
\(b=0\) the excess is identically zero.

The optimized collar and the core have equal traces at
their interface. At \(S\), zero extension has matching trace
with the zero function, so the entire test is in \(H^1\).
No derivative matching is needed at either interface. Thus
\(\mathcal C(S)<\kappa\) gives a negative test, and
\(\mathcal C(S)=\kappa\) already excludes a *strictly positive*
conformal Laplacian by giving a nonzero null test in its form
domain. Equality does not give a strictly negative smooth
test by this criterion. With a strict margin, one can take
a slightly shorter collar and smooth the test, keeping it
supported in the static region. When base matching uses a
core isometry, use the invariant E45 test. The mode projection,
Dirichlet extension and a radial smoothing preserve its
invariance. Its base-independent extension to
\(L^2dt^2+h\) multiplies the form by a positive base length
and, if both halves are used, by two. These statements require
the entire support to lie in the static product region.

There are finite sufficient tests without summing all tail
modes. For example \(e^{2aS}-1\ge2aS\) gives
\[
 \mathcal C(S)\le 6\|b\|_{L^2(k)}^2/S.
\]
A sharper bound for a known least positive trace eigenvalue
\(\mu_*\) is
\[
 \mathcal C(S)\le
  6\left[\frac{|b_0|^2}{S}
          +\frac{2P_b}{e^{2\sqrt{\mu_*}S}-1}\right].
\]
To certify \(\kappa\) from a finite expansion one can bound
the uncomputed part of \(P_b\) above by
\(M^{-1/2}\|db\|_{L^2(k)}^2\) for modes with \(\mu_j>M\).
Hence a certified core form and finitely many Fourier
coefficients, with that tail estimate, eventually give a
positive lower enclosure for the margin of a fixed successful
test. No numerical cutoff is available without a choice of
\(h,k,u\); the topological argument of E45 supplies existence
of such a test for each fixed \(h,k\).

## Actual torus lattice and width

Use \(C=p_0e^{js}\) with \(p_0jp_0^{-1}=n=(i+j+k)/\sqrt3\).
In round normal coordinates on a lift,
\(q=p_0(\cos r\,e^{js}+\sin r\,e^{j\theta}i)\).
The order-two stabilizer in the prism deck group is the
antipodal map, so the lattice in \((s,\theta)\) is
\(\langle(\pi,\pi),(0,2\pi)\rangle\), and its angular
coordinate area is \(2\pi^2\). The unpointed marking \(J\)
shifts \((s,\theta)\) by \((-\pi/6,5\pi/6)\).
For a diagonal flat cross-section
\(k=F_T^2ds^2+G_T^2d\theta^2\), the characters are indexed by
integers \(m,n\) with \(m+n\) even, with
\(\mu_{m,n}=m^2/F_T^2+n^2/G_T^2\).
In the \(J\)-invariant subspace one further has
\(m\equiv5n\pmod {12}\); imposing \(J^{-1}\) gives the same
restriction. Therefore the whole-torus gap is the minimum of
\[
 4/F_T^2,\quad 4/G_T^2,\quad F_T^{-2}+G_T^{-2}.
\]
For the invariant test the corresponding minimum is over
\[
 144/F_T^2,\quad 144/G_T^2,\quad 25/F_T^2+G_T^{-2},
 \quad 4/F_T^2+4/G_T^2,\quad F_T^{-2}+25/G_T^2 .
\]
For the latter list, with neither index zero reduce the
absolute values of the residues modulo 12. For
\(1\le |n|\le6\) the least possible absolute \(m\) is
\(5,2,3,4,1,6\), respectively, and the \(3,4,6\) pairs are
dominated by \((2,2)\). This provides explicit gap data for
the finite collar test on the marked flat torus.

The weaker E40 embedded-tube bound \(R\le\pi/34\) is valid.
The exact supremal embedded radius can also be calculated.
The translate under the deck pair \((u,z^m)\) is the circle
defined by \(\operatorname{Ad}_x\operatorname{Ad}_{z^m}j
=\operatorname{Ad}_u n\). Set \(\alpha=\angle(n,\operatorname{Ad}_u n)\)
and \(\beta=\angle(j,\operatorname{Ad}_{z^m}j)\).
At points of \(C\), the first direction has polar angle
\(\beta\) about \(n\) and sweeps that latitude. Hence the
shortest distance between the two lifted circles is
\(|\alpha-\beta|/2\). The lower bound follows because conjugation
by a unit quaternion changes a direction by at most twice
its angle from \(1\). To attain it, choose the point on the
latitude on a shortest meridian toward \(\operatorname{Ad}_u n\),
and apply the shortest rotation taking its direction to
\(\operatorname{Ad}_u n\), lifted to a quaternion of angle
\(|\alpha-\beta|/2\).

For \(u=\pm1\) the smallest nonzero difference is \(2\pi/17\).
For the other \(u\), \(\alpha=\arccos(-1/3)\), and the
possible \(\beta\) are \(2\pi k/17\), \(0\le k\le8\).
One has \(10\pi/17<\alpha<11\pi/17\):
\(\sin(3\pi/34)<1/3\) and \(\sin(5\pi/34)>1/3\), using
\(\sin x\le x\), \(\sin x\ge x-x^3/6\), and \(3<\pi<22/7\).
Thus the closest \(\beta\) is \(10\pi/17\), and the
shortest component separation is
\((\arccos(-1/3)-10\pi/17)/2\).
The normal tube on a single lifted great circle is embedded
short of radius \(\pi/2\). Distinct lifted tubes touch first
at half the separation of their cores, giving the supremal
radius \((\arccos(-1/3)-10\pi/17)/4\) for this full tube.
A smoothly embedded closed tube requires strictly smaller radius.
This is a full-geodesic width, distinct from the local moving-ball
radii used in E29.

## Readback of the transport and changed-warp tests

In \(dr^2+F^2 ds^2+G^2 d\theta^2\) use rigid torus
translations near the puncture and the possibly time-dependent
field \(v(r,t)\partial_s+w(r,t)\partial_\theta\) on the annulus.
The shear vanishes on inner and outer germs. The longitudinal
constraint is \(\int_0^1v(r_0,t)dt=d=\pi/6\), after the
orientation convention is fixed. The angular translation
retains the same section of the torus on its core and only
changes normal transport. The endpoint \(J\) acts by
translations, so matching jets need no resting speed as a
separate hypothesis.

In its pulled-back orthonormal frame the only entries of
\(K\) are the symmetric pairs \(K_{rs}=q_s=Fv_r/2\) and
\(K_{r\theta}=q_\theta=Gw_r/2\). Hence \(H=0\).
Write \(\mathcal Q=F^2v_r^2+G^2w_r^2\).
The Eulerian Lie derivative of the coordinate tensor \(K\)
by the torus velocity has only radial diagonal
\(2K_{rs}^{\rm coord}v_r+2K_{r\theta}^{\rm coord}w_r=\mathcal Q\).
The explicit time derivative in the same moving frame is
off-diagonal. Thus the E26 tensor \(U\) has diagonal
\(\mathcal Q(-2,1,1)/3\), off-diagonal entries
\(-\partial_t q_s,-\partial_t q_\theta\), and
\(|U|^2/4\ge\mathcal Q^2/6\).
The diagonal bound is an equality at a time and place
where both off-diagonal time derivatives vanish.

Put \(a=F'/F,\ b=G'/G\), and \(\sigma=\epsilon_{rs\theta}\).
Using \(\nabla_{e_s}e_r=a e_s,\ \nabla_{e_s}e_s=-a e_r\)
and the corresponding \(b\) pair in the angular direction,
the symmetrized curl of E26 gives
\[
 M_{rs}=\tfrac{\sigma}{2}(q_\theta'+(2b-a)q_\theta),
 \qquad
 M_{r\theta}=-\tfrac{\sigma}{2}(q_s'+(2a-b)q_s)
\]
and zero for the remaining independent entries.
The ordered \((r,s,\theta)\) frame has \(\sigma=-1\) in
the standard quaternion orientation, since at \(s=\theta=0\)
the normal angular direction is \(ji=-k\).
The intrinsic trace-free Ricci is diagonal and has zero
contraction with \(M\). For \(\int\langle U,M\rangle\),
time integration by parts in the \(q_\theta\) derivative
gives the radial total derivative
\(-\partial_r(FG\,q_\theta\partial_tq_s)\), up to the
common orientation and coordinate-area factors. Matched
time jets remove the time boundary term, and the rigid
radial germs kill the radial boundary term. Thus the
signed energies agree for the stated paths. The cancellation
does not require \(F,G\) to be round.

In the round shear annulus the intrinsic trace-free Ricci
vanishes, while the static bend has no time tensor. This
separation gives \(B\ge0\). Hölder in radius with weight
\(F^5G\), and then in time, gives
\[
 C\ge\frac{\pi^2 d^4}{3}
    \left[\int_{r_0}^R(\cos^5r\sin r)^{-1/3}dr\right]^{-3}
 \ge \frac{8\pi^2}{81}d^4\cos^6R\,R^{-2}.
\]
The factor \(\pi^2/3\) is the actual torus coordinate
area times \(1/6\). The last inequality uses
\(\sin r\ge r\cos R,\ \cos r\ge\cos R\).
The E36 bend cost is \(A\ge(8\pi/3)\cot\rho\) for the
round exit radius \(\rho\le r_0\). The weaker \(R<1/10\)
already gives \(A>72,\ C>25/9\); minimizing
\(AL+C/L^3\) gives the stated round obstruction at all \(L\).
A changed shear annulus loses the disjoint-support
inference for \(B\).

For a changed double warp the pointwise scalar calculation
gives
\[
 R_h=-2(F''/F+G''/G+ab),\qquad
 R_{g_L}=R_h-\mathcal Q/(2L^2).
\]
If \(G=\sin r\) and \(R_h\ge0\), then
\((\sin r F')'\le\sin r F\).
The core-to-maximum comparison in E40 follows by integrating
from the core with \(F'(0)=0\). For a minimum at \(r_*\),
use \(M^+=\max_{[r_*,R]}F\) and \(F'(r_*)=0\)
unless the minimum is at the boundary. The same forward
integration gives \(F'(r)\le M^+\tan(r/2)\) on that tail.
Integrate to its maximizer to obtain
\[
 \min F\ge(1+2\log\cos(R/2))M^+
       \ge(1+2\log\cos(R/2))\cos R .
\]
This confirms the absolute lower bound. It does not give
the stronger comparison of the minimum with a global
maximum that lies to its left.

Finally, the E40 spatial trial \(F^{-1/2}\phi\), with
\(\phi\) vanishing before the puncture bend and one near
\(R\), gives the displayed restoring-region inequality
by integration by parts. In the weighted integrand the
scalar \(F\) term becomes \(-2(Ga)'\phi^2-2G a^2\phi^2\),
and the gradient term is
\(6G(\phi'-a\phi/2)^2\). Integrating the divergence term
and completing the square gives its boundary term
\(-2[Ga\phi^2]\) and the interior expression
\(8G(\phi')^2-2G''\phi^2-\tfrac12G(a\phi+2\phi')^2\).
The time form is negative shear since \(H=0\).
The exterior trace matches the constant
\(F(R)^{-1/2}\), so this is an \(H^1\) test even with
a radial derivative jump at \(R\).
Its quoted complement contribution uses the round metric
outside the tube. The finite Dirichlet-to-Neumann test above
instead uses the fixed product-ended core form \(Q_N(u)\).
They apply to their respective metric assumptions.
