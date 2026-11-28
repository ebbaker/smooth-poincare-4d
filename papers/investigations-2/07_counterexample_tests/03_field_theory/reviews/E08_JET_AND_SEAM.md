# FTI-E08 · Independent replay of the seam and the zero-circle jet

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance by a separate reader of E01 and E07. The dispatch requested
\(\mathrm{GPT}\)-6.2 Sol at ultra effort. Actual serving variant and effort
are unavailable. Checkout 7c6bbab9a0a6. SHA-256 prefixes are
a3ef43dd5fccb2c5 for [request r1](../research-progress/handoffs/REQUEST_FTI_E08.md),
bd923836031876e2 for [B01](../brainstorm/notes/B01_ACTUAL_CUT.md),
6086097338384f74 for [E01](../research-progress/handoffs/RETURN_FTI_E01.md),
and 6e5ce3af04441dc45 for [E07](../research-progress/handoffs/RETURN_FTI_E07.md).

The E01 kernels, gauge lattice and signed seam agree with the replay.
The E07 jet gives the stated marked line and rules out an identification
with Honda's original germ at every zero point. The qualifications concern
the choice of zero-mode allocation, the gauge framing at the outer end,
and which geometric structures move with a chart. The scope is the two
fixed auxiliary collars and Gerig's specified original first jet.

## Boundary operators and kernels

Use the oriented Riemannian B01 collars, positive spinor chirality and the
spin-induced spin\(^{c}\) structure at the flat zero-spinor reducible.
Let \(u\) increase inward and orient \(Y\) by the outward normal first.
Write \(\alpha=f\,du+b\) with \(f,b\) imaginary and \(b\) tangential.
Since \(\operatorname{vol}_4=-du\wedge\operatorname{vol}_Y\), contraction
with \(\partial_u\) identifies a self-dual two-form with its tangential
one-form component. The inverse takes \(v\) to \(du\wedge v-*_Yv\).
Thus \(2\iota_{\partial_u}d^+\alpha=\partial_u b-d_Y f-*_Yd_Yb\), and
\(-d^*\alpha=\partial_u f-d_Y^*b\). In the resulting product
trivializations the normalized connection operator is
\(\partial_u+B_{\mathrm f}\), where
\[
 B_{\mathrm f}(f,b)=(-d_Y^*b,\,-d_Y f-*_Yd_Yb),
 \qquad B_{\mathrm f}^2(f,b)=(\Delta_0f,\Delta_1b).
\]
Stokes' theorem gives symmetry of the curl block. The mixed terms of the
square vanish by \(d_Y^2=0\) and its adjoint. Both sphere quotients have
simply connected fiber \(S^2\) over \(S^1\), so they are connected and
\(H^1(Y;\mathbb Z)=\mathbb Z[ds/(2\pi)]\). The parallel one-form \(ds\)
descends through both seams. The form kernel is exactly
\(\{(ic,ih\,ds):c,h\in\mathbb R\}\) on each collar.

For \(J=c(\partial_u)\), left multiplication by \(J^{-1}\) in the
product expression for \(D^+\) gives \(\partial_u+B_{\mathrm s}\).
The tangential Clifford action is \(c_Y(v)=-Jc(v)\) on \(S^+|_Y\).
In a parallel-at-a-point tangent frame, the square has connection
Laplacian plus \(\sum_{i<j}c_Y(v_i)c_Y(v_j)R^\nabla(v_i,v_j)\).
Only the sphere plane contributes. For its unit frame \(v_1,v_2\) the
spin curvature is \(-c_Y(v_1)c_Y(v_2)/(2r^2)\), since the tangent
curvature rotates by \(-1/r^2\) and the spin generator has the half-angle
factor. The determinant curvature is zero. Integration on the closed
boundary yields
\[
 \|B_{\mathrm s}\psi\|^2=\|\nabla\psi\|^2+\frac{\|\psi\|^2}{2r^2}.
\]
This argument works on either quotient with its induced spin lift and
gives zero spinor kernel. Both squares are elliptic. On closed \(Y\),
elliptic regularity puts the maximal adjoint domains of the symmetric
tangential operators in \(H^1\). The \(H^1\) domains give self-adjoint
operators with compact resolvent.

## Gauge restrictions and transmission

