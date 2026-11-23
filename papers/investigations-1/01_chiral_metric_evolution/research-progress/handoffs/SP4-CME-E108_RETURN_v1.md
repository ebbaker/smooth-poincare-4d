# SP4-CME-E108 return v1 — global strain-energy implication audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, helper launch configured
gpt-6.2-sol/ultra. Independent runtime attestation and selected lead
settings were unavailable. I authored E41 and E47, upstream inputs
of the assessed E42 and E49 constructions, and previously audited
E42, E49/E50 and E63 in E44, E52 and E67. I also authored the
separate E17 and E21 benchmarks. I did not author E104 or its seven
frozen derivations. [Frozen request][req] · [Audit][audit].

## Disposition

Pass on the frozen global implication. With one common E42 time
\(\mathcal T\) and splice \(\sigma=\mathcal T/2\), any prescribed
small adjusted value tube can be enforced on both branches by
shrinking the initial full-pair value threshold. The adjusted
head has its fixed \(C^0\) estimate and the fixed positive-time
\(H^6\) bound. The E49 tail remains \(H^6\)-small, and the exact
curvature difference is bounded by the \(H^6\) norm and its square.
The individual comparison needed for initial smoothness does
not affect either threshold. The exact E50 product order and
smooth right overlap give the original flow through the splice.

Small adjusted curvature values give both required pointwise
pinching thresholds and the round bilipschitz comparison.
For comparison factor \(\Lambda\), the transferred Sobolev
gradient and mass terms cost respectively \(\Lambda^4\) and
\(\Lambda^3\), including the densities on both sides.
Per-slice naturality transfers these geometric premises and all
four intrinsic integrals to the original connection. Fixed-coordinate
closeness of its metrics is not a premise.

The two separate thresholds for the initial live \(L^4\) strain
norm squared are \((2C_2C_S)^{-1}\) and
\((2C_4C_S)^{-1}\). The quartic first exit from the latter
gives persistent decay and hence the former hypothesis for the
quadratic energy. Both native energies decay at rate \(1/4\)
with dissipation coefficients \(1/2\) and \(4\). The factors for
\((E_2,D_2,F_4,G_4)\) are \((\kappa,1,1,\kappa^{-1})\) at
\(\tau=\kappa t,\ \kappa=2K\). The normalized energy rate is
\(K/2\), and the weighted gradient integrals use the corresponding
integrating factor. At time zero \(L^{4,1}\) suffices through
\(\|\cdot\|_4\le\|\cdot\|_{4,1}/4\) in the specified convention.
The result keeps the initial pair value threshold and the initial
strain threshold. It supplies no propagation of \(L^{4,1}\), no
supremum-based \(J\) estimate, and no extension of this value basin.

## File identities

| Input or output | SHA-256 |
| --- | --- |
| [E108 request][req] | 92dc22ca9fa7a3eab52e6e9b321b997b4d138d07783fd803f039093376ca00e9 |
| [E104 request][req104] | 56977a7612e64ac5f79e203378950429d703965a6f494adb922ea435d29e2761 |
| [B59][b59] | 812edb3f3663fb7040f457d52cb7c1c84c1ab638078755653735e1918a635d5f |
| [E104][e104] | d299a0221bbc097ae5fe991a70301de21ca5aa2b2b9a6c7e98c3f5fc79fc4981 |
| [E16B][e16] | 713aa0bd1c9a3644d57208fa6ae30b4fdcd18df060197b03ef0b39afcb800437 |
| [E19][e19] | 5b7b6ec68d806188a6a54209a7cc513ce0a0a3a10b1582368ef073ae12585228 |
| [E42][e42] | 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77 |
| [E49][e49] | 45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16 |
| [E50][e50] | ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf |
| [E63][e63] | 427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb |
| [E84][e84] | fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9 |
| [E108 audit][audit] | a14bfe4d905d1ed5e795d37460cf8408db547ebba8dfcf60e082a35a29272a14 |

All seven inherited digests were checked directly. Typesetting
provenance and assessment versions are recorded in the audit.
No new external source or shared edit.

[req]: SP4-CME-E108_REQUEST_v1.md
[req104]: SP4-CME-E104_REQUEST_v1.md
[b59]: ../../brainstorm/notes/B59_GLOBAL_STRAIN_ENERGY_IN_VALUE_BASIN_20261122.md
[e104]: ../../notes/104_GLOBAL_VALUE_BASIN_STRAIN_ENERGY_20261122.md
[e16]: ../../notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md
[e19]: ../../notes/20_CRITICAL_STRAIN_ENERGY_20261122.md
[e42]: ../../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e49]: ../../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: ../../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e63]: ../../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e84]: ../../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[audit]: ../../reviews/E108_GLOBAL_STRAIN_ENERGY_AUDIT_20261122.md
