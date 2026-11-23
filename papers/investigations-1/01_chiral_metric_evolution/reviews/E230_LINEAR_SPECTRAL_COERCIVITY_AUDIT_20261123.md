# E230 — Independent audit of effective stationary coercivity

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E work under B108, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored E222 and E224, which audited the sharp-range applications and manuscript integration, and E228, which audited a separate upper witness. E228's calculation is unused here. E230 uses the assessed E202 scalar block and E218/E219 semidefiniteness as shared premises. I independently checked the new coefficient floor and determinant-to-coercivity chain in E229. [Request][request] · [E229 derivation][target]

## Disposition

Pass. In the fixed old \(K=1\), positively oriented real Riemannian model with round-compatible \(SO(3)\) curvature, the new common floor \(\delta_0=1\) holds for all 911 positive natural determinant Bernstein coefficients. For every \(1\le r\le7/2\), every ordered normalized spectrum \(Q=\lambda\operatorname{diag}(1,u^2,v^2)\) of ratio \(v^2\le r\), and every trace-free symmetric derivative array \(X\) in the actual trace-corrected zero-speed kernel,
\[
 R_Q(X)\ge k(7/2-r)|X|^2,\qquad k=\frac{1}{3840678118509930086400}.
\]
At the closed endpoint this is a semidefinite bound. This audit establishes a lower bound for the stationary restriction of the form.

## Independent exact coefficient check

I used the assessed polynomial \(M=2LG\) in edge order \(12,13,23\), where \(L=12(uv)^3(1+u)(1+v)(u+v)\). The 126-line verifier imports only the E202 scalar-block routine and its transitive definitions. It forms \(\det M\) by first-row cofactor expansion in the original \(u,v\) polynomial ring. This follows the determinant-first order of corrected E218, with a separate implementation. E229's entry-first specialization and triangular inversion routines are unused. The program checks its result against the existing record after all array calculations and coefficient tests. [Shared block][sharp] · [Corrected E218 route][gen218] · [E230 verifier][verify]

Put \(\alpha=\sqrt{7/2}\) and \(h=(\sqrt{14}-2)/2=\alpha-1\). Substituting \(u=1+hab,\ v=1+ha\) into a determinant monomial \(c_{mn}u^mv^n\) contributes \(c_{mn}\binom mi\binom njh^{i+j}\) to \(a^{i+j}b^i\). The code first sums the integer multiplicities for each power pair. It forms the numerator pairs of \((\sqrt{14}-2)^j\) by the recurrence \((A,B)\mapsto(14B-2A,A-2B)\), then uses the common denominator \(2^{37}\) for the square power polynomial. It checks nonzero support at the reported degrees \(37,23\). For \(n\) equal to the natural degree on each axis the conversion is the closed formula
\[
 x^j=\sum_{i=j}^n
   \frac{\binom{i}{j}}{\binom{n}{j}}\,
   \binom ni x^i(1-x)^{n-i}.
\]
Indeed \(\binom ni\binom ij=\binom nj\binom{n-j}{i-j}\) and the remaining binomial sum after factoring \(x^j\) is one. The independent conversion uses this identity on each axis, with one factor \(\operatorname{lcm}_{0\le j\le n}\binom nj\) per axis. There is no degree elevation or square subdivision. The numerator pairs are ordered by the \(a\) index then the \(b\) index, so the compact nested JSON digest is comparable to E219's canonical array.

For each of the \(38\cdot24\) pairs the verifier performs exact nonnegativity tests. For integers \(A,B\), the condition \(A+B\sqrt{14}\ge0\) is equivalent, when \(B<0\), to \(A\ge0\) and \(A^2\ge14B^2\). When \(B\ge0\), it is equivalent to \(A\ge0\) or \(A^2\le14B^2\). Zero requires \((A,B)=(0,0)\) by irrationality of \(\sqrt{14}\). For every nonzero pair the code applies the same comparison to \((A-D_{\rm B},B)\), checking that its coefficient \((A+B\sqrt{14})/D_{\rm B}\) is at least one. Both checks run for each nonzero pair and there is no minimum search.

| Determinant array check | Exact outcome |
| --- | --- |
| Natural bidegree | \((37,23)\) |
| Common positive denominator \(D_{\rm B}\) | \(4311134142332645259085973815296000\) |
| Canonical numerator-pair array SHA-256 | `9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978` |
| Positive, zero and negative counts | \(911,1,0\) |
| Sole zero index | \((37,0)\) |
| Positive coefficients at least one | \(911\) |

This output agrees with the existing E219 array identity and E229 floor record. The owned verifier ran with Python 3.10.0 using `python3 -B numerics/e230_linear_spectral_verify.py` from the investigation directory. It generates only the determinant array in memory and writes its short result to stdout. No other minors or spectral samples were computed. [E219 array identity][audit219] · [E229 record][record]

## Determinant and norm bounds

