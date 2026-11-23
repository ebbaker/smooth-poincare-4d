# Broad-run research findings

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. The author explicitly activated sustained research and Sol 6.2 delegation. The selected lead and effort were preserved; their actual identifiers were not exposed. Helpers were configured as gpt-6.2-sol/ultra. This is an explanation of assessed working results, not independent peer review, a novelty claim or a proof of the smooth Poincaré conjecture. The [register](../../research-progress/REGISTER.md) is the sole status source.

The run has turned the proposed real-coordinate comparison into explicit quantities and equations. Its most useful remaining target is now concrete: control the time integral of the supremum of the horizontal strain derivative and squared strain. A finite integral controls metric distortion, the eigenvalue floor and continuous finite-time limits. Proving it for the nonlinear flow and obtaining a full smooth continuation theorem remain open.

## The exact flow and a correction to the earlier account

Use a smooth round-positive definite SO(3) connection on an oriented real Riemannian four-manifold. Fix K>0, the manuscript's internal metric delta and the unadjusted base/bundle identification. The curvature determines Q>0 with trace three and ghat through
F=−K sqrt(Q) Sigma, mu=(1/3)ΣF_i∧F_i=2K²dV_ghat.
Let q=Q−I. Fine's actual flow in this normalization is
\[
A_t=-4d_A^{*\widehat g}[(q-|q|^2I/6)F].
\]

The [exact nonlinear equation](../../notes/04A_NONLINEAR_Q_20261122.md) is
\[
Q_t=\nabla^c(L_Q\nabla_cQ)+\sum_c[\nabla_cQ,\Xi_c]
       -24K\sqrt{\det Q}\,q,
\]
where L_Q(H)=2(QH+HQ)−(4/3)tr(QH)Q and Xi retains the compatibility difference A−Gamma+. Its principal coefficient is self-adjoint and positive, with bounds 4lambda_min and 4lambda_max. Uniform ellipticity can still fail at the boundary.

A stronger-than-expected identity is **mu_t=0 pointwise**, not merely conservation of total volume. The earlier flow-specific suggestion that this density might vary was corrected, while arbitrary connection paths can still change it. Fixed volume does not control anisotropy of the metric.

If |q|≤1/8 persists on a smooth closed interval, the [energy calculation](../../notes/07_PINCHED_ENERGY_GAP_20261122.md) gives
\[
\mathcal P'\le-2\int|\nabla Q|^2\mu-36K\mathcal P,
\qquad \mathcal P=\int|q|^2\mu.
\]
It also excludes nonperfect critical connections in that pointwise region. Persistence is a premise, not a consequence of this inequality.

## What the real coordinate comparison now measures

The ray map phi(u)=sqrt(Q)u/|sqrt(Q)u| compares connection and metric direction spheres. Its horizontal error has a rotation part and a remainder
\[
\mathcal R_X(f)=(I-f\otimes f)T_Xf,\qquad
T_X=\tfrac12(Q^{-1/2}\nabla_X^A Q Q^{-1/2})_0.
\]
On the complete unit target sphere,
∫|R_X|²domega=(4pi/5)|T_X|². Thus T is reconstructed from a measured whole-fiber remainder. This is the natural O(2) vertical tangent bundle. The earlier O(1) first-jet construction is retained as a checked round model with its real quaternionic condition; it has not been promoted to a general off-integrable chart theorem.

The [comparison and its derivative](../../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md) give
\[
|\nabla Q|\le6|T|,\quad |A-\Gamma^+|\le2\sqrt3|T|,
\]
\[
\left(|W^+|_{\rm op}^2+\tfrac14|\operatorname{Ric}_0|^2+
\tfrac1{48}(s-12K)^2\right)^{1/2}
\le K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2.
\]
No lower eigenvalue bound is assumed in these constants. The quantities on the right can themselves be large. The opposite Weyl component W− is absent from this pointwise chiral identity.

