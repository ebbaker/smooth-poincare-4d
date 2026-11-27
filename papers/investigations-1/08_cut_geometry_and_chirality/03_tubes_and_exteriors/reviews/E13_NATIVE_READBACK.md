# E13 · The marked native disk doubles

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and effort are unavailable. The bounded
[request R1](../research-progress/handoffs/E13_REQUEST_R1.md) uses checkout
\(\texttt{bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0}\), the working
[SLIDE handoff](../../04_slide_filters/research-progress/handoffs/TO_TUBE_NATIVE_DISK_DOUBLE_20261127.md)
(Git blob \(\texttt{00f353974ef1}\)) and its
[five exact representations](../../04_slide_filters/notes/REPRESENTATIONS_AND_EXTERIORS_20261127.md)
(\(\texttt{51f05b587bab}\)). The [E11 return](../notes/E11_NATIVE_MERIDIANS.md)
was checked at blob \(\texttt{a7faf5e31605}\). The topology below is smooth and oriented,
and every boundary comparison uses the physical zero-surgery marking.

**Conclusion.** Both fillings of each native \(L_{3,1}\) doubled-disk
exterior are diffeomorphic to the standard \(S^4\). The needed
comparison is of the completed handle trace relative to the actual
incoming zero surgery. It gives a fibration of the disk exterior
compatible with the dividing faces used in its double. A rotation
loop on the punctured doubled handlebody extends the Gluck map.
These steps require no identification of the doubled sphere as a
spun knot and provide no metric realization of the flat holonomies.

## The actual incoming cut

