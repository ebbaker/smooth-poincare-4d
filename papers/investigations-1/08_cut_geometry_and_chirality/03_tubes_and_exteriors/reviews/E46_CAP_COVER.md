# E46 · Independent cap-cover and Kähler replay

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
assistance. GPT‑6.2 Sol with ultra reasoning requested. Actual model
and effort unavailable. Input checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, [frozen E46
request](../research-progress/handoffs/E46_REQUEST_R1.md), [E35 cover
calculation](../notes/E35_COVER_CAP.md), and [E38 complex
calculation](../notes/E38_COMPLEX_CAP.md). The E35 and E38
working-tree SHA‑256 prefixes are 25ee65328a65213b and
267846fb05838e80. The replay uses real chiral operator
Hilbert–Schmidt norms and the outward quaternion orientation.

The oriented cover, both eta values, the comparison floors and the
Fubini–Study marking check. The conformally Kähler obstruction also
holds with the complex structure and conformal factor initially
allowed to vary along the orbits. This uses strictly positive
reflective Yamabe sign to ensure positive energy in both orientations
and uses the first normal jet at the prescribed umbilic face.

## Cover and eta

For the disk cap marked by the collapsing $i$ circle, the map to the
unoriented bolt is $[g]\mapsto[g^{-1}ig]$. Precisely $\langle i\rangle$
keeps the sign in $g^{-1}ig$. The pullback by the oriented-base
double cover therefore has boundary $\langle i\rangle\backslash
S^3$ and bolt $S^2$. The Hopf circle modulo its order-four subgroup
multiplies the Euler number in magnitude by four. In
$z_1+z_2j$ coordinates with complex unit $i$, left multiplication
by $i$ multiplies both complex coordinates by $i$, and the real
coordinate orientation is $(1,i,j,k)$. Thus the round lens-space
eta is $-1/2$. For the full $Q_8$ action the six order-four
elements give contribution $-1$ each and the central involution
gives zero. Thus the round quaternionic eta is $-3/4$. This uses
the cotangent product in the round fixed-point evaluation and
averaging over deck transformations. [APS II, §2, particularly
(2-7) and (2-12)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf)

Here is a direct relative calculation. Let $e^a$ be the oriented
orthonormal right-invariant coframe for lengths $(1,1,t)$ and write
$d e^a=n_a e^b\wedge e^c$ cyclically. Then
$n_1=n_2=2/t$, $n_3=2t$. Put
$\omega_{12}=c_3 e^3$, $\omega_{23}=c_1 e^1$,
$\omega_{31}=c_2 e^2$ for the skew connection; Cartan's first
equation gives $(c_1,c_2,c_3)=(t,t,2/t-t)$. The Pontryagin
Chern–Simons trace before normalization is
\[
 \operatorname{tr}\left(\omega\wedge d\omega+\tfrac23\omega^3\right)
 =\left(-2\sum n_a c_a^2+4c_1c_2c_3\right)e^{123}.
\]
Its integral changes by $-16\pi^2(t^2-1)^2$ on $S^3$ from $t=1$.
With $L_1=p_1/3$ and $p_1=-\operatorname{tr}(\Omega^2)/(8\pi^2)$,
the eta change is $2(t^2-1)^2/3$ before dividing by the cover
degrees. At $t=\sqrt3$ the eta values are $-5/12$ downstairs and
$1/6$ upstairs. Equivalently, integrate the transgressed Pontryagin
form on a product-ended cylinder and divide by degree.
[APS I, (4-14)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24)

An umbilic cut can be made totally geodesic with boundary
representative unchanged using a conformal logarithm with value
zero and prescribed normal derivative at the boundary. The
integrated Weyl blocks are conformally invariant. To use the
product form of APS directly, replace the metric by an exact
product in a shrinking geodesic collar. Its value differs by
$O(s^2)$ from that product and its first derivative by $O(s)$,
so the curvature energy converges as the collar shrinks.
Consequently $E_+-E_-=12\pi^2(\tau+\eta)$ with the same intrinsic
eta values. The downstairs signature is zero. Applying degree
two multiplication to the signed integral gives the lifted
signature $-1$ and fixes the normal Euler sign to $-4$.
The cap differences are respectively $-5\pi^2$ and $-10\pi^2$.
Orientation reversal exchanges the energies.

## Closed comparisons

The identity double of the lifted disk is the sphere bundle of
its oriented normal plane plus a real line. The Euler number
$-4$ maps to zero in $\pi_1(SO(3))$, so the double is
$S^2\times S^2$, with $\chi=4$, $\tau=0$, and $b_2^\pm=1$.
A positive Robin sign persists on the lift by lifting the
positive first Neumann eigenfunction in the totally geodesic
gauge. On reflection, the even sector is the Neumann form and
the odd sector is the Dirichlet form. For two different totally
geodesic caps, coercivity of the forms adds on their common
trace space. Productization in a shrinking collar gives $C^1$
and $W^{2,p}$ convergence for finite $p$, so the scalar form
converges in its $H^1$ bound by $H^1\hookrightarrow L^4$ and
strict positivity is preserved. The chiral energies converge as
well. [Robin smoothing](../../02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md)

