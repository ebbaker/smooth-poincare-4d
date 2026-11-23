# SP4-CME-E104 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E50, E63, the upstream
E16A round reaction and the related E14 temporal criterion. I previously
audited E84 in E86. The new implication is displayed in the [note][note].
See the [frozen request][req] and [B59 decision][b59].

## Adjusted head, stable tail and original geometry

Pass. E42 (7) compared with the zero datum bounds the adjusted
head's fixed value norm by a common constant times the initial
connection/curvature value norm. Fix \(\sigma=\mathcal T/2\)
once. E63 with order six on a fixed strip containing \(\sigma\)
gives the linear \(H^6\) bound there. E49 keeps that \(H^6\)
bound along the whole adjusted tail with an exponential factor.
The fixed \(H^6\subset C^1\) embedding and
\(F_B-F_0=d_{A_0}b+\tfrac12[b\wedge b]\), \(b=B-A_0\),
bound tail values by a uniform linear plus quadratic function of
the initial pair values. One value threshold places both pieces
in any prescribed smaller tube. The individual smooth comparison
at time zero can depend on the datum's smooth norms. The head
lifespan, splice and stability entry threshold are fixed.

For a fixed adjusted comparison
\(\Lambda^{-1}g_{\rm rd}\le\widehat g\le\Lambda g_{\rm rd}\),
the four-dimensional volume ratios contribute \(\Lambda\)
to the squared \(L^4\) norm and \(\Lambda^2\) to each right-hand
integral in the scalar Sobolev comparison. The round inverse
metric contributes another \(\Lambda\) to the gradient term.
Thus \(C_S=\Lambda^4 C_{S,\rm rd}\) works. The curvature value
tube also ensures \(\sup|q|\le\min\{\epsilon_0,\epsilon_1\}\).
Exact bundle pullbacks transfer both estimates to the original
slices, with the Sobolev comparison done by change of variables.
E50 recovers both sides of the splice and identifies them on a
right overlap by smooth original uniqueness. The energies are
smooth there. This uses E84's naturality identities only.

## Intrinsic energy inequalities

Take \(C_2\) and \(C_4\) from E16B and E19, respectively.
The independent initial requirement is
\[
 \|T(0)\|_4^2<\min\{(2C_2C_S)^{-1},(2C_4C_S)^{-1}\}.
\]
Use E19's first exit with its own threshold first. It proves the
quartic differential inequality and keeps the norm below the
distinct E16B threshold on every compact interval. In normalized
time \(t\) this gives \(E_2'+D_2/2+(K/2)E_2\le0\) and
\(F_4'+4G_4+(K/2)F_4\le0\), where the E19 coefficient before
absorption is \(c=8\). Both energy decay rates are \(K/2\).
With \(\kappa=2K\) and native time \(\tau=\kappa t\),
\[
 (E_2^{\rm F},D_2^{\rm F},F_4^{\rm F},G_4^{\rm F})(\tau)
   =(\kappa E_2,D_2,F_4,\kappa^{-1}G_4)(t).
\]
The native gradient coefficients remain \(1/2,4\) and the native
energy decay rates are \(1/4\). In both conventions multiplying
by the exponential integrating factor and integrating bounds
the weighted energy plus its gradient dissipation by its initial
value. Equations (6) and (8) of the note give the finite-time
formulas and their infinite-time gradient bounds. Initial live
\(L^{4,1}\) smallness is sufficient since in the prescribed
convention \(\|T\|_4\le\|T\|_{4,1}/4\).

The conclusions are inside the existing smooth round value basin.
The tube argument uses value estimates and positive-time smoothing
independently of the initial strain. The spatial integral estimates
give no general supremum temporal budget \(J\) or Lorentz propagation.
No new source or slice hypothesis is used. Only the two E104
artifacts were written.

## Verified versions

All seven frozen note digests matched the request. The E16–E17
assessment records its historical E16B version. E104 uses the
current frozen bytes and the separate typesetting correction
record. Earlier provenance is preserved.

| File | SHA-256 |
| --- | --- |
| E104 request | `56977a7612e64ac5f79e203378950429d703965a6f494adb922ea435d29e2761` |
| B59 decision | `812edb3f3663fb7040f457d52cb7c1c84c1ab638078755653735e1918a635d5f` |
| E16B | `713aa0bd1c9a3644d57208fa6ae30b4fdcd18df060197b03ef0b39afcb800437` |
| E19 | `5b7b6ec68d806188a6a54209a7cc513ce0a0a3a10b1582368ef073ae12585228` |
| E42 | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| E49 | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` |
| E50 | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` |
| E63 | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` |
| E84 | `fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9` |
| E16–E17 lead assessment | `1d3ca51d6008c40c0cb2e1f433168ea1217320eeff5688e10d67da69d1787f21` |
| E19–E21 lead assessment | `00eaa6ede5793cf3a5908fc60ff0e267cb03f43cd6da365e80e4c758ac2f83e5` |
| E49–E52 lead assessment | `f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee` |
| Typesetting correction record | `2ae8b3a5ce147f84aa879580f01ae62b3ef122cc2ff73bde1ce5d4adea49d807` |
| E104 derivation | `d299a0221bbc097ae5fe991a70301de21ca5aa2b2b9a6c7e98c3f5fc79fc4981` |

[req]: SP4-CME-E104_REQUEST_v1.md
[b59]: ../../brainstorm/notes/B59_GLOBAL_STRAIN_ENERGY_IN_VALUE_BASIN_20261122.md
[note]: ../../notes/104_GLOBAL_VALUE_BASIN_STRAIN_ENERGY_20261122.md
