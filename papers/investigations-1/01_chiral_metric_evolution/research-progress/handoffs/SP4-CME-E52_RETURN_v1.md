# SP4-CME-E52 return v1 — nonlinear stability and original-flow transfer

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. The E47 writer audited E49–E50 conditional on the assessed E47 inverse. This is not an independent check of E47. All seven [frozen input][request] hashes matched. Request SHA-256 `319eb311b8f0668624d50670b88642418a7bb904cc47ad45fc241ffe51406587`.

[Audit with checked estimates][review], SHA-256 `a5b19a37220c701154725ab7e2ca280a37a829aac06ae8b7a16203cdf9317a61`.

## Verdicts

- **E49 weighted fixed point passes.** One time weight falls on the \(L^2H^{m+1}\) factor, including in the coefficient-difference term. The stated radii give image bound \(3R/8\), contraction constant \(1/4\) and decay amplitude \((8K/7)\|a_{m in}\|_{H^m}\). The complete graph domain has the strong initial trace, and the pointwise jet bound stays in one open definite, parabolic neighborhood.
- **E49 smooth upgrade passes.** The fixed cutoff is globally rank-one coercive. At even orders the scalar top of the fixed differential powers admits the local commutator estimate, and their matrix lower-order parts preserve the required derivative counts. The \(H^6\) energy controls \(C^2\) and yields the same smooth lifespan for data in the fixed \(H^6\) ball. Higher energies enter the bounds after the time has been fixed. The \(L^2\) energy identity compares the distributional solution with each smooth cutoff solution before regularity of the energy solution is used. Overlapping restarts close, giving exactly the smooth \(H_{\rm st}\) assumed by E50.
- **E50 transfer passes.** E42's positive-time derivative continuity at the stationary pair gives the uniform \(H^m\) entrance bound at \(\tau=T/2\). Individual smooth comparison yields a smooth adjusted path through the initial slice for every smooth value-small input. The two generators give their stated corrections under E28's left action. Solving \(\dot j=-\xi\circ j\) on the compact frame bundle gives finite-time recovery. The stable branch must start with the constant left factor \(c=g_{\rm loc}(\tau)\). Smooth original uniqueness at the shared datum establishes the overlap and the smooth splice. The inverse is \(g_{\rm st}^{-1}c^{-1}\), so the exact tail comparison reduces to the E49 estimate.

No blocking defect found under the assessed inputs. The result uses smooth input, the fixed round reference and small uniform values of the connection difference and curvature difference. Initial comparison and finite-time recovery bounds can depend on the individual datum. The conclusion requires only timewise finite automorphisms. [E49][e49]. [E50][e50].

## Primary passage reinspection

22 November 2026, America/New_York, selected remote PDF text. Michael E. Taylor, *Pseudodifferential Operators and Nonlinear PDE*, Birkhäuser Boston, Progress in Mathematics 100 (1991), DOI `10.1007/978-1-4612-0431-2`, undated repaginated host file, printed p. 66 Proposition 3.1.A and (3.1.18)–(3.1.20), p. 94 Proposition 3.6.A and (3.6.14), pp. 147 and 149 (7.3.1)–(7.3.2) and Propositions 7.3.A–B. Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, arXiv:1111.5005v2, 29 November 2011, p. 19 Lemma 3.2 and (3.4), p. 31 Lemma 4.4 and (4.3)–(4.4). The compact-bundle analytic passage and smooth uniqueness use the assessed local construction. No new primary version or local PDF copy was retained. [Taylor host file][tay]. [Fine preprint v2][fine].

[request]: SP4-CME-E52_REQUEST_v1.md
[review]: ../../reviews/E52_STABILITY_TRANSFER_AUDIT_20261122.md
[e49]: ../../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: ../../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
[fine]: https://arxiv.org/pdf/1111.5005v2
