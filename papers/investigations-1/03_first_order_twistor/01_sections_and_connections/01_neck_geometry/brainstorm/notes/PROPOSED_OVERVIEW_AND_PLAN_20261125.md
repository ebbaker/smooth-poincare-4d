# Neck geometry and Weyl energy

**Proposed research overview and plan for Edward B. Baker III · 25 November 2026**

Prepared with OpenAI Codex assistance (America/New_York). The exact serving model and reasoning effort are unavailable. This discussion draft proposes two research targets and their order. The task identifiers are proposed for the author's review. Research activation and the branch's official overview, plan and progress register are pending.

## Proposed research overview

The central question is whether Weyl energy can persist between concentration scales in an almost Bach-flat sequence on a smooth homotopy four-sphere. There is also a question with a shorter geometric reach. If one can locate a single spherical collar, can a cut there identify which side carries the smooth structure of the original manifold? I propose pursuing both questions. The first could give a complete energy identity. The second could yield information about the original manifold while the geometry of the rest of the neck is still unknown.

For the spinorial application I propose a sibling under `01_sections_and_connections`, provisionally `02_dirac_collar_extraction`. It would seek collars directly at the regularity needed for the Dirac equation. Both investigations could use the same embedded region. The new one could also select a different strip or a different foliation if it gives better first-order control. [Proposed division of the collar work](#proposed-division-of-the-collar-work)

### The sequence and the two targets

Fix a smooth closed connected oriented homotopy four-sphere \(M\). Work with smooth Riemannian volume-one Yamabe minimizers \(g_i\), with \(Y_i=Y([g_i])>0\). In the marked problem each class has a representative round on a coordinate ball. Its volume in the Yamabe representative can shrink to zero. With \(W^+\) acting on the self-dual two-forms, write

$$
E_i=\int_M |W^+|_{\mathrm{HS}}^2\,dV
    =\int_M |W^-|_{\mathrm{HS}}^2\,dV,\qquad
4\pi^2\le E_i\le8\pi^2-\delta,\qquad
\mathfrak B_i=\int_M |B_{g_i}|\,dV_{g_i}\longrightarrow0
$$

for fixed \(\delta>0\). Signature gives the equality of the two integrals on the closed source. The **full four-index** Weyl integral over \(M\) is \(8E_i\). On a subdomain we keep the two chiral integrals distinct. The band gives \(Y_i\ge\sqrt{48\delta}\) and a uniform total \(L^2\) curvature bound in this gauge. Pass to a subsequence with \(E_i\to e\). [Sections and connections, §§1.1, 8, 11.1 and 13.2](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

**Energy between scales.** At an interface of adjacent components with \(r_i/R_i\to0\), start with a supplied annular identification and its radial coordinate \(\rho\). The local target is

$$
\lim_{L\to\infty}\limsup_{i\to\infty}
\int_{\{Lr_i<\rho<R_i/L\}}|W_{g_i}|_{\mathrm{tens}}^2\,dV_{g_i}=0 .
$$

The sequence limit comes first so that fixed end truncations can converge on the adjacent components. To obtain a global identity, one must also extract the components, justify the oriented comparison embeddings and exhaust the complement of their images. A first case is one smooth base and one smooth bubble with a spherical interface. A spherical quotient or an intermediate orbifold component requires its own analysis. [Manuscript, §§12.4 and 15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Energy-accounting brainstorm](NECK_GEOMETRY_AND_ENERGY_ACCOUNTING_20261125.md)

**One usable collar.** Seek an oriented embedding of a fixed-width product about a separating \(S^3\), with enough control in rescaled conformal coordinates to cap both sides. In the brainstorm's model, \(C^2\) error \(\eta_2\) from \(dt^2+g_{S^3(1)}\) controls the added Weyl energy by \(C\eta_2^2\). A retained product buffer of length \(\ell\) on each side gives the proposed post-cap lower bound

$$
Y_{\mathrm{cap}}\ \ge\
\min\{Y_i,(1-C\eta_2)Y_{\mathrm{rd}}\}-C\ell^{-3/2}.
$$

Here \(Y_{\mathrm{rd}}\) is the round four-sphere value. The fixed margin allows \(\ell\) to be chosen before locating the collar. Rescaled \(C^4\) error \(\eta_4\) on the transition strip gives the additional \(C\eta_4\) estimate for the total Bach cost if a later argument needs it. These are sufficient hypotheses in a supplied metric and gauge. A quotient \(S^3/\Gamma\) can have a Weyl-flat product collar even when its central slice cannot bound the proposed \(D^4\) cap. [Supplied-collar brainstorm, metric cap and Yamabe buffer](USING_A_SUPPLIED_COLLAR_20261125.md#make-the-metric-cap-and-control-its-costs)

### What each target would buy

Under the smooth comparison hypotheses of §12.4, the present conclusion in one chirality is \(e_0+\sum_j e_j\le e\), with \(e_0\) the base energy and \(e_j\) the bubble energies. A supplied nonflat smooth ALE bubble \(X\) of the specified type has \(e_X>4\pi^2\). Its residual satisfies \(0<\kappa_\delta\le e-e_X<4\pi^2-\delta\). Every other such bubble is flat, and the closed Bach-flat gap forces the smooth base to be conformally round. Complete accounting would then give \(e=e_X\), contradicting the positive residual. With no nonflat bubble it would instead place \(e\) on the closed base. A genuine positive closed critical value remains possible. This makes an energy identity a suitable target throughout the band. A positive Bach-gradient lower bound throughout every such band would also have to exclude a nonround positive Einstein metric on the standard sphere. [Manuscript, §§12, 14.6 and 15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Akutagawa–Endo–Seshadri, Theorems 1.1–1.2](https://arxiv.org/pdf/1801.10305)

**A first conditional theorem to test.** Suppose a single nonflat smooth asymptotically locally Euclidean (ALE) rescaling satisfying §11 is supplied, with smooth convergence on its **full** compact core and the required differentiated end decay. Section 11 gives a single end with link \(S^3\) and a smooth one-point compactification \(\widehat X\). Choose \(\ell\), then a large fixed radius in that end, and only then pass to large \(i\). A collar transferred in this order could enclose almost all of \(e_X\). The capped exterior should have \(E_+\le e-e_X+\varepsilon<4\pi^2\) and \(Y>0\) once the tail, comparison and cap errors fit within the margin. The strict recognition theorem would then make the capped exterior standard. The remaining topological check is that the capped inner piece has the smooth type of \(\widehat X\) and that the recorded gluing recovers \(M\) as the connected sum. If this works, \(\widehat X\) is diffeomorphic to \(M\) and its exact Bach-flat class has energy at most \(e-\kappa_\delta\). The proposed gain is a lower-energy class **on the original smooth type**, even if some energy remains elsewhere in the neck. Only the Weyl and Yamabe estimates enter this recognition test. [Manuscript, §§11.2–12.2](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Chang–Gursky–Yang, Theorem A and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3) · [Spherical cut and gluing references](CHIRAL_DIRAC_AND_SURGERY_APPROACHES_20261125.md#what-transfers-from-surgery)

For an arbitrary single cut, keeping the **sum** of the capped chiral energies strictly below \(8\pi^2\) and both Yamabe constants positive recognizes at least one side. It takes the localization of energy at a specified core to identify the exterior as that side. Repeating surgery would require another justified source of collars, control of the accumulated costs, and a termination or convergence argument on the remaining piece. The smooth Poincaré application also requires starting geometry on each \(M\) and a way to reach \(Y>0,\ E_+<4\pi^2\), or compactness on that same \(M\) with a surviving round mark. [Manuscript, Proposition 1.1, §§13.1 and 15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

## Proposed research plan

### The first annular test

The parent decision **SEC-B36** owns the choice of analytic route. I recommend first testing the linearized Bach equation on a Euclidean annulus \(A\) with round \(S^3\) sections and two end shells. Take \(h\) to be a smooth symmetric metric perturbation, and \(W'(h),B'(h)\) its Weyl and Bach tensors linearized at the flat metric. Write \(A_j\) for the dyadic shells of \(A\). The question is whether, uniformly in their number,

$$
\sum_{j\ \mathrm{interior}}\|W'(h)\|_{L^2(A_j)}
\ \le\ C\left(\mathcal T_{\mathrm{ends}}(h)+\|B'(h)\|_{L^1(A)}\right).
$$

Here a concrete first choice for \(\mathcal T_{\mathrm{ends}}\) is the sum of the \(H^3\) norms of the metric perturbation on the two unit-rescaled end shells in fixed Euclidean coordinates. Fix the end cutoffs, the permitted gauge directions and the scaling of tensor components before issuing the test. The homogeneous calculation in §14.5 locates the first modes carrying curvature at exponents \(\pm2\). The proposed inequality tests general fields and localized forcing. A useful negative outcome would identify an end mode or an \(L^1\) concentration that violates the bound for the specified data. The existing **SEC-E62** remains reserved for whichever test the parent chooses. [Parent register](../../../research-progress/REGISTER.md) · [Parent handoff and alternative tests](../../../continuation-notes/05_AFTER_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md)

Two difficulties should guide the nonlinear work. The shellwise curvature budget controls a sum of **squares**, while coordinate mismatches can accumulate as a sum of norms. Even a linear estimate on \(W'\) would need a geometric argument controlling metric transitions and the Ricci and gauge directions. In §14.3 one sufficient outcome is a common near-Euclidean chart with deviation tending to zero and bounded \(L^2\) Hessian of the metric perturbation. In §14.4 another is a transverse pair \(X(t)=1\) with bounded \(|X||\nabla t|\) and vanishing weighted defect of \((\mathcal L_X g)_0\) and its derivative. The intrinsic estimate also applies to quotient links. For nonlinear forcing, the alternatives in SEC-B36 include testing \(vD^4v\) and \(DvD^3v\) with the mixed-density divergence identity of §15. The Euclidean Lorentz estimate for divergence-free sources supplies a comparison at this step. Localizing it and summing over spatial shells are further estimates. [Manuscript, §§14.3–15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Hernandez–Spector, Theorem 1.1](https://arxiv.org/pdf/2008.05639#page=2)

### Tasks proposed for the neck branch

The proposed task prefix is **SP4-FOT-NECK**. On activation, E01 could audit the supplied collar while B01 examines what geometry the sequence can furnish. Both can proceed independently of the parent's annular calculation. B tasks recommend Astra/ultra for the indicated mathematical choice. E tasks recommend gpt-6.2-sol/ultra for the specified derivation or proof check. The author's selected lead is retained. Each E request would be frozen once its inputs and method are fixed.

| Task | Prerequisites | Bounded deliverable and completion test | If the estimate fails |
| --- | --- | --- | --- |
| **E01 · Audit one cut** | Ready on activation from the supplied-collar brainstorm | Check one fixed pair of metric caps. Reproduce the total transition Weyl cost, the two Yamabe lower bounds by quadratic-form localization, and the separate fourth-derivative Bach cost. Give the choices of \(\ell,\eta_2\) that preserve sign and the strict energy margin for one cut. | Identify the uncontrolled term and the conclusion that depends on it. Return the choice of a replacement hypothesis to B01. |
| **E02 · Identify the exterior of one smooth bubble** | E01's Weyl and Yamabe estimates and the §11 full-core hypotheses | Test the conditional theorem above for one bubble. Track the end tail, comparison error and cutoff cost in order, identify both capped topologies and check smooth gluing. Finish with the smooth-type and energy-drop implication or the exact missing premise. | B03 assesses which implication survives, for example recognition of the exterior alone. |
| **B01 · Find a usable cut at a selected scale** | Ready on activation from the three brainstorms and the exact neck theorem | Between two separated scales select a low-energy block of a fixed number of shells. Specify the shared geometric inputs for an embedding, including volume control and link topology. Then identify the additional gauge and regularity needed for a metric cut and cap. | If spikes interfere with cap estimates, test a different strip or integrated cap hypotheses. Make the available scale and topology information accessible to the Dirac extraction work. |
| **E03 · Test fixed-width extraction for a metric cut** | B01 fixes one comparison class, estimate and method | Prove one geometric comparison on that block with constants uniform in its physical scale, or exhibit the specific failure. Identify which bounds give the Weyl cost, Yamabe sign and Bach cost. Report the actual chart and norms for reuse. | Return to B01 with the failed norm, topology or regularity implication. |
| **B02 · Pass from annular estimates to geometric control** | Parent SEC-B36 decision and an applicable assessed parent estimate, including SEC-E62 if used | On one chain of spherical shells, specify how the available analytic bound controls actual coordinate transitions or constructs the transverse field of §14.4. State which shell charts or comparison maps still need to be extracted. | If the chosen parent bound loses an uncontrolled mode or derivative, give it back to SEC-B36. A finite-width collar remains available for a separate test when its hypotheses hold. |
| **E04 · Account for one long neck** | B02's fixed construction and its required geometric inputs on the whole chain | Test the construction with both end cutoffs, track every constant through increasing length, and take the two limits in order. Finish with a proof in the stated class or a quantified remainder. | Refer length growth, conical drift or a nonvanishing end term to B02. Retain the exact scope of any conditional bound. |
| **B03 · Reconstruct the manifold or the energy identity** | E02 or E04, according to the route assessed | For the cut, identify the next admissible class on the remaining piece and what could ensure a strict decrease or termination. For accounting, specify a cover of the entire complement for a finite smooth comparison family and locate any unresolved region. State what a quotient link, orbifold component or uncontrolled tail would require. | Preserve the one-cut or one-neck result and identify the first unsupported global implication. |
| **E05 · Check one global implication** | B03 fixes one case and supplies its needed estimates | For one finite smooth comparison family, justify exhaustion and apply §12.4 to the resulting equality, or check one proposed descent step on a capped piece with its sign, margin and gluing data. Document the premises used for each conclusion. | Return the specific remainder, loss of margin or missing restart estimate to B03. |

Chang–Qing–Yang give a benchmark for B01 and E03. Their Theorem 2.4 uses the exact Bach equation in positive Yamabe gauge to obtain derivative control from small curvature energy. Theorem 3.1 also assumes \(b_1=0\), scale separation, an inner area upper bound and small annular curvature. It supplies a spherical quotient comparison with rescaled local \(C^{1,\alpha}\) control. Extending the argument to \(\|B\|_1\to0\), identifying the link for a ball cap, and obtaining the derivative estimates that a particular use needs are distinct tasks. [Chang–Qing–Yang, Theorems 2.4 and 3.1 and §4](https://arxiv.org/pdf/math/0508621) · [Canonical source record R97](../../../../../../../references/SOURCE_NOTES_SEC_20261124.md#fixed-margin-bach-concentration--24-november-2026)

### Proposed division of the collar work

| Investigation | Starting information | Mathematical responsibility |
| --- | --- | --- |
| `01_sections_and_connections/01_neck_geometry` | A fixed-band sequence and separated concentration scales | Develop the common scale selection and link topology. Seek vanishing Weyl energy over a whole neck and the estimates for a metric cut and cap on one strip. |
| `01_sections_and_connections/02_dirac_collar_extraction` (proposed) | The sequence and candidate regions between the scales, incorporating any available comparisons from neck geometry | Select an embedded spin collar, a slicing and a conformal gauge. Prove quantitative geometric bounds that meet a specified Dirac criterion, at first on one fixed-width strip. |
| `02_dirac_and_twistor_spinors/01_dirac_collar_matching` | A supplied spin collar with stated bounds and identified ends | Determine which bounds suffice for a uniform inverse with specified spectral traces, and whether one can match the traces of actual solutions on the adjoining pieces. |

The unit round product illustrates the roles. Its tangential Dirac operator has \(\min|\lambda|=3/2\), giving the reference gap for transmission. Its chiral Levi–Civita curvature forms are tangential, so \(F_i\wedge F_j=0\) there. A definite-connection restart is a further possible application requiring a positive wedge matrix, compatible bundle extensions and control on the capped piece. The present metric cap estimates concern the Weyl energy and Yamabe sign and apply independently of such a restart. [Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf#page=6) · [Supplied-collar calculation](USING_A_SUPPLIED_COLLAR_20261125.md#the-exact-cylinder-lies-on-the-boundary-of-definiteness) · [Chiral manuscript, §§4–6 and 14.1](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

**First target for Dirac collar extraction.** Between the two scales, seek an oriented spin-compatible embedding of a strip \(I\times S^3\) of fixed normalized length at least two. Record how its ends attach, the rescaling, and the positive conformal factor. Write \(h\) for the resulting metric, \(h_0=dt^2+g_{S^3(1)}\) and \(k=h-h_0\). The matching branch proposes the sufficient smallness condition

$$
\varepsilon_D=\|k\|_{L^\infty(I\times S^3)}
+\sup_{\substack{J\subset I\\1\le |J|\le2}}
\|\nabla^{h_0}k\|_{L^4(J\times S^3,h_0)} \le \varepsilon_* ,
$$

with a uniform \(\varepsilon_*>0\) small enough for its fixed-projection operator estimate. A smooth collar may have nonzero Weyl curvature and still meet this condition. The flat germ used for the Dirac Green field is at the cap puncture. Quantitative matching also needs the conformal weights of the end data. A Weyl-energy application needs a lower bound for the spinor norm and an estimate of the projected differentiated twistor defect. [Matching branch, first model and actual gluing](../../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md) · [Dirac manuscript, §§2.3, 3.3 and 4](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)

**First test, followed by the extraction problem.** On a supplied buffered Euclidean annulus with \(g=\delta+v\), put \(a=\|v\|_\infty\) and \(K=\|D^2v\|_2\). Section 14.3 gives \(\|\eta Dv\|_4^2\le Ca(K+a)\) with \(\eta=1\) on the interior region. The first bounded check would pass to \(t=\log(\rho/\rho_0)\), \(h=\rho^{-2}g\) in product coordinates and verify \(\varepsilon_D\le C(a+\sqrt{a(K+a)})\) on an interior fixed-width strip, uniformly in \(\rho_0\). The existence problem is to obtain that first-order control on **some** embedded strip from the sequence itself. It can be pursued even when the \(C^2\) control for the cap cost and \(C^4\) control for its Bach error are unavailable. For a genuinely varying slice metric, a second possible target would be to obtain a uniform tangential spectral gap, uniform slice elliptic estimates, and bounds on the normal variation and lower-order terms in the criterion specified by the matching branch. Extending across a long neck also requires compatible identifications over its full length. [Sections and connections, §14.3](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Matching branch, varying slices](../../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md#beyond-comparison-to-a-round-metric)

### Setup after review

After author review, the approved scope would go in the branch overview and plan, with one live register for SP4-FOT-NECK tasks. The parent would link to that register and retain SEC-B36 and SEC-E62. Completing setup would add the reference and work-directory guides, a dated milestone and a continuation note with the inputs, dependencies and activation prompt. [Investigation setup workflow](../../../../../../../INVESTIGATION_SETUP_WORKFLOW.md)

**Inputs reviewed.** Repository checkout fb37f1bbb1a6aea44838f2d7746ed4d6cc164a67. The SEC TeX source including the §15 no-neck application, branch README and three neck brainstorms were reviewed at source revision f6e10f0a948f45fd6cc8d3c315d214180f7c5a61. The TeX SHA-256 is 329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66. The companion TeX hashes match the supplied-collar note. The Dirac collar proposal is at fb37f1b. Primary theorem statements checked for this proposal are cited at their points of use. The review concerns the hypotheses, dependencies and proposed uses of the results. [Manuscript provenance](../../../manuscript/README.md#no-neck-application--25-november-2026) · [Three neck brainstorms](../../README.md) · [Existing primary-source records for the endpoint and Einstein comparisons](../../../../../../../references/SOURCE_NOTES_SEC_ANNULAR_20261124.md)

The 25 November revision on Dirac collar extraction used checkout 3348250457015f32a54004cd337463b022195d7a. The SEC, DIR and chiral manuscript hashes match the original review. The Dirac collar brainstorm has SHA-256 da1ead482b9241d1d07bdf8ff66df38cdae6e1812c13a328972b82bfb60fe57c. Bär's unit sphere Theorem 1 was checked for the reference gap. [Canonical reference R52](../../../../../../../references/README.md)
