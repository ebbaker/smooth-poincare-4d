# Annular Bochner control and the weak incoming problem

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. [Input revisions, prover assignments and acceptance](../research-progress/handoffs/BOCHNER_AND_INVERSE_20261125.md) · [Live register](../research-progress/REGISTER.md)

## The compactly supported test

Fix a smooth oriented Riemannian spin four-region, a marked metric $g$, and a positive harmonic family $D_g\psi_a=0$. Write $q_a=\nabla\psi_a$, $S=\sum_a|\psi_a|^2$ and $Q=\sum_a|q_a|^2$. The gradient and all norms in this paragraph belong to $g$. For one compactly supported test $v\in T^*\!M\otimes S^+$ in the interior of the annulus, write $D^+$ and $D^-$ for the twisted Dirac operators between the chiralities. In an aligned normal spin chart, direct differentiation gives
$$
 D^-D^+v= -\sum_i(\nabla^2v)_{ii}+\mathcal E v,\qquad
 \mathcal E=\tfrac14\mathrm{Scal}_g+
     \sum_{i<j}c^-(e_i)c^+(e_j)R^{T^*}_{ij}.
$$
If $R_{ijak}=g(R(e_i,e_j)e_k,e_a)$, the dual connection contributes $-\sum_aR_{ijak}v_a$. The four-index Hilbert–Schmidt norm gives $|\langle\mathcal E v,v\rangle|\le96|\mathrm{Rm}_g||v|^2$. The coefficient 96 is a dimension bound from estimating the six pairs individually. These results use a supplied frame and a smooth spin trivialization at the point. [Metric square](../../../FirstOrderTwistor/SpinTwistedSquare.lean) · [Intrinsic curvature norm](../../../FirstOrderTwistor/SpinCurvaturePotential.lean)

For the integrated argument form the current with components $J^i=\langle\nabla_i v+c^-(e_i)D^+v,v\rangle$ in a normal orthonormal frame, pairing both tensor slots. Differentiating the two factors and taking the trace gives
$$
 \operatorname{div}_g J= \langle\mathcal Ev,v\rangle+
                  |\nabla v|^2-|D^+v|^2 .
$$
The current entry point takes an actual smooth tangent current with compact support inside the annulus. It verifies divergence from the represented first jets and tensor commutator and integrates with $dV_g$. A single normal-germ description supplies the product derivatives. The alternative one-chart computation integrates the density-weighted coordinate flux and compares each scalar integral with its pullback under the actual chart. Both routes give
$$
 \int_A |\nabla v|^2 dV_g\le
 \int_A|D^+v|^2dV_g+96\int_A|\mathrm{Rm}_g||v|^2dV_g
$$
when the specified metric and spin identifications hold and the localized quantities are integrable. A prescribed pole must lie outside the test region, or be treated using a separate boundary term. [Current and volume argument](../../../FirstOrderTwistor/SpinMetricCurrent.lean) · [Coordinate Green identities](../../../FirstOrderTwistor/SpinAnnularGreen.lean) · [Chart-to-volume comparison](../../../FirstOrderTwistor/SpinAnnularMetricEstimate.lean) · [Integrated arbitrary-coordinate square](../../../FirstOrderTwistor/SpinAnnularWeitzenbock.lean)

In an arbitrary chart, the Clifford symbols act on the graded real Hilbert fibre $S^+\oplus S^-$. Its off-diagonal action is skew-adjoint. Applying it twice to an embedded positive spinor gives the positive block with the Clifford factors in the required order, including the cotangent factor. For an orthonormal moving frame $U$ and inverse $V$, differentiating $U^\top G U=I$ gives skewness of $\Omega_i=V\Gamma_i U+V\partial_i U$. The two chiral lifts give the raised and lowered Clifford connection equations, with opposite Christoffel signs. The same connection gives $G^{-1}=UU^\top$ and its coordinate derivative. This identifies the fibre algebra separately from the choice of a spin gauge and from the scalar norm pullbacks for an actual field. [Graded fibre](../../../FirstOrderTwistor/SpinGradedClifford.lean) · [Metricity](../../../FirstOrderTwistor/SpinFrameMetricity.lean) · [Moving Clifford frame](../../../FirstOrderTwistor/SpinCliffordCompatibility.lean) · [Inverse metric](../../../FirstOrderTwistor/SpinInverseMetricFrame.lean)

For a smooth compactly supported cutoff $\chi$ put $f=\chi/\sqrt{S+\epsilon}$ and use $v=fq_a$. The normal-germ identities give $\sum_a|D^+q_a|^2=|\mathrm{Ric}_g|^2 S/4$ and $|W^+|_{\rm HS}^2 S\le4\sum_a|\nabla q_a|^2$. The product errors $df\otimes q_a$ and $c(df)q_a$ have the same squared norm, and $|df|^2Q\le 2|d\chi|^2Q/(S+\epsilon)+2\chi^2(Q/(S+\epsilon))^2$. With $r_\epsilon=Q/(S+\epsilon)$ the resulting physical estimate is
$$
 \int_A \chi^2 |W^+|_{\rm HS}^2\frac{S}{S+\epsilon}\,dV_g
 \le816\int_A \left(\chi^2|\mathrm{Ric}|^2\frac{S}{S+\epsilon}
    +\chi^2|\mathrm{Rm}|r_\epsilon+\chi^2r_\epsilon^2
    +|d\chi|^2 r_\epsilon\right)dV_g .
$$
The public metric theorem constructs the unweighted integral inequality for each realized cutoff test. The proof obtains integrability of the regularized tests before using that inequality. [Metric regularization](../../../FirstOrderTwistor/SpinMetricRegularization.lean) · [Pointwise field inputs](../../../FirstOrderTwistor/SpinRegularizedGerms.lean) · [Projected Hessian](../../../FirstOrderTwistor/SpinProjectedHessian.lean)

