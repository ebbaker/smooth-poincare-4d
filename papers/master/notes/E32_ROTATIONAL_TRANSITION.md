# SP4-MASTER-E32 · A marked two-face rotational transition

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded B02 execution under [E32 revision 1](../research-progress/handoffs/E32_ROTATIONAL_TRANSITION.md), with GPT-6.2 Sol/ultra requested. Actual serving model and reasoning effort unavailable to this worker. Checked frozen HEAD `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`, [E29](E29_GAUSS_DEFICIT.md) SHA-256 `f00929b135fd96604c5870029a02c6b94ef761e42cff48496ef4ab55cb111140`, and [E23](E23_IMMERSION_ENTRY.md) SHA-256 `e1e3245bd95e40a4c4a63ace2f7cf41a02be44fc50773fdc4294a1a14e028b06` as specified in [E28](../research-progress/handoffs/E28_IMMERSION_AUDIT.md). Evidence is an exact rotational model, a smooth two-face comparison, and a conditional global sign test for supplied full sides.

## Complete equality bridge

Write \(F(s,\theta)=(r(s)\theta,z(s))\) in oriented \(\mathbb R^4\times\mathbb R\), with \(s\) arclength, \(\theta\in S^3\), \(r'=\cos\phi\), and \(z'=\sin\phi\). Choose the normal \(\nu=(-\sin\phi\,\theta,\cos\phi)\) and orient the domain compatibly. With \(A=-d\nu\) in the immersed tangent plane the principal curvatures are

\[
p=\phi',\qquad q=\frac{\sin\phi}{r}\quad\text{with multiplicity three},
\qquad g=ds^2+r^2g_{S^3},\qquad dV_g=r^3ds\,d\sigma_3.
\]