The [temporal estimate](../../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md) is particularly useful. With
J(t)=∫_0^t sup_M(|∇A T|+|T|²) ds and C=4512sqrt2,
\[
e^{-CJ(t)}\widehat g(0)\le\widehat g(t)\le e^{CJ(t)}\widehat g(0),
\qquad \lambda_{\min}(Q(t,x))\ge e^{-CJ(t)}\lambda_{\min}(Q(0,x)).
\]
This is a direct conditional dynamical result. It does not assume small initial energy. It also does not prove J finite or supply all higher derivative estimates needed for continuation.

## Which simpler arguments failed

The failures have explicit, limited scopes.

- Actual local connection jets defeat the least-eigenvalue and scalar-defect maximum arguments. A stronger test excludes the same principal mechanism for every C³ invariant scalar of Q with a nondegenerate minimum at I. These local tests do not establish failure of global preservation on a closed manifold.
- At a single point, Q can equal I and the actual flow speed can vanish while the horizontal strain is arbitrarily large. This does not contradict integrated coercivity.
- Actual globally defined perturbations of the round connection can have energy, squared speed and spatial L⁴ strain tending to zero while worst distortion stays away from its round value. These are families of initial data, not singular trajectories.
- Affine averaging can destroy definiteness even between gauge-equivalent round connections. Aligning those gauges removes that particular problem; all gluing schemes are not excluded.

The [control assessment](../../reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md) links the exact constructions and quantifiers.

## The next positive estimates

The [strain equation](../../notes/17_STRAIN_EVOLUTION_STRUCTURE_20261122.md) has the same principal coefficient L_Q. Its first derivative-Laplacian commutator involves Ricci and internal curvature; it does not require W− at that step. The round reaction spectrum is −52K and −12K. This supplies the negative term in a [conditional nonlinear strain-energy estimate](../../notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md):
\[
\frac d{dt}\int|T|^2dV\le-\int|\nabla T|^2dV-K\int|T|^2dV+C\int|T|^4dV
\]
under a sufficiently small pointwise Q-defect throughout the interval. The [quartic-energy calculation](../../notes/20_CRITICAL_STRAIN_ENERGY_20261122.md) additionally shows that a uniform Sobolev inequality and small initial L4 strain keep that critical norm small and make it decay, while pointwise pinching remains an interval hypothesis. The evolving inverse metric was included; fixed volume does not make the norm time-independent.

A [separate fixed-round benchmark](../../notes/19_LORENTZ_SPATIAL_BENCHMARK_20261122.md) controls oscillation of log D by the stronger Lorentz L^{4,1} norm of T. It survives the logarithmic concentration example that defeats L⁴. It assumes a supplied round reference geometry, with an explicit comparison factor if reconstructed norms are used. The [actual round linear equation](../../notes/22_ROUND_LORENTZ_HEAT_20261122.md) now has the desired temporal estimate from this Lorentz initial norm. A [fixed flat semilinear model](../../notes/23_SEMILINEAR_LORENTZ_MODEL_20261122.md) also admits a global small mild solution with that bound. These are separate from the full nonlinear geometric evolution.

The static condition K|q|+6|∇A T|+(42+8sqrt3)|T|²≤K on a homotopy sphere implies the hypotheses of the known [Chang–Gursky–Yang sphere theorem](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3). This is a checked application of an existing classification, not a construction of the required connection or a proof of convergence to it.

The [temporal budget calculation](../../notes/24_TEMPORAL_BOOTSTRAP_20261122.md) combines pinching and the Sobolev bound into one explicit sufficient bound on J. Finite J at a finite endpoint also gives continuous definite curvature and connection limits. This remains weaker than smooth extension.

A [frequency example](../../notes/25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md) shows why the semilinear proof cannot simply absorb the varying second-order coefficient as an ordinary forcing term: its required time-integrated second-derivative estimate fails even for a flat heat equation. The actual gauge operator has been audited, and a fixed-vertical-adjoint version gives a checked smooth local construction. Initializing appropriate definite data on arbitrary smooth homotopy spheres is still separate. The [continuation guide](../../continuation-notes/CONTINUATION.md) identifies the next executable analysis.

