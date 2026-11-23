# SP4-CME-E04 return v1 — conditional transport and energy anchor

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. Return to [request v1](SP4-CME-E04_REQUEST_v1.md).
The full argument, scope and checks are recorded in the
[derivation note](../../notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md).

## Disposition

Completed the conditional implication without assuming a quantitative
eigenvalue floor. At a fixed definite slice, Rayleigh-quotient one-sided
derivatives, including when the extremal eigenspaces coincide, give
\(|(\log D)'|\le\sqrt2|T_{\dot\gamma}|\) along smooth pieces of any path in
an \(A\)-parallel frame. Its integral gives
\(|\log D(y)-\log D(x)|\le\sqrt2\,c_T(x,y)\). The exact real whole-fiber
remainder norm converts the numerator of the path cost by
\(\sqrt{5/(4\pi)}\).

On every smooth unadjusted solution with \(e_0=\mathcal P(0)/V_\mu<3/2\),
dissipation and the positive fixed volume give a slice-wise anchor
\(|q(p_t)|^2\le e_0\). Under \(C_T(t)\le C_*<\infty\), this yields
\[
 D\le D_*:=\sqrt{(1+r)/(1-r)}\,e^{\sqrt2 C_*},\quad
 r=\sqrt{2e_0/3},\quad m\ge 3/(1+2D_*^2).
\]
Using the E03 inverse bounds also yields \(\sup_X|q(t)|\le\sqrt{e_0}+6C_*\).
The conservative pair \(e_0\le1/256\), \(C_*\le1/96\) therefore supplies
E05's \(|q|\le1/8\) premise on those slices. If the uniform cost hypothesis
holds on an interval, the bounds are uniform there. Zero path cost forces
constant eigenvalues on a slice. Vanishing of the entire tensor \(T\) for a
definite connection forces perfection. The round data attain the zero
energy and zero cost limit.

Uniform along-flow control of the path cost has not been established.
Neither the fixed volume nor the integrated dissipation identity supplies
this premise or geometric compactness. Fine's comparison theorem still
requires a perfect reference connection and strong Sobolev closeness.
The lead owns integration and any subsequent dynamical task.

## Frozen input identities

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B03_TRANSPORT_ANCHOR_DECISION_20261122.md` | `b9b028448f55fff0c713244fddd901e1b13d5047f14caaf55750554e1ff86147` |
| `notes/04A_NONLINEAR_Q_20261122.md` | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| `notes/05A_REAL_TWISTOR_COMPARISON_20261122.md` | `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2` |
| `reviews/E03_COORDINATE_ASSESSMENT_20261122.md` | `5fab1e7aeea9e368c5d6233492d14aee3edda29a3017b4108653cf322ca5b1ed` |
| `research-progress/handoffs/SP4-CME-E04_REQUEST_v1.md` | `aaa2c1e3c3c8b47f541423b6094b4bb9fe49e1e43e187bc7e0694d09f30a0231` |

Fine v2 Proposition 4.2 and Theorem 4.11 were checked in the
[arXiv HTML](https://arxiv.org/html/1111.5005v2) on the research date.
The E04 proof is direct. No numerical artifact was used.
