# GEO-E22 · Varying the shear on the fixed endpoint Berger sphere

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. The [bounded issue][issue] requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. Inputs were checkout `bc2c1bb`, the [E06 endpoint][germ], [E16][flux] and the [independent flux replay][replay]. The estimates are exact.

Keep the endpoint metric \(h=\theta_1^2+\theta_2^2+t^2\theta_3^2\), \(t=\sqrt{65}/4\), on the marked \(S^3\). The \(\theta_i\) are the unit round left-invariant coframe. Prescribe the second fundamental form \(B=\operatorname{diag}(b,-b,0)\) in the \(h\)-orthonormal frame, with \(b\in\mathbb R\) constant. This makes the slice minimal. The normal acceleration and the smooth ambient metric on either side are unrestricted. In a homotopy-four-sphere completion, the entering bound requires \(b^2>2145/8\). Index one and \(\operatorname{Ric}_g(\nu,\nu)>0\) along the slice require \(b^2<73/65\).

## Signed Weyl defect

Orient the collar by \(ds\wedge\theta_{123}\) and take \(B(X,Y)=g(\nabla_X\nu,Y)\) with \(\nu=\partial_s\), outward on the lower side. The lower boundary defect is \(D=12\pi^2\eta(h)+\mathcal T(h,B)\). The intrinsic term is \(-2401\pi^2/32\). The transgression at arbitrary \(b\) is \(4\pi^2b^2(t^2-4)=\pi^2b^2/4\), since \(\operatorname{curl}B=(t-4/t)B\) in this orientation. The upper side has defect \(-D\). [E16][flux] · [Independent transgression][replay]

Both sides of a spherical cut in a smooth homotopy four-sphere have vanishing relative signature. Consequently \(D\) and \(-D\) are the two chiral energy differences. Each closed chiral energy equals \(e\) and dominates \(|D|\). The condition \(e<8\pi^2\) therefore requires

\[
 -8<-\frac{2401}{32}+\frac{b^2}{4}<8,
 \qquad \frac{2145}{8}<b^2<\frac{2657}{8}.
\]

## Jacobi index bound

Identify \(S^3\) with the unit quaternions, with \(X_i(q)=q\mathbf i_i\) for \((\mathbf i_1,\mathbf i_2,\mathbf i_3)=(\mathbf i,\mathbf j,\mathbf k)\). The divergence Laplacian is \(\Delta_h=X_1^2+X_2^2+t^{-2}X_3^2\), since the Berger volume is a constant multiple of round volume and the unit-speed round flows of the \(X_i\) preserve it. For any real linear coordinate function \(f\), the curve \(q\exp(r\mathbf i_i)\) has second derivative \(-q\) at \(r=0\). Thus \(X_i^2f=-f\) and

\[
 -\Delta_h f=(2+t^{-2})f=\frac{146}{65}f.
\]

Take \(f\) nonzero. The nonzero eigenvalue makes \(f\) \(L^2(h)\)-orthogonal to constants. For each \(u\in\operatorname{span}\{1,f\}\), it follows that \(\int |\nabla u|^2\le(146/65)\int u^2\).

The Jacobi operator is \(J=-\Delta_h-2b^2-\operatorname{Ric}_g(\nu,\nu)\). Put \(m=\min_{S^3}\operatorname{Ric}_g(\nu,\nu)>0\) by continuity and compactness. The Jacobi Rayleigh quotient on the same two-dimensional subspace is bounded above by \(146/65-2b^2-m\). By min–max the second eigenvalue of \(J\), counted with multiplicity, is at most that number. Index one requires the second eigenvalue to be nonnegative, with zero allowed. Hence

\[
 2b^2+m\le\frac{146}{65},\qquad b^2<\frac{73}{65}.
\]

This uses only positivity of the normal Ricci curvature along the slice, which can vary with position. The thresholds are incompatible. In fact that index and Ricci condition force \(D<0\) and \(|D|>(2401/32-73/260)\pi^2\). Changing the shear and normal acceleration on this fixed marked Berger sphere therefore cannot produce an entering completion whose marked slice has index one and positive normal Ricci curvature. The estimate applies to arbitrary smooth interiors with the specified slice data.

[issue]: ../research-progress/handoffs/ISSUE_BERGER_SHEAR_20261127.md
[germ]: ../research-progress/handoffs/E06_GERM.md
[flux]: ../research-progress/handoffs/E16_BERGER_LEDGER.md
[replay]: BERGER_FLUX_REPLAY.md
