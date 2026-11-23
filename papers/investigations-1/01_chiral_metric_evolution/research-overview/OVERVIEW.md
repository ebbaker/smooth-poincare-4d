# Research overview — Chiral curvature and metric evolution

Prepared for Edward B. Baker III with OpenAI assistance. Established 21 November; updated 22 November 2026 (America/New_York) during the explicitly activated broad research run. The selected lead and effort were preserved; their actual identifiers were unavailable. Bounded helpers were configured as `gpt-6.2-sol` / `ultra`, without independent backend introspection. The [sole register](../research-progress/REGISTER.md) owns live status and the [plan](../research-plan/PLAN.md) owns task specifications. Historical setup provenance remains in the [planning integration record](../reviews/RESEARCH_PLAN_INTEGRATION_20261122.md).

## Objective and authority

Understand Fine's actual nonlinear definite-connection flow, develop the real generalized-coordinate comparison, and assess a route toward the smooth four-dimensional Poincaré conjecture. The author's [invoked broad prompt](../continuation-notes/BROAD_RESEARCH_CONTINUATION_20261122.md) authorizes successive B decisions and bounded Sol execution without renewed approval. Packet completion is a research checkpoint, not a stopping instruction. This overview summarizes mathematical dependencies, not a competing status ledger.

The current approach uses real horizontal transport on the complete sphere S(E), rather than assuming integrable twistor charts. It gives exact reconstructions and conditional estimates. A whole-time strain estimate is now available for the fixed round critical basin and, using smooth local slice representatives, for small intrinsic Lorentz strain on a smooth neighborhood of the round orbit. The later homogeneous-defect argument extends the intrinsic estimate to one fixed smaller connection/curvature value basin, without a separate strain threshold. Intrinsic placement of general definite data into such a basin remains a separate objective. Initial definite data on an arbitrary smooth homotopy four-sphere remain a separate global problem.

## Objects and normalization

M is a smooth closed connected oriented real four-manifold, E an oriented Euclidean rank-three bundle and A a smooth SO(3) connection with positive curvature plane and the round-compatible curvature-map sign. The reconstructed signature is positive Riemannian. For fixed K>0,
\[
\mu=\tfrac13\sum_iF_i\wedge F_i,\quad F_i\wedge F_j=Q_{ij}\mu,
\quad Q>0,\quad\operatorname{tr}Q=3,
\]
\[
S=Q^{1/2},\quad F=-KS\Sigma,\quad
\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g},\quad
\mu=2K^2dV_{\widehat g}.
\]
The internal metric is delta=−2tr in the spin representation and the bracket is epsilon. Fine's printed negative-Killing norm is twice this metric; the [E01 assessment](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) fixes both metric and time conversion. Do not silently mix these conventions.

The independent-connection equation in the manuscript clock is
\[
A_t=-4d_A^{*_{\widehat g}}[(q-|q|^2I/6)F],\qquad
q=Q-I,\qquad\mathcal P=\int|q|^2\mu.
\]
It differs from the fourth-order gradient of the metric pullback functional. Its relation to normalized Ricci flow is the audited round TT linearization with factor-four time rescaling, not a nonlinear identification.

## Exact nonlinear flow and the conditional energy estimate

Write X_c=∇c^A Q, b=A−Gamma+ and
\[
L_Q(H)=2(QH+HQ)-\tfrac43\operatorname{tr}(QH)Q,
\quad\Xi_c=2[\nabla_cS,S]+4S\operatorname{ad}(b_c)S.
\]
On the smooth definite interval, in the fixed unadjusted base identification,
\[
Q_t=\nabla^c(L_Q\nabla_cQ)+\sum_c[X_c,\Xi_c]
       -24K\sqrt{\det Q}\,q,\qquad \mu_t=0.
\]
The full expanded equation and derivation are in [E02A](../notes/04A_NONLINEAR_Q_20261122.md); the volume identity was independently checked in [E02C](../notes/04C_VOLUME_AND_JETS_20261122.md). Pointwise fixed volume is stronger than topological total-volume conservation but does not itself bound metric anisotropy.

