# Marked returns and the vanishing regularization

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort were unavailable. [Proof plan](../research-plan/PLAN.md) · [Live register](../research-progress/REGISTER.md) · [Edition 05 source dossier](../../research-progress/handoffs/ED05_SETUP_INPUTS_20261126.md)

## Fixed smooth type and normalizations

Fix a smooth, connected, oriented, closed homotopy four-sphere $M$, smooth positive-definite metrics, and $T=4\pi^2$. The pair $E_\pm(g;U)=\int_U |W^\pm_g|_{\mathrm{HS}}^2\,dV_g$ uses the Hilbert–Schmidt norm of the curvature endomorphisms. Define $D(g)=\int_M|\operatorname{Ric}_{0,g}|^2\,dV_g$ and $S(g)=\int_M R_g^2\,dV_g$, with the ordinary tensor norm for Ricci and the four-index norm for full curvature. Closed signature identifies $E_+(g)=E_-(g)=e(g)$. Regional energies remain separated by chirality. The master-normalized Yamabe constant $Y$ has Dirichlet coefficient six. Write $I=I^+(M)=\inf_{Y([g])>0}E_+(g)$. The entry premise is an actual smooth metric with $Y>0$ and $e<2T$.

In Lean the admissible set and infimum are `FirstOrderTwistor.geometricPositiveEnergies o` and `sInf (geometricPositiveEnergies o)`. An element is witnessed by a smooth metric and oriented frames with integrability. The target is a metric on $M$ in this set, with a geometric Bach-flatness proof and energy equal to its infimum. An orientation-preserving diffeomorphism transports the witness.

## Closed return

Route 12 supplies the closed arm at each fixed $0<\alpha<1$, with smooth convergence via whole comparison diffeomorphisms to a compact $\mathcal F^\alpha$-critical metric. Retain that physical volume-one representative and the original-flow $e,D,S,Y$ bounds on the entire closed manifold. The trace equation gives constant scalar curvature since $\alpha>0$. An exact Bach-flat return from the pointed arm may instead be put into a volume-one Yamabe gauge, with its $D$ bound recomputed there.

