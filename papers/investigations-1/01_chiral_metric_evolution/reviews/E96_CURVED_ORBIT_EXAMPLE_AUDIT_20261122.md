# SP4-CME-E96 — Independent audit of the actual curved-orbit derivative example

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I did not author E95
or its four frozen notes E79, E53, E91 and E94. I previously
audited E79 and E91 in E80 and E92, respectively, and authored
related E71, E66 and E82 inputs. The requested E95 note and all
four inherited frozen digests matched before use. No primary
source was newly inspected or imported. [Request][req] ·
[E95 request][e95req] · [B56][b56] · [Return][ret].

**Disposition.** E95 passes on the actual round chiral bundle.
The chosen E79 horizontal output fails \(C^1\) continuity in
the stated joint critical topology, with varying forcing.
The auxiliary finite flow has the asserted bounded-time
\(C^1\) convergence, and the original Fine trajectories are
stationary. No correction was found. [E95][e95].

## Base construction and the global lift

The fixed nested cubes \(Q_j=(-jd,jd)^4\) have
\(\overline{Q_3}\) strictly inside the chart image.
The field \(V_n=\delta_n\rho(x)\sin(nx^1)e_2\),
\(\delta_n=\epsilon_n/n\), is compactly supported
in \(Q_3\). Its zero extension is smooth on \(S^4\).
The flow exists for all time on the compact base.
The complement of the support is fixed by uniqueness.
Since each time map is invertible, points from the
chart cannot flow into its fixed complement. Thus the
chart is invariant and the flow agrees there with
the coordinate compactly supported flow.

Only \(x^2\) changes. Its displacement for \(|t|\le1\)
is at most \(\delta_n\), so a trajectory from \(Q_1\)
stays in \(Q_2\) once \(\delta_n<d\).
There \(\rho=1\) and \(x^1\) is constant in time.
Integration gives exactly
\[
 \psi_{n,t}(x)=x+t\delta_n\sin(nx^1)e_2,\qquad x\in Q_1 .
\]
Time one and minus one therefore have the asserted
opposite inner shears. Throughout the chart the field
derivatives satisfy the bounds
\(C\delta_n,C\epsilon_n,Cn\epsilon_n\)
at orders \(0,1,2\), because all cutoff derivatives
are fixed. The first variational equation gives the
uniform derivative bound and \(O(\epsilon_n)\) error
from the identity. The second variational equation
has homogeneous coefficient \(DV_n\) and forcing
\(D^2V_n[D\psi_{n,t},D\psi_{n,t}]\), with initial
second derivative zero. Thus its sup norm is
\(O(n\epsilon_n)\) on the same time interval. Applying
the equations to the negated field proves the
negative-time estimates. At
\(x_n=(\pi/(2n),0,0,0)\in Q_1\) the axial second
derivative of either inner time-one shear, with its
appropriate sign, has magnitude \(n\epsilon_n\).
This verifies the two-sided second-order estimate
along with the \(O(\delta_n)\) displacement and
\(O(\epsilon_n)\) first-order error. Fixed smooth
chart changes add only bounded operations and the
lower derivative orders in these comparisons.
[E95 (1)–(2)][e95].

In the selected principal section coordinates
\(p=\sigma(x)h\), the bundle map
\(G_n(p)=\sigma(\psi_n(x))h\) satisfies
\(G_n(pk)=G_n(p)k\) for every \(k\in SO(3)\).
Since \(\psi_n\) fixes a chart collar, this map is
literally the identity there on every group fiber.
It therefore glues with the identity on the
complement of the support, independently of
principal transition functions. The inverse has
the same formula with \(\psi_n^{-1}\) and glues
on the same collar. The base flow is connected
to identity and preserves orientation. This is
a smooth equivariant automorphism of the given
nontrivial bundle. Its group coordinate is fixed
in these local charts, so the map and inverse
derivative bounds, including the inner-chart
lower bound, carry to fixed global bundle-chart
comparisons. [E95, lift and map estimates][e95].

## Actual curvature and convergence of both input pairs

Set \(A_n=G_n^*A_0\). Exterior differentiation and
bracket commute with this actual pullback on
principal forms, giving \(F_{A_n}=G_n^*F_0\).
Thus the curvature difference is compatible with
the connection difference, including the actual
connection bracket. On a fixed internal frame
coming from \(\sigma\), the local potential is
also the base pullback of the reference potential:
\(G_n\circ\sigma=\sigma\circ\psi_n\).
For \(r_n=G_n^* r_0\), the corresponding exact
covariant exterior derivative relation is
\[
 d_{A_n}r_n=G_n^*(d_0 r_0).
\]
For example in the chosen frame it follows by
pulling back the ordinary exterior derivative and
the bracket with the pulled-back local potential.
In particular no further derivative of the map
has to be estimated in the value of \(d_{A_n}r_n\).
Thus all four differences in E95 (4) come from
pullback of a fixed smooth local form of degree
one or two. [E95 (3)–(4)][e95].

