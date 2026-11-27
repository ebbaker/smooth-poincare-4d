# E30 · Electric cost of the gradient puncture extension

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual model and effort are unavailable. This is the bounded
[request R1](../research-progress/handoffs/E30_REQUEST_R1.md)
(Git blob \(\texttt{b0bb73bee1ea}\)) at
\(\texttt{bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0}\).
It uses the [length test](E26_LENGTH_TEST.md)
(\(\texttt{c48bad1bd58e}\)), the [actual prism path](MARKED_PRISM_17.md)
(working blob \(\texttt{898be300ec8f}\)), and the
[E29 radial-bend replay](../reviews/E29_MOVING_PUNCTURE.md).
All metrics and transports are smooth and Riemannian. The signed
energies use the real Hilbert–Schmidt Weyl operators, with \(T=4\pi^2\).

**Result.** This extension has magnetic cutoff infimum of order
\(\rho^3\) on a round shell \([\rho,2\rho]\), so the \(1/\rho\)
magnetic bound for a scalar multiple of the transvection does not
carry over. The actual co-moving electric coefficient has a uniform
\(1/\rho\) lower bound for this two-cutoff class, including an
allowed constant-speed path with matched time jets. Coupled to the
static bend, it excludes every base length for any embedded shell
of ratio two in the stated small-radius range.

## The fixed marked motion and its jets

