# E35 · The short-axis cap on its oriented-base cover

27 November 2026, for Edward B. Baker III, with OpenAI assistance. Input baseline `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`, [E35 request](../research-progress/handoffs/E35_REQUEST_R1.md), [short-axis marking](E18_QUATERNIONIC_PAIR.md), [finite-cover review](../../02_seams_and_marked_cuts/reviews/E08C_REALIZATION.md) and [ledger normalization](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md). Actual worker model and effort unavailable. The calculation concerns smooth oriented Riemannian fillings with the prescribed umbilic boundary and strictly positive Robin conformal-Laplacian sign.

The extending cover yields \(E_+(W)\ge\pi^2/6\) in the ledger orientation, the same bound as the earlier mean-energy estimate. The sharp universal Yamabe estimate is weaker on its double. A positive comparison cap on the opposite Euler-\(4\) disk bundle cannot improve the cover bound by the same two inequalities. The Fubini–Study real-projective-plane cap has the exact marked intrinsic metric at one orbit and fails the umbilicity condition there.

## Actual cover and signed energies

The right-invariant lengths on \(Y=Q_8\backslash SU(2)\) are \((1,1,\sqrt3)\) in \(i,j,k\) order. The zero-section projection is \([g]\mapsto[g^{-1}ig]\in\mathbb{RP}^2\). To lift it to the oriented sphere retain the sign in \(g^{-1}ig\). Precisely \(1,-1,i,-i\) preserve this vector in the left action, whereas \(\pm j,\pm k\) invert it. The extending cover is therefore \(\widetilde Y=\langle i\rangle\backslash SU(2)\), from the subgroup \(\langle i\rangle\subset Q_8\), which fixes a **short** axis. The universal cover \(\widetilde W\to W\) is the pullback of the disk bundle by \(S^2\to\mathbb{RP}^2\). The normal circle parameter has period \(\pi/2\) in the Hopf circle, so the lifted disk bundle has Euler magnitude four and \(\chi(\widetilde W)=2\). In coordinates \(z_1+z_2j\) with \(z_1,z_2\in\mathbb C_i\), left multiplication by \(i\) rotates both complex coordinates by \(\pi/2\). Their real basis is \((1,i,j,k)\). This identifies the lens action \(L(4,1)\) and its orientation explicitly.

