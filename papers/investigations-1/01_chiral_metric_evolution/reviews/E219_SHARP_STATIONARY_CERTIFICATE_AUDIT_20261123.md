# E219 — Independent audit of the sharp stationary spectral certificate

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E work under B104. Helper launch configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored E202's previously assessed block reduction. E218 was authored independently by the other Sol helper. The audit reuses that E202 block and its quaternion matrices, and reconstructs the new polynomial certificate independently of E218's conversion routines.

## Disposition

**The pointwise theorem passes.** On \(1\le u\le v\le\sqrt{7/2}\) the form on the stationary velocity kernel is positive definite except at \((u,v)=(1,\sqrt{7/2})\), where it is positive semidefinite with the stated four-dimensional radical. The coefficientwise axial identity makes \(7/2\) sharp as a universal upper ratio for this pointwise nonnegativity. All continuum certificates and the four actual E199 endpoint radical conversions were independently verified. The frozen E218 verifier has a **located intermediate-data defect** in its endpoint specialization of two E199 basis coefficients. The defective coefficients cancel from the four reported radical combinations, so the reported vectors and theorem are correct. The exact replacement is given below. No frozen E218 artifact was edited. [E218 proof](../notes/218_STATIONARY_SPECTRAL_RANGE_TEST_20261123.md) · [Independent verifier](../numerics/e219_sharp_stationary_verify.py).

## Rank and block identities on the larger triangle

Use the E202 conventions at an oriented Euclidean point: older cross-product bracket, \(K=1\), \(F=-cD\Sigma\), \(D=\operatorname{diag}(1,u,v)\) and \(\lambda=c^2=3/(1+u^2+v^2)\). For every \(u,v>0\), the affine trace correction \(H=X-\operatorname{tr}(QX)I/3\) is an isomorphism from ordinary trace-free symmetric derivative matrices to weighted trace-free symmetric matrices \(\operatorname{tr}(D^2H)=0\), with inverse \(X=H-\operatorname{tr}(H)I/3\). Group the entries by covectors. For \(W_i=\sum_j d_j J_jH_{ij}\), the original velocity differs by the common nonzero factor \(-4c\). The quaternion identities and weighted trace give the four-dimensional onto left relation \(\sum_i d_iJ_i W_i=0\). For diagonal \(H\), its first two diagonal covectors are free under the weighted trace condition. Their image in \((W_1,W_2)\) is the block \((d_1J_1,d_2J_2)\) with nonzero determinant \(d_1^4d_2^4\). Thus the rank is eight for all positive \(u,v\). The equation \(J_iW_i=0\) recovers
\[
       H_{ii}=d_i^{-1}\sum_{j\ne i}d_j Z_{ij},\qquad
       Z_{ij}=J_iJ_jX_{ij}\quad(i\ne j),\qquad Z_{ji}=-Z_{ij}.
\]
The relation is completed by \(H_{ij}=-J_iJ_jZ_{ij}\) on the off-diagonal. It gives a twelve-dimensional basis with a direct inverse, including at repeated eigenvalues.

All divisions in the E202 Sylvester and Bianchi coefficient identities are by positive \(d_i\), \(d_i+d_j\), \(\lambda\), or fixed nonzero constants. In particular the complete \(\Xi\) and commutator calculation holds as a rational identity on \(u,v>0\). The four identical \(3\times3\) edge blocks \(G\) satisfy \(R=4\lambda\sum_a Z_a^{\mathsf T}GZ_a\) by this identity. The polynomial scale \(M=2LG\), \(L=12(uv)^3(1+u)(1+v)(u+v)>0\), preserves signs there. The smaller E202 Bernstein sign certificate and its uniform coercivity constant are not used beyond their stated range. This audit checks the identities that transfer, while the new certificate provides the sign on the larger triangle. [E202 derivation](../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) · [E204 independent block audit](E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) · [E202–E204 assessment](E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md).

## Independent square substitution and continuum certificate

Put \(\xi=\sqrt{14}>0\) and \(h=(\xi-2)/2>0\). The substitution \(v=1+ha,\ u=1+hab\) has \(1\le u\le v\le 1+h=\sqrt{7/2}\) for \(0\le a,b\le1\). For \(v>1\) the inverse is \(a=(v-1)/h,\ b=(u-1)/(v-1)\). For \(v=1\), necessarily \(u=1\), represented by all of \(a=0\). Thus the square parametrizes the entire closed triangle, with the only collapse on the round edge.

The independent script represents coefficients as integer pairs for \(r+s\xi\). It builds the powers of \(2+(\xi-2)ab\) and \(2+(\xi-2)a\) by sparse polynomial multiplication and substitutes into the block **entries** first, with one positive scale \(2^{14}\) for the whole substituted matrix. It then takes the \(1,2,3\) leading minors by the Leibniz determinant formula and reads the actual bidegrees. For the size \(j\) minor this computation initially uses scale \(2^{14j}\); exact division by the surplus power of two reduces to \(2^n\), where \(n\) is the actual \(a\)-degree. This checks the minor polynomials independently of E218's minor-first substitution and its scalar recurrence.

