# GEO-E19 · Berger flux and the Euler budget of one cap

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. The [reader issue][issue] requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. Inputs were checkout `bc2c1bb`, the working [E06 germ][germ], [parent §§2–3][parent] and [LED orientation replay][ledger]. The independent calculation below was compared with the working [E16][e16] and [E17][e17] returns, which agree on both signed energies. Evidence consists of exact identities for smooth oriented Riemannian metrics.

At \(t=\sqrt{65}/4\), the signed Weyl energies of the lower and upper caps are \(-75\pi^2\) and \(+75\pi^2\). For each homology-ball cap that induces the exact E06 germ, \(4\int_V\sigma_2(A)<-67\pi^2\). The signed values already follow from the induced metric and second fundamental form. The cap identity uses the normal reflection combined with the quaternionic interchange of the short axes.

## Intrinsic and extrinsic contributions

Use the left-invariant frame of unit quaternions with \([X_i,X_j]=2X_k\) cyclically. Its round coframe \(\theta_i\) has \(d\theta_i=-2\theta_j\wedge\theta_k\) and \(\int\theta_{123}=2\pi^2\). Orient the collar by \(ds\wedge\theta_{123}\), and call the adjacent sides \(V_<\) and \(V_>\) for increasing \(s\). The lower outward normal is \(\nu=\partial_s\), the lower boundary orientation is \(\theta_{123}\), and the orthonormal coframe is \(e^1=\theta_1,e^2=\theta_2,e^3=t\theta_3\). In that coframe the lower second form is \(B=\operatorname{diag}(b,-b,0)\), using \(B(X,Y)=g(\nabla_X\nu,Y)\).

Let \(J_i v=e_i\times v\) in the oriented tangential orthonormal frame. The Koszul formula gives the Levi-Civita matrix \(\alpha=\sum_i v_iJ_i\theta_i\) with \(v=(t,t,2-t^2)\). Using \(\operatorname{tr}(J_iJ_j)=-2\delta_{ij}\) and \(\operatorname{tr}(J_iJ_jJ_k)=-\varepsilon_{ijk}\), one obtains

\[
\operatorname{tr}(\alpha\wedge d\alpha+\tfrac23\alpha^3)
=4\left(\sum_i v_i^2-v_1v_2v_3\right)\theta_{123}
=8\left(1+(t^2-1)^2\right)\theta_{123}.
\]

Use a smooth Berger path cylinder that is product near both ends, round at the lower end and stretched at the upper end. The frame extends over the cylinder, whose relative signature vanishes. With \(p_1=-(8\pi^2)^{-1}\operatorname{tr}(\Omega\wedge\Omega)\), Stokes gives \(\int p_1=-2(t^2-1)^2\) after subtraction of the round value. APS I Theorem (4.14), checked in the published text, applies to a compact oriented manifold with a product near the boundary. In four dimensions it gives \(\int p_1=3(\tau+\eta)\) with the real signature of the relative-to-absolute middle cohomology image and the eta at zero of the boundary operator on even forms. The end orientations are opposite and the round eta vanishes by an orientation-reversing round isometry. Thus the intrinsic term on the positively oriented orbit is

\[
\eta(h_t)=-\tfrac23(t^2-1)^2.
\]

The subtraction in the extending frame fixes the real value. An isolated absolute Chern–Simons integral in a polar frame does not compute it. [APS I, p. 66][aps]

For a cap with its actual collar, compare with a metric that induces the same \(h_t\) and is product near the boundary. The difference of the connections along the boundary has only the normal–tangential entries \(B_i\) and \(-B_i\), where \(B_i=b_i e^i\), \((b_1,b_2,b_3)=(b,-b,0)\). The terms linear and cubic in this difference have zero trace, while the remaining trace is \(-2\sum_iB_i\wedge(d^\nabla B)_i\). This yields the signed energy correction \(\mathcal T=\int\sum_i B_i\wedge(d^\nabla B)_i\), since \(4\pi^2p_1=(|W^+|^2-|W^-|^2)dV\) in the curvature-operator Hilbert–Schmidt convention. [Local chirality calculation][ledger]

To compute it, write \(\alpha=\sum_i a_i J_i e^i\) with \(a=(t,t,2/t-t)\). For cyclic \((i,j,k)\), the coefficient of \(e^j\wedge e^k\) in \((d^\nabla B)_i\) is \(a_j(b_k-b_i)+a_k(b_j-b_i)\). In order these coefficients are \((t-4/t)(b,-b,0)\), with no other components. Using \(dV_h=t\theta_{123}\) then gives

\[
\mathcal T=2b^2(t-4/t)\operatorname{Vol}(h_t)=4\pi^2b^2(t^2-4).
\]

On \(V_>\) both the outward normal and boundary orientation reverse. The correction form is quadratic in \(B\) so that its orientation reversal alone changes the sign of its integral. The eta changes sign as well. For any cap, the signed energy is \(E_+-E_-=12\pi^2(\tau+\eta)+\mathcal T\), using its own orientations. A four-ball has \(\tau=0\). More generally a separating embedded \(S^3\) in a smooth homotopy four-sphere bounds two homology balls by Mayer–Vietoris. The top connecting map sends the ambient fundamental class to the boundary fundamental class, and \(H_1\) and \(H_2\) of each side vanish directly. Both sides therefore have \(\tau=0\) and \(\chi=1\) without a smooth four-ball hypothesis.

