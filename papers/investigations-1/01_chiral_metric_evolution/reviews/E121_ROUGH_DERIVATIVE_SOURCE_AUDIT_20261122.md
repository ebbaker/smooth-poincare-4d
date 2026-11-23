# E121 — Koch–Lamm weighted derivative and parameter source reinspection

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E42, which adapts the source's parameter method to the compact bundle. This is a selected-passage primary-source inspection. B63 and the E119 request specify the branch question. The ongoing E119 proof was outside the inspection. [Request][req], [return and version records][ret], [B63][b63], [E119 request][req119].

## Inspected version and publication access

Herbert Koch and Tobias Lamm, *Parabolic equations with rough data*, arXiv:1310.3658v1 [math.AP], submitted 14 October 2013. I read indexed passages from the exact versioned arXiv PDF and cross-checked the formulas in arXiv's same-version experimental HTML on 22 November 2026, America/New_York. The arXiv submission record confirms the author names, title and date. PDF page-image requests for preprint pp. 2–3 returned cache misses. The two textual routes supported the checks below. Inspection level is selected passages. [arXiv record][arxiv], [versioned PDF][pdf], [same-version HTML][html].

The official DML-CZ journal record confirms *Mathematica Bohemica* **140**(4) (2015), 457–477, DOI 10.21136/MB.2015.144463. The official PDF link was retried once through that record on the same date and returned a fetch timeout, reported as status 400. E37's earlier official timeout and unavailable mirror remain historical facts. Final-version metadata is verified, and final theorem text and version differences remain uninspected. No local reading copy was retained. [Official journal record][dml], [journal PDF attempted][dmlpdf], [E37][e37], [canonical R20][r20].

## Theorem 1.1, scalar estimates and analyticity

Preprint §1, (1.1) and Theorem 1.1, pp. 2–3, concern one real scalar function on \(\mathbb R^d\) and a divergence-form equation with continuous coefficients \(a^{ij}(t,x,u)\) and source \(f(t,x,u,\nabla u)\). For fixed \(\lambda>1\), the coefficients are bounded by \(\lambda\) and their quadratic form on real covectors is bounded below by \(\lambda^{-1}|\xi|^2\). The bound permits nonsymmetric coefficients. Their oscillation at fixed \(u\) is at most a sufficiently small \(\delta\) for \(s,t\in[0,T]\) and \(|x-y|\le\sqrt T\), and their value dependence is uniformly Lipschitz with constant \(L\). The forcing has \(|f(t,x,u,0)|\le\varepsilon/T\) and the weighted difference bound
\[
 |f(t,x,u,p)-f(t,x,v,q)|\le
 C\big[|u-v|(\varepsilon/T+L|p|^2)
       +(\varepsilon/\sqrt T+L(|p|+|q|))|p-q|\big].
\]
For regularity order \(k\ge1\) the preamble bounds the \(x,u\) derivatives of \(a^{ij}\) with spatial factor \(T^{|\alpha|/2}\) and the \(x,u,p\) derivatives of \(f\) through total order \(k\) with factor \(T^{1+|\alpha|/2-|\beta|/2}\) and allowed growth \(L(1+|\sqrt T\,p|^{(2-|\beta|)_+})\). The data condition is \(|u_0(x)-u_0(y)|\le\varepsilon<\varepsilon_0\) for \(|x-y|\le\sqrt T\). The theorem provides a continuous solution up to \(T\), with its claimed uniqueness interpreted in §3's class with small weighted gradient. [Preprint pp. 2–3][scalar], [§3 pp. 6–7][regularity].

For positive orders the claimed estimate is
\[
 \sup_{0<t\le T} t^{|\alpha|/2}
           \|\partial_x^\alpha u(t)\|_\infty\le c_\alpha\varepsilon,
 \qquad 1\le |\alpha|\le k .
\]
The text states spatial analyticity under analytic \(a^{ij},f\), and when both are analytic in all variables it further prints the mixed factorial estimate
\[
 \big|(t^{1/2}\partial_x)^\alpha(t\partial_t)^j u(t,x)\big|
       \le c(|\alpha|+j)!\,R^{|\alpha|+j}\varepsilon .
\]
The second operator is the iterated \(t\partial_t\) as printed. These are positive-time statements. The displayed finite-order range in the preprint formally includes \(|\alpha|=0\), and the mixed display also prints a zero-order instance. Neither is a usable bound on the absolute value under local oscillation alone. The scalar heat equation with arbitrary constant datum has zero local oscillation and retains that constant at all times. E42 instead centers at a stationary reference and imposes an absolute small \(C^0\) ball. [Preprint Theorem 1.1][scalar], [E42, statement and fixed-point ball][e42].

## Sections 2–3, fixed point and parameter method

