# FOT-E09a, E12a and E13a · Scalar component budgets

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet named GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. This return verifies real arithmetic under the displayed SEC hypotheses.

[Issued packet](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/ComponentBudgets.lean) · [SEC §§11–12][sec]

## Checked declarations

In `FirstOrderTwistor`, `roundYamabeConstant` is $Y_{\rm rd}=8\sqrt6\,\pi$. Its positivity and square $384\pi^2$ are checked. All energy variables are real. $E,e,e_X$ use the positive chiral Weyl Hilbert–Schmidt energy. On the closed homotopy four-sphere source and the supplied one-ended component the two chiral energies agree. The source is oriented and Riemannian. `total` denotes the squared $L^2$ curvature in the four-index tensor norm. [SEC `eq:energies`, `eq:sign`, `eq:GB`][norm]

| Declaration | Inputs | Output |
| --- | --- | --- |
| `sourceBandScalarBudget` | $\delta>0$, $E\le8\pi^2-\delta$, $D\ge0$, $0\le Y\le Y_{\rm rd}$, $Y^2=48(8\pi^2-E)+12D$ | $\sqrt{48\delta}\le Y\le Y_{\rm rd}$ and $D\le4E$. |
| `sourceCurvatureBudget` | Same as `sourceBandScalarBudget`, with $T=8E+2D+Y^2/6$ for `total` | $T=64\pi^2+4D$, $T\le16E+64\pi^2$ and $T\le192\pi^2-16\delta$. |
| `componentResidual` | $D=y^2/12-4(8\pi^2-e)$ and $d=4e_X\le D$ | $e-e_X\ge(Y_{\rm rd}^2-y^2)/48$. |
| `strictComponentResidual` | Same as `componentResidual`, with $0\le y\le\widehat Y<Y_{\rm rd}$ | $e-e_X\ge(Y_{\rm rd}^2-y^2)/48\ge(Y_{\rm rd}^2-\widehat Y^2)/48>0$ and $e-e_X>0$. |
| `componentResidual_lt` | $e\le 8\pi^2-\delta$ and $e_X>4\pi^2$ | $e-e_X<4\pi^2-\delta$. |
| `uniformResidualMargin_pos` | $0<d_\delta<Y_{\rm rd}$ | $\kappa_\delta=(Y_{\rm rd}^2-(Y_{\rm rd}-d_\delta)^2)/48>0$. |
| `uniformComponentResidual` | Same as `componentResidual`, with $0\le y\le\widehat Y\le Y_{\rm rd}-d_\delta$ and $0<d_\delta<Y_{\rm rd}$ | $e-e_X\ge\kappa_\delta>0$, using `uniformResidualMargin dδ` for $\kappa_\delta$. |

The square-root and squared-constant calculations are exact. The upper band bound suffices for the source estimates. `componentResidual` also applies at equality in the Ricci budget. The strict and uniform lower bounds use the ordered nonnegative Yamabe constants to compare their squares. [SEC `msale:source-euler`, `msale:residual`, `msale:strict-residual`, `msgap:strict`, `msgap:uniform-residual`][sec]

## Geometric inputs for B03

