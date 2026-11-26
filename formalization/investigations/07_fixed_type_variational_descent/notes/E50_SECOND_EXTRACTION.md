# The ordinary Ricci margin through two extractions at fixed regularization

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort were unavailable. Edition 06 bounded E50 work, Routes 07 and 13, checkout HEAD `2a132b6d335f695183fecdb4537905cf180b0363`. The working [attainment manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex), [post-attainment plan](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/research-plan/PLAN.md#post-attainment-packets), [marked-neck chapter](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex), and [E49 exact selection](../../../SmoothPoincare/Variational/AttainedYamabeSelection.lean) have SHA-256 prefixes `719bbea527c6`, `2725aa4b16ed`, `5abc9c7713da`, and `95bc422196c7`. [Packet specification](../../research-progress/handoffs/ED06_E50_PACKETS_20261126.md)

## The comparator on the original carrier

Fix a smooth, closed, connected, oriented homotopy four-sphere with smooth Riemannian metrics and use $e=E_+=E_-$ in the Weyl curvature-operator Hilbert–Schmidt convention. Put $I=\inf_{Y>0}e$, $D=\int|\operatorname{Ric}_0|^2\,dV$ in the ordinary two-tensor norm and $S=\int R^2\,dV$. Assume the entered nonstandard case $0<I<8\pi^2$ and a positive Bach-flat attained metric from working theorem X. Smooth conformal normalization gives one positive unit-volume Yamabe comparator $g_*$ with $e(g_*)=I$. E49's exact-stratum compactness and extrema select a comparator with least $D$ if needed. The gap for the two fixed-parameter extractions holds for every such exact Yamabe comparator.

The closed Euler identity gives
$$
  \Delta=4I-D(g_*)=\frac{Y_{\mathrm{rd}}^2-Y(g_*)^2}{12}>0,
  \qquad Y_{\mathrm{rd}}=8\sqrt6\,\pi .
$$
Schoen's strict comparison in dimension four gives the inequality, since equality forces the round conformal class and hence $e(g_*)=0$. The available comparator on an unrecognized type is the existential witness of X after normalization and, if used, the independent least-$D$ selection of E49. The named unit round metric on a recognized sphere has $I=D=0$ and gives $\Delta=0$. Its spectrum and Weyl Hessian calculation test the round case. An explicit nonround surviving minimum or a negative Weyl variation remains to be supplied. [E49 selection and exact-stratum hypotheses](E49_ATTAINED_SELECTION.md) · [Named round control](E49_RIGIDITY_TEST.md) · [Schoen's four-dimensional comparison](https://doi.org/10.4310/jdg/1214439291)

### One comparator for the full small-parameter family

Given $I\le8\pi^2-\delta$ with $\delta>0$, apply
`exists_attainedYamabe_leastRicci` once using X, the exact first-value
compactness premise, conformal normalization and Bach covariance, the
closed Euler value and the spherical comparison. Identify its first
critical value with $I$. Keep this one least-$D$ metric $g_*$ throughout.
Set
$$
  p_0=\min\{1/2,\ 24\delta/(Y(g_*)^2+1)\},\qquad m=\delta/2.
$$
For every $0<p<p_0$ the wall gap at $g_*$ is at least $\delta$.
Taking $\epsilon_k=\min\{\delta/2,p\Delta/4\}/(k+1)$ leaves the wall
gap at least $m$ and makes $4\epsilon_k\le p\Delta$ at every index.
The theorem `exists_bourLeastRicci_uniformRegularizedStarts` chooses
actual positive unit-volume Yamabe starts within $\epsilon_k$ of
$J_p$ for every such $p$. The starts satisfy $D\le (4I+D(g_*))/2<4I$, as does every regular
slice of a supplied original flow with one of these initial physical
metrics.
The upper Ricci bound, the wall margin and the comparator are all
independent of both $p$ and $k$. The first closed transfer below
therefore gives the same Ricci ceiling to the second source.
[Lean comparison](../../../SmoothPoincare/Variational/BourSecondExtraction.lean)

## First extraction from each original flow

Fix $0<p<1$ with $m_p=2(8\pi^2-I)-pY(g_*)^2/24>0$, which is possible by the strict subcritical gap. For this fixed $p$, put $J_p=\inf_{Y>0}F^p$ for
$$
 F^p=2(1-p)e+pD/2=2e+pS/24-16p\pi^2.
$$
For $c=\min\{m_p/2,p\Delta/4\}>0$, take $\epsilon_k=c/(k+1)$. Then $\epsilon_k\le m_p/2$ and $4\epsilon_k\le p\Delta$ at every index. The positive-class value set is nonempty and bounded below. For each $k$ choose a metric with $F^p<J_p+\epsilon_k\le F^p(g_*)+\epsilon_k$. Since $D\ge0$, this strictly pinched metric has $e<8\pi^2$. A conformal Yamabe representative preserves $e$ and has $S=Y^2\le S(g)$ by the constant test and Cauchy–Schwarz. Thus it gives an actual admissible unit-volume start at that same tolerance. [Bour, Proposition 4.4 and Theorem 1.11](https://arxiv.org/pdf/1012.0342v1) · [Yamabe problem, Theorem C and §3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

On each original flow let $m=m_p/2$. The sublevel and sign argument give a common Yamabe floor $y=\sqrt{24m/(1-p)}>0$ and $e\le8\pi^2-m/[2(1-p)]$. Since every such slice is positive, $e\ge I$. Comparing $F^p$ to the same original comparator in its two expressions gives
$$
 D\le D(g_*)+2\epsilon_k/p\le d:=4I-\Delta/2,qquad
 S\le S(g_*)+24\epsilon_k/p .
$$
Closed signature transfers the chiral band to both signs. Full curvature in operator Hilbert–Schmidt normalization is $16\pi^2+D$. In a first pointed alternative the actual marked positive compactification on $M$, the scalar-flat model's one-end Euler identity and ordinary Ricci transfer would give $4I\le4e_X=D_X\le\liminf D(g_k(t_i))\le d<4I$. These geometric inputs use the limit along one trajectory with $k$ and $p$ fixed.

In the first closed alternative, whole compact convergence carries $e,D,S$ and the conformal tests to the physical endpoint $q_k$, in the unit-volume constant-scalar gauge given by the flow and its trace equation. In this gauge $S(q_k)=R_k^2$, while its Yamabe floor gives $y\le Y(q_k)\le R_k$ by the constant test. Thus $y\le R_k\le\sqrt{S(g_*)+6\Delta}$ uniformly, and
$$
  D(q_k)\le d,qquad J_p\le F^p(q_k)\le J_p+\epsilon_k .
$$
The same $d$ now bounds every $q_k$, and the comparison uses the Ricci integral of the actual critical representative. A separate conformal change at this stage would require its own stationary comparison. [Physical flow margin](../../../SmoothPoincare/Variational/BourAttainedSublevel.lean) · [Compact integral transfer](../../../SmoothPoincare/Variational/BourCompactTransfer.lean)

## Second extraction of the closed stationary sequence

Here $k\to\infty$ at the same $p$. On the possible unbounded-curvature branch take $a_k=\max|\operatorname{Rm}(q_k)|_{(0,4)}\to\infty$ and use $a_k q_k$ based at a maximum. Its scalar coefficient is $R_k/a_k\to0$. In Bour's normalization the stationary relation is $\operatorname{grad}F_W=p(R_k/a_k)\operatorname{Ric}_0/12$, so the smooth pointed limit, if supplied, is scalar-flat and Bach-flat. The pointed Ricci transfer uses invariance of the ordinary squared trace-free Ricci integral under positive constant metric rescaling in four dimensions. The uniform bound $d$ survives every subsequence before applying this lower semicontinuity. A new whole-core marked compactification on the original type produces $4I\le4e_X=D_X\le\liminf_k D(q_k)\le d<4I$. The second use needs its own positivity, compactification and Euler identification on its actual pointed limit. [Bour, Proposition 4.4](https://arxiv.org/pdf/1012.0342v1) · [Stationary estimates](../../13_bour_marked_limits_and_attainment/notes/E49_HARMONIC_INTERIOR.md) · [Physical rescaling and real lower semicontinuity](../../../SmoothPoincare/Variational/BourMarkedCore.lean)

In the bounded alternative the supplied whole smooth oriented convergence carries the positive floor, physical signed energy and ordinary Ricci integral. The near-minimum comparison then gives $F^p(q_p)=J_p$. Since $q_p$ is positive and $p>0$, comparing it with a Yamabe representative of its own class forces $S(q_p)=Y(q_p)^2$, by the preservation of $e$. With the unit physical volume and constant scalar, the constant test gives $R=Y(q_p)$. This argument uses global minimization on the positive set.

For any such global $q_p$, comparison with the exact $g_*$ gives
$$
  D(q_p)\le D(g_*),\qquad
  0\le e(q_p)-I\le
  \frac{p\,[D(g_*)-D(q_p)]}{4(1-p)} .
$$
In a further positive same-carrier smooth limit as $p\to0$, the upper bound forces the exact Weyl value $I$. If the limiting stationary equation gives Bach-flatness and the first-value limit is in unit-volume Yamabe gauge, the E49 least-$D$ comparison forces $D(q_p)\to D_*$ along that subsequence and hence $e(q_p)-I=o(p)$. This uses a limit of genuine fixed-$p$ minima. An endpoint tolerance $\epsilon$ adds $2\epsilon/p$ to the comparison for $D$, which can persist when $\epsilon$ is proportional to $p$.

## Checked scope

The Lean packet establishes the regularized value set and near-minimizing Yamabe starts, the strict comparator gap, the original-flow marked exclusion, transfer of the common budget onto a supplied physical compact first extraction, the marked exclusion on a further canonical pointed subsequence of the actual rescaled endpoints, and attainment and comparison under the supplied second compact return. Whole oriented comparison, fourth-order regularity and the stationary critical equation still have geometric suppliers. The first-time lower semicontinuity and the second lower semicontinuity use their respective original physical sequences, with the second applied to genuinely closed first endpoints. This post-X argument leaves pre-X first-flow starts and the working proof of X under their respective hypotheses. [Lean packet](../../../SmoothPoincare/Variational/BourSecondExtraction.lean) · [Fixed-parameter source plan](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/research-plan/PLAN.md#bfe-e04--extract-from-each-original-flow-at-fixed-p)

The pinned Lean `4.35.0-rc3` target `lake build +SmoothPoincare.Variational.BourSecondExtraction` passed. A direct-module probe checked the physical input types and reported only `propext`, `Classical.choice` and `Quot.sound` for the eleven proof declarations probed, including the uniform starts theorem and the final least-Ricci limit with divided Weyl excess.
