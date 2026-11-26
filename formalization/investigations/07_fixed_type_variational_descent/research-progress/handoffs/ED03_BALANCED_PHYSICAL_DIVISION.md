# Edition 03 · Dyadic division on the physical source

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E application of the marked four-measure division.
The serving model identifier and reasoning effort are unavailable to the
worker. [Route 07](../REGISTER.md) · [Atlas packing](ED03_ATLAS_BALL_PACKING.md) ·
[Balanced marked exterior comparison](ED03_BALANCED_MARKED_EXTERIOR.md)

Fix a compact connected smooth boundaryless oriented Riemannian four-source
with a supplied original marked disk \(Q\). The four measures in order are
the physical \(\lambda^+\), \(\lambda^-\), the spectral measure \(\sigma\), and
the full covariant curvature measure \(\nu\). The last two can first be any
finite measures absolutely continuous with respect to that same physical
volume. Physical volume assigns zero mass to each point, by applying the
null-image theorem to a constant smooth parametrization of a Euclidean
singleton. The marked construction derives point-nullity of all four
members from their absolute continuity via `nullSingletonClass_of_physicalVolume_ac`.
[Physical division module](../../../../SmoothPoincare/Variational/BalancedPhysicalDivision.lean)

For each \(k\ge1\) and positive absolute tolerance \(\varepsilon\), the
dyadic construction yields a marked outer disk whose open interior contains
the original closed \(Q\). If \(S\) is the entire closed exterior of the
outer disk and \(S_Q\) is that of \(Q\), then the same \(S\) obeys

$$
 |\lambda^\pm(S)-2^{-k}\lambda^\pm(S_Q)|<\varepsilon,\qquad
 |\sigma(S)-2^{-k}\sigma(S_Q)|<\varepsilon,\qquad
 |\nu(S)-2^{-k}\nu(S_Q)|<\varepsilon.
$$

The specialized constructor takes \(\sigma\) to have density equal to the
square of the larger top eigenvalue represented by the supplied chiral
spectra, and \(\nu\) to have density equal to the squared norm of the
actual Riemann curvature tensor with its four ordered slots. Integrability
of those physical densities supplies finiteness and the density construction
supplies absolute continuity. The pair of chiral measures uses the actual
oriented frames and sign blocks already stored by `SignedCollarMetric`.
`exists_balancedPhysicalSpectralExteriorDivision_of_endpointData` accepts
`EndpointPhysicalSpectralData o g.metric g.frame plus minus` on the same
nonempty source. Its `plus_spectrum` and `minus_spectrum` fields identify
the two supplied functions with the ordered spectra of the actual Weyl
blocks in this frame. Its `top_integrable` field supplies integrability of
the spectral density. Integrability of the full curvature density remains
an explicit input.
[Physical spectral data](../../../../SmoothPoincare/Variational/EndpointSpectralDeficit.lean) ·
[Full curvature measure](../../../../SmoothPoincare/PhysicalScales/MetricQuantiles.lean) ·
[Marked dyadic construction](../../../../SmoothPoincare/Variational/MarkedDiskSeparation.lean)

`exists_bufferedNestedMarkedDisk_fourMeasure` also selects one marking
for generic finite, volume-absolutely-continuous measures that satisfies
the dyadic division and has a protected trim. At all sufficiently large
natural indices, the full trim annulus lies within the chart buffer, is
disjoint from the original closed core, and has total mass less than the
prescribed positive trim allowance.
[Protected trim](../../../../SmoothPoincare/PhysicalScales/ProtectedMarkedTrims.lean)

For a sequence with \(e_i\to I<2T\) and positive tolerances tending to zero,
choose one marked outer disk at each source. At any fixed positive depth,
including the half-depth \(k=1\), both chiral masses of these complete raw
exteriors are eventually strictly below \(T=4\pi^2\). The spectral and full
curvature division statements still hold on the chosen disks. This concerns
the incoming metric. A matched joined path, positive cap and sufficient
disk-side saving remain needed for a descent comparison.

The working base was `4bec4df82e8b949935dd5a43f12f52cd3d018acb`. The pinned
Lean version was `4.35.0-rc3`. Mathlib was at
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry was at
`788efe97894474c032de6dfb1289d515f613d15a`.

The 26 November 2026 UTC integration used working base
`5706ef811adc3691fd85e75507a0a399cb81d18d` and the same pins. Final
`MarkedDiskSeparation.lean` and `BalancedPhysicalDivision.lean` compiled
with `lake env lean -j1` without diagnostics. The source SHA-256 values are
`5bfd6145b9b9a59a66a123353850c7f5a13493da278118f5ac62fa1dbd399bbd` and
`16e3f21fe84b5567eed1581fdb270c07ac7947c31a4715e73a9f8e6fe9eef82c`, respectively.
The kernel replay through `SmoothPoincare.Variational.BalancedPhysicalDivision`
checked the separator, singleton nullity, half and dyadic division, protected
trim, physical specializations including the endpoint-data wrapper, and the
eventual two-chirality threshold. Each depends on `propext`,
`Classical.choice` and `Quot.sound`.