## The current gauge dependency

The [gauge audit](../../reviews/E26_E27_GAUGE_ASSESSMENT_20261122.md) found a specific derivative-order issue in the live-adjoint reading of Fine’s printed adjusted equation: the metric depends on curvature, so differentiating the vertical codifferential introduces a third derivative away from the reference connection. It vanishes at the reference, leaving that second-order symbol calculation intact. Freezing only the base metric in the vertical adjoint produces a second-order quasilinear operator with the same parabolic reference symbol. Local PDE solvability and the reverse/forward automorphism correspondence are now checked in the [local-flow assessment](../../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md). This scoped calculation does not refute Fine’s stated existence conclusion, and that smooth local proof does not establish restart from the continuous endpoint supplied by the temporal criterion.


## Finite-time recognition and a separate scalar estimate

The [E31–E32 calculation](../../reviews/E30_E32_RECOGNITION_ASSESSMENT_20261122.md) shows that full convergence is unnecessary for one conditional sphere conclusion. If a smooth solution on a homotopy four-sphere retains small pointwise q and a uniform Sobolev constant, small initial L4 strain decays. Integrating its gradient energy over a window of length 1/K selects a slice with small L2 reconstructed chiral curvature error. After the explicit waiting time in the manuscript, that slice satisfies the known Chang–Gursky–Yang theorem. The interval of smooth existence and its geometric bounds are still hypotheses.

A [scalar divergence identity](../../notes/35_CRITICAL_STRAIN_YAMABE_20261122.md) also proves
Y(M,[ghat]) >= 3/C_S − (48+24 sqrt(3))||T||4².
It does not assume small q or a quantitative eigenvalue floor. The derivative of the connection mismatch becomes a divergence, so integration transfers it to the conformal test function. This supplies positive Yamabe constant from sufficiently small critical strain, but not the separate Weyl-energy bound required for sphere recognition.

## The curvature formulation and its remaining analytic step

The [coupled system](../../notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md) evolves A and an independent F. A Bianchi completion and a correction proportional to F−F_A make its reference symbol parabolic. For supplied smooth solutions, the constraint obeys a covariant Hodge heat equation, so exact curvature compatibility persists. On compatible data it is precisely the corrected adjusted flow. The principal coefficients depend on values of A,F, while lower terms include first derivatives and fixed reference derivatives.

The continuous endpoint pair from finite J can be [approximated by smooth compatible data](../../notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md) with a common continuity modulus. The [Koch–Lamm source audit](../../notes/37_ROUGH_DATA_SOURCE_TEST_20261122.md) identified the relevant contraction and parameter method. The [subsequent construction and audits](../../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md) now supply compact-bundle linear estimates and a local solution for continuous pairs that are uniformly small relative to one fixed smooth definite reference. It is continuous at the starting time, smooth afterward, and retains compatibility. Uniqueness is in a specified small completed parabolic space; bare continuity is not the uniqueness hypothesis. The lifespan depends on the fixed reference and coefficient bounds, not on derivatives of the datum.

The [continuation corollary](../../reviews/E45_ADJUSTED_CONTINUATION_ASSESSMENT_20261122.md) then rules out a finite endpoint for an adjusted trajectory that remains in that same small value neighborhood. Its proof restarts shortly before the alleged endpoint and uses smooth uniqueness to identify the overlap. This does not prove that small initial data stay in the neighborhood. A separate fixed-reference stability gauge near the round perfect connection is the next bounded test.

Gauge recovery remains separate. A [flat heat example](../../notes/39_GAUGE_DERIVATIVE_HEAT_MODEL_20261122.md) has continuous data and integrable uniform gradient speed but an infinite time integral of the uniform Hessian. Dini continuity supplies that stronger estimate; continuity alone does not. This only limits one direct method of controlling derivatives of the recovering automorphism. It is not an actual geometric-flow failure.

References are maintained in the [shared canonical catalog](../../../../../references/README.md) and its linked version-specific source records; the [branch reference guide](../../references/README.md) maps them to this investigation.