To recover Bernstein coefficients the independent verifier inverts the **power expansion**. In one variable, if \(p_r\) is the coefficient of \(x^r\) and \(c_i\) is the degree-\(n\) Bernstein coefficient, expansion of \(\binom ni x^i(1-x)^{n-i}\) gives
\[
 p_r=\binom nr\sum_{i=0}^r(-1)^{r-i}\binom ri c_i,\qquad
 c_r=\frac{p_r}{\binom nr}-\sum_{i=0}^{r-1}(-1)^{r-i}\binom ri c_i .
\]
The second formula is triangular. The script applies it successively in each axis using integer clearing of \(\operatorname{lcm}_r\binom nr\) and the corresponding \(b\)-factor. It then expands the computed coefficients back by the first formula on both axes and checks **every** power coefficient of all three independent minor polynomials. No E218 field, sign, substitution or conversion routine was used.

For the positive embedding, if the two nonzero rational components have the same sign, that is the sign of the coefficient. For opposite signs, rational squared comparison decides which magnitude dominates: \(r^2\) is compared with \(14s^2\), and the sign of the larger term is used. Equality of nonzero rational squared magnitudes is impossible since \(\sqrt{14}\) is irrational. Exact zero means both components are zero. This decides all 1,511 coefficients. The independently computed positive common denominators, natural bidegrees, signs and zero indices agree with the E218 record. The last column identifies the full arrays of numerator pairs, serialized by the independent script.

| Leading minor | Bidegree | Common denominator | Positive, zero, negative | Numerator-array SHA-256 |
| --- | --- | ---: | --- | --- |
| \(P_1=M_{00}\) | \((13,9)\) | 53137244160 | \(140,0,0\) | d9db83ae4ba8bbc4fad535fa95123ff9687bc92ece0ba941ac475f73bd6eeacf |
| \(P_2=\det M_{\{0,1\},\{0,1\}}\) | \((26,16)\) | 143870213580210044928000 | \(459,0,0\) | f591251425aa2c2573fd87b7f90f7eabedf778565bdb953f64f09531e65fca02 |
| \(P_3=\det M\) | \((37,23)\) | 4311134142332645259085973815296000 | \(911,1,0\) | 9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978 |

The only zero coefficient is \(P_3\)'s \((37,0)\). The tensor Bernstein basis is nonnegative and sums to one on the whole square. Hence \(P_1,P_2>0\) everywhere. At \((1,0)\) the zero coefficient is the only one with positive weight, so \(P_3=0\). At every other point its basis weight \(a^{37}(1-b)^{23}\) is less than one, so some positive coefficient contributes. This includes all other edges and the entire collapsed round edge \(a=0\). In fact \(M\) is constant on that edge and the direct block substitution there gives \(192\begin{psmallmatrix}4&1&-1\\1&4&1\\-1&1&4\end{psmallmatrix}\).

The first two positive leading minors give a positive \(2\times2\) leading block. Congruence eliminating the last column against that block leaves scalar Schur complement \(P_3/P_2\). Thus the scalar block has inertia \((3,0,0)\) except at the one corner, where its inertia is \((2,1,0)\) in positive, zero, negative order. Positive scaling and the four identical blocks on the actual velocity kernel give full inertia \((12,0,0)\) off the corner and \((8,4,0)\) there. The exact grid in E218 is a screen; the audit uses the polynomial expansion for the continuum proof. [E218 exact record](../numerics/e218_stationary_spectral_range.json).

## True endpoint radical and located verifier correction

Set \(t=\sqrt{7/2}=\xi/2\). Independent evaluation of the substituted block matches the recorded \(M(1,t)\) and gives \(M(1,t)k=0\) with \(k=(-t/2,1,-1)^{\mathsf T}\). By the Schur result the scalar kernel is exactly \(\mathbb R k\). Under the inverse of the edge parametrization, the full radical consists of
\[
       (Z_{12},Z_{13},Z_{23})=(-t\,W/2,W,-W),\qquad W\in T_p^*M .
\]
This includes all four covector directions because the \(Z\)-coordinates form an actual nonsingular kernel basis.

The audit reconstructed E199's sparse \(B_j\) from the displayed formulas at \(s=t^2=7/2\) and checked all twelve individual velocity residuals. It then combined the four actual vectors listed in E199 (8) and checked every edge and axis component under \(Z_{ij}=J_iJ_jX_{ij}\). Their nonzero components are as follows.

| E199 (8) vector | Axis (one based) | Extracted edge vector |
| --- | ---: | --- |
| \(B_{14}+B_{18}-tB_6/2\) | 2 | \(k\) |
| \(B_{13}-B_{19}-tB_7/2\) | 1 | \(-k\) |
| \((B_{10}-B_{11}+B_{17})/2\) | 3 | \(k/t\) |
| \((B_{16}-B_{15}+B_{12})/2\) | 4 | \(-k/t\) |