| Outward side at \(t^2=65/16\), \(b^2=1/8\) | \(12\pi^2\eta\) | \(\mathcal T\) | \(E_+-E_-\) at \(\tau=0\) |
| --- | ---: | ---: | ---: |
| Lower | \(-2401\pi^2/32\) | \(+\pi^2/32\) | \(-75\pi^2\) |
| Upper | \(+2401\pi^2/32\) | \(-\pi^2/32\) | \(+75\pi^2\) |

E16 obtains the same intrinsic term by integrating the Cotton variation. E17 subtracts the round polar connection in a common quaternionic frame. Its trace polynomial differs from the round polynomial by \(2(t^2-1)^2+b^2(4-t^2)\). Multiplication by \(-4\pi^2\) gives precisely the sum above at the positively oriented boundary. Product comparison works for nonsymmetric interiors and makes the \(12\pi^2\tau(V)\) term explicit for isolated fillings of other relative signature. [E16][e16] · [E17][e17]

## The Euler identity for an individual exact-germ cap

Let \(u=(\mathbf i+\mathbf j)/\sqrt2\) and let \(\phi(q)=uqu^{-1}\). Its adjoint action sends \((\mathbf i,\mathbf j,\mathbf k)\) to \((\mathbf j,\mathbf i,-\mathbf k)\) and has determinant \(+1\). Because \(u^2=-1\), this is an involution. The E06 collar satisfies \(\phi^*h_{-s}=h_s\) as a smooth identity on the entire common collar, using \(r_1=r_2\), \(b_1=-b_2\), and \(b_3=0\). Glue a given cap to a copy with opposite orientation along \(\phi\). In the gluing chart the other copy uses \((-s,\phi(q))\). The identity for \(h_s\) gives a smooth metric, and the orientations glue because \(\phi\) is orientation preserving for the original boundary orientation. The isometry of the two interiors exchanges the two chiralities and preserves the total Weyl energy and the \(\sigma_2\) integral. Neither extension of \(\phi\) over the cap nor an isometry of the cap is required.

The resulting oriented closed manifold has Euler characteristic \(2\chi(V)\) since its boundary identification is along \(S^3\). In Chern–Gauss–Bonnet, CGY equation (0.2) uses \(A_{\rm CGY}=2A\), where \(A=\tfrac12(\operatorname{Ric}-Rg/6)\). Thus \(\sigma_2(A_{\rm CGY})=4\sigma_2(A)\), and its quarter of the four-index Weyl norm squared is the total curvature-operator norm squared. Apply the closed identity and divide by two to obtain

\[
8\pi^2\chi(V)=E_+(V)+E_-(V)+4\int_V\sigma_2(A)\,dV.
\]

For either cap with \(\chi=1,\tau=0\), the bound \(E_++E_-\ge |E_+-E_-|\) already implies \(4\int_V\sigma_2(A)\le-67\pi^2\) at the endpoint. This gives a point of negative \(\sigma_2(A)\) in each cap for any smooth extension of the exact germ, including those with no invariant interior. [Chang–Gursky–Yang, equation (0.2), p. 710][cgy]

## Continuous family and strictness

With \(\delta=t^2-4\in(0,1/16]\), E06 keeps \(c=1/16\) and uses \(b^2=c+\delta\). The same first and second forms give the lower signed energy at zero relative signature as

\[
E_+-E_-=-\pi^2\left(72+\tfrac{191}{4}\delta+4\delta^2\right),
\]

and the upper signed energy is its negative. This covers the entire named family and its exact-germ doubles. The magnitudes increase from strictly above \(72\pi^2\) to \(75\pi^2\).

For a smooth closed extension across the marked hypersurface, equality in \(e\ge |(E_+-E_-)(V_<)|\) would make \(W^+=0\) on the lower side and \(W^-=0\) on the upper side. By continuity both vanish on the central slice. The magnetic Weyl block there equals the symmetric covariant curl of \(B\) in the adopted convention and is nonzero for \(t>2\), so equality is impossible. This strict closed bound uses only the marked \(h,B\) and smoothness across the slice.

For each separate cap, the exact germ also rules out equality in \(E_++E_-\ge |E_+-E_-|\). The magnetic block has zero \(33\) entry, while the electric block has \(\mathcal E_{33}=2c/3-2t^2\). Indeed, E06 has \(\operatorname{Ric}_g=cg\) at the slice and \(K_{\nu3}=c-r_3\) since \(b_3=0\), and the Weyl component subtracts \(c/3\). Both chiral Weyl blocks have this same nonzero \(33\) entry in the bases of the local chirality calculation. Both energies are positive in each cap by continuity. At the endpoint this strengthens the cap inequality to \(4\int_V\sigma_2(A)<-67\pi^2\). [Exact second jet][germ] · [Local chirality calculation][ledger]

On the homotopy sphere \(E_+(M)=E_-(M)=e\), so the bound is a conformally invariant exclusion from \(e<8\pi^2\) for any closed realization of the prescribed datum in this family. A filling with different topology has its own signature and Euler terms. These estimates leave the first-width question for other germs open.

[issue]: ../research-progress/handoffs/ISSUE_BERGER_REPLAY_ADDENDUM_20261127.md
[germ]: ../research-progress/handoffs/E06_GERM.md
[e16]: ../research-progress/handoffs/E16_BERGER_LEDGER.md
[e17]: ../research-progress/handoffs/E17_POLAR_TRANSGRESSION.md
[parent]: ../../manuscript/cuts_of_subcritical_conformal_classes.tex
[ledger]: ../../01_chirality_ledger/reviews/PARENT_SECTION_3.md
[aps]: https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24
[cgy]: https://arxiv.org/pdf/math/0409583#page=2
