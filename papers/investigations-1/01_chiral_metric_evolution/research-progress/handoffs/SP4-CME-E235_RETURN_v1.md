# SP4-CME-E235 return v1 — All-ratio local scalar maximum family

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation, configured gpt-6.2-sol/ultra.
Selected-lead settings and independent runtime attestation are unavailable.
I authored the inherited E02C quotient-symbol input. E215 and E217
were separately authored. The proof checks the given B109 family.

## Disposition

**Complete proof for every finite \(r>1\).** At the specified simple
\(Q_r=\operatorname{diag}(2/(1+r),1,2r/(1+r))\), the Frobenius gradient is
\(G=(r+1)\operatorname{diag}(-2r-1,r-1,r+2)/(6r)\).
The given \(T\) is trace free, \(df[T]=0\), and
\(\mathscr L_QG=\operatorname{diag}(-4,0,4)\).
The required pairings are
\[
 df[\mathscr L_QT]=\frac{8(r-1)}{r+1},\qquad
 \langle G,\mathscr L_QG\rangle=\frac{2(r+1)^2}{r},\qquad
 df[q]=\frac{r^2-1}{2r}.
\]

The actual local polynomial connection has \(A(0)=0\),
\(F_A(0)=F^*\), the Euclidean old reconstructed center metric
and vanishing first curvature, metric and quotient derivatives.
The affine wedge contribution is \(-dI\delta_{ab}/2\), which becomes
\(dq\delta_{ab}/2\) after the quotient trace correction. The
specified cubic term adds \(U=B-dq/2\), leaving ordinary Hessian
\(B\delta_{ab}\). The differentiated internal connection adds
\([\operatorname{ad}(F^*_{ab}),Q_r]/2\) to the covariant Hessian.
Its metric trace and its pairing with \(G\) vanish.

Thus the scalar Hessian is \(-|G|^2g_{\rm e}\) with zero first
derivative. A sufficiently small closed ball has the positive
round-compatible class and simple spectrum, with ratio \(r\)
at the center and strictly below \(r\) off center. Its radius
and all coefficient sizes may depend on \(r\).

The actual derivative along \(A+\sigma V_{\rm old}(A)\) was
rederived from the old self-dual original velocity. The
spatial term is \(4\mathscr L_Q B\) and the differentiated
internal connection gives the full \(-24dq\) reaction. Pairing
with \(df\) gives
\[
 -\frac{8(r+1)^2}{r}
    +\frac{32(r-1)}{r+1}\mu(r)
    -\frac{24(r-1)}{\sqrt r}=1.
\]
The native internal pairing \(2\delta\), \(g=2\widehat g\)
and \(\tau=2t\) give native derivative \(1/2\). These are
directional derivatives of \(\log\rho\). Those of \(\rho\)
are \(r\) and \(r/2\).

The result concerns the local datum and its instantaneous
original direction. A flow solution, a closed datum and
global preservation consequences lie outside this packet.
Only the note and return were written.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E235 request](SP4-CME-E235_REQUEST_v1.md) | efd0d4f15c737cbbbc4a15b2c09a58e03966ed63f8d5ae2a0c1cee9b63be53b0 |
| [B109](../../brainstorm/notes/B109_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 64a38e686f1a56da4916fc534a51ded2d3c729cfab046a8afeb59dc84e56eaa4 |
| [E215/E217 assessment](../../reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md) | 26c877a82aa97c12fc85e95d58524301b2c1dbe2b58a1c8a3e6d5d2973679c4a |
| [E215 derivation](../../notes/215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 21812494994f845b5b20c05f52a1be3e630417ece04431b01dd255e76f9057e1 |
| [E217 audit](../../reviews/E217_SPECTRAL_RATIO_JET_AUDIT_20261123.md) | 3803d58e487706afce63bf4ae6062b8a3c5bef79c7ced3917da2b838e6e3721d |
| [E02C](../../notes/04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E235 proof](../../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md) | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
