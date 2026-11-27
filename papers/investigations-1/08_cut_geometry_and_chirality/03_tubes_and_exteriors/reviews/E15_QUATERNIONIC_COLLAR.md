# SP4-CUT-TUBE-E15 · Quaternionic collar and short-axis cap replay

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual model and reasoning effort are unavailable. [Frozen E15
request](../research-progress/handoffs/E15_REQUEST_R1.md), checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Read the completed
[short-axis construction](../notes/E14_SHORT_AXIS.md), SHA-256 beginning
e65d73c53a797988, and [collar obstruction](../notes/PROJECTIVE_COLLAR.md),
SHA-256 beginning 136049328270f61c. The boundary marking and chiral
normalization are those of the [quaternionic ledger](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md)
and [E07](E07_PROJECTIVE.md). All calculations below are analytical.

Both results replay. The short-axis cap realizes the positive Berger
boundary with a smooth core and has \(E_-\ge457\pi^2/48\) in the
outward-first quaternion orientation. The conformally flat and
regular half-flat Einstein collar exclusions hold for any marking on
the actual compact quaternionic link. The Einstein conclusion can
already use the Einstein and half-flat algebraic conditions on the
face. An explicit analytic half-flat collar shows why half-flatness
alone does not give the obstruction.

## Short-axis cap and signed energy

With \(Y=Q_8\backslash SU(2)\) and \([g]\mapsto[g^{-1}kg]\) the normal
circle is the \(k\)-circle in the normalizer of the line spanned by
\(k\). Its period in the right-frame generator is \(\pi/2\), since
\(Q_8\cap\exp(\mathbb R k)=\{\pm1,\pm k\}\). The other normalizer
component reverses the circle direction along an orientation-reversing
base chart. Its associated disk is the specified normal disk bundle,
with Euler number of magnitude two by the oriented-base double of
Euler magnitude four. Near the core, \(c=4s\) gives circumference
\(2\pi s\). Locally \(4\sigma_3=d\gamma+\mathcal A\), with \(\mathcal A\)
a smooth pulled-back connection form. The normal part becomes
\(ds^2+s^2(d\gamma+\mathcal A)^2\). It extends in normal Cartesian
coordinates because \(s^2d\gamma=X\,dY-Y\,dX\) and
\(ds^2+s^2d\gamma^2=dX^2+dY^2\). The horizontal tensor is the pullback
of the homogeneous base metric. This verifies polar smoothness.

The E14 cutoff is flat off the transition interval and satisfies
\(\chi(y)+\chi(1-y)=1\). With \(L_0=1/2\) this gives \(c=1\) near the
terminal face and \(c''\le0\). The second cylinder varies the \(i\)-axis
with the \(k\)-axis kept at unit length. Its initial and final constant
intervals give equality of all jets at the round join and a totally
geodesic final face. The end lengths are \((\sqrt3,1,1)\).
The remaining short axis \(j\) represents the other marking. The
link automorphism induced by quaternionic conjugation by
\(\exp(\pi i/4)\) preserves the long \(i\)-axis and interchanges \(j\)
and \(k\) up to sign. It normalizes \(Q_8\), preserves the Berger
metric and the orientation, and takes the \(k\)-normalizer and slice
disk model to those for \(j\). Transporting the construction therefore
gives the same result for the other short marking. This transport is
a change of boundary identification. Relative to the actual round
orbit the two short markings are distinct, and its long axis is not
one of the collapsing circles.
[Round-orbit marking](../../01_chirality_ledger/notes/ROUND_ORBIT_MARKING.md)