## Round basin and a stronger critical calibration

The [round stability proof and transfer](../../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) now give a concrete nonlinear result on standard S4. A smooth initial connection sufficiently close to the fixed round one in both connection and curvature values has global original Fine flow and exponential convergence after time-dependent bundle automorphisms. Positive-time smoothing first turns small values into a high-Sobolev-small connection. A separate fixed-gauge contraction then gives the stable tail, and smooth uniqueness makes its recovered original path agree with the initial path on an overlap. There is no uniform higher-derivative smallness requirement on the smooth input. The theorem does not start the original equation from genuinely continuous data. The [later E76/E77 extension](../../reviews/E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md) establishes a smooth limiting automorphism and inverse, and smooth exponential convergence of the original connection, curvature and metric to their pullbacks from the round reference. It uses the same single H6 basin: each higher derivative estimate absorbs the decaying low-order coefficient at a later finite time. Higher constants depend on the datum. The [E74/E75 result](../../reviews/E74_E75_RECOVERY_LIMIT_ASSESSMENT_20261122.md) adds a C delta bound on the C1 distance of the limiting maps from identity for critical data.

This basin uses an already supplied round reference. It therefore does not resolve the initialization problem on an arbitrary smooth homotopy sphere, or bound the temporal strain budget from intrinsic strain alone. The full derivations and internal audits are retained; no novelty certification is claimed relative to Fine's earlier stability statement.

The next calibration uses a different critical norm to address the highest-order perturbation. [E53](../../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md) derives a full-gradient L^(4,1) embedding into B^(1/2)_(8,1) on flat T4 and a damped heat estimate controlling the integrated uniform Hessian. Its full gradient is not automatically the geometric strain. The specified nonlinear calibration tests whether this norm absorbs value-dependent principal coefficients, beyond the earlier semilinear model.


The [flat quasilinear model](../../reviews/E54_CRITICAL_MODEL_ASSESSMENT_20261122.md) now closes in the critical norm, including its value-dependent highest-order coefficient. The [fixed compact linear construction](../../reviews/E57_COMPACT_CRITICAL_ASSESSMENT_20261122.md) transfers the linear estimate to a specified compact bundle without assuming a symmetric operator or spectral gap. The [geometric dictionary](../../reviews/E59_CRITICAL_STRAIN_ASSESSMENT_20261122.md) proves that a smooth compatible path with that norm controls the real temporal strain budget. The [combined assessment](../../reviews/E62_E67_GLOBAL_CRITICAL_ASSESSMENT_20261122.md) now supplies the actual nonlinear budget. E60 and its audit prove the local critical estimate and identify the compatible solution. E63 gives a linear smoothing bound at a fixed positive time. Applied to E62, this gives J(infinity)≤C delta for small full-pair critical initial norm delta. E62 retains its original conditional form as a historical packet; the combined implication is recorded separately. This proves temporal control in a fixed round basin without replacing the full initial norm by intrinsic strain alone.

## Intrinsic strain on a neighborhood of the round orbit

The fixed-slice estimate converts geometric strain into the stronger critical initial norm, but it needs two exact equations for the representative connection. The [new local-section construction](../../reviews/E82_E85_LOCAL_SECTION_ASSESSMENT_20261122.md) supplies such representatives in a smooth neighborhood of the round connection. Its proof uses the actual infinitesimal bundle action and Hamilton's smooth tame right-inverse theorem, with a full automorphism chart and a pointed section at the reference. A linear projection by itself would not supply this finite representative.

The [intrinsic consequence](../../reviews/E84_E86_INTRINSIC_ORBIT_ASSESSMENT_20261122.md) now holds on all smooth bundle pullbacks of that neighborhood. Small live Lorentz strain gives global original flow, a linear whole-time strain budget and smooth convergence to a fixed round pullback. The norm and the budget are exactly preserved by those pullbacks, so no derivative bound on the chosen fixed automorphism enters the budget constant. The smooth neighborhood may still require higher finite-norm smallness. Reaching every value-small or critical datum by this slice construction remains a distinct problem, as does constructing definite initial data on an arbitrary homotopy four-sphere.

