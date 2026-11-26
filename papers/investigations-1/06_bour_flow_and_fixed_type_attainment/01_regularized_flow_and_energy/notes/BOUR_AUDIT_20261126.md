# Strict fixed-parameter Bour dichotomy

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. BFE-E01 execution packet. The activation records a selected GPT-6.2 Astra/ultra lead and GPT-6.2 Sol/ultra worker configuration. Serving telemetry was unavailable. Input checkout 4da586548b445ccfe9145c6a5671c0f7ecd433f3, activation revision 1 (SHA-256 c56c3f5c03a25f256ae395382955200d17a28b193798703422ff40987518c186), source-receipt Git blob 6522c5e25006200f9e586244faf33ea7a0c385be and F2 Git blob b27951843bab22833f9d00806cbbf9005508cea7. Primary passages checked remotely on this date include Bour arXiv:1012.0342v1, §§1–8 and the supporting parts of §9, Bahuaud–Helliwell arXiv:1407.4406v1, Theorem A and the map argument in §5, and the Streets passages below. [Activation](../../research-progress/handoffs/ACTIVATION_20261126.md) · [Source receipt](../../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) · [F2](../../../../master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature)

**Disposition.** The two output branches of Theorem 1.11 hold in the selected strict case with the proof below and the indicated imports. Bour's Proposition 2.1 has a gauge-uniqueness gap. Bahuaud–Helliwell's Theorem A supplies short-time existence and uniqueness for the same operator. The derivative summation, sign of the Yamabe bound, time-zero compactness and dissipation issues have explicit repairs. The smoothing estimates are at fixed regularization parameter.

## Equation and strict hypotheses

