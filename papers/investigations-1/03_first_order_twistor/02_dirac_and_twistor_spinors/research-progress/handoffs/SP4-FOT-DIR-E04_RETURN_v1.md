# SP4-FOT-DIR-E04 · Compactness at first-derivative critical regularity · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing: gpt-6.2-sol / ultra. Actual helper
and selected lead model identifiers and reasoning efforts were unavailable.
[Request v1](SP4-FOT-DIR-E04_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Derivation](../../notes/DIR_E04_20261124.md).

**Completed, conditional compactness.** HEAD was
`f178fbb604f7f972b639fa8c1fc05f649c9bc8fc` and all five frozen
working-tree digests matched. For $h_j\to g=h_\infty$ uniformly and
strongly in $W^{1,4}$ with $g$ smooth positive, the positive-symmetric
spin and covector lifts yield
\[
 \|\widetilde P_j-P_g\|_{H^1(g)\to L^2(g)}
 \le C\big(\|h_j-g\|_\infty+\|\nabla^g(h_j-g)\|_4\big)\to0 .
\]
The principal difference uses the uniform convergence of frame
identifications. The transported spin connection difference is small
in $L^4$ and uses $L^4\cdot L^4\subset L^2$. Absorbing the operator
difference yields a uniform $H^1$ estimate for unit $L^2(h_j)$
spinors. Small $J$ gives a second absorption via
$\|P\psi\|_2\le J\|\psi\|_4$ and Sobolev. Under either small residual
or $J\to0$, Rellich and uniform convergence of the volume ratios
preserve mass one, the weak equation holds on all of $M$, and the
fixed elliptic estimate upgrades convergence to strong $H^1$ along
the subsequence. Smoothness of the limit spinor uses the assumed
smooth metric. Zeros are permitted and on the connected base are
transverse when present.

Simultaneous orientation-preserving spin pullbacks preserve both
residual hypotheses. For $J$, positive conformal transport with
weight $1/2$ followed by constant spinor normalization also preserves
the hypothesis. The required metric convergence is measured on the
chosen representatives.

Checked Bourguignon–Gauduchon's positive-symmetric lift and transported
connection in Propositions 1.1, 1.6, §2 equation (1), and Theorem 3.1
and Remark 3.2 of Paul Schwahn's author-proofread translation dated
14 September 2023. Friedrich's §2 equation (2.2), parallel pair,
and Proposition 2 give the source for the zero check.
[Schwahn translation](https://www.igt.uni-stuttgart.de/dokumente/schwahn/SpineursVariations_EN.pdf) ·
[Friedrich published copy](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=4).

The stated regularity and fixed spin structure suffice. The remaining
global gap is construction of a small-residual family whose allowed
representatives actually converge in the stated topology to a smooth
positive metric on the same manifold. A sequence with $J\to0$ is
itself an additional premise for the relative-defect route.