Here is a direct curvature check. For a varying third axis \(a\), take
\(e^0=ds,\ e^1=\sigma_1,\ e^2=\sigma_2,\ e^3=a\sigma_3\), in that
orientation. Cartan's first equation gives
\(\omega_{30}=(a'/a)e^3,\ \omega_{23}=a e^1,\ \omega_{31}=a e^2\),
and \(\omega_{12}=(2/a-a)e^3\), together with their skew partners.
In \(\Omega_{03}\), the derivative of \(\omega_{03}\) gives
\(K_{03}=-a''/a\) and \(R_{03\,12}=-2a'\). In \(\Omega_{12}\) the
derivative gives \(4-2a^2\) in the horizontal plane, and the connection
product subtracts \(a^2\). The remaining radial curvatures are zero
and the remaining two tangential curvatures are \(a^2\). Consequently
\[
R=2(4-a^2-a''/a),\qquad
\lambda^\pm_3=\frac{4-4a^2-a''/a\mp6a'}3.
\]
In each chirality the other eigenvalues are
\(-\lambda^\pm_3/2\), by axial symmetry on the cover and tracelessness.
The scalar curvature is at least six for the round-ended cap.
For the second cylinder
\(\|\lambda''\|_\infty=(\sqrt3-1)\|\psi''\|_\infty/L_1^2<1/2\)
and \(1\le\lambda\le\sqrt3\). The same scalar formula applies after
an orientation-preserving cyclic permutation. It gives \(R\ge1\)
and gives intrinsic \(R=2\) for the final constant Berger metric.

Put \(v=\int a\,ds,\ z=a^2-1\). The axial eigenvalue is
\(-(\ddot z\pm6\dot z+8z)/6\) for \(W^\pm\). Its squared
Hilbert–Schmidt contribution after the other eigenvalues are included
is \(3/2\) times its square. The orbit volume is \(\pi^2 a/4\)
by the order-eight quotient. Thus
\[
\frac{E_\pm}{\pi^2}
=\frac1{96}\int(\ddot z\pm6\dot z+8z)^2\,dv,\qquad
\frac{E_+-E_-}{\pi^2}
=\frac14\big[\tfrac12\dot z^2+4z^2\big]_{\rm ends}.
\]
The round-ended cap has endpoints \((-1,8)\) and \((0,0)\) in the
\((z,\dot z)\) coordinates, so its difference is \(-9\pi^2\).
On \(0<s<1/8\) the axial \(W^+\)-entry is \(-(20+4c^2)/3\).
Keeping only that interval gives
\((3/8)(400/9)\int_0^{1/8}4s\,ds=25/48\) as a lower bound
on \(E_+/\pi^2\). This gives \(E_-/\pi^2\ge457/48\) on the
round-ended cap. Nonnegativity of the cylinder contribution retains
the bound. The cylinder endpoints \((0,0)\), \((2,0)\) give difference
\(4\pi^2\), for a total \(-5\pi^2\) matching the ledger's
\(\eta=-5/12\). Any smooth homotopy-sphere closing has both chiral
energies equal to \(e\), which excludes the strict band with this
particular cap. The estimate controls the round-intermediate
construction.

## The compact link and its one-sided collars

A locally conformally flat conformal structure on the compact actual
link gives a conformal atlas with Möbius transitions. The elementary
Liouville argument in [E03](../notes/E03_EQUALITY.md) uses the flat
Schouten equation \(\nabla^2s=(|ds|^2/2s)g_{\rm Eucl}\), which holds
in dimension three as well. Continuation of charts on the simply
connected cover gives a well-defined developing map into \(S^3\).
Two continuations agreeing on a nonempty open set agree by uniqueness
of the Möbius transition, and a subdivision of a path homotopy gives
path independence. The cover is compact because the fundamental group
is \(Q_8\). Thus the developing image is open and closed, and the
proper local diffeomorphism is a covering of the simply connected
sphere. It is a global diffeomorphism.

The finite deck group is a group of Möbius maps, and is conjugate into
the round orthogonal group. In the hyperbolic ball realization this
follows by averaging a finite orbit of a future timelike unit vector
and normalizing to a timelike fixed unit vector. Orthogonal action
follows in polar coordinates at the corresponding interior point.
The central involution of any such free orthogonal \(Q_8\) action is
\(-I\), since a \(+1\) eigenspace would give a fixed point. Writing the
generators as orthogonal \(I,J\), they are skew and satisfy
\(I^2=J^2=-1,\ IJ=-JI\). For a unit \(v\), the four vectors
\(v,Iv,Jv,IJv\) are orthonormal. In that frame the group is the standard
quaternionic representation, with a possible orientation reversal of
the conjugating map. APS II (2.12)–(2.13) gives the signed round
contribution from each nontrivial element, by averaging the trace
over the group. The six elements of order four each contribute
the same sign of unit magnitude. The central involution and identity
give zero. This yields \(|\eta|=6/8=3/4\). APS II (4.7) and its
conformal invariance statement preserve this value in the conformal
class. In the parent signature normalization the umbilic bound is
\(e\ge12\pi^2|\eta|=9\pi^2\), above \(2T=8\pi^2\).
[APS II §§2, 4](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf)
· [Checked normalization and orientation](../../01_chirality_ledger/references/PRIMARY_20261127.md)

On a regular one-sided Weyl-flat collar, the flat tractor argument
of E03 gives smooth flat coordinates up to the face. The ambient
metric is smooth through its one-sided boundary jets, and the
tractor curvature vanishes there by continuity. Euclidean umbilicity
and Codazzi make a face patch a sphere or plane, both intrinsically
locally conformally flat. The contradiction uses charts covering the
whole compact face and permits their local widths to vary. It gives
strictly positive total Weyl energy in each whole-face collar on
either side. For a fixed smooth metric the energy of collars of
uniform width tending to zero also tends to zero, so the implication
is qualitative.
[Gover–Nurowski, §§2.1 and 3.1](https://www.esi.ac.at/preprints/esi1486.pdf)

For the regular half-flat Einstein case, contracted Codazzi and the
mixed Einstein equation make the umbilic curvature \(\kappa\) constant.
Full Codazzi gives \(R_{\nu abc}=0\) for tangent indices \(a,b,c\).
The Einstein Schouten term has zero entries of this type, so
\(W_{\nu abc}=0\). Identify each normal–tangent two-form with the
complementary tangential two-form by the Hodge star. The matrix between
these two subspaces is half the difference of the two chiral Weyl
blocks in the resulting bases. Its vanishing gives \(W^+=W^-\) in
those bases. The zero block forces the whole Weyl tensor to vanish on
the face. Gauss gives every intrinsic sectional curvature as
\(R_g/12+\kappa^2\). In fact the same conclusion follows if the ambient
Ricci tensor is pure trace at each face point and one Weyl block
vanishes on the face. Gauss then gives pointwise isotropic sectional
curvature, and the three-dimensional Schur identity makes it constant
on the connected face. The geometric arguments apply to a smooth,
strictly positive conformal scale up to the face. A singular Einstein
scale at conformal infinity is outside these hypotheses.

## A boundary Cotton test and an explicit half-flat collar

For an arbitrary umbilic face, choose a smooth positive conformal
change making it totally geodesic, by prescribing the normal
derivative of the conformal factor. Codazzi now implies both mixed
curvature and mixed Ricci vanish at the face, hence \(W_{\nu abc}=0\).
Half-flatness at the face therefore forces all Weyl entries there to
vanish even without the Einstein condition. In this totally geodesic
gauge Gauss and the dimension-three curvature decomposition give
\(A_h=A_g|_{T\Sigma}\) on the face. Tangential covariant differentiation
of that relation gives \(C_h=C_g|_{T\Sigma}\), since the ambient and
intrinsic tangential covariant derivatives agree. Thus vanishing of
the tangential ambient Cotton tensor on the whole face in this gauge
is another sufficient condition for the quaternionic obstruction.
In three dimensions \(C_h=0\) gives local flat conformal charts, also
by the flat-tractor argument since the three-dimensional Weyl tensor
vanishes algebraically.
[Gover–Nurowski, (3.4), (3.7)](https://www.esi.ac.at/preprints/esi1486.pdf)

Half-flatness alone does not force the tangential Cotton condition.
Take a biaxial right-invariant cylinder with
\[
c^2=1+z,\qquad z(v)=4e^{-2v}-2e^{-4v},\qquad ds=dv/c,\qquad v\ge0.
\]
At \(v=0\), \(c=\sqrt3\) and \(\dot z=0\), so this is a totally
geodesic Berger face. The function solves
\(\ddot z+6\dot z+8z=0\), so the checked curvature formulas give
\(W^+=0\) in the orientation of increasing \(s\) followed by the
quaternion orientation. The other block is nonzero for \(v>0\)
since \(\dot z\ne0\) there. In the quaternion orientation of the
link the face has \(\eta=-5/12\), hence it is not conformally flat.
The scalar curvature is
\[
R=6-2z-\ddot z=6(1-4e^{-2v}+6e^{-4v})>0 .
\]
Restricting to any small finite \(v\)-interval gives a smooth regular
one-sided half-flat positive collar of the non-conformally-flat
metric, with no Einstein scale regular at the face by the argument
above. The outward face orientation at \(v=0\) reverses the
displayed quaternion orientation. The construction concerns a
collar only and does not specify a subcritical cap or a smooth closing.
