# Annular dual test and finite transition check

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Independent analytical [SP4-CUT-SEAM-E19 r1](../research-progress/handoffs/E19_REQUEST_R1.md), requested GPT-6.2 Sol/ultra, actual serving model and effort unavailable. HEAD bc2c1bbccc1d. The six frozen source hashes are those verified in [E16](E16_CAUSAL_READBACK.md). Read [B06](../notes/B06_ROUND_TRANSITION.md) SHA-256 1246d1616b0b2ced35c418952603316bed20e50418ef97ff2f534888180a133d and this request SHA-256 9ce5d368f0e2ef991ed29b5f83ce04b0f6f17acac40d21edf89de1829390c67b. Smooth oriented Riemannian cap in E19's outward-first real Hilbert–Schmidt conventions. The exact boundary switch and physical short collapsing meridian are fixed.

**Result.** The endpoint functional and every finite B06 bound, including the quantitative evenization, check. The anisotropy contribution admits an exact form as a sum of weighted nonnegative terms and an inner endpoint term. At a round umbilic inner orbit, a subthreshold cap needs that positive sum to exceed \(4-\sqrt6\), with a strictly stronger necessary inequality using the actual interval length. Biaxial annuli with this inner datum have sharp infimum \(E_+=4\pi^2\), approached as transition length tends to infinity and strictly larger cost on every finite annulus. The supplied finite positive pair has shared closed energy in \((13,13.000002)\pi^2\).

## General triaxial annulus

