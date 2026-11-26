# E50 · Independent calculation and public readback

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The issued independent-reader configuration was GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. This bounded E packet recomputes the local variation, checks the marked limit conditions, and tests the exported Lean statements on their geometric carriers. The read used checkout HEAD `2a132b6d335f695183fecdb4537905cf180b0363` and the working source SHA-256 prefixes `c28f8f658e3e` for the packet, `d86d59c000b9` for the plan, `28ac4549db77` for the E49 readback, `719bbea527c6` for scientific attainment, and `5abc9c7713da` for the closed and conformal alternatives. [E50 packets](../research-progress/handoffs/ED06_E50_PACKETS_20261126.md) · [Edition 06 plan](../research-plan/06_PLAN.md) · [E49 readback](E49_INDEPENDENT_READBACK_20261126.md)

## Palatini on fixed axes

Fix a smooth Riemannian metric path and a chart independent of time. Use \(C^a{}_{ij}=\dot\Gamma^a{}_{ij}\) and \(K=\dot g\) at the chosen time. Torsion freedom gives lower-slot symmetry for both \(C\) and \(\Gamma\). The derivative of the covariant Ricci tensor in the same chart is

\[
 \dot R_{ij}=\partial_a C^a{}_{ij}-\partial_j C^a{}_{ia}
   +C^a{}_{am}\Gamma^m{}_{ij}+\Gamma^a{}_{am}C^m{}_{ij}
   -C^a{}_{jm}\Gamma^m{}_{ia}-\Gamma^a{}_{jm}C^m{}_{ia}.
\]

For \(\nabla_a C^a{}_{ij}\), the connection part is \(\Gamma^a{}_{am}C^m{}_{ij}-\Gamma^m{}_{ai}C^a{}_{mj}-\Gamma^m{}_{aj}C^a{}_{im}\). For \(\nabla_j C^a{}_{ia}\), it is \(\Gamma^a{}_{jm}C^m{}_{ia}-\Gamma^m{}_{ji}C^a{}_{ma}-\Gamma^m{}_{ja}C^a{}_{im}\). In their difference the last terms cancel by symmetry of \(\Gamma\). The remaining terms match the four product derivatives using the other lower-slot symmetries. Thus \(\dot R_{ij}=\nabla_aC^a{}_{ij}-\nabla_j C^a{}_{ia}\). The algebra needs the lower-slot symmetry of the varied connection. An arbitrary three-index array can fail this comparison.

Metric compatibility lowers the raised slot before either covariant derivative, with no extra connection variation at the fixed time. The flux \(V_{aij}=g_{ab}C^b{}_{ij}=(\nabla_i K_{ja}+\nabla_j K_{ia}-\nabla_aK_{ij})/2\) is the E49 Koszul flux for the native speed. Therefore the actual Ricci derivative has the covariant form

\[
 \dot R_{ij}=g^{am}(\nabla_m V)_{aij}-g^{am}(\nabla_j V)_{aim},\qquad
 g^{am}V_{aim}=\tfrac12\nabla_i\operatorname{tr}_g K.
\]