The [quantitative geometric consequence](../../reviews/E90_E92_GEOMETRY_ASSESSMENT_20261122.md) says more about the initial metric within this neighborhood. It is uniformly close to the limiting round pullback, with an exponential comparison factor linear in the intrinsic strain in the exponent, and the two volume forms agree exactly. This gives distance, scalar spectrum and Sobolev comparisons. It does not give bounds on initial curvature or higher coordinate derivatives.

A [new actual round-orbit example](../../reviews/E95_E96_CURVED_ORBIT_ASSESSMENT_20261122.md) clarifies the remaining coordinate issue. Small smooth shears give actual perfect connections whose connection/curvature and varying forcing pairs converge in the critical norm. The selected infinitesimal horizontal inverse nevertheless develops large first derivatives. Its auxiliary finite flows remain C1-close to a fixed flow because they are exact conjugates by those small shears. The original Fine evolution is stationary on these perfect connections. Thus the failed instantaneous estimate does not rule out a finite coordinate construction. The subsequent finite internal Coulomb construction supplies that vertical step; the horizontal slice equation remains separate.

## What the static and integrated bounds now supply

The [internal gauge result](../../reviews/E98_E101_VERTICAL_GAUGE_ASSESSMENT_20261122.md) gives a smooth Coulomb representative with controlled first derivatives from small connection and curvature values. A [separate static estimate](../../reviews/E102_E106_DEFECT_AND_OSCILLATION_ASSESSMENT_20261122.md) bounds the pointwise defect Q−I by the live Lorentz strain without either slice equation. The same assessment contains actual perfect connections whose critical curvature norm remains large after controlled internal gauge changes. Thus the vertical step cannot simply replace the full slice requirement.

The [global energy result](../../reviews/E104_E108_GLOBAL_STRAIN_ENERGY_ASSESSMENT_20261122.md) uses the existing round value basin in a different way. After decreasing its value threshold, every adjusted time slice stays in a prescribed small geometric tube. That supplies pointwise pinching and a uniform Sobolev constant, which transfer exactly to the original slices. An independent small initial live L4 condition then gives quadratic and quartic strain-energy decay and weighted gradient integrals for all time. The value threshold and the strain threshold have different jobs.

These integrated energies leave the time integral of the spatial supremum open. The [frozen annular example](../../reviews/E109_E111_FROZEN_MULTISCALE_ASSESSMENT_20261122.md) has small initial L4 strain while many spatial scales contribute on distinct time windows to a large integral of the full strain derivative. The actual round extension and a finite-window nonlinear derivative test are tracked separately in the register. They must not be described as nonlinear blowup or as failure of all continuity moduli. The stronger L4,1 endpoint is being tested against the exact scale accumulation.

The [round extension](../../reviews/E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md) now realizes those scales as actual connection tangents. Its [Lorentz norms](../../reviews/E116_E117_LORENTZ_THRESHOLD_ASSESSMENT_20261122.md) show why index one matters: the initial L4,1 norm counts the same total scale contribution as the full derivative integral, and the existing round heat estimate gives a matching upper bound. Larger Lorentz indices fail that uniform linear estimate. The [nonlinear finite-window argument](../../reviews/E115_E118_NONLINEAR_LINEAR_BUDGET_ASSESSMENT_20261122.md) then excludes a uniform whole-time bound linear in initial L4 strain. It differentiates at each fixed finite number of scales and only afterward increases that number. A uniform nonlinear error estimate, tested separately in B63/E119 and B64/E123, would be required to conclude that nonlinear budgets themselves grow along data tending to zero.

## Nonlinear multiscale budgets

