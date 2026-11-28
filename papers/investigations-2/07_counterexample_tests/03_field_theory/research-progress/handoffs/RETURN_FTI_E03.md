# FTI-E03 · Finite gauge gluing on the actual twisted tube

28 November 2026, for Edward B. Baker III, with OpenAI Codex assistance.
Checkout `7c6bbab9a0a6`. The dispatch specified GPT-6.2 Sol at ultra
effort. Actual serving variant and effort are unavailable. Inputs are
[request r1](REQUEST_FTI_E03.md) (`f981bd040a9a0d91`), the [B01 cut](../../brainstorm/notes/B01_ACTUAL_CUT.md)
(`bd923836031876e2`), [B02](../../brainstorm/notes/B02_FLAT_SIGN_SECTOR.md)
(`565fa48c5ee30bb3`), [E01](RETURN_FTI_E01.md) (`6086097338384f74`),
[E02](RETURN_FTI_E02.md) (`037c8c92c9a42eeb`) and [E07](RETURN_FTI_E07.md)
(`6e5ce3af04441dc4`), with SHA-256 prefixes. [Sole register](../REGISTER.md).

The tube admits the orientation-cover class. The exterior admits only
the trivial class, so the B02 insertion annihilates the glued state.
The zero-free ball assigns the unit function on the outer sphere, and
the prescribed cap gives that function the scalar \(1/2\). The two
decorated values differ on the very same smooth ball and capped sphere.

## Cohomology and orientation of the cut

Use the smooth compact \(B=B^4_{64a}\) with its complex orientation,
the actual \(T=\tau(S^1\times D^3_r)\) of B01 with \(r=a/10\), its
boundary \(Y\), and \(E=B\setminus\operatorname{int}T\). Let \(O=\partial B\)
with its fixed standard parametrization. Orient boundaries outward normal
first so \(T\colon\varnothing\to Y\), \(E\colon Y\to O\) has boundary
\(-Y\sqcup O\), and the cap \(K\colon O\to\varnothing\) has boundary
\(-O\). The cap is the prescribed standard ball. The exterior is connected.
Indeed its inner boundary is connected, and a component disjoint from
that boundary would also be a component of \(B\).

All cohomology groups in this computation use \(\mathbb F_2\). The
disk fibers of \(T\to C\) are contractible and the sphere fibers of
\(\pi\colon Y\to C\) are simply connected. Both projections induce
isomorphisms on \(H^1\), and restriction \(r_T\colon H^1(T)\to H^1(Y)\)
is an isomorphism. With collared neighborhoods the Mayer–Vietoris segment is
\[
 0=H^1(B)\longrightarrow H^1(T)\oplus H^1(E)
 \xrightarrow{\ r_T-r_E\ }H^1(Y)\longrightarrow H^2(B)=0.
\]
Since \(r_T\) is already onto and the middle arrow injective, \(H^1(E)=0\).
Thus \(r_E\) has image zero. The restriction from \(E\) to \(O\simeq S^3\)
is also zero. The standard cap and the zero-free ball have zero \(H^1\).

In the B01 orientation of the periodic frame, E07 gives the unique
negative eigenline for the canonically oriented core tangent as
\(L^-_s=R_1(-s/2)\mathbb R e_3\).
The chosen unit tangent for that convention is
\(-\operatorname{sgn}(\kappa)\,ie^{is}\), with \(\kappa\) the real nonzero
inner multiplier in the modified form. Following a unit vector in \(L^-\)
once around the core returns its negative. Thus its orientation cover
has longitudinal holonomy \(-1\) in the multiplicative presentation of
\(G=\{1,-1\}\) and \(\lambda=\pi^*w_1(L^-)\) is the unique nonzero class on
\(Y\). Reorienting the parametrized loop inverts its holonomy, which here
is still \(-1\). The insertion gives weight \(1\) to the class \(\lambda\).
The holonomy sign is a label on that class, and the action phase is \(1\).
[Actual jet and orientation](RETURN_FTI_E07.md).

## Relative states from the bundle groupoids

