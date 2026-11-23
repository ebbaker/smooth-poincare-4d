# SP4-CME-E65 — Audit of the critical path-to-strain dictionary

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. All four input hashes in the [frozen request][req] matched. This audit works on the fixed oriented round \(S^4\), with positive-definite curvature plane in the round-compatible sign component, fixed \(K>0\), and \(\delta=-2\operatorname{tr}_{\mathbb C^2}\) as in E14.

**Verdict.** E59's bounds, the \(H+MH\) time estimate, timewise naturality, and the two clock/norm conversions pass. The result is a dictionary for supplied smooth compatible paths in the fixed value tube. [E59][e59].

## Curvature plane, volume and parallel reference

At the round reference \(F_0=-K\Sigma_0\), the three \(\Sigma_{0i}/\sqrt2\) are orthonormal in \(\Lambda^+_{g_0}\), so \(F_{0+}\) is invertible and \(F_{0-}=0\). Nearby the curvature plane is positive and its graph over \(\Lambda^+_{g_0}\) is exactly \(F_-F_+^{-1}\). The denominator \(\mu/(dV_{g_0})\) stays positive near \(2K^2\), so the wedge quotient \(Q\), \(Q^{1/2}\) and \(Q^{-1/2}\) are smooth there. [E14, fixed normalization][e14]. [E59, (1)][e59].

For trace-free symmetric \(H\), \(g_H=g_0(e^H\cdot,\cdot)\) preserves volume. Differentiating \(\alpha\wedge *\omega=\langle\alpha,\omega\rangle dV\) gives \(\dot *\omega=-*_{g_0}(H\cdot\omega)\), where \(H\) acts on the two covariant slots. Also \(\dot *\) interchanges the two Hodge summands by differentiating \(*^2=I\). If \(b_H\) is the plus-plane graph into the minus-plane and \(\omega\in\Lambda^+_{g_0}\), the derivative of \(*_{g_H}(\omega+b_H\omega)=\omega+b_H\omega\) yields \(2\dot b\,\omega=\dot *\omega\). In an oriented orthonormal eigenframe for \(H\), vanishing forces \(h_1+h_j=0\) for \(j=2,3,4\) from the self-dual combinations of \(e^1\wedge e^j\) with their Hodge duals. The trace-free equation then gives all \(h_i=0\). Both spaces have dimension nine. The inverse function theorem gives the smooth volume-preserving representative locally. The factor \((\mu/(2K^2dV_{g_0}))^{1/2}\) gives the desired volume, since multiplying a metric in four dimensions by \(c\) multiplies its volume by \(c^2\).

Uniqueness makes the construction intrinsic. If two metrics have the same self-dual plane, diagonalize the second relative to the first with positive eigenvalues \(l_i\). Its star applied to a coframe wedge \(e^i\wedge e^j\) is the first star times \((\prod l_k)^{1/2}/(l_il_j)\). The common self-dual combinations of complementary wedges force this ratio to be one for every pair. The eigenvalues are consequently equal. Equality of volume fixes the scale. Finally \(\Sigma=-K^{-1}Q^{-1/2}F\) gives \(\Sigma_i\wedge\Sigma_j=K^{-2}\mu\delta_{ij}\) and agrees with the chosen sign at the reference. These smooth, equivariant formulas have bounded first and second fiber derivatives on a sufficiently small closed tube over the compact base. They give the first-order value comparisons in E59 (2), including uniform equivalence of \(g_0\) and \(\widehat g\). [E59][e59].

The fixed reference derivative \(D_0\) preserves the chiral identification \(\Sigma_0/\sqrt2:E\to\Lambda^+_{g_0}\) since \(A_0\) is the induced connection. It also preserves the Hodge inclusion and the fixed scalar \(K\). Thus \(D_0F_0=0\), \(Q(F_0)=I\), and the background tensors in the fiber operations are parallel. Equivariance lets one differentiate the operations in \(D_0\)-parallel frames, giving \(D_0Q=Q_F[D_0\beta]\) and

\[
 D_0^2Q=Q_F[D_0^2\beta]+Q_{FF}[D_0\beta,D_0\beta].
\]

The first derivatives of \(Q^{-1/2}\) and \(\widehat g\) have the same first-order chain rule. The ordered second derivative treats the added covector slot covariantly. No commutation of derivatives is used. [E59, (2)–(3)][e59]. [Fine v2, Lemma 2.2][fine].

## Strain and its differentiated lower terms

