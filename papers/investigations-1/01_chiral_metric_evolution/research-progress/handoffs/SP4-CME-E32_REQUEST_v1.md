# SP4-CME-E32 request v1 — Good time slice from conditional strain energies

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized Sol6.2/ultra; selected lead actual settings unavailable. No shared edits or chat capture. Read B26 and root instructions. All connections smooth positive definite and round-compatible on a closed oriented real Riemannian four-manifold; fixed K>0, manuscript delta normalization, ordinary two-form norm. Do not infer a missing interval hypothesis.

Own notes/32_ENERGY_SELECTED_SLICE_20261122.md and research-progress/handoffs/SP4-CME-E32_RETURN_v1.md only.

Take an actual smooth unadjusted Fine solution on [0,t+1/K] with pointwise q pinched below the common E16/E19 threshold and one uniform scalar Sobolev CS. Assume initial Y0=||T0||4²<(2 C CS)^−1 with the common constant C chosen to absorb both E16 and E19 nonlinear terms. Let E20=integral|T0|²dV, Q20=||q0||2, cR=42+8sqrt3. Verify energy inequalities yield E2(s)<=E20 exp(−Ks/2), integral_t^{t+1/K}||nabla_A T||2² ds<=2E20 exp(−Kt/2), and hence a time tau in [t,t+1/K] with
||R_K(tau)||2 <= K Q20 exp(−18Kt) + [6sqrt(2K E20)+cR Y0]exp(−Kt/4).

Track the pointwise fixed volume and distinction between L4 norm and squared L4 norm. Prove a good slice exists using continuity/mean value, not a bound at every time. The q energy decay coefficient36K requires pointwise pinching <=1/8 and should be compared with the common smaller threshold. If the proposed constants require adjustment, derive valid explicit replacements.

For an arbitrary supplied positive threshold theta, show a sufficient finite waiting time from the displayed upper bound, e.g. t>(4/K)log_+(2A/theta) with A=KQ20+6sqrt(2K E20)+cR Y0, or give a precise non-strict-safe choice. State that existence and interval hypotheses through t+1/K are required. E31 separately tests theta=min(2pi,sqrt3/(2CS)) for sphere recognition; do not import its conclusion before lead assessment. No global existence or convergence claim.

## Frozen inputs

- `brainstorm/notes/B26_GOOD_SLICE_SPHERE_ROUTE_20261122.md` SHA-256 `22f9a19dbb36a9dfb4534ca16af8f7a7ee16953f75aaea098ef5d0a4c453f44c`
- `notes/07_PINCHED_ENERGY_GAP_20261122.md` SHA-256 `cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb`
- `notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md` SHA-256 `713aa0bd1c9a3644d57208fa6ae30b4fdcd18df060197b03ef0b39afcb800437`
- `notes/20_CRITICAL_STRAIN_ENERGY_20261122.md` SHA-256 `5b7b6ec68d806188a6a54209a7cc513ce0a0a3a10b1582368ef073ae12585228`