Indeed \(F_{ss}=\phi'\nu\) and the ambient angular acceleration of a unit tangent along the radius-\(r\) orbit has radial component \(-\theta/r\). The Gauss sectional eigenvalues are \(pq\) and \(q^2\), three of each. Each opposite-pair sum in the chiral Weyl formula is \(pq+q^2\), so \(W^+=W^-=0\) for the entire rotational class. Its scalar curvature and trace-free shape density are

\[
\operatorname{Scal}_g=6q(p+q),\qquad |A^\circ|^2=\tfrac34(p-q)^2.
\]

The equality ratio \(p=-q/3\) from E29 gives \(\phi'=-\sin\phi/(3r)\). With waist data \((r,z,\phi)=(r_0,0,\pi/2)\) at \(s=0\), the ODE is smooth around the waist and \(r''(0)=1/(3r_0)>0\), \(z'(0)=1\). It has the first integral \(r^{1/3}\sin\phi=r_0^{1/3}\) and hence

\[
r=r_0\sin^{-3}\phi,\qquad \frac{ds}{d\phi}=-3r_0\sin^{-4}\phi,
\qquad 0<\phi<\pi.
\]

The two endpoint integrals of \(|ds/d\phi|\) diverge. The metric on \(\mathbb R\times S^3\) is complete by \(r\ge r_0>0\), and the immersion is embedded since \(z'>0\) and each orbit is embedded. Uniqueness gives \(r(-s)=r(s)\), \(z(-s)=-z(s)\), \(\phi(-s)=\pi-\phi(s)\). This equality model is the rotational \(H_3=0\) family in dimension four, since its third elementary symmetric curvature is \(q^3+3pq^2=0\). The first integral is also the \((n,k)=(4,3)\) case of Palmas's equation (7). [Palmas, *Complete rotation hypersurfaces with \(H_k\) constant in space forms*, 1999, §1.2.1 and Theorem 2](https://www.maths.tcd.ie/EMIS/journals/em/docs/boletim/vol302/v30-2-a2-1999.pdf) · [E29 equality ratio](E29_GAUSS_DEFICIT.md)

Set \(\omega_3=|S^3|=2\pi^2\), \(\omega=|S^4|=8\pi^2/3\), \(J=\int(\!-\det A)_+dV_g\), and \(B=\|A^\circ\|_{L^4(g)}^2\). The determinant is everywhere negative, with \(-\det A=q^4/3\). Also \(\operatorname{Scal}_g=4q^2\), \(D=|A^\circ|^4/6=(8/9)(-\det A)\), and

\[
J=\omega_3\int_0^\pi\sin^3\phi\,d\phi=\omega,
\qquad B^2=\frac{16}{3}\omega=\frac{128\pi^2}{9}.
\]

Here the integrals run over the complete bridge and are constant under ambient dilation. The endpoints have asymptotically horizontal tangent planes, with the normal tending to opposite axial directions. Their heights themselves diverge. On the upper half let \(a(r)=(r_0/r)^{1/3}\) and \(Z(r)=z(s(r))\). Then \(Z'=a/\sqrt{1-a^2}\). The integrable inverse square root at the waist agrees with the smooth arclength description. For large \(r/r_0\) expansion gives

\[
Z(r)=\tfrac32 r_0^{1/3}r^{2/3}+\tfrac12 r_0\log(r/r_0)+O(r_0).
\]

The lower height is \(-Z(r)\). For a unit height direction \(u=(v,b)\) with \(|v|>0\), both inverse Gauss points on the ideal bridge have \(r=r_0|v|^{-3}\). For any fixed \(|v|\ge c>0\) they lie at \(r,z=O_c(r_0)\) and their linear critical values are \(O_c(r_0)\). Only the two normal caps \(|v|\lesssim(r_0/R)^{1/3}\) reach the changing ends at \(r\ge R\).

## Flat end germs and the exact total cost

Fix \(R/r_0\) large and write \(\eta=(r_0/R)^{1/3}\). Keep each original arm for \(r\le R\). On \([R,2R]\) replace \(a\) by \(a_\pm(r)=a(r)\chi_\pm(r/R)\), for smooth nonincreasing cutoffs \(0\le\chi_\pm\le1\), equal to one near one and zero near two. Define the outward graph heights by

\[
Z_\pm(r)=Z(R)+\int_R^r\frac{a_\pm(u)}{\sqrt{1-a_\pm(u)^2}}\,du,
\qquad F_\pm(r,\theta)=(r\theta,\pm Z_\pm(r)).
\]

By extending \(Z_\pm\) as constants for \(r\ge2R\), these formulas match the entire lower and upper first jets, and all higher jets, of the marked plane collars \((r\theta,h_\pm)\), where \(h_+=Z_+(2R)>0\) and \(h_-=-Z_-(2R)<0\). In outward radial coordinates their derivative is \((\theta,dr+r,d\theta,0)\). The planes are parallel, with their marked centers on the common axis and opposite oriented normals. At fixed \(r_0,R\), the two cutoff choices independently realize any two absolute heights interior to \((Z(R),Z(2R))\). To see this, concentrate the decay close to the inner or outer radius to approach each endpoint, then interpolate the cutoffs and use continuity. The estimates below are uniform for fixed cutoff profiles, or for profiles chosen in bounded \(C^1\) families. A translation and dilation can fit any specified positive plane separation when the face radii may be chosen accordingly. The supplied side germs must have compatible centered plane coordinates, tangent orientations, and collar widths. A common rigid motion carries the model to those coordinates. Fixed face radii and independently prescribed heights outside this range are extra matching data.

On either arm, in the global normal orientation, \(p=a_\pm'\), \(q=a_\pm/r\), and the radial volume factor is \(r^3/\sqrt{1-a_\pm^2}\). Thus the exact negative determinant mass on each replacement band is

\[
J_\pm(R,2R)=\omega_3\int_0^\eta\frac{u^3}{\sqrt{1-u^2}}\,du
=\omega_3\left(\tfrac23-\sqrt{1-\eta^2}+\tfrac13(1-\eta^2)^{3/2}\right).
\]

Monotonicity makes the determinant nonpositive and this is exactly the negative mass of the removed infinite tail on that side. The planar extension has zero curvature. Hence the entire modified bridge has the same \(J=\omega\) and signed determinant \(-\omega\). More generally any smooth rotational profile with \(r>0\) between the two outward flat faces has this signed determinant integral: integrate \(\phi'\sin^3\phi\) from \(\cos\phi=-1\) on the lower outward end (inward along the oriented parameter) to \(\cos\phi=1\) on the upper outward end, using the primitive \(-\cos\phi+\cos^3\phi/3\). Its negative part therefore costs at least \(\omega\) even if the angle reverses within the bridge.

On each band \(|p|+|q|\le C\eta/R\), while its volume is \(O(R^4)\). Each replaced ideal tail has \(B^2\) cost \((16/3)J_\pm(R,2R)=O(\eta^4)\). Combining both corrected ends yields

\[
B^2_{\rm bridge}=\frac{128\pi^2}{9}+O(\eta^4),\qquad
E_+=E_-=0,\qquad
\int (\operatorname{Scal}_{g})_-^2\,dV_g=O(\eta^4).
\]

The change in \(B^2\) is strictly positive. On a nonconstant cutoff region with \(a_\pm>0\), \(a_\pm'=-a_\pm/(3r)+(a/R)\chi_\pm'\) differs from the equality ratio of E29. The integrated deficit is therefore strictly larger than \((8/9)J\) while \(W^\pm=0\). This is a total two-band estimate with constants fixed before \(R/r_0\) grows. The plane separation has size \(R\eta\), with \(h_+-h_-\) between \(2Z(R)\) and \(2Z(2R)\), so its ratio to the face scale is of order \(\eta\).

The induced scalar sign must change on each arm. For any radial graph parameter, its exact formula is

\[
\operatorname{Scal}_{g}=\frac3{r^3}\frac{d}{dr}(r a_\pm)^2 .
\]

The expression differentiated drops from \((R\eta)^2\) to zero. This also forces a negative open region for a rotational transition with turns in \(r\), provided \(r>0\) and the final flat annulus is outward. In outward arclength the quantity \((r\sin\phi)^2\) has derivative \(r^3r'\operatorname{Scal}_{g}/3\). If scalar curvature were nonnegative all along the arm, this quantity would be nondecreasing in the final connected region \(r'>0\), and hence zero there. Then \(r'=1\) throughout this region, so it cannot have an interior initial endpoint with \(r'=0\) and must extend back to the positive retained value. The contradiction concerns the induced metric and a rotational exact plane match.

## Full marked sides and conformal sign

On the whole bridge the conformal multiplier \(r^{-1}\) gives \(r^{-2}g=d\tau^2+g_{S^3}\), with \(d\tau=ds/r\) and scalar curvature six. From the waist to radius \(R\) its length on each side is \(3\log\cot(\arcsin(\eta)/2)\). The flat matching bands add \(O(1)\), so between the two marked faces the total cylindrical length is \(L=2\log(R/r_0)+O(1)\). This conformal gauge keeps the Weyl integrals and does not identify the scalar curvature with the Euclidean immersion's scalar curvature.

For a conditional global sign statement, suppose two supplied closed immersed sides have positive Yamabe constants \(y_-,y_+\) and exact flat disk germs extending across the marked cut faces. Use the retained full disk exteriors and attach the bridge with equality of the plane parameterizations on buffers. Rigid motions may place independently supplied sides, and overlap of their images away from the germs is allowed for an immersion. Choose a smooth conformal factor on each punctured side equal to \(r^{-1}\) on its flat germ, giving an infinite product cylinder toward the puncture, and any smooth positive extension on its exterior. These gauges agree with the bridge on both marked faces. For a smooth test \(f\) on the joined domain use sine and cosine cutoffs \(\chi_-,\chi_+\), with \(\chi_-^2+\chi_+^2=1\) and gradients of size \(O(L^{-1})\) along the cylindrical region. Each \(\chi_\pm f\) is an actual compactly supported test on its own punctured side after identifying the exact product part, so conformal covariance gives \(Q(\chi_\pm f)\ge y_\pm\|\chi_\pm f\|_4^2\) for \(Q(f)=\int(6|df|^2+\operatorname{Scal}\,f^2)\). The localization identity and Hölder on the cylinder give

\[
Q(f)\ge \left(\min(y_-,y_+)-O(L^{-3/2})\right)\|f\|_4^2.
\]

Here the error is bounded by \(6\|\sum |d\chi_\pm|^2\|_2\|f\|_4^2\), using cylindrical volume \(O(L)\), and \(\sum\|\chi_\pm f\|_4^2\ge\|f\|_4^2\) by the triangle inequality applied to \(f^2\). A uniform positive lower bound on the two supplied constants gives a positive joined class for sufficiently large \(R/r_0\). The local positive product gauge alone supplies no inequalities on the exterior tests. [Lee–Parker, conformal Laplacian law (1.1), (2.7)](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf) · [Master localization across marked buffers](../manuscript/first_order_splice.tex)

The immersion admits exact budget addition on the partition into both full exteriors and the bridge, with flat overlaps counting zero. In particular \(E_\pm\) is the sum from the two exteriors, \(B^2\) is their sum plus \(128\pi^2/9+O(\eta^4)\), and \(J=J_-+J_++\omega\). Capping the two marked exteriors by their original flat disks leaves each of their curvature budgets equal to that of its own exterior. For two separate supplied closed sides the gluing realizes their marked connected sum. On a joined homotopy sphere the two full signed determinants must add to \(2\omega\), compensating the bridge's \(-\omega\). One bridge already saturates the strict height criterion. The model supplies a controlled two-face piece, while the smooth types, marked exterior immersions, shape budgets and Yamabe data of both full sides are inputs to its use. [E26 strict height criterion](../reviews/E26_FOUR_CRITICAL_HEIGHTS.md) · [E29 global sign and curvature thresholds](E29_GAUSS_DEFICIT.md)