Set \(P=Q^{-1/2}\), \(B_c=\operatorname{ad}(a_c)\), \(q=Q-I\) and \(X=\nabla^AQ\). The only connection correction for \(Q\) itself is internal, and centrality of \(I\) gives

\[
 X_c=(D_0Q)_c+[B_c,q],\qquad
 (D_0X)_{dc}=(D_0^2Q)_{dc}+[\operatorname{ad}((D_0a)_{dc}),q]+[B_c,(D_0Q)_d].
\]

With \(u=|U|_0\), \(d=|D_0U|_0\), \(e=|D_0^2U|_0\), this gives \(|X|_0\le C(d+u^2)\), \(|D_0X|_0\le C(e+d^2+ud)\), and \(|D_0P|_0\le Cd\). For \(T_c=(PX_cP)_0/2\) trace-free projection commutes with the fixed derivative. The derivative hits either \(P\) or \(X_c\), giving the further term \(Cd(d+u^2)\) besides the bound for \(D_0X\). On \(u\le1\), \(u^2d\le ud\). Thus \(|D_0T|_0\le C(e+d^2+ud)\). [E14, strain definition][e14]. [E59, (4)][e59].

Write \(\mathcal C=\widehat\nabla-\nabla^0\). The metric connection difference is \(\mathcal C^\ell{}_{dc}=\widehat g^{\ell m}((D_0)_d\widehat g_{cm}+(D_0)_c\widehat g_{dm}-(D_0)_m\widehat g_{dc})/2\), of size \(Cd\). As \(T\) has one covector slot, \((\nabla^AT)_{dc}=(D_0T)_{dc}+[B_d,T_c]-\mathcal C^\ell{}_{dc}T_\ell\) has the required minus sign. The added bound is \(C(u+d)(d+u^2)=C(ud+d^2+u^3+u^2d)\). The squared strain contributes \(C(d^2+u^4)\). Using \(u\le1\), with the fixed-to-live comparisons for a one-form or a two-covector tensor, gives exactly

\[
 |T|_{\widehat g}\le C(d+u^2),\qquad
 |\nabla^AT|_{\widehat g}+|T|_{\widehat g}^2\le C(e+d^2+ud+u^2).
\]

Thus every undifferentiated term is at least quadratic. That fact uses the parallel reference as well as the commutator with \(Q-I\). [E59, (5)–(6)][e59].

## Localized Hessian, interpolation and intrinsic scope

In a chart of the pair bundle with connection matrices \(L_i\), \((D_0v)_i=\partial_i v+L_i v\). Differentiating again gives the top \(\partial_{ij}v\), \(L_i\partial_jv+L_j\partial_iv-G^k{}_{ij}\partial_kv\), and \((\partial_iL_j+L_iL_j-G^k{}_{ij}L_k)v\). The two Christoffel contributions arise from the covariant derivative of the new covector slot. The smooth cutoff-supported pieces extend by zero inside the torus cube. Reconstruction multiplies them by a cutoff equal to one near their support, so no unsupported extension or boundary derivative is needed. All displayed fixed frame terms are controlled by the ordinary derivatives of order at most two of the pieces. [E59, (7)–(8)][e59].

The \(L^{8/7}\) norm of the fixed derivative multiplier kernel has weight \(2^{(k+1/2)j}\) for order \(k\), by four-dimensional periodization of the cutoffs in E54's underlying flat estimates. Since the block index starts at zero, this also bounds all lower terms. For \(h_k=\|D_0^kU\|_{\infty,0}\) it gives \(\int h_2\le C H\). For each block, \(\|b\|_{L^2_t}\le\|b\|_{L^\infty_t}^{1/2}\|b\|_{L^1_t}^{1/2}\) with \(b(t)=\|\Delta_jv_\gamma(t)\|_8\). The middle weight is \(2^{3j/2}=(2^{j/2}2^{5j/2})^{1/2}\); summing by Cauchy–Schwarz and taking Minkowski in time yields \(\|h_0\|_2+\|h_1\|_2\le C(MH)^{1/2}\). Integrating the two pointwise estimates therefore gives

\[
 J(T)\le C\int_0^T(h_2+h_1^2+h_0h_1+h_0^2)\,dt
      \le C(H+MH)\le C(E_T+E_T^2).
\]

The low block is part of both norms, including the value terms. The norm uses full fixed derivatives of the pair and is reference-dependent. For example a nonconstant vertical gauge of the round connection preserves \(Q=I\) and zero intrinsic strain while changing the fixed-reference connection difference. This illustrates the distinction from the intrinsic integrand, with no converse estimate needed for the result. The proof is for a supplied smooth compatible path. [E54, (5)–(6)][e54]. [E59, (9)][e59].