In the outward quaternion orientation the round eta on \(\widetilde Y\) is
\[
 -\tfrac14[\cot^2(\pi/4)+\cot^2(\pi/2)+\cot^2(3\pi/4)]=-\tfrac12 .
\]
Round eta on \(Y\) is \(-3/4\). Relative eta, evaluated on a product-ended interpolating metric cylinder via APS, multiplies by the cover degree. The ledger gives the change \((t^2-1)^2/12\) downstairs, so upstairs it is \((t^2-1)^2/6\). Thus the fixed Berger value is \(\eta(\widetilde h)=1/6\), and the cover defect \(\eta(\widetilde h)-2\eta(h)=1\). At an umbilic cut the signed APS boundary transgression vanishes. Since \(\tau(W)=0\) and the local curvature integral multiplies by two, \(\tau(\widetilde W)=-1\), fixing the Euler sign to \(-4\). With both Weyl energies in real chiral operator Hilbert–Schmidt norm the result is
\[
 E_+(W)-E_-(W)=-5\pi^2,\qquad
 E_+(\widetilde W)-E_-(\widetilde W)=-10\pi^2 .
\]
Orientation reversal exchanges the signs. [APS I, (4-14), p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24) · [APS II, (2-12), p. 412](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf#page=8) · [Quaternionic ledger](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md)

## Closed comparison inequalities

Normalize the boundary to be totally geodesic by a conformal change. A strictly positive Robin sign lifts, for example by pulling back the positive Neumann first eigenfunction in this gauge and using the conformal scalar transformation. On reflection the doubled metric is \(C^{2,1}\). Smooth \(C^2\) approximation preserves positive Yamabe sign and converges in the Weyl integrals. Two different totally geodesic caps with a common boundary representative give a \(C^{1,1}\) junction. For that junction the analogous approximation uses \(C^1\cap W^{2,p}\) convergence for finite \(p>2\), and the strict quadratic form signs on the two pieces add. [Robin descent and smoothing](../../02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md)

The lifted reflection double is the \(S^2\)-bundle over \(S^2\) from the oriented plane bundle of Euler \(-4\) plus a real line. Its clutching loop in \(SO(3)\) represents the even class, so it is \(S^2\times S^2\). Equivalently \(\chi=4\), \(\tau=0\), \(b_2^+=b_2^-=1\) from Mayer–Vietoris and reflection. Each closed chiral energy is \(E_+(\widetilde W)+E_-(\widetilde W)=4e_W\), where \(e_W\) is the downstairs half sum. Gursky's positive-Yamabe inequality \(E_\pm\ge(4\pi^2/3)(2\chi\pm3\tau)\) yields
\[
 4e_W\ge\tfrac{32}{3}\pi^2,\qquad
 E_+(\widetilde W)\ge\tfrac13\pi^2,\qquad
 E_+(W)\ge\tfrac16\pi^2 .
\]
Only a uniform improvement of the last bound to \(3\pi^2/2\) would exclude the strict pair window \(e_W<4\pi^2\). The existing attained-equality exclusion for a smooth even double gives no uniform improvement. [Sung, Theorem 1.4(v)](https://arxiv.org/pdf/2108.03808#page=5) · [Smooth equality analysis](../../02_seams_and_marked_cuts/reviews/E08C_REALIZATION.md)

On any smooth closed positive approximant \(X\), Chern–Gauss–Bonnet on its volume-one Yamabe representative gives
\[
 E_\pm(X)\ge 2\pi^2(2\chi(X)\pm3\tau(X))-Y(X)^2/48 .
\]
The sharp universal \(Y(X)^2\le384\pi^2\) gives \(4e_W\ge 8\pi^2\) on the lifted double, weaker even than the signed APS nonnegativity bound. To improve the Gursky bound by this formula on that double one would need \(Y(X)^2<256\pi^2\) with a uniform margin on the relevant reflected classes. The value \(16\pi\) occurs on the equal-radius product class on \(S^2\times S^2\) by Einstein uniqueness in its class. A sharp topology-only upper bound could therefore at best reproduce the Gursky floor. [Sung, (5) and Lemma 2.1](https://arxiv.org/pdf/2108.03808#page=6) · [Lee–Parker, §3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=14)

For a positive Robin copy \(Z\) of the opposite disk bundle, the outward eta is \(-1/6\), \(\tau(Z)=1\), and \(E_+(Z)-E_-(Z)=10\pi^2\). Its own reflection double has \(\chi=4,\tau=0,b_2^+=1\). Consequently \(E_+(Z)\ge31\pi^2/3\). Gluing to \(\widetilde W\) has the same closed curvature thresholds, and subtracting \(E_+(Z)\) yields at most \(\pi^2/3\) for the smaller lifted energy. Gluing two lifted caps along the switched downstairs pairing also requires care: the map of the downstairs markings interchanges the extending subgroups, so that gluing cannot inherit these two covers. [Marked switching](E18_QUATERNIONIC_PAIR.md)

More generally an alternative complement \(Z\) would require a verified common metric and a strictly positive glued Yamabe sign. If \(b_2^+(Z)>0\), its plus-chiral Gursky test has right-hand side
\[
 \tfrac{4\pi^2}{3}(2\chi(Z)+3\tau(Z)+1)-E_+(Z)
\]
for \(E_+(\widetilde W)\). The minus-chiral test, available since the negative direction of the bolt survives, has right-hand side differing from this by \(4\pi^2(\tau(Z)-1)\). These follow by signature additivity, the rational homology sphere boundary, and \(E_+(Z)-E_-(Z)=12\pi^2\tau(Z)-2\pi^2\). No comparison cap achieving a stronger bound is supplied by the tested closures.

## Fubini–Study comparison

For the complex-opposite orientation on \(\mathbb{CP}^2\) the conic has normal Euler \(-4\), and the complementary piece \(Z_0\) is a normal disk bundle over the real \(\mathbb{RP}^2\) of Euler magnitude one. The conic lies at one end of the \(SO(3)\) orbit diagram and the real locus at the other. The matrix representative \([\cos s\,e_1+i\sin s\,e_2]\), \(0<s<\pi/4\), gives this diagram directly by choosing representatives with orthogonal real and imaginary parts and making the first longer. The principal stabilizer in \(SO(3)\) is the half turn around \(e_3\), and its lift is cyclic of order four. Complex conjugation is free on the conic chamber and acts on the conic by the antipodal map, sending \(e_1+i e_2\) to \(e_1-i e_2\) and reversing the oriented axis \(e_3\). On the open orbits it adds the half turn around \(e_1\), yielding the downstairs \(Q_8\) action and the extending subgroup around \(e_3\). [Seade, Ch. V, §§3–4](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/seade.pdf)

With the Fubini–Study holomorphic sectional curvature normalized to four, \(s\) is arclength and the orbit lengths for elementary rotation generators are
\[
 (\sin s,\cos s,\cos 2s).
\]
Indeed the first two unit rotations have horizontal lengths \(\sin s,\cos s\). For the third the projective tangent projection subtracts the component along the representative of magnitude \(2\sin s\cos s\). Thus at \(s=\pi/6\) the intrinsic metric has lengths proportional to \((1,\sqrt3,1)\), with the order-four direction the third and short. Relabel \(e_3,e_1,e_2\) as \(i,j,k\) to match the specified lens. In the outward \(+\partial_s\) direction of \(Z_0\), the three principal curvatures before relabeling are \(\sqrt3,-1/\sqrt3,-2\sqrt3\). Their differences preclude an umbilic gluing. Multiplying the metric by a smooth positive conformal factor cannot remove the trace-free second fundamental form.

In complex-opposite orientation this homogeneous metric has \(E_+=0\) and \(E_-=12\pi^2\) on the full projective plane. One can see the vanishing from its constant holomorphic sectional curvature, whose curvature operator on primitive real \((1,1)\) forms is entirely the scalar part. The remaining integral follows from the closed signature formula. The orbit volume density is proportional to \(\sin s\cos s\cos 2s\), so \(Z_0\) through \(s=\pi/6\) uses volume fraction \(\sin^2(2s)=3/4\) and \(9\pi^2\) of the larger chirality. Any appended collar retaining this segment and producing the specified umbilic face has \(E_-(Z)\ge9\pi^2\). Since \(\tau(Z)=0\), at that new boundary APS imposes \(E_+(Z)=E_-(Z)-2\pi^2\ge7\pi^2\). On gluing, \(\chi(X)=3,\tau(X)=-1,p=0\), where \(p=b_2^+(X)\). The minus-chiral Gursky lower bound is \(12\pi^2\), already forced by signature and nonnegativity. The universal closed Yamabe estimate is weaker. Even granting an arbitrarily small positive Yamabe constant for the glued class, its plus-chiral estimate is bounded above by \(6\pi^2\) before subtracting the collar-inclusive \(E_+(Z)\ge7\pi^2\). Thus this particular appended-collar comparison cannot yield a stronger lower bound.

The opposite, conic-side Fubini–Study segment has \(E_+=0,E_-=3\pi^2\) upstairs and descends to the marked projective-plane interior. Its prescribed intrinsic face has the same nonzero trace-free curvature. The open issue for this interior is altering the face to be umbilic while retaining positive sign and sufficiently small \(E_+\). The cover calculation establishes no exclusion for arbitrary marked interiors.
