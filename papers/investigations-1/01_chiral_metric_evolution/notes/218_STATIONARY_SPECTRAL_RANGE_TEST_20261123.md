# E218 Sharp closed ratio for the pointwise stationary form

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E algebra, configured gpt-6.2-sol/ultra.
Independent runtime and selected-lead settings are unavailable. I
authored the inherited E204 general audit and the E189 and E201
pointwise algebra audits. E202 and E199 were separately authored.

## Result

On the full closed ordered triangle \(1\le u\le v\le \sqrt{7/2}\)
the assessed stationary derivative form \(R\) is nonnegative on its
twelve-dimensional zero-speed space. It is positive definite except
at the spectrum \(u=1,\ v=\sqrt{7/2}\), where its inertia is
\((8,4,0)\) in positive, zero, negative order. The radical there
consists of the four independent tangent covector directions with
the same scalar edge generator. For every larger candidate upper
ratio, there is an axial spectrum admitted by that bound and an exact
negative direction. Thus \(7/2\) is the sharp universal upper ratio
for pointwise nonnegativity of this stationary form.

## Frozen reduction and coordinates

Use the E202 old-bracket conventions at a positively oriented
Euclidean tangent point, \(K=1,\ F=-cD\Sigma\),
\(D=\operatorname{diag}(1,u,v)\),
\(\lambda=c^2=3/(1+u^2+v^2)\), and \(Q=\lambda D^2\).
The ratio is \(v^2\). The assessed E202 rank and block identities
apply as polynomial or rational identities for all \(u,v>0\).
The velocity rank argument and edge-coordinate inverse only
divide by positive \(d_i\). All Sylvester and Bianchi denominators
in the block calculation are nonzero here.

Write \(L=12(uv)^3(1+u)(1+v)(u+v)>0\) and let \(M=2LG\) be
E202's symmetric integer-polynomial block in edge order
\(12,13,23\). For the edge arrays \(Z\) of a trace-free \(X\) in
the actual stationary kernel, the identity is
\[
 R(X)=4\lambda\sum_{a=1}^4 Z_a^{\mathsf T}GZ_a .
\]
This includes both skew contributions of the stationary form.
The positive scalar \(2L\) and the direct sum reduce the sign
test to the \(3\times3\) polynomial \(M\).
[E202 derivation](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) ·
[E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md).

Use \(\xi=\sqrt{14}>0\), \(h=(\xi-2)/2>0\), and
\[
  v=1+ha,\qquad u=1+hab,\qquad (a,b)\in[0,1]^2.
\]
This is onto the triangle. It is one-to-one off the collapsed
side \(a=0\), which represents the round spectrum. Equality
at \((a,b)=(1,0)\) therefore selects a single ordered spectrum.

## Exact grid screen

Evaluate every principal minor at the 289 pairs
\((a,b)=(i/16,j/16)\), \(0\le i,j\le16\). There are 273
distinct spectra because only the 17 points on \(a=0\)
collapse. All six proper principal minors are strictly positive
at all 289 pairs. The determinant is strictly positive at 288
pairs and exactly zero at \((1,0)\). There are no negative
minors. This is the falsification screen.

Every scalar is represented as \(r+s\xi\) with rational
\(r,s\). Signs with a zero part or like-signed parts are
immediate. For opposite signs, the sign is
\(\operatorname{sgn}(r)\operatorname{sgn}(r^2-14s^2)\).
The squared comparison is exact after clearing denominators.
All zeros are exact field zeros.

## Continuum proof from the three leading minors

Let \(P_1=M_{00}\) and \(P_2=\det M_{\{0,1\},\{0,1\}}\) in
zero-based edge indices, and \(P_3=\det M\). Compute each
polynomial by expansion of the principal minor of the frozen
E202 block. For the square substitution, a term \(c_{mn}u^m
v^n\) contributes
\(c_{mn}\binom mi\binom nj h^{i+j}\) to the \(a^{i+j}b^i\)
power coefficient. If \(N=\max(m+n)\), multiplication by
\(2^N\) clears all denominators of the \(h\) powers. The code
builds integer pairs for \((\xi-2)^r\) by the recurrence
\((x,y)\mapsto(-2x+14y,x-2y)\), starting at \((1,0)\).
The pair stored for power \(a^r b^s\) includes the common
scale \(2^N\).

For a polynomial with power coefficients \(p_{rs}\) and
natural square bidegree \((N,B)\), the tensor Bernstein
coefficient at index \(I,J\) is
\[
 c_{IJ}=
 \sum_{r\le I,\,s\le J}
 p_{rs}\frac{\binom I r}{\binom N r}
        \frac{\binom J s}{\binom B s}.
\]
This follows by expanding each monomial using the
one-variable binomial identity
\(x^r=\sum_{i=r}^N\frac{\binom i r}{\binom N r}
\binom N i x^i(1-x)^{N-i}\).
The computation applies the conversion one axis at a time
by exact integer pairs, multiplying by the least common
multiple of the binomial denominators in each axis. Thus the
common denominator recorded for each coefficient array is
\(2^N\operatorname{lcm}_{r}\binom Nr
\operatorname{lcm}_{s}\binom Bs>0\). The sign of each pair
uses the same squared comparison as in the screen.
Direct evaluations at \((0,0),(1,0),(1,1),(2/3,1/5)\)
also agree exactly with the reconstructed Bernstein sums.
The continuum sign uses the coefficients.