Preprint §2, pp. 3–5, (2.1)–(2.3) give an abstract semigroup data bound, Duhamel source bound and small-Lipschitz-difference estimate. The discussion identifies invertibility of the fixed-point linearization by the contraction margin and gives smooth or analytic parameter dependence when the corresponding nonlinear maps are smooth or analytic. In the scalar formulation \(X_0\) is measured by the absolute supremum, separately from the local oscillation hypothesis in §1. \(X\) contains a supremum and an upper-cylinder \(L^p\) gradient seminorm and tent \(L^2\) gradient seminorm. The paper takes \(p>d+2\) and \(q=p/2\) for the nondivergence source term. Its scalar construction uses a smooth comparison \(w\) close to the datum and with controlled gradient. The source estimates use pointwise kernel bounds, localized energy estimates and parabolic Calderón–Zygmund bounds. [Preprint §2 (2.1)–(2.3) and pp. 4–5 norms][fixedpoint].

In the \(Y^0\) upper-cylinder formula, both PDF text and HTML display the prefactors \(r(r^{-(d+2)/2}\cdots)^{1/q}\). This confirms the discrepancy noted by E41 rather than identifying it with E41's dimensionally scaled factor \(r^2(r^{-(d+2)}\cdots)^{1/q}\). In the branch \(d=4\) and E41's unnormalized upper-cylinder factor on \(f_0\) is \(r^{2-6/q}\). E119's requested lift estimates are in those exact E41/E42 completed norms. [Preprint §2 p. 5][fixedpoint], [E41, convention and linear estimates][e41].

Preprint §3, pp. 6–7, illustrates the implicit parameter method using an analytic bounded scalar \(\Gamma\) in \(u_t-\Delta u=\Gamma(u)|\nabla u|^2\). The clock and translation example is \(v(t,x)=u(st,x+ta)\), with \((s,a)\) near \((1,0)\). Its parameter derivatives at \((1,0)\) give \(t\partial_tu\) and \(t\partial_{x_j}u\) and corresponding higher-order identities. The section explains spatial localization by flows of fields vanishing at the unit sphere, and for the general scalar theorem it places the analytic parameter argument on the second half of the time interval after obtaining derivative bounds. E42/E63 read the parameter derivatives using bounded value evaluation on their completed \(X\). Pointwise gradient evaluation would need an additional bound. The uniqueness discussion starts with fixed-point uniqueness in \(X\) and obtains the stated weak-solution uniqueness from \(\sqrt t\|\nabla u(t)\|_\infty\le c_1\varepsilon\) by restarting at positive times and passing to zero in the \(X\) estimates. The pointwise gradient bound alone is insufficient to integrate the Carleson seminorm directly. [Preprint §3 pp. 6–7][regularity], [E42][e42], [E63][e63].

There is a preprint display inconsistency in the transformed model on p. 6, present in both indexed PDF text and HTML. The printed drift is \(+a\cdot\nabla v\) on the left and the nonlinear term has no \(s\) factor. For the displayed definition \(v(t,x)=u(st,x+ta)\) the chain rule gives
\[
 v_t=s\,u_t(st,x+ta)+a\cdot\nabla v,\qquad
 v_t-s\Delta v-a\cdot\nabla v=s\,\Gamma(v)|\nabla v|^2 .
\]
The parameter extraction identities themselves agree with the definition. The discrepancy affects a literal coefficient import, so the branch should cite the method and use its own exact conjugation. This is an observation about v1. [Preprint §3, unnumbered model and pullback equation, p. 6][regularity].

Smooth data dependence on the fixed \(X_0\) input is an abstract consequence **when** the datum enters through the bounded linear semigroup map and the remaining residual is smoothly parameterized with an invertible linearization in the chosen spaces. This is an inference from (2.1)–(2.3) and the implicit-function observation. The checked source does not give a quantitative bound for second Fréchet derivatives in the datum measured in parabolically weighted spatial \(C^k\), nor a uniform mixed two-parameter/two-datum bound for a lift indexed by \(r\downarrow0\). Its displayed weighted estimates concern derivatives in the time and spatial variables of the solution. The §3 lift is a model for obtaining such derivatives, with \(t\) in the translation as printed. [Preprint §§2–3][fixedpoint], [parameter example][regularity].

## Sections 4.1–4.2, manifolds and systems

Section 4.1, p. 7, describes localization using uniform coordinate maps, Gaussian decay and local-in-time estimates for small local oscillations. Infinite propagation speed still requires an actual localization argument, and the paper distinguishes the pointwise heat-kernel and Calderón–Zygmund requirements. The half-space discussion addresses Dirichlet and tangentially controlled conormal problems. The smooth closed compact branch setting supplies uniform fixed chart geometry. Its strongly coupled nontrivial bundle and fixed density and connection still use the separately derived E41 linear estimates and E42 completion. [Preprint §4.1 p. 7][systems], [E41][e41], [E42][e42].