The square map covers \(1\le u\le v\le\alpha\). Away from the round point the inverse is \(a=(v-1)/h,\ b=(u-1)/(v-1)\), while the full edge \(a=0\) maps to the round point. The Bernstein basis is nonnegative there and partitions one. The sole zero coefficient has weight \(a^{37}(1-b)^{23}\), so \(P_3=\det M\ge \delta_0[1-a^{37}(1-b)^{23}]\ge\delta_0(1-a)\). For \(v^2\le r\), putting \(\varepsilon=\alpha^2-r\ge0\) gives
\[
 1-a=\frac{\alpha-v}{\alpha-1}
 \ge\frac{\varepsilon}{(\alpha+\sqrt r)(\alpha-1)}
 \ge\frac{\varepsilon}{2\alpha(\alpha-1)}
 \ge\frac{\varepsilon}{4}.
\]
The last comparison uses \(2\alpha(\alpha-1)=7-\sqrt{14}<4\). Also \(1\le u\le v\le\alpha<2\) yields \(0<L\le12\cdot4^3\cdot3^2\cdot4=27648\). The normalized eigenvalue floor is \(\lambda=3/(1+u^2+v^2)\ge3/8\).

The kernel is that of the actual velocity \(V_i=-4\sqrt\lambda\sum_jd_jJ_jH_{ij}\) using \(d=(1,u,v)\) and \(H=X-\operatorname{tr}(QX)I/3\) on each base slot. In the assessed edge reconstruction \(H_{ij}=-J_iJ_jZ_{ij}\) for \(i\ne j\) and \(H_{ii}=\sum_{j\ne i}(d_j/d_i)Z_{ij}\), with \(Z_{ji}=-Z_{ij}\). All divisions use positive \(d_i\). The inverse is ordinary trace-free projection because \(\operatorname{tr}Q=3\), and it reduces the Frobenius norm.

Rowwise Cauchy–Schwarz on the two diagonal summands gives
\[
 \sum_i|H_{ii}|^2
 \le\sum_{i<j}2\bigl[(d_j/d_i)^2+(d_i/d_j)^2\bigr]|Z_{ij}|^2
 \le9|Z|^2,\qquad |Z|^2=\sum_{i<j}|Z_{ij}|^2.
\]
The ordered spectrum implies squared ratio bounds \(7/2\) and \(1\) for the indicated terms. The off-diagonal part adds \(2|Z|^2\) by the two symmetric slots and the quaternion isometries. Thus \(|X|^2\le|H|^2\le11|Z|^2\), giving \(|Z|^2\ge |X|^2/11\) when passing from a lower edge-form bound back to \(X\). These estimates also give a bound from above for the norm of the single-axis kernel preimage of a specified edge vector.

## Full-form upper bound and smallest block eigenvalue

For any trace-free symmetric array \(X\), with \(m=\lambda_{\min}(Q)\) and \(M_*=\lambda_{\max}(Q)\), the Sylvester solve for \(S=Q^{1/2}\) divides each entry by the sum of two eigenvalues of \(S\). Thus \(|D^AS|\le |X|/(2\sqrt m)\). In the starred Bianchi relation the full mismatch \(b\) is obtained by inverting a symmetric operator satisfying \(\mathscr C^2+\mathscr C=2I\). Its eigenvalues \(1,-2\) give inverse norm at most one. The source \(-*(S^{-1}D^AS\wedge\Sigma)\) has norm at most \(\sqrt3|D^AS|/\sqrt m\), since each row uses three \(J_i\) isometries. Therefore \(|b|\le\sqrt3|X|/(2m)\). Using the factor \(\sqrt2\) in \(|\operatorname{ad}(b_a)|_{\rm F}=\sqrt2|b_a|\) gives
\[
 |\Xi|=|2[D^AS,S]+4S\operatorname{ad}(b)S|
 \le 2\left(\sqrt{M_*/m}+\sqrt6\,M_*/m\right)|X|.
\]
The principal quadratic part is \(4\operatorname{tr}(QX_a^2)-\tfrac43\operatorname{tr}(QX_a)^2\) in each slot. Weighted Cauchy–Schwarz and trace three make it nonnegative, and its sum is at most \(4M_*|X|^2\le12|X|^2\). The skew contraction has magnitude at most \(2|q||X||\Xi|\) by the product bound for Frobenius norm. Positivity and trace three give \(|q|^2\le6\). With \(M_*/m\le7/2\), these combine to \(|R_Q(X)|\le(96+4\sqrt{21})|X|^2\le120|X|^2\). The symmetric polarization therefore has operator norm at most \(120\) on the unrestricted derivative space. This is an upper bound on its absolute Rayleigh quotients, and the lower bound later uses the stationary restriction. [Assessed inherited estimates][applications]

