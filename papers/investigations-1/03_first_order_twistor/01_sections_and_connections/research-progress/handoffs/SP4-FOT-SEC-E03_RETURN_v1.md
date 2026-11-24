# SP4-FOT-SEC-E03 return v1 · Full-domain radial lift

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured helper route was
`gpt-6.2-sol` / `ultra`. Actual backend model and effort were unavailable
for independent verification. The author-selected lead was retained,
with actual identifier and effort unavailable.
[Frozen request v1](SP4-FOT-SEC-E03_REQUEST_v1.md)

The analytical packet is complete for a supplied smooth reference on
a closed oriented real Riemannian homotopy four-sphere. The full
trace-free metric chart preserves the reference volume pointwise.
The target is the transported self-dual Weyl operator with its
Hilbert–Schmidt pairing. The proof uses the permitted high Sobolev
grades. The [derivation][note] gives regularity and normalization.
Lead assessment is pending.

| Item | Checked result |
| --- | --- |
| Full normal operator | \(P=L_rL_r^*\) is fourth-order elliptic with \(\sigma_\xi(P)=|\xi|_r^4 I/16\). Its kernel is the smooth finite-dimensional \(\ker L_r^*\). The full range of \(L_r\) is the reference orthogonal complement of that kernel. |
| Local path | If \(\ker L_r^*=0\), \(Q=L_r^*P^{-1}\) is a bounded split right inverse with a gain of two derivatives. In the complement \(h=Qz\), the Banach implicit function theorem gives a local path with \(F_r(h(t))=(1-t)W_r^+\) and \(h'(0)=-QW_r^+\). The profiles are smooth in space. |
| Tangent when the kernel is nontrivial | A differentiable lift through \(h=0\) requires \(\langle W_r^+,U\rangle_{L^2(r)}=0\) for every \(U\in\ker L_r^*\). This is sufficient for the linearized tangent equation. |
| TT and longitudinal variations | Projecting \(L_r\mathcal K_r\) onto the finite smooth TT annihilator is onto exactly when the full \(L_r\) is onto. When this holds, a finite family of smooth vector fields spans that projection. The volume-normalized pullback action is \(\nabla_XW_r^++[\Theta_X,W_r^+]+(\operatorname{div}_rX)W_r^+/2\), where \(\Theta_X\) is the induced skew-frame pullback on \(\Lambda_r^+\). This action vanishes at an ASD reference and can affect the fixed target away from ASD. Pure conformal directions are excluded by the volume condition. |

HEAD was `e76752648b69969b1234d0295530c87fce9fcdcb`. The seven setup
digests, both shared digests and all three E01/E02/B02 digests matched
their pins. The [note][note] SHA-256 is
`0cb76883e4b1d7706b192bd1a8488b3e29551506d20dcd7b63d2d538afcab463`.
Inspected Gover–Gursky §1.1, pp. 295–296 and (1.2) for the ASD
comparison and Kottke's *Linear Analysis on Manifolds*, Propositions
1.21–1.28 and Corollary 1.44, for the closed elliptic arguments.

B02's gauge, fixed target and derivative grades support the stated
local argument. Whether the projected longitudinal action spans at
arbitrary references is unresolved. The conditional lift supplies
neither a uniform inverse bound along a radial path nor a global path.
The lead owns integration in the [sole register](../REGISTER.md).

[note]: ../../notes/SEC_E03_20261124.md
