# SP4-TWA-E07A · Independent analytic replay

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E07A_REQUEST_v1.md) records the author-selected lead GPT-6.2 Astra/ultra and the configured helper GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. This reviewer authored none of the four results under review. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all ten frozen SHA-256 digests matched.

**Disposition.** The [full-trace Dirichlet branch](../notes/E08_LOCAL_DIRICHLET.md), its [local minimum and smooth-data conclusions](../notes/LOCAL_MINIMUM_AND_SMOOTH_DATA.md), the [unequal constant-trace gap](../notes/E09_UNEQUAL_TRACE_GAP.md) and the [global small-trace asymptotic](../notes/SMALL_TRACE_ASYMPTOTIC.md) pass at their stated scopes. The local solution and minimum use a neighborhood of a fixed nonzero-slope field in \(H^5\). The gap and the leading-order coefficient apply to the full admissible class for prescribed constant-ray end traces on the fixed periodic flat cylinder.

## Local Dirichlet branch on the length-two cylinder

Work on the oriented Riemannian product \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with the periodic spin structure and a unit parallel positive half-spinor \(\sigma\). Use the chirality carrying real self-dual two-forms, Clifford square \(-|X|^2\), and real parts of the Hermitian pairings. If \(c\) is Clifford contraction, then \(c^*z=-\sum_i e^i\otimes e_i\cdot z\), \(cc^*=4I\), and \(\Pi=I-c^*c/4\) projects orthogonally onto \(\ker c\). Thus \(P=\Pi d\), \(A_\xi z=\Pi(\xi\otimes z)\), \(A_\xi^*A_\xi=(3/4)|\xi|^2 I\), and \(A_{dt}z(\partial_t)=3z/4\). The last equality also follows by pairing with \(dt\otimes y\) and inserting the orthogonal projection.

Set \(A=A_{dt}\), \(b=1/200\), \(a=bA\sigma\), \(k=|a|=\sqrt{3/4}\,b\) and \(B=P+bA\). With \(\psi=e^{bt}(\sigma+w)\) the normalized action \(S=J^4\) has density \(F(w,dw)=|a+Bw|^4|\sigma+w|^{-4}\). The first derivative at zero is \(4k^2\langle a,Pv\rangle\), since \(bA^*a=k^2\sigma\) cancels the derivative of the denominator. Its integral vanishes when both traces of \(v\) vanish. Writing \(Y=Bv\) and \(s=\langle\sigma,v\rangle\), the denominator factor is \((1+2\epsilon s+\epsilon^2|v|^2)^{-2}\) along \(w=\epsilon v\), so its first two derivatives at zero are \(-4s\) and \(24s^2-4|v|^2\). The Hessian density is
\[
4k^2|Y|^2+8\langle a,Y\rangle^2
-32k^2\langle a,Y\rangle s+k^4(24s^2-4|v|^2).
\]
Apply \(2xy\le x^2+y^2\) to the mixed term to get
\(32k^2|\langle a,Y\rangle s|\le 2k^2|Y|^2+128k^4|v|^2\). Discarding the nonnegative terms yields \(2k^2|Y|^2-132k^4|v|^2\). Using \(|Pv+bAv|^2\ge |Pv|^2/2-b^2|Av|^2\), \(|Av|\le |v|\), and \(k^2\le b^2\) gives \(k^2(|Pv|^2-134b^2|v|^2)\).

