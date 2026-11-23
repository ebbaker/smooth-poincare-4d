# E104/E108 — Global integrated strain decay in the round value basin

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual identifiers unavailable. Helpers configured gpt-6.2-sol/ultra without independent runtime attestation. The lead read the derivation and independent implication audit in full and recomputed the geometric comparison factors, separate absorptions and normalization. Accepted without correction, within the already established smooth round value basin.

[E104](../notes/104_GLOBAL_VALUE_BASIN_STRAIN_ENERGY_20261122.md), SHA-256 d299a0221bbc097ae5fe991a70301de21ca5aa2b2b9a6c7e98c3f5fc79fc4981, proves that the earlier conditional energy inequalities apply globally after two independent initial restrictions: sufficiently small fixed connection/curvature values at the round reference, and sufficiently small live L4 strain. [E108](E108_GLOBAL_STRAIN_ENERGY_AUDIT_20261122.md), SHA-256 a14bfe4d905d1ed5e795d37460cf8408db547ebba8dfcf60e082a35a29272a14, independently checks this new implication. E104 authored inherited E50/E63 and E14/E16A, and audited E84; E108 did not author E104 or its seven direct derivations, but disclosed E41/E47 and earlier related audit overlap. This is not a new independent audit of every inherited theorem.

Fix the E42 head time and its splice at half that time. Its pair sup bound vanishes linearly with the initial pair size. Fixed positive-time smoothing gives an H6-small splice datum. The stable H6 tail and curvature identity give a uniform all-time pair sup bound there as well. One initial value threshold therefore places both adjusted pieces in any prescribed small geometric tube, with no use of the initial strain or temporal budget. That tube supplies the earlier pointwise q pinching and a metric comparison with the round metric.

If Lambda^-1 g_rd <= g_adjusted <= Lambda g_rd, the four-dimensional volume factors give Sobolev costs Lambda^4 on the gradient term and Lambda^3 on the mass term. One constant Lambda^4 C_S,rd suffices. Every original slice is an exact orientation-preserving pullback of its adjusted slice, so pointwise q and the scalar Sobolev constant transfer exactly. This does not assert fixed-coordinate comparison between the original metric and g_rd. The exact recovery splice gives a smooth original solution and no energy jump.

Write normalized E2=integral |T|^2, D2=integral |nabla T|^2, F4=integral |T|^4 and G4=integral |T|^2|nabla T|^2. The initial squared L4 norm is below both Y2=(2 C2 C_S)^-1 and Y4=(2 C4 C_S)^-1, where C2 and C4 are the distinct inherited error constants. E19's first-exit argument gives F4'+4G4+(K/2)F4<=0. Its persistence of L4 smallness then gives E2'+D2/2+(K/2)E2<=0 from E16B. The geometric interval hypotheses were already established independently.

Under native G=2K ghat and tau=2K t, the four energy factors are (2K,1,1,(2K)^-1). Hence natively

    E2' + D2/2 + E2/4 <= 0,
    F4' + 4G4 + F4/4 <= 0.

Multiplication by exp(tau/4) gives the corresponding weighted inequalities. The full weighted D2 integral is at most 2 E2(0), and the weighted G4 integral at most F4(0)/4. The native L2 and L4 norm decay rates are 1/8 and 1/16; normalized rates are K/4 and K/8. All volumes and derivatives in these energies are live. The initial Lorentz condition ell<4 sqrt(min(Y2,Y4)) suffices by ||T||4<=ell/4.

No propagation of the L4,1 norm, supremum-based temporal budget J, horizontal slice, enlargement of the value basin, or arbitrary-sphere initialization is established. Historical E16B hashes were checked through its recorded typesetting revisions rather than replaced. No new source theorem or primary inspection was introduced by this consequence.

## E113 manuscript integration check

The lead read [E113](E113_GLOBAL_ENERGY_MANUSCRIPT_AUDIT_20261122.md), SHA-256 d9d8386dda4f087c0ee554f2d2732326e8b43915590c46239f9f5a2e94c6bca9, in full. This checked the frozen manuscript c5cb2819d6f540b985a56fe1cb1c06711ff15d5fdd87c6b5dda5b6efd03deb13 against E104/E108 and confirmed all three E110 additions. Its author wrote E104 and E110, so this is an integration audit, not another independent proof audit. The lead implemented both precision corrections: the abstract/introduction now explicitly decrease the value threshold, and the proof refers to the manuscript's single common pinching radius. The splice datum, strict H6 entry, Kato parentheses and live normalized sextic measure were also made explicit. The native coefficients, weighted estimates and final scope are unchanged. Build and visual status are recorded separately in BROAD_RUN_INTEGRATION.