For the charge-one action the independent \(H^{7/2}(Y,S^1)\) gauge
quotient removes exact tangential forms. The winding gauge \(e^{ins}\)
shifts \(ih\,ds\) by \(-in\,ds\). The harmonic parameter is
\(\mathbb R/\mathbb Z\) and the determinant shift is \(-2in\,ds\).
Coexact tangential data survive. Constants stabilize a connection
representative and act on spinors with weight one. A winding transforms
the flat representative together with the Dirac block. The raw gauge
action on \(f\) uses the inward normal derivative, which is independent
of the boundary value and has order \(H^{5/2}\) for \(H^4\) gauges. The
normal constant in \(\ker B_{\mathrm f}\) is a field trace. For a
boundary-identity infinitesimal gauge, \(\Delta\xi=d^*\alpha\) with
zero Dirichlet trace has a unique \(H^4\) solution for \(\alpha\in H^3\),
by the coercive Dirichlet form and smooth-boundary Laplace regularity.
This fixes the infinitesimal Coulomb gauge without identifying its raw
orbit with an APS domain.

Write \(W=B^4_{64a}=T\cup_Y X\), with \(T\) the tube and
\(\partial X=Y\sqcup O\), \(O=S^3\). In Mayer–Vietoris,
\(H^1(T;\mathbb Z)\to H^1(Y;\mathbb Z)\) is an isomorphism and
\(H^1(W;\mathbb Z)=H^2(W;\mathbb Z)=0\), giving \(H^1(X;\mathbb Z)=0\).
Consequently any mutually extendible seam gauge has degree zero.
Conversely a degree-zero boundary gauge lifts to a real \(H^{7/2}\)
logarithm. Extend that logarithm on both sides with a collar cutoff and
exponentiate. This realizes all such seam values while taking the gauge
to be the identity near \(O\). In this quotient the harmonic parameter
has no integer identification. Gauges fixing both boundary values on
\(X\) have relative components
\(H^1(X,\partial X;\mathbb Z)\simeq\mathbb Z\), from
\(H^0(\partial X;\mathbb Z)/H^0(X;\mathbb Z)\). The corresponding
group on \(T\) has just one component. On \(X\),
\(e^{2\pi inq}\), with \(q\) harmonic and taking values 1 on \(Y\) and
0 on \(O\), represents the \(n\)-th component and preserves the
Coulomb equation. These representatives fix the tangential
connection on each boundary. Their normal derivatives have to be
considered separately if a domain or outer collar is fixed. Fixing
the outer tangential connection permits constant outer gauges.
Fixing the outer gauge to 1 is a framing, which removes the global
constant stabilizer until the full closed gauge group is restored.

At the cut let \(C\) identify traces from the tube with traces on \(X\).
On forms \(C(f,b)=(-f,b)\), and \(*_{Y,X}=-*_{Y,T}\).
On \(S^+\) use the common bundle identification while \(J\) changes
sign. Hence \(C^{-1}B_XC=-B_T\) for \(B=B_{\mathrm f}\oplus B_{\mathrm s}\).
The allowed \(H^{5/2}\) spectral spaces in the single tube
identification are \(B_T<0\) on the tube and \(B_T\ge0\) on \(X\).
In the exterior's inward convention the latter is the nonpositive
space of \(B_X\). It is the generalized APS cut below any sufficiently
small strictly positive threshold. The choice puts both real zero
modes on \(X\). One could instead allow them on the tube, or divide
the zero space into complementary orthogonal summands. Relative to
the complementary split, using the strict negative space of both
inward operators lowers the sum of indices by two real dimensions,
while allowing zero on both raises it by two. At the outer boundary
use its own inward homogeneous spectral cut. A split cap problem
uses its complement, including the omitted zero block.

