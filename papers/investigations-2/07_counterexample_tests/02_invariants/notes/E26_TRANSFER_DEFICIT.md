# WIN-E26 · Transfer of the signed quartic deficit to the round metric

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Configured helper GPT-6.2 Sol / ultra, with actual
serving model and effort unavailable. Base checkout
`86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`. Inputs are the working-tree
[comparison request, revision 1](../research-progress/handoffs/REQUEST_B08_COMPARISONS_R1.md),
[fixed metric, revision 1](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md),
and [Clifford jet and residue identity](BALANCED_SPECTRAL_BOUND.md).
This is a working bound for smooth pencils on the fixed oriented Riemannian
sphere, for independent replay.

Take the fixed compact metric \(g\), auxiliary metric \(\gamma\), and unit
round domain and target metrics from B08. Write \(q\) for the round domain
metric, \(t=a^6=2^{-1536}\), and \(d\nu=dV_q/V_0\) for the round probability
measure, where \(V_0=8\pi^2/3\). Let \(f\) be the smooth kernel map of an
admissible generating positive half-spinor pencil and let \(R\) be the
critical residue. If \(\sqrt R\le t^2\), then

\[
  \int |df|_q^4\,d\nu
  \le 16+20400t^2+24480\sqrt R
  \le 16+25000(t^2+\sqrt R).
\]

Here \(|df|_q\) is the real Hilbert–Schmidt norm with the round target metric.
The calculation uses no centering estimate. The imposed centering of \(f\)
continues to use \(dV_g\).

## Comparison of orthonormal frames

Put \(G=q^{-1}\gamma\) and \(B=G^{1/2}\), the positive self-adjoint square
root on the \(q\)-tangent space. By the fixed metric bound all eigenvalues
of \(G\) belong to \([1-t,1+t]\). In any oriented \(q\)-orthonormal
frame, applying \(B^{-1}\) to its basis gives an oriented
\(\gamma\)-orthonormal frame. With the same oriented orthonormal target
frame, let \(A\) be the matrix of \(df\) in the \(q\)-frame and
\(A_\gamma\) its matrix in the \(\gamma\)-frame. Then
\[
 A_\gamma=AB^{-1},\qquad
 \|B-I\|_{\mathrm{op}}\le
 \frac{t}{1+\sqrt{1-t}}\le t,\qquad
 \|B\|_{\mathrm{op}}\le\sqrt{1+t},\qquad
 dV_\gamma=(\det B)dV_q\ge(1-t)^2 dV_q.
\]

Use the orthogonal split \(A_\gamma=S+N\) of the positive-chirality
jet. The Clifford part \(S\) is a real similarity or zero. All its
nonzero values have the common orientation sign \(\sigma\) of the
Clifford model in the oriented frames. The residue part satisfies
\(\|N\|_{L^4(dV_\gamma)}=2R^{1/4}\). This uses the same pencil inner
product after conformal transport from \(g\) to \(\gamma\).
In round frames we thus have
\[
 A=S+E,\qquad E=S(B-I)+NB,\qquad
 |S|\le |A_\gamma|\le(1-t)^{-1/2}|A|.
\]
Writing \(X=\|A\|_{L^4(d\nu)}^2\), the triangle inequality followed
by \((u+v)^2\le2(u^2+v^2)\) gives
\[
 \begin{aligned}
 \|E\|_{L^4(d\nu)}^2
 &\le 2t^2\|S\|_{L^4(d\nu)}^2
       +2(1+t)\|N\|_{L^4(d\nu)}^2\\
 &\le \frac{2t^2}{1-t}X
       +\frac{8(1+t)}{(1-t)\sqrt{V_0}}\sqrt R\\
 &\le 4t^2X+24\sqrt R .
 \end{aligned}
\]
For the second step, the density comparison gives
\(\|N\|_{L^4(d\nu)}^2\le
[(1-t)\sqrt{V_0}]^{-1}\|N\|_{L^4(dV_\gamma)}^2\).
The last step uses \(t\le1/2\) and \(\sqrt{V_0}>1\).

## Taylor remainder and degree sign

For a real four-by-four matrix \(C\), set
\(F_\sigma(C)=|C|^4-16\sigma\det C\). The singular values imply
\(|C|^4\ge16|\det C|\) and hence \(F_\sigma(C)\ge0\) for either sign.
If \(S=\lambda U\) with \(\lambda>0\) and \(\det U=\sigma\), then
\(\det S=\sigma\lambda^4\), \(|S|^2=4\lambda^2\), and the matrix of
cofactors is \(\sigma\lambda^2S\). Thus the two terms of \(F_\sigma\)
cancel at \(S\), and the derivative in direction \(E\) is
\[
 4|S|^2\langle S,E\rangle
 -16\sigma\langle \sigma\lambda^2 S,E\rangle=0.
\]
The same value and derivative vanish at \(S=0\) by homogeneity.
The cancellation requires the multiplier of the determinant to agree
with the sign of the model similarity.

At any \(C\),
\[
 |D^2(|C|^4)[E,E]|\le12|C|^2|E|^2,qquad
 |D^2(\det C)[E,E]|\le12|C|^2|E|^2 .
\]
The second estimate uses the twelve ordered replacements of two
distinct columns by columns of \(E\), each bounded by the product of
the four column lengths. Along \(C=S+uE=(1-u)S+uA\), \(0\le u\le1\),
convexity of the norm gives \(|C|^2\le(1-t)^{-1}|A|^2\). Taylor's
integral remainder with weight \(1-u\) gives
\[
 0\le F_\sigma(A)\le \frac{102}{1-t}|A|^2|E|^2
 \le 204 |A|^2|E|^2.
\]
Consequently Cauchy–Schwarz in \(d\nu\) yields
\[
 \int F_\sigma(A)\,d\nu\le
 816t^2 X^2+4896\sqrt R\,X.
\]

In the chosen target orientation \(\int \det A\,d\nu=\deg f\).
By the [kernel bundle calculation](E13_SPINOR_PENCIL.md), \(|\deg f|=1\),
with sign \(-1\) in the projective chart orientation used there. First
use only \(\sigma\deg f\le1\) in the last estimate to obtain
\[
 X^2\le16+816t^2 X^2+4896\sqrt R\, X .
\]
Since \(t\le10^{-3}\) and \(\sqrt R\le t^2\), this implies
\(0.99X^2\le16+0.01 X\). If \(X\ge5\), then
\(0.99X^2-0.01 X\ge0.988 X^2\ge24.7\), a contradiction. Substituting
\(X<5\) proves the stated energy bound. It also gives
\(\int F_\sigma(A)\,d\nu\le20400t^2+24480\sqrt R<16\).
Opposite signs would give \(\int F_\sigma(A)\,d\nu=X^2+16\).
Therefore \(\sigma=\deg f\), and the integrated signed defect here
is exactly \(X^2-16\). Reversing the target orientation changes both
signs and leaves the defect unchanged.
