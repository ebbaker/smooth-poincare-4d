# Chiral metric evolution and possible sphere theorems

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual model identifier and effort are unavailable.
This explanation traces the current working manuscript and selected primary
sources; it does not complete the independent proof audit. Task status is
owned by the [sole register](../../research-progress/REGISTER.md).

The research has reached a detailed local theory near the round sphere:
curvature reconstructs a metric, the connection flow has a stable linear
equation, and its metric interpretation agrees with normalized Ricci flow
on the transverse-traceless sector. The missing advance is a nonlinear
estimate that works on an intrinsically specified class of initial data,
without assuming a known round background.

The [manuscript](../../manuscript/chiral_curvature_and_metric_evolution.tex)
is the 22 November working draft, SHA-256
4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0.
The supporting notes are [the initial exploration](../../notes/01_riemannian_s4_exploration_20261121.md)
(SHA-256 472aa87038d7c6060ca6431c6b166b54110ed77005155eeb0094d131d7e6e416)
and [the metric evolution derivations](../../notes/02_riemannian_s4_metric_evolution_20261121.md)
(SHA-256 fca4cad10ee49b497628932e7ee1b150bfe4e701a3422b6e3b1f2e764cd16347).
The [source record](../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md)
identifies the literature versions, passages and inspection limits.

1. **The geometric target already has the desired topological consequence.**
   Let X be a smooth closed homotopy four-sphere. Work with real,
   positive-definite metrics and a fixed orientation; ASD means W⁺ = 0.
   The signature formula, using the manuscript's curvature-operator norms, is

   \[
   12\pi^2\tau(X)=\int_X(|W^+|^2-|W^-|^2)\,dV.
   \]

   Since τ(X) = 0, W⁺ = 0 also forces W⁻ = 0. The metric is locally
   conformally flat. Simple connectivity and compactness then make its
   conformal developing map to S⁴ a diffeomorphism. Thus

   \[
   X\text{ admits an ASD Riemannian metric}
   \quad\Longleftrightarrow\quad X\cong_{\rm diff}S^4.
   \]

   This is the classical endpoint in §13, not a new existence theorem.
   An ASD metric need not itself be round: it is conformally diffeomorphic
   to round. The perfect-connection target below is more restrictive,
   because it is also Einstein.

2. **The four-dimensional curvature splitting suggests connection variables.**
   For an oriented Riemannian four-metric,

   \[
   \Lambda^2=\Lambda^+\oplus\Lambda^-,
   \qquad
   {\rm Rm}=
   \begin{pmatrix}
   W^++sI/12&B\\ B^T&W^-+sI/12
   \end{pmatrix}.
   \]

   The two rank-three pieces are the two chiralities. The off-diagonal
   block B encodes trace-free Ricci curvature, with
   \(|B|^2=|\operatorname{Ric}_0|^2/4\). The positive chiral
   Levi–Civita connection has curvature

   \[
   F_{A_g^+}=-C\Sigma_g^+-B\Sigma_g^-,
   \qquad C=W^++sI/12.
   \]

   The round reference has sectional curvature K > 0,
   Ric = 3Kg, s = 12K and Fᵢ = −KΣᵢ. Its chiral connections are
   curved even though its Weyl tensor vanishes (§3).
   The earlier twistor material explains why W⁺ is an integrability
   obstruction. Exact integrable twistor charts would impose W⁺ = 0
   at the outset; they cannot describe all the intermediate metrics
   that an evolution must handle (§2).

3. **A definite connection reconstructs geometry without a prescribed metric.**
   Start with a metric connection A in an oriented real rank-three
   Euclidean bundle E. Its three local curvature forms must have positive
   wedge-pairing matrix. Set

   \[
   \mu_A=\frac13\sum_iF_i\wedge F_i,\qquad
   F_i\wedge F_j=Q_{ij}\mu_A,\qquad Q>0,\quad\operatorname{tr}Q=3.
   \]

   The reconstruction is

   \[
   \Lambda^+_{\widehat g_A}=\operatorname{span}\{F_1,F_2,F_3\},
   \qquad dV_{\widehat g_A}=\frac{\mu_A}{2K^2}.
   \]

   The span determines the conformal class and the four-form fixes scale.
   Section 4 derives the exact differential and metric velocity.
   When A came from a source metric g, the reconstructed metric generally
   differs from g. Section 5 expresses this through

   \[
   M=C^2-BB^T,\qquad Q=\frac{3M}{\operatorname{tr}M}.
   \]

   In particular, M > 0 is the metric curvature condition that makes
   this reconstruction available.

