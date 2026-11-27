# SP4-CUT-TUBE-E34 · Global compressible transport on the marked prism

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable.
[Frozen E34 request](../research-progress/handoffs/E34_REQUEST_R1.md),
checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Inputs are the
[B07 decision](../brainstorm/notes/B07_GLOBAL_PRISM.md),
[marked prism construction](MARKED_PRISM_17.md), SHA-256 beginning
63ad69fc5d311001, the [E26 length test](E26_LENGTH_TEST.md), SHA-256
beginning 8345b550f604762d, and the [E29 bend estimate](../reviews/E29_MOVING_PUNCTURE.md).
The normalization is the mean of the two real Hilbert–Schmidt
Weyl block energies, with \(T=4\pi^2\).

The actual round prism gives a global spectral strain inequality
with constant six after projection away from its single
conformal Killing field. The marked transverse transvection
germ forces a quantitative strain cost for every global extension.
A smooth global compressible field and a fixed short acceleration
give a reflected positive double at sufficiently long length,
but the exterior energy exceeds \(8\pi^2/3\) at every length for
that test. The estimate for the electric term requires the short
acceleration hypothesis.

## The global conformal Killing kernel and a spectral gap

Use the unit round quotient
\(Y=(Q_8\times C_{17})\backslash S^3\), with deck transformations
\(x\mapsto u x z^{-1}\) and
\(C_{17}=\langle e^{2\pi i/17}\rangle\).
For a real tangent vector field \(V\) write
\[
 \mathcal D V=(\operatorname{sym}\nabla V)^\circ
\]
in the unit round metric. Let \(Z_i(x)=xi\), a global unit
Killing field on \(Y\), and let \(\Pi V\) be the orthogonal
projection onto its real span in \(L^2(Y)\). Then
\[
 \int_Y|\mathcal D V|^2\,dV\ \ge\
                 6\int_Y|V-\Pi V|^2\,dV.                       \tag{1}
\]

To prove (1), lift to \(S^3\subset\mathbb R^4\) and take the
four ambient components of the equivariant lift of \(V\).
The left deck element \(-1\) makes them odd. Their projection
onto the degree-one spherical harmonics has the form
\(x\mapsto P x\), where \(P\) commutes with the deck action since
orthogonal projection commutes with that action. Commuting with
left multiplication by \(i,j,k\) forces \(P\) to be right
multiplication by \(P(1)\), since its values on \(1,i,j,k\) determine
it. Commuting also with the right \(C_{17}\) factor restricts
\(P(1)\) to the complex \(i\)-plane. The trace of \(P\) vanishes
because
\(\operatorname{tr}P=(4/\operatorname{Vol}(S^3))\int_{S^3}\langle V(x),x\rangle=0\).
Thus the degree-one part is exactly the lift of \(\Pi V\).

For \(W=V-\Pi V\), all remaining component harmonics have odd
degree at least three. On the unit \(S^3\), restrictions of
homogeneous harmonic polynomials of degree \(m\) have scalar
eigenvalue \(m(m+2)\), by the polar Laplacian formula. These
spaces exhaust \(L^2\) since polynomial restrictions are dense
and decompose into harmonic restrictions by subtracting radial
squares. Hence the ambient component gradient energy is at
least \(15\int|W|^2\). The ambient and intrinsic gradient norms
differ by exactly \(|W|^2\) pointwise, since the normal derivative
component in direction \(e_a\) is \(-\langle W,e_a\rangle x\).
This gives \(\int|\nabla W|^2\ge14\int|W|^2\), with the same
constant on the quotient. Integration by parts, using
\(\operatorname{Ric}=2g\), gives
\[
 \int_Y|\mathcal D W|^2
  =\tfrac12\int_Y|\nabla W|^2+\tfrac16\int_Y(\operatorname{div}W)^2
    -\int_Y|W|^2 .
\]
Indeed the cross contraction of \(\nabla_aW_b\) and \(\nabla_bW_a\)
integrates to the divergence square minus \(\int\operatorname{Ric}(W,W)\).
Since \(\mathcal D(\Pi V)=0\), (1) follows. In particular the kernel
is exactly \(\mathbb R Z_i\). A curve of global round isometries
can therefore move points only along this Killing direction.
It does not supply the transverse co-moving isometries on all
of \(Y\).