Let the outer annulus extend from a regular principal orbit at \(v=v_a<0\) to the marked boundary at \(v=0\). With \(k\) distinguished, normalize the product of the \(i,j\) lengths to one and then take arclength \(s\) as in E16. The cyclic order \((k,i,j)\) preserves the orientation and uses the same \(W^+\). In that gauge put \(dv=a_k\,ds\), \(y=a_k^2=1+z\), \(c=\cosh(2u)\), \(d=2\sinh(2u)\), and use primes for \(v\)-derivatives. The boundary \((1,1,\sqrt3)\) has \(z(0)=2,\ u(0)=0\). Its vanishing shape operator after normalization gives \(z'(0)=u'(0)=0\). These are annular endpoint data; the physical topology still collapses \(i\) at the bolt. Applying the checked axial computation after the cyclic permutation gives, with \(L=D^2+6D+8\),
\[
 Q=6\lambda_k^+=-Lz+H,\qquad
 H=8(c-1)+4(d^2/y+y u'^2)+12c'.
\]
The orbit volume measure is \((\pi^2/4)\,dv\) after integration in the orbit variables, giving \(E_+(W)/\pi^2\ge\int_{v_a}^0 Q^2/96\). It holds even if the core lies outside the invariant ansatz, by nonnegativity of its energy. [E16 orientation, derivative and normalization](E16_CAUSAL_READBACK.md#chiral-function-and-orientation)

For \(p(v)=e^{2v}-e^{4v}\), one has \(L^*p=0\), \(p(0)=0\), and \(p'(0)=-2\). Thus
\[
 \int_{v_a}^0 pLz=[pz'+(6p-p')z]_{v_a}^{0}=4-B_{\rm in},
 \qquad B_{\rm in}=\bigl[pz'+(6p-p')z\bigr]_{v_a}.
\]
This proves precisely \(\int pQ=-4+B_{\rm in}+\int pH\). The signed face value \(4\) follows from \(z(0)=2\); the \(p z'\) term vanishes there even without the slope condition. The latter remains part of the marked totally geodesic requirement. If \(r=e^{2v_a}\in(0,1)\), then
\[
 I_p=\int_{v_a}^0 p^2=\frac{(1-r)^3(1+3r)}{24}<\frac1{24}.
\]
Cauchy–Schwarz and \(E_+/\pi^2<3/2\) give
\[
 \left|4-B_{\rm in}-\int_{v_a}^0pH\right|<12\sqrt{I_p}<\sqrt6.
\]
Without a budget assumption the square of the left-hand side divided by \(96 I_p\) is a rigorous lower bound for \(E_+(W)/\pi^2\). In the diagonal annulus its transverse contribution \(\tfrac18\int(\lambda_i^+-\lambda_j^+)^2\) can be added to that bound, as can the nonnegative smaller-block cost on the core.

Integrating \(c'\) directly gives
\[
 \int_{v_a}^0 pH
  =-12p(v_a)(c(v_a)-1)
    +\int_{v_a}^0\!\big[(8p-12p')(c-1)+4p(d^2/y+y u'^2)\big]\,dv .
\]
The terminal endpoint is zero as \(p(0)=0\), and the inner endpoint need not vanish. The coefficient \(8p-12p'\) itself changes sign. There is also an exact nonnegative form for the bulk term. Since \(c'=du'\),
\[
 H=8(c-1)+4y(u'+d/y)^2+4c',\qquad 8p-4p'=8e^{4v}.
\]
Consequently
\[
 \int_{v_a}^0 pH=-4p(v_a)(c(v_a)-1)+\mathcal A,\qquad
 \mathcal A=\int_{v_a}^0
       \big[8e^{4v}(c-1)+4p y(u'+d/y)^2\big]\,dv\ \ge0 .
\]
With \(\widetilde B_{\rm in}=B_{\rm in}-4p(v_a)(c(v_a)-1)\), the necessary test is \(|4-\widetilde B_{\rm in}-\mathcal A|<12\sqrt{I_p}\). In particular \(\widetilde B_{\rm in}\ge4+\sqrt6\) itself rules out a subthreshold cap on that specified annulus. A round umbilic inner slice has \(z=z'=0,\ c=1\), so \(\widetilde B_{\rm in}=0\). Then \(\mathcal A\) must lie in \((4-12\sqrt{I_p},4+12\sqrt{I_p})\), and in particular \(\mathcal A>4-\sqrt6\). This is necessary even when the core has zero smaller-block energy. It gives no existence statement and assumes the actual radial annulus and marked boundary.

## Sharp biaxial bound and finite trial

On a biaxial annulus with round umbilic inner orbit, \(u=0\) and \(Q=-Lz\). The preceding identity alone gives the strict finite lower bound
\[
 \frac{E_+(W)}{\pi^2}\ge\frac{16}{96I_p}
     =\frac{4}{(1-r)^3(1+3r)}>4.
\]
To replay sharpness, extend \(z\) by zero across the real finite inner endpoint to the negative half-line. It is \(H^2\) because both jets are zero. The explicit \(z_*=4e^{2v}-2e^{4v}\) has the prescribed final jets and \(Lz_*=96p\). Thus \(L^*Lz_*=0\). Integrating against \(z-z_*\) gives zero cross term since its outer jets are zero and the terms at negative infinity decay. The norm identity is
\[
 \frac1{96}\int_{-\infty}^0(Lz)^2\,dv
 =4+\frac1{96}\int_{-\infty}^0 |L(z-z_*)|^2\,dv .
\]
A zero error would solve the homogeneous equation with zero final jets, hence \(z=z_*\), which is incompatible with the open zero tail of any finite member. These facts recover B06's strict bound independent of the inner metric.

The fixed trial keeps \(i\) collapsing on the core. With \(x=e^{-2v}\) there the profile \(y_i=(1-x)(1+3x)\) is positive for \(v>0\) and has jet \(y_i=8v+O(v^2)\). Since \(ds=dv/\sqrt{y_i}\), \(s=\sqrt{v/2}(1+O(v))\) with an analytic factor in \(v\), and inversion gives the smooth odd normalized radius \(a_i(s)=4s+O(s^3)\). Its circle has period \(\pi/2\) and both other lengths are identically one. The disk extends smoothly. The core has \(W^+=0\) since \(L(y_i-1)=0\) and the other two eigenvalues are equal. The scalar equation is \(R/2=4-y-y''/2\) on either biaxial piece. It gives \(R_i/2=3-6x+27x^2\ge8/3\) in the core and \(R_*/2=3-12x+18x^2\ge1\) on the outer profile with \(x=e^{2v}\). The latter has the exact totally geodesic boundary.

For the two tails the clamped cubic has weak derivatives bounded by \(3/2\) and \(6\), because its first derivative is continuous across the clamping points. Convolution with a nonnegative unit-integral kernel and translation preserve both bounds. The stated cutoff is zero through \(1/4\) and one from \(7/4\). On either transition interval \(\eta=e^{-2N}\) bounds the small exponential, so the unmodified bounds \((6,20,64)\eta\) follow by differentiating the quadratic polynomials in that exponential. For the product with the cutoff the respective bounds are
\[
 6\eta,\qquad (20+\tfrac32\cdot6)\eta=29\eta,\qquad
 (64+3\cdot20+6\cdot6)\eta=160\eta.
\]
Hence \(|Lz|\le382\eta<400\eta\) and \(R/2\ge3-86\eta>0\). Both modified squared lengths are positive, being convex combinations of positive squared lengths. The cutoffs expose an actual common unit round product on which changing the distinguished axis leaves the metric identical. At \(N=10\) the exact elementary comparison \(e>13/5\) and \((13/5)^5>100\) gives \(\eta<10^{-8}\). The combined transition width in the two volume-time coordinates is at most four, hence the excess energy divided by \(\pi^2\) is at most \(4(400\eta)^2/96\), discarding any deleted tail energies.

For the final evenization, \(y_*'''=32e^{2v}-128e^{4v}\) has magnitude at most \(160\) for \(v\le0\). Its second Taylor polynomial is \(3-8v^2\). Over \([-2\epsilon,0]\), Taylor gives respective bounds \((640/3)\epsilon^3,\ 320\epsilon^2,\ 320\epsilon\) for the polynomial minus the original profile and its first two derivatives. Multiplication by the cutoff complement \(1-\chi(-v/\epsilon)\) gives
\[
 |\Delta y|\le (640/3)\epsilon^3,\qquad
 |\Delta y'|\le640\epsilon^2,\qquad
 |\Delta y''|\le2560\epsilon .
\]
These improve the displayed \(215,650,3000\) coefficients and therefore validate them. For \(\epsilon=10^{-5}\), \(|\Delta Lz|\le4000\epsilon\) and \(R/2\ge1-1501\epsilon>0\). The new squared length stays positive, the face jets stay fixed, and the polynomial is even in \(v\) in a whole neighborhood of \(0\). Hence the signed proper distance is odd there and the metric is genuinely even in the proper-distance coordinate.

Since \(\sup_{\mathbb R_-}|Lz_*|\le24\), the energy increase divided by \(\pi^2\) is bounded by
\[
 \frac{4(400\eta)^2}{96}
 +\frac{2\epsilon}{96}\bigl[48(4000\epsilon)+(4000\epsilon)^2\bigr]
 <\frac{2}{3\cdot10^{12}}+\frac{1201}{3\cdot10^9}
 <10^{-6}.
\]
No floating evaluation is needed. The bounds hold with smaller \(\eta,\epsilon\), so the limit proves the stated infimum within the class. The finite versions give \(R>0\) throughout and are exactly totally geodesic and even at the boundary. Their Neumann conformal quadratic forms and the two reflected Yamabe signs are strictly positive.

## Sign and marked assembly

E16's chiral endpoint transgression computes \(E_+-E_-=-5\pi^2\) on the marked disk in the outward-first orientation. The value holds for an arbitrary smooth core with the fixed totally geodesic face. For this extension one can productize any two such metrics near the face by an invariantly defined normal collar cutoff as in B04. The cutoff is \(C^1\)-small and changes bounded second derivatives in a shrinking layer, so it preserves the curvature integrals in the limit. Glue either cap to the reversal of a reference cap with the same product face. The closed oriented manifold is the topological identity double of \(W\) and has signature zero. Its signed Weyl identity then equates the two side differences in the limit. The same conclusion follows from the product-boundary APS signature theorem and the marked \(\eta=-5/12\), since \(W\) retracts to \(\mathbb{RP}^2\) and has zero real relative signature. The primary APS statement was checked at Theorem (4-14), printed p. 66, with its isometric product hypothesis. [E16 direct sign](E16_CAUSAL_READBACK.md#chiral-function-and-orientation) · [APS I](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24) · [Marked eta](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md)

In the fixed B06 trial the exact short-axis switch is an isometry throughout the even biaxial face collar. The second cap gets the opposite orientation. Thus the two smooth reflected classes are positive, and the mixed closing is smooth on the stated standard matrix sphere, using the E11A identification. The common closed chiral energy is the sum of the two different side chiralities. It is strictly between \(13\pi^2\) and \(13.000002\pi^2\), whereas entry needs it below \(8\pi^2\). The half-sum tends to \(13\pi^2/2\) in this finite family, certifying the improved upper bound on the unrestricted marked infimum and only a class-specific lower bound. The anisotropic annular functional gives a necessary escape condition and the packet makes no further optimization. [E11A exact switch](E11A_INTEGRATION.md) · [B06](../notes/B06_ROUND_TRANSITION.md)
