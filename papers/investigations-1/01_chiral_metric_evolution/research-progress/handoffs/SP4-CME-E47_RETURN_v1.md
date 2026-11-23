# SP4-CME-E47 return v1 — round linear stability and trace

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. [Request][request] SHA-256 `31409a7a8c02d5ae94e92777e6986ef38ea42e65eeb2f1f39704eefce3d9b684`. All frozen hashes matched. [Linear derivation][note] SHA-256 `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6`.

## Result and source correction

At the fixed round perfect reference in Fine's normalization, \(P_0=\sqrt8\operatorname{tf}L_0\). This is the exact Hessian factor because the second variation of the squared trace-free energy is \(2\|\delta Q\|_2^2\) and \(\delta Q=2\operatorname{tf}L_0 d_0\). The occurrence of \(\Theta^{-1/2}\) in the proof of Proposition 4.12 differs from the defining square root in (4.5) and leaves the kernel argument unaffected. The strong symbol is the sum of the physical squared symbol and the squared adjoint gauge symbols, with coefficient \(|\xi|^2\) for the vector-field gauge term. The common nullspace is zero by the exact symbol sequence. The closed self-adjoint realization has strictly positive spectrum. The kernel proof excludes round parallel vector fields and then uses Fine's twisted Dirac identification. Round vanishing follows directly from \((D^-)^*D^-=\nabla^*\nabla+3\kappa I\), since the self-dual twisting curvature has zero Clifford action on \(S^-\). [Fine v2][fine]. [Derivation][note].

For any integer \(m\ge6\) and \(0<\alpha<\lambda_1(G_0)\), the spectral energy of \(b=e^{\alpha t}a\) gives the requested half-line estimate and bounded evolution/trace isomorphism. It uses \(G_0-\alpha I\ge\frac{\lambda_1-\alpha}{1+\lambda_1}(I+G_0)\) in spectral order. Spectral truncations give existence and uniqueness, the graph/Sobolev norm equivalence, and the strong \(H^m\) initial trace on the complete solution space. [Derivation][note].

Fine v2 pp. 39–40 print \(P_{2k}\) with weighted \(\partial_t^j\) in \(L^2H^{2(k-j)}\), and the claimed isomorphism with trace target \(L_k^2=H^k\). Evaluation into that space is bounded. The exact trace range is \(H^{2k-1}\), so the isomorphism with target \(H^k\) is not onto for \(k\ge3\). This concerns those displayed spaces and that isomorphism. The round estimate above uses the verified trace. [Fine v2, §4.3][fine].

## Provenance and scope

Existing root PDF 447930 bytes, SHA-256 `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8`. Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, arXiv:1111.5005v2, 29 November 2011. Selected passages checked 22 November 2026, America/New_York. Definitions 1.4–1.5, Proposition 1.12, Lemma 2.2, (3.1)–(3.3), Lemma 3.5, §§3.4 and 3.6 including Theorems 3.11 and 3.13, Proposition 4.2, (4.5), Lemma 4.9 and §4.3, pp. 37–40. Rendered and visually inspected local pp. 28, 33 and 38–40. Hitchin [18], LeBrun [25] and Horan [20] were identified from Fine's p. 51 bibliography and the Dirac vanishing was checked by an independent round calculation. No new reading copy or retrieval provenance was inferred. [Primary version][fine]. [Prior canonical record][canonical].

- B35 consumed SHA-256 `c5a622f748ffb18547b5216b8569b998d8cbe7189ac5d45608dcd79ca53ee2a7`
- E36 consumed SHA-256 `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a`
- E29 consumed SHA-256 `f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5`

Disposition **linear result proved on the fixed round sphere**. Nonlinear stability and gauge recovery lie outside the packet.

[request]: SP4-CME-E47_REQUEST_v1.md
[note]: ../../notes/47_ROUND_STABLE_LINEAR_20261122.md
[fine]: https://arxiv.org/pdf/1111.5005v2
[canonical]: ../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#fixed-reference-stability-follow-up
