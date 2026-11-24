# SP4-FOT-SEC-E06 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` as the requested helper configuration. Actual
backend model identifier and reasoning effort were unavailable for
independent verification.

**Result.** In one oriented Euclidean fiber \(V=\Lambda^+\), with \(W\)
real symmetric trace-free and Hermitian-unit null representatives for
the three axes, the complex-bilinear evaluations satisfy
\[
 |W|_{\mathrm{HS}}^2
 \le \frac{128}{3}\,\delta^{-4}\sum_i|q_W(n_i)|^2,
 \qquad \delta=\min_{i<j}|n_i\times n_j|>0 .
\]
Here the Weyl norm is the Hilbert–Schmidt norm of the endomorphism.
The exponent \(4\) is sharp. The [derivation][proof] factors
\(W=D(a\odot b-(a\cdot b)I/3)\) by its real spectral decomposition,
where \(D\) is its spectral gap and \(a,b\) are unit. It then gives
\(|q_W(n)|=(D/2)d([a],[n])d([b],[n])\) for the sine projective metric
\(d\). Two open balls of radius \(\delta/2\) about the factor axes
exclude at most two of the three samples from the lower bound.
The proof includes the coincident-axis case and phase invariance of
the evaluation magnitudes. For the one fixed axial block and three
equally spaced samples on a shrinking latitude, the ratio
\(\delta^4 |W|_{\mathrm{HS}}^2/\sum_i |q_W(n_i)|^2\) tends to \(8\).

**Inputs.** The observed HEAD was
`e76752648b69969b1234d0295530c87fce9fcdcb`. The seven [crosswalk][crosswalk]
pins, SH-B01 and SH-E01 pins matched the working files. The SHA-256 of
the request was
`e0d138e7d3ea868a2f81459141bf71bf12b209dc9db455b1550b4295b84e97ed`.
The [SEC-B01/B06 decision][decision] was read at SHA-256
`3f747d977a69b6a8968fbf77190e06b5bf633facaecad9e668911de9c9c2efe8`.
The first-order manuscript's `prop:three-directions` and
`eq:quartic-estimate`, and the preliminary assessment §4.1, supply
the task's setting and benchmark. Gover–Hill–Nurowski, published
Remark 5.2 and Proposition 5.3, pp. 309–310, eqs. (14)–(20), supplies
quartic context. The proof of the estimate is self-contained.
[Published text][ghn]

**Disposition.** The frozen algebraic question is resolved by an
exact proof and one exact family. No numerical run was needed.
The result can be integrated into a differential estimate when the
common metric, evaluation bounds and separation of the section
triples are available. Constructing such data and controlling them
through a global procedure remain geometric premises. The lead owns
assessment and integration in the [SEC register][register].

[request]: SP4-FOT-SEC-E06_REQUEST_v1.md
[proof]: ../../notes/SEC_E06_20261124.md
[register]: ../REGISTER.md
[decision]: ../../brainstorm/notes/SEC_B01_B06_ACTIVATION_20261124.md
[crosswalk]: ../../../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md
[ghn]: https://www.fuw.edu.pl/~nurowski/prace/gs_ampa.pdf#page=15
