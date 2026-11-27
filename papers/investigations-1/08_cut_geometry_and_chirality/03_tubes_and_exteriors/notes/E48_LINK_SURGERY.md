# SP4-CUT-TUBE-E48 — Integral homology of the marked great-circle fillings

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance under [E48_REQUEST_R1](../research-progress/handoffs/E48_REQUEST_R1.md), baseline bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Requested setting gpt-6.2-sol/ultra. Actual model and effort are unavailable. The marked input is [E39](E39_PRISM_FILLINGS.md). The bounded integer calculation is reproduced by [e48_link_surgery.py](../numerics/e48_link_surgery.py).

For the basic slopes \(a\) and \(a+\mu\) the ordinary filled manifolds upstairs are rational homology three-spheres with different integral first homology groups. Their regular \(\Lambda\)-quotients carry isotropy of order twelve on the new core and order two on the original singular locus. The orbifold \(O(a+s\mu)\) in the equivariant four-dimensional construction has a regular new core and abelianization \(C_2\) or \(C_4\), respectively. These computations leave both nonabelian orbifold groups and the smooth types of the four-dimensional fillings open.

## 1. Coherent orientation and linking matrix

Give \(S^3\subset\mathbb H\) the orientation induced by the standard basis \((1,i,j,k)\) and the outward radial vector. The reference circle \(C\) is \(p_0e^{jx}\), where \(p_0jp_0^{-1}=n=(i+j+k)/\sqrt3\). Orient it by increasing \(x\). The positive normal orientation is left multiplication by \(e^{j\theta}\) on \(\operatorname{span}(i,k)\) after left multiplication by \(p_0^{-1}\). At \(p_0\) this makes the tangent and normal basis \((j,i,-k)\), with positive sign. Thus increasing \(\theta\) gives the positively linked meridian, and the normal push-off with constant \(\theta\) gives the ordinary zero-linking longitude \(\lambda_C\).

