# Edition 05 setup · Working sources, installed dependencies and Blueprint

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The selected configuration was GPT-6.2 Astra/ultra leadership with the previously selected bounded proof configuration. This receipt records setup verification. Serving model and reasoning effort were unavailable. [Edition 05 overview](../../research-overview/05_OVERVIEW.md) · [Program register](../REGISTER.md) · [Verified E46 foundation](ED04_E46_VERIFICATION_20261126.md)

## Working source and scope

The Git intake was `4da586548b445ccfe9145c6a5671c0f7ecd433f3`. At 13:34:31 EST the nine scientific TeX and PDF pairs scoped by the E46 receipt matched its working snapshot. A tenth local pair had appeared for the Bour attainment draft. The draft was working-tree evidence at intake. Its primary targets are `prop:budget` on the original fourth-order flow at a fixed positive parameter, `lem:mark` on the actual punctured core and its complete return, and `thm:main` on the selected entered type, including the second critical-metric limit. [Bour draft](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) · [Bour paper register](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/research-progress/REGISTER.md)

The paper works with a smooth closed connected oriented Riemannian homotopy four-sphere, volume-one positive Yamabe starts within `α²` of the fixed-type infimum, and the two Hilbert–Schmidt Weyl block norms. It takes positive subcritical entry on that type as a premise and limits the attainment claim to it. Rigidity of an attained minimizer and universal coverage are separate forward targets. Bour v1 Theorem 1.11 supplies a fixed-parameter dichotomy under its initial pinching. The working paper uses the strictly pinched case and records Bahuaud–Helliwell Theorem A for the short-time gauge. Its pointed return and parameter-uniform estimates have independent paper readings. The original review motivates the route, and the scientific notes state the exact premise levels of each input. [Bour, Theorem 1.11](https://arxiv.org/html/1012.0342v1) · [Bahuaud–Helliwell, Theorem A](https://arxiv.org/pdf/1407.4406v1#page=2) · [Source receipt](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md) · [F2 proposal](../../../../papers/master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature)

The concurrent collar and surgery packets cover the actual paired ports, integral two-port outlet, peripheral slopes, bridge disk, and closing on supplied marked presentations. Those are paper inputs in this setup. The established Lean relative-pair theorem needs the supplied maps and cancellation certificates. The relative Pontryagin identity on the finite pocket remains a separate formalization dependency of E46, whose tested Euler current is a Ricci-flow result. [Two-port handoff](../../../../papers/investigations-1/05_collar_deformation_and_surgery/research-progress/handoffs/TWO_PORT_INDEPENDENT_READINGS_20261126.md) · [Native transgression](../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/BOUNDARY_TRANSGRESSION.md) · [E46 continuation](../../continuation-notes/AFTER_FINITE_POSITIVE_POCKETS_20261126.md)

The 227 working topic files reproduce the E46 aggregate `0cc570ffcd7f73cefffeee5ee6f8e3ccc08720e74026b0fdbd6a3345ebaf9497`. The public root, Edition 04 chapter and E46 verification receipt respectively reproduce `70cae52e8fcf038c124101a50499c95a2b39764dd84ba1fc2aea695b5c8bb3a4`, `83c155ddd132a79b9d6d5805e3c46cabe8b86390be3e817edc06f958a169f7a2`, and `a74bdab6da56c8e2c3c7b043451e60a86b078611526db97095a2a9e54821752b`. The 22 E46 applications replayed successfully under the public root. [E46 public applications](../../reviews/ED04_E46_PUBLIC_CHECKS.lean)

## Installed toolchain and package pins

Lean reports `4.35.0-rc3` at commit `470d5ce1400764999581fd26d5d72b00d990b0f4` on `arm64-apple-darwin24.6.0`, and Lake reports `5.0.0-src+470d5ce`. The actual selector, Lake definition and root manifest respectively hash to `bc84812c94489d1e3e191baa1dc10d5eb684382d7fe9d2a5ab085e72c1c67e47`, `35562fc83d2a568ae4ae08f3e6878481f5cf1c505775acec414dc924f7bfa9db`, and `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. Their bytes match E46. The ten installed package HEADs match their root pins, tracked package status is clean, and all 19 nested entries match the root dependency graph. [Root Lake manifest](../../../lake-manifest.json)

| Package | Working checkout HEAD | Nested entries |
| --- | --- | ---: |
| DifferentialGeometry | `788efe97894474c032de6dfb1289d515f613d15a` | 9 |
| mathlib | `c55e6e786f49471c72fbddbec5415808896aec1e` | 8 |
| plausible | `fb13df72ecefd8ddbf9291021d7f33a8673eb57b` | 0 |
| LeanSearchClient | `29ff470276c725ae01505d55b17148c18fc7dfd3` | 0 |
| importGraph | `7e81a29bda33a6b257bd37557a6aa6aebe175d96` | 1 |
| proofwidgets | `c643bbb3c24f8a25f9c14e3a6b1ceb13d01f3de1` | 0 |
| aesop | `a90fbf7b02ff06a0deebf74088dff9e5fe02c9ea` | 1 |
| Qq | `37b0ba0b26109cf9f9c541f0f9557e50cfa1a3b9` | 0 |
| batteries | `3b7c8101932390d60e92a3f3d917901d5b5a773b` | 0 |
| Cli | `843844fa601dd56767b1eb22b7ada5b64d5e567a` | 0 |

## Existing Lean interfaces and prerequisites to formalize

A fresh `lake env lean -j1` process on a temporary source with `import SmoothPoincare` replayed sorted `#check @name` and `#print axioms name` for 14 declarations. Combined output SHA-256 is `e3b297e3becca9693afd6567fa379580ba1e1bb7e15817074581bafaccfee560`. Thirteen records match E46's captured bytes. The accounting bound `FirstOrderTwistor.accountedEnergy_le_totalEnergy` was separately elaborated in this replay. The transitive axiom union is `Classical.choice`, `Quot.sound` and `propext`.

| Public interface checked | Scope |
| --- | --- |
| `FirstOrderTwistor.geometricPositiveEnergies`, `geometricPullbackCompetitor`, `geometricDescentOnOriginalType` | Admissible positive-energy set, transport across a supplied oriented diffeomorphism, and a same-type competitor under the stipulated comparison. |
| `FirstOrderTwistor.accountedEnergy_le_totalEnergy` | A lower bound from a supplied fixed-domain accounting limit. |
| `SmoothPoincare.geometricRecognitionEndpoint`, `bandPhysical_yamabeEuler_sandwich` | Recognition under its supplied geometric classification and an energy bound under the physical Yamabe/Euler hypotheses. |
| `SmoothPoincare.exists_nativePocket_positive_metric_slices`, `originalDisk_finite_positive_caps_of_balance`, `selectedMatchedCap_scalarTest`, `retainedCore_nearSharp_limits` | Native metric positivity, actual finite cap prices given signed relative balance, inclusive complete cap test, and conditional near-sharp control of the measured core. |
| `SmoothPoincare.ricciFlow_terminalPointed_noncompact_of_initialVolume`, `ricciFlow_testedEuler_hasDerivAt_gradient` | Rescaling and tested Euler transport under the stated second-order Ricci-flow hypotheses. |
| `SmoothPoincare.RelativePairReplacement.exists_terminalPairReduction`, `reverseMiddleCore_nullHomologous` | Terminal count with actual geometric certificates and the reversing-core obstruction on the supplied rank-changing trace. |

The dependency search covered the public Lean source tree and the pinned DifferentialGeometry and Mathlib source trees. The searched ecosystem contains geometric compactness and Ricci-flow solution APIs. The bounded-geometry compactness source starts from `SeqBoundedGeometry`; the compact-limit globalization statement uses supplied compactness data. Their use in the Bour program needs the needed estimates and comparison maps in each chosen gauge. The Hamilton compactness source encodes a Ricci-flow solution. [Pinned dependency lock](../../../lake-manifest.json)

| Next formalization dependency | What must be supplied |
| --- | --- |
| Fourth-order equation and first variation | Represent the actual time-dependent oriented metric, chiral and full norms, trace-free Ricci and scalar charges, smooth energy derivatives and Bour's `−2 grad F^α`. Check the Gauss–Bonnet identity in the chosen normalization. |
| Fixed positive parameter | Short-time gauge, continuation, derivative estimates, noncollapse and dissipation on the original trajectory, including the change of time by the squared metric scale. Derive the closed and noncompact alternatives for that equation. |
| Both critical-metric branches | The constant-scalar Ricci equation in both physical gauges, parameter-uniform harmonic-coordinate estimates and the elliptic bootstrap, then the appropriate closed or rescaled pointed extraction. |
| Pointed return | Carry one complete truncated core in its actual oriented markings, derive ALE structure and the end count, construct the smooth compactification and positive class, and return it to the original carrier with two-sided comparison maps and the complete energy inequality. |
| Attainment versus coverage | Identify a positive same-type class with energy exactly the infimum before addressing classification or an admissible negative direction. Universal entry still needs its own witness on types outside existing direct recognition. |