The second term survives for arbitrary speed. The original fourth-order flow preserves total volume, which is compatible with a pointwise nonzero trace of the speed. [Bour, quadratic gradients and Laplacian convention](https://arxiv.org/html/1012.0342v1#S3) · [E49 fixed-chart Ricci derivative](../../SmoothPoincare/Variational/BourChristoffelTime.lean)

## Inverse, scalar and physical volume contractions

Use \(\Delta=\nabla^i\nabla_i\) with nonpositive integrated sign, \(F_W=E_++E_-\) with curvature-operator Hilbert–Schmidt norm, and ordinary two-tensor norm for Ricci. On a closed smooth oriented four-manifold write \(A=\mathrm{Ric}+cRg\), \(c=(p-4)/12\), and \(b=(|\mathrm{Ric}|^2+cR^2)/2\). The energy is \(F_p=(1-p)8\pi^2\chi+\int b\,dV_g\). On the fixed chart axes, differentiating \(g^{-1}g=1\) yields \(\dot g^{ij}=-K^{ij}\). The two inverse entries in the Ricci norm contribute \(-2\langle\mathrm{Ric}^2,K\rangle\) before multiplication by \(1/2\). The scalar derivative contributes \(\dot R=\operatorname{tr}_g\dot{\mathrm{Ric}}-\langle\mathrm{Ric},K\rangle\), and the physical volume contributes \(\dot dV_g=(\operatorname{tr}_g K)dV_g/2\). The complete derivative is

\[
 \left.\frac{d}{dt}\right|_{t_0} F_p(g_t)
   =\int_M\left[\langle A,\dot{\mathrm{Ric}}\rangle_g
    +\left\langle -\mathrm{Ric}^2-cR\mathrm{Ric}+\tfrac12 b g,K\right\rangle_g\right]dV_g.
\]

With this density the algebraic tensor has zero trace in dimension four. Under homothety \(K=g\), the connection and covariant Ricci derivatives vanish and the remaining density variation cancels pointwise against the volume term. For a nonconstant conformal speed \(K=2ug\), the Palatini formula instead gives \(\dot{\mathrm{Ric}}=-2\operatorname{Hess}u-(\Delta u)g\). Using contracted Bianchi in the integrated pairing gives \(\operatorname{tr}G_p=-p\Delta R/4\). Equivalently, the sign follows from \(\dot R=-2uR-6\Delta u\) and \(\dot dV=4u\,dV\), which yield \(\delta\int R^2=-12\int u\Delta R\) on the closed slice. Applying both spatial adjoints transfers the outer derivative first and reverses the order of crossed derivatives. The gradient flow normalized by \(K=-2G_p\) gives \(\dot F_p=-2\|G_p\|_{L^2}^2\). This factor is independent of whether the gradient is presented before or after commuting derivatives. [Gursky–Viaclovsky, (2.2)–(2.9)](https://arxiv.org/html/1105.4648v2#S2) · [Scientific 06, Proposition `prop:budget`](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

In the same conventions the uncommuted gradient is

\[
 (G_p)_{ij}=\nabla_a\nabla_{(i}A^a{}_{j)}
    -\tfrac12(\Delta A)_{ij}
    -\tfrac12 g_{ij}\nabla_a\nabla_b A^{ab}
    -(\mathrm{Ric}^2)_{ij}-cR\,\mathrm{Ric}_{ij}+\tfrac12 b g_{ij}.
\]

With the curvature action \(\mathrm{Rm}^{\circ}(B)_{ij}=R_{ikjl}B^{kl}\), commuting the first derivatives cancels the explicit Ricci square against the commutator contribution. The result is

\[
 G_p=-\tfrac12\Delta\mathrm{Ric}-\mathrm{Rm}^{\circ}(\mathrm{Ric})
   +\tfrac{p+2}{12}\operatorname{Hess}R-\tfrac{p-1}{12}(\Delta R)g
   -cR\,\mathrm{Ric}+\tfrac12 b g.
\]

At constant scalar curvature put \(E=\mathrm{Ric}-Rg/4\). The curvature decomposition gives \(\mathrm{Rm}^{\circ}(E)=W^{\circ}(E)+\tfrac12|E|^2g-E^2-RE/12\) and \(\mathrm{Rm}^{\circ}(g)=\mathrm{Ric}\). Substitution leaves \(\tfrac12\nabla^*\nabla E-W^{\circ}(E)+E^2-\tfrac14|E|^2g+(2-p)RE/12\), in agreement with Bour's nonnegative rough convention. In particular the normalized scalar-flat stationary equation at either extraction is independent of \(p\). [Bour, Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4) · [Gursky–Viaclovsky, (2.5) and (2.9)](https://arxiv.org/html/1105.4648v2#S2)

## Whole marked truncation and interior normalization

In an end chart use \(u(y)=|y|\) on the fixed annulus and \(h_r=r^{-2}\delta_r^*h\). Its regular unit level has outward normal \(\nabla^{h_r}u/|du|_{h_r}\). In an adapted orthonormal tangent frame the shape entries equal \(\operatorname{Hess}_{h_r}u(e_i,e_j)/|du|_{h_r}\), and the area ratio is the square root of the induced Gram determinant relative to the round measure. Uniform annular metric two-jet convergence gives \(S_r\to I\), ambient tangential curvature \(C_r\to0\), and \(J_r\to1\) on the actual level. The Euclidean-normal scaling gives shape of size \(r^{-1}\), curvature of size \(r^{-2}\) and area of size \(r^3\) in the physical metric. Hence both cubic and mixed boundary terms have the appropriate scale invariant integral. The unit round quotient area is \(2\pi^2/|\Gamma|\) using the actual sphere covering measure identity.

The finite transgression on an oriented smooth compact truncation with smooth boundary, in \(8\pi^2\chi\) units, has boundary density \(4\det S+2\sum_{\rm cyc}k_a K^X_{bc}\) in an outward-positive principal frame. In the product-to-Levi–Civita interpolation the tangential plane curvature is \(K^X_{bc}+(1-t^2)k_bk_c\). Integrating gives the stated cubic term, calibrated by the outward Euclidean ball. In an annulus the inner boundary uses the inverse normal, reversing both terms. The actual finite Euler identity must cover the entire compact truncation with the boundary orientation and all components. The asymptotic boundary coefficient on one local end alone carries no Euler characteristic of the core. Once the groups are independently excluded, a single connected oriented embedding of the whole truncation with all buffers lets the topology provide \(\chi(X)=2-k\). The scalar-flat identity then gives \(D_X=2(E_++E_-)+32\pi^2(k-1)\), so \(D_X<32\pi^2\) gives one end. The equality \(D_X=4e_X\) additionally requires equality of the signed charges from the oriented compactification. The limit uses finite transgression, exhaustion and area transport on the pointed metric. The topological calculations, quotient-group exclusion by splicing the same closed source, and the recognition of the capped exterior each have separate hypotheses. [Cibotaru–Moroianu, (1.1), §3 and Example 3.4](https://www.imar.ro/~sergium/fisiere/pfa.pdf) · [Tian–Viaclovsky, (7.2)](https://arxiv.org/pdf/math/0310302v3#page=51) · [Scientific 06, Lemma `lem:mark`](../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

Peters' Theorem 4.3 gives uniform-radius harmonic charts with uniform metric \(C^{1,\gamma}\) bounds for compact metrics under common curvature and injectivity bounds. A common coordinate radius for these chosen charts can be used in the bounded and curvature-rescaled regimes. An arbitrary transported chart can have nonzero contracted Christoffel trace. On it the metric Ricci equation includes derivatives of the gauge term, so its second-order estimate cannot be obtained by dropping that term. In a genuinely harmonic ball the metric equation has principal term \(-g^{ab}\partial_{ab}g_{ij}/2\). The Ricci equation has a diagonal second-order part and lower-order terms \(\Gamma\partial E\) and \((\partial\Gamma+\Gamma^2)E\). With bounded \(E\) and an independent metric interior \(W^{2,b}\) estimate, the last product is uniformly \(L^b\). On nested smaller balls the first-order term is handled by interpolation in the \(W^{2,b}\) estimate for \(E\). For \(b>4\), the gain in first derivative Hölder regularity starts the coupled Schauder bootstrap. These analytic steps require uniform coordinate inverse, ellipticity, and appropriate source and coefficient norms. The same constants need no derivative of the constant scalar. The actual scalar is \(R_j/a_j\) and its coefficient \((2-p_j)R_j/(12a_j)\) vanishes at a divergent curvature scale, including for fixed positive \(p_j\). [Peters, Theorem 4.3](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10) · [DeTurck–Kazdan, Lemma 4.1 and (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7) · [Bour, Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4)

## Post-X margin and candidate selection

Let \(M\) be a fixed smooth closed connected oriented homotopy four-sphere with positive subcritical entry \(I<8\pi^2\). Use X and the exact-stratum selection to supply a unit-volume Yamabe attained metric \(g_*\) with \(e_*=I\) and least \(D_*<4I\). The strict inequality follows from the sharp Yamabe comparison on a nonstandard type, or is supplied directly as the hypothesis for this comparison. Set \(d=(D_*+4I)/2\), and choose \(p>0\) small enough that the comparator lies a common positive distance from the flow wall as \(p\downarrow0\). For near-global-minimum starts with error \(\epsilon\), the strict wall keeps the original smooth trajectory positive. Its monotonicity and \(e(t)\ge I\) give

\[
 D(t)\le D_*+2\epsilon/p\le d,
 \qquad S(t)\le S_*+24\epsilon/p,
 \qquad 4\epsilon\le p(4I-D_*).
\]

For a first pointed return on these physical sources, the same-type positive compactification and marked Ricci liminf would give \(4I\le4e_X=D_X\le d<4I\). Along a first whole smooth return the same \(d\) passes to the physical endpoint before changing a conformal representative. This uses the actual whole comparison. Diffeomorphisms and constant scaling preserve \(D\), whereas an arbitrary conformal replacement of the endpoints can change it. The constant-scalar equation at a positive parameter and the converging scalar budget give a common upper bound on \(R\) in the volume-one gauge, and the positive Yamabe lower bound gives a common positive scalar lower bound by the constant test. At the stationary-family extraction, the same contradiction excludes a marked pointed return of these endpoints. In its divergent branch the normalized scalar tends to zero and the normalized critical equation is Bach-flat in the smooth limit even at fixed positive parameter. The exclusions are conditional on the actual compactness alternatives and the marked positive return at both stages.

At fixed \(p\), first send the error above \(J_p=\inf_{Y>0}F_p\) to zero. Whole smooth convergence of the positive critical endpoints preserves both energy and the Yamabe floor, so the resulting metric realizes \(J_p\). Repeating the stationary compactness argument as \(p\downarrow0\) uses these actual fixed-parameter minimizers. A diagonal choice with \(\epsilon=O(p)\) suffices for the Ricci exclusion. Attainment and stability of each \(J_p\) use vanishing error at that fixed parameter.

Every positive-class metric satisfies \(Y\le \int R\,dV/\sqrt{\operatorname{Vol}}\le\sqrt S\). A unit-volume Yamabe representative in the same class realizes equality and preserves \(e\). For an actual positive global minimizer \(q_p\) of \(F_p=2e+pS/24-16p\pi^2\), this comparison forces \(S=Y^2\). Equality in both inequalities shows the constant factor attains the Yamabe quotient, so the volume-normalized \(q_p\) is itself a Yamabe representative. The Yamabe conclusion uses global conformal comparison in addition to constant scalar curvature. The other form of the comparator inequality gives

\[
 D(q_p)\le D_*,\qquad
 0\le e(q_p)-I\le \frac{p}{4(1-p)}\bigl(D_*-D(q_p)\bigr).
\]

A whole smooth \(p\downarrow0\) limit with the positive Yamabe floor and the limiting Bach equation is therefore on the exact stratum with \(D\le D_*\). The exact least-Ricci property then gives equality, and the normalized Yamabe quotient passes to the limit by fixed tests. Along such a subsequence \(e(q_p)-I=o(p)\). This conclusion allows more than one least-Ricci representative. An actual negative direction and the existence of entry on arbitrary types require separate geometric arguments. [E49 attained comparator](../../SmoothPoincare/Variational/BourAttainedSublevel.lean) · [E49 exact selection](../../SmoothPoincare/Variational/AttainedYamabeSelection.lean) · [Working post-X extension](../research-plan/06_PLAN.md#decisions-on-the-surviving-candidate)

The uniform selection applies after X with the supplied exact-stratum compactness, conformal normalization, and sharp spherical comparison. Its comparator gives a single ordinary Ricci ceiling and a single strict flow wall margin for positive parameters in a small common interval. For each fixed parameter it supplies positive Yamabe starts whose excess above the regularized infimum tends to zero. A physical first closed endpoint carries the ceiling by whole-metric convergence in its original gauge. The second exclusion can use actual canonical pointed comparison on independently rescaled endpoints without imposing conformal gauge choices there. The remaining marked return input is the positive same-type compactification with the measured one-end Ricci identity. [Route 07 calculation](../07_fixed_type_variational_descent/notes/E50_SECOND_EXTRACTION.md) · [Second extraction](../../SmoothPoincare/Variational/BourSecondExtraction.lean)

## Lean integration

The closed pairing uses the fiberwise Palatini derivative, the adjoint of each differentiated connection term, and the algebraic correction from both inverse slots and volume. The symmetric projection is justified by the native speed's two-slot symmetry. The homothety \(e^{t-1}g\) realizes a regular physical path on every supplied time interval, keeps the Euler integral fixed, and gives the vanishing integrated trace at its base time. For a spatially varying smooth \(u\), the path \(e^{2tu}g\) is jointly smooth on every interval. Applying the original pairing on that path and the conformal trace calculation gives the pointwise trace with local Euler constancy along the tested conformal paths. The integrated trace and gradient slab use the physical negative twice-gradient evolution in the stated regular time interval. [Palatini variation](../../SmoothPoincare/Variational/BourPalatiniVariation.lean) · [Moving contractions](../../SmoothPoincare/Variational/BourMetricContractions.lean) · [Scale and conformal paths](../../SmoothPoincare/Variational/BourScalePathRegularity.lean) · [Original gradient](../../SmoothPoincare/Variational/BourOriginalGradient.lean)

The crossed Ricci derivatives are checked with the signed commutator \(\mathrm{Ric}^2-\mathrm{Rm}^{\circ}(\mathrm{Ric})\) in the pinned curvature action. Contracted Bianchi gives \(\operatorname{div}A=(p+2)\,dR/12\) before taking the second divergence. This also checks the scalar coefficient in the uncommuted gradient. The kernel assembles these terms into the curvature-commuted formula on an arbitrary smooth physical slice. The pointwise parameter correction from \(p=0\) to \(p=1/2\) is \((\operatorname{Hess}R-(\Delta R)g-RE)/24\), with \(E=\mathrm{Ric}-Rg/4\). Its constant-scalar specialization is \(-RE/24\) on the same metric. The velocity equivalence tests every tangent pair to identify the actual tensor derivative with the negative twice-gradient. Applying it to the component equation supplies the velocity premise of the closed regular slab. The terminal dissipation theorem takes both original endpoints cofinal in one order-connected regular interval, as well as the backward-time relation \(t=s/c_i^2+t_i\). It transfers zero limiting dissipation to the actual rescaled velocity divided by negative two. Smooth parabolic comparison and stationarity of a pointed limit require the extraction inputs. [Crossed Ricci derivatives](../../SmoothPoincare/Variational/BourCrossedRicci.lean) · [Weighted Bianchi](../../SmoothPoincare/Variational/BourGradientBianchi.lean) · [Curvature-commuted comparison](../../SmoothPoincare/Variational/BourGradientComparison.lean) · [Terminal dissipation](../../SmoothPoincare/Variational/BourTerminalDissipation.lean)

The harmonic ball implementation takes an explicit harmonic-radius supplier, obtains a common buffered Euclidean radius and a smaller physical ball, and transports harmonicity across constant scaling of each original metric. Arbitrary previously transported coordinates require a harmonic gauge check before the principal formula can be used. The marked boundary implementation checks shape, curvature and induced area at an immersed link as well as the polynomial integral along the connection path. It still needs the finite-boundary Chern–Gauss–Bonnet identification, the whole oriented truncation and buffers, and the later positive exterior return. [Harmonic charts](../../SmoothPoincare/Variational/BourTransportedInterior.lean) · [Marked boundary jets](../../SmoothPoincare/Variational/BourMarkedBoundaryJets.lean)

## Public replay

The fixture imports only `SmoothPoincare`. Its 23 applications include the actual fixed-chart Palatini and inverse trace, nonzero scalar and volume corrections, the physical gradient pairing and a regular negative twice-gradient slab, the explicit component PDE as input to that slab theorem, the pointwise trace at \(p=1/2\), the constant-scalar and general gradient differences, the weighted Bianchi coefficient and the signed Ricci commutator, and a terminal rescaled window of length one. The interior tests use a scale-four harmonic patch and a uniform bound at the center of a model ball. The boundary checks use the Euclidean unit level, the sign on reversing the normal, and upper and lower comparison of physical link measures. The extraction checks use the same first-closed Ricci margin along \(n\mapsto 2n+7\), actual rescaled pointed sources, fixed-parameter minimizer recovery and Yamabe equality, and a physical start at half the positive cutoff from the least-Ricci selection.

After the public Lake build, `lake env lean -j1 investigations/reviews/E50_INDEPENDENT_PUBLIC_CHECKS.lean` passed without warnings under Lean `4.35.0-rc3`, commit `470d5ce1400764999581fd26d5d72b00d990b0f4`. The 48 transitive axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`. [Executable fixture](E50_INDEPENDENT_PUBLIC_CHECKS.lean)

| Checked input or output | SHA-256 |
| --- | --- |
| [Public root](../../SmoothPoincare.lean) | `09335b6de13c870d2acaefd59ba07fa399533bb1932f06d17ec1e76b05e87425` |
| [Independent fixture](E50_INDEPENDENT_PUBLIC_CHECKS.lean) | `3cc7dcf2b6ae357b0db1bb7d3cb1dc7d14c726ce488b84799e4cd5a6ac998c65` |
| [Conformal-path regularity](../../SmoothPoincare/Variational/BourScalePathRegularity.lean) | `7ded36741ec9a619164971ba9a9c3a799d7f896f9880051ae12cae83d3e0123d` |
| [Curvature-commuted comparison](../../SmoothPoincare/Variational/BourGradientComparison.lean) | `9a9597ea6d2bb9f2316766bed06303637c21c6fb6831017d9d6e9e91d4a7427e` |
| Public replay transcript | `f902159e3406e0fdba331f419bd844a552a668124d6f6d80237a490feff9cab2` |