Each translate has the form
\[
C_{u,v}=\{q:q u q^{-1}=v\},\qquad
u=\operatorname{Ad}_B j,\quad v=\operatorname{Ad}_A n,
\]
for \((A,B)\in T^*\times_{\{\pm1\}}Q_{68}\). Give \(C_{u,v}\) the orientation \(q'=qu\). This is carried from \(C\) by the action \((A,B)q=AqB^{-1}\), and the stabilizer acts by oriented translations. The four tetrahedral vertex values of \(v\) and the seventeen right-axis values of \(u\) give all 68 links. The right axes may be indexed by \(k\in\mathbb Z/17\) with angle \(2\pi k/17\), since the original right deck index is carried to \(k=2r\bmod17\).

For linking against \(C\), let \(T,P\) be orthogonal projections in the frame left-translated by \(p_0^{-1}\) onto \(\operatorname{span}(1,j)\) and \(\operatorname{span}(i,k)\), respectively. For \(Q=p_0^{-1}q_0\) with \(q_0\in C_{u,v}\), its normal-plane image on the oriented curve is \(P Q\cos x+P(Qu)\sin x\). The degree of its argument in the positively oriented normal plane computes linking with \(C\). This is the sign of
\[
\big\langle jP Q,\ P(Qu)\big\rangle
   =\tfrac12\big(n\cdot v-j\cdot u\big).
\]
For the equality, write \(\langle jQ,Qu\rangle=n\cdot v\) as the sum of its \(T\) and \(P\) parts. The corresponding pairing \(\langle Qj,Qu\rangle=j\cdot u\) has the same \(T\) part and opposite \(P\) part. The translated formula is therefore
\[
\operatorname{lk}(C_{u,v},C_{u',v'})
=\operatorname{sign}(v\cdot v'-u\cdot u').
\]
The right side never vanishes for distinct components. In the same tetrahedral row, linking is \(+1\). In different rows \(v\cdot v'=-1/3\). For cyclic index distances \(0,\ldots,5\) the right dot product is greater than \(-1/3\), while for \(6,7,8\) it is smaller. Indeed \(\cos(10\pi/17)=-\sin(3\pi/34)>-1/3\) and \(\cos(12\pi/17)=-\sin(7\pi/34)<-1/3\).

Let \(t_s=12s-5\), and let \(J_{17}\) be the all-ones matrix and \(D\) the circulant with ones at cyclic index distance at most five. In the ordered basis by tetrahedral row and then axis index, the surgery matrix of the link with slope \(\lambda_C+t_s\mu_C\) on every component has diagonal blocks \(A=(t_s-1)I+J_{17}\) and off-diagonal blocks \(B=J_{17}-2D\). By abelianizing the link exterior the meridians freely generate and each zero-linking longitude is represented by the sum of the off-diagonal linking coefficients times the other meridians. It follows that the group \(H_1\) of the ordinary filled manifold is the integral cokernel of this symmetric matrix.

## 2. Exact ordinary homology

The equal-row and sum-zero tetrahedral subspaces over \(\mathbb Q\) give the determinant identity
\[
\det(A+3B)\det(A-B)^3
=\det((t_s-1)I+4J_{17}-6D)\det((t_s-1)I+2D)^3.
\]
This rational splitting is used only for the determinant. The local integer calculation uses the full 68-by-68 matrix and so includes the integral mixing between the tetrahedral modes.

| \(s\) | \(t_s\) | \(\det(A+3B)\) | \(\det(A-B)\) | \(\lvert H_1\rvert\) |
| --- | ---: | ---: | ---: | --- |
| \(0\) | \(-5\) | \(-11284439629824\) | \(22741148237824\) | \(2^{78}3^{16}4657^6\) |
| \(1\) | \(7\) | \(22568879259648\) | \(30531305340928\) | \(2^{73}3^{16}7^3 4079^6\) |

Both determinants are nonzero. Writing \(C_k=\mathbb Z/k\), the integral groups are
\[
\begin{aligned}
H_1(M_0)&=C_2^{64}\oplus C_{16}^2\oplus C_{64}
                     \oplus C_3^{16}\oplus C_{4657}^{6},\\
H_1(M_1)&=C_2^{64}\oplus C_4^2\oplus C_{32}
                     \oplus C_3^{16}\oplus C_7^3\oplus C_{4079}^{6}.
\end{aligned}
\]
The checker runs fraction-free elimination for the full matrix and both reduced blocks, then factors the reduced determinants. At each prime \(p\) it clears unit pivots modulo \(p^{e+1}\), where \(e\) is the determinant valuation. When the remaining block has every entry divisible by \(p\), dividing that block by \(p\) records one power on each of its eventual pivots. The sum of the exponents agrees with \(e\) for each prime. This verifies the claimed primary summands entirely with integer operations. The Smith group also shows why taking an integral direct sum from the two determinant blocks would need a separate argument at \(p=2\).

## 3. Local filled covering and the undecided group

On the boundary upstairs the lattice coordinates are \((x,\theta)\). The longitude downstairs in E39 is \(a=(\pi/6,-5\pi/6)\), and the meridian is \(\mu=(0,2\pi)\). Thus the boundary image lattice is generated by \(\lambda_C=12a+5\mu\) and \(\mu_C=\mu\). The least positive power of the filling slope \(\eta_s=a+s\mu\) that belongs to this lattice is its twelfth power. The resulting slope upstairs is primitive and is \(\lambda_C+(12s-5)\mu_C\). It can be paired with \(\mu_C\) as a longitude in the attached solid torus, just as \(\eta_s\) can be paired with \(\mu\) downstairs.

In these meridian–longitude coordinates the extension on the attached solid tori is \((z,w)\mapsto(z^{12},w)\), with smooth radial collars. In particular, \(M_s\to O(a+s\mu)\) has local branching of order twelve along the new core. The covering of the orbifold exterior already sees the original singular locus, whose index remains two. Let \(\widehat Q_s\) be the orbifold on the filled underlying base that assigns multiplicity twelve to the new core. The extended deck action realizes \(\widehat Q_s=M_s/\Lambda\) as a global quotient. The unbranched statement holds in the orbifold sense over \(\widehat Q_s\).

More generally \(\langle J^k\rangle\), \(k\mid12\), has boundary quotient lattice generated by \(ka,\mu\). The primitive lift of the base slope is \(ka+ks\mu\). The intermediate \(\Lambda^+\) and \(\Gamma\) have stabilizer intersections \(\langle J^2\rangle\) and \(\langle J^6\rangle\), respectively. The primitive slopes in their boundary tori are \(2a+2s\mu\) and \(6a+6s\mu\). If the longitudinal normal shifts are written as \(+\pi/3\) on the length-\(\pi/3\) core and \(+\pi\) on the length-\(\pi\) core, the same slopes have coefficients \(2s-1\) and \(6s-3\) relative to those longitudes. All 68 solid tori upstairs use the translated E39 primitive slope. The former intermediate receives local degree six from the full upstairs, and the latter receives local degree two. Their maps to the filled base with a regular core have local degrees two and six, respectively.

For the precise group distinction put \(G_X=\pi_1^{\rm orb}(O\setminus\nu\ell)\). The marked slope \(\eta_s\) maps to the order-twelve generator \(J^{-1}\) of its deck stabilizer, while the ordinary meridian \(\mu\) has trivial deck image. Attaching the upstairs tori kills the \(\Lambda\)-translates of the primitive lifted slopes. Consequently
\[
\begin{aligned}
\pi_1^{\rm orb}(\widehat Q_s)&=G_X/\langle\!\langle\eta_s^{12}\rangle\!\rangle,
& 1\longrightarrow\pi_1(M_s)\longrightarrow\pi_1^{\rm orb}(\widehat Q_s)
    \longrightarrow\Lambda\longrightarrow1,\\
\pi_1^{\rm orb}(O(a+s\mu))&=G_X/\langle\!\langle\eta_s\rangle\!\rangle .
\end{aligned}
\]
The second quotient also kills the deck quotient generated normally by \(J\). Indeed, after killing \(J\) the surviving generators of \(\Gamma\) satisfy \(i=j=k=ij\) and \(z=z^{-1}\). All are trivial. Thus the integral homology of the branched total space does not give a homology group of a covering of the actual orbifold with regular dual core.

## 4. Abelianization downstairs with the regular new core

The same linking matrix does give the relation downstairs by applying its row sum before filling. In orbifold homology, the exact sequence of \((O,O\setminus\nu\ell)\) gives
\[
0\longrightarrow\mathbb Z[\mu]\longrightarrow H_1^{\rm orb}(O\setminus\nu\ell)
  \longrightarrow H_1^{\rm orb}(O)\cong C_6\longrightarrow0.
\]
Indeed the orbifold classifying space of \(O\) is the Borel construction for the finite action on \(S^3\), so \(H_2^{\rm orb}(O;\mathbb Q)=0\). The removed solid torus is regular, and excision gives relative second homology \(\mathbb Z\) with boundary the meridian, and relative first homology zero. The image of \(a\) generates \(C_6\) because the left and right components of \(J^{-1}\) generate \(C_3\) and \(C_2\) in the abelianization of \(\Lambda\).

Every oriented meridian upstairs maps to \(\mu\) in downstairs abelianization. The sum of the linking coefficients in a row is \(16+3(6-11)=1\), so the longitude \(\lambda_C\) maps to \(\mu\). In the boundary lattice it maps to \(12a+5\mu\), proving \(12a=-4\mu\). Since \(6a\) lies in the infinite cyclic meridian kernel, this gives \(6a=-2\mu\) and determines the extension. Thus
\[
H_1^{\rm orb}(O\setminus\nu\ell)
=\langle a,\mu\mid 6a+2\mu=0\rangle,\qquad
H_1^{\rm orb}(O(a+s\mu))\cong C_{|2-6s|}.
\]
A meridian of an original order-two singular orbit projects to the order-two element of \(C_6\), hence is the nonzero two-torsion class \(3a+\mu\) in the exterior abelianization. In the filled group it is \((1-3s)\mu\). Killing these singular-meridian classes gives underlying manifold homology of order one and two at \(s=0\) and \(s=1\), respectively. The abelianization \(C_4\) at \(s=1\) excludes an odd-dihedral orbifold group while allowing the cyclic \(C_4\) possibility. At \(s=0\), the abelianization \(C_2\) allows either cyclic \(C_2\) or odd-dihedral possibilities. The nonabelian group after the first-power meridian relation remains to be computed before the recognition step.