4. **Fine's flow tries to make the curvature triple perfect.**
   The defect and its energy are

   \[
   q=Q-I,\qquad \mathcal P(A)=\int_X|q|^2\mu_A.
   \]

   With the manuscript's connection L² pairing, the negative gradient is

   \[
   \partial_tA=-4d_A^*\!\left[
     \left(q-\frac{|q|^2}{6}I\right)F_A\right],
   \qquad
   \frac{d\mathcal P}{dt}=-\|\partial_tA\|_A^2.
   \]

   Here the adjoint uses the evolving reconstructed metric. At q = 0,
   a connection of the round sign gives an ASD Einstein metric with
   s = 12K. Section 6 derives the normalization of this established flow.
   Fine proves short-time existence and convergence for sufficiently small
   Sobolev perturbations of a given perfect connection (Theorems 4.3 and
   4.11 of [Fine 2011](https://arxiv.org/html/1111.5005v2)).

5. **The main comparison explains the flow near round geometry.**
   At A₀, let q now denote the infinitesimal defect. Section 7 obtains

   \[
   q_t=-4(L_E+6K)q,\qquad
   (\partial_t-4\Delta)|q|^2
   =-8|\nabla q|^2-48K|q|^2.
   \]

   This is a heat equation with damping. To identify its metric meaning,
   take a transverse-traceless tensor h on round S⁴:
   \(\nabla^ah_{ab}=0\), \(\operatorname{tr}h=0\).
   Let \(\mathcal Hh=(A_g^+)'h\), and put \(L=\nabla^*\nabla\).
   Sections 5 and 8 give

   \[
   \widehat h=\frac{L+4K}{2K}h,\qquad
   \partial_t(\mathcal Hh)=\mathcal H[-4(L+2K)h],
   \qquad
   \partial_t\widehat h=-4(L+2K)\widehat h.
   \]

   The contracted Bianchi identity is the bridge. After τ = 4t, this
   is the TT linearization of normalized Ricci flow,
   \(\partial_\tau g=-2\operatorname{Ric}+(\overline s/2)g\).
   The agreement includes the curvature terms and is stronger than matching
   only principal symbols. It is a linear TT result on the known standard
   sphere, not an identification of the complete nonlinear flows.

6. **The nonlinear distinctions explain the remaining work.**
   Pulling the energy back to metrics gives
   \(\mathcal P_{\rm met}(g)=\mathcal P(A_g^+)\). Its metric gradient has
   the fourth-order TT linearization

   \[
   h_t=-(L+2K)(L+4K)h.
   \]

   This differs from evolving A and reconstructing a metric. Sections 9–11
   also show that \(\mathcal P_{\rm met}/8\) and
   \(\mathcal E_+=\int|W^+|^2dV\) agree quadratically but differ cubically:

   \[
   \frac18\mathcal P_{\rm met}(g_\varepsilon)
   -\mathcal E_+(g_\varepsilon)
   =\frac{\varepsilon^3}{K}
    \int\left[\operatorname{tr}W_1^3-
                  \operatorname{tr}(W_1B_1B_1^T)\right]dV_0
     +O(\varepsilon^4).
   \]

   W₁ and B₁ are the first curvature coefficients of the metric path.
   The known Hessian factorization has a self-contained derivation within this
   presentation; novelty of the individual comparisons still needs review.
   The manuscript also gives conformally flat metrics at which the
   pullback-energy gradient generates a Weyl variation. That example
   concerns the metric gradient, not the independent connection flow.

The global obstacles in §14 have four distinct roles.

- **Starting geometry.** An arbitrary homotopy sphere has smooth metrics
  and connections, but this does not produce a definite connection of the
  required sign. A theorem restricted to manifolds admitting one would
  deliberately isolate this first existence problem.
- **Compatibility.** The extra variable is
  \[
  \Sigma_A=-K^{-1}Q^{-1/2}F_A,\qquad
  \mathcal T_A=d_A\Sigma_A
     =-K^{-1}(d_AQ^{-1/2})\wedge F_A.
  \]
  Under the adapted identification, \(\mathcal T_A=0\) exactly when
  A is the chiral Levi–Civita connection of \(\widehat g_A\).
  Its nonzero values obstruct a metric-only Ricci equation (§4.4).
- **Preservation and regularity.** One needs a bound
  \(\lambda_{\min}(Q)\geq\kappa>0\), derivative estimates and geometric
  compactness. In particular,
  \[
  \lambda_{\min}(Q)\geq1-\sqrt{2/3}\,|Q-I|
  \]
  makes uniform small defect useful. Integrated energy alone is weak:
  \(0\leq |Q-I|^2<6\) everywhere in the definite cone. Section 12 gives
  an explicit local family whose reconstructed metric degenerates while
  its energy density stays finite. It is not a singular flow solution.
- **Convergence.** Energy dissipation must be converted into smooth
  convergence to a perfect connection. Fixed total volume does not give
  noncollapse, and a decreasing energy need not converge to its minimum.
  The compactness and rigidity needed here are not supplied by the
  linear calculation.

The requested Hamilton analogy is useful: seek a geometric condition
which can be recognized before solving the flow, preserved during the
flow, and strong enough to force a standard limit. In dimension three,
Weyl curvature vanishes identically, so Ricci curvature controls the full
curvature tensor. Dimension four has additional Weyl components. Ric > 0
does not supply the manuscript's chiral definiteness condition. Moreover,
nonnegative Ricci curvature is not preserved on general closed
four-manifolds ([Máximo](https://arxiv.org/html/0911.1827)); those examples
are not homotopy spheres.

Several attractive targets already have classification theorems.

| Hypothesis on a smooth closed homotopy four-sphere | Existing result |
| --- | --- |
| Positive curvature operator | Standard S⁴, by [Hamilton 1986](https://doi.org/10.4310/jdg/1214440433) |
| Positive isotropic curvature | Standard S⁴, by the Hamilton/Chen–Zhu theory and [Chen–Tang–Zhu classification](https://arxiv.org/html/0810.1999v1) |
| Positive Yamabe conformal class and \(\mathcal E_+<4\pi^2\), in operator norms | Standard S⁴, by [Chang–Gursky–Yang, Theorem A](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf); the source record gives the norm conversion |
| A definite connection invariant under a faithful lifted circle action | Standard S⁴, by [Fine–Panov, Theorem 1.3](https://arxiv.org/html/1407.0840) |
| A connection sufficiently close in L²_k to a known perfect connection | Fine's local convergence theorem; the hypothesis already supplies the reference perfect geometry |

The closer open direction is the positive definite connection sphere
conjecture. In metric language, a concrete target on a homotopy sphere is

\[
C=W^++\frac{s}{12}I>0,\qquad C^2-BB^T>0
\quad\stackrel{?}{\Longrightarrow}\quad X\cong_{\rm diff}S^4.
\]

This is the homotopy-sphere restriction of
[Fine–Krasnov–Panov's Conjecture 4.10](https://nyjm.albany.edu/j/2014/20-18v.pdf).
It is an existing proposed research target, not a new conjecture invented
here. The sources checked do not provide its general smooth conclusion;
a comprehensive novelty audit remains necessary.

A narrower candidate is an intrinsic pinching statement: does there exist
a universal ε₀ > 0 such that a smooth positive definite connection of the
round sign on a closed homotopy four-sphere, with

\[
\|Q-I\|_{L^\infty}<\varepsilon_0,
\]

forces the standard smooth structure, perhaps by convergence of Fine's
flow? This is a proposed statement, not a theorem or a guarantee that
small Q alone suffices. “Round sign” specifies the algebraic orientation
sign; it must not be replaced by a path to a known round connection, which
would assume too much. The norm is intrinsic to the bundle, with
tr Q = 3; it presupposes no diffeomorphism to the standard sphere.

Fine's theorem assumes closeness of the whole connection to an already
perfect one, including derivatives. Small Q − I alone supplies neither
that background nor derivative/compactness bounds. This gap is precisely
what would need to be bridged. Adding assumptions that already imply a
known sphere theorem could still yield new flow results, but would not
produce a new sphere recognition criterion.

My recommendation is to keep this intrinsic pinching question as the
candidate special case, subject to the proof audit and a sharper novelty
check. The first analytical task would be to derive the nonlinear Q and
compatibility-defect evolution and test whether it yields a preserved
small-defect region with geometric continuation estimates. The
[bounded assessment](../notes/SPECIAL_CASE_TARGETS_20261122.md) records
the proposed success and failure tests; no such estimate has yet been
established.