Section 4.2, pp. 7–8, says the same method applies to systems if Gaussian and Calderón–Zygmund estimates are available. Full gradient-array positivity is given as a sufficient condition for the integral coercivity (4.1), with coefficients evaluated on smoothed data. For uniformly continuous coefficients rank-one positivity yields the Gårding estimate (4.2) with a lower-order \(L^2\) term. The small \(L^\infty\)-perturbation case uses rank-one positivity around uniformly continuous coefficients, whereas the small-BMO perturbation passage invokes (4.1) for coefficients at the heat extension and the uniform structure conditions of §3. The subsequent weaker spectral paragraph prints a left-half-plane condition on \(+\sum a^{ij}_{kl}\xi_i\xi_j\), while the equation written above it has Fourier time generator \(-\sum a^{ij}_{kl}\xi_i\xi_j\). This is the earlier E37 sign qualification, outside the branch's rank-one route. None of these paragraphs supplies the needed compact-bundle uniform datum-Hessian estimate. [Preprint §4.2 (4.1)–(4.2)][systems], [E37][e37].

## Exact B63/E119 dependence

The request is for the stationary centered E42 solution map \(S\) on the fixed compact positive round bundle, uniformly for \(0<t\le T/4\) and \(0\le k\le2\). Its first target is \(t^{k/2}\|D^k S(u)(t)\|_\infty\le C\|u\|_\infty\). Its second target is
\[
 t^{k/2}\|D^k(S(u)-D_uS(0)[u])(t)\|_\infty\le C\|u\|_\infty^2
\]
with the actual entire linearization in \(D_uS(0)\), including any linear lower terms. The fixed-strip E63 parameter bounds can use the strip's positive lower time, and do not furnish these constants as \(t\to0\). [B63][b63], [E119 request][req119], [E63][e63].

The source is methodological support for implicit differentiation and spatial parameter extraction. The branch proof must still establish uniform action and transformed residual bounds on its completed spaces, including the \(O(|s|/r)\) lift speed on the band \(t\simeq r^2\), its effects on the upper and tent source norms, trace and zero-solution identities, and the fixed density, divergence and frame terms. With those bounds it must control the contraction margin and mixed parameter/datum derivatives uniformly as \(r\downarrow0\), use the time-\(r^2\) flow to extract \(r^kD^k\) with fixed fiber transport, and perform Taylor expansion in the datum. This is a list of obligations for E119's direct proof. It neither imports a weighted second datum derivative from R20 nor evaluates whether the unfinished proof meets those obligations. [E119 request][req119], [E42][e42].

## Proposed canonical R20 addition

Record E121 as a 22 November 2026 selected-passage reinspection of arXiv:1310.3658v1 via the versioned PDF index and same-version HTML. The locators are (1.1) and Theorem 1.1 pp. 2–3, (2.1)–(2.3) p. 3 and the source norms pp. 4–5, §3 pp. 6–7 and §§4.1–4.2 pp. 7–8. Add B63/E119 as a method consumer with no imported uniform datum-Hessian estimate, retain the positive-order-only interpretation, note the preprint's §3 model pullback inconsistency and the already recorded §2 scaling difference, and preserve the previously failed journal PDF access with the same-date repeat timeout. The existing citation key and inspected version still apply. [Canonical R20][r20], [E121 return][ret].

[req]: ../research-progress/handoffs/SP4-CME-E121_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E121_RETURN_v1.md
[b63]: ../brainstorm/notes/B63_PARABOLIC_SCALE_NONLINEAR_REMAINDER_20261122.md
[req119]: ../research-progress/handoffs/SP4-CME-E119_REQUEST_v1.md
[e37]: ../notes/37_ROUGH_DATA_SOURCE_TEST_20261122.md
[e41]: ../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e63]: ../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[r20]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#rough-data-source--inspected-preprint-and-publication-metadata
[arxiv]: https://arxiv.org/abs/1310.3658v1
[pdf]: https://arxiv.org/pdf/1310.3658v1
[html]: https://arxiv.org/html/1310.3658v1
[scalar]: https://arxiv.org/pdf/1310.3658v1#page=2
[fixedpoint]: https://arxiv.org/pdf/1310.3658v1#page=3
[regularity]: https://arxiv.org/pdf/1310.3658v1#page=6
[systems]: https://arxiv.org/pdf/1310.3658v1#page=7
[dml]: https://dml.cz/handle/10338.dmlcz/144463
[dmlpdf]: https://dml.cz/bitstream/handle/10338.dmlcz/144463/MathBohem_140-2015-4_8.pdf