For \(v\) in the real \(H^1\) space with zero trace at both ends, its extension by zero in \(t\) is \(H^1\). This follows first for fields supported away from the ends, then by cutoff and density. In a layer of width \(\epsilon\), the square-integral of \(|v|\) is bounded by \(\epsilon^2\) times the square-integral of \(|\partial_t v|\) using the vanishing trace. This controls the derivative of the cutoff. Plancherel on \(\mathbb R\times T^3\) and \(A_\xi^*A_\xi=(3/4)|\xi|^2 I\) give the exact identity \(\|Pv\|_2^2=(3/4)\|\nabla v\|_2^2\). The integral representation from one end gives \(\|v\|_2^2\le4\|\partial_t v\|_2^2\). Hence the integrated Hessian \(\mathcal H\) satisfies
\[
\mathcal H(v,v)\ge k^2(3/4-536b^2)\|\nabla v\|_2^2
\ge (7/50) k^2\|v\|_{H^1}^2,
\]
since \(3/4-536b^2=0.7366>7/10\). Its associated constant-coefficient operator \(L\) has principal symbol \(A_\xi^*(4k^2I+8a\otimes a)A_\xi\ge 3k^2|\xi|^2I\). The coefficient of \(-\partial_t^2\) is \(3k^2I+6k^2\sigma\otimes\sigma\), because \(A^*a=(3b/4)\sigma\). Its eigenvalues are \(9k^2\) along the real radial line and \(3k^2\) on its real orthogonal complement.