For the analytic import, the normalized connection symbol has
\(\|\sigma(\zeta)\alpha\|^2=|\zeta|^2|\alpha|^2\). Indeed the
simple two-form \(\zeta\wedge\alpha\) has equal self-dual and
anti-self-dual squared norms for real \(\alpha\), and the symbol
identity extends on complexification. The spin symbol has the same
norm identity by the Clifford relations. In a product collar each
normal symbol is unitary, and both normalized tangential derivative
symbols are skew-Hermitian in the convention with no Fourier \(i\).
Conjugation by the unitary normal symbol gives the corresponding
target property. These verify ellipticity and both parts of boundary
symmetry. Compactness gives completeness and coercivity at infinity
for the operator and formal adjoint in the cited definitions.
The generalized APS subspaces are infinitely regular. The cited
Fredholm result applies with \(H^1\) domain and \(L^2\) target.
For \(H^2\) right-hand sides in the image, boundary regularity
places the solutions in \(H^3\). The image there is the \(H^2\)
intersection with the \(L^2\) image, with finite codimension given
by the adjoint kernel. The adjoint trace uses the Green pairing
with the normal symbol. Self-adjointness of the tangential blocks
is distinct from the adjoint relation between the bulk source and
target domains.
[Bär–Ballmann, arXiv:1101.1196v2, Defs. 1.1, 1.4, Setup 1.5, Thm. 7.17, Ex. 7.27 and Cor. 8.6](https://arxiv.org/pdf/1101.1196)

In a common trivialization, the distributional derivative of a
piecewise \(H^1\) section has an interface delta term
proportional to its trace jump. Full transmission sets this jump
to zero and identifies the domain with global \(H^1\), keeping any
fixed outer condition. For a global \(H^3\) section, the piecewise
sections also match the first and second normal jets. For an
\(H^1\) transmitted solution this higher matching follows from
elliptic regularity with a globally \(H^2\) forcing. The full
transmission space is diagonal before the split. Its intersection
with the complementary split traces has zero seam trace. The
closed capped model meets the stated hypotheses of the splitting
theorem, which equates the complementary split index with the
transmitted index. Full trace gluing recovers the uncut operator
with a retained outer APS condition as well.
[Bär–Ballmann, Ex. 7.28, Cor. 8.8, and Thm. 8.17](https://arxiv.org/pdf/1101.1196#page=57)

## Actual jet, line direction and spin lift

On the B01 tube \(|(z,w)|\le a+r=1.1a<\sqrt2\,a\).
The outer radius \(64a\) exceeds \(32\sqrt2\,a\). The displayed
holomorphic wedge in Gerig's PDF has coefficient
\(Rw-\bar z\bar w\), paired with its negative conjugate in the
antiholomorphic wedge. The original form on the tube is therefore
a nonzero real multiple \(\kappa\) of
\[
 (|z|^2-|w|^2-a^2)\omega_{\mathrm{std}}
   -\operatorname{Im}\big[(Rw-\bar z\bar w)\,dz\wedge dw\big].
\]
[Gerig, arXiv:1905.10938v3, Example 1.7, PDF p. 3](https://arxiv.org/pdf/1905.10938v3#page=3)

Use the Euclidean unit tangent \(T_0=ie^{is}\) and the oriented
ambient frame \((T_0,-e^{is},1_w,i_w)\). For a normal input
\((x_1,w)\), differentiate only the coefficients at \((ae^{is},0)\)
and evaluate the resulting two-form on \(T_0\) and a unit normal
test vector. The standard term contributes \(-2ax_1\) on the first
normal axis. The cross term on a test vector with complex normal
component \(\eta\) is \(-\operatorname{Re}[(Re^{is}w-a\bar w)\eta]\).
Thus, before multiplying by \(\kappa\), the normal endomorphism is
\[
 (x_1,w)\longmapsto (-2ax_1,\,aw-Re^{-is}\bar w).
\]
Writing \(w=e^{-is/2}v\) makes the last block \(av-R\bar v\).
This gives the E07 eigenvalues \(-2a,a-R,a+R\) and the exceptional
line \(R_1(-s/2)\mathbb R e_3\). The derivative vanishes on \(T_0\)
and its image is the Euclidean \(\Lambda^+\), since both real
two-form terms are self-dual and the normal derivative is
invertible. The canonical tangent is
\(-\operatorname{sgn}(\kappa)T_0\), yielding eigenvalues
\(|\kappa|(2a,R-a,-(R+a))\). The last line is Möbius, since its
displayed unit vector changes sign after one period.
[Perutz, arXiv:math/0601320v2, §2.3 and Prop. 2.2](https://arxiv.org/pdf/math/0601320v2#page=6)

Use the active convention \(R_1(\theta)e_2=\cos\theta\,e_2+
\sin\theta\,e_3\). Both \(\tau_\pm(s,x)=\tau(s,R_1(\pm s/2)x)\)
descend through the Honda end identification \(A=R_1(\pi)\).
\(\tau_-\) carries \(\mathbb R e_3\) to the actual unoriented line.
If the canonical orientation of the base circle is also marked
and \(\kappa>0\), compose \(\tau_-\) with
\((s,x)\mapsto(-s,\operatorname{diag}(-1,1,1)x)\). The reflection
commutes with \(A\) and covers the tangent reversal while
preserving ambient orientation and the line.
[Honda, revised 13 January 2004, Prop. 5 and Thm. 6](https://www.math.ucla.edu/~honda/moser.pdf#page=5)

The periodic \(\tau\)-frame rotates once in the \(z\)-plane, giving
the spin seam sign \(-1\) in the identity chart. In the twisted
charts multiplication by the lifted normal rotation gives the
terminal-to-initial transitions
\[
 g_\pm=-\exp(\pm\pi e_2e_3/2),\qquad
 g_-=+\exp(\pi e_2e_3/2),\quad g_+=-\exp(\pi e_2e_3/2).
\]
This uses \(e_j^2=-1\), the lift from the identity, and increasing
\(s\). Inverse transitions express the opposite traversal. The
spin-induced spin\(^{c}\) seam does not insert a separate sign in
the charge-one gauge factor.

## Frame transport and geometry

For a passive chart change, transport the metric, spin structure,
flat background, source and target trace identifications, and
projections. Pullback then intertwines the operators and conjugates
the spectral projections. In the smooth trivialization
\(y=R_1(s/2)x\) of the twisted quotient the transported product
quotient metric has sphere term \(g_{S^2_r}(dy-V\,ds,dy-V\,ds)\),
where \(V\) generates \(R_1(s/2)\). The frozen identity and twisted
product quotient metrics are geometrically different. Their
Ricci-null lines are parallel, and unit-speed orbits have period
\(2\pi\) in the identity metric, compared with \(4\pi\) off the
rotation poles in the twisted metric.

There is a separate restriction on an active change with the
ambient spin structure fixed. The relation
\(\tau_-=\tau_+\circ H\) has \(H(s,x)=(s,R_1(-s)x)\).
Along the boundary longitude at the \(e_1\) pole this map fixes the
points and its differential rotates the tangent two-plane by
\(-s\). In a periodic frame this loop changes the spin sign, so
the active boundary map switches the two spin structures on
\(Y\). Mayer–Vietoris with \(\mathbb F_2\) coefficients gives
\(H^1(X;\mathbb F_2)=0\) by the same restriction isomorphism as
over \(\mathbb Z\). An oriented diffeomorphism of \(X\) would
preserve its unique spin structure and its boundary restriction.
Thus this particular active map cannot extend to the fixed
exterior as an oriented diffeomorphism. This places no restriction
on the passive relabelling with transported data.

## Obstruction at a single zero

The Honda endomorphism in either model is
\(\operatorname{diag}(1,1,-2)\). The ratio of larger to smaller
positive eigenvalue is 1. In the fixed Gerig range \(R>3a\) it is
\((R-a)/(2a)>1\), at every zero. Suppose a \(C^1\) map germ
\(F\) from one zero point to the other relates the forms by
\(\omega_{\mathrm G}=\lambda F^*\omega_{\mathrm H}\) with
\(\lambda\) continuous and nonzero at the zero. The first-order
expansion uses \(A_0=DF\) at the zero and
\(D\omega_{\mathrm G}(h)=\lambda A_0^*(D\omega_{\mathrm H}(A_0h))\)
there. Derivatives of metric or scalar factors are unnecessary
because the two-forms vanish at the points. The image is a
positive three-plane for the wedge pairing. A singular \(A_0\)
would produce two-forms supported on at most three covector
directions, with zero wedge square. An orientation-reversing
\(A_0\) would make their wedge squares negative. Hence \(A_0\)
is invertible and oriented, and it pulls the target
\(\Lambda^+\) onto the source \(\Lambda^+\).

In oriented singular-vector frames, preserving \(\Lambda^+\)
requires the product of the scale factors in each coordinate
two-plane to equal the product in its complementary two-plane.
The four positive singular values are therefore equal. Writing
\(A_0=cQ\) with \(Q\) orthogonal, the derivative identity sends
the kernel tangent line by \(Q\) to the kernel tangent line, so
\(Q\) also identifies the Euclidean normal spaces. The normal
operator uses three vector slots in the derivative, giving
\(c^3\) and orthogonal conjugation. The canonical tangent absorbs the sign of
\(\lambda\), giving a common factor \(|\lambda|c^3\).
This preserves the two-positive-eigenvalue ratio and gives a
contradiction at a single zero, even if the chart reverses the
circle parameter or the scalar factor varies. Pullback equality
on the punctured germ has the same implication if the coordinate
map and rescaling extend with this regularity.

Honda's Theorem 7 is a deformation of closed forms from a
generic self-dual harmonic form in the paper's closed oriented
setting, with the common zero set and symplectic complement.
Its local Moser maps are smooth away from the zeros. Perutz
§3 footnote 1 records a same-parity equivalence with only
Lipschitz regularity in general at the zero circle. The jet
obstruction concerns the original forms and the indicated
regularity. It is compatible with deforming the jet or with
an equivalence that loses differentiability at the circle.
[Honda, Thm. 7, pp. 6–7](https://www.math.ucla.edu/~honda/moser.pdf#page=6) ·
[Perutz, §3, footnote 1](https://arxiv.org/pdf/math/0601320v2#page=7)