## The marked ball forces nonzero global strain

On the chosen lift \(p_\ell=p\exp(-j\ell)\),
\(0\le\ell\le d=\pi/6\), the oriented unit transvection \(Z_\ell\)
has value \(-p_\ell j\) at the centre, perpendicular to
\(Z_i(p_\ell)=p_\ell i\). Suppose an arbitrary global smooth
velocity \(V_\ell\) agrees with \(Z_\ell\) on the round ball of
radius \(r_0\) about the moving centre, with \(0<r_0<1/10\)
and that ball embedded. Its projection coefficient need not
be small. Nevertheless
\[
 \int_{B_{r_0}(p_\ell)}\langle Z_\ell,Z_i\rangle\,dV=0.       \tag{2}
\]
For (2), move the lifted centre to \(1\) by left translation,
which preserves the right \(i\) field. For
\(x=c+s(y_i i+y_j j+y_k k)\), \(c=\cos r,\ s=\sin r\),
the planar rotation field has value \(-cj+s y_j\).
Its inner product with \(xi\) is
\(-s^2y_i y_j-sc\,y_k\). Its spherical average is zero.
Also \(|Z_\ell|^2=c^2+s^2y_j^2\). Thus any multiple of
\(Z_i\) can only increase the squared distance from \(Z_\ell\)
on the germ ball. Applying (1), and using
\(\sin r\ge(9/10)r,\ \cos r\ge9/10\), gives the uniform
instantaneous bound
\[
 \|(\operatorname{sym}\nabla V_\ell)^\circ\|_{L^2(Y)}^2
 \ \ge\ 24\pi\int_0^{r_0}\cos^2r\sin^2r\,dr
 \ \ge\ 8\pi(9/10)^4r_0^3
 \ >\ 5\pi r_0^3 .                                          \tag{3}
\]
Although (3) uses the ball to measure the velocity, its strain
vanishes there because the germ is Killing. The left side is
therefore also its exterior round-region norm, with no use of
an outer zero-velocity boundary or stress flux.

## A genuine global compressible field and the marked path

One explicit choice of a global background is
\[
 n(x)=x i x^{-1},\qquad
 F(x)=n_i(x)^4+n_j(x)^4+n_k(x)^4,\qquad W_0=\nabla F .
\]
Right \(C_{17}\) fixes \(n\), and the left \(Q_8\) changes pairs of
its coordinate signs. The prism isometry
\(\Phi(x)=a_0xj^{-1}\), \(a_0=(1+i+j+k)/2\), sends \(n\) to
\(-a_0 n a_0^{-1}\), which permutes its axes up to sign. Thus
\(F\) and its gradient descend and are \(\Phi\)-invariant.
The nonconstant function has nonzero Laplacian on an open region
outside any small chart, by analyticity and by integration of
\(F\Delta F\) on the closed quotient. For two embedded radii
\(r_0<R\) about the arc, use an ordinary smooth radial cutoff
\(\chi_\ell=1\) for \(r\le r_0\), zero for \(r\ge R\), and set
\[
 V_\ell=\chi_\ell Z_\ell+(1-\chi_\ell)W_0 .
\]
Here the transvection is only used within the embedded chart;
the global field equals the compressible gradient beyond it.
The shape of the fixed background is specified on the entire
quotient. Both fixed radii \(r_0=1/100,\ R=2/100\) fit along the
arc by [E29](../reviews/E29_MOVING_PUNCTURE.md).