In the frame where the group coordinate is fixed,
the pullback of such a coefficient array \(W\)
is \(W(\psi_n)(D\psi_n)^{\otimes k}\).
Subtracting \(W\) uses the fixed first derivative
of \(W\), \(O(\delta_n)\) displacement, and
\(O(\epsilon_n)\) difference of the tensor product
of the pullback slots from the identity.
Hence all four differences have value
\(O(\epsilon_n)\). In the spatial derivative,
the terms where the derivative lands on \(W\)
give \(O(\delta_n+\epsilon_n)\) after subtraction,
using fixed derivatives of \(W\) through order
two. A derivative of a pullback slot uses one
\(D^2\psi_n\) and therefore costs
\(O(n\epsilon_n)\). On overlaps the tensor
frame and coordinate factors are fixed and
differentiating them costs the value difference.
The affine connection frame terms cancel for
\(a_n=A_n-A_0\), so it obeys the same fixed
tensor estimates. Replacing an ordinary
derivative by the fixed \(D_0\) only adds a
fixed multiple of the value error. [E95 (2), (4)][e95].

For a supported coordinate piece \(v\) on the
unit torus, put \(a=\|v\|_8\), \(b=\|\partial v\|_8\).
The E53 bounded block kernel and inverse
derivative kernel give
\(\|\Delta_jv\|_8\le C\min(a,2^{-j}b)\) for \(j\ge1\).
The low block costs \(Ca\). For \(a>0\) use
\(R=(a+b)/a\). The portion of the
\(2^{j/2}\)-weighted sum with \(2^j\le R\)
costs \(Ca R^{1/2}\), and the high portion
costs \(Cb R^{-1/2}\), both bounded by
\(C\sqrt{a(a+b)}\).
The zero case is trivial.
When the fixed partition is applied to the
four differences, cutoff derivatives add only
\(O(\epsilon_n)\), and chart and frame derivatives
are controlled as above. The supports remain
interior, so extension by zero produces no seam
derivative. The localized estimate is therefore
\(O(\epsilon_n\sqrt n)=O(n^{-1/4})\)
for both
\[
   (A_n-A_0,F_{A_n}-F_0),\qquad
   (r_n-r_0,d_{A_n}r_n-d_0r_0)
\]
in the fixed \(\mathcal B^{1/2}\) norms.
In particular the coefficient values are inside
the E79 tube for all large \(n\).
[E95 (5) and critical convergence][e95] ·
[E53, periodized block and inverse derivative][e53].

The forcing is genuinely varying. At the chart origin
\(\psi_n(0)=0\) and
\(D\psi_n(0)=I+\epsilon_n e_2\otimes dx^1\).
There \(r_n-r_0=\epsilon_n\,F_0(e_1,e_2)\,dx^1\)
in the fixed frame. The internal vector is nonzero:
the perfect triple spans the positive self-dual plane,
and a nonzero simple two-plane has a nonzero
self-dual projection in a positive Riemannian
metric. Thus the convergence above is joint,
with the specified transported \(r_n\).
This check does not import the fixed forcing
from the periodic model.
[E95, prescribed forcing and scope][e95] ·
[E91, distinct frozen model][e91].

## Exact selected solution and fixed global derivative growth

With \(u_n=\psi_n^*u_0=(D\psi_n)^{-1}(u_0\circ\psi_n)\),
contraction naturality gives
\[
           S_{A_n}u_n=\iota_{u_n}G_n^*F_0
                    =G_n^*(\iota_{u_0}F_0)=r_n .
\]
The fixed E79 fiber projection kills this flux
because \(\Pi_{A_n}S_{A_n}=0\).
Thus the full weak vertical right side is zero.
E79's unique restricted solution on the
\(L^2\)-orthogonal complement of its fixed kernel
\(N\) is exactly \(\phi_n=0\).
Since \(H_{A_n}S_{A_n}=I\), its horizontal parameter
is \(u_n\), and the residual is exactly zero.
At the reference these formulas give
\((0,u_0,0)\). The conclusion follows from the actual
curvature-contraction identity and the assessed fixed
normalization. [E95, exact output][e95] · [E79 (1), (5)–(9)][e79].