The [E123/E124 assessment](../../reviews/E123_E124_NONLINEAR_MULTISCALE_ASSESSMENT_20261122.md), using the assessed uniform [E119/E122 remainder](../../reviews/E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md), now gives actual smooth global round flows with arbitrarily large finite accumulated strain budgets even though initial connection/curvature value differences and initial L4 strain tend to zero. More generally this holds with any fixed Lorentz index greater than one, including weak L4, while retaining small ordinary L4 strain. Each trajectory remains smooth and converges; the growing quantity is the absolute integral across a family. Its initial L4,1 norm grows, so the endpoint control theorem is not contradicted. The subsequent homogeneous-defect argument now closes the endpoint on one fixed smaller value basin without a horizontal finite placement theorem, as detailed below.


## The intrinsic endpoint now holds on a fixed value basin

The [head and tail assessment](../../reviews/E131_E134_WHOLE_TIME_ENDPOINT_ASSESSMENT_20261122.md) proves J <= C ell for every smooth actual datum in one sufficiently small round connection/curvature value neighborhood, where ell is the initial live L4,1 strain. The threshold uses only the fixed value sizes, with no separate restriction on ell or initial higher derivatives. The defect equation is homogeneous, so its initial size stays visible while the small background controls its variable coefficients. A time-frequency product estimate handles the initial interval; fixed positive-time smoothing and a uniformly controlled stable tail finish the estimate.

The [joint round comparison](../../reviews/E133_E135_ROUND_COMPARISON_ASSESSMENT_20261122.md) also bounds the initial connection and curvature in fixed C0 norms relative to the same limiting round bundle pullback by Ce^(C ell) ell. The corresponding round metric has exactly the initial volume form; metric, distance, scalar spectrum and Sobolev comparisons follow. This does not estimate the recovering map's derivatives under these hypotheses. Together with the nonlinear multiscale family, the theorem distinguishes Lorentz index one from every fixed larger index for uniform budget control in this basin.

The [real whole-sphere comparison](../../reviews/E137_E139_REAL_COMPARISON_ASSESSMENT_20261122.md)
now has time-integrated control of its finite vertical derivatives,
horizontal mismatch with one specified base derivative, and positive
chiral curvature error on these actual flows. The fixed round basin
remains supplied. No initial definite connection on an arbitrary
smooth homotopy sphere is constructed.

## General continuation and its real transport form

The [E138–E143 result](../../reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md)
turns finite J at a finite time into smooth continuation of the
original flow on a general compact closed oriented four-manifold
in the chosen definite component. The budget can be arbitrarily
large but finite. The proof first separates the local value radius
from derivatives of the reference: those derivatives can shorten
the common local time for its datum ball. A continuous positive
connection/curvature endpoint then permits one smooth reference,
whose time is fixed before choosing one sufficiently late smooth
slice. Recovery from that slice crosses the endpoint, and smooth
original uniqueness identifies the overlap.

The [real transport equivalence](../../reviews/E145_E147_REAL_CONTINUATION_ASSESSMENT_20261122.md)
expresses the same criterion on complete direction spheres.
The real remainder reconstructs the strain by an exact sphere
moment; its specified Levi–Civita horizontal derivative reconstructs
the derivative of strain. Their fiber L2 norms give a temporal
quantity quantitatively equivalent to J, with universal constants
independent of a lower eigenvalue bound. This connects the real
comparison to continuation beyond the round basin. It does not
bound that quantity for arbitrary initial data or supply
holomorphic generalized coordinates. The general a priori estimate
and initial-data construction remain separate problems.

The [sequential criterion](../../reviews/E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md)
uses still less temporal information: one sequence of late slices
whose connection and curvature converge uniformly to a positive
pair after smooth bundle automorphisms suffices for extension.
It fixes one reference and its common local time before choosing
one member of the sequence. Derivatives of the normalizing maps
need not be uniformly bounded. This characterizes continuation
within the stated category; it does not produce the convergent
sequence. The current geometric compactness question therefore
keeps metric convergence, noncollapse and strain control as explicit
additional premises until their implications have been checked.

## A related scalar maximum argument does not transfer

