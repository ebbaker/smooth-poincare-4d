# The energy budget at an actual cut

27 November 2026, for Edward B. Baker III with OpenAI assistance. Lead model identifier and effort unavailable. E08 at bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Inputs are the independently tested ledger, the marked metric estimate [E03](ETA_VARIATION.md), and the smooth rigidity result [E07](HALF_FLAT.md).

Let a smooth closed oriented homotopy four-sphere be cut into two compact pieces with common boundary \(Y\). Orient \(Y\) outward from the first piece \(V\). Each side has signature zero: intersections of absolute two-cycles in its interior can be computed in the closed manifold, whose second homology vanishes. Put
\[
 D=12\pi^2\eta(Y,h)+\mathcal T(Y),\qquad
 J=\|B^\circ\|_{L^3}\,\|\operatorname{symcurl}B^\circ\|_{L^{3/2}},
 \qquad T=4\pi^2 .
\]
Here \(\operatorname{symcurl}\) means the symmetric part of the row curl of the parent formula. Only it pairs with the symmetric tensor \(B^\circ\); it is the magnetic Weyl block in the conventions of the [replay](../reviews/PARENT_SECTION_3.md). Thus \(|\mathcal T|\le J\) in every conformal gauge with both factors invariant. The unsigned Hölder product with the full row curl is a valid upper bound computed in a chosen gauge.

Write \(D=E_+(V)-E_-(V)\) by the ledger. If \(D\ge0\), the exact deficit is
\[
 e-|D|=E_+(V')+E_-(V).
\]
For \(D\le0\) interchange the sides. Consequently \(e\ge |D|\ge 12\pi^2|\eta|-J\), and equality in the first inequality forces the two corresponding wrong-chirality blocks to vanish on the respective interiors. For a *smooth* connected metric E07 propagates both vanishings; equality therefore occurs only in the conformally flat case. There is no positive uniform gap asserted. For piecewise smooth matching the elementary nonnegative-sum identity still follows when each smooth piece satisfies the ledger and the endpoint data match with opposite orientations. Equality there does not invoke smooth propagation.

## Marked neighbourhoods

In a marked scale-one gauge around the unit round quotient \(h_0\) of order \(q\), let \(\delta=\max_{0\le j\le2}\sup |(\nabla^0)^j(h-h_0)|_{h_0}\le1/2\) and \(K_q=(3\sqrt2+\sqrt3)/(2q)\). E03 gives \(|\eta-\eta_0|\le K_q\delta^2\). The following budget measures eta errors in dimensionless units:
\[
 b=K_q\delta^2+\frac{J}{12\pi^2},\qquad
 \frac eT\ \ge\ 3\bigl(|\eta_0|-b\bigr).
\]
For a model margin \(m=|\eta_0|-2/3>0\), all \(b\le m\) are excluded from \(e<2T\). For example take \(\delta\le\min(1/2,\sqrt{m/(2K_q)})\) and \(J\le6\pi^2m\). If \(|\eta_0|=2/3\), the exact datum is excluded; to obtain a two-sided neighbourhood from this estimate one needs a fixed gap in the energy budget or a one-sided sign estimate. For \(e<T\) replace \(2/3\) by \(1/3\).

| Round left action | \(|\eta_0|\) | Umbilic ledger lower bound in units of \(T\) | \(m\) for \(e<2T\) |
| --- | ---: | ---: | ---: |
| Trivial or cyclic order 2 | 0 | 0 | −2/3 |
| Cyclic order 3 | 2/9 | 2/3 | −4/9 |
| Cyclic order 4 | 1/2 | 3/2 | −1/6 |
| Cyclic order 5 | 4/5 | 12/5 | 2/15 |
| Quaternion group | 3/4 | 9/4 | 1/12 |
| Binary tetrahedral group | 49/36 | 49/12 | 25/36 |

For a cyclic left action the magnitude is \((q-1)(q-2)/(3q)\): differentiate the logarithm of the sine product to obtain \(\sum_{k=0}^{q-1}\csc^2(x+k\pi/q)=q^2\csc^2(qx)\); subtract the singular term at zero and then \(q-1\) to sum cotangent squares. For the quaternion group the six noncentral, nonidentity contributions are one. For the binary tetrahedral group add eight contributions of three and eight of one third to those six; the central involution contributes zero. For more general free linear actions use the *two signed angles* in the signature fixed-point formula, \(-q^{-1}\sum_{g\ne1}\cot(\theta_{1,g}/2)\cot(\theta_{2,g}/2)\), with each pair measured in an oriented splitting of the ambient four-space. Absolute values may be taken only after summation. See the [primary source check](../references/PRIMARY_20261127.md).

## Realizability of the numerical rows

The lower bounds for cyclic orders three and four cannot be the least energies of actual cuts of a homotopy four-sphere. Indeed any rational homology sphere \(Y\) embedded as a separating cut in an integral homology four-sphere has \(H_1(Y;\mathbb Z)\cong A\oplus A\) for a finite abelian group \(A\). In the integral Mayer–Vietoris sequence \(H_2(Y)=0\) (three-dimensional duality) and \(H_2(M)=H_1(M)=0\) give \(H_2(V)=H_2(V')=0\) and an isomorphism \(H_1(Y)\to H_1(V)\oplus H_1(V')\). Its first projection is surjective, with kernel isomorphic to \(H_1(V')\). By the exact sequence of \((V,Y)\) the same kernel is \(H_2(V,Y)\cong H^2(V)\cong\mathrm{Ext}(H_1(V),\mathbb Z)\cong H_1(V)\) abstractly. No nontrivial cyclic group has this form. This excludes all the nontrivial cyclic *cuts* in the table independently of the boundary metric. It leaves the quaternion example available for geometric testing. Statements about an isolated filling or abstract link must keep their own topology and signature; the displayed closed \(e\) budget is for a cut with two signature-zero sides.

The binary tetrahedral row is likewise arithmetic for this cut problem. Its group is \(Q_8\rtimes C_3\) with the order-three action cycling \(i,j,k\). In the abelianization their images coincide, and \(ij=k\) forces this common image to be trivial. The surviving quotient is \(C_3\), excluded by the same integral homology test.

For the reflected standard Pedersen double in E07, the umbilic boundary has squared Berger length ratio \(1/(1+k)\). Its boundary eta magnitude is \(\tfrac23 (k/(1+k))^2\). Both balls have signature zero and the surviving chiral energy of each ball is \(8\pi^2(k/(1+k))^2\), with opposite labels. Thus the chiral energy per sign of the weak double equals that same value and is strictly below \(8\pi^2\) for every finite \(k>0\). The third-jet jump prevents applying smooth rigidity. This computation uses the energies of the unmodified pieces.