The proposed `prop:ed05-bour-closed` is a separate conditional limit lemma. Given a sequence $q_j$ of closed critical representatives on $M$ with a common $Y\ge y>0$, constant $0<R_j\le C$, $p_j\in[0,1)$, $p_j\to0$, $e(q_j)\to I$, and smooth convergence on a closed limit $N$ via oriented whole diffeomorphisms $N\to M$ along a subsequence, prove an actual smooth pullback to $M$ with $Y\ge y$, Bach-flatness and $E_+=E_-=I$. Each $p_j$ is the original $\alpha_j>0$ on a regularized output or $0$ on an exact output. Each representative satisfies the stationary equation at its $p_j$. The stationary compactness packet constructs the bounded-curvature comparison maps that this lemma consumes in the final attainment proof. The fixed-parameter outcome does not require this zero-parameter lemma. [Working manuscript, fixed regularization and the limit of critical metrics](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

## Pointed return and the whole marked core

The proposed `prop:ed05-bour-pointed` takes any sequence $g_i$ on the same $M$ with $Y([g_i])\ge y>0$, $E_\pm(g_i)=e_i\le2T-\eta$ for one $\eta>0$, a uniform full curvature integral and $D(g_i)\le d_*<32\pi^2$. The marked-core note permits a limsup Ricci ceiling instead. Suppose positive constant rescalings converge pointed smoothly to a connected complete noncompact nonflat four-manifold $(X,h,p)$ with $R_h=B_h=0$. All inferior limits are over the converging subsequence. For every fixed compact domain in $X$, a late comparison is one oriented smooth embedding on an open neighborhood of the whole domain, with smooth pullback convergence there. In a finite end comparison choose a larger connected compact truncation containing the entire core and every two-sided end buffer before choosing $i$. These common maps give the actual geometric incidence of the collars and source pieces.

The proposed conclusion is one asymptotically Euclidean end and a smooth oriented one-point conformal compactification $N=X\cup\{p_\infty\}$ with a smooth Bach-flat metric $\bar h$, $Y([\bar h])\ge y$, and

$$
T < e_X=E_+(\bar h)=E_-(\bar h)
\le \min\bigl(\liminf_i e_i, d_*/4\bigr).
$$

It includes an oriented diffeomorphism $M\to N$ agreeing with the inverse comparison on a chosen normal truncation and its seam germ. In particular $I\le e_X$. Transport compact tests and both chiral charges on exhausting domains. Finite-energy Sobolev control and curvature decay produce a finite ALE end family, with positive-order ALE control upgraded through derivative order five. Use finite exact-product splices on the same closed source and count both chiral costs. The quotient-link obstruction uses the strict post-splice bound $E_+<9\pi^2$. For the resulting spherical boundaries the embedded core gives the topology and the outward Euler term gives $D_X=2(E_+(h)+E_-(h))+32\pi^2(k-1)$. The strict $D$ ceiling forces $k=1$.

Use a harmonic conformal factor on the end, smooth removal at a trivial local group, point capacity and conformal invariance. Make a normal puncture in the resulting smooth chart. Choose the common buffer length, then a small puncture radius, then a late comparison on that fixed domain. The full capped source exterior must have positive Yamabe class and strict $E_+<T$ including all measured splice costs. Realize recognition in the actual collar by extending a map on the cap neighborhood and gluing its exterior restriction to the inverse core comparison. [Whole-core derivation](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/MARKED_CORE_20261126.md) · [Working manuscript, `lem:mark`](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

## Uniform stationary estimates

The proposed `prop:ed05-bour-stationary` takes the mixed unit-volume critical sequence $q_j$ with $p_j\in[0,1)$, $p_j\to0$, $Y\ge y>0$, $0<R_j\le C$ constant, and common full-curvature and physical $D$ budgets. Put $E=\operatorname{Ric}_{0,q_j}$ and use Bour's nonnegative rough Laplacian. The stationary equation and the normalization of the Weyl gradient $G_0$ are

$$
0=\tfrac12\nabla^*\nabla E-W^\circ(E)+E\circ E-\tfrac14|E|^2q_j
  +\tfrac{2-p_j}{12}R_j E,\qquad G_0=\tfrac{p_j}{12}R_jE.
$$

For each $\lambda\ge1$ the covariant $E$ is unchanged under $q_j\mapsto\lambda q_j$ and the scalar coefficient becomes $R_j/\lambda$. The physical Sobolev inequality is $y\|f\|_4^2\le6\|df\|_2^2+(R_j/\lambda)\|f\|_2^2$. Derive a uniform lower ball-volume ratio for $0<r\le1$, then injectivity for bounded curvature, and bound the diameter in the unit-volume gauge. In uniform harmonic charts obtain $W^{2,p}$ for the metric and then for $E$ with $p>4$, using $L^p$ control of $(\partial\Gamma)E$. Bootstrap on interior balls for each derivative order with constants independent of $p_j$. The fixed-$\alpha$ parabolic estimates have parameter-dependent constants. The proposed stationary output is a compact smooth comparison on the original scale when curvature is bounded, or a smooth pointed comparison in $Q_j q_j$ when $Q_j=\max|\mathrm{Rm}(q_j)|\to\infty$ at curvature maxima. In the second case the limit is complete noncompact, scalar-flat, Bach-flat and has curvature norm one at the base point. Smooth convergence in both cases is a conclusion of the stationary packet. [CSC derivation](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md) · [Bour, Proposition 4.4 and Theorem 7.1](https://arxiv.org/html/1012.0342v1)

## Attainment on the entered type

The proposed `thm:ed05-bour-attainment` starts with $0<\alpha_j\to0$ and volume-one Yamabe metrics with excess at most $\alpha_j^2$. At each late index the original flow gives its closed critical metric or gives a pointed limit to which the marked return applies. In the latter case put the exact compactification into volume-one Yamabe gauge on $M$ and recompute $D$. The resulting $q_j$ satisfy $I\le e(q_j)\le (I+\alpha_j^2)/(1-\alpha_j)$ and a common eventual $D\le d_*<32\pi^2$. Apply stationary compactness, then use the closed limit lemma or the same marked return in the final pointed arm. The second arm uses $I\le e_X\le\liminf_j e(q_j)=I$.

Produce a smooth Riemannian metric $g_*$ on the original $M$ with $Y([g_*])>0$, $B_{g_*}=0$ and $E_+(g_*)=E_-(g_*)=I$. On a nonstandard type a positive subcritical exact value exists and its least value $a_M$ equals $I$, using Route 07's infimum and the closed recognition threshold. The standard type uses its round metric. The stability conclusion of the working manuscript additionally requires openness of the positive class and a second derivative test along actual smooth variations. [Working manuscript, `thm:main` and `prop:budget`](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

## Inputs and pins

Setup checkout `4da586548b445ccfe9145c6a5671c0f7ecd433f3`. The pinned package uses Lean `4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`, and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`.

| Source | Version inspected |
| --- | --- |
| [Claude review F2](../../../../papers/master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature) | Git blob `b27951843bab22833f9d00806cbbf9005508cea7`. Proposal and arithmetic, with fixed-parameter import and restart suggested. |
| [Revised master plan](../../../../papers/master/research-plan/PLAN.md), [master manuscript](../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) and [its entered-type corollary](../../../../papers/master/manuscript/exact_closed_types.tex) | Working Git blobs `a3c88587c29e35d878740a8169843fa0d9937948`, `61680d28504443bc0c0db72248c8bdb10ef3e48e` and `7aac9861440cb70da5ed1bc8ae41af596353fca9`. Entry, attainment, rigidity and fixed-type conventions. |
| [Working attainment manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) | SHA-256 `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1` |
| [Marked core](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/MARKED_CORE_20261126.md) and [CSC estimates](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md) | SHA-256 `f3899cded68baa98a33b5dc5bf340dc7b0c9c50ed7222c64f923063cc91cf76f` and `db5e120ef9dbbb0b387f492e8d2e1d9a3fff2c6210ff4875bd1d0a44b3451247` |
| [Primary-source receipt](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) | SHA-256 `f803dadc58ee27baddb7d216974147a181752264a0890bd0b85c24b5dd202a30`. Bour v1 and the ALE, removal, compactness and gauge inputs. |
| [Marked-neck manuscript](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex) | Git blob `dcfcc42d8e04064930f2b90a25d8d70818b34630`. `thm:caps`, `prop:link`, `thm:ale-descent`, exact compactness, and their original gauges. |

The current scientific argument uses the near-infimum Ricci budget for the one-end test. The general fixed-parameter restart proposed in F2 remains a separate question. The [scientific progress register](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/research-progress/REGISTER.md) owns scientific status. The [Edition 05 source dossier](../../research-progress/handoffs/ED05_SETUP_INPUTS_20261126.md) records the shared version and evidence boundaries.