The [bounded literature comparison](../../reviews/E149_CONTINUATION_SOURCE_ASSESSMENT_20261122.md) found a finite-time criterion for the different hypersymplectic flow. Its determinant-one Gram normalization suggests testing f=3(det Q)^(-1/3)−3 here. The [exact test](../../reviews/E152_E153_DETERMINANT_TRACE_ASSESSMENT_20261122.md) places that scalar in the earlier actual-jet obstruction: even at a strict local maximum with fixed scalar spatial two-jet, the original connection-flow derivative can be arbitrarily positive. This blocks that particular local scalar transfer. It does not show failure of a global bound or of the hypersymplectic theorem, and it leaves the geometric compactness route as a separate question.


## A geometric sequence now suffices

The [assessed geometric criterion](../../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md)
turns bounds on real transport density, injectivity radius and diameter
along one sequence approaching a finite endpoint into smooth original
continuation on a homotopy four-sphere. For a general base a uniform
direction-distortion bound is also supplied. The proof obtains metric
compactness from Anderson's precise theorem, lifts it to connection
compactness, and uses topology to rule out a degenerate limiting Q in
the homotopy-sphere case. It does not produce those bounds along a flow.

The next potential improvement concerns metric singularities themselves.
A [smooth ALE core obstruction](../../reviews/E162_ALE_CORE_TOPOLOGY_ASSESSMENT_20261122.md)
now treats the b2=0 cyclic quotient cases as well as positive b2, but
only for a supplied embedded full core. The analytic step that would
produce such a core remains a separate proof dependency.


## Intrinsic initial conditions now give a convergent flow

The analytic compactness dependency above has now been supplied and independently checked. The [metric theorem](../../reviews/E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) constructs the needed smooth rescaled limit and full-core embeddings, then proves positive metric compactness on the fixed base. Together with the topological pair argument, this removes the separate injectivity bound: Psi and diameter on one late sequence suffice for original finite-time continuation.

The [small-strain theorem](../../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md) has a different role. Small full strain derivative plus squared strain forces Q close to identity and positive Ricci. The apparent alternative, curvature concentrated in one internal direction, would produce a closed two-form with strictly positive square. The homotopy sphere's vanishing middle cohomology rules that out.

The [energy-entry theorem](../../reviews/E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md) then gives a global conclusion for existing data on a fixed smooth homotopy sphere and bundle. If the initial intrinsic transport density and diameter are bounded, sufficiently small total defect energy gives smooth original evolution for all time and exponential convergence to one fixed round pullback. Small initial sup Psi alone also suffices. These are non-effective thresholds for the fixed base and bundle. The proof reaches the round basin at positive time; it does not assert initial connection-and-curvature proximity to the round orbit.

The [late-limit assessment](../../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) now treats energy that need not approach zero. After one fixed positive time shift and bundle normalization, it gives a smooth critical accumulation point. Either the actual trajectory converges to one fixed round pullback and the limiting energy is zero, or the limiting energy is at least the same positive family threshold and the accumulated connection is nonperfect. The latter alternative does not assert whole-trajectory convergence. These results are included in the verified 133-page manuscript. They construct no qualifying initial connections on arbitrary smooth homotopy spheres.


The [uniform extension](../../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) now removes dependence of the energy threshold on a prescribed smooth base or bundle: only the stated Psi and diameter bounds enter. Small initial sup Psi has one universal threshold over the specified homotopy-sphere class. The proof first constructs actual smooth base comparisons and then uses the curvature polar maps to identify the bundles. The fixed-family theorem applies only after this reference is selected. The then-verified manuscript had135 pages. This is still a theorem about existing qualifying data; it supplies no construction on an arbitrary smooth homotopy sphere.

The [stationary derivative test](../../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) is now assessed. Exact rational certificates show four negative directions in the twelve-dimensional zero-velocity kernel at five sampled spectra, while the two remaining samples are positive definite. This excludes pointwise nonnegativity of the tested integrand as an unpinched proof method; it does not construct nonperfect critical connections or rule out a global gap by another argument.

## A metric twistor compactness consequence