Let \(K\) be either \(Q\), the square knot, or
\(V_3=T_{3,4}\#\overline T_{3,4}\). Write \(J\) for its partner.
Their closed-fiber genera \(g\) are 2 and 6, respectively. The native
link is a zero-framed \(2R\)-link with simultaneous outlet
\(Y_2=\#_2(S^1\times S^2)\). The proof of sliceness in GST, §8,
published p. 2334 immediately after Figure 14, points to the two
native co-cores in the standard smooth ball. Removing the co-core
for \(K\) leaves the forward trace from \(Y_K=S^3_0(K)\) through the
handle on \(J\), completed by the two 3-handles and the 4-handle.
The annulus left in the removed handle's normal disk just adds a
collar on the solid-torus face. Its zero-surgery boundary is
\(Y_K=E_K\cup(D^2_{\rm c}\times S^1_\mu)\), with \(E_K\) the
classical knot exterior and \(S^1_\mu\) its meridian circle. This is
the two-face description used in the SLIDE return.
[Published GST, §§7–8](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=30)
· [SLIDE's native cut and disk readback](../../04_slide_filters/reviews/GST_CUT_READBACK_20261127.md)

The boundary fibration of \(E_K\) extends across the actual zero
surgery by capping each punctured page \(F\) with \(D^2_{\rm c}\).
Use the mapping torus of the closed monodromy \(\widehat\varphi\)
on \(\widehat F=F\cup D^2_{\rm c}\), with the identity on
\(D^2_{\rm c}\). The zero longitude specifies the disk-boundary
slope and the meridian specifies the bundle projection there.
This is the construction in Meier–Zupan §2.2.
[Meier–Zupan, JDG 122 (2022), pp. 77–78](https://par.nsf.gov/servlets/purl/10464744#page=9)

The relative trace conclusion uses two specific portions of
Meier–Zupan. Published Lemma 3.10, arXiv v1 Lemma 3.9, begins with
the **framed isotopy of \(J\) inside this \(Y_K\)** to a closed
fiber, with its surface framing. In the proof of Theorem 1.5,
Claim 1 makes the \(g\) resulting curves \(L^+\) into a
Casson–Gordon derivative for \(K\), so they are the boundary of a
cut system of a handlebody \(H\) over which \(\widehat\varphi\)
extends. Claim 2 compares \(J\cup U\) and \(L^+\) by framed slides
**in \(Y_K\)**, where \(U\) is a split zero-framed unlink of
\(g-1\) components. It is this comparison inside \(Y_K\) before the
concluding statement about links in \(S^3\) that preserves the
incoming boundary.
[Meier–Zupan, published Lemma 3.10 and Theorem 1.5, pp. 87–90](https://par.nsf.gov/servlets/purl/10464744#page=19)
· [arXiv v1, Theorem 1.5 proof and Claim 2, preprint pp. 15–17](https://arxiv.org/pdf/1904.08527#page=15)

To see the marking in the resulting four-manifold, keep the lower
end of a collar \(Y_K\times I\) fixed. Push the framed isotopies to
its upper end and perform the framed handle slides there. These
are diffeomorphisms of the 2-handle trace relative to its incoming
collar. The split zero-framed unknots add cancelling 2/3 pairs in
disjoint balls, changing the uncapped outlet from \(Y_2\) to
\(\#_{g+1}(S^1\times S^2)\). The remaining 3- and 4-handles constitute
the reversed four-dimensional 1-handlebody of genus \(g+1\).
Laudenbach–Poénaru's extension argument absorbs the outgoing
boundary diffeomorphism into this 1-handlebody. In particular, it
requires no diffeomorphism of the incoming \(Y_K\). In
Meier–Zupan Lemma 2.5 the mapping torus \(H\times_\Phi S^1\) of
the handlebody extension is built on the same incoming
\(\widehat F\times_{\widehat\varphi} S^1\) collar, by precisely the
surface-framed handles \(L^+\) and the same type of 3/4-cap.
Thus the actual disk exterior has a diffeomorphism to this
handlebody mapping torus relative to its entire marked boundary.
In particular the comparison fixes the distinction between \(E_K\)
and \(D^2_{\rm c}\times S^1_\mu\).
[Meier–Zupan, published Lemma 2.5, p. 78](https://par.nsf.gov/servlets/purl/10464744#page=10)
· [Laudenbach–Poénaru, Theorem A proof, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=6)

This argument gives the actual fibration, which is a stronger input
than a bare assertion that a given boundary knot admits some
fibered homotopy-ribbon disk. The Casson–Gordon existence statement
in Meier–Zupan Theorem 2.3 and Corollary 2.4 alone gives only the
latter. Their Proposition 8.5 explicitly distinguishes
handlebody-fiber-preserving diffeomorphisms of unmarked exteriors
from diffeomorphisms relative to \(Y_K\). Lemma 8.6 identifies
the zero-parameter disk as the product disk, and §8.3 distinguishes
it from other relative classes. Identifying a native double as a
specific spun knot would still require a matched disk-pair
identification or equivalent control on the doubled peripheral
marking. Fibration alone supplies no such identification.
[Meier–Zupan, Proposition 8.5, Lemma 8.6, Proposition 8.7 and Remark 8.9, pp. 117–120](https://par.nsf.gov/servlets/purl/10464744#page=49)

## Doubled fiber and the smooth filling

The exterior \(X_K\) of the native doubled disk is the double of
the disk exterior along \(E_K\), leaving the two solid-torus
faces to form the \(S^2\times S^1_\mu\) seam. The relative result
above makes it a smooth mapping torus over the actual meridian
angle, with fiber \(P=H\cup_F\overline H\). Gluing the two closed
handlebodies along all of \(\widehat F\) gives
\(\#_g(S^1\times S^2)\). Removing a collar-thickening of the
capping disk in that double gives the same \(P\) with its
corners smoothed, so \(P\cong(\#_g S^1\times S^2)^\circ\). The
remaining boundary sphere is the double of the marked capping
disk. A boundary collar for the handlebody extension can be
chosen product, yielding the original sphere-product marking on
the resulting seam.
[Meier–Zupan, §8.3 and Proposition 8.7, pp. 119–120](https://par.nsf.gov/servlets/purl/10464744#page=51)

There is a smooth circle action on \(P\) that restricts to the
axial rotation of its boundary sphere. For each closed summand
take the action on \(S^1\times S^2\) trivial on the first factor
and axial on the second. At a fixed point the tangent model is
rotation of a plane and the identity on its orthogonal line.
Use small invariant balls and orientation-reversing boundary
identifications commuting with that linear action to form the
equivariant connected sum. Excise one more invariant ball at a
remaining fixed point. This constructs the desired smooth action
on a model of \(P\). The \(g=0\) version is the rotation action on
a ball.

Trivialize the fibration over a proper interval of \(S^1_\mu\).
For a smooth angle \(\Theta(t)\) constant near the ends, increasing
from \(0\) to \(2\pi\), apply this fiber action by \(\Theta(t)\)
there and the identity elsewhere. The resulting diffeomorphism of
the entire exterior is smooth even if the bundle monodromy fails
to commute with the action, since it is the identity near the
ends of the chosen interval. It restricts to a Gluck rotation
concentrated in that interval. In the physical boundary marking
its isotopy class is still the Gluck class. The action fixes the
meridian parameter, rotates the sphere by one full turn, and
changing product marking conjugates the class in the component
group of \(\operatorname{Diff}(S^1\times S^2)\). That group has
the two factor reversals and one rotation parity, all of order
two with commuting classes. The two reversals extend over the
cap. The restriction of the exterior diffeomorphism therefore
identifies the Gluck closing with the identity closing, which
restores the double of the specified smooth ball. Collar
isotopies can be used for the exact chosen gluing map.
[Hatcher, revised *On the Diffeomorphism Group of \(S^1\times S^2\)*, p. 1](https://www.maths.gla.ac.uk/~mpowell/Hatcher-newDiffS1xS2.pdf)
· [Larson–Meier, *Fibered ribbon disks*, Remarks 4.5 and 4.7, preprint pp. 10–11](https://real.mtak.hu/184946/1/1410.4854.pdf#page=10)

Gordon's theorem would also handle the alternate framing if the
corresponding sphere had been identified as a spun or twist-spun
knot. Theorem 3.1 quantifies over all integers \(k\), including
the ordinary spin at \(k=0\). Although the introduction states the
PL convention, Remark (2) following the theorem explicitly
extends Propositions 3.2–3.3 and their conclusion to smooth
diffeomorphism. This scope is independent of the exterior
extension proof above.
[Gordon, *Knots in the 4-sphere*, Comment. Math. Helv. 51 (1976), pp. 587–592](https://www.e-periodica.ch/cntmng?pid=com-001%3A1976%3A51%3A%3A41)

### Why the unmarked surgery comparison is insufficient

Meier–Zupan's later Proposition 4.2 argues from equality of the
unmarked closed surgery manifolds to a spun-knot identification.
Its invocation of Gluck's Theorem 22.1 needs an identification
of the actual exteriors. Gluck states the theorem for equal
semi-linear **exteriors**. To obtain an exterior by reversing
the closed surgery requires removing a neighborhood of the
specified surgery-core circle. The handlebody-fiber-preserving
map in Meier–Zupan's earlier Proposition 8.5(1) does not
identify this marked core. Equality of the closed surgery
manifolds by itself leaves that step open.
[Meier–Zupan, J. Topol. (2025), Proposition 4.2, p. 11](https://pure.mpg.de/pubman/item/item_3591344_2/component/file_3683705/Meier-Zupan_Knots%2Bbounding%2Bnonisotopic%2Bribbon%2Bdisks_2025.pdf#page=11)
· [Gluck, Trans. AMS 104 (1962), Theorems 17.1 and 22.1, pp. 325, 331](https://www.maths.gla.ac.uk/~mpowell/Gluck-MCG-S2xS1-Trans-AMS.pdf#page=24)

The native \(Q\)-disk supplies a concrete peripheral check,
conditional on the SLIDE meridian calculation. Its exterior
group is \(B_3=\langle x,y\mid xyx=yxy\rangle\) with meridian
\(s=x^4y^{-3}\) up to conjugacy and inversion. In the alternative
presentation \(p=xyx,\ q=xy,\ p^2=q^3\), the central quotient is
\(C_2*C_3\). Indeed \(p^2=q^3\) generates a central subgroup,
and the free product quotient has trivial center. There
\(x=q^{-1}p,\ y^{-1}=qp\), so the image
\((q^{-1}p)^4(qp)^3\) is cyclically reduced of syllable length
14. The meridian of the spun trefoil is a classical Wirtinger
meridian \(x\) for this braid presentation, and its image
\(q^{-1}p\) has length two. In the ordinary spin, the product
of the knotted-arc exterior and the spin circle is capped by
the product of the two-ended boundary annulus and a disk.
Van Kampen kills the spin generator and retains the classical
meridian from the annulus. This is also the \(k=0\) exterior
decomposition in Gordon's Proposition 3.3.
[Suzuki, *On pseudo-meridians of the trefoil knot group*, §2, p. 178](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/1836-16.pdf)
· [Gordon, Proposition 3.3, p. 592](https://www.e-periodica.ch/cntmng?pid=com-001%3A1976%3A51%3A%3A41)

The cyclic length comparison survives arbitrary automorphisms.
By reduced word normal forms, each finite-order element of
\(C_2*C_3\) is conjugate into a factor. Thus after inner
conjugacy an automorphism fixes \(p\) and sends \(q\) to
\(h q^{\pm1}h^{-1}\). Choose \(h\) shortest in the double
coset \(C_2hC_3\), allowing one further conjugation by \(C_2\).
If \(h\) is nonempty, it begins with a syllable in \(C_3\)
and ends in \(C_2\). In an alternating word of nonidentity
elements from \(C_2\) and \(hC_3h^{-1}\), each occurrence of
the latter preserves the entire reduced block \(h q^k h^{-1}\).
The generated subgroup then misses \(q\), contrary to
surjectivity. It follows that, modulo inner conjugacy, such
automorphisms preserve both factors and preserve cyclic
syllable length. The comparison therefore distinguishes the
two peripheral pairs if the native word in the handoff is
used. It gives a specific reason to withhold the proposed
spun-trefoil inference. The relative trace and Gluck extension
above require no comparison to the spun trefoil.

## Five meridian and cap checks

For unit quaternions \(x=(a,u)\), \(y=(b,v)\), write
\(c_0=\operatorname{Re}(xy)\) and \(l=\operatorname{Re}(x\bar y)=2ab-c_0\).
Since \(yxy=2c_0 y-\bar x\) and \(xyx=2c_0 x-\bar y\), the scalar
of \(r=yxy(xyx)^{-1}\) is
\[
(4c_0^2+1)l-2c_0(2a^2+2b^2-2).
\]
For samples 1, 3 and 4, \(a^2=1/2,\ b=1/2\) and
\(c_0\sqrt2=3/4,15/32,-5/16\), respectively. For samples 2 and 5,
\(a=b\) and \(u\cdot v=a^2-1/2\). Expanding
\(s=x^4y^{-3}\) gives the scalar
\[
(8a^4-8a^2+1)(4a^3-3a)
 +(8a^3-4a)(4a^2-1)(a^2-1/2).
\]
These rational evaluations reproduce the exact scalar column below.
Let \(c\) be the scalar of the listed lift, and define
\(\delta_\rho=\arccos(c)/\pi,\ \delta_{-\rho}=1-\delta_\rho\).
The latter means the opposite lift of the meridional holonomy. The
associated \(SO(3)\) endpoint has principal angle
\(2\arccos|c|\) in either case.

At the example \(D=147/100\) and \(\lambda=26/5\) in the
[framed budget](../notes/FRAMED_CONNECTION_BUDGET.md), the dimensionless
lower bound is \(B(\delta)=1911/250+2\delta\sqrt{26/375}\).
Decimals in the following table are approximations, separate from
the exact inequalities.

| Sample | Surviving meridian | Exact \(c\) | \(\delta_\rho,\delta_{-\rho}\) | \(B(\delta_\rho),B(\delta_{-\rho})\) |
| --- | --- | --- | --- | --- |
| 1 | \(r\) | \(41\sqrt2/64\) | 0.139135, 0.860865 | 7.717272, 8.097352 |
| 2 | \(s\) | \(64893/78125\) | 0.187980, 0.812020 | 7.742995, 8.071629 |
| 3 | \(r\) | \(20209\sqrt2/32768\) | 0.162701, 0.837299 | 7.729682, 8.084942 |
| 4 | \(r\) | \(2573\sqrt2/4096\) | 0.151837, 0.848163 | 7.723961, 8.090663 |
| 5 | \(s\) | \(-13854473/20000000\) | 0.743589, 0.256411 | 8.035592, 7.779032 |

Each exact \(|c|>2/3>\cos(3\pi/10)\), using
\(\cos(3\pi/10)=\sqrt{(5-\sqrt5)/8}\). Thus the larger
\(\delta>7/10\) and the smaller \(\delta<3/10\). The comparisons
with eight at this \(D,\lambda\) are exact because
\[
\left(\tfrac75\right)^2\tfrac{26}{375}
 > (89/250)^2
 > \left(\tfrac35\right)^2\tfrac{26}{375}.
\]
Consequently all five larger lifts are excluded for this
prescribed \(D\) by the same signwise bound. In the smaller-lift
cases the bound at this multiplier lies below eight. It supplies
no upper bound or existence conclusion. Without specified \(D\)
there is no sample-specific obstruction from the numbers alone.
For a proposed exterior the relevant necessary tests are
\(E_\pm(X)/\pi^2+B(\delta)<8\), with \(B\) evaluated at its
actual normalized boundary curvature and actual disk-marked
lift. The abstract representation supplies neither the
round-fiber germ nor its framing. The native homology-circle
exterior has a character to \(\{\pm1\}\) nontrivial on the
meridian, so the adjoint representation alone permits the
opposite lift as well.

For E11's **umbilic** use, in the normalized cap gauge the vertical
part of \(B\) on the two fiber tangents vanishes. For a horizontal
unit outward normal \(e_1\), \(\nabla_U e_1\) is horizontal by
total geodesy of the fibers. Hence umbilicity makes \(B=0\).
The horizontal boundary curvature is then zero, giving
\(D=1\). The mixed entry also implies \(b=0\) on the boundary,
since \(B(U,e_2)=\langle b\times p,U\rangle/2\), up to the
chosen sign of \(e_2\). Thus the \(D=147/100\) comparison above
concerns nonumbilic data in this ansatz. At \(D=1\) and
\(\lambda=133/25\), direct fraction arithmetic gives
\(C_\lambda^2=4522/187500\) for E11's coefficient of \(\delta\).
Evaluating \(67/25-C_\lambda\delta\) independently gives the
following signed exterior energy thresholds in units of \(\pi^2\).

| Sample | Given lift | Opposite lift |
| --- | ---: | ---: |
| 1 | 2.658393 | 2.546310 |
| 2 | 2.650807 | 2.553895 |
| 3 | 2.654733 | 2.549969 |
| 4 | 2.656420 | 2.548282 |
| 5 | 2.564522 | 2.640180 |

For sample 5, \(u_5^2<1/2\) gives \(\delta>1/4\) for both lifts.
The exact value of \(C_\lambda^2\) is greater than \(9/400\),
so \(C_\lambda>3/20\). With either exterior chirality
\(E_\pm(X)/\pi^2\ge53/20\), the corresponding total exceeds
\(53/20+133/25+3/80=8+3/400\). The threshold is indeed less
than \(8/3\). This verifies the strict conditional sample 5
obstruction in E11.

The primary passages linked above were checked on 27 November
2026. The topology proof and comparisons with the energy wall
are analytical. The angle decimals describe the exact scalar
evaluations and are neither needed for the wall comparison nor
geometric energy certificates.