| Input to the Lean declarations | Source and premises |
| --- | --- |
| Source upper energy band, sign, Euler identity and squared curvature decomposition | `msale:source` gives the fixed positive margin and the smooth volume-one positive Yamabe gauges. $D$ is the nonnegative squared trace-free Ricci integral and $Y$ is the constant scalar curvature in this gauge. `eq:sign`, `eq:GB` and `var:wall` give the normalized Euler identity at $\tau=0$ and $\chi=2$. The curvature identity immediately after `msale:source-euler` uses both equal chiral energies with the conversion in `eq:energies`. [SEC normalization][norm] · [SEC `var:wall`][wall] · [SEC §11.1][sec] |
| Round Yamabe upper bound | `msale:source-euler` uses the sharp sphere comparison for the source class. Lee–Parker Theorem 3.3 gives the sphere value and Lemma 3.4 gives the upper comparison for compact Riemannian manifolds of dimension at least three. The definition in Lean fixes the value in the SEC normalization. [Lee–Parker, §3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=14) |
| Limiting Euler equality, upper energy band and $0\le y$ | The paragraph after `msale:source-euler` takes the limits $E_i\to e$ and $Y_i\to y$ on a common subsequence. The same identity gives $D_i\to D=y^2/12-4(8\pi^2-e)$. The comparison $e\le8\pi^2-\delta$ and $0\le y$ pass from the source bounds. [SEC `msale:source`, `msale:source-euler`][sec] |
| $d\le D$ and $d=4e_X$ | `msale:budgets` uses orientation-preserving smooth comparison on neighborhoods of every fixed compact domain and exhaustion. Here $d$ is the full Ricci integral in the scalar-flat limit. `msale:ae-budgets` uses `msale:ends`, `msale:ae-euler` and `msale:ae-signature` for one Euclidean end with trivial link group, $\chi(X)=1$ and equal block energies. [SEC §§11.1–11.3][sec] |
| $y\le\widehat Y$ and $\widehat Y<Y_{\rm rd}$ | `msale:sobolev` passes the source Yamabe inequality to each transported compact test. `msale:compact` requires the supplied smooth complete scalar-flat Bach-flat limit with one AE end and the differentiated bounds of `msale:end-decay`, then supplies the smooth positive Yamabe compactification preserving Weyl energies. `msale:cap-yamabe` uses conformal covariance and zero capacity of the added point. For the nonflat limit `msale:ae-budgets` implies $e_X>0$. Schoen’s Theorem 2 on the resulting compact Riemannian four-manifold gives the strict inequality used at `msale:strict-residual` and `msgap:strict`, since nonzero Weyl energy excludes a conformally round class. [SEC §§11.4–11.5][cap] · [Schoen, Theorem 2](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf#page=15) |
| $4\pi^2<e_X$ | `msgap:closed` applies to the smooth closed positive-Yamabe Bach-flat compactification on a homotopy four-sphere. For a nonflat component, $e_X>0$ follows from `msale:ae-budgets`. The manuscript excludes the positive endpoint $4\pi^2$ using the smooth-type recognition and inclusive Bach-flat rigidity theorems. [SEC `msgap:closed`][gap] · [Primary source record R96][refs] |
| $\widehat Y\le Y_{\rm rd}-d_\delta$ for one shared $0<d_\delta<Y_{\rm rd}$ | `msgap:yamabe` uses `msgap:compactness` for the exactly Bach-flat positive-Yamabe class on closed oriented smooth homotopy four-spheres in the fixed band. Its application uses exact Bach-flatness of the compactification, the closed gap, the component budget $e_X\le e$ from `msale:budgets`, and preservation of chiral energy by `msale:compact`. The positive deficit is supplied to Lean as a real number with its pointwise consequence for the given component. [SEC §§12.2–12.3][exact] · [Primary source record R97][refs] |

The remaining geometric declarations belong to E09 and E11–E13. The scalar packet also leaves `msgap:minimum` and the whole-neck energy identity to their own packets. The exact-class compactness premise is needed for the uniform geometric application even when the source sequence is only almost Bach-flat.

## Verification and input versions

`lake env lean FirstOrderTwistor/ComponentBudgets.lean` from `formalization/` passed. A temporary in-memory copy of the module followed by `#check` and `#print axioms` for all 11 declarations passed with exactly `propext`, `Classical.choice` and `Quot.sound` reported for each. The public-import check belongs to lead integration.

The checkout read during this packet was `ad23403e9be521ebbc8395a9d958c0a02aef3c84`, a descendant of the issued `cf03e8f09359cac317499f6928edb09e4f80c280`. The SEC manuscript and manifest matched the issued versions. SEC SHA-256 was `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The manifest SHA-256 was `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. Lean was `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`, Mathlib at `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry at `788efe97894474c032de6dfb1289d515f613d15a`. [Baseline](../../../research-progress/01_BASELINE.md)

[sec]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868
[norm]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L144
[wall]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3119
[cap]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4177
[gap]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4359
[exact]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4433
[refs]: ../../../../../references/SOURCE_NOTES_SEC_20261124.md#fixed-margin-bach-concentration--24-november-2026