The table is correct. In frozen E218, however, the definitions of \(p,r\) at lines 236–237 of \(\texttt{check\_axial\_endpoint}\) do not evaluate the individual E199 \(B_j\) at \(s=7/2\). From E199 the correct values are
\[
       p=\frac{1+2s}{t(s+2)}=\frac{16}{11t},\qquad
       r=\frac{s-1}{t(s+2)}=\frac{5}{11t}.
\]
The code uses \(11/(12t)\) and \(-1/(12t)\). Both differ from the correct values by the same subtracted \(\Delta=71/(132t)\). Consequently its individual intermediate \(B_{10},B_{11}\) each differ from the true vector by \(-\Delta(e_3+e_9)\) in zero-based original coordinates, and \(B_{15},B_{16}\) each differ by \(-\Delta e_4+\Delta e_8\). The independent verifier finds nonzero velocity for each of those four altered individual vectors. The affected differences \(B_{10}-B_{11}\) and \(B_{16}-B_{15}\) cancel the common shift exactly in all coordinates, and the first two radical vectors contain none of the four altered basis members. The verifier checks that the true and historical four entire combinations agree. This localizes the defect to the claimed individual specialization, without changing any recorded radical answer or continuum coefficient.

The exact repair for future E218 versions is to replace the two coefficients with \(\texttt{Fraction(16, 11) * inv\_t}\) and \(\texttt{Fraction(5, 11) * inv\_t}\), respectively, and make the preceding comment identify the specialization of E199 at \(t^2=7/2\). The E219 verifier uses the actual formulas and leaves the frozen E218 evidence intact. [Frozen E218 code, lines 235–237](../numerics/e218_stationary_spectral_range.py) · [E199 basis and (8)](../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md).

## Axial identity and reproducibility

Independently specializing each E202 polynomial entry at \(u=1\) and multiplying by \(2k(v)=(-v,2,-2)^{\mathsf T}\) gives coefficients \((1344,2688,960,-768,-384)\) in degrees \(5,6,7,8,9\) of \(v\), with all other coefficients zero. They coincide with
\[
  (2k(v))^{\mathsf T}M(1,v)(2k(v))
     =192v^5(1+v)^2(7-2v^2)=8L(1,v)v^2(7-2v^2).
\]
The verifier checks every coefficient. Dividing by \(8L(1,v)>0\) gives \(k(v)^{\mathsf T}G(1,v)k(v)=v^2(7-2v^2)\), which is negative for \(v^2>7/2\). For any larger proposed bound \(r\), an axial choice \(7/2<v^2\le r\) therefore gives a negative direction, using one nonzero covector axis in the exact stationary kernel. This is sharpness for the pointwise derivative form only.

Run the [independent verifier](../numerics/e219_sharp_stationary_verify.py) from the investigation directory with Python 3.10.0 and \(\texttt{python3 -B numerics/e219\_sharp\_stationary\_verify.py}\). Its repeated output had SHA-256 3582d5de222e4618a4f2edb8b569fb9697bc2dc311835e510992b06a82437f2b. Separately ran the frozen E218 generator and compared its stdout to its own saved JSON. The replay was byte-identical. That replay is reproducibility evidence distinct from the independent certificate. No analytical application, critical-connection realization, larger-region search, source retrieval or shared edit entered.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E219 request](../research-progress/handoffs/SP4-CME-E219_REQUEST_v1.md) | 48f9cb908837d73fd9a68c19dbd794c76a4bfa703e4b7802a32733c37f3a97c2 |
| [B104](../brainstorm/notes/B104_STATIONARY_SPECTRAL_RANGE_20261123.md) | 939088ae96bea13fe0f78639b7d90696c62fa0dbfc3a43cc757d430fdc2e2215 |
| [E218 note](../notes/218_STATIONARY_SPECTRAL_RANGE_TEST_20261123.md) | 68525110f98c8fb66e1c68b472ae19d04bcc83726787336860eaedf999f81b83 |
| [E218 generator](../numerics/e218_stationary_spectral_range.py) | a42c5f57f846dfaa33e5f73c875e4eccf8d6ba969a7ab377d298bdc000f14f40 |
| [E218 record](../numerics/e218_stationary_spectral_range.json) | 77dbb9396eda03efeeafa375eeaa11e7bba31a3773e0e9f80309df54b2c1cc55 |
| [E218 return](../research-progress/handoffs/SP4-CME-E218_RETURN_v1.md) | 015788b1264338231d620ec48fa30d21be119d913bbb165fd4f5f28c3a43c710 |
| [E202 generator](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E202–E204 assessment](E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E204 audit](E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [E199 note](../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d |
| [E219 verifier](../numerics/e219_sharp_stationary_verify.py) | 446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae |

The [E219 return](../research-progress/handoffs/SP4-CME-E219_RETURN_v1.md) records the audit identity and scoped disposition.