On \(Q_1\), the sheared image is in \(Q_2\);
\(u_0=e_1\) there. The nilpotent rank-one part of
\(D\psi_n=I+\epsilon_n\cos(nx^1)e_2\otimes dx^1\)
therefore gives
\(u_n=e_1-\epsilon_n\cos(nx^1)e_2\).
At the point \(x_n\) used above,
\(u_n-u_0=0\) and its ordinary axial derivative
is \(n\epsilon_n e_2\).
The fixed Levi–Civita correction for the derivative
of the difference vanishes at a zero of the difference,
so this is also its covariant axial derivative there.
The norm of \(\partial_{x^1}\) and the norm of \(e_2\)
are bounded above and below on the fixed compact
chart. Thus a fixed global \(C^1\) norm detects a
lower bound \(c n\epsilon_n\).
For the upper bound differentiate the value
formula for vector pullback. The derivative of
the inverse \(D\psi_n\) matrix is bounded by
\(C\|D^2\psi_n\|_\infty\), since the pointwise matrix
inverse \((D\psi_n)^{-1}\) is uniformly bounded.
The derivatives of \(u_0\) are fixed.
This gives \(O(n\epsilon_n)\) in \(C^1\)
and \(O(\epsilon_n)\) in \(C^0\) for the difference.
The full output also has unbounded \(C^1\) norm
by subtraction of the fixed \(u_0\).
Thus the selected horizontal map fails \(C^1\)
continuity at \((A_0,r_0)\) in the joint
critical topology of the two pairs above.
The result is a property of this solver and this
varying-forcing sequence. [E95 (6) and scope][e95].

## Perfectness, auxiliary finite maps and original flow

The orientation-preserving base pullback and the
internal isometry transport the normalized wedge
Gram by conjugation. Since the reference
endomorphism is \(I\), every \(A_n\) has \(Q=I\);
the native live metric is \(\psi_n^*g_0\).
The covariant derivative of \(I\) vanishes, so
\(T(A_n)=0\).
In the native original equation the curvature
polynomial is \(2I\) at \(Q=I\). The velocity
\(-2d_{A_n}^*F_{A_n}\) vanishes because the
curvature is self-dual for the reconstructed
metric and satisfies Bianchi. Thus the original
Fine trajectories from these perfect data are
stationary. [E95, perfectness and original flow][e95].

For the auxiliary vector fields on the total space,
let \(Y_0=\chi_{A_0}(u_0)\),
\(Y_n=\chi_{A_n}(u_n)\).
The field \(G_n^*Y_0=(DG_n)^{-1}Y_0\circ G_n\)
projects to \(u_n\), since \(G_n\) covers
\(\psi_n\). Its connection component for \(A_n\)
is \(A_0(Y_0)\circ G_n=0\), since
\(A_n=G_n^*A_0\).
Horizontality and the specified base projection
give equality to \(Y_n\). The fields on \(P\)
are smooth and equivariant and the total space
is compact, so their flows are complete and
equivariant by uniqueness.
The flow \(\Theta_{n,t}\) and its inverse are
\[
  G_n^{-1}\circ\Theta_{0,t}\circ G_n,
  \qquad
  G_n^{-1}\circ\Theta_{0,-t}\circ G_n .
\]
Differentiation in time gives the pulled-back
vector field and the correct identity initial
condition. The second formula follows from
autonomous flow inversion. This is the actual
bundle horizontal lift, while E94 is its
separate frozen precedent. [E95 (7)][e95] ·
[E94, frozen conjugacy][e94].

Fix any \(T<\infty\).
Choose common chart pairs with margins on the
compact reference time-space family
\([-T,T]\times P\). The small displacements of
\(G_n^{\pm1}\) place the compositions in those
charts for all large \(n\).
The reference maps have bounded first and
second spatial derivatives on this family.
The two displacement errors and the reference
Lipschitz bound give \(O_T(\delta_n)\)
position error. For the derivative,
\[
 DG_n^{-1}(\Theta_{0,t}(G_n p))\,
 D\Theta_{0,t}(G_n p)\,DG_n(p)
\]
has outer factors equal to identity plus
\(O(\epsilon_n)\) in the chosen charts.
The middle factor differs from
\(D\Theta_{0,t}(p)\) by \(O_T(\delta_n)\),
using the fixed second spatial derivative on the
reference maps. Thus the whole coordinate
derivative error is \(O_T(\epsilon_n)\).
The same argument with \(t\) replaced by
\(-t\) proves the inverse-map estimate on the
same bounded interval. No second derivative
of \(G_n\) is needed for this comparison.
The auxiliary flow comparison is separate from
the stationary gradient evolution.
[E95, bounded-time derivative comparison][e95].

This verifies derivative growth and bounded-time
finite transport for an actual family on the
round orbit. The explicit \(G_n\) already maps
the reference to the family by pullback. The
example gives no failure of finite slice
placement, other right inverses, or general
nonlinear critical formulations.

[req]: ../research-progress/handoffs/SP4-CME-E96_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E96_RETURN_v1.md
[e95req]: ../research-progress/handoffs/SP4-CME-E95_REQUEST_v1.md
[b56]: ../brainstorm/notes/B56_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md
[e95]: ../notes/95_CURVED_ORBIT_DERIVATIVE_TEST_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e91]: ../notes/91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md
[e94]: ../notes/94_FROZEN_FINITE_FLOW_CANCELLATION_20261122.md