Prescribe an arc schedule \(\ell(t)\) with speed \(v(t)\), and
let \(\Psi_t\) be the global flow of \(v(t)V_{\ell(t)}\).
On the rigid ball it equals the prescribed transvection by
uniqueness. Transport a fixed positive E05 radial bend in that
ball and leave the exterior round in Eulerian coordinates.
Pull the result back by \(\Psi_t\) to the fixed punctured fibre.
The bent geometry is then stationary, while the round region
consists of pullbacks of the unit round metric. This is the
support separation of E29 with no condition at large radius.
The intrinsic trace-free Ricci and the time terms have zero
pointwise pairing. Hence \(B=\int|M|^2\ge0\) in the E26 formula.

Use constant endpoint time germs for the test below.
The same radial metric at the terminal centre equals the
pushforward of the initial metric by \(\Phi\), because both
terminal round identifications differ by a rotation at the centre.
So \(h_1=(\Phi^{-1}\Psi_1)^*h_0\) is the smooth matching condition.
The altered global field retains the actual based class:
interpolating its velocity with the localized velocity of E29
preserves the rigid germ at every time, and the endpoint maps
give an isotopy relative to that ball after composing with the
fixed terminal identification. Reversing the base gives the
inverse convention and preserves the mean price and both
homotopy-sphere closing possibilities. The fixed product collar
of the bend doubles smoothly. Every \(h_t\) is positive-scalar
and the path is smooth and compact, so E26 gives a positive
doubled metric for sufficiently long \(L\).

## An electric obstruction with prescribed short acceleration