Let \(M\) be connected, smooth, closed and oriented, of real Riemannian dimension four. This includes the fixed smooth homotopy four-sphere of the activation. Set \(z=\mathrm{Ric}_0\), use ordinary Ricci norm and use curvature-operator Hilbert–Schmidt norms for \(W^\pm,\mathrm{Rm}\). Write \(F_W=\int(|W^+|^2+|W^-|^2)\,dV\), \(D=\int|z|^2\,dV\), and \(S=\int R^2\,dV\). Bour's \(y\) is the Yamabe constant with numerator \(\int(|\nabla u|^2+Ru^2/6)\,dV\). The master normalization has \(Y=6y\). For smooth \(g_0\) assume
\[
0<\alpha<1,\qquad y(g_0)>0,\qquad
\delta=(1-\alpha)8\pi^2\chi(M)-F_0>0,\qquad F_0=\mathcal F^\alpha(g_0).
\]
On the closed source,
\[
F=\mathcal F^\alpha=(1-\alpha)F_W+\tfrac{\alpha}{2}D
    =F_W+\tfrac{\alpha}{24}S-8\alpha\pi^2\chi(M),
\qquad
\partial_tg=P(g)=-2G(g),\quad G=\nabla F.
\]
Here \(\nabla F\) is the \(L^2_g\) gradient as a covariant symmetric tensor. [Bour, §1.2 and §3](https://arxiv.org/pdf/1012.0342v1#page=7)

## Short-time existence and uniqueness

Bour §3 gives the leading part \(\delta\widetilde\delta\mathrm{Rm}+a\Delta_B R\,g+b\nabla^2R\) with \(a=b=(1-\alpha)/6\), where \(\Delta_B=-\mathrm{tr}\,\nabla^2\). By the contracted Bianchi identities this is
\[
-\Delta_B\mathrm{Ric}+a\Delta_B R\,g+(b-\tfrac12)\nabla^2R
\]
up to polynomial terms quadratic in curvature. The adjusted symbol in Proposition 2.4 has orthogonal eigenspaces \(\mathbb R R_\xi\) and \(R_\xi^\perp\), \(R_\xi=\xi\otimes\xi-|\xi|^2g\), with eigenvalues \(-\tfrac{\alpha}{2}|\xi|^4\) and \(-\tfrac12|\xi|^4\), respectively, in this dimension. Thus the adjusted metric equation is strongly parabolic. The gauge vector field \(V(g,g_0)\) is natural under simultaneous pullback of the evolving and reference metrics. In the reverse direction of Proposition 2.1, pulling back the ODE for \(-V(g,g_0)\) yields \(V(\psi^*g,\psi^*g_0)\). The adjusted equation requires \(V(\psi^*g,g_0)\). The equality used in that proof needs an additional argument. The forward construction from the adjusted equation by an ODE uses only naturality of \(P\) and is valid. [Bour, Propositions 2.1, 2.3–2.4 and §3](https://arxiv.org/pdf/1012.0342v1#page=9)

Use Bahuaud–Helliwell, Theorem A, equation (4), directly. Their Laplacian is \(\Delta_{\rm BH}=\mathrm{tr}\,\nabla^2=-\Delta_B\), and the operator above is their \(k=1,\ c=1,\ a_{\rm BH}=-(1-\alpha)/6,\ b_{\rm BH}=(2+\alpha)/6\), with admissible polynomial natural lower-order tensor. In particular \(a_{\rm BH}>-1/6\), \(c>0\), and the smooth compact data satisfy the theorem. This gives a unique smooth short-time solution and uniqueness on overlaps by restarting with the common metric, hence a unique maximal solution. Their uniqueness proof solves a parabolic equation on maps. With Bour's gauge the same repair uses \(\partial_t\psi=-d\psi\,V(\psi^*g,g_0)\), \(\psi(0)=\mathrm{id}\), for any given geometric solution \(g\). The pullback metric satisfies the required fixed-reference adjusted equation. At \(\mathrm{id}\) the order-two part of the change in Bour's connection difference vector \(\gamma\) is \(-\Delta_B X/2\) for map variation \(X\). The scalar gradient term is first order in the map by naturality. With \(V=-\Delta_B\gamma+\tfrac{2(b-a)-1}{4}\nabla R\), the map equation has principal part \(-\Delta_B^2 X/2\). Strong parabolicity near the identity yields a local smooth diffeomorphism solution. Uniqueness for the adjusted metric then supplies a common vector field for the inverse-map ODE. [Bahuaud–Helliwell, Theorem A, eq. (4) and §§5.2–5.3](https://arxiv.org/pdf/1407.4406#page=2) · [Journal record](https://doi.org/10.1112/blms/bdv076)

## Quantitative positivity, curvature energy and noncollapse

The gradient definition gives
\[
\frac{dF}{dt}=-2\|G(g(t))\|_{2,g(t)}^2,\qquad
\int_{t_0}^{t_1}\|G(g(t))\|_{2,g(t)}^2\,dt
   =\tfrac12\bigl(F(g(t_0))-F(g(t_1))\bigr).
\]
The integrated identity in §8 is missing \(1/2\). Since \(F\ge0\), the dissipation integral is finite over the maximal interval. Scale invariance also gives \(\int_M\operatorname{tr}G\,dV=0\), so the source volume is constant. The two expressions for \(F\) imply \(F_W\le F_0/(1-\alpha)\), \(D\le2F_0/\alpha\), and \(S\le24(8\pi^2\chi(M)+F_0/\alpha)\). The sum \(F_W+D/2+S/24\) bounds the full curvature integral by the curvature decomposition. [Bour, §§1, 3 and 8, equations (3)–(5)](https://arxiv.org/pdf/1012.0342v1#page=29)

Lemma 4.5 gives \(y(g(t))^2\ge 2\delta/3\). The sign of \(y\) agrees with that of the lowest eigenvalue of \(\Delta_B+R/6\) on the closed source. A positive eigenvalue gives coercivity by combining its \(L^2\) bound with the gradient bound and the ordinary Sobolev inequality. At a negative or zero eigenvalue use its eigenfunction and the sign of the quadratic form. The lowest eigenvalue varies continuously along the smooth metric path by its Rayleigh quotient. A sign change would give \(y=0\) at an intermediate time. Thus \(y(g(t))\ge y_0:=\sqrt{2\delta/3}\) throughout. In the master convention this is \(Y^2\ge24\delta\) with \(Y>0\). [Bour, Lemma 4.5 and §8](https://arxiv.org/pdf/1012.0342v1#page=19)

In a bounded-curvature family with \(y\ge y_0>0\), let \(|R|\le C_R\). The Yamabe test inequality implies
\[
y_0\|u\|_4^2\le\|\nabla u\|_2^2+(C_R/6)\|u\|_2^2.
\]
For \(r\le1\) apply this to the distance cutoff equal to one on \(B_x(r/2)\), zero outside \(B_x(r)\), with Lipschitz constant \(2/r\). Put \(A_x(r)=r^{-4}\mathrm{Vol}(B_x(r))\). Then \(A_x(r)\ge c\,A_x(r/2)^{1/2}\), with \(c=y_0/[4(4+C_R/6)]\). Iterating and using \(A_x(r/2^k)\to\omega_4\) on each smooth metric gives \(A_x(r)\ge c^2\) uniformly. The curvature bound and unit-ball volume bound imply a uniform positive injectivity radius by Lemma 5.4. This makes the locality in Proposition 5.6 explicit. Both \(y\) and the full \(L^2\) curvature norm are scale invariant in dimension four. The scalar supremum bound is controlled by the full curvature supremum at the scale used. The cutoff argument applies directly to flow slices. [Bour, Propositions 5.2, 5.3 and 5.6 and Lemma 5.4](https://arxiv.org/pdf/1012.0342v1#page=22)

## Smoothing and continuation

The integral estimate here is Bour's Proposition 6.1 and Lemma 6.2 on closed source manifolds. Let
\[
\mathcal R_k=\int|\nabla^k\mathrm{Rm}|^2\,dV
     +\frac{a}{\alpha}\int|\nabla^kR|^2\,dV .
\]
The full-curvature derivative identity has leading contribution \(-\|\nabla^{k+2}\mathrm{Rm}\|_2^2+\tfrac a2\|\nabla^{k+2}R\|_2^2\). The scalar identity has leading contribution \(-\alpha\|\nabla^{k+2}R\|_2^2\). The weighted sum gives
\[
\frac{d}{dt}\mathcal R_k+\tfrac{\alpha}{2}\mathcal R_{k+2}
   \le C(k,\alpha)\|\mathrm{Rm}\|_\infty^{k+2}\mathcal R_0 .
\]
The cubic and quartic errors are controlled by integration by parts, tensor interpolation and Young's inequality as in Proposition 9.15. The proof of Corollary 9.14 interchanges the two exponent parameters for Proposition 9.12. Use \(1/(k+4)\) for the undifferentiated norm and \(1/2\) for the highest derivative. With \(m=k+2\), those parameters satisfy the interpolation relation for both errors. For the quartic term at \(k=0\) use the \(L^4\) product bound directly. [Bour, Proposition 6.1, Lemma 6.2 and §§9.2–9.3](https://arxiv.org/pdf/1012.0342v1#page=24) · [Proposition 9.12 and Corollary 9.14](https://arxiv.org/pdf/1012.0342v1#page=38)

On a slab with \(\|\mathrm{Rm}\|_\infty\le K\), rebase time at its left endpoint. In \(f_k(s)=\sum_{j=0}^k(\alpha s/2)^j\mathcal R_{2j}(s)/j!\), the power of \(K\) in the \(j\)-th differential error is \(2j+2\). The proof of Theorem 1.5 prints \(j+2\). The corrected sum gives \(f_k'\le C(k,\alpha)K^2(1+K^2s)^k f_k\). On each fixed-length slab this bounds the even \(L^2\) curvature derivatives at times bounded away from the left endpoint in terms of \(k,\alpha,K\), the slab and the full \(L^2\) curvature at entry. Odd derivatives follow by integration by parts. The uniform scalar \(H^1\)-to-\(L^4\) inequality and Kato give \(L^4\) bounds for curvature derivatives. Applying the same inequality to \(|U|^2\) bounds \(\|U\|_8\) from the \(L^4\) bounds on \(U,\nabla U\). Apply Proposition 9.16 with \(n=4,q=8,m=2,p=\infty\) to \(|\nabla^k\mathrm{Rm}|\) to obtain the pointwise derivative bounds. This also bypasses the inconsistent Sobolev exponents between the displayed statement and the even-dimensional proof of Proposition 9.21. The coefficients \(a/\alpha\) and \(\alpha/2\) in the weighted estimate explain its fixed-parameter scope. [Bour, proof of Theorem 1.5, §9.4 and proof of Theorem 1.7](https://arxiv.org/pdf/1012.0342v1#page=25)

At a finite candidate endpoint with bounded supremum curvature, the same estimates bound \(\nabla^kP(g(t))\) for all \(k\) away from initial time. Integrating \(\partial_tg=P(g)\) gives uniform equivalence to a fixed earlier metric. The connection evolution
\[
\partial_t\Gamma^k_{ij}=\tfrac12g^{k\ell}(\nabla_iP_{j\ell}+\nabla_jP_{i\ell}-\nabla_\ell P_{ij})
\]
controls the connection difference to the fixed metric. Inductively differentiating this equation in the fixed background bounds every derivative of that difference. These bounds convert the covariant bounds on \(P\) to fixed-background \(C^k\) bounds. Integrating \(P\) then gives a smooth positive-definite terminal metric, from which the short-time theorem extends the flow. This justifies the continuation step of Theorems 1.7–1.9 in the present class. [Bour, §§7–8](https://arxiv.org/pdf/1012.0342v1#page=27)

## The two outputs

**Bounded curvature.** The maximal time is infinite by continuation. Apply the smoothing estimates on fixed-length preceding windows. The uniform full-curvature integral and Yamabe bounds give uniform pointwise curvature-derivative bounds. Finite dissipation gives a sequence \(t_i\to\infty\) with \(\|G(g(t_i))\|_2\to0\). Hamilton's pointed compactness theorem in Bour's Theorem 7.1 gives a complete smooth limit. Its volume is at most the source volume by exhaustion, and the uniform unit-ball volume lower bound passes to the limit. A complete noncompact manifold with such a uniform bound has infinite volume by disjoint ball packing. Thus the limit is compact. Its comparison embeddings are eventually defined on the entire compact connected limit. They are onto the connected source \(M\) since their image is open and closed. The limit is smooth on the same type, with volume equal to source volume and with the orientation induced by the diffeomorphisms. Smooth convergence and the vanishing dissipation along the selected times give \(G(g_\infty)=0\). The positive Yamabe bound transfers by testing pullbacks. The trace identity below gives constant scalar curvature, which is positive by the Yamabe inequality with \(u=1\). [Bour, Theorem 7.1, proof of Theorems 1.9 and 1.11, Lemmas 8.1–8.2](https://arxiv.org/pdf/1012.0342v1#page=27)

**Unbounded curvature.** Let \(T_{\max}\in(0,\infty]\) be the maximal time and \(Q(t)=\|\mathrm{Rm}(g(t))\|_\infty\). Smoothness on compact time intervals implies \(\limsup_{t\to T_{\max}}Q(t)=\infty\). Take first hitting times \(t_i\) of increasing levels \(\lambda_i>Q(0)\) tending to infinity. Continuity gives \(t_i\to T_{\max}\) and \(Q(t)\le\lambda_i\) for \(t\le t_i\). Choose a maximizing point \(x_i\) at \(t_i\) and set
\[
h_i(s)=\lambda_i g(t_i+s/\lambda_i^2).
\]
For large \(i\), these flows exist on \([-2,0]\), satisfy the same equation, have \(\|\mathrm{Rm}(h_i)\|_\infty\le1\) and have \(|\mathrm{Rm}(h_i(0))|(x_i)=1\). Scale invariance gives the same \(y_0\) and full curvature energy bound. Smoothing and noncollapse supply all curvature derivative bounds and uniform injectivity radius on \([-1,0]\). Selection of these concentration times only uses the running supremum on the original flow. [Bour, proof of Theorem 1.9](https://arxiv.org/pdf/1012.0342v1#page=28)

Bour invokes a compactness theorem stated on an open time interval, while his running supremum estimate reaches only through \(s=0\). Apply the spatial Hamilton theorem at \(s=0\) to obtain a complete pointed limit and fixed embeddings \(\phi_i\) on an exhaustion. On \([-1,0]\) the covariant derivative bounds on \(P(h_i)\) give uniform equivalence to \(h_i(0)\) and bounds on all metric derivatives in these fixed maps. This follows by the same connection-and-metric integration as for continuation, with \(h_i(0)\) as reference and the equation giving higher time derivative bounds. A diagonal subsequence converges smoothly on compact subsets up to \(s=0\). This yields a family \(h_\infty(s)\) on a complete pointed manifold \(X\) and \(|\mathrm{Rm}(h_\infty(0))|(x_\infty)=1\). If \(X\) were compact the embeddings would be onto, incompatible with \(\mathrm{Vol}(M,h_i(0))=\lambda_i^2\mathrm{Vol}(M,g_0)\to\infty\). The limit is noncompact. The unit-ball volume bound passes to every limit point by comparing distances and volumes on an embedded neighborhood containing a larger ball of the complete limit. Ball packing gives infinite volume. The orientation is induced by the pullbacks of the source orientations on the connected exhaustion after passing to a subsequence. For \(2<p<\infty\), \(\|\mathrm{Rm}(h_i(0))\|_{p,h_i(0)}=\lambda_i^{2/p-1}\|\mathrm{Rm}(g(t_i))\|_{p,g(t_i)}\). The left side is bounded away from zero by local smooth convergence near \(x_\infty\). Thus the source \(L^p\) curvature limsup is infinite for every \(2<p\le\infty\). [Bour, Theorems 7.1–7.2 and proof of Theorems 1.9 and 1.11](https://arxiv.org/pdf/1012.0342v1#page=27)

Scaling gives \(G(\lambda g)=\lambda^{-1}G(g)\) as a covariant tensor. Indeed \(F'_{\lambda g}(v)=\lambda^{-1}F'_g(v)\) and the \(L^2\) pairing of fixed covariant two-tensors is scale invariant in dimension four. Consequently \(\|G(\lambda g)\|_{2,\lambda g}^2=\lambda^{-2}\|G(g)\|_{2,g}^2\), and
\[
\int_{-1}^0\|G(h_i(s))\|_{2,h_i(s)}^2\,ds
=\int_{t_i-\lambda_i^{-2}}^{t_i}\|G(g(t))\|_{2,g(t)}^2\,dt
\longrightarrow0 .
\]
The interval eventually lies in a tail of the integrable time density for either finite or infinite \(T_{\max}\). On each compact set of \(X\), pass to the limit in the time-integrated norm and then use continuity through \(s=0\). This gives \(G(h_\infty(0))=0\) pointwise. The closed gradient identity \(G=\nabla F_W+(\alpha/24)\nabla S\) carries to metric germs by the compactly supported first variation of the Euler density. For \(g'=fg\), the scalar change is \(R'=-fR+3\Delta_B f\) and the volume change is \(2f\,dV\), giving \(\operatorname{tr}G=(\alpha/4)\Delta_B R\). Hence \(R\) is harmonic. The scalar integral bound passes by exhaustion. Test with \(\eta_r^2R\), where \(\eta_r=1\) on \(B_r\), is supported in \(B_{2r}\), and has gradient bounded by \(C/r\). Cauchy–Schwarz gives
\[
\int_{B_r}|\nabla R|^2\,dV\le \frac{C'}{r^2}\int_X R^2\,dV .
\]
Thus \(R\) is constant and vanishes by infinite volume. At \(R=0\) the first variation of \(S\) vanishes locally, leaving the Bach equation \(\nabla F_W=0\). Compactly supported Yamabe tests pass to the limit by smooth convergence, giving \(y(h_\infty(0))\ge y_0\). Since \(R=0\), this is the homogeneous Sobolev inequality \(\|\nabla u\|_2^2\ge y_0\|u\|_4^2\) on \(C_c^\infty(X)\). Separate chiral, trace-free Ricci and full curvature integral bounds pass by scale invariance and exhaustion. [Bour, §3 and proof of Theorem 1.11 and Lemma 8.2](https://arxiv.org/pdf/1012.0342v1#page=29)

## Streets comparison and scope

In dimension four, \(2\mathcal F^1=D\) differs from Bour's full curvature integral by the fixed topological constant \(8\pi^2\chi(M)\). Switching to Streets' four-index norm multiplies the full curvature integral by four, with a corresponding constant change of time for its negative gradient equation. Streets arXiv:1103.4136v2, Theorem 1.3 derives positive-time derivative bounds under a supremum curvature bound for the class in his equation (1.1). Corollary 1.5 gives weak pointed compactness with a base-point injectivity radius hypothesis for smooth manifold convergence, and Corollary 1.9 gives finite-time supremum blow-up for the compact full-curvature flow. His introduction identifies a different leading curvature term in Bour's class and anticipates a transfer using local Sobolev smoothing. Theorems 1.1 and 1.8 of arXiv:1311.0961v1 concern, respectively, concentration or proximity to collapse under an energy ceiling and smoothing under small energy and a lower volume radius. That preprint discusses extensions to other flows. The strict case above uses Bour's global fixed-operator smoothing with positive Yamabe control to supply noncollapse on normalized slabs. [Streets 2013, §1](https://arxiv.org/html/1103.4136v2#S1) · [Streets 2016, §§1.1–1.4](https://arxiv.org/html/1311.0961v1#S1)

The compact branch supplies a positive \(\mathcal F^\alpha\)-critical representative. The noncompact branch supplies a complete nonflat scalar-flat Bach-flat representative with comparison embeddings of compact exhaustions by a fixed-\(\alpha\) rescaling of the original flow. A marked compact core, recognition of the physical exterior, uniform estimates in \(\alpha\), and fixed-type attainment are separate mathematical steps. This audit concerns strict initial pinching in Theorem 1.11.