The denominator may approach zero. Assuming finite relative costs, the limit controls the weighted energy wherever $S>0$. If the joint zero set has positive measure, it suffices for the limiting argument that $Q=0$ almost everywhere there on the cutoff support. Its physical Weyl energy remains a separate term. Integration by parts takes place on the original annulus before any restriction to $\{S>0\}$. On a sequence one must identify each local energy measure with the physical one, sum the local budgets at each fixed pair of indices, and bound the energy outside every contributing region. [Joint-zero estimate](../../../FirstOrderTwistor/SpinJointZero.lean) · [Route 02 accounting](../../../FirstOrderTwistor/SpinBochnerAccounting.lean)

On an open coordinate chart the derivative of a $C^1$ field vanishes almost everywhere on each level set. Thus, for finitely many fields, the ordinary derivatives and the connection terms vanish almost everywhere on their common zero set. The connection term vanishes there by linearity. This removes the derivative-density premise once the physical field and its covariant derivative have been identified in the chart. The result holds in the actual Riemannian volume on compact subsets of a single chart, since both Haar gauges have the same null sets and the chart density gives the local metric measure. [Level-set proof](../../../FirstOrderTwistor/SpinLevelSet.lean) · [Physical-volume transfer](../../../FirstOrderTwistor/SpinMetricLevelSet.lean)

There is still a singular integral near a zero. In the oriented parallel frame of flat $\mathbb R^4$, the positive spinor $\psi=x_0+x_1i-x_2j-x_3k$ is Dirac-harmonic. It has $S=|x|^2$, $Q=4$ and zero Hessian. Its only zero has measure zero. On $0<a<b$, the relative fourth-power cost is
$$
\int_{a<|x|\le b}(Q/S)^2\,dx=32\pi^2\log(b/a).
$$
Every ball containing the origin has infinite cost, although the curvature vanishes. A cutoff supported away from the origin has finite cost. This example tests integrability of the proposed budget on an actual harmonic field. It makes no claim that small curvature requires the budget to be finite. [Flat harmonic example](../../../FirstOrderTwistor/SpinRelativeZeroExample.lean)

Adding an independent parallel harmonic spinor $h\ne0$ to the flat example changes the joint mass to $|x|^2+|h|^2$. The gradient density remains four. The cost is finite on each bounded ball. On $|h|<|x|\le b$ the joint density is at least $4/|x|^4$, giving the lower bound $8\pi^2\log(b/|h|)$. On any fixed ball about the origin its integral tends to infinity as $h\to0$ through nonzero values. Thus a complementary field can protect a given patch, while the relative sizes of the two fields still matter along a sequence. [Two-field calculation](../../../FirstOrderTwistor/SpinComplementaryFamily.lean)

## Incoming inverse on the fixed spectral cylinder

On $[0,L]$ use $\partial_t+A$ and the common increasing normal. Set $a_\lambda=0$ for $\lambda>0$, $a_\lambda=L$ for $\lambda<0$, and let $b_\lambda$ be the other endpoint. For square-integrable forcing and datum $g_\lambda$ at the incoming end, the unique absolutely continuous modal solution is
$$
 u_\lambda(t)= e^{-\lambda(t-a_\lambda)}
  \left(g_\lambda+\int_{a_\lambda}^t e^{\lambda(s-a_\lambda)}f_\lambda(s)\,ds\right).
$$
Integration on the oriented interval gives the backward sign for negative modes. The energy identity reads
$$
 \|u'_\lambda\|_2^2+\|\lambda u_\lambda\|_2^2+
 |\lambda|\,|u_\lambda(b_\lambda)|^2
 =\|f_\lambda\|_2^2+|\lambda|\,|g_\lambda|^2 .
$$
Consequently the closure of the graphs of the differentiable test modes in the norm on the left is isometric to all square-summable $L^2$ forcings and incoming half-order traces. Finite mode sums are dense. For $|\lambda|\ge3/2$, adding $\|u_\lambda\|_2^2$ to the bulk energy costs at most a factor $13/9$ on the right. An estimate for both traces from the bulk first-order norm is uniform for $L\ge1$. On shorter cylinders the proof keeps its $2|\lambda|/L$ term. [Weak modal solution](../../../FirstOrderTwistor/CylinderWeakMode.lean) · [Trace estimate](../../../FirstOrderTwistor/CylinderTraceEnergy.lean) · [Closed graph inverse and perturbation](../../../FirstOrderTwistor/CylinderGraphInverse.lean)

A supplied countable Hilbert eigenbasis gives a reconstructed field, its weak time derivative, and $Au$ with the measured $L^2$ norms. Integrating its Hilbert-valued velocity from the left trace produces one absolutely continuous representative. Its individual coefficients agree with the modal solutions at every point of the closed interval, including both ends. The spectral and geometric data must be matched to apply this inverse to an actual annulus. This includes the unit-round spinor basis and angular Sobolev norm, the trivialization, conformal weights, incoming projections, and any pole shifts. An annulus with varying angular metric also needs the measured perturbation in that same fixed domain. [Hilbert synthesis](../../../FirstOrderTwistor/CylinderWeakSynthesis.lean) · [Endpoint realization](../../../FirstOrderTwistor/CylinderHilbertTrace.lean)

Boundary inversion controls the first-order field. The independent Ricci and relative-gradient terms in the physical estimate identify the additional information needed for a curvature conclusion. At fixed truncation these conditions can be tested without a common uniform spinor floor. Which actual approximately critical sequences admit such tests with a small total cost remains open.
