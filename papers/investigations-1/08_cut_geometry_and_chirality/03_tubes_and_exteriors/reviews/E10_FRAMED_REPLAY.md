# E10 · Framed connection budget replay

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
The actual helper model and effort are unavailable. This is the bounded
analytical [E10 request R1](../research-progress/handoffs/E10_REQUEST_R1.md).
The checkout is \(\texttt{bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0}\).
The working [budget note](../notes/FRAMED_CONNECTION_BUDGET.md) has Git
blob prefix \(\texttt{62452cf3d5c3}\). The inspected 07 inputs are the
[curvature note](../../../07_positive_subcritical_entry/notes/CONNECTION_CURVATURE.md)
(\(\texttt{ccfc751f1857}\)) and
[marked assembly](../../../07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md)
(\(\texttt{59c3993e018e}\)). All curvature calculations use the real
Hilbert–Schmidt operator norm on two-forms on a smooth oriented
Riemannian four-manifold.

## Curvature replay and full nonabelian functional

For a round-sphere connection metric with a base-dependent positive
radius, conformal division by its squared radius normalizes the fiber
metric to the unit round metric and changes the base metric to \(q\).
Each chiral energy density times volume is conformally invariant. The
rest of the calculation takes place in that representative. Write
\(b=*_{q}F_A\) in the unit angular-speed identification
\(\mathfrak{so}(3)=\mathbb R^3\). At the fiber point \(p\), put
\(C=b\times p\), \(h=b\cdot p\), \(c=|C|^2\). Use the orientation from
horizontal basis \(e_1,e_2\) followed by the oriented fiber frame
\(e_3,e_4=p\times e_3\).

The vertical part of the bracket of the two basic horizontal lifts is
\(-C\). Koszul gives the vertical part of \(\nabla_1 e_2\) as \(-C/2\)
and the horizontal parts of \(\nabla_U e_1,\nabla_U e_2\) as
\(\langle C,U\rangle e_2/2,-\langle C,U\rangle e_1/2\). The latter
derivatives have zero vertical part because the fibers are totally
geodesic. Thus the three types of sectional curvature are
\(K-3c/4,\ 1,\ \langle C,U\rangle^2/4\), giving scalar curvature
\(2(K+1)-c/2\). The oriented normal connection along a fiber has
connection one-form \(C^\flat/2\) and curvature \(h\,dA_{S^2}\), since
\(\nabla^S_U C=h\,p\times U\). With the convention
\(\mathcal R_{ij,kl}=\langle R(e_i,e_j)e_l,e_k\rangle\), this gives
\(\mathcal R_{12,34}=-h\). The corresponding axial Weyl diagonal is
\[
 d_\pm=\tfrac12(K+1-3c/4)\mp h-\tfrac1{12}(2(K+1)-c/2)
       =(K+1-c)/3\mp h .
\]
The remaining two diagonals equal \(-d_\pm/2\). The
\(3/2\) factor for the squared Hilbert–Schmidt norm of those three
diagonals also follows from tracelessness alone.

The full density can be recovered without imposing a circle action.
Let \(D_i b\) be the two base covariant derivatives and put
\(C_{i\alpha}=\langle (D_i b)\times p,e_\alpha\rangle\),
\(\alpha=3,4\). Choose a geodesic frame for \(q\) and a connection
trivialization with \(A=0\) at the base point. The vertical part of
\(R(e_1,e_2)e_i\) is then \((D_i b)\times p/2\) by differentiating the
vertical terms of \(\nabla_2e_1,\nabla_1e_2\), respectively. The
vertical bracket term in this curvature is horizontal and the base
curvature terms are horizontal. Thus
\(\mathcal R_{12,i\alpha}=-C_{i\alpha}/2\).
Entries with three vertical indices and one horizontal vanish by
total geodesy and curvature symmetries. Finally the
transverse chiral off-diagonal vanishes. In its compression the terms
\(\mathcal R_{13,14}\) and \(\mathcal R_{24,23}\) cancel, both equaling
\(\langle C,e_3\rangle\langle C,e_4\rangle/4\) by polarizing the mixed
sectional curvature. The other two terms
\(\mathcal R_{13,23}\) and \(\mathcal R_{24,14}\) vanish because the
cross-mixed curvature is proportional to
\(\langle p\times U,V\rangle\), as in 07.