A [regular-sphere persistence proof](../../reviews/E190_E192_C0_PERSISTENCE_ASSESSMENT_20261122.md) now works with a C0 perturbation threshold for the ambient almost complex structure, when a fixed embedded sphere and its bounded right inverse are supplied. The perturbed sphere is smooth and nonconstant; no uniform higher derivative bound is asserted. The proof uses a compact fixed-point map and proves individual smoothness afterward.

The [first-jet comparison](../../reviews/E191_E194_C1_TWISTOR_ASSESSMENT_20261122.md) then suffices for pointed C1 metric limits whose positive metric twistor spaces are strictly tamed. A holomorphic sphere on a hyperkähler limit cover would persist, but its inherited zero cohomological area contradicts strict taming. The [ALE sphere assessment](../../reviews/E193_ALE_SPHERE_SOURCE_ASSESSMENT_20261122.md) supplies such a sphere for the nonflat Ricci-flat ASD ALE candidate, using the Kronheimer metric classification as explicitly attributed in the checked Wright/Lyu–Xu sources. The original classification articles remain uninspected.

The [compactness theorem](../../reviews/E196_E197_TAMED_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) applies this contradiction to smooth closed connected oriented four-manifolds with uniform Ricci and positive-Weyl bounds, positive lower volume, upper diameter and Euler bounds, and supplied strict metric twistor taming. The Euler bound controls total curvature energy. The harmonic-radius argument excludes a nonflat rescaled limit and yields actual orientation-preserving identifications, strong C1,1/4 and weak W2,8 metric convergence, and finitely many oriented diffeomorphism types. Metric taming is a hypothesis about the Levi–Civita connection; native definite data alone do not supply it. The separate homotopy-sphere compactness route remains valid through its own topological obstruction.

The [verified141-page manuscript checkpoint](../../reviews/E195_E198_TWISTOR_MANUSCRIPT_DISPOSITION_20261122.md) includes these metric and persistence results with the exact hypotheses and source limitations. Stationary spectral work continues independently.


## Stationary pinching and a stronger late-sequence criterion

The [stationary assessment](../../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) now proves a specific exclusion: a supplied critical connection in the positive round-compatible class is perfect when its largest Q eigenvalue is at most 9/4 times its smallest everywhere. The proof keeps the full Bianchi mismatch term, solves the actual stationary derivative constraint, and certifies positivity on the entire spectral region by exact rational arithmetic. The separate axial computation determines its exact sign interval and endpoint nullspaces.

The [late-sequence theorem](../../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) uses this exclusion on the smooth critical limit. If one unshifted late sequence has bounded intrinsic transport density and diameter and its spatial supremum of the eigenvalue ratio has limsup at most 9/4, the supplied original flow converges smoothly and exponentially to one fixed round pullback. The key step transports the scalar spectral supremum along the critical adjusted limit on intervals bounded away from zero, then uses its strong continuous trace. It does not assert preservation of pinching by the original flow or supply initial definite connections.

The [source comparison](../../reviews/E207_SOURCE_COMPARISON_ASSESSMENT_20261123.md) records the exact historical Fine2011 question and separates the distinct volume-action theorem. The [E209/E210 assessment](../../reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md) now supplies the static native inequality D≥gamma E+beta G on the supplied ratio≤9/4 class, with explicit nonoptimal constants and verified old/native factors. The [E212/E213 assessment](../../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) converts it to an accumulated-good-time energy bound. Together with the bounded geometric late sequence, infinite occupation or one strictly subthreshold finite test gives an actual fixed round tail. The finite test uses past occupation only; convergence itself forces eventual full occupation. E214/E216 are assessed and the 148-page normal PDF is verified. B103/E215 tests the local scalar spectral-ratio maximum mechanism at the boundary on an actual connection germ; no original-flow preservation or qualifying initial data has been established.

B104/E218 now tests the sharp stationary algebraic region rho≤7/2. B105 frames the separate closed-boundary stationary/late applications and strict-subregion quantitative consequence, conditional on an independently assessed certificate. Consult the sole register before consuming these proposals.