On smooth positive-Yamabe approximants with $b_2^+>0$, Gursky's
bound is $E_+\ge(4\pi^2/3)(2\chi+3\tau)$ in operator norm.
Thus reflection gives
$E_+(\widetilde W)+E_-(\widetilde W)=4e_W\ge32\pi^2/3$.
Subtracting the signed defect yields $E_+(\widetilde W)\ge
\pi^2/3$ and $E_+(W)\ge\pi^2/6$. This also gives both chiral
blocks positive on an independent metric on the marked oriented
disk cover: use its own reflection double and the fixed APS
defect. The Chern–Gauss–Bonnet estimate on a volume-one Yamabe
representative is
\[
 E_\pm\ge2\pi^2(2\chi\pm3\tau)-Y^2/48 .
\]
The universal $Y^2\le384\pi^2$ gives the weaker $8\pi^2$ floor
on the reflected cover. To improve the Gursky floor by this
estimate needs $Y^2<256\pi^2$ with a uniform margin for the
relevant classes. The equal-radius product class itself has
$Y=16\pi$: the product is positive Einstein, its normalized
scalar integral is $16\pi$, and Obata uniqueness applies in
this class. The smooth equality exclusion in E08C is an
attainment result and supplies no uniform improvement. [Fu,
Theorems A and A*, including the proof of the Gursky
inequality](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf)
· [Sung, (5) and Theorem 1.4(v)](https://arxiv.org/pdf/2108.03808)
· [E08C](../../02_seams_and_marked_cuts/reviews/E08C_REALIZATION.md)

A positive comparison cap on the opposite Euler disk has
the opposite signed defect and hence $E_+\ge31\pi^2/3$.
The glued closed manifold still has $(\chi,\tau)=(4,0)$.
Subtracting the comparison contribution from the closed floor
can give at most $\pi^2/3$ for the smaller energy of the
original lifted cap. For a general comparison $Z$ with the
common boundary and a strictly positive glued form, the minus
test is available since the negative bolt class survives the
rational homology sphere gluing. Using
$E_+(Z)-E_-(Z)=12\pi^2\tau(Z)-2\pi^2$, the minus lower
bound on $E_+(\widetilde W)$ exceeds the formal plus lower
bound by $4\pi^2(\tau(Z)-1)$. Applying the plus test requires
$b_2^+(Z)>0$. A downstairs switch interchanging the two
short axes sends one extending subgroup to the other and
does not lift to a map of the same specified boundary covers.

## Fubini–Study face and normal jets

For holomorphic sectional curvature four, let
$z=\cos s\,e_1+\mathrm i\sin s\,e_2$ with $0<s<\pi/4$.
Varying $s$ has unit speed. Write $A_a x=e_a\times x$.
Projecting $A_a z$ orthogonally off the complex line $z$
gives respective norms $\sin s,\cos s,\cos 2s$. The principal
stabilizer is the half-turn about $e_3$, with cyclic order-four
lift to $SU(2)$. Complex conjugation across the conic chamber
adjoins the half-turn about $e_1$ on each open orbit and is
antipodal on the conic. With the orbit written as a left
quotient, the map uses $g^{-1}$ acting on $[z]$. An orientation
check uses the complex horizontal basis
$w_1=\partial_s z,\ w_2=e_3$. The three projected orbit
directions are $\mathrm i\sin s\,w_2,-\cos s\,w_2,
-\mathrm i\cos2s\,w_1$. Thus $(\partial_s,A_1,A_2,A_3)$
is positive in the complex-opposite orientation. Passing to
$g^{-1}$ reverses the orbit orientation. The conic side,
with outward normal $-\partial_s$, consequently has the
outward quaternion boundary orientation, and the real side
has its opposite. The conic has normal Euler $-4$ in this
orientation, also obtained from the self-intersection of a
degree-two complex curve.

At $s=\pi/6$, relabeling $e_3,e_1,e_2$ as $i,j,k$ gives
$(1,1,\sqrt3)$ up to scale with the required short extending
axis. The outward log-length derivatives on the real side
in the original order are $\sqrt3,-1/\sqrt3,-2\sqrt3$,
and negate on the conic side. A conformal change contributes
a common shift before multiplication by the inverse scale.
It cannot make these three lengths have equal log-derivatives.
The intrinsic face matches and the trace-free first normal
jet does not.

On the whole complex-oppositely oriented $\mathbb{CP}^2$,
$E_+=0$ and $E_-=12\pi^2$. The former follows by evaluating
the curvature operator on primitive real $(1,1)$ forms for
constant holomorphic sectional curvature, and the latter
follows by signature. Both densities are constant. The orbit
volume factor $\sin s\cos s\cos2s$ gives fraction $\sin^2(2s)$
from the real side and therefore fraction $3/4$ at the face.
The real piece has $E_-=9\pi^2$, the conic piece $E_-=3\pi^2$
upstairs, and the reflected signs follow from orientation
reversal. A collar retaining the real piece and reaching the
prescribed umbilic face leaves $E_-(Z)\ge9\pi^2$ and forces
$E_+(Z)\ge7\pi^2$ by APS. Gluing gives $\chi=3,\tau=-1$ and
$b_2^+=0$. The minus Gursky floor $12\pi^2$ already follows
from signature and nonnegativity, and the plus
Chern–Gauss–Bonnet lower bound cannot exceed $6\pi^2$ for
positive Yamabe sign before subtracting the comparison energy.
This tests the appended collar retaining that real-side
segment. [E35 comparison](../notes/E35_COVER_CAP.md)

## Complex structure, both orientations

At a principal orbit downstairs, $Q_8$ fixes only the
radial tangent line. Any invariant $J$ would preserve that
line and could not square to $-1$. On the cover, $\langle
i\rangle$ instead splits the tangent representation into
two real two-planes, radial with $i$, and $j$ with $k$.
Its signs force every invariant orthogonal complex structure
to give the quarter turn on each plane, with independent
orientation choices. Up to conjugating both, use
$\alpha=ds+\mathrm i l_1\sigma_1$ and
$\beta=l_2\sigma_2+\mathrm i\varepsilon l_3\sigma_3$,
$\varepsilon=\pm1$. With $d\sigma_a=2\sigma_b\wedge
\sigma_c$ cyclically, the radial terms of $(d\beta)^{0,2}$
contribute $(k_2-k_3)/4$ and its orbit terms contribute
$\varepsilon(l_2/l_3-l_3/l_2)/(2l_1)$. At an umbilic face
$k_2=k_3$, but $l_2\ne l_3$ for the short $i$ marking.
The contradiction holds for either $\varepsilon$. If the
cover metric is independently invariant, its transverse
off-diagonal entry and first derivative vanish in the
marked axes at the umbilic face, so the same first-jet
calculation applies. Conformal rescaling multiplies the
entire integrability coefficient by the inverse scale.

For the diagonal ansatz closure gives
$(f^2l_2l_3)'=2\varepsilon f^2l_1$. The bolt slope is
$l_1'=4$, and the tangent metric approaches equal limiting
lengths. Writing $u=\log(l_2/l_3)$ gives
$u'=-4\varepsilon\sinh(u)/l_1$. Thus nonzero
$\tanh(u/2)$ has leading order $s^{-\varepsilon}$.
The plus sign forces a biaxial germ. The minus sign permits
a linear splitting, whose trace-free tangent tensor
rotates with weight four, matching the normal slice
weight. The exact E38 profiles have
$l_1/4=s$, an even tangent trace and a difference equal
to $s$ times a smooth function of $s^2$. These meet the
smooth disk parity conditions. Deck conjugation by $j$
reverses both quarter turns. [E20 slice replay](E20_SHORT_AXIS_READBACK.md)
· [E38 local profiles](../notes/E38_COMPLEX_CAP.md)

For a whole-cap Kähler representative $f^2g$ with $f$
smooth positive, the complex orientation selects one of
the two Weyl blocks. Its energy is strictly positive by
the reflected cover estimate and APS. The Kähler scalar
therefore does not vanish identically. On a nonempty
component where the selected block is nonzero, the
Kähler form is the simple eigenline of that block, with
eigenvalue $R_{f^2g}/6$ and double eigenvalue
$-R_{f^2g}/12$. The normalized $g$-form
$\omega_g=f^{-2}\omega_{f^2g}$ is invariant there:
the action is connected and isometric for $g$, preserves
the conformal eigenline, and cannot change its sign.
The principal isotropy already contradicts this downstairs.
On the cover, $d\omega_g=-2d\log f\wedge\omega_g$ and
wedging with $\omega_g$ is injective on one-forms.
Consequently $a^*f/f$ is constant on the component for
each $a\in SU(2)$, and comparison at an orbit maximum
gives that constant as one. [Derdziński, Proposition 2](https://www.numdam.org/article/CM_1983__49_3_405_0.pdf)

To extend the invariance across any open zero-scalar
region, set $\psi=f^{-3}\omega_{f^2g}$. The conformal
Killing transformation law for two-forms gives that
$\psi$ is conformal Killing for $g$. For each $a$ the
difference $\psi-a^*\psi$ is also conformal Killing
and vanishes on the nonempty component above.
Semmelmann's prolongation makes the difference and its
associated derivatives a parallel section of a smooth
connection, so uniqueness along curves makes it vanish
on the connected interior. Smoothness gives invariance at
the boundary. Since $|\psi|_g=\sqrt2/f$, both $f$ and $J$
are now invariant and the two-sign first-jet obstruction
applies. The argument assumes a smooth positive
representative up to the marked face. It leaves unrestricted
positive cap metrics and modifications of the conic-side
geometry beyond the tested families open. [Semmelmann,
Proposition 2.6 and §5](https://www.igt.uni-stuttgart.de/dokumente/semmelmann/semmelmann_Publ/2003mz_24.pdf)