Write \(d=\pi/6\) for the marked prism displacement and \(p_t\) for its
chosen great-circle arc, with length coordinate \(\ell(t)\) and
speed \(v=\ell'\), so \(\int_0^1 v\,dt=d\). Transport a fixed radial bend
in the inner ball by the local true transvection \(I_t\) about this
circle. Use \(I_t\) also to transport the fixed round-annulus field,
whose one-form at unit speed is
\[
V_0^\flat=d(\chi s c f)+2\eta s^2 f\,dr,\qquad
s=\sin r,\quad c=\cos r,\quad \eta=\widehat\chi .
\]
The harmonic \(f\) is the scalar product of the unit spherical
direction with the displacement direction. Both smooth cutoffs are
one near the inner face and zero near the outer face. The
transvection has \(Z^\flat=f\,dr+s c\,df\).
The identity \(d(sc f)+2s^2 f\,dr=Z^\flat\) shows that the
altered extension preserves the actual inner diffeomorphism and its
derivative. The endpoint maps of the original and altered fields
are isotopic relative to the inner ball. Interpolating their smooth
fields leaves this common isometric germ fixed at every time.

Let \(\Psi_t\) be the flow of the Eulerian field
\(V_t=v(t)I_{t*}V_0\), extended by zero outside the moving shell and
its inner ball. Denote the moving bent metric by \(\widehat h_t\)
and the pulled-back metric by \(h_t=\Psi_t^*\widehat h_t\).
Near the puncture \(\Psi_t\) agrees with \(I_t\). Thus \(h_t\) is
stationary where the intrinsic trace-free Ricci tensor is supported,
whereas the time-dependent tensors are supported on the pulled-back
round shell. The exact radial boundary collar reflects smoothly to
the double. The metrics \(h_t\) all have the same positive spatial
scalar curvature lower bound.

The motion can be made at constant speed with smooth mapping-torus
jets. On the cover the marked endpoint isometry \(J\) sends
\(p\exp(-j\ell)\) to \(p\exp(-j(\ell+d))\), because
\(p^{-1}bp=\exp(j\pi/3)\) in the notation of the prism construction.
The orthogonal map \(J\) therefore commutes with the transvection
acting by rotation in the real plane of the circle and the identity
on its orthogonal complement. It preserves the transported
displacement direction and the scalar function \(f\).
For any smooth periodic speed with the prescribed integral,
including \(v=d\), extend \(\ell\) by \(\ell(t+1)=\ell(t)+d\).
This gives
\[
V_{t+1}=J_*V_t,\qquad \widehat h_{t+1}=J_*\widehat h_t,\qquad
\Psi_{t+1}=J\Psi_t J^{-1}\Psi_1 .
\]
The last equality is uniqueness of the time-dependent flow, with
initial value at \(t=0\) given by \(\Psi_1\) on both sides.
Consequently \(h_{t+1}=(J^{-1}\Psi_1)^*h_t\) for all \(t\).
This is the exact jet-matching relation for the inverse convention
to the based map \(\Psi_1^{-1}J\).

On this arc, the round injectivity radius is \(\pi/34\).
The central left factor \(-1\) paired with \(z^8\) displaces by
\(\pi/17\), the smallest nonzero displacement among the central
left factors and right powers of \(z\). For a noncentral left
factor \(q\in Q_8\), the real part of
\(p_t^{-1}q p_t z^{-m}\) has magnitude at most \(\sqrt{2/3}\).
Indeed \(p_t i p_t^{-1}\) is orthogonal to the diagonal
\(p_t j p_t^{-1}=(i+j+k)/\sqrt3\), and the largest projection
of any of the three axes onto that orthogonal plane is
\(\sqrt{2/3}\). Their displacements exceed \(\pi/17\).
In particular the fixed \(R=2/100\) shell embeds. When varying
the ratio-two shell, one may take the actual embedded radii
\(2\rho<\pi/34\). The estimates below use the weaker analytic
inequality \(2\rho\le\pi/17<1/5\) in addition to embedding.

## Magnetic infimum

On the round shell put \(S=\operatorname{sym}\nabla V_0\).
In the E26 sign convention, symmetrizing the curl of \(S\)
equals \(\tfrac12\operatorname{sym}\nabla(\operatorname{curl}V_0)\).
To check this, expand the two derivatives of
\(S_{li}=(\nabla_l V_i+\nabla_i V_l)/2\) in
\(\epsilon_j{}^{kl}\nabla_kS_{li}\). Both curvature commutators
are antisymmetric in \(i,j\) at constant sectional curvature,
so the trace-free symmetric contraction keeps only the
derivative of the ordinary curl. The exact one-form term in
\(V_0^\flat\) disappears before taking its exterior derivative.
Consequently the vector curl is, up to the orientation sign,
\(-2\eta K_f\), where \(K_f=(*_{S^2}df)^\sharp\) is the rotation
field on the unit sphere. On the round shell \(K_f\) remains
Killing and \(|K_f|^2=s^2(1-f^2)\). A radial scalar multiple
\(wK_f\) has squared symmetric gradient \(w'^2|K_f|^2/2\).
Integration, including the factor \(1/4\) from the preceding
curl identity, gives the half-exterior coefficient
\[
B=\frac{4\pi}{3}\left(\int_0^1v^2\,dt\right)
       \int_{r_0}^R(\eta')^2\sin^4r\,dr .
\]
Here the cross term with the intrinsic trace-free Ricci
vanishes because the supports are disjoint. The norm convention
uses \(\int_{S^2}(1-f^2)\,d\omega=8\pi/3\).

With \(J_4(r_0,R)=\int_{r_0}^R\csc^4r\,dr\), the sharp cutoff
infimum of the radial integral is \(1/J_4\) by Cauchy–Schwarz:
\[
J_4(r_0,R)=\cot r_0+\tfrac13\cot^3r_0-
            \cot R-\tfrac13\cot^3 R .
\]
The unconstrained Dirichlet minimizer has
\(\eta'=-\csc^4r/J_4\). Smooth constant end collars can
approximate it. Multiply this derivative by a smooth
nonnegative cutoff converging to one in the interior and
renormalize its integral to \(-1\). The resulting \(\eta\)
stays in \([0,1]\) and matches both constant germs.
For \([r_0,R]=[\rho,2\rho]\),
\[
J_4=\tfrac7{24}\rho^{-3}(1+O(\rho^2)),\qquad
\inf_\eta B=\tfrac{32\pi}{7}\rho^3
      \left(\int_0^1v^2\,dt\right)(1+O(\rho^2)).
\]
Time infimum \(\int v^2=d^2\) is attained at the
compatible constant speed. The precise implication from
magnetic energy alone is \(AL+B/L\ge2\sqrt{AB}\).
With only the original static collar lower bound
\(A\ge2\pi/(3a)\) for a product collar of radius and duration
\(a\), this yields the wall at the cutoff infimum if
\(a\le 1/(72 J_4)\) for \(d=\pi/6\), asymptotically
\(\rho^3/21\). The much weaker bound \(a<\rho/4\)
cannot give that conclusion from these two estimates.
For a particular measured \(A\) one may still test
\(A\inf_\eta B\ge16\pi^4/9\).

## Electric tensor in the co-moving frame

Let \(T_0=V_0-Z\), a vector field on the co-moving shell.
There the Eulerian tensor \(v I_{t*}S\) pulls back by
\(\Psi_t\) to \(K=\tfrac12\partial_t h_t\). When taking the
fixed-fibre derivative, differentiating the pushforward
as well as the flow gives
\[
\dot K=\Psi_t^*I_{t*}\big(v' S+v^2\mathcal L_{T_0}S\big),\qquad
U=\Psi_t^*I_{t*}\big(-v' S^\circ+v^2 U_0\big),\qquad
U_0=\big(-\mathcal L_{T_0}S+(\operatorname{tr}S)S\big)^\circ .
\]
In particular the derivative velocity is \(V_0-Z\).
The angular antipode on each round sphere takes \(f\) to
\(-f\), so \(S^\circ\) is odd and \(U_0\) is even. Their
shell inner product integrates to zero for each \(t\), even
with a nonzero endpoint speed. The electric coefficient is
therefore exactly
\[
C=\tfrac14\left[
 (\int v'^2dt)\int_{\rm shell}|S^\circ|^2dV+
 (\int v^4dt)\int_{\rm shell}|U_0|^2dV
\right].
\]
Reflection in an angular plane containing the displacement
axis preserves these electric tensors and reverses the
magnetic tensor, which also makes their signed integrals
against \(M\) zero. The intrinsic/chiral terms are unchanged
on the stationary bend. The scalar/Yamabe test is still the
E26 one. More explicitly, if \(H_0=\operatorname{tr}S\), the
scalar correction \(Q\) pulls back on this shell from
\(2v'H_0+v^2(2T_0H_0+H_0^2+|S|^2)\).
Its numerator is used in \(q_R\) or \(q_Y\) as in E26.

## A uniform bound for ratio-two shells

Write
\[
V_0^\flat=a f\,dr+b_1 df,\quad b_1=\chi s c,\quad
a=b_1'+2\eta s^2,\qquad \tau=a\cot r-b_1/s^2.
\]
Here \(a=a(r)\) denotes the velocity coefficient, distinct
from the static collar radius. The orthonormal entries of
\(S\) are \(S_{rr}=a'f\),
\(S_{rA}=(a+b_1'-2b_1\cot r) f_A/(2s)\),
and \(S_{AB}=\tau f\delta_{AB}\), since the unit spherical
Hessian of \(f\) is \(-f\) times the metric. At the north
axis \(f=1\), \(T_0=(a-1)\partial_r\) and
\(\nabla T_0=S=\operatorname{diag}(a',\tau,\tau)\).
For the latter equality, \(Z\) is Killing, and at the axis
the skew part of \(\nabla T_0\) vanishes by the axial
rotations and meridional reflection. In a radial parallel
frame the Lie derivative there is \((a-1)S'+2S^2\).
The difference \(D_{\rm ax}\) of radial and either
tangential diagonal of \(U_0\) is therefore
\[
D_{\rm ax}=-(a-1)(a''-\tau')-a'(a'-\tau)=-\Omega',\qquad
\Omega=(a-1)(a'-\tau).
\]
The two constant germs give \(\Omega(r_0)=\Omega(R)=0\).

Take conventional cutoffs \(0\le\chi,\eta\le1\), with no
monotonicity assumption. Set \(A_0=a-1\), \(w=(b_1-sc)/s\)
and \(\xi=2(\eta-1)s^2\). Then
\[
w=(\chi-1)c,\qquad
A_0=s w'+c w+\xi,\qquad
\tau=c w'-s w+(c/s)\xi.
\]
In particular \(w,\xi\le0\), \(w(r_0)=0,\ w(R)=-c(R)\),
and \(A_0(r_0)=0,\ A_0(R)=-1\). Integration gives
\(\int\Omega\,dr=\tfrac12-\int A_0\tau\,dr\).
The product without \(\xi\) has integral
\[
\tfrac12\cos(2R)c(R)^2+\int sc\big((w')^2+w^2\big)\,dr .
\]
This follows by integrating the mixed
\(\cos(2r)ww'\) term. The remaining contributions to
\(A_0\tau\) are
\(2c\xi w'+(\cos(2r)/s)\xi w+(c/s)\xi^2\).
The middle term is nonnegative at the stated radii.
Completing the square with half of \(sc(w')^2\) bounds the
sum of the first and last terms below by
\(-\tfrac12sc(w')^2-(c/s)\xi^2\). Hence
\[
\int A_0\tau\,dr\ \ge\
 \tfrac12\cos(2R)c(R)^2+
 \tfrac12\int sc(w')^2\,dr-4\int c s^3\,dr .
\]
For \(R=2\rho\le\pi/17<1/5\) and \(r_0=\rho\),
\(\cos(2R),c(R)^2\ge9/10\), and
\(sc\ge(9/10)r\). The latter follows from
\(s\ge r(1-r^2/6)\) and \(c\ge1-r^2/2\).
Thus \(\int_\rho^{2\rho}1/(sc)\,dr
\le(10/9)\log 2<1\) and
\(\int sc (w')^2\,dr\ge9/10\) by Cauchy with
the two endpoint values of \(w\).
The error \(4\int cs^3\,dr\) is at most
\(32\rho^4<32/10^4\). The displayed lower bound on
\(\int A_0\tau\) is therefore greater than \(5/6\), and
\(\int\Omega\,dr<-1/3\). Integration by parts against the
centered radius and Cauchy give
\[
\int_\rho^{2\rho} D_{\rm ax}^2\,dr
 \ge \frac{12}{\rho^3}\left(\int_\rho^{2\rho}\Omega\,dr\right)^2
 \ge \frac{4}{3\rho^3}.
\]

The radial diagonal \((U_0)_{rr}\) as a function of angle is
a linear combination of \(1,f^2\).
For the Lie derivative in that entry the products are
quadratic in \(f\) and its angular gradient. Its trace has
the same form using
\(\operatorname{tr}(\mathcal L_{T_0}S)=
T_0(\operatorname{tr}S)+2|S|^2\) and
\(|\nabla_{S^2}f|^2=1-f^2\).
For any such polynomial \(P(f)\),
\(\int_{S^2}P^2d\omega\ge(2\pi/3)P(1)^2\).
Indeed the orthogonal basis \(1,(3f^2-1)/2\) has squared norms
\(4\pi,4\pi/5\) and both basis values at \(1\) are one.
At the north axis \((U_0)_{rr}=2D_{\rm ax}/3\) by tracelessness.
Using \(\sin r\ge(9/10)\rho\) throughout the shell yields
\[
\int_{\rm shell}|U_0|^2dV
\ge\frac{8\pi}{27}\int_\rho^{2\rho} s^2D_{\rm ax}^2dr
\ge\frac{8\pi}{25\rho},\qquad
C\ge\frac{2\pi}{25\rho}\int_0^1 v^4dt
\ge\frac{2\pi d^4}{25\rho}.
\]
This bound uses the velocity itself rather than the
endpoint acceleration in the earlier [resting-endpoint
estimate](../reviews/E31_ELECTRIC_CAPACITY.md).

For the actual positive radial bend, E29 gives
\(a_{\rm bend}\le\sin^3\rho\) on its last increasing segment
and \(A\ge \pi(1-a_{\rm bend}^2)^2/(2a_{\rm bend})\).
Since \(\rho<1/10,\ d>1/2\), the bounds just proved give
\(A>1000\) and \(C>3/20\). For \(L\ge1/16\) the term
\(AL\) exceeds \(8\pi^2/3\); for \(0<L<1/16\) the term
\(C/L^3\) does. The remaining coefficient \(B\) is
nonnegative. Thus the energy wall holds for every positive
length, independent of the later Yamabe test. It applies
to both constant-speed and resting periodic-speed
realizations of the fixed gradient profile.

The argument covers the fixed order-seventeen great-circle
arc, radial bends, and round embedded shells of ratio two,
with the displayed bounded cutoffs transported as fixed
co-moving profiles. It leaves different shell ratios,
arbitrary angular fields, time-dependent spatial profiles,
and other outer metrics outside this proof. The two smooth
fillings of the prism and a subcritical geometry for another
marked path remain separate questions.
