# Sources for localized variation, marked fillings and charged flow

25 November 2026 in America/New_York, 26 November UTC. Prepared for
Edward B. Baker III with OpenAI Codex assistance. MASTER-E70g revision 1.
Actual serving model and effort are unavailable. The passages below were
checked on 26 November UTC, with previously verified sources identified
by their earlier records. No new reading copies were retained.
[Shared bibliography](references.bib) ·
[E63–E67 source record](SOURCE_NOTES_MASTER_BALANCED_DISKS_20261125.md)

## Localized Weyl variation

- **Matthew J. Gursky,** *The Weyl functional, de Rham cohomology and
  Kähler–Einstein metrics*, Ann. Math. 148 (1998), 315–337. Publication
  metadata verified through Annals. The original article text was
  unavailable in this check. The E68a proof independently derives the
  harmonic-self-dual-form inequality for closed oriented Riemannian
  four-manifolds with \(b^+>0\) and positive Yamabe sign.
  Its \(Y^2\le24E_+\) uses the Hilbert–Schmidt norm of the real
  chiral curvature operator. The subsequent bound
  \(E_+\ge32\pi^2/3\) additionally uses
  \(\chi(S^2\times S^2)=4\) and \(\tau(S^2\times S^2)=0\).
  The product comparison cites Gursky for attribution. Fu's published
  pp. 80–81 were checked as a secondary account in the full-tensor
  convention. [Annals](https://annals.math.princeton.edu/articles/12993) ·
  [Fu](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-p.pdf) ·
  [Core variation proof](../papers/master/01_fixed_type_variational_descent/manuscript/core_variation.tex) ·
  [E70a independent derivation](../papers/master/01_fixed_type_variational_descent/reviews/E70_CORE_VARIATION.md)
- **Eric Bahuaud, Christine Guenther, James Isenberg and Rafe Mazzeo,**
  *Linear and nonlinear stability for the Bach flow, I*,
  arXiv:2508.06633v1, §1, first variation preceding (1.1).
  The gradient is \(-4B\) for the integral of the full
  \((0,4)\) Weyl-tensor norm squared. On the closed homotopy
  four-sphere this integral equals \(8E_+\) by the curvature
  operator conversion and zero signature. Multiplying by \(1/8\)
  gives the E68a first variation. No Bach-flow stability assertion
  is imported here. [Primary passage](https://arxiv.org/html/2508.06633v1#S1)

## Positive scalar curvature with a marked boundary class

- **Paul Sweeney Jr.,** *Positive curvature conditions on contractible
  manifolds*, Math. Ann. 394 (2026), Article 53, Proposition 1.2 and
  the two paragraphs following it. For a smooth compact
  contractible four-dimensional Mazur manifold, the proposition
  supplies a positive-scalar-curvature metric with mean-convex boundary
  in the actual smooth type. The Mazur hypothesis is verified by the
  fixed index \(0,1,2\) handle description of the \(n=1\) Isoshima half.
  Sweeney attributes a constant sectional curvature construction to
  Lawson–Michelsohn, *Embedding and surrounding with positive mean
  curvature*, Invent. Math. 77 (1984), 399–419, §5. The latter's
  publication metadata were verified. Its original full text was
  inaccessible, and the current inference uses Sweeney's proposition.
  [Sweeney](https://pmc.ncbi.nlm.nih.gov/articles/PMC12916530/) ·
  [Lawson–Michelsohn metadata](https://doi.org/10.1007/BF01388830) ·
  [Marked topology and double](../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/notes/E56_MARKED_EXTERIOR.md#the-actual-mazur-double)
- **Christian Bär and Bernhard Hanke,** *Boundary conditions for
  scalar curvature*, in *Perspectives in Scalar Curvature*, vol. 2,
  World Scientific (2023), 325–377. Checked the authors'
  arXiv:2012.09127v5, 22 May 2024, Lemma 2.18 and (10), Definition
  3.1, Theorem 3.7(a)–(d), (g), and Remark 3.9. Theorem 3.7
  starts with strict scalar curvature above the specified lower
  bound and a prescribed boundary second fundamental form with
  normalized trace at most the starting mean curvature. It fixes
  the induced metric. In real dimension four, their normalized
  mean curvature is \(H/3\) for the outward-positive trace
  \(H\) used here. Choosing zero as target gives the even
  \(C\)-normal collar when \(H\ge0\). The proof of Lemma 2.18
  gives the positive first Robin eigenfunction and conformal
  boundary normalization. The estimates in these passages do not
  give an \(L^2\) Weyl bound for the deformation. The article uses
  the inspected arXiv passage numbering.
  [Checked version](https://arxiv.org/pdf/2012.09127v5) ·
  [Publication](https://doi.org/10.1142/9789811273230_0010)
- **Yuguang Shi, Wenlong Wang and Guodong Wei,** *Total mean
  curvature of the boundary and nonnegative scalar curvature
  fill-ins*, J. Reine Angew. Math. 784 (2022), 215–250.
  Checked arXiv:2007.06756v3, 27 October 2020, Theorem 1.1,
  its proof and Remark 2.1. An arbitrary smooth metric on the
  boundary of a compact manifold extends with strictly positive
  scalar curvature on that given manifold. Their proof attaches
  a topological cylinder and returns to the given domain, with the
  fixed boundary metric. The mean-curvature upper threshold for
  prescribed data has no nonnegative sign guarantee. This gives
  the initial exact boundary extensions for the Robin criterion.
  [Checked version](https://arxiv.org/pdf/2007.06756v3) ·
  [Publication](https://doi.org/10.1515/crelle-2021-0072)
- **Kazuo Akutagawa and Boris Botvinnik,** *The relative Yamabe
  invariant*, Comm. Anal. Geom. 10 (2002), 935–969, §§1.1 and 1.3.
  The relative invariant is the supremum of the normalized
  constants of extension conformal classes inducing the
  specified boundary conformal class. Each constant uses the
  normalized minimal-boundary representative. The sign equivalence
  with the Robin trace form follows in the present manuscript
  by the first eigenfunction, trace minimization and Sobolev
  inequality. The intrinsic boundary Yamabe sign is negative
  at \(\gamma(v_*)\). No existence theorem requiring a
  positive boundary Yamabe class is applied there.
  [Published primary text](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2002/0010/0005/CAG-2002-0010-0005-a002.pdf) ·
  [Boundary class proof](../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/boundary_class.tex) ·
  [E70f independent check](../papers/investigations-1/04_hypersurface_immersions/01_immersed_handle_constructions/reviews/E70_BOUNDARY_CLASS.md)

## Local smoothing and persistence of the Euler integral

- **Man-Chun Lee and Tang-Kai Lee,** *Local mollification of
  metrics with small curvature concentration*, Compos. Math. 162
  (2026), 2675–2697. Checked arXiv:2510.12673v2, 1 June 2026,
  Theorem 1.1 and Lemma 3.2. Theorem 1.1(a)–(c) requires initial
  upper volume ratios through unit scale, an inhomogeneous Sobolev
  inequality on unit balls and small \(L^{n/2}\) full-curvature
  norm on those balls, on their buffered domain. The conclusion
  includes existence on a uniform horizon, pointwise curvature
  and injectivity bounds, the evolving radius-\(1/2\) curvature
  bound and a two-point distance estimate on a smaller initial
  neighborhood. In dimension four the time term in the local
  curvature norm is \(t^{1/2}\). The proof under review applies
  the theorem on each closed source and uses uniqueness for its
  applications at several centers. Lemma 3.2 uses an **upper**
  Ricci bound \(a(n-1)/t\) on a relatively compact initial
  ball to include \(B_{g(t)}(x,r-\beta\sqrt{at})\) in the
  initial radius-\(r\) ball. The hypothesis of uniform initial
  upper volume ratios for the modified metrics remains a
  supplied premise. The source does not furnish the
  curvature-charge conclusion, cutoff transfer, or chiral
  evolution estimates.
  [Checked version](https://arxiv.org/html/2510.12673v2) ·
  [Publication](https://doi.org/10.1017/S0010437X26103595) ·
  [E69 smoothing review](../papers/master/01_fixed_type_variational_descent/reviews/E69_LOCAL_SMOOTHING.md)
- **Shiing-Shen Chern and James Simons,** *Characteristic forms and
  geometric invariants*, Ann. Math. 99 (1974), 48–69, §3,
  Proposition 3.2 and (3.3)–(3.4). This passage had already been
  checked for E63–E67. The invariant quadratic polynomial of
  the Euler Pfaffian transgresses on a common oriented metric
  bundle. The charged-flow proof uses the infinitesimal form of
  that identity, its bound by
  \(C|\nabla\operatorname{Ric}||\operatorname{Rm}|\) in a moving
  orthonormal identification, and a cutoff fixed at its terminal
  time. The ensuing estimates and negative localized Euler
  integral are derived in the charged-flow manuscript.
  [Canonical passage record](SOURCE_NOTES_MASTER_BALANCED_DISKS_20261125.md#four-measures-and-connection-flux) ·
  [Charged-flow proof](../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex)

## Exact analytic charts and buffered physical compactness

- **Matti Lassas and Tony Liimatainen,** *Conformal harmonic
  coordinates*, arXiv:1912.08030v2, 20 December 2019,
  Theorem 1.3(c). For an interior Riemannian chart in even
  dimension \(n\ge4\), metric regularity \(C^r\) with \(r>n-1\)
  and analytic weighted obstruction tensor give an analytic
  determinant-normalized representative in conformal harmonic
  coordinates. A smooth Bach-flat four-metric satisfies this
  with zero obstruction tensor. The manuscript propagates
  vanishing of each chiral block using analyticity in overlapping
  oriented charts and conformal covariance. The uniform overlap
  bound also uses the previously established exact compactness
  alternative. The analytic result is applied only to smooth
  exact limits.
  [Primary passage](https://arxiv.org/pdf/1912.08030v2#page=4) ·
  [Exact alternatives](../papers/master/01_fixed_type_variational_descent/manuscript/exact_alternatives.tex) ·
  [Earlier exact compactness sources](SOURCE_NOTES_MASTER_BALANCED_DISKS_20261125.md#strict-band-ends-and-isolation-of-exact-critical-values)
- **Jeff Cheeger, Mikhail Gromov and Michael Taylor,** *Finite
  propagation speed, kernel estimates for functions of the Laplace
  operator, and the geometry of complete Riemannian manifolds*,
  J. Differential Geom. 17 (1982), 15–53, §4, especially Theorem
  4.3 and the local setup preceding it. The injectivity argument
  uses relative compactness of smaller balls and local two-sided
  sectional bounds. The physical-band hypothesis and small-ball
  lower volumes supply those inputs on buffered balls. Theorem
  4.7 also gives a complete-manifold formulation with sectional
  bounds. **Michael T. Anderson and Jeff Cheeger,**
  *\(C^\alpha\)-compactness for manifolds with Ricci curvature
  and injectivity radius bounded below*, J. Differential Geom.
  35 (1992), 265–281, Theorem 0.3 and the remarks following
  Theorem 0.2. The theorem lower bounds the \(W^{1,p}\) harmonic
  radius using local Ricci lower and interior injectivity
  control. It supplies buffered, uniformly elliptic harmonic
  charts for each fixed finite \(p>4\) in dimension four.
  **Igor Belegradek and Vitali Kapovitch,** *Finiteness theorems
  for nonnegatively curved vector bundles*, arXiv:math/0002028v1,
  3 February 2000, Theorem 3.1 and its proof. The compact-domain
  comparison assumes a fixed neighborhood buffer with Ricci
  and upper volume bounds and a lower injectivity radius there,
  then glues a bounded harmonic atlas to obtain smooth
  identifications of the compact comparison domains. The
  physical-window proof uses this atlas procedure with the
  actual curvature and volume bounds. Higher convergence,
  proper radial comparison and coverage of full smaller source
  strips are checked in that proof.
  [Cheeger–Gromov–Taylor §4](https://doi.org/10.4310/jdg/1214436699) ·
  [Anderson–Cheeger](https://doi.org/10.4310/jdg/1214448075) ·
  [Belegradek–Kapovitch v1](https://arxiv.org/pdf/math/0002028v1) ·
  [Physical-window proof](../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/physical_window.tex) ·
  [E69 physical-window review](../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/reviews/E69_PHYSICAL_WINDOW.md)
