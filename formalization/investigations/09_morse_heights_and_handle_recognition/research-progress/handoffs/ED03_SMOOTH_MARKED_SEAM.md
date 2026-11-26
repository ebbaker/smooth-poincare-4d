# SP4-FORM-HT-E04h · Smooth marked one-pair gluing

25 November 2026 (America/New_York), 26 November UTC. Prepared for
Edward B. Baker III with OpenAI Codex assistance. Bounded execution
packet using the supplied marked homeomorphism and fixed signed collar
model. Actual serving model and reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/SmoothMarkedSeam.lean)
· [Marked homeomorphism](ED03_MARKED_HANDLE_GLUING.md)
· [Round product model](ED03_STANDARD_SURGERY_MODEL.md)
· [Route register](../REGISTER.md)

## Exact hypotheses and conclusion

Write $S^4_{\mathrm{split}}$ for the round unit sphere in
$\mathbb R^2\oplus\mathbb R^3$, with real signed parameter
$\tau(x,y)=\lVert x\rVert^2-1/2$. The two strict interior regions have
$\tau<0$ and $\tau>0$. Let $h:M\to S^4_{\mathrm{split}}$ be the
supplied homeomorphism of the assembled source to the round model.
The four interior hypotheses require smoothness of $h$ on the preimage
of each strict region and of $h^{-1}$ on each target strict region.

Let $B$ be the supplied smooth seam and $\eta:B\to S^1\times S^2$ its
diffeomorphic marking. Take a native smooth partial diffeomorphism
$c:B\times\mathbb R\dashrightarrow M$ with source
$B\times(-r,r)$, $0<r\leq 1/2$. For every $(b,t)$ in this source, the
compatibility hypothesis on the actual marked map is
$$
h(c(b,t))=c_{\mathrm{round}}(\eta(b),t)
$$
for the explicit HT-E04d round collar $c_{\mathrm{round}}$.

The composite partial diffeomorphism
$c_{\mathrm{round}}\circ(\eta\times\mathrm{id}_{\mathbb R})\circ c^{-1}$
has source equal to the target of $c$. The explicit radius test and
the surjectivity of $\eta$ put every point with $|\tau|<r$ into its
target. The compatibility equation determines the forward map on
that open source. Applying injectivity of $h$ to the composite's
right-inverse identity determines $h^{-1}$ on the open target. Each
zero slice point therefore has a neighborhood of smoothness in both
directions. The two interior hypotheses on each side supply
smoothness elsewhere.

`diffeomorphOfSmoothMarkedSeam` gives a global smooth diffeomorphism
whose underlying equivalence is the supplied marking. The identification
`onePairRoundSphereToStandard` restricts a dimension-five ambient linear
isometry from an orthonormal basis to the unit sphere. The composition
`diffeomorphToS4OfSmoothMarkedSeam` has the literal unit sphere in
`EuclideanSpace ℝ (Fin 5)` as its target.

## Scope

The criterion upgrades the supplied homeomorphism once the smooth
interior comparisons and exact signed collar identity hold. In an
application to a one-middle-handle Morse presentation, the marked
end reduction, framing and Property R, comparison of the actual
trace to the standard zero-framed trace, and the extension or
straightening of the actual outgoing boundary identification
are separate steps. The output is an unoriented diffeomorphism.

## Inputs

Request anchor `b5ce9f481a76`. Execution workspace base
`bfdf0660e4f7d574cf507333af8e5e6781fa7915` plus working changes.
The marked homeomorphism source SHA-256 prefix is `c2eb2dd97745b437`.
The imported explicit round seam source prefix is `596468a673966d46`.
The manifest prefix is `839111aae86b6935`, with Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`. The pinned toolchain is
Lean `4.35.0-rc3` and Lake `5.0.0-src+470d5ce`.

## Verification

The frozen Lean source SHA-256 is
`a926e7e517164ed7e31337727febf38f441ce7d3a41d3313f1b2e08c4f2c6096`.
`lake build +SmoothPoincare.Heights.SmoothMarkedSeam` passed. The replay
included the existing HT-E04d unused-tactic warning.
A separate `lake env lean` import checked all three declaration types
and instantiated the criterion with the identity marking and the
explicit round collar at $r=1/2$. The imported check gave the required
diffeomorphism to the unit sphere in `EuclideanSpace ℝ (Fin 5)` and
verified by reflexivity that the split-target result retains the
supplied identity homeomorphism.
The axiom reports for all three declarations contained only
`propext`, `Classical.choice` and `Quot.sound`.
