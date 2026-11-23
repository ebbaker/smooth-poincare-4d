# E229 — Effective linear stationary coercivity below the sharp ratio

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B108. Helper launch configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored E202's block reduction and E219's independent certificate check. For this packet I reuse the frozen E219 arithmetic and independently check the coefficient floor and all constants in the lower bound. No E227 input is used.

## Result and quantifiers

Use the old \(K=1\) model with a real oriented Euclidean tangent space, the older cross-product bracket and normalized self-dual frame, Frobenius matrix norms, and \(F=-\sqrt{\lambda}\,D\Sigma\) in the round-compatible sign, where
\[
  D=\operatorname{diag}(1,u,v),\qquad Q=\lambda D^2,\qquad
  \lambda=\frac3{1+u^2+v^2},\qquad
  1\le u\le v\le\sqrt{7/2}.
\]
For **every** \(1\le r\le7/2\), **every** such spectrum with \(v^2\le r\), and **every** symmetric trace-free derivative array \(X\) in the actual zero-speed kernel at that spectrum, one has
\[
 \boxed{\quad R_Q(X)\ge k(7/2-r)|X|^2,\qquad
       k=\frac{3}{704\cdot27648^3\cdot880^2}
         =\frac1{3840678118509930086400}.\quad}
 \tag{1}
\]
Thus the assessed minimum kernel coercivity \(\kappa(r)\) is at least \(k(7/2-r)\) for each \(1\le r<7/2\). For \(r=7/2\), (1) gives only the zero lower bound. It is attained on the nontrivial radical at the one assessed endpoint spectrum. No positivity or estimate for nonstationary arrays is inferred from (1). [Sharp pointwise assessment](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) · [Strict-subregion application assessment](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md).

## Exact positive coefficient floor

Put \(\alpha=\sqrt{7/2}\), \(h=\alpha-1\), \(v=1+ha\) and \(u=1+hab\), with \(a,b\in[0,1]\). The square covers the closed ordered triangle. For \(v>1\), the inverse is \(a=(v-1)/h\), \(b=(u-1)/(v-1)\), and the collapsed \(a=0\) edge is the round point. Use the assessed \(3\times3\) scalar block \(M=2LG\), \(L=12(uv)^3(1+u)(1+v)(u+v)\). Write \(P_3=\det M\).

The owned script regenerates **only** the natural determinant array of bidegree \((37,23)\) on this square. It uses the frozen E219 entry-first substitution, Leibniz determinant and triangular inversion routines. Starting from the common entry scale, it removes the surplus power of two in the determinant to match the natural \(2^{37}\) scale, uses the canonical binomial denominator clearing, and expands every final coefficient back to the power basis as a check. The common positive denominator is
\[
                     D_{\rm B}=4311134142332645259085973815296000.
\]
With coefficients represented by \((A+B\sqrt{14})/D_{\rm B}\), the canonical compact-JSON SHA-256 of the nested integer numerator-pair array is
\[
 \texttt{9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978}.
\]
It matches the independently assessed E219 array with row \(a\) index then column \(b\) index. The counts are 911 positive, one zero at \((37,0)\), and no negatives.

For each positive coefficient the code compares the exact field element \((A-D_{\rm B})+B\sqrt{14}\) with zero. Signs for opposite nonzero rational parts use the squared magnitude comparison against \(14B^2\); no floating approximation enters. All **911** comparisons are nonnegative, hence
\[
                              \delta_0=1
\]
is a common positive rational lower bound for the positive coefficients. The first test succeeds, so no minimum search or dyadic refinement is performed. The array is regenerated in memory and the owned JSON records its canonical identity and the exact test outcome. [Canonical E219 array record](../reviews/E219_SHARP_STATIONARY_CERTIFICATE_AUDIT_20261123.md) · [Owned exact record](../numerics/e229_linear_spectral_coercivity.json).

## Determinant bound at a given spectral cap