In the chiral basis
\((12\pm34,13\mp24,14\pm23)/\sqrt2\) the two independent
off-diagonal entries are therefore
\(-(C_{13}\mp C_{24})/4\) and \(-(C_{14}\pm C_{23})/4\).
Their total contribution to the squared norm includes a factor two
for their transposes. The product difference
\(C_{13}C_{24}-C_{14}C_{23}=p\cdot(D_1 b\times D_2 b)\) averages to zero.
Since the fiber mean of \(|v\times p|^2\) is \(2|v|^2/3\), the mean
off-diagonal contribution is \(|D_A b|^2/12\).

For \(z=|b|^2\), the means of \(c,c^2,h^2\) are
\(2z/3,8z^2/15,z/3\); the cross term of \(h\) with \(K+1-c\) is odd.
The volume factor is \(4\pi\) on the fiber and \(2\pi\,d\mu\)
on the base. Consequently the signwise result, including derivatives,
is the identity
\[
\frac{E_\pm}{\pi^2}
=\int \left[
 \tfrac43(K+1-\tfrac23 z)^2+4z+\tfrac{16}{135}z^2
 +\tfrac23|D_A b|^2
\right]\,d\mu .
\tag{1}
\]
This recovers the circle formula with \(z=F^2\) and
\(|D_A b|^2=F_s^2\). It also supplies a direct check of the signwise
integration. The antipodal map \(p\mapsto-p\) is a global
orientation-reversing isometry of the normalized cap, because it
commutes with rotations and carries horizontal lifts to horizontal
lifts. Thus the integrated chiral energies agree independently of the
formula. Their equality persists under conformal change.

Writing \(D=\int K\,d\mu=1-(2\pi)^{-1}\int_{\partial D}k_q\,d\ell_q\)
with disk Gauss–Bonnet orientation, completion in (1) gives
\[
\frac{E_\pm}{\pi^2}
=\frac{16}{3}D+\int\left[
 \tfrac43(K-1-\tfrac23 z)^2+\tfrac49 z+\tfrac{16}{135}z^2
 +\tfrac23|D_A b|^2\right]\,d\mu .
\]
The basic lower bound and its equality conditions \(b=0,\ K=1\) are
verified. The equality conclusion \(a=\sin s\) presupposes the circle
ansatz and its smooth pole. In general the normalized base can be an
arbitrary smooth spherical disk with \(K=1\).

## Lift, marked holonomy and the area estimate

An oriented rank-three bundle over a disk is trivial. A smooth boundary
framing of a given trivialization extends precisely when its transition
loop in \(SO(3)\) is null-homotopic. To see the parity directly, lift the
loop to the unit quaternions. A loop lifts closed exactly when it has
trivial class in the two-sheeted covering, in which case the closed
lift is contractible in \(S^3\). Smooth extension can be made constant
on a radial collar in a null-homotopy. Thus an odd loop can give a
different prescribed boundary marking, and it cannot be used as a
disk-extending gauge change. Disk-extending changes conjugate the
lifted boundary holonomy and preserve its distance to the identity.

Use any polar coordinates on the disk and trivialize by radial parallel
transport, so \(A_r=0\). If \(g_r(\varphi)\) is the \(SU(2)\) transport
solving \(\partial_\varphi g_r=-A_\varphi g_r\) with
\(g_r(0)=1\), differentiation gives
\[
\partial_\varphi(g_r^{-1}\partial_r g_r)
 =-g_r^{-1}(\partial_r A_\varphi)g_r,
\qquad \partial_r A_\varphi=F_{r\varphi}.
\]
The norm of the translated derivative of \(h(r)=g_r(2\pi)\) is at most
\(\int |F_{r\varphi}|\,d\varphi\). Its integral in \(r\) is
\(\int |b|\,dA_q\), since \(F_A=b\,dA_q\). The loops shrink to a
point at the center, so \(d(1,h)\le\int|b|\,dA_q\) for the boundary
lift \(h\). Use \(U=\int d\mu\), \(\delta=d(1,h)/(2\pi)\). Then
\(\int z\,d\mu\ge\delta^2/U\) and
\(\int z^2\,d\mu\ge\delta^4/U^3\).

