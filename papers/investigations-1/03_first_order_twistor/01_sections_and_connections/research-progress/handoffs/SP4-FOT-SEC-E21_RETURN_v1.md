# SP4-FOT-SEC-E21 return v1 · Round opposite-chirality transmission

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured helper route was
`gpt-6.2-sol` / `ultra`. Actual backend model and effort were
unavailable for independent verification. The author-selected lead
was retained, with actual identifier and effort unavailable.
[Frozen request v1](SP4-FOT-SEC-E21_REQUEST_v1.md)

The [derivation][note] computes the linear transmission on the
standard closed oriented real unit round \(S^4\), with both Weyl
blocks in their positive symmetric transported frames and the
curvature-operator Hilbert–Schmidt pairing. Lead assessment is pending.

| Check | Result |
| --- | --- |
| Compact correction | The constant flat adjoint field \(Z\) pairs with \(\chi Z\) by \(6\int\chi>0\). The corresponding local round adjoint field is \(\Omega^{-2}Z\). This excludes a compactly supported metric correction and leaves the smooth closed round cokernel trivial. |
| Relative symbol | At \(\xi=\ell e^0\), both chiral symbols on TT are \(-\ell^2(h_{ij})/4\) in the real convention. The induced reflection in \(\xi^\perp\) sends \(\omega_i^+\) to \(-\omega_i^-\), whose sign cancels under conjugation. The two full symbol kernels agree and consist of the gauge directions. The relative Fourier multiplier is \(M(\xi)A=C_\xi A C_\xi^{-1}\) with \(C_\xi=(\Lambda^2R_\xi)|_{\Lambda^+}\). |
| Global weights and isometry | The flat curvature field is \(\Omega^2\) times the round one and the flattening is an onto \(L^2\) isometry. The smooth closed round lift makes the flat variation tempered and its curvatures \(L^2\), which removes any ambiguity at \(\xi=0\). The exact operator is conformally conjugate to the orthogonal multiplier, and its adjoint is the reverse-chirality transmission. Global smoothness at the pole comes from the closed metric lift. |
| Prescribed response | In flat negative-chiral coordinates it is \((2\pi)^{-4}\int e^{ix\cdot\xi}\widehat\chi(\xi)C_\xi Z C_\xi^{-1}\,d\xi\), with round weight \(\Omega^{-2}\). Directional limits of its Fourier transform differ at the origin and imply a nonzero response somewhere in the southern cap. The quartic numerator is explicitly identified in the note. |

At HEAD `e76752648b69969b1234d0295530c87fce9fcdcb` all sixteen B16
and all seven setup crosswalk pins matched. The [note][note] SHA-256 is
`4975a4a4f4851524e565d8afc9d14bfd846c7c8ba233286661229cdb5c92400e`.
Inspected Gover–Gursky §1 curvature decomposition and §1.1 pp. 295–296,
including the formal adjoint, complex (1.2) and the round example. The
TT kernel, target normalization and conformal comparison use E02.

The radial integral is left in exact Fourier form for the assigned
supporting calculations. This packet supplies a round linear
transmission and a compact-support obstruction. Nonlinear or
arbitrary-manifold transmission remains a separate premise. The lead
owns integration in the [sole register](../REGISTER.md).

[note]: ../../notes/SEC_E21_20261124.md