The nonnegative tensor Bernstein basis sums to one on the square. The zero coefficient's basis function is \(a^{37}(1-b)^{23}\). Thus, with the coefficient floor above,
\[
       P_3\ge\delta_0\bigl(1-a^{37}(1-b)^{23}\bigr)
                  \ge\delta_0(1-a).
 \tag{2}
\]
In the second step \((1-b)^{23}\le1\) and \(a^{37}\le a\). Given \(v^2\le r\le7/2\), put \(\epsilon=7/2-r\). Then
\[
 1-a=\frac{\alpha-v}{\alpha-1}
 \ge\frac{\alpha-\sqrt r}{\alpha-1}
 =\frac{\epsilon}{(\alpha+\sqrt r)(\alpha-1)}
 \ge\frac{\epsilon}{2\alpha(\alpha-1)}
 \ge\frac{\epsilon}{4}.
\]
Indeed \(2\alpha(\alpha-1)=7-\sqrt{14}<4\), so the last inequality is strict for \(\epsilon>0\); it is valid with \(\epsilon=0\) as well. This proves \(P_3\ge\delta_0\epsilon/4\) without a separateness assumption on the eigenvalues. It uses the full square including the round edge.

On the closed triangle \(1\le u\le v\le\alpha<2\), the elementary positive factor bounds give
\[
          L\le12\cdot4^3\cdot3^2\cdot4=27648,\qquad
          \lambda=\frac3{1+u^2+v^2}\ge\frac38.
 \tag{3}
\]
The first inequality is deliberately coarse and the second uses \(u^2,v^2\le7/2\).

## Norm conversion and bound for the block eigenvalues

On the kernel write \(H=X-\operatorname{tr}(QX)I/3\), interpreted axis by axis and with \(H_{ij}\) a covector. The assessed edge reconstruction is
\[
 \begin{aligned}
 H_{ij}&=-J_iJ_jZ_{ij} && (i\ne j),\\
 H_{ii}&=\sum_{j\ne i}(d_j/d_i)Z_{ij},
       & Z_{ji}&=-Z_{ij},\qquad d=(1,u,v).
 \end{aligned}
\]
Here the \(J_i\) are the normalized quaternionic maps of the chosen self-dual frame. The reconstruction uses only positive \(d_i\) and is invertible in the kernel, also at coincidences of \(d_i\). Set \(|Z|^2=\sum_{i<j}|Z_{ij}|^2=\sum_{a=1}^4|Z_a|^2\), with \(Z_a\) the three scalar edge entries at axis \(a\). By Cauchy–Schwarz over each row's two off-diagonal entries,
\[
 \sum_i|H_{ii}|^2
   \le\sum_{i<j}2\bigl[(d_j/d_i)^2+(d_i/d_j)^2\bigr]|Z_{ij}|^2
   \le9|Z|^2.
\]
The last step uses ordering, so for \(i<j\) the two squared ratios are at most \(7/2\) and \(1\), respectively. The off-diagonal entries add \(2|Z|^2\) by the isometry of \(J_iJ_j\) and the two symmetric slots. The inverse \(X=H-\frac13\operatorname{tr}(H)I\) is the ordinary orthogonal trace-free projection in each axis, so
\[
                              |X|^2\le |H|^2\le11|Z|^2.
 \tag{4}
\]
This proof uses the full sharp triangle, rather than applying the smaller triangle's estimate with an outdated ratio bound. [E202 kernel reconstruction](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) · [Sharp block assessment](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md).

For clarity the full-form quadratic bound is checked on all trace-free derivative arrays. Write \(m=\lambda_{\min}(Q)\), \(M_*=\lambda_{\max}(Q)\), and \(\Xi=2[D^AS,S]+4S\operatorname{ad}(b)S\) slotwise, with the full E202 Bianchi mismatch \(b\). The Sylvester denominator gives \(|D^AS|\le|X|/(2\sqrt m)\). The Bianchi inverse has norm at most one from the symmetric operator identity \(\mathscr C^2=2I-\mathscr C\), and its source from \(S^{-1}D^AS\) costs at most \(\sqrt3\) by the three \(J_i\) isometries. Thus \(|b|\le\sqrt3|X|/(2m)\). Since \(|\operatorname{ad}(b_a)|_{\rm F}=\sqrt2|b_a|\),
\[
 |\Xi|\le4\sqrt{M_*}|D^AS|+4\sqrt2 M_*|b|
       \le2\left(\sqrt{M_*/m}+\sqrt6\,M_*/m\right)|X|.
\]
For the principal scalar term, the weighted trace-square identity gives
\(0\le\sum_a\langle X_a,\mathscr L_QX_a\rangle\le4M_*|X|^2\le12|X|^2\).
The skew contribution has absolute value at most \(2|q|\,|X|\,|\Xi|\), where \(|q|^2=\operatorname{tr}Q^2-3\le6\). With \(M_*/m\le7/2\) this gives
\[
       |R_Q(X)|\le(96+4\sqrt{21})|X|^2\le120|X|^2 .
\]
This is a uniform full-form operator bound: the self-adjoint map of the symmetric polarization has norm at most \(120\), by its quadratic Rayleigh bound. [Assessed full-form estimates](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) · [Derivation in E220](220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md).