| Polynomial | Natural bidegree | Positive | Zero | Negative | Zero index \((I,J)\) |
| --- | ---: | ---: | ---: | ---: | --- |
| \(P_1\) | \((13,9)\) | 140 | 0 | 0 | — |
| \(P_2\) | \((26,16)\) | 459 | 0 | 0 | — |
| \(P_3\) | \((37,23)\) | 911 | 1 | 0 | \((37,0)\) |

Each polynomial uses the full closed intervals \([0,1]\) in
both variables and one leaf, with no subdivision or degree
elevation. The nonnegative Bernstein basis sums to one.
The first two minors are strictly positive everywhere.
The determinant is zero at \((1,0)\) because only the
basis element at \((37,0)\) survives there. Away from
that corner the weight on that one element, \(a^{37}(1-b)^{23}\),
is strictly less than one, so at least one strictly positive
coefficient has positive weight. This gives strict determinant
positivity on the rest of the closed square, including all
other edges and the collapsed round edge.

The leading \(2\times2\) matrix \(A\) is positive definite by
\(P_1,P_2>0\). Eliminating its two mixed entries by congruence
gives \(A\) and the scalar Schur complement \(P_3/P_2\).
Consequently the scalar inertia is \((3,0,0)\) off the one
corner and \((2,1,0)\) at the corner. The four identical
summands of \(R\) give the claimed inertia and exclude any
further equality locus for nonzero \(X\).
[Generator](../numerics/e218_stationary_spectral_range.py) ·
[Exact sign record](../numerics/e218_stationary_spectral_range.json).

## Radical and sharpness

For \(t=\sqrt{7/2}\), the code checks \(M(1,t)k=0\) exactly
for \(k=(-t/2,1,-1)^{\mathsf T}\). The positive leading
block excludes a second scalar radical. The full form
vanishes at this spectrum exactly when
\((Z_{12},Z_{13},Z_{23})=(-tW/2,W,-W)\) for a covector
\(W\) in the four-dimensional tangent cotangent space.
The nonzero covector-axis components of the four E199 (8)
radicals in their listed order have the following
coordinates under the E202 extraction
\(Z_{ij}=J_iJ_j X_{ij}\), \(i<j\).

| E199 radical in order | Axis (one-based) | Edge vector |
| --- | ---: | --- |
| 1 | 2 | \(k\) |
| 2 | 1 | \(-k\) |
| 3 | 3 | \(k/t\) |
| 4 | 4 | \(-k/t\) |

The exact conversion uses the sparse E199 \(B_j\) formulas
at the specified root, with \(1/t=\xi/7\). In addition, direct
polynomial specialization at \(u=1\), with
\(k(v)=(-v/2,1,-1)^{\mathsf T}\), gives
\[
 (2k(v))^{\mathsf T} M(1,v)(2k(v))
   =8L(1,v)v^2(7-2v^2).
\]
The generator checks this identity coefficientwise. Hence
\(k(v)^{\mathsf T}G(1,v)k(v)=v^2(7-2v^2)<0\) for
\(v>\sqrt{7/2}\), in agreement with the assessed axial
classification. A single nonzero axis component of \(Z\)
gives a negative \(R\) at such a spectrum. This proves
sharpness for the pointwise stationary derivative form on the
velocity kernel.
[E199 formula (8)](199_AXIAL_STATIONARY_SIGN_REGION_20261122.md) ·
[Axial assessment](../reviews/E199_E201_AXIAL_STATIONARY_SIGN_ASSESSMENT_20261123.md).

## Reproduction and scope

The generator uses Python 3.10.0 standard-library integer and
rational arithmetic and the frozen E202 module. Run from the
investigation directory.

```sh
python3 -B numerics/e218_stationary_spectral_range.py
```

The JSON regenerated byte for byte. The packet establishes
the stated algebraic sign and equality sets. A theorem about
actual critical connections, a gradient inequality for nonzero
speed, and original-flow behavior are separate questions.

| Artifact | SHA-256 |
| --- | --- |
| [E218 request](../research-progress/handoffs/SP4-CME-E218_REQUEST_v1.md) | fcab9afee1ebf41e084f020c68f58d67354ade3e5be16801045d934b97eee639 |
| [B104](../brainstorm/notes/B104_STATIONARY_SPECTRAL_RANGE_20261123.md) | 939088ae96bea13fe0f78639b7d90696c62fa0dbfc3a43cc757d430fdc2e2215 |
| [E202 note](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E202 generator](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E204 audit](../reviews/E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [E202–E204 assessment](../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E199 note](199_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d |
| [E199/E201 assessment](../reviews/E199_E201_AXIAL_STATIONARY_SIGN_ASSESSMENT_20261123.md) | 522b79b77dd001811541c4efa75c217fbfd96fee0faf6d732ab1905ad9521843 |
| [E218 generator](../numerics/e218_stationary_spectral_range.py) | a42c5f57f846dfaa33e5f73c875e4eccf8d6ba969a7ab377d298bdc000f14f40 |
| [E218 exact record](../numerics/e218_stationary_spectral_range.json) | 77dbb9396eda03efeeafa375eeaa11e7bba31a3773e0e9f80309df54b2c1cc55 |