In the moving round region, in Eulerian notation,
\(k_\ell=\operatorname{sym}\nabla V_\ell\) and \(K=v\,\Psi_t^*k_\ell\).
Differentiate using the pullback derivative at fixed reference
position. The E26 electric correction pulls back from
\[
 -v' k_\ell^\circ+v^2 Q_\ell,\qquad
 Q_\ell=
 \left(-\partial_\ell k_\ell-\mathcal L_{V_\ell}k_\ell+
                    (\operatorname{tr}k_\ell)k_\ell\right)^\circ .
\]
The two tensors vanish on the open rigid germ and can be
integrated in the round closed quotient. The parameter
derivative includes the centre motion and the profile change.
No cancellation of the mixed time term is assumed. Set
\[
 \kappa=(5\pi r_0^3)^{1/2},\qquad
 M_*=\sup_{0\le\ell\le d}\|Q_\ell\|_{L^2(Y)}<\infty .
\]
Take a smooth ramp function on \([0,1]\), increasing from zero
to one, constant near the endpoints, with integral \(1/2\);
a symmetric cutoff supplies one. Start from rest on the
interval \([0,\delta]\) using this ramp scaled to amplitude
\(v_*=d/(1-\delta)\), follow with speed \(v_*\) until
\(1-\delta\), and reverse the ramp for the final \(\delta\).
The signed displacement is \(d\), and if \(\delta\le1/4\)
the amplitude is less than \(2d\). On the first ramp,
Cauchy–Schwarz gives
\(\|v'\|_{L^2(0,\delta)}\ge v_*/\sqrt\delta\).
The reverse triangle inequality in spacetime \(L^2\) and (3) give
\[
 \|U\|_{L^2(\text{first ramp})}
   \ge \frac{\kappa v_*}{\sqrt\delta}
       -M_*v_*^2\sqrt\delta
   \ge\frac{\kappa v_*}{2\sqrt\delta}
 \quad\text{if }\delta\le\min(1/4,\kappa/(4dM_*)).
\]
When \(M_*=0\), only \(\delta\le1/4\) is needed. Thus
\[
 C\ge\frac{\kappa^2d^2}{16\delta}\ge\frac{5\pi}{16}r_0^3 ,
\]
using \(d>1/2\). The intrinsic bound of E29 on the fixed
positive radial bend gives \(A\ge\pi/(4r_0^3)\): its last
turning radius is at most \(\sin^3r_0\le r_0^3\), and
\((1-r_0^6)^2>1/2\). Together with \(B\ge0\), this gives
\[
 e_X(L)\ge A L+C/L^3\ge 4A^{3/4}C^{1/4}/3^{3/4},
 \qquad
 \left(\frac{e_X(L)}{8\pi^2/3}\right)^4
    \ge\frac{15}{16384\pi^4 r_0^6}>1 .
\]
The last comparison follows from \(r_0<1/10\) and \(\pi^4<100\).
This rules out all positive \(L\) for any such global
profile family with this sufficiently short prescribed
start. No positivity estimate is used to narrow the tested
length interval.

## A fixed rational ramp width for the explicit field

For \(r_0=1/100,\ R=2/100\), one can use
\(\delta=10^{-14}\) without measuring the coefficients.
Use the normalized even bump
\(\beta(y)\propto \exp[-1/(1-4y^2)]\) on \(|y|<1/2\)
and zero elsewhere. The time ramp can be taken to be
\(\int_{-\infty}^{2x-1}\beta(y)\,dy\) for \(0\le x\le1\),
which has constant endpoint intervals and integral \(1/2\).
The bump's normalization integral before dividing
is greater than \(1/12\) by the subinterval \(|y|\le1/4\).
The unnormalized derivative is bounded by \(16\), using
\(\sup_{u\ge1}u^2e^{-u}=4/e^2\). Thus
\(\|\beta\|_\infty<12,\ \|\beta'\|_\infty<192\).
Take \(\chi\) to be the integral tail of this bump, centred
at \((r_0+R)/2\) and rescaled by \(R-r_0\).
Its intrinsic gradient and Hessian are bounded by \(1200\)
and \(2160000\) in Hilbert–Schmidt norm, using
\(|\nabla^2r|\le2/r_0\) on its support.

For the ambient polynomial extension
\(n_j(x)=\langle xi\bar x,e_j\rangle\), the operator norms
of its first two derivatives on the unit sphere are at most
two, and \(|n_j|\le1\). The first three ambient derivatives
of \(\sum n_j^4\) then have operator bounds \(24,168,1008\).
For its spherical gradient this gives
\[
 |W_0|\le24,\qquad |\nabla W_0|<600,\qquad
 |\nabla^2 W_0|<10^4 .
\]
For the last two bounds, the spherical Hessian is the
ambient tangent Hessian minus the radial first derivative
times the metric. Differentiating tangentially adds at most
\(2\cdot168+168+24\) to the third operator bound, and converting
a rank-three tensor to Hilbert–Schmidt norm costs less than
six. The linear planar rotation \(Z_\ell\) has bounds
\(1,3,12\) for its value and first two intrinsic derivatives
by tangential projection of its constant ambient matrix.

The resulting \(V_\ell\) has bounds
\(24,31000,56000000\) of those orders. Also
\(\partial_\ell V_\ell=-(Z_\ell\chi_\ell)(Z_\ell-W_0)\)
in the transition chart, since the actual transvection
generator is stationary in its local lift. Differentiation
and the preceding bounds give
\(|\nabla\partial_\ell V_\ell|<55000000\).
Using
\[
 |\mathcal L_{V_\ell}k_\ell|
 \le |V_\ell|\,|\nabla k_\ell|+2|\nabla V_\ell|\,|k_\ell|,
 \qquad |(\operatorname{tr}k_\ell)k_\ell|\le2|k_\ell|^2
\]
gives \(\sup|Q_\ell|<10^{10}\).
Since \(\operatorname{Vol}(Y)=2\pi^2/136<1\),
this also bounds \(M_*\). Here \(\kappa>1/300\) and \(d<1\),
so the stated rational width meets the acceleration condition.
All cutoff and length choices are fixed. The global profile
and its time schedule were not optimized.

The global strain inequality holds for arbitrary smooth
extensions of the instantaneous germ, including compressible
ones. The electric conclusion covers the specified short
acceleration construction. General resting schedules,
nonresting schedules and paths with a changed outer metric
are outside the electric lower bound proved here.