The unit quaternions with their radius-one round metric act on
imaginary quaternions by conjugation, and the differential doubles the
rotation angle. The pulled back angle metric on \(SU(2)\) is thus round
of radius two. A coefficient \(\beta J\,d\psi\) with \(\psi\) of
period \(2\pi\), \(|J|=1\), produces the lift
\(\exp(\pm\pi\beta k)\) in a disk-extending framing, for a unit imaginary
axis \(k\). Therefore \(\delta=\min_{n\in\mathbb Z}|\beta-2n|\).
Replacing the boundary marking by an odd rotation loop interchanges the
two candidate lifted endpoints up to conjugacy. Neither changing the
base point of transport nor using a disk-extending gauge has this
effect.

For \(0\le\lambda\le16/3\), apply
\((4/3)x^2\ge \lambda x-3\lambda^2/16\) to
\(x=K+1-2z/3\). Put
\(\alpha=\lambda-3\lambda^2/16\) and
\(\gamma=4-2\lambda/3\), both nonnegative in the stated range. This
gives \(\lambda D+\alpha U+\gamma\delta^2/U\), and the arithmetic–
geometric mean gives \(\lambda D+2\delta\sqrt{\alpha\gamma}\).
Retaining the quartic adds the term \((16/135)\delta^4/U^3\) in the
area-dependent bound. No scalar-curvature condition is used.

The proposed example has \(f=-(\ell/2\pi)\cot\theta=-47/100\), hence
\(D=1-f=147/100\). With \(\lambda=26/5\), one has
\(\alpha=13/100,\gamma=8/15,\lambda D=1911/250\).
For \(\beta=-3/4\), the bound is
\(1911/250+(3/2)\sqrt{26/375}>8\) exactly, since
\[
\left(\tfrac32\sqrt{26/375}\right)^2-\left(8-1911/250\right)^2
=\frac{1829}{62500}>0 .
\]
For \(\beta=1/4\) the same correction is one third as large and its
square is \(13/750<(89/250)^2\). This verifies the example and the
distinction between the two markings of the same principal \(SO(3)\)
angle. The smaller lower bound does not establish admissibility on a
closed exterior. Throughout, the estimate is conditional on the
specified normalized base boundary curvature and marked connection
germ being the ones to be filled.

## Exterior topology and limits of the three branches

For the [Fuchsian compactification in the master manuscript](../../../../master/manuscript/claude/umbilic_doubling.tex),
round the corners of the boundary of an oriented rank-three disk
bundle over a compact connected orientable surface \(F\) with
nonempty boundary. The horizontal sphere bundle has fundamental group
\(\pi_1(F)\), since its fiber \(S^2\) is simply connected. Along each
boundary component its intersection with the vertical disk bundle is
an \(S^2\)-bundle over that boundary circle. Projection identifies the
fundamental groups of this intersection and the vertical disk bundle,
and the inclusion from the intersection induces this isomorphism.
Attaching the vertical pieces therefore leaves \(\pi_1(F)\)
unchanged by van Kampen. Deleting a circle leaves \(\pi_1\) unchanged,
since loops and spanning homotopies can be made disjoint from a
codimension-three submanifold. Removing an open tubular neighborhood gives
the same group. The \(D^2\times S^2\) cap kills the normal closure of a
single peripheral loop. The resulting abelianization is
\(\mathbb Z^{2g+b-1}/\langle v\rangle\), for one vector \(v\).
Vanishing requires rank at most one, so a representation of this
entire exterior cannot have nonabelian image in a homotopy-sphere
one-surgery closing of this model. For any general exterior with a
homotopy-sphere filling by this cap, the peripheral loop still
normally generates its group. Ordinary \(SO(3)\) meridian holonomy
equal to the identity therefore makes a representation of that
entire exterior trivial, even when its lifted cap holonomy can
record a nontrivial parity.