Now take an arbitrary \(z\in\mathbb R^3\) as the \(Z_a\) on one axis, with zero edge entries on the other axes. The kernel parametrization gives an actual algebraic zero-speed \(X\). By \(R_Q(X)=4\lambda z^{\mathsf T}Gz\), (3) and (4),
\[
         |z^{\mathsf T}Gz|\le\frac{120\cdot11}{4\lambda}|z|^2
                               \le880|z|^2.
\]
Thus \(\lambda_{\max}(G)\le880\) throughout the closed triangle.

## Final lower bound

The assessed sharp certificate makes \(G\) positive semidefinite throughout the closed triangle. Its ordered eigenvalues \(\nu_1\le\nu_2\le\nu_3\) are all nonnegative and bounded above by \(880\). Therefore
\[
 \nu_1\ge\frac{\nu_1\nu_2\nu_3}{880^2}
            =\frac{\det G}{880^2}
            =\frac{P_3}{8L^3\,880^2}
            \ge\frac{\delta_0\epsilon}{32\cdot27648^3\cdot880^2}.
\]
This product estimate is valid at the semidefinite corner as well. On every kernel array,
\[
 R_Q(X)=4\lambda\sum_a Z_a^{\mathsf T}GZ_a
       \ge \frac{(3/2)\,\delta_0\epsilon}{32\cdot27648^3\cdot880^2}
                        \sum_a|Z_a|^2
       \ge \frac{3\delta_0}{704\cdot27648^3\cdot880^2}\,\epsilon |X|^2.
\]
This is (1) with the tested \(\delta_0=1\). The repeated spectra and round edge use the same algebra and closed-square estimates. The endpoint zero bound uses no coercivity assertion there. This packet does not estimate a best coefficient, compare degeneration orders from above, or apply the result to original-flow dissipation or convergence.

## Reproduction and verified identities

The script ran in Python 3.10.0 using the assessed local integer-pair routines and reproduced its small JSON byte for byte. No extra spectrum, sample, subdivision, elevation or optimization was used. From the investigation directory run

```sh
python3 -B numerics/e229_linear_spectral_coercivity.py > numerics/e229_linear_spectral_coercivity.json
```

| Artifact | SHA-256 |
| --- | --- |
| [E229 request](../research-progress/handoffs/SP4-CME-E229_REQUEST_v1.md) | 313d8a47b8acc218de7186274d0927dedde2f055b8a1675a42135894cdb3f15c |
| [B108](../brainstorm/notes/B108_LINEAR_SPECTRAL_MARGIN_20261123.md) | f17210f4e9d9e5d2c8839b2413794cab0d03309368ce5d872b99cc35de385c6f |
| [E218/E219 assessment](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E220/E222 assessment](../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E220 derivation](220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |
| [E218 corrected generator](../numerics/e218_stationary_spectral_range_v2.py) | da2fc957f844eecbd91a9366ee570b60eacd2352d0a92e3f289894a628516092 |
| [E218 canonical record](../numerics/e218_stationary_spectral_range.json) | 77dbb9396eda03efeeafa375eeaa11e7bba31a3773e0e9f80309df54b2c1cc55 |
| [E219 verifier](../numerics/e219_sharp_stationary_verify.py) | 446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae |
| [E202 derivation](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E219 audit, canonical array identity](../reviews/E219_SHARP_STATIONARY_CERTIFICATE_AUDIT_20261123.md) | b68e72bf1617d6c239a759c01ba1ca16e0400f001d3aa31246187a1a9dc8abbd |
| [E202 generator, transitive code](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E187 generator, transitive code](../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E229 script](../numerics/e229_linear_spectral_coercivity.py) | b7c82c99d8b9649faadf4e21fa5459881d7cca8db1d67af915166e17ac4d83f7 |
| [E229 exact record](../numerics/e229_linear_spectral_coercivity.json) | b639ede02a3ff497e88d7efbfb9e6e28fb48ff261e6247c8a218c1fadba24e8b |

The [E229 return](../research-progress/handoffs/SP4-CME-E229_RETURN_v1.md) records the note identity and the independent audit handoff.
