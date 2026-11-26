# HT-E06b · Relative signed collar comparison for oriented feet

26 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The task was dispatched as a bounded E packet using the fixed
product lift of the pinned supported level isotopy. Serving model and effort
telemetry are unavailable. The input worktree was based on
`5706ef811adc3691fd85e75507a0a399cb81d18d`. The pinned toolchain is Lean
`4.35.0-rc3` at `470d5ce14007`, DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.
[Prior assessment and precise foot hypotheses](../../reviews/ED03_END_REDUCTIONS.md)

## Product lift and actual chart comparison

Let $J_s$ be a jointly smooth family of level diffeomorphisms with a jointly
smooth inverse family, $J_0=\operatorname{id}$, and compact common support $K$
disjoint from the protected set $C$. For $0<a<b<r$ use

$$
\rho(t)=\operatorname{smoothTransition}\!\left(\frac{b^2-t^2}{b^2-a^2}\right),
\qquad
F(x,t)=(J_{\rho(t)}x,t),\quad F^{-1}(x,t)=(J_{\rho(t)}^{-1}x,t).
$$

Both formulas apply on all of $L\times\mathbb R$. The coordinate $t$ is
preserved, so the product maps are inverse on every strip and each signed
half. The same smooth cutoff equals one on $|t|\le a$ and zero on
$b\le |t|$. The central germ is the product of $J_1$ with the normal
identity, with the corresponding inverse germ. The outer germs are the
identity on both ends. Both directions fix every point whose level projection
lies in $C$.

For smooth partial collar charts $\chi:L\times(-r,r)\to X$ and
$\psi:L\times(-r,r)\to Y$, use $\Phi=\psi F\chi^{-1}$. In Lean these
are partial diffeomorphisms on $L\times\mathbb R$ with exactly the open
strip as their sources. The comparison goes from the image of $\chi$ to
the image of $\psi$. Every protected tube whose product
coordinates project into $C$ retains its parametrization in both
directions. Taking the same chart on both copies fixes each such actual tube
pointwise. More generally the comparison gives the specified identification
of the two tube parametrizations. The same equations hold on both outer
portions of the strip.
[Lean source and public declarations](../../../../SmoothPoincare/Heights/RelativeFootCollar.lean)

## Pinned oriented ball application

`exists_relativeFootLevelIsotopy` applies the pinned
`OrientedBallEmbedding.exists_isotopy_eqOn_closedBall_of_isPreconnected_compl`
on one preconnected Hausdorff smooth level component in the Euclidean
three-space model. The specified `ManifoldOrientation` is shared by both
orientation-preserving partial diffeomorphisms. Both open sources contain
the closed radius-two ball. Require compact $C$ with preconnected
complement, disjoint from both closed unit-foot images. The resulting
endpoint gives $J_1(e(z))=e'(z)$ for every closed unit-ball coordinate $z$.

`exists_relativeFootSignedCollarComparison` applies the lift to this
endpoint. For all such $z$ and both signs of $t$ with $|t|\le a$, the
forward comparison maps $\chi(e(z),t)$ to $\psi(e'(z),t)$ and the inverse
maps the latter back to the former. This uses the full ball parametrization,
so restricting to the unit rim preserves the chosen coordinates there. For
native Morse feet the input atlas and orientation must agree with the
prescribed model foot. A common coordinate reflection can be used when both
charts have the opposite relative orientation. Its inverse preserves the
unit ball and converts the normalized equality back to the original
parameters. The native chart construction and any orientation verification
needed for its application are separate inputs.
[Pinned chart definition](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Manifold/BallEmbedding/Defs.lean) · [Pinned relative isotopy](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Manifold/BallEmbedding/RelativeIsotopy.lean)

To use the comparison in an end-body reduction, supply physical signed
collar charts and place each protected tube over $C$ in those charts. A
comparison along the rounded four-dimensional handle rim, with its actual
gluing atlas and both inverse germs, remains a separate geometric step.

## Frozen inputs and verification

| Input | SHA-256 prefix |
| --- | --- |
| Lake manifest | `839111aae86b6935` |
| End handle bands in the input worktree | `e5ed60df91de130f8` |
| End reductions review in the input worktree | `1a82da489fdff034` |
| Pinned oriented ball definitions | `402f21f5a000f56c` |
| Pinned relative ball isotopy | `374b5a52019f3614` |

The frozen SHA-256 of `RelativeFootCollar.lean` is
`7a41cf8e3b0c7b3c762f9795c322946c1ca3672b4b4cbaa1126a4caa3455a681`.
The pinned relative-isotopy target built successfully with 4,265 jobs.
`lake build +SmoothPoincare.Heights.RelativeFootCollar` completed with
4,267 jobs. A downstream Lean import ran `#check` on the cutoff plateaus,
product lift and its two plateau equations, protected-point equation,
chart-image equalities, protected-tube and outer equations, and the two
oriented-foot existence theorems.

The axiom reports for `signedFootCollarCutoff_smooth`,
`SupportedLevelIsotopy.signedCollarDiffeomorph`,
`SupportedLevelIsotopy.signedCollarDiffeomorph_fixes_protected`,
`SupportedLevelIsotopy.signedCollarComparison_source_target`,
`SupportedLevelIsotopy.signedCollarComparison_protected`,
`SupportedLevelIsotopy.signedCollarComparison_end`,
`exists_relativeFootLevelIsotopy` and
`exists_relativeFootSignedCollarComparison` each listed only `propext`,
`Classical.choice` and `Quot.sound`.