This obstruction does not remove the nonabelian representation
possibility for general exterior groups. For example, the inversion
mapping torus with \(\Gamma=C_m\) and odd \(m>1\) from
[E05](../notes/E05_TWISTED_EXTERIORS.md) has a dihedral rotation group
representation \(C_m\rtimes\mathbb Z\to C_m\rtimes C_2\subset SO(3)\).
It sends the stable letter to a half-turn and the cyclic kernel
generator to rotation about the perpendicular axis. Killing the
stable letter gives \(C_m/\langle g^2\rangle=1\). This verifies the
scope of the group obstruction. It neither produces a geometric
round-sphere connection on that exterior nor an unrecognized smooth
closing.

The three T3 subclasses in parent Problem 5 describe directions within
one-tube research, and no exhaustive metric normal form follows from
the one-tube topology or from umbilicity. A general \(S^2\times D^2\)
metric may lack a round-fiber conformal representative in the
prescribed fibration. An arbitrary exterior may have no geometrically
distinguished \(SO(3)\) holonomy representation at all. Positive
exterior energy covers such exteriors if \(e_X>0\), but the tested
positive-double stability argument concerns the particular marked
range in [E05](../notes/E05_TWISTED_EXTERIORS.md). At \(e_X=0\) the
classification in [E03](../notes/E03_EQUALITY.md) uses positivity of
the reflected double. The cases where that positivity fails, where
the seam is nonumbilic, or where a sweepout seam has no round-fiber
germ are outside those reductions. For the projective-plane class the
worked [cap estimate](../notes/PROJECTIVE_CAP.md) concerns the biaxial
path with the elongated axis agreeing with the collapsing disk axis.
An eta-admissible boundary does not force the interior metric or
that axis convention. The three tests do not imply an obstruction to
every arbitrary one-tube entry class.

## Further tests for an obstruction

There is a direct obstruction for more boundary data than the lifted
flux test uses. Any cap in the full round-fiber ansatz has equal signed
energies, as above. If it closes to an oriented homotopy sphere,
additivity and equality of the closed energies imply
\(E_+(X)=E_-(X)\). For an umbilic seam with rational-circle exterior,
\(\tau(X)=0\) and the
[parent chirality ledger](../../manuscript/cuts_of_subcritical_conformal_classes.tex)
then requires \(\eta(\Sigma)=0\). The cap's own signature is zero,
since its core has trivial normal bundle, and its umbilic seam gives
the same conclusion by the ledger. This can also be seen on the
normalized seam, where the fiber antipodal is an orientation-reversing
isometry. A seam with \(\eta\ne0\) therefore excludes this cap class
even inside the wall allowed by the ambient eta test.

Equation (1) retains a derivative estimate for flat connection germs.
When \(b=0\) at the boundary, metric compatibility gives
\(|\nabla |b||\le|D_A b|\) almost everywhere. For the first Dirichlet
eigenvalue \(\lambda_1(q)\) on the normalized base,
\(\int|D_A b|^2\,d\mu\ge\lambda_1(q)\delta^2/U\).
Thus the same area-dependent budget adds
\((2/3)\lambda_1(q)\delta^2/U\) as well as the quartic term. This
applies to a specified base or family with a verified scale-invariant
spectral lower bound. Prescribing a collar alone allows a narrow
interior neck, so a uniform lower bound over the competing class
would require an additional geometric estimate. Deriving it on a
subcritical energy sublevel is a concrete extension of the framed
connection argument. Its conclusion would still require the
round-fiber ansatz.

Outside that ansatz, a separate recognition route would ask whether a
closed one-form in the nonzero reflected cohomology class on
\(\mathcal D(X)\) can be made nowhere zero, reflection invariant and
periodic in its marked return map on a half. A nowhere-zero integral
form would give a circle fibration by integrating it. Reflection
invariance makes the restriction tangent in the dual direction at
the seam, so the fibration restricts to the half. In the presence of
a periodic return map the explicit closing action is the one in E05.
The existing absolute energy and positive Yamabe sign do not yield
nonvanishing or periodicity. The collapsing exteriors in E05 are a
test for any proposed quantitative input. This is an alternative
geometric target for the unrestricted marked exterior question, not
a conclusion from the cap budget.
