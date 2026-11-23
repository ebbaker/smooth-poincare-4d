# SP4-CME-E215 return v1 — Spectral-ratio boundary maximum test

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B103, configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored the inherited E02A, E08, E11 and E152 calculations.

## Disposition

**Exact positive local derivative at the specified maximum.** On the smooth trace-three simple-spectrum cone at \(Q_*=\operatorname{diag}(48,75,108)/77\), \(f=\log(\lambda_{\max}/\lambda_{\min})\) has affine gradient \(G=(77/1296)\operatorname{diag}(-22,5,17)\). The actual self-adjoint principal map gives \(\mathscr L_QG=\operatorname{diag}(-4,0,4)\), and for \(T=\operatorname{diag}(\lambda_1,-\lambda_1-\lambda_3,\lambda_3)\) one has \(df[T]=0\) and \(df[\mathscr L_QT]=240/77\). The orthogonal transverse vector is \(Y=(10/133)\operatorname{diag}(4,-13,9)\) with \(\langle G,\mathscr L_QY\rangle=|Y|^2=200/133\).

The actual polynomial connection uses old \(K=1\), \(F_i^*=-\sqrt{\lambda_i}\Sigma_i^*\) and \(H=-\sqrt{\det Q_*}\,q_*/2-G+10Y\). The fixed-covector right inverse and affine Hessian were rederived using positivity of the \(s_i=\sqrt{\lambda_i}\) and the quaternion contraction, with no near-round restriction. Exact curvature enforces Bianchi. At the center the curvature, metric and quotient first jets are as required. The differentiated connection commutator contributes only to the antisymmetric base part of the covariant Hessian, and the actual old reaction is retained in the flow direction.

The scalar Hessian is \(-788557\,g_{\rm e}/279936\), yielding a strict local maximum with ratio \(9/4\) and smaller ratio throughout the punctured ball. The old scalar rate is \(8000/133-1001/27-(385/18)\sqrt{\det Q_*}>12119/7182\). Native time divides it by two. The exact standard-library verifier checked the affine baseline directly from the connection speed and all cubic increments used, and reproduced the recorded JSON byte for byte. The conclusion is a directional test on local data, with no evolved solution, closed extension, global preservation failure or singularity assertion. Independent audit remains pending.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E215 request](SP4-CME-E215_REQUEST_v1.md) | aafcb474470caeb6153662945a3161c1ad63ca7158d979c2d84092ccbd6088ad |
| [B103](../../brainstorm/notes/B103_SPECTRAL_RATIO_MAXIMUM_TEST_20261123.md) | 3948c94087b7af0125c440986a4aa1c1880c6e3d7652d25dfcaf3e0d9a4d9445 |
| [E11](../../notes/13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md) | 91f87b6d5655cd03ec0ac1f4a692df05a2848a873406feb41938a542ccdb0ae7 |
| [E08](../../notes/10_SCALAR_PINCHING_JET_20261122.md) | 2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06 |
| [E02C](../../notes/04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E02A](../../notes/04A_NONLINEAR_Q_20261122.md) | 4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19 |
| [E152](../../notes/152_DETERMINANT_NORMALIZED_TRACE_TEST_20261122.md) | d860eb8260834bd65283e727a3574c8580a4b7890bfc1b9d87075fd82672e5d4 |
| [E152/E153 assessment](../../reviews/E152_E153_DETERMINANT_TRACE_ASSESSMENT_20261122.md) | 3f9d176349ec78f9d7a083769695cc50ce139b6ba0fbe0fa7b89fba7e30b81d1 |
| [E202–E204 assessment](../../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E215 derivation](../../notes/215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 21812494994f845b5b20c05f52a1be3e630417ece04431b01dd255e76f9057e1 |
| [E215 script](../../numerics/e215_spectral_ratio_jet.py) | 401ec6be0070d88b6d068a56679dcaca9461321e5397781c0904cb31321c3d3c |
| [E215 certificate](../../numerics/e215_spectral_ratio_jet.json) | 9802650145d78991c086ba324125730e61a741885c7b607b73718f5fb35cd458 |

This return is the fourth owned output. No other artifacts were edited or sources retrieved. Sole live status is [REGISTER](../REGISTER.md).