L_Q is self-adjoint on Sym²_0 and obeys 4m|H|²≤〈H,L_QH〉≤4M|H|². Uniform coercivity degenerates as m→0. If |q|≤1/8 persists throughout a smooth interval, then
\[
\mathcal P'\le-2\int|\nabla^A Q|^2\mu-36K\mathcal P.
\]
Thus energy decays exponentially on that interval and every smooth critical connection in that pointwise region is perfect. [E05 derivation](../notes/07_PINCHED_ENERGY_GAP_20261122.md). Persistence and compactness are hypotheses still to be obtained; this does not extend Fine's Sobolev local-stability theorem to arbitrary definite data.

## Real whole-fiber comparison

The curvature ray map is phi(u)=Su/|Su|. Under it, the A-horizontal lift differs from the reconstructed metric lift by
\[
\mathcal H_X(f)=P_fL_Xf,\quad
L_X=(\nabla_X^A S)S^{-1}-\operatorname{ad}(b_X),\quad P_f=I-f\otimes f.
\]
Its holomorphic vector-field projection is the rotation (skew L_X)f. The residual is R_X(f)=P_fT_Xf, with
\[
T_X=\tfrac12(S^{-1}\nabla_X^A Q S^{-1})_0,\qquad
\int_{S^2}|R_X|^2d\omega=\frac{4\pi}{5}|T_X|^2.
\]
This is the natural O(2) vertical tangent bundle, with two-chart transition y_w=−zeta⁻² y_zeta. The O(1) first-jet construction survives as the explicitly checked round calibration, including quaternionic reality. It has not been extended to an arbitrary off-integrable twistor chart. See [E03A](../notes/05A_REAL_TWISTOR_COMPARISON_20261122.md), [E03B](../notes/05B_REAL_TWISTOR_COMPARISON_20261122.md) and [primary-source record](../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md).

The exact inverse and derivative estimates give
\[
|\nabla^A Q|\le6|T|,\quad |b|\le2\sqrt3|T|,
\]
\[
\left(|W^+|_{\rm op}^2+\tfrac14|\operatorname{Ric}_0|^2+
\tfrac1{48}(s-12K)^2\right)^{1/2}
\le K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2.
\]
The constants assume no quantitative eigenvalue floor. The norms use the reconstructed metric, and W− is absent from this chiral pointwise identity. [E09 derivation](../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md).

## Spatial and temporal sufficient conditions

