# SP4-CME-E44 return v1 — focused nonlinear and compatibility audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. The E41 writer audited the separate E42 proof, conditional on E41's exact fixed-operator linear conclusions. This does not provide independent E41 verification. All five [frozen input][request] hashes matched. Request SHA-256 `273c98e189893f24c0d8b5612d2178d8302ec48f410144e51ffc8b5cda192993`.

[Review and checked estimates][review], SHA-256 `ec0a69b82089c2c50230b590e5fcc03e57c47ce520fad78e951081133f1217b8`.

## Verdicts

- **Contraction and completion pass.** The scaled product bounds and difference expansion are correct. The stated (R,T) give a radius-(3R/16) image and contraction constant at most (1/16). State explicitly that smooth linear evaluations take values in the completion. E41's spatially differentiated kernel gives continuity in (C_x^1) at zero for these smooth evaluations, so uniform spatial (C^1) smoothing establishes membership before completing. Strong uniform trace is used only for continuous data and completed forces.
- **Distributional identification and positive-time regularity pass.** Fixed-reference Gårding and the zero-trace linear energy identify mild and distributional solutions in the completed small ball. The lifted flow preserves the necessary anchored-scale estimates by using fixed-radius covering, and smooth density gives strong parameter continuity. The residual intertwining passes in distributions. The transformed solution depends smoothly on parameters through the implicit equation, with the same bounded linear initial map throughout. Local inversion in four spanning directions and the time equation give all mixed derivative convergence on compact positive-time strips.
- **Compatibility passes.** The connection principal array after (F=F_A) depends only on the values of (A,F_A), so those values control the fixed-pairing margin even for large symmetric first jets. The smooth comparison uses each approximant's compact initial jet image and may have individual short time. Small-ball uniqueness identifies it with the common-time rough construction there. E36's smooth energy then propagates exact compatibility from a positive slice, and E38's uniform graph closure gives compatibility for the limit at each time.

The audit found no blocking mathematical defect within E42's linear premises. The integrated result retains one fixed smooth reference, small uniform value data, completed-space uniqueness, and smoothness at interior positive times. [E42][e42]. [E41][e41].

## Primary inspection for canonical integration

22 November 2026, America/New_York, remote PDF text, selected passages. Rechecked Herbert Koch and Tobias Lamm, *Parabolic equations with rough data*, arXiv:1310.3658v1 (14 October 2013), (2.1)–(2.3), preprint p. 3, and §3, pp. 6–7, for the parameter fixed-point idea. Final publication metadata are *Mathematica Bohemica* 140(4) (2015), 457–477, DOI `10.21136/MB.2015.144463`. Rechecked Michael E. Taylor, *Pseudodifferential Operators and Nonlinear PDE*, Birkhäuser Boston, Progress in Mathematics 100 (1991), DOI `10.1007/978-1-4612-0431-2`, undated repaginated author-hosted version, printed pp. 141 and 147–149, particularly the torus setup, (7.3.1)–(7.3.2) and Propositions 7.3.A–B. The compact-bundle smooth use is E29's localization. No new version or local copy was obtained. [Koch–Lamm v1][kl]. [Taylor author file][tay].

[request]: SP4-CME-E44_REQUEST_v1.md
[review]: ../../reviews/E44_ROUGH_SYSTEM_AUDIT_20261122.md
[e41]: ../../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: ../../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[kl]: https://arxiv.org/pdf/1310.3658v1
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
