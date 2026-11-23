# SP4-CME-E65 return v1 — geometric strain and clock audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. [Frozen request][req] SHA-256 `2ab3b9b4816ad5427b2e7f2a2ba3061fd68b490399e40e141cad2e03a6cdffd0`. All four frozen input hashes matched. [Review and calculations][review] SHA-256 `3b2e04259314e601c5e446a7bd23ced0dae91cd6f3d714559406731a349dc5cb`.

- **Reconstruction passes.** The curvature-plane graph is \(F_-F_+^{-1}\), and the trace-free Hodge variation maps to its graph differential \(\dot *|_{\Lambda^+}/2\). The differential is an isomorphism of nine-dimensional spaces. The fixed curvature volume gives the scalar metric factor, and uniqueness gives equivariance and uniform fiber derivative bounds on the small tube. The round chiral reference is parallel and \(Q(F_0)=I\).
- **Covariant estimates pass.** The internal correction is \([\operatorname{ad}a,Q-I]\). The derivative of the one-form strain includes the negative Christoffel difference on its covector slot. Its additional bound is \(C(u+d)(d+u^2)\); all pieces are covered by \(C(e+d^2+ud+u^2)\) in the reference-to-live comparisons. Fixed chart derivative terms are retained, and the time-interpolated weight \(2^{3j/2}\) bounds both undifferentiated and first-derivative terms in \(L^2_tL^\infty_x\). The two-derivative weight \(2^{5j/2}\) gives the \(L^1\) term. Thus \(J\le C(H+MH)\).
- **Naturality and conversion pass.** Timewise pullback gives the same spatial supremum under the pulled-back metric. The native internal metric is \(2\delta\), hence \(\mu_{\rm F}=2\mu\) and \(g^{\rm F}=2K\widehat g\). Bianchi removes the constant \(2I\) from the physical factor and the codifferential scales by \((2K)^{-1}\), giving \(\tau=2Kt\). Both strain summands in the native norm scale by \((2K)^{-1}\), cancelling the time Jacobian when both conventions are converted. The fixed localized norms stay tied to the reference.

Disposition **E59 passes in its smooth compatible-path scope**. No evolution or inverse-strain theorem is used or proved. [E59][e59]. [Audit][review].

## Sources and frozen inputs

Rechecked selected remote passages of Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, arXiv:1111.5005v2, 29 November 2011, on 22 November 2026, America/New_York. Definition 1.4 and the Killing-form normalization on p. 4, Definition 1.5 on p. 5, Lemma 2.2 and proof on pp. 12–13, and Proposition 4.2 and (4.1) on p. 30. No new source version or local copy obtained. [Primary preprint][fine].

- E59 `2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a`
- E03A `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2`
- E14 `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193`
- E54 `34924ef4445b1fc479b79c0f9d5452243c12ae399220e1e077b6e21bfed8073a`

[req]: SP4-CME-E65_REQUEST_v1.md
[review]: ../../reviews/E65_CRITICAL_STRAIN_AUDIT_20261122.md
[e59]: ../../notes/59_CRITICAL_PATH_STRAIN_20261122.md
[fine]: https://arxiv.org/pdf/1111.5005v2