For C_T=sup_(x,y) inf_gamma ∫|T_(gamma')|, the [E04 anchor](../notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md) gives quantitative definiteness from e0=P(0)/∫mu<3/2 and a supplied C_T bound. In particular e0≤1/256 and C_T≤1/96 give |q|≤1/8 at that time. This cost bound is not obtained from energy dissipation.

The [E14 temporal criterion](../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md) gives a different sufficient condition. Put H(t)=sup_M(|∇A T|+|T|²), J(t)=∫_0^t H. With C=4512sqrt2,
\[
e^{-CJ(t)}\widehat g(0)\le\widehat g(t)\le e^{CJ(t)}\widehat g(0),
\qquad m(t,x)\ge e^{-CJ(t)}m(0,x).
\]
These estimates use the fixed unadjusted base and bundle, and no small initial energy. Finiteness of J up to an endpoint therefore excludes these two kinds of degeneration. It is not proved for general solutions and is not by itself a complete higher-regularity continuation theorem. The strain equation has now been differentiated and has the same principal matrix L_Q. Its round reaction eigenvalues are −52K and −12K. The nonlinear L2 and quartic energies yield decay from small initial L4 strain, conditional on persistent pinching and a uniform Sobolev constant; see [E19](../notes/20_CRITICAL_STRAIN_ENERGY_20261122.md).

A [temporal budget](../notes/24_TEMPORAL_BOOTSTRAP_20261122.md) supplies those two geometric interval hypotheses: if eta=sup|q(0)| and a=CJ, then sup|q(t)|≤sqrt(3)((1+eta)exp(a)−1), while a valid Sobolev constant is S0 exp(a). Finite J at a finite endpoint also gives continuous connection and curvature limits with strictly definite limiting curvature, interpreted distributionally. The [E138–E143 assessment](../reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md) supplies the additional uniform-radius and smooth-slice recovery argument, yielding smooth original extension at any finite J. The [sequential criterion](../reviews/E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md) equivalently uses one positive uniform normalized connection/curvature accumulation pair. The [real criterion](../reviews/E145_E147_REAL_CONTINUATION_ASSESSMENT_20261122.md) expresses the same finite budget through complete-sphere transport moments, without a quantitative eigenvalue floor in its comparison constants. These are retained from the historical 117-page checkpoint. The [geometric criterion](../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md), now in the verified 120-page manuscript, supplies that compact sequence from real transport, injectivity and diameter bounds on a homotopy four-sphere. A general base also supplies a direction-distortion bound. The bounds themselves remain hypotheses.

The stronger L^{4,1} initial strain norm controls J for the [actual round linear bundle equation](../notes/22_ROUND_LORENTZ_HEAT_20261122.md), and for a [fixed flat semilinear model](../notes/23_SEMILINEAR_LORENTZ_MODEL_20261122.md) with small data. These results do not control the variable principal operator in Fine’s nonlinear evolution. A [periodic example](../notes/25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md) disproves the proposed direct second-derivative forcing bound from that Lorentz norm alone. The gauge audit found a third derivative in the literal live-vertical-adjoint formula. Freezing that adjoint gives a checked smooth local construction. The independent curvature system now supplies a separate small continuous-data adjusted theorem; identifying an incoming unadjusted endpoint still requires gauge control.

On a smooth homotopy sphere, the static sufficient condition K|q|+6|∇A T|+(42+8sqrt3)|T|²≤K implies the hypotheses of the established Chang–Gursky–Yang sphere theorem. This is a [checked calibration](../notes/15_STATIC_TRANSPORT_SPHERE_CRITERION_20261122.md), not a construction of qualifying data or a statement of flow convergence.

## Local gauge, scalar positivity and finite-time recognition

The [fixed-adjoint local construction](../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md) includes both the second-order parabolic system and the reverse/forward automorphism correspondence. Its principal coefficients have a [value-only dependence](../notes/30_CURVATURE_COEFFICIENT_REGION_20261122.md) on A and F_A; a small C0 value neighborhood preserves the symbol gap in the reference pairing. These symbol observations alone do not control the gauge path. The later E138–E143 argument uses uniform value radii and one late smooth slice to prove original continuation without recovering from the continuous endpoint itself.

The [scalar divergence identity](../notes/35_CRITICAL_STRAIN_YAMABE_20261122.md) gives
Y(M,[ghat]) >= 3/C_S − (48+24 sqrt(3))||T||4².
This static conformal-positivity estimate needs no small q or quantitative eigenvalue floor, but does need a supplied scalar Sobolev constant. Positive Yamabe alone does not supply a sphere theorem.

On a homotopy sphere, [E31–E32](../reviews/E30_E32_RECOGNITION_ASSESSMENT_20261122.md) give a more direct conditional objective than full flow convergence: smooth existence for an explicit finite interval, uniform small pointwise q, one Sobolev constant and small initial L4 strain select a time slice with ||R_K||2 below min(2 pi,sqrt(3)/(2 C_S)). The known Chang–Gursky–Yang theorem then gives the standard smooth sphere. The existence and interval geometry remain genuine hypotheses.

The [Bianchi-completed curvature symbol](../notes/34_CURVATURE_BIANCHI_SYMBOL_20261122.md) is coercive on all two-form amplitudes at a definite reference. It motivates [B29](../brainstorm/notes/B29_COUPLED_CURVATURE_SYSTEM_20261122.md), a specified independent A,F system with a curvature-compatibility constraint. The [assessed small continuous-data construction](../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md) provides uniform trace, positive-time smoothness and preserved compatibility in a fixed-reference value tube and specified completed uniqueness class. [Adjusted continuation](../reviews/E45_ADJUSTED_CONTINUATION_ASSESSMENT_20261122.md) follows while a trajectory of that same equation stays in a sufficiently small value neighborhood. Its preservation and the relation to an incoming unadjusted endpoint remain separate. The [assessed round stability and smoothing transfer](../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) give global original flow for smooth inputs small in connection and curvature values relative to the round reference, with exponential convergence modulo time-dependent bundle automorphisms. This is a local basin on standard S4; it does not supply arbitrary-sphere initialization or an intrinsic-strain criterion. [B37](../brainstorm/notes/B37_FINITE_P_CRITICAL_CONTROL_20261122.md) separately tests a finite-p critical Besov norm for highest-order nonlinear control; consult the sole register for execution status.

## Scoped failures and remaining obligations

| Tested shortcut | What the actual example or calculation establishes |
| --- | --- |
| Least-eigenvalue or scalar-defect maximum argument | Local polynomial connection jets give the wrong initial sign; [E02C](../notes/04C_VOLUME_AND_JETS_20261122.md), [E08](../notes/10_SCALAR_PINCHING_JET_20261122.md). No global preservation counterexample is claimed. |
| Smooth invariant scalar repair | Every C³ invariant scalar of Q with nondegenerate minimum at I fails the tested principal scalar closure; [E11](../notes/13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md). Other types of estimates remain open. |
| Same-point speed controls strain | At Q=I the actual velocity can vanish with arbitrary local strain; [E07](../notes/09_DISSIPATION_KERNEL_20261122.md). Integrated coercivity is unaffected. |
| Small integral energy/speed or spatial L⁴ strain controls worst distortion | Actual uniformly definite connections on round S4 concentrate while these integrals vanish; [E10](../notes/12_CONCENTRATED_INITIAL_DATA_20261122.md), [E12](../notes/14_CRITICAL_STRAIN_CONCENTRATION_20261122.md). No actual singular trajectory is constructed. |
| Unqualified affine gluing | Gauge-equivalent round endpoints have a nondefinite midpoint; [E06](../notes/08_AFFINE_GLUiNG_COUNTEREXAMPLE_20261122.md). Gauge-aligned and otherwise controlled gluing are not excluded. |

The full route still requires initial definite data on an arbitrary smooth homotopy sphere, genuine along-flow control of the remaining quantities, a regularity/compactness mechanism and either an appropriate limit or the finite-time recognition hypotheses. An ASD metric on such a sphere already implies the standard smooth type by the signature and developing-map argument; that is an equivalent endpoint, not the missing existence proof. The earlier complex and neutral-signature manuscripts supply neither that Riemannian metric nor the initialization hypothesis.

## Whole-time control in a fixed critical basin

The [combined E62–E67 assessment](../reviews/E62_E67_GLOBAL_CRITICAL_ASSESSMENT_20261122.md) proves J(infinity)≤C delta for smooth compatible input near the fixed round reference, where delta is the localized B^(1/2)_(8,1) norm of (Ain−A0,F_Ain−F0). The actual coupled system has a small critical solution with strong trace and agrees with the smooth compatible rough-local solution. Its critical norm controls the initial strain budget. Quantitative smoothing at one fixed positive time gives a linear Hm bound for entry into the exponential stable tail. The original recovery, overlap and native/E14 clock conversion are included.

Thus metric and Q quadratic forms stay within exp(±4512 sqrt(2) C delta) of their initial forms. The sufficient condition ||Uin||L8+||D0Uin||L(4,1) is a full fixed-gradient condition. The assessed B43/E66/E70 estimate bounds this full-pair norm by live Lorentz strain for a connection already in the two exact fixed round slice equations and small value tube. B44/E71 supplies the fixed linear projection; B47/E79/E80 supplies the actual varying infinitesimal inverse and its finite-dimensional residual. The smooth local section below supplies representatives in a smooth neighborhood, without proving placement throughout the value tube.

The [smooth-limit extension](../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md) proves convergence of the original round-basin flow, recovery maps and inverses in every fixed spatial order to a smooth pullback of the round pair and metric. One fixed H6 entrance threshold suffices; higher constants may depend on the smooth datum. Under critical initial smallness, [E74/E75](../reviews/E74_E75_RECOVERY_LIMIT_ASSESSMENT_20261122.md) additionally bounds the limiting maps by C delta in C1 from identity. The later slice construction uses the actual varying inverse and Hamilton's checked primary hypotheses.

## Reading onward

Read the [working manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex), [E01 foundation assessment](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md), [E02 assessment](../reviews/E02_NONLINEAR_ASSESSMENT_20261122.md), [E03 assessment](../reviews/E03_COORDINATE_ASSESSMENT_20261122.md), [E04–E07 assessment](../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md) and [E08–E13 assessment](../reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md). The [continuation](../continuation-notes/CONTINUATION.md) supplies the current handoff; consult the register before assigning anything. Earlier derivations and setup records remain historical evidence with their original scopes.

## Intrinsic control near the smooth round orbit

The [E82–E85 assessment](../reviews/E82_E85_LOCAL_SECTION_ASSESSMENT_20261122.md) gives a pointed smooth tame local right inverse of the full action map (g,b) to g*(A0+b), with b satisfying S0*b=d0*b=0. The augmented elliptic solver, full equivariant automorphism chart and derivative right inverse satisfy Hamilton's stated hypotheses. The section maps A0 to (id,0); it makes no uniqueness claim modulo stabilizers.

The [E84/E86 assessment](../reviews/E84_E86_INTRINSIC_ORBIT_ASSESSMENT_20261122.md) combines this section with the fixed-slice estimate and critical theorem. On an open smooth invariant neighborhood W of the round orbit, sufficiently small intrinsic live L(4,1) strain gives global original flow, J(infinity) bounded linearly by that strain, and smooth exponential convergence to a fixed round pullback. Lorentz strain and J are exactly invariant under fixed bundle pullbacks and the stated native normalization. Higher convergence constants may depend on the datum; budget constants are uniform across W. The smooth neighborhood may involve higher finite norms. The [E88/E89 endpoint inverse](../reviews/E88_E89_LORENTZ_ORBIT_ASSESSMENT_20261122.md) controls the vertical parameter in W(1,(4,1)) and C0 and the horizontal parameter in L(4,1), uniformly under value smallness. It is an infinitesimal result.

The [E90/E92 geometric consequence](../reviews/E90_E92_GEOMETRY_ASSESSMENT_20261122.md) compares the initial metric to its limiting round pullback by e^(±D), with D=4512 sqrt(2) C ell. Their volume forms agree pointwise. Distances have factors e^(±D/2), all nonnegative scalar eigenvalues have factors e^(±D), and a supplied round Sobolev inequality transfers with only its gradient coefficient multiplied by e^D. These conclusions retain W and the intrinsic threshold; they add no curvature or injectivity-radius estimate.

The [actual E95/E96 example](../reviews/E95_E96_CURVED_ORBIT_ASSESSMENT_20261122.md) shows that the chosen horizontal inverse is not C1-continuous in a specified joint critical topology, even on perfect round pullbacks. Both the connection/curvature pair and the varying forcing/exterior-derivative pair converge, while the horizontal derivative grows. The corresponding auxiliary finite flows still converge in C1 by exact conjugacy, and the original Fine flows are stationary. This identifies a failed instantaneous estimate without excluding finite placement. The [Feehan source comparison](../reviews/E93_SOURCE_COMPARISON_ASSESSMENT_20261122.md) leaves separate norm/quotient and horizontal obligations. The [E98/E99/E101 result](../reviews/E98_E101_VERTICAL_GAUGE_ASSESSMENT_20261122.md) supplies a smooth internal Coulomb representative with W1,8 control and a C1-small internal gauge from small connection/curvature values. The [E102–E106 assessment](../reviews/E102_E106_DEFECT_AND_OSCILLATION_ASSESSMENT_20261122.md) separates a static no-slice strain-to-pointwise-defect estimate from an actual perfect sequence with unbounded critical curvature in its internal Coulomb representatives. The horizontal equation remains a separate requirement.

The [global integrated energy consequence](../reviews/E104_E108_GLOBAL_STRAIN_ENERGY_ASSESSMENT_20261122.md) supplies uniform pointwise pinching and a scalar Sobolev constant from the adjusted head and stable tail, after reducing the initial value threshold. Exact pullbacks transfer these geometric hypotheses to the original flow. Separately small initial live L4 strain then gives global quadratic/quartic decay and weighted gradient integrals. This does not control J. The [frozen multiscale assessment](../reviews/E109_E111_FROZEN_MULTISCALE_ASSESSMENT_20261122.md) shows why an energy-to-supremum implication needs additional information. B61/B62 test the actual round linearization, the derivative obstruction to a uniform nonlinear linear bound, and the Lorentz summability threshold. Their current assessment state belongs to the sole register.

The [actual round multiscale extension](../reviews/E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md) is assessed: attained connection tangents have small value/L4 data and a growing full-derivative time integral. The [Lorentz-index calculation](../reviews/E116_E117_LORENTZ_THRESHOLD_ASSESSMENT_20261122.md) gives exact initial norm order and a matching derivative upper bound at index one from E22. The [nonlinear derivative consequence](../reviews/E115_E118_NONLINEAR_LINEAR_BUDGET_ASSESSMENT_20261122.md) excludes a uniform estimate linear in initial live L4 strain on every tested value neighborhood. Its fixed-N limit does not assert nonlinear unboundedness. The separate [E119/E122 uniform remainder](../reviews/E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md) and [E123/E124 nonlinear combination](../reviews/E123_E124_NONLINEAR_MULTISCALE_ASSESSMENT_20261122.md) are now assessed and establish unbounded finite budgets across actual smooth global families with vanishing initial values and any fixed Lorentz-index-greater-than-one and L4 strain sizes. Current status remains in the sole register.

B65/E125/E127 gives the assessed adjusted defect equation, and B66/E128/E130 gives mixed critical coefficient products and the full third weighted jet. The [assessed head](../reviews/E129_E132_INTRINSIC_HEAD_ASSESSMENT_20261122.md) and [defect-sensitive tail](../reviews/E131_E134_WHOLE_TIME_ENDPOINT_ASSESSMENT_20261122.md) combine to J <= C ell throughout one fixed smaller round value basin, with no separate strain threshold, slice equation or initial higher-derivative bound. Finite H5 defect smoothing and a uniform H10 stable background preserve the initial defect size through the tail. The [joint comparison](../reviews/E133_E135_ROUND_COMPARISON_ASSESSMENT_20261122.md) bounds the fixed-reference pair distance to one common round pullback by Ce^(C ell) ell and extends the exact-volume and relative geometry conclusions to that basin. Intrinsic conclusions extend under fixed bundle pullbacks; the absolute pair norm retains its specified reference.


## Intrinsic compactness and small-strain follow-up — 22 November 2026

The [assessed metric compactness theorem](../reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md)
now gives a positive C1 metric limit modulo smooth same-base diffeomorphisms
from absolute Ricci, W+, volume lower and diameter bounds on a fixed smooth
homotopy four-sphere. It uses a directly constructed minimum-radius limit,
the precise BKN supplied-candidate theorem and the smooth ALE core topology
obstruction; it does not erase a hypothesis from Anderson's theorem.
Consequently a supplied original flow extends at a finite endpoint if Psi
and diameter are simultaneously bounded along one late sequence. Neither
bound is yet an a priori estimate for a general flow.

The [single-slice small-strain result](../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md)
adds |Q−I|≤72G and Ric≥3g/4 when sup G is below a specified universal
threshold, where G=|nabla^A T|+|T| squared in native units. Its spectral
commutator and induced plane curvature proof needs no diameter, Sobolev
bound or eigenvalue floor. A separate B87 combination tests whether this
supplies intrinsic entry into the existing round-flow basin. The sole
register records its assessment status and manuscript integration.


## Intrinsic global entry and the long-time frontier — 22 November 2026

The [E177/E178 assessment](../reviews/E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md) accepts the general fixed-family energy-entry theorem. For fixed smooth homotopy four-sphere M and SO(3) bundle P, finite initial bounds on sup Psi and diameter, together with sufficiently small total native defect energy, imply global smooth definite original flow and smooth exponential convergence to one fixed round pullback. Its threshold depends non-effectively on M/P and the two bounds. The assessed static small-strain estimate supplies a small-initial-sup-Psi corollary, without a supplied diameter or Q bound. These are initial-data hypotheses, with no bounds assumed on the later trajectory; existence of qualifying data remains separate.

The mechanism uses the common local interval to turn a positive continuous normalized limit into a smooth positive-time pair. Energy invariance and dissipation force that limit to be perfect. The exact smooth round bundle identification and fixed original-tail splice then invoke the established round basin. The E174/E176 conditional predecessor is preserved, with Hsmall discharged in its assessment. The working manuscript now contains the general theorem and corollary; its integration audit and PDF verification are separate records.

The [E179/E181 assessment](../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) establishes smooth critical accumulation after one fixed positive time shift and bundle normalization from bounded late-sequence Psi and diameter. The limiting energy is either zero with an actual fixed round tail, or at least the positive E177 family threshold with a nonperfect critical accumulation point. Whole-orbit convergence at positive energy and exclusion of that case remain open. This result and the intrinsic entry theorem are in the verified 133-page manuscript checkpoint. B90 examines thresholds uniform over varying bases and bundles; consult the sole register for assessment. Further work concerns a priori bounds, relevant critical limits and qualifying initial data.


The [E182/E183/E185 assessment](../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) now accepts varying-base metric compactness and thresholds uniform across the specified bases and bundles. E188 integrates them in the verified 135-page manuscript. The accepted fixed-family result is the reference-family lemma; it is not silently reinterpreted. E186 separately identified metric taming and C2 comparison gaps in applying Fine’s twistor proof. The subsequent [E190/E192 assessment](../reviews/E190_E192_C0_PERSISTENCE_ASSESSMENT_20261122.md) supplies C0 persistence of a fixed embedded regular sphere. The [E191/E194 assessment](../reviews/E191_E194_C1_TWISTOR_ASSESSMENT_20261122.md) uses it in a strong pointed C1 metric comparison, with metric taming still supplied. The [E196/E197 assessment](../reviews/E196_E197_TAMED_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) combines that exclusion with the explicitly attributed ALE classification and sphere premise: bounded Ricci/W+, positive lower volume and upper diameter/Euler bounds give strong C1,1/4 and weak W2,8 compactness of the metric-tamed class and finitely many oriented types. This is an independent metric application. The original classification bodies remain uninspected; no native-flow or initialization consequence is inferred. The assessed E187/E189 finite stationary-kernel obstructions motivate the separately specified axial sign classification in B97.


## Stationary pinching and late spectral continuation — 23 November 2026

The [E199/E201 assessment](../reviews/E199_E201_AXIAL_STATIONARY_SIGN_ASSESSMENT_20261123.md) gives the exact axial derivative-kernel sign classification. The [E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) gives full-kernel coercivity on the general eigenvalue-ratio class at most 9/4 and applies the integrated identity to supplied smooth critical connections, forcing perfection. The [E205/E206 assessment](../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) transfers the same closed limsup along the bounded late sequence to the smooth critical limit and gives an actual fixed round tail. It does not require original-flow pinching preservation, and does not construct qualifying data.

B100/E207 records a bounded primary-source comparison with canonical version receipts and no novelty claim. The [E209/E210 assessment](../reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md) now supplies the static native inequality D≥gamma E+beta G on the supplied ratio≤9/4 class, with explicit nonoptimal constants and verified old/native factors. The [E212/E213 assessment](../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) converts it to an accumulated-good-time energy bound. Together with the bounded geometric late sequence, infinite occupation or one strictly subthreshold finite test gives an actual fixed round tail. The finite test uses past occupation only; convergence itself forces eventual full occupation. E214/E216 are assessed and the 148-page normal PDF is verified. B103/E215 tests the local scalar spectral-ratio maximum mechanism at the boundary on an actual connection germ; no original-flow preservation or qualifying initial data has been established.

B104/E218/E219 now supplies the assessed sharp stationary form range rho≤7/2, with the precise frozen-v1 endpoint coefficient correction and current v2 execution recorded. B105/E220/E222 discharges H_sharp: actual critical perfection and the late-sequence criterion hold at the closed bound, while quantitative gradient and occupation estimates hold at each fixed strict r<7/2. E224 repairs are applied; normal PDF remains the verified148-page checkpoint pending combined verification. B106/E223/E225 and B107/E227/E228 are assessed as pointwise speed-absorption obstructions at and near the endpoint, with no integrated counterexample. B108/E229 tests an effective linear coercivity bound, while E231 derives its conditional margin-weighted energy consequence; assessment status is in the sole register.