The fields are finite principal \(G=\mathbb Z/2\) bundles, with trivial
action phase and complex coefficients. On a connected manifold \(M\)
the classes are \(\operatorname{Hom}(\pi_1 M,G)=H^1(M;\mathbb F_2)\).
The automorphism group for every class is \(G\), since an automorphism
is a locally constant section of the adjoint group bundle, which is
trivial because \(G\) is abelian. For a connected piece with nonempty
boundary, a choice of isomorphisms to fixed representatives on all boundary
components gives a relative bundle. An automorphism preserving a single
boundary isomorphism is the identity. Given an extending bulk class and
\(m\) connected boundary components, the choices of isomorphisms form a
\(G^m\)-torsor, and the bulk \(G\) acts freely and diagonally. The relative
cardinality for that extension is \(2^{m-1}\). If a class fails to extend,
the relative fiber is empty. The boundary measure on each class of a
connected boundary is \(1/2\).
[D. S. Freed, *Lectures on Topological Quantum Field Theory*, 9 December 1992, Lecture 2, (18)–(24), printed pp. 15–19](https://ncatlab.org/nlab/files/Freed-TQFTLectures.pdf#page=16).

Write \(V_Y=\operatorname{Fun}(\{0,\lambda\},\mathbb C)\) and \(V_O=\mathbb C\)
in the unit-function coordinate on its singleton. Orientation reversal
uses the dual pairing with these boundary masses. Equivalently, the
Hilbert-space convention uses complex conjugation and the same masses.
All kernels and states used here are real. Integrating a relative
kernel against an incoming function uses the mass of the incoming class.

| Piece | Relative kernel or state with fixed boundary representatives | Induced map |
| --- | --- | --- |
| Identity cylinder on \(Y\) | \(2\delta_{b,a}\) for incoming \(a\) and outgoing \(b\), since an extending class exists just for \(b=a\) and there are two relative identifications | \(Z_{\rm cyl}f(b)=f(b)\) after the incoming \(1/2\) |
| Actual \(T\) | \(v_T(a)=1\) for each \(a=0,\lambda\), from the unique extension and one relative class | State \(v_T=(1,1)\) |
| \(E\) | \(K_E(0,a)=2\delta_{a,0}\) from the unique trivial bulk bundle and two relative identifications when \(a=0\) | \(Z_E(f)(0)=f(0)\) |
| \(K\) | \(K_K(0)=1\) for the sole incoming class | \(Z_K(g)=g(0)/2\) |
| Zero-free \(B\) | \(v_B(0)=1\) for the sole outgoing class | State \(v_B=1\) |

The cylinder kernel uses weight \(2\) on its diagonal because it is a
kernel relative to the mass \(1/2\). The matrix of the cylinder as a
linear operator on the basis of characteristic functions is the identity.
With \(P_\lambda f(a)=\delta_{a,\lambda}f(a)\) the corresponding kernel
is \(2\delta_{b,a}\delta_{a,\lambda}\), so the projected state is
\(P_\lambda v_T=(0,1)\).

The direct check on seam matchings gives the same factors. At the inner
seam, the restrictions of two representatives admit zero isomorphisms
if their classes differ and exactly two if the classes agree. The latter
case occurs only for the two trivial representatives of \(T,E\). Keeping
the identification on \(O\) fixed removes the automorphisms of \(E\), and
the automorphisms of \(T\) act freely and transitively on the two matching
isomorphisms. This leaves one bundle over \(B\) relative to \(O\), of
weight \(1\). At the outer seam, the two trivial restrictions admit two
matching isomorphisms, acted on transitively by the two bulk groups with
diagonal stabilizer \(G\). Simultaneously, the two matchings form a
\(G^2\)-torsor on which \(G^3\) acts by the difference of the adjacent
translations at each seam. The action is transitive with diagonal
stabilizer \(G\), and the glued trivial bundle has weight \(1/2\). The
zero-free ball and cap give the same weight by the single outer seam.

| Input on the same smooth filling | State on \(O\) | Scalar after the prescribed cap |
| --- | ---: | ---: |
| Actual circle, plain gluing | \(1\) | \(1/2\) |
| Actual circle, \(P_\lambda\) gluing | \(0\) | \(0\) |
| Zero-free control, identity insertion | \(1\) | \(1/2\) |

## Frame change and metric continuation

The line-adapted chart is \(\tau_-(s,x)=\tau(s,R_1(-s/2)x)\) and
\(\tau_- = \tau_+\circ H\), where \(H(s,x)=(s,R_1(-s)x)\) fixes the
core and preserves the projection to it. In the minus chart the line
is the \(e_3\)-axis with its sign-flipping seam. In the plus chart the
same actual line is \(R_1(-s)\mathbb R e_3\) over the interval, with
the identical physical orientation cover. In particular
\(H^*\lambda=\lambda\), and \(H^*\) fixes both classes on \(Y\). The finite
action of the frame change is the identity on \(V_Y\). It preserves
automorphism masses, the projector and the weighted gluings.

In the smooth problem the same change rotates the normal coordinates
by a full turn. The coordinate terminal-to-initial spin transitions are
\(-\widetilde R_1(\pi)\) for \(\tau_+\) and \(+\widetilde R_1(\pi)\) for
\(\tau_-\). Pulling the fixed B01 metric, spin structure, connection,
trace identifications and APS projections together conjugates the
E01 gauge-fixed operator and its domain. Its tangential zero modes,
gauge quotient and full transmission therefore describe the same smooth
problem. The augmented linear operator in E01 on the fixed smooth compact
pieces is Fredholm with its specified APS conditions. That result gives
no nonlinear compactness or uniform estimate as the tube shrinks.
The finite model has finite configuration groupoids and discrete local
deformations. Its sole compactness and gluing inputs here are finiteness
and the matching counts. It has no Dirac zero modes, gauge Lie algebra,
or spinor determinant. The \(\mathbb Z/2\) automorphisms counted above
are present on both holonomy classes independently of the smooth constant
\(U(1)\) stabilizer in E01.

The finite state and projection are constant under metric changes with
the marked cut and cover held fixed, by the identity on the finite
groupoids. If a smooth family transports the cut and its line as bundles
over a parameter interval, the identifications transport \(w_1(L^-)\)
by restriction, so the same count holds on all fibers. This gives finite
continuation in the stated decorated category. E01 contains no coupling
from its ordinary monopole fields to the orientation-cover condition.
Neither that calculation nor the finite one supplies a comparison map to
monopole Floer homology. The inner ECH pairing audited in E02 uses
untwisted circles and provides no map for this twisted sector.
[E01 boundary calculation](RETURN_FTI_E01.md) · [E02 relative audit](RETURN_FTI_E02.md).

## Prescribed dilation and disappearance

Set \(\eta=\omega-\omega_{\rm std}\), with support in
\(\{|x|\le 32\sqrt 2\,a\}\). In fixed Cartesian coframes the two powers
from the pullback \(D_{1/t}^*\) cancel the prefactor \(t^2\). Thus
\[
 (\omega_t-\omega_{\rm std})_{ij}(x)=\eta_{ij}(x/t),\qquad 0<t\le1.
\]
Each positive \(t\) has zero circle \(tC\), tube \(tT\), pulled orientation
cover, and unchanged outer germ. This preserves the cohomology and
matching calculation. Explicitly, the positive dilation on the inner
region can be extended to a diffeomorphism of the ball that is the
identity near \(O\). For radial coordinate \(\rho\), choose a smooth
nonincreasing cutoff \(\chi\) equal to \(1\) on an inner ball containing
the original tube and to \(0\) near \(O\). The radius map
\(\rho\mapsto\rho[1-(1-t)\chi(\rho)]\) has positive derivative for \(t>0\).
It identifies the marked cuts while fixing the outer parametrization.

The coefficients and all their derivatives equal the standard ones
eventually on each compact subset away from the origin. In the fixed
Euclidean coefficient norms they converge to the standard coefficients
in \(L^p(B)\) for every \(1\le p<\infty\), since
\(\|\eta(\cdot/t)\|_{L^p}=t^{4/p}\|\eta\|_{L^p}\). At \(x=0\), the modified
inner birth formula instead gives the exact value
\[
 \omega_t(0)=\omega(0)=-\kappa a^2\omega_{\rm std},\qquad t>0.
\]
Thus fixed-point convergence to the stipulated value at the origin
requires \(\kappa=-a^{-2}\). The supplied modification specifies a
constant multiple without its numerical value. Independently of that
pointwise equality, along \(x_t=t(a,0)\) the form vanishes for every
\(t>0\). Since \(\omega_0(0)=\omega_{\rm std}\ne0\), joint continuity at
the event fails, as does \(C^0(B)\) convergence.
The derivative in the fixed \(\operatorname{Re}w\) direction at the
origin is \(-t^{-1}\kappa R\operatorname{Im}(dz\wedge dw)\), from the
linear term \(Rw\) in the complex coefficient of the birth form.
It diverges in norm as \(t\downarrow0\).
[Gerig, arXiv:1905.10938v3, 9 November 2020, Example 1.7, p. 3](https://arxiv.org/pdf/1905.10938#page=3).

With \(V_O\) fixed, \(Z_E(P_\lambda v_T)\) is zero for every positive
\(t\). The prescribed identity at \(t=0\) gives \(1\) on \(O\), or \(1/2\)
after capping. Hence a continuation across the event preserving the
specified output and its zero-free normalization is impossible. Dividing
the capped values by the reference \(1/2\) still gives \(0\) and \(1\).
The failure of smooth convergence precludes interpreting the dilation
as a smooth path through circle disappearance. The two endpoint values
already disprove descent of this particular decorated scalar to the
underlying smooth filling or its prescribed closure. A smooth analytic
continuation would require a degeneration in an admitted smooth field
space together with domains and compactness at the event. A Floer
interpretation would separately require a state, pairing and comparison
map for the twisted cut. This return stops at the frozen finite comparison.