Choose an arbitrary \(z\in\mathbb R^3\) in one base-axis slot \(Z_a\) with all other slots zero. The actual kernel parametrization supplies its preimage. Applying the full-form upper bound there yields
\[
 |z^{\mathsf T}Gz|
 \le \frac{120\cdot 11}{4\lambda}|z|^2\le880|z|^2.
\]
The factor is \(120\cdot11/(3/2)=880\). The assessed closed-range semidefiniteness of \(G\) and this bound put its eigenvalues \(\nu_1\le\nu_2\le\nu_3\) in \([0,880]\). Thus \(\det G=\nu_1\nu_2\nu_3\le880^2\nu_1\) even at the radical. As \(M=2LG\) in three dimensions, \(\det G=P_3/(8L^3)\), so
\[
 \nu_1\ge\frac{P_3}{8L^3\,880^2}
 \ge\frac{\delta_0\varepsilon}{32\cdot27648^3\cdot880^2}.
\]
On all kernel arrays \(R_Q(X)=4\lambda\sum_aZ_a^{\mathsf T}GZ_a\). Combining \(4\lambda\ge3/2\) and \(|Z|^2\ge |X|^2/11\) yields \(3\delta_0/(704\cdot27648^3\cdot880^2)\) times \(\varepsilon|X|^2\), with \(704=2\cdot32\cdot11\). At \(\delta_0=1\) this reduces exactly to the stated reciprocal. Consequently the minimum on unit stationary jets satisfies \(\kappa(r)\ge k(7/2-r)\) for each strict \(r\).

## Frame scope and endpoint

The proof uses matched positively oriented orthonormal frames, the old cross-product bracket, and the normalized self-dual triple \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}\). At a given point the polar chiral identification and surjectivity of the oriented tangent frame action onto the positive chiral \(SO(3)\) permit the ordered diagonal model. The derivative arrays, velocity relation, mismatch and contractions transform equivariantly. No derivative of the choice of eigenframe enters. The whole closed triangle is covered, including repeated spectra and \(r=1\). For any other fixed \(K>0\) in the old reconstruction, keeping the matching old orthonormal coefficients puts a factor \(K\) in \(F=-KS\Sigma\) and the velocity. It cancels in Bianchi and preserves the zero-speed kernel and the stationary model constant. [Stationary model assessment][sharp]

At \(r=7/2\) the lower bound is zero, and the assessed radical realizes equality on nonzero kernel arrays at \((u,v)=(1,\sqrt{7/2})\). The full-form upper bound controls the intermediate calculation, while kernel positivity gives the claimed lower bound only on the actual zero-speed kernel. This is a pointwise coefficient estimate with no claim of optimality, propagation, integrated dissipation or evolution existence.

## Verified identities

All eight frozen inputs in the request match. The array check adds the separate verifier identity and records the transitive scalar-block and canonical hash references. No new source access or shared edits entered.

| Input or output | SHA-256 |
| --- | --- |
| [E230 request][request] | 73ace8f00d6f1eead21bf7a7b7bb3e8e93ce99e2e32f36c2f98f6eee6df14e4f |
| [E229 derivation][target] | 64931775e41b7ec8d4954be80553ed68e7118611f866b2a951c4f6034d107471 |
| [E229 verifier][gen229] | b7c82c99d8b9649faadf4e21fa5459881d7cca8db1d67af915166e17ac4d83f7 |
| [E229 exact record][record] | b639ede02a3ff497e88d7efbfb9e6e28fb48ff261e6247c8a218c1fadba24e8b |
| [E229 return][ret229] | 33035bb8bae5749c17af570980692411e56255c2463d7f67c55d93c4d0a8c18a |
| [E218/E219 lead assessment][sharp] | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [Corrected E218 generator][gen218] | da2fc957f844eecbd91a9366ee570b60eacd2352d0a92e3f289894a628516092 |
| [E219 verifier][gen219] | 446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae |
| [E220/E222 lead assessment][applications] | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E219 audit and array identity][audit219] | b68e72bf1617d6c239a759c01ba1ca16e0400f001d3aa31246187a1a9dc8abbd |
| [E202 scalar-block code][block] | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E187 transitive code][transitive] | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E230 verifier][verify] | bb6a92b0c74033193e2235475ac10d809ac66dbd6ebb263adf0ca192f06ae244 |

[request]: ../research-progress/handoffs/SP4-CME-E230_REQUEST_v1.md
[target]: ../notes/229_LINEAR_SPECTRAL_COERCIVITY_20261123.md
[gen229]: ../numerics/e229_linear_spectral_coercivity.py
[record]: ../numerics/e229_linear_spectral_coercivity.json
[ret229]: ../research-progress/handoffs/SP4-CME-E229_RETURN_v1.md
[sharp]: E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md
[gen218]: ../numerics/e218_stationary_spectral_range_v2.py
[gen219]: ../numerics/e219_sharp_stationary_verify.py
[applications]: E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md
[audit219]: E219_SHARP_STATIONARY_CERTIFICATE_AUDIT_20261123.md
[block]: ../numerics/e202_general_stationary_pinching.py
[transitive]: ../numerics/e187_stationary_kernel.py
[verify]: ../numerics/e230_linear_spectral_verify.py
