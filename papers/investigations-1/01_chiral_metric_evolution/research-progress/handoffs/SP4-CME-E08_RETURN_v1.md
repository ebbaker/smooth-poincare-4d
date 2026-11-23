# SP4-CME-E08 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E08_REQUEST_v1.md) and
[full derivation](../../notes/10_SCALAR_PINCHING_JET_20261122.md).

## Disposition

The proposed local scalar maximum inference fails on an actual
smooth definite connection. Both frozen pairings are verified,
\(\langle q,H\rangle=-\varepsilon^2\) and
\(\langle q,\mathscr L_Q H\rangle=4\varepsilon^2+8\varepsilon^4/3\).
With \(d=\det S_*=\sqrt{1-\varepsilon^2}\), the affine
connection \(A^0\) contributes the exact coordinate Hessian
\((d/2)q_*\,\delta_{ab}\) for \(Q\). The cubic term adds
\(L\delta_{ab}H\). The differentiated internal connection term
\([\operatorname{ad}(F^*_{ab}),Q_*]/2\) is skew in \(a,b\)
and does not enter the Laplacian. The first spatial jets of
\(F,Q,\widehat g\) vanish at \(p\).

Thus for \(w=|Q-I|^2\) the same polynomial connection gives
\[
 \nabla^2w(p)=2\varepsilon^2(d-L)g_{\rm eucl},\qquad
 dw(v)(p)=32\varepsilon^2
 \left[L(1+\tfrac23\varepsilon^2)-2d(1+\tfrac13\varepsilon^2)\right].
\]
The second expression evaluates the actual unadjusted initial
vector field and includes the fixed curvature reaction
\(-24d q_*\) in \(Q_t\). With \(L=3\), the Hessian is negative
definite and the flow derivative positive throughout
\(0<\varepsilon\le1/8\). At the exact rational sample
\(\varepsilon=1/16\), the Hessian coefficient is
\((d-3)/128<-1/64\) and the flow derivative is
\((1155-769d)/3072>193/1536\). Exact rational arithmetic
checked the pairings and derivative coefficients.

The smooth local definiteness and curvature sign hold on a
possibly parameter-dependent neighborhood. The symbolic family
also contains the E05 pinching threshold
\(\varepsilon=1/(8\sqrt2)\), with nearby points locally
pinched by the strict maximum. The result excludes a local
maximum-sign argument based on the scalar \(w\) and the
unadjusted equation alone. Global preservation on a closed
manifold, evolution of the chart data and singularity formation
remain unresolved. The E05 conditional integrated estimate
retains its premises.

## Input and output identities

All three frozen hashes matched when read. The full nonlinear
equation was checked against the E02A derivation.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E08_REQUEST_v1.md | `3b95f8495809c617f497a1b103be392fe28d81ddc901e85bb9812f11fc50811c` |
| B07_SCALAR_PINCHING_TEST_20261122.md | `3ffe074b1c76be3c2e4fa0d19bc21bf87411fd3635d7c435be3dbc6db29f6a72` |
| 04C_VOLUME_AND_JETS_20261122.md | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| 07_PINCHED_ENERGY_GAP_20261122.md | `107896b78624f02ccb83f1712139f294a4cee1f06f5e96d9e2775659effea753` |
| 04A_NONLINEAR_Q_20261122.md | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| 10_SCALAR_PINCHING_JET_20261122.md | `2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06` |