With \(\mathcal H\) as the equivalent Hilbert inner product on \(H^1_0=\ker(T:H^1\to H^{1/2}\times H^{1/2})\), Riesz representation gives the unique weak solution and the bound \(\|v\|_{H^1}\le 50(7k^2)^{-1}\|f\|_{(H^1_0)'}\). For \(f\in H^3\), real symmetric tangential Fourier truncation commutes with \(L\) and preserves \(H^1_0\). Apply the weak estimate to every tangential derivative of order at most four of a truncated solution. At order four move one tangential derivative from the forcing onto the test field to obtain forcing uniformly bounded in \((H^1_0)'\) by \(\|f\|_{H^3}\). Weak compactness and convergence of the truncations identify these derivatives in \(H^1\). This supplies derivatives of total order up to five with normal order at most one. In distributions the equation solves for \(\partial_t^2v\) using its invertible constant block and terms of order at most two with at most one normal derivative. Applying \(\partial_t^{q-2}\partial_x^\alpha\), \(2\le q\le5\), \(|\alpha|\le5-q\), asks for derivatives of \(f\) of total order at most three and derivatives of \(v\) of total order at most five with normal order less than \(q\). Induction yields the global \(H^5\) estimate. The weak solution already has zero trace, and every strong zero-trace solution gives the weak equation. Thus \(L:H^5\cap H^1_0\to H^3\) is an isomorphism.

For each tangential mode \(n\) let \(\lambda_n=(1+4\pi^2|n|^2)^{1/2}\). Averaging the fundamental theorem of calculus estimate over the first \(1/\lambda_n\) units of inward distance gives \(|v_n(e)|^2\le 2\lambda_n\|v_n\|_2^2+2\lambda_n^{-1}\|\partial_t v_n\|_2^2\) at either face \(e\). Weighting by \(\lambda_n^{2m-1}\) and summing gives the \(H^m\) trace to \(H^{m-1/2}\), including \(m=4,5\). The lift \(g_n\mapsto\chi(s)e^{-s\lambda_n}g_n\), with inward distance \(s\) and disjoint end cutoff supports, has \(q\)-th derivative norm squared bounded by \(C_q\lambda_n^{2q-1}|g_n|^2\) for \(0\le q\le5\). Multiplication by \(\lambda_n^{2(5-q)}\) gives the required \(\lambda_n^9|g_n|^2\). Therefore \(T:H^5\to X=(H^{9/2}(T^3,S^+))^2\) has a bounded right inverse \(E\).

In four dimensions \(H^4\) is a Banach algebra embedded into \(C^0\), as follows by reflecting with matched jets across the faces and using the Fourier \(L^1\) estimate with square-integrable weight \(\langle\xi\rangle^{-4}\). The same extension and embedding argument gives \(H^5\hookrightarrow C^2\). The fields \(w,dw\) are controlled in \(H^4\). Shrink the \(H^5\) ball to ensure \(1/2\le|\sigma+w|\le3/2\) and \(|Bw|\le k/2\). The reciprocal of \(1+2\langle\sigma,w\rangle+|w|^2\) is smooth in \(H^4\) by its local convergent geometric series. Both density partial derivatives \(F_w,F_{dw}\) take values smoothly in \(H^4\). Thus \(\mathcal E=F_w-\operatorname{div} F_{dw}\) is smooth \(H^5\to H^3\), and integration by parts identifies its zero set with fixed-trace stationarity and gives \(D\mathcal E(0)=L\). The derivative of \((\mathcal E,T)\) is inverted by \((f,g)\mapsto Eg+L^{-1}(f-LEg)\). The Banach inverse function theorem and the affine change of traces by the factors \(e^{\pm b}\) yield a smooth unique branch in an \(H^5\) neighborhood over an open \(X\) neighborhood. Positivity of \(|\psi|\) and \(|P\psi|\) there follows from the two imposed bounds. As a check on the nonlinear normal block, the principal quadratic form is at least
\[
4|\sigma+w|^{-4}|a+Bw|^2|A_\xi z|^2
\ \ge (4/27) k^2|\xi|^2 |z|^2 .
\]

## Outward covectors, minimum and smooth data

For the original traces \(q\in X\) let \(\mathcal A(q)=S[\psi(q)]\). Define \(W=|\psi|^{-4}|P\psi|^2P\psi\). It is in \(H^4\), and \(W=\Pi W\). The first variation of the normalized action integrates the terms \(4\langle W,P\eta\rangle-4|P\psi|^4|\psi|^{-6}\langle\psi,\eta\rangle\). Replacing \(P\eta\) by \(d\eta\) in the pairing gives the outward boundary term. The bulk term vanishes at the branch, and \(T(D\psi(q)[h])=h\). Thus
\[
d\mathcal A(q)[h]=4\sum_{e=\pm}\int_{T^3}\langle W(\nu_e),h_e\rangle\,dA,\qquad \nu_\pm=\pm\partial_t .
\]
The endpoint sections are in \(H^{7/2}\) and give covectors in \(X'=(H^{-9/2})^2\) by real \(L^2\) pairing. At \(\psi_*=e^{bt}\sigma\), \(W=e^{-bt}k^2a\), yielding the outward section \(\pm(9/4)b^3e^{\mp b}\sigma\) at \(t=\pm1\).

The canonical one-form on \(X\times X'\) restricts to \(d\mathcal A\) on the graph, giving exactness. Reflexivity of \(X\) identifies the canonical form \(\Omega((u,\alpha),(v,\beta))=\beta(u)-\alpha(v)\) with an isomorphism to the tangent dual. A vector \((u,\alpha)\) annihilates the graph tangent symplectically exactly when \(\alpha(v)=D^2\mathcal A(q)[v,u]\) for all \(v\in X\). The Hessian is symmetric, so this is precisely membership in the graph tangent, which is complemented by the vertical fiber. The incoming/outgoing relation negates the incoming covector and uses the reversed incoming symplectic form.

The coefficients of the second variation vary continuously in \(L^\infty\) with the zero-free first jet in the \(H^5\) ball. Therefore the integrated Hessian is continuous as an \(H^1_0\) bilinear form, by bounding each coefficient difference times the product of the test norms. On a smaller convex ball it retains \(c_b/2\) where \(c_b=7k^2/50\). Taylor's integral remainder on the fixed-trace segment from its critical point \(w\) to \(w+z\) gives \(S[e^{bt}(\sigma+w+z)]-S[e^{bt}(\sigma+w)]\ge (c_b/4)\|z\|_{H^1}^2\). This proves strict local minimality among same-trace \(H^5\) fields in this ball.

For smooth traces \(q\), their tangential translates depend smoothly on the translation parameter in \(X\). The translated fields solve the translated problem and stay in the uniqueness neighborhood for small translations by strong continuity in \(H^5\). The smooth solution map shows that every tangential derivative of the field belongs to \(H^5\), by differentiating the translated family in distributions. These derivatives are \(C^2\) on the closed cylinder. The pointwise Euler equation and the positive normal symbol express \(\partial_t^2w\) as a smooth function of the first jet and the second derivatives with at most one normal derivative. The identity extends to the faces by continuity. If every tangential derivative has \(r\) continuous normal derivatives for \(r\ge2\), differentiating the right-hand side \(r-1\) times normally and arbitrarily often tangentially uses at most \(r\) of those normal derivatives. This obtains the \((r+1)\)-st normal derivatives up to both faces, with one-sided derivatives there. Induction proves the stated smoothness.

## Unrestricted gap and small-trace result

Let \(M=[0,L]\times T^3\) be an oriented flat periodic spin cylinder of length \(L>0\) and torus volume \(V>0\), and let \(\psi_0\) be a unit parallel positive half-spinor. Prescribe traces \(a_i\psi_0\), \(a_i=e^{u_i}\), \(u_i\in\mathbb R\). Competitors are smooth up to both faces, with no zeros or with finitely many transverse interior zeros whose first jets satisfy \(P\psi=0\) there. For \(q_\psi=|P\psi|/|\psi|\) extended by zero at its zeros, the jet condition and transversality yield \(|P\psi|=O(r)\) and \(|\psi|\asymp r\), so \(q_\psi\in L^4\) and \(|P\psi|=q_\psi|\psi|\) almost everywhere. Thus \(J(\psi)=\|q_\psi\|_4\) and Hölder gives \(\|P\psi\|_2\le J(\psi)\|\psi\|_4\).

Write \(h(t)=((1-t/L)a_0+(t/L)a_1)\psi_0\), \(z=\psi-h\), \(x=\|Pz\|_2\), \(A=\|Ph\|_2\), and \(H=\|h\|_4\). The zero-trace identity above also follows directly from the flat identity \(D^2=-\Delta\), both integrations by parts having zero boundary terms on \(z\), and \(|Pz|^2=|\nabla z|^2-|Dz|^2/4\). Since \(Ph\) is parallel and \(\Pi Ph=Ph\), \(\int\langle Ph,Pz\rangle=\int\langle Ph,\nabla z\rangle=0\) by the zero traces. Consequently \(\|P\psi\|_2=\sqrt{A^2+x^2}\). The interval sine basis yields \(\|z\|_2\le(L/\pi)\|\partial_tz\|_2\). The scalar critical Sobolev estimate, localized to the product after zero extension across the ends and applied to finitely many real components, gives \(\|z\|_4\le S_{\rm Sob}\|z\|_{H^1}\) with finite \(S_{\rm Sob}\). Hence \(\|z\|_4\le Cx\) for \(C=(2/\sqrt3) S_{\rm Sob}\sqrt{1+(L/\pi)^2}\). Together these give the formalization input
\[
\sqrt{A^2+x^2}\le J(\psi)(H+Cx),\qquad
A^2=\frac{3V}{4L}(a_1-a_0)^2,\qquad
H^4=\frac{VL}{5}\sum_{j=0}^4a_0^{4-j}a_1^j .
\]
The two constants follow from \(A_{dt}^*A_{dt}=3I/4\) and integration of the fourth power of a positive affine amplitude.

**Exact statement for transfer.** For \(A>0\), Cauchy–Schwarz applied to \((H/A,C)\) and \((A,x)\) gives \(H+Cx\le\sqrt{(H/A)^2+C^2}\sqrt{A^2+x^2}\). It follows that
\[
0<\frac{A}{\sqrt{H^2+C^2A^2}}\ \le\
\inf_{\psi}J(\psi)\ \le\ \kappa |u_1-u_0|,\qquad
\kappa=\frac{\sqrt3}{2}V^{1/4}L^{-3/4}.
\]
The upper bound is realized as a trial value by \(\psi_{\rm rad}=e^{u_0+(u_1-u_0)t/L}\psi_0\), which is smooth and zero-free. If \(u_1=u_0\), the global minimum is zero and the constant \(h\) is the only field attaining it. Indeed \(J(\psi)=0\) implies \(x=0\), hence \(\nabla z=0\) and \(z=0\) by the zero traces. The inequality likewise applies if incompatible transverse zeros are included with cost \(+\infty\).

Write \(u_0=m-d/2\), \(u_1=m+d/2\), and let \(I(d)=\inf_\psi J(\psi)^4\). Multiplying fields by \(e^{-m}\) preserves the action and rescales each transverse zero jet within the compatible class, which allows any nonzero Clifford coefficient. Thus \(I\) is independent of \(m\). Then
\[
A=\sqrt{3V/(4L)}\,e^m\, 2|\sinh(d/2)|,\qquad
H^4=VL\,e^{4m}\frac{\sinh(5d/2)}{5\sinh(d/2)}
\]
with the quotient continued through \(d=0\). The two factors have expansions \(2|\sinh(d/2)|=|d|(1+d^2/24+O(d^4))\) and \(\sinh(5d/2)/(5\sinh(d/2))=1+d^2+O(d^4)\). Therefore \(A/H=\kappa |d|(1-5d^2/24+O(d^4))\) and \(\big((A/H)/\sqrt{1+C^2(A/H)^2}\big)^4=\kappa^4 d^4+O(d^6)\). The trial and the gap yield constants \(K<\infty,\delta>0\) for the fixed cylinder such that for all \(m\in\mathbb R\) and \(|d|\le\delta\),
\[
0\le \frac{9V}{16 L^3}d^4-I(d)\le K|d|^6 .
\]
This uses the diagonal minimum at \(d=0\) and holds on either side of zero.

For \(m=0\), if \(J(\psi)^4\le \kappa^4d^4\), the scalar input gives
\[
(1-\kappa^2C^2d^2)x^2
\le \kappa^2d^2H^2-A^2+2\kappa^2CHd^2 x .
\]
The first term on the right is \(O(d^4)\) and \(H\) stays bounded. Taking a smaller fixed \(\delta\) absorbs the negative term on the left and using \(B|d|^2x\le x^2/4+B^2|d|^4\) absorbs the mixed term. Thus \(x=O(d^2)\) uniformly over competitors satisfying the trial bound, and \(\|\psi-h\|_{H^1}=O(d^2)\) by the zero-trace identity and Poincaré estimate. For \(s=t/L-1/2\), the scalar amplitudes of \(h\) and \(\psi_{\rm rad}\) are respectively \(\cosh(d/2)+2s\sinh(d/2)\) and \(e^{sd}\) at \(m=0\). Taylor expansion uniformly on \(|s|\le1/2\) gives their difference and its \(t\)-derivative \(O(d^2)\). Consequently the same \(H^1\) closeness holds to \(\psi_{\rm rad}\). At \(d=0\) both comparisons reduce to the unique constant minimizer.

The unequal-trace conclusions establish the bound and asymptotic of the value, and weak-norm control of all competitors meeting the stated trial cutoff. Attainment at unequal ends and equality of the global value with the radial action there remain open at this scope. Identifying low-action competitors with the local \(H^5\) branch would require stronger information than the \(H^1\) estimate. The conclusions concern fixed flat products and use no smooth-type implication.

## Sources inspected

The frozen [canonical action note](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md) was used for comparison of its factor-\(1/4\) action with the current normalization and for the radial control. The frozen [DIR-E06](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md), [DIR-E07](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md), and [DIR-E10](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E10_20261124.md) were inspected for the jet and cost at zeros, the critical Sobolev and Hölder step, and the Clifford projection, respectively. Their closed-manifold and punctured-scale results are background to these flat product calculations.

Friedrich's published §1, (1.1) and its following paragraph, and §2, (2.2), Example 2 and Propositions 1, 2 and 6 were inspected for convention and context. Vankerschaver–Liao–Leok, arXiv:1111.0280v2, §4, Theorems 4.1–4.2, were inspected for the generating-functional pullback and isotropy with their manifold hypotheses. Biran–Cornea, Definition 2.1.1 and §4.1, were inspected for the separate strip and plane-end geometric definitions. The local graph and its maximality are proved directly above. Talenti's published p. 353, theorem and (1) with \(m=4,p=2\), supplies the Euclidean scalar inequality used in the product Sobolev estimate. [Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf) · [Vankerschaver–Liao–Leok](https://arxiv.org/pdf/1111.0280v2#page=16) · [Biran–Cornea](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf#page=2) · [Talenti](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1)
