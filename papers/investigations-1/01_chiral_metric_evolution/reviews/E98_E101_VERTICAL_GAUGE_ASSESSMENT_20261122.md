# E98/E99/E101 — Finite internal Coulomb gauge and static gain

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable. Helpers configured gpt-6.2-sol/ultra, without independent runtime attestation. The lead read both derivations and the independent audit in full, recomputed the action and weak product-test signs, and checked the low-threshold bootstrap and combined estimates. This is an assessed local analytical result, not external peer review or a novelty certification.

## Finite internal gauge

[E98](../notes/98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md), SHA-256 06c883cc5a6626f4748c218b75633ce1cdb947758b04f923b2255ca207251bf4, is accepted without correction. The ordinary adjoint Laplacian has no kernel because round perfect curvature spans so(3). Its divergence inverse is bounded from L4,1 to W1,(4,1), with endpoint continuity, by the fixed localization and common weak-inverse argument. Unlike E88's projected inverse, this operator has no finite-rank subtraction.

For smooth a with sufficiently small fixed ||a||4,1, the exact exponential formula contracts in the complete W1,(4,1) algebra and produces u=exp(phi) with b=u a u^-1-(d0u)u^-1 and d0*b=0. The phi W1,(4,1), u-I C0, d0u L4,1 and b L4,1 bounds are all C||a||4,1. No curvature or higher-derivative smallness is used.

The weak product test v u^T is admissible because u is W1,4 and continuous and b is L4. It proves Div(bu)=b·Du distributionally before invoking the second-order equation. With nonnegative Delta0=D*D on endomorphisms, that equation is Delta0u=b·Du-(Du)·a-u Div(a). For w=u-I the drift coefficients are L4-small by the already constructed gauge. Fixed mass-resolvent estimates give H2, a simultaneous small perturbation on H2 and W2,3 identifies the W2,3 solution, and L12 products give W2,6. The smooth bootstrap then follows. Higher constants may depend on the smooth input, but the threshold reductions do not.

## Static gain in a supplied representative

[E99](../notes/99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md), SHA-256 6785cff000ac53238e95ef2254b0f06aa868636d91b9107400215eff6a116330, is accepted without correction. For a supplied smooth b with d0*b=0 and eta=||b||4+||F_(A0+b)-F0||infinity small, the fixed estimate for d0 plus d0* retains the L2 remainder and requires no kernel assumption. Its scalar top symbol and fixed multiplier estimates apply at p=3,6,8. The small L4 factor absorbs the p=3 bracket through W1,3 into L12; then p=6 gives C0 and p=8 gives W1,8 and C0,1/2, all bounded by C eta. Curvature derivatives do not enter.

[E101's independent audit](E101_VERTICAL_GAUGE_STATIC_GAIN_AUDIT_20261122.md), SHA-256 0eb42648ae64ab15e4c909a4e8b67ccb80b5717e6ae750493efec2f36593de30, checks the two operators and nonlinear arguments separately, then the combination. Its author did not author E98 or E99; inherited E89/E66 authorship was disclosed. Agreement is not treated as proof by itself; the exact weak, elliptic and product arguments are the evidence.

## Combined value-small representative

There are reference constants epsilon_*,C>0 such that every smooth A=A0+a on the fixed native round chiral bundle with epsilon=||a||infinity+||FA-F0||infinity<=epsilon_* admits a smooth internal gauge u and b=u(A)-A0 satisfying

    d0*b=0,
    ||b||W1,8 + ||b||C0,1/2 + ||F_(A0+b)-F0||infinity
       + ||u-I||C1 + ||u-I||W1,8 <= C epsilon.

Finite volume first gives ||a||4,1<=4 Vol(g0)^(1/4)||a||infinity. E98 supplies the small gauge and b L4; curvature covariance gives beta_b=u beta u^-1+(u F0 u^-1-F0), whose sup norm is C epsilon. Reduce the value threshold to enter E99. Finally d0u=u a-bu bounds the derivative in both L8 and C0; fixed coordinate comparison adds only fixed coefficients times u-I. This does not bound the first derivative in a positive Holder norm uniformly, since a has only a sup bound. Internal gauge leaves the reconstructed metric and pointwise eigenvalues of Q unchanged.

The result imposes no S0*b condition, makes no horizontal inverse or full slice assertion, and does not extend the intrinsic temporal-budget theorem. The exact primary-source comparison with Feehan remains in [the canonical record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#critical-gauge-source-discovery--feehan-2001) and [E93 assessment](E93_SOURCE_COMPARISON_ASSESSMENT_20261122.md). No Feehan theorem was imported and no new source/version was inspected here.

## E107 manuscript disposition

The lead read [E107](E107_FINITE_INTERNAL_GAUGE_MANUSCRIPT_AUDIT_20261122.md) in full, SHA-256 981135db20c6952e176ae0472a1abc02c5de82537558702359fa6c90455ce58b. Its frozen TeX 4872b09bd08bdf01fc71eda4fc28698daaa6dd9dda081c42884ed30396ee530d preserved the assessed proof. The two precision edits were applied: Feehan quotient versus chosen-representative hypotheses are separate, and both weak (1,1) and strong L2 estimates are explicitly for the adjoint flux multiplier. All 33 manual citations follow first use and match canonical entries. The helper authored E101; this is an integration check, not another independent derivation audit. Final PDF verification is separate.
