# The symmetric gradient on the original metric

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected lead was Astra/ultra with bounded Sol/ultra calculations and independent reading. Separate serving telemetry was unavailable. [Working generations and replay](../../research-progress/handoffs/ED06_E50_VERIFICATION_20261126.md) · [Physical Palatini calculation](E50_PALATINI.md) · [Moving contractions](E50_CONTRACTIONS.md)

Let \(g_t\) be the physical metric on a regular time interval of a smooth closed oriented four-manifold. The Euler integral is constant on the tested path. Write \(K=\dot g\), \(b=(p-4)/12\), \(A=\mathrm{Ric}+bRg\) and \(B=\tfrac12|\mathrm{Ric}|^2+\tfrac b2 R^2\). Up to its constant Euler term, the integral of \(B\) is the original functional. The variation of the volume is \(+\tfrac12\operatorname{tr}_g K\,dV_g\). The variation of the inverse metrics in \(B\) gives \(-\mathrm{Ric}\circ\mathrm{Ric}-bR\,\mathrm{Ric}\), paired with \(K\). In particular the algebraic correction is the smooth tensor \(Z=-\mathrm{Ric}\circ\mathrm{Ric}-bR\,\mathrm{Ric}+\tfrac12Bg\). Here \((\mathrm{Ric}\circ\mathrm{Ric})_{ij}=\mathrm{Ric}_{ia}g^{ab}\mathrm{Ric}_{bj}\). [Contraction proof](../../../SmoothPoincare/Variational/BourMetricContractions.lean)

Take \(C_{aik}=\tfrac12(\nabla_iK_{ka}+\nabla_kK_{ia}-\nabla_aK_{ik})\), with the output lowered in its first slot. In the chart convention used in the Lean project the actual Ricci component has derivative \(P_{ik}=\nabla^a C_{aik}-\nabla_k\tau_i\), where \(\tau_i=g^{ab}C_{aib}\). The order of the two free slots matters when translating the uncontracted formula. Contracting the two Koszul terms that differentiate along a contracted slot cancels them after dummy-index exchange. Metric compatibility gives \(\tau=\tfrac12d\operatorname{tr}_gK\). The calculation works in an arbitrary basis and identifies smooth one-forms on the entire time slice. A pointwise zero trace at a single point would leave its spatial derivative undetermined. [Native trace and its double adjoint](../../../SmoothPoincare/Variational/BourKoszulTrace.lean) · [Covariant velocity theorem](../../../SmoothPoincare/Variational/BourPalatiniVariation.lean)

For the symmetric Ricci weight \(A\), let \(U(A)\) denote the adjoint of the first divergence of \(C\). Its contraction with symmetric \(K\) is represented by
\[
 U(A)_{ij}=\nabla^a\nabla_i A_{aj}-\tfrac12\nabla^a\nabla_a A_{ij}
\]
up to symmetrization of \(i,j\). The two derivative indices stay in this order. For the second term the free-slot transposition moves onto \(A\), which is symmetric. Two integrations by parts give \(-\tfrac12\int(\operatorname{div}\operatorname{div} A)\operatorname{tr}_gK\,dV_g\). Multiplying the scalar \(\operatorname{div}\operatorname{div} A\) into \(g\) realizes that last pairing in the same two-tensor fiber as the inverse-metric and volume corrections. Therefore the smooth symmetric tensor
\[
 G^p=\operatorname{Sym}\!\left(U(A)-\tfrac12(\operatorname{div}\operatorname{div} A)g+Z\right)
\]
represents the derivative on every original regular metric family under the Euler hypothesis. Symmetric projection preserves its pairing with the native metric speed. This proof requires no Ricci-flow substitution and no assumed energy pairing. [Assembled first variation](../../../SmoothPoincare/Variational/BourOriginalGradient.lean)

The actual homothety \(g_s=e^{s-1}g\) is a smooth path with fixed Euler integral through \(g\), with velocity \(g\) at \(s=1\). The energy is scale invariant in dimension four. Hence \(\int \operatorname{tr}_gG^p\,dV_g=0\). The stronger conformal test \(e^{2tu}g\), for every smooth real \(u\), gives \(\operatorname{tr}_gG^p=-(p/4)\operatorname{tr}\nabla^2R\) under local conformal Euler constancy. In particular, the gradient need not be pointwise trace free on an original trajectory. For any solution with \(\dot g=-2G^p\), the regular-slab theorem now derives
\[
 \operatorname{Vol}(g_b)=\operatorname{Vol}(g_a),\qquad
 \int_a^b\|G^p(g_t)\|_{L^2(g_t)}^2\,dt=\frac{\mathcal F^p(g_a)-\mathcal F^p(g_b)}2 .
\]
Its only dynamical equation is the velocity equation for this computed tensor. Existence, terminal smooth compactness and comparison maps for that solution are further analytic questions. [Physical conformal test families](../../../SmoothPoincare/Variational/BourScalePathRegularity.lean) · [Bour, §§1.2, 3, 8](https://arxiv.org/html/1012.0342v1)

The physical contracted Bianchi identity gives \(\operatorname{div}A=(p+2)\,dR/12\) and \(\operatorname{div}\operatorname{div}A=(p+2)\Delta R/12\). The native crossed Ricci commutator contracts to \(\mathrm{Ric}\circ\mathrm{Ric}-\mathrm{Rm}^{\circ}(\mathrm{Ric})\), with the two skew signs in the curvature slots accounted for. [Weighted Bianchi](../../../SmoothPoincare/Variational/BourGradientBianchi.lean) · [Native crossed contraction](../../../SmoothPoincare/Variational/BourCrossedRicci.lean)