## Naturality and exact metric/clock conversion

For an \(SO(3)\) bundle automorphism \(h\) covering an orientation-preserving diffeomorphism \(f\), curvature pulls back, so the wedge quotient pulls back by internal conjugation and the volume form by \(f\). The plane-and-volume uniqueness gives the pulled-back metric. Functional calculus and trace commute with conjugation, and both live spatial derivatives transform naturally. Thus \(T(h^*A)=h^*T(A)\) and \(\nabla^{h^*A}T(h^*A)=h^*(\nabla^AT(A))\), and their norm functions in the pulled-back metric are the original norm functions composed with \(f\). Surjectivity preserves each spatial supremum. This applies at each time, including time-dependent \(h\), since the tensors use only spatial derivatives. The same is true using the inverse pullback convention for the left action. [E59, naturality][e59].

In the E14 internal frame, \(\operatorname{ad}(e_i)\operatorname{ad}(e_j)=e_j e_i^T-\delta_{ij}I\) by the cross-product identity, so the trace is \(-2\delta_{ij}\). Fine's positive Killing convention therefore uses \(\delta_{\rm F}=2\delta\). Its orthonormal internal frame is \(e_i/\sqrt2\), whose curvature components are \(\sqrt2 F_i\). Thus \(\mu_{\rm F}=2\mu\), \(Q_{\rm F}=Q\), and \(g^{\rm F}=c\widehat g\) with \(c=2K\), from the four-dimensional volume law. Endomorphism Frobenius norms are unchanged by constant fiber-metric rescaling. The live spatial derivatives agree as connections under constant base rescaling. Consequently \(T\) and \(\nabla^AT\) are the same tensors and their respectively squared one-form norm and unsquared two-slot norm are both multiplied by \(c^{-1}\) in the native convention. [Fine v2, Definition 1.4 and its normalization paragraph][fine].

The native velocity provides an independent clock check. Fine's \(B_{\rm F}=4Q-\frac23|Q|^2I=2I+4(q-|q|^2I/6)\) since \(\operatorname{tr}q=0\). On the compatible path, self-duality and Bianchi give \(d_A^{*\widehat g}F=0\), so the \(2I\) term drops. Constant scaling on the two-form codifferential gives \(d_A^{*c\widehat g}=c^{-1}d_A^{*\widehat g}\) since the internal constant cancels between the adjoint pairings. Thus the native unadjusted velocity is \(c^{-1}\) times the E14 velocity, giving \(\tau=ct=2Kt\). With E14 norms retained and only the time variable changed the integral therefore carries \(c^{-1}\); with native norms too, \(\mathcal G_{\rm F}=c^{-1}\mathcal G_{\rm E14}\) and

\[
 J_{\rm E14}(T)=c^{-1}\int_0^{cT}\mathcal G_{\rm E14}(A(\tau/c))\,d\tau
               =\int_0^{cT}\mathcal G_{\rm F}(A(\tau/c))\,d\tau,
\]

where \(\mathcal G\) denotes the spatial supremum of the strain integrand. On the fixed pair bundle the native pointwise norms of \(a\) and \(\beta\) have factors \(\sqrt2 c^{-1/2}\) and \(\sqrt2 c^{-1}\), respectively, relative to E14. In the same charts and cutoffs with corresponding fixed rescaled frames these give bounded comparisons of the localized component norms, with \(dt=c^{-1}d\tau\) in the integral term. The localized norms still refer to the chosen background and atlas. [Fine v2, Proposition 4.2 and (4.1)][fine]. [E14][e14].

## Primary passage reinspection

Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, arXiv:1111.5005v2, 29 November 2011. Selected remote PDF text rechecked 22 November 2026, America/New_York. Definition 1.4 and preceding Killing-form normalization on p. 4, Definition 1.5 on p. 5, Lemma 2.2 and its proof on pp. 12–13, and Proposition 4.2 and (4.1) on p. 30. These were already canonical passages. No new source version or local reading copy was obtained. [Primary preprint][fine].

[req]: ../research-progress/handoffs/SP4-CME-E65_REQUEST_v1.md
[e59]: ../notes/59_CRITICAL_PATH_STRAIN_20261122.md
[e14]: ../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e54]: ../notes/54_CRITICAL_QUASILINEAR_MODEL_20261122.md
[fine]: https://arxiv.org/pdf/1111.5005v2
