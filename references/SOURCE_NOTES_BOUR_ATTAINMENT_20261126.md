# Sources for Bour flow and fixed-type attainment

26 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The serving model identifier and reasoning
effort were unavailable. This is a source receipt for the
[attainment investigation](../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/README.md).
External passages were inspected remotely on this date. No third-party
reading copies were retained. The [reference index](README.md) and
[bibliography](references.bib) catalog the shared references.

## Bour’s fixed-parameter flow

Vincent Bour, *Fourth order curvature flows and geometric applications*,
arXiv:1012.0342v1, 1 December 2010, 45 pages. The arXiv record lists one
version. Publication metadata beyond the preprint remain unverified.
Inspection covers the statement and proof of Theorem 1.11, the statement
and proof pointers of Theorem 1.4, and the supporting passages identified
below. [Version record](https://arxiv.org/abs/1012.0342v1) ·
[Inspected PDF](https://arxiv.org/pdf/1012.0342v1) ·
[arXiv DOI](https://doi.org/10.48550/arXiv.1012.0342)

- **Normalization and Yamabe control.** Bour uses double-form norms for
  $W$ and $\mathrm{Rm}$. His Weyl energy is $E_++E_-$ in the master’s
  Hilbert–Schmidt convention, and his squared $\mathrm{Rm}$ norm is
  one quarter of the four-index squared norm. Ricci uses its ordinary
  tensor norm. The master’s four-dimensional Yamabe constant is
  $Y=6Y_{\rm Bour}$. Gauss–Bonnet yields the two forms of the functional
  below, where $\mathcal F_R=\int R^2\,dV$. In the master normalization,
  Lemma 4.5, attributed by Bour to Gursky, gives
  $Y^2\ge24[(1-\alpha)8\pi^2\chi(M)-\mathcal F^\alpha]$. It bounds the
  square. Along a strictly pinched flow the positive initial value and
  continuity supply the sign. [§1, pp. 2–3](https://arxiv.org/pdf/1012.0342v1#page=2) ·
  [§§3–4, pp. 14–19](https://arxiv.org/pdf/1012.0342v1#page=14) ·
  [§5, pp. 22–24](https://arxiv.org/pdf/1012.0342v1#page=22)

  $$
  \mathcal F^\alpha
  =(1-\alpha)\mathcal F_W+\frac{\alpha}{2}\mathcal F_{\mathrm{Ric}_0}
  =\mathcal F_W+\frac{\alpha}{24}\mathcal F_R-8\alpha\pi^2\chi(M).
  $$

- **Short-time existence and continuation.** Theorem 1.4 gives unique
  maximal smooth evolution from smooth compact Riemannian data for the
  displayed fourth-order equation with $a<1/[2(n-1)]$ and arbitrary $b$.
  The proof invokes Propositions 2.1 and 2.4 for the DeTurck reduction
  and principal-symbol threshold. For $\partial_tg=-2\nabla\mathcal F^\alpha$,
  the dimension-four coefficient is $a=(1-\alpha)/6$, strictly within
  the range for $\alpha>0$. Theorem 1.5 gives positive-time derivative
  estimates with fixed-operator constants and a curvature supremum
  bound. Theorem 1.9 uses a maximal solution in dimension three or four,
  a uniform positive Yamabe bound, and a uniform $L^2$ full-curvature
  bound. The proof uses Proposition 5.6 for noncollapse and Theorem 7.2
  for parabolic pointed smooth compactness. The metric scaling is
  $\lambda_i=\|\mathrm{Rm}(g_{t_i})\|_\infty$ and time scaling
  $\lambda_i^2(t-t_i)$, with base points at curvature maxima.
  [Theorems 1.4–1.9, pp. 5–7](https://arxiv.org/pdf/1012.0342v1#page=5) ·
  [§§2–3, pp. 9–15](https://arxiv.org/pdf/1012.0342v1#page=9) ·
  [§§7–8, pp. 26–29](https://arxiv.org/pdf/1012.0342v1#page=26)

- **Theorem 1.11.** For each fixed $0<\alpha<1$, start with a smooth
  compact Riemannian four-manifold, $Y(g_0)>0$, and
  $\mathcal F^\alpha(g_0)\le(1-\alpha)8\pi^2\chi(M)$. Either the flow
  exists for all time with uniform curvature-derivative bounds and
  noncollapse and has a smooth subsequential $\mathcal F^\alpha$-critical
  limit, or its $L^p$ curvature limsup is infinite for every $2<p\le\infty$
  at the finite or infinite maximal time. In the latter case a sequence
  of curvature-maximum rescalings has a complete, noncompact, nonflat,
  scalar-flat Bach-flat pointed smooth limit. The proof gives the compact
  limit on the original smooth type via comparison diffeomorphisms.
  [Statement, pp. 7–8](https://arxiv.org/pdf/1012.0342v1#page=7)

- **Proof of Theorem 1.11.** At initial equality Bour uses a stationary
  solution or shifts the initial time to a strictly pinched slice. Equations
  (3)–(5) give the separate Weyl, trace-free Ricci and scalar budgets. The
  latter two have $1/\alpha$ factors. Volume preservation, noncollapse
  and compactness distinguish the closed and blow-up limits. Finite
  dissipation selects times approaching infinity on the closed side and
  gives stationarity on rescaled backward time intervals on the blow-up
  side. The trace gives harmonic scalar curvature. The proof invokes
  Yau’s $L^2$ harmonic-function theorem (Theorem 3 of Bour’s [Yau76])
  and infinite volume to obtain
  zero scalar curvature, then the first variation to obtain Bach-flatness.
  The integrated dissipation identity on p. 30 is missing a factor $1/2$
  on the energy-drop side for the stated flow. The earlier differential
  identity supplies that factor, and the finiteness argument only uses a
  positive multiple. [Lemma 8.1 and proof, pp. 29–30](https://arxiv.org/pdf/1012.0342v1#page=29)

Lemma 8.2 records transfer of the Yamabe lower bound through compactly
supported tests in a pointed smooth limit. Theorem 1.12 also requires
the strict gap $\mathcal F_W+\mathcal F_{\mathrm{Ric}_0}/4<3Y_{\rm Bour}^2/16$,
and Theorem 1.13 uses its own stronger initial pinching to exclude
singularities. For starting Yamabe representatives, the sharp bound
$Y\le Y(S^4)=8\sqrt6\pi$ and $\mathcal F_R(g_0)=Y^2$ give
$\mathcal F_R(g_0)\le384\pi^2$. The existing Lee–Parker record supplies
the sharp Sobolev comparison. [Lemma 8.2, p. 31](https://arxiv.org/pdf/1012.0342v1#page=31) ·
[Theorems 1.12–1.13, p. 8](https://arxiv.org/pdf/1012.0342v1#page=8) ·
[Lee–Parker, §3 and Theorem 3.2](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf) ·
[Earlier source record](SOURCE_NOTES_MASTER_BALANCED_DISKS_20261125.md)

## Compactness and end geometry

- **Tian–Viaclovsky, 2005.** *Bach-flat asymptotically locally Euclidean
  metrics*, *Invent. Math.* **160**, 357–415, existing key
  `TianViaclovsky2005ALE`. Theorem 1.1 in arXiv:math/0310302v3, 12 June
  2005, p. 2, gives $\lvert\nabla^k\mathrm{Rm}\rvert=o(r^{-2-k})$ on
  a complete noncompact scalar-flat Bach-flat Riemannian four-manifold
  with finite full $L^2$ curvature and a homogeneous Sobolev inequality.
  The finite-end and order-zero ALE conclusions of that theorem also
  assume finite $b_1(X)$ on the limit. Section 7, (7.2), is the neck
  manuscript’s Euler boundary-term reference. [Inspected v3](https://arxiv.org/pdf/math/0310302#page=2) ·
  [Published record](https://doi.org/10.1007/s00222-004-0412-1)
- **Tian–Viaclovsky, 2008.** *Volume growth, curvature decay, and critical
  metrics*, *Comment. Math. Helv.* **83**(4), 889–911, existing key
  `TianViaclovsky2008Volume`. Published Theorem 1.1, p. 890, gives finitely
  many order-zero ALE ends from completeness, noncompactness, a
  homogeneous Sobolev inequality, $o(r^{-2})$ full-curvature decay and
  finite $L^{n/2}$ energy of the negative part of Ricci. This formulation
  provides a candidate for the end-chart step without an independent
  finite-$b_1(X)$ premise. Theorem 1.2, p. 891, gives small-energy
  regularity for metrics satisfying the system (1.5) and a local lower
  volume-growth bound. [Inspected journal text](https://ems.press/content/serial-article-files/43177#page=2) ·
  [Published record](https://doi.org/10.4171/CMH/147)
- **Ache–Viaclovsky, 2011.** *Obstruction-flat asymptotically locally
  Euclidean metrics*, arXiv:1106.1249v2, 10 October 2011, existing key
  `AcheViaclovsky2011Obstruction`. Theorem 1.2, p. 3, upgrades order-zero
  ALE to order $n-2k=2$ for the scalar-flat Bach-flat specialization
  $n=4,\ k=1$. Definition 1.6, Theorem 1.8, p. 5, and Remark 7.2,
  p. 33, concern a punctured constant-scalar obstruction-flat metric with
  the stated $C^0$ orbifold coordinates. The theorem gives smooth
  orbifold extension after diffeomorphism. The neck construction uses
  the five-derivative version with a trivial local group to obtain a
  smooth manifold chart. [Decay](https://arxiv.org/pdf/1106.1249#page=3) ·
  [Removal](https://arxiv.org/pdf/1106.1249#page=5) ·
  [Differentiated hypothesis](https://arxiv.org/pdf/1106.1249#page=33)
- **Exact Bach-flat compactness and removal.** The earlier records
  cover Tian–Viaclovsky, arXiv:math/0312318v4, Theorems 1.1–1.3 and 4.1
  with the Bach-flat remark, and Chang–Qing–Yang, arXiv:math/0508621v2,
  Theorems 2.4 and 3.1. The neck manuscript’s separate removable-point
  input is Streets, arXiv:0708.0869v1, Theorem 1.2 and §5. These
  applications retain the hypotheses and inspection levels in the cited
  records. [Second collar sources](SOURCE_NOTES_SECOND_COLLAR_20261125.md) ·
  [Exact compactness sources](SOURCE_NOTES_MASTER_BALANCED_DISKS_20261125.md)

## Independent fourth-order flow comparators

Jeffrey Streets, *The long time behavior of fourth-order curvature
flows*, *Calc. Var. Partial Differential Equations* **46** (2013), 39–54.
Inspected arXiv:1103.4136v2, 10 November 2011, §1, equations (1.1)–(1.4)
and the statements of Theorem 1.3 and Corollaries 1.5 and 1.9. Theorem 1.3
gives positive-time derivative bounds for complete solutions of (1.1)
under a uniform curvature bound. Corollary 1.5 gives weak compactness
under the curvature bound, with a base-point injectivity-radius lower
bound for smooth manifold convergence. Corollary 1.9 concerns
finite-time full-curvature blow-up for the compact $L^2$ flow. Streets
distinguishes the principal curvature evolution in Bour’s family from
the system in (1.1) and proposes a transfer of local smoothing methods.
The applicability of that transfer is a separate proof obligation.
[Inspected v2](https://arxiv.org/html/1103.4136v2#S1) ·
[Published record](https://doi.org/10.1007/s00526-011-0472-1)

Jeffrey Streets, *A concentration-collapse decomposition for* $L^2$
*flow singularities*, *Comm. Pure Appl. Math.* **69**(2) (2016), 257–322,
DOI 10.1002/cpa.21557.
Inspected arXiv:1311.0961v1, 5 November 2013, §§1.1–1.3, statement level.
Theorem 1.1 gives a concentration or proximity-to-collapse dichotomy at a
blow-up point of the full-curvature $L^2$ flow in dimension four under
an initial energy bound. Theorem 1.8 adds small initial energy and a
lower bound on the initial volume radius to obtain short-time smoothing
on a compact four-manifold. Up to normalization and a topological
constant, the full-curvature functional gives Bour’s $\alpha=1$ case.
[Inspected v1](https://arxiv.org/html/1311.0961v1#S1) ·
[Published record](https://doi.org/10.1002/cpa.21557)

## Local versions and uses

| Input | Version and intended use |
| --- | --- |
| [Master manuscript](../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) | Reviewed generation `c8fb08d`, main TeX Git blob `653a39c893acce34ac94be5a81acb9550e2305bf`, also the blob in setup checkout `39445abb3f80eca42649813600fc07c47a56af05`. Section 2 supplies $E_\pm$, $T=4\pi^2$, and $I^+(M)$ on an oriented smooth homotopy sphere. Entry is a positive conformal class with common chiral energy $e<2T$. |
| [Claude review, F2](../papers/master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature) | Added at `65f06eaac3ff5035ab48cdc77960fe210cf0d54b`, Git blob `b27951843bab22833f9d00806cbbf9005508cea7`. Claude Fable 5.2, max as configured, as recorded there. The review checked statements and arithmetic and proposed a restart and an $\alpha\downarrow0$ limit. The independent primary-source inspection above is the present receipt. |
| [Neck manuscript](../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex) and [closed alternatives](../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex) | Manuscript generation `4b15d52a9301ca6796002774b712fc51a82c09c9`, Git blobs `dcfcc42d8e04064930f2b90a25d8d70818b34630` and `2cef7df161172e5ee92754054b98360ece8c20f3`. The cited local results are the buffered cut (`thm:caps`), quotient obstruction (`prop:link`), same-type descent (`thm:ale-descent`), exact compactness (`thm:exact-compactness`), and first critical value in the closed alternatives. The cap assumes a supplied collar and controls a conformal representative. The quotient obstruction requires an embedded collar with a metric that is precisely round product near the slice and global $E_+<9\pi^2$. The descent and exact compactness statements use the displayed volume-one Yamabe band. Exact compactness additionally assumes $B=0$. |
| [Investigation 02 manuscript](../papers/investigations-1/02_bach_flow/manuscript/bach_flow_and_smooth_poincare.tex) | Generation `fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2`, Git blob `a46568dc0bec147fc723e9fcace8005d49ad9d70`. The modified Bach equation there uses a pure-trace scalar correction and ambient obstruction flow sources. Follow its [source notes](SOURCE_NOTES_BACH_FLOW_20261123.md) for that equation. |

Using the fixed-parameter dichotomy for attainment additionally requires
placing the limit and the cap comparisons in the actual source markings,
tracking both chiral energies in the appropriate gauges, and controlling
any restart cost. The final $\alpha\downarrow0$ passage needs uniform
estimates in the family of closed critical metrics and a same-type
attainment argument. These are questions for the investigation’s plan.

## Activation audit, 26 November 2026

Bahuaud and Helliwell, *Uniqueness for some higher-order geometric flows*, Bull. Lond. Math. Soc. **47** (2015), 980–995. Inspected arXiv:1407.4406v1, §1, equation (4), Theorem A and the fixed-background map-gauge discussion. For a compact smooth manifold and smooth initial metric, their natural tensor has leading coefficients with positive multiplier, arbitrary Hessian coefficient and scalar Laplacian coefficient greater than −1/[2(n−1)]. Converting their rough Laplacian to Bour's sign gives k=1, c=1, a=−(1−α)/6 and b=(2+α)/6, so the theorem supplies short-time existence and uniqueness for each positive parameter used here. This replaces the reverse fixed-background pullback in Bour's Proposition 2.1. Bour §6 also needs the exponent 2j+2 in the summand following Lemma 6.2. The corrected estimate suffices on the curvature-bounded slabs in §8. These corrections apply to the strict fixed-parameter argument used in investigation 06. [Theorem A](https://arxiv.org/pdf/1407.4406v1#page=2) · [Publication](https://doi.org/10.1112/blms/bdv076) · [Bour §§2, 6, 8](https://arxiv.org/html/1012.0342v1)

The uniform elliptic bootstrap uses Stefan Peters, *Convergence of Riemannian manifolds*, Compositio Math. **62** (1987), 3–16, Theorem 4.3 (Jost–Karcher), and Dennis M. DeTurck and Jerry L. Kazdan, *Some regularity theorems in Riemannian geometry*, Ann. Sci. ENS **14** (1981), 249–260, §4, Lemma 4.1, equation (4.3). Inspected the cited passages on 26 November 2026. The former gives harmonic chart radii and metric \(C^{1,\gamma}\) bounds on compact metrics under injectivity and sectional curvature bounds. The latter identifies the second-order metric principal part of Ricci in harmonic coordinates. Consequently the stationary bootstrap in 06 can use bounded normalized curvature and the CSC equation at all late parameters. [Peters](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10) · [DeTurck–Kazdan](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7)

## Euler boundary integral in Edition 06 FOT-E49

Daniel Cibotaru and Sergiu Moroianu, *Odd Pfaffian Forms*, Bull. Braz. Math. Soc. (N.S.) 52 (2021), 915–976. The checked passages in the author-hosted version are equation (1.1) and the proof in §3, especially (3.1)–(3.3) and the connection interpolation. On a compact oriented Riemannian manifold of even dimension with smooth boundary they give the boundary correction with the second fundamental form. On a four-dimensional truncation the E49 note derives the cubic and mixed terms in the outward-positive shape convention and calibrates their normalization on the Euclidean ball. The limit on an ALE link additionally uses physical metric and area convergence. Checked 26 November 2026. [Author's text](https://www.imar.ro/~sergium/fisiere/pfa.pdf) · [Journal version](https://doi.org/10.1007/s00574-020-00239-0) · [E49 derivation](../formalization/investigations/13_bour_marked_limits_and_attainment/notes/E49_ALE_BOUNDARY.md)
