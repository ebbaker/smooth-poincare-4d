# E16 — Independent replay of the full round-fiber connection formula

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. [Frozen E16 request](../research-progress/handoffs/E16_REQUEST_R1.md), baseline `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Sol 6.2/ultra was requested. Actual model and effort are unavailable. The work is analytical. Inputs were [E10](E10_FRAMED_REPLAY.md#curvature-replay-and-full-nonabelian-functional), SHA-256 prefix `dc9bb2b62f717c12`, its [boundary consequences](E10_FRAMED_REPLAY.md#further-tests-for-an-obstruction), and the [GEO return](../notes/SWEEPOUT_RETURN.md), prefix `f00ca519c8029eec`. The incoming GEO handoffs are linked in §4.

**Disposition.** The full signed identity, including the covariant derivatives in both base directions, holds in the smooth oriented round-fiber ansatz. A normalized umbilic boundary is totally geodesic and requires both \(k_q=0\) and \(b=0\) on the boundary. The actual GEO spherical-join germ has \(K=-1\), \(D<0\), \(E_\pm=0\), and a nonzero trace-free second fundamental form.

## 1. Curvature operator

Divide the cap metric by the square of its smooth positive base-dependent fiber radius. Let \(q\) be the normalized metric of the oriented base disk, \(K\) its Gaussian curvature, and \(b=*_{q}F_A\) the \(SO(3)\) connection curvature vector in the angular-speed norm. The horizontal and vertical distributions are orthogonal. At a unit fiber point \(p\) set \(C=b\times p,\ h=b\cdot p,\ c=|C|^2\). Use a basic oriented horizontal orthonormal frame \(e_1,e_2\) and an oriented vertical frame \(e_3,e_4=p\times e_3\), with the horizontal-then-fiber orientation. Put \(\epsilon_{12}=1=-\epsilon_{21}\) and \(JU=p\times U\) for vertical \(U\). Take \(R(X,Y)=[\nabla_X,\nabla_Y]-\nabla_{[X,Y]}\) with \(\mathcal R_{ij,kl}=\langle R(e_i,e_j)e_l,e_k\rangle\), so the round unit sphere has positive sectional curvature. Each chiral energy is conformally invariant in dimension four.

The vertical bracket of basic lifts is \(-\epsilon_{ij}C\). Their transport acts by rotations, so vertical Koszul gives \(\nabla_U V=\nabla^S_U V\) for vertical fields. Koszul and torsion-freeness also give
\[
 (\nabla_i e_j)^V=-\tfrac12\epsilon_{ij}C,\qquad
 \nabla_U e_i=\tfrac12\langle C,U\rangle\epsilon_{ij}e_j,\qquad
 \nabla_i U=\nabla_U e_i+[e_i,U].
\]
The horizontal part of \(\nabla_i e_j\) is the lifted base connection. In \(R(e_1,e_2)e_2\), the vertical part of \(\nabla_1e_2\) contributes \(-c/4\) to the horizontal sectional curvature and the vertical bracket contributes \(-c/2\). Thus \(\mathcal R_{12,12}=K-3c/4\). The totally geodesic fiber has \(\mathcal R_{34,34}=1\), and components with one horizontal and three vertical slots vanish by total geodesy. Along the fiber the horizontal normal connection has form \(\tfrac12 C^\flat J_H\), where \(J_He_1=e_2\). Since \(\nabla_U^S C=hJU\), one has \(d_SC^\flat=2h\,dA_{S^2}\) and \(\mathcal R_{12,34}=-h\) by pair exchange.

For two mixed pairs the same identities give
\[
 \langle R(e_i,U)V,e_j\rangle
 =\delta_{ij}\frac{\langle C,U\rangle\langle C,V\rangle}{4}
  -\frac{\epsilon_{ij}}2 h\,\langle JU,V\rangle .
\]
In fact \(\nabla_i\nabla_U V\) contributes \(\tfrac12\epsilon_{ij}\langle C,\nabla^S_UV\rangle\). The term \(-\nabla_U\nabla_iV\) differentiates the coefficient \(\langle C,V\rangle\) and rotates the horizontal frame by \(\tfrac12\langle C,U\rangle J_H\). The bracket term is vertical. Thus \(\mathcal R_{13,24}=-h/2\), \(\mathcal R_{14,23}=h/2\), and \(\mathcal R_{i\alpha,i\alpha}=\langle C,e_\alpha\rangle^2/4\). The scalar curvature is \(R=2(K+1)-c/2\).

For the derivative entries choose a base geodesic frame and a connection frame with \(A=0\) at the base point. The vertical part of \(\nabla_1\nabla_2e_1-\nabla_2\nabla_1e_1\) is \((D_1b)\times p/2\), by differentiating \(C/2\) in \(\nabla_2e_1\). For \(e_2\) it is \((D_2b)\times p/2\), from differentiating \(-C/2\) in \(\nabla_1e_2\) in the subtracted term. The bracket contribution is horizontal. At that point the derivatives are covariant, with the geodesic base frame removing derivatives of its area frame. Therefore \(\mathcal R_{12,i\alpha}=-C_{i\alpha}/2\), where \(C_{i\alpha}=\langle(D_i b)\times p,e_\alpha\rangle\). This includes both base derivatives for a general connection.

## 2. Weyl blocks and integration

With \(\varepsilon=\pm1\), compress in the orthonormal basis \((12+\varepsilon34,13-\varepsilon24,14+\varepsilon23)/\sqrt2\) and subtract \(R I/12\). The trace-free Ricci part exchanges chiralities. The diagonals are \(d_\varepsilon,-d_\varepsilon/2,-d_\varepsilon/2\) with \(d_\varepsilon=(K+1-c)/3-\varepsilon h\). The transverse off-diagonal vanishes: the same-horizontal product terms cancel and the cross-horizontal terms contain \(\langle Je_\alpha,e_\alpha\rangle=0\). The other off-diagonals are \(-(C_{13}-\varepsilon C_{24})/4\) and \(-(C_{14}+\varepsilon C_{23})/4\). Hence
\[
 |W^\varepsilon|^2_{\rm HS}
 =\tfrac32d_\varepsilon^2+
 \tfrac18\left(\sum_{i,\alpha}C_{i\alpha}^2
  -2\varepsilon\,p\cdot(D_1 b\times D_2 b)\right).
\]
The determinant of the two fiber vectors is \(p\cdot(D_1 b\times D_2 b)\) because the map \(v\mapsto v\times p\) is tangential projection followed by the orientation-preserving quarter-turn \(-J\). This term is odd under \(p\mapsto-p\), as is the cross term \(h(K+1-c)\).

With \(z=|b|^2\), spherical integration gives the means \(2z/3,8z^2/15,z/3\) for \(c,c^2,h^2\), and \(2|D_A b|^2/3\) for \(\sum C_{i\alpha}^2\). In the base measure \(d\mu=dA_q/(2\pi)\) the overall factor after dividing by \(\pi^2\) is eight. The derivative coefficient is \(8(2/3)(1/8)=2/3\), and the quartic correction upon completing the first square is \((4/3)(8/15-4/9)=16/135\). Thus in each sign
\[
 \frac{E_\pm}{\pi^2}=\int_D\left[
 \tfrac43(K+1-\tfrac23 z)^2+4z+\tfrac{16}{135}z^2
 +\tfrac23|D_A b|^2\right]d\mu.
\]
A radial single-axis connection gives \(z=F^2\) and \(|D_A b|^2=(F')^2\), reproducing parent (6.3). The fiber antipodal commutes with \(SO(3)\), preserves horizontal lifts, and reverses the vertical orientation. It therefore gives an orientation-reversing isometry of the normalized cap, providing an independent proof of equality of the two chiral integrals. The energy statement persists under smooth positive conformal change.

## 3. Umbilic boundary and signed budgets

Let the boundary be the full inverse image of \(\partial D\). Write \(\nu\) for the lifted outward normal and orient the lifted tangent \(T\) by \((\nu,T)\). Koszul gives
\[
 B(T,T)=k_q,\qquad B(T,U)=\tfrac12\langle C,U\rangle,\qquad
 B(U,V)=0,\qquad |B^\circ|^2=\tfrac23 k_q^2+\tfrac12|b\times p|^2 ,
\]
where \(k_q=\langle\nabla^q_T\nu,T\rangle\) has the disk Gauss–Bonnet sign. The boundary contains each whole fiber, so umbilicity in the normalized metric is equivalent to \(k_q=0\) and \(b=0\) at every base boundary point. It is then totally geodesic. Conformal invariance of the umbilic condition gives the same test in any member of the cap class.

Disk Gauss–Bonnet gives \(D=\int K\,d\mu=1-(2\pi)^{-1}\oint k_q\,d\ell_q\). The signed energy is \(16D/3\) plus the integral of
\[
 \tfrac43(K-1-\tfrac23z)^2+\tfrac49z+\tfrac{16}{135}z^2+
 \tfrac23|D_A b|^2
\]
in units of \(\pi^2\). An umbilic cap therefore has \(D=1\) and \(E_\pm\ge(4/3)T\) in the round-fiber ansatz, where \(T=4\pi^2\). Equality gives \(K=1,\ b=0\), with the flat connection trivial up to disk gauge. The base is then a hemisphere. Its geodesic boundary admits smooth reflection, since the normal-geodesic Jacobi field has its initial derivative zero and solves the curvature-one Jacobi equation. The double is a simply connected complete surface of curvature one, and the seam in the round double is a great circle. The trace \(b=0\) gives the Dirichlet input for the derivative budget via \(|d|b||\le |D_A b|\) and the Rayleigh quotient. This condition allows nontrivial lifted holonomy and supplies no uniform Dirichlet lower bound over varying bases.

The boundary antipodal reverses orientation and is an isometry of the normalized boundary metric. It anticommutes with the odd signature operator because it reverses the Hodge star and commutes with \(d\). The nonzero spectrum is symmetric and \(\eta(0)=0\). The operator here is the operator on even forms in Atiyah–Patodi–Singer, *Spectral asymmetry and Riemannian geometry I*, Math. Proc. Cambridge Philos. Soc. **77** (1975), 43–69, Theorem (4.14), p. 66, inspected 27 November 2026. The published signature theorem assumes a product boundary metric. This check uses the boundary operator formula directly, and the [parent ledger](../../manuscript/cuts_of_subcritical_conformal_classes.tex) gives conformal invariance of this \(\eta\). Thus an exterior with nonzero intrinsic conformal \(\eta\) cannot match this cap along the marked conformal boundary. For a marked gluing to a smooth oriented homotopy sphere, the exterior signed integrals also agree by closed signature zero and additivity. [Published APS scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24).

## 4. The physical GEO round-join germ

Read the [collapsing orbit](../../05_cuts_from_geometry/research-progress/handoffs/TO_TUBE_COLLAPSING_ORBITS_20261127.md), SHA-256 prefix `5b3ca0828eb7e434`, and the [exact germ with marking](../../05_cuts_from_geometry/research-progress/handoffs/TO_TUBE_ROUND_FIBER_GERM_20261127.md), prefix `7a0ea16b1f225102`. In \(x=(\sin r\,e^{i\psi},\cos r\,\omega)\) on the round unit \(S^4\), the metric is \(dr^2+\sin^2r\,d\psi^2+\cos^2r\,g_{S^2}\). At \(0<r_0<\pi/2\), the cap is \(D^2\times S^2\) in \((\sin r\,e^{i\psi},\omega)\) and the exterior is \(S^1\times D^3\) in \((e^{i\psi},\cos r\,\omega)\). Their product angles agree at the face, with opposite outward normals. The meridian varies \(\psi\) at fixed \(\omega\), bounds the disk in the cap, and generates \(\pi_1\) of the exterior. Both round signed energies vanish on both pieces.

Dividing by \(\cos^2r\) on the cap and near its face gives \(s=\operatorname{artanh}(\sin r)\), \(\sinh s=\tan r\), and \(\cosh s=\sec r\). The normalized cap is exactly \(ds^2+\sinh^2s\,d\psi^2+g_{S^2}\). Here \(K=-1\), the connection is trivial in the marked frame, \(a=\sinh s\), \(a'(0)=1\), and \(a'(s_0)=\sec r_0>1\). Consequently \(D=1-\cosh s_0<0\). The signed energy integrand in §2 vanishes. In the completed estimate the negative \(16D/3\) is canceled by the square term \((16/3)\int d\mu\), because \(\int d\mu=\cosh s_0-1\). The lower bound supplies no positive cost. The division can be extended to a smooth positive factor on the compact manifold by making it constant near \(r=\pi/2\).

The principal curvatures for the physical increasing normal direction are \((\cot r,-\tan r,-\tan r)\). They give \(H=\cot r-2\tan r>0\) on \(0<r<\arcsin(1/\sqrt3)\), and \(|B^\circ|^2=(2/3)(\cot r+\tan r)^2\sim 2/(3r^2)\) as \(r\downarrow0\). The normalized curvatures are \((\coth s,0,0)\), in agreement with §3 for \(b=0\) and \(k_q=a'/a\). The normalized derivative of \(a\) is positive toward the exterior. The parent acute-angle spherical exterior has derivative \(-(\ell/2\pi)\cot\theta<0\) in the same cap-to-exterior direction. The actual collapsing orbit is nonumbilic already on the round model. The general sweepout exterior question still requires the hypotheses of its own exterior estimate.
