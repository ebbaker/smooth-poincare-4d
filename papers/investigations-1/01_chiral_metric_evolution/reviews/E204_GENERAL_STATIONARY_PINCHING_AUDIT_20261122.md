# E204 Independent audit of general stationary pinching and the stationary application

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E audit under B98, with the axial
application under B97. Configured gpt-6.2-sol/ultra. Independent
runtime and selected-lead settings are unavailable. I authored the
inherited E07 jet calculation and the E189 and E201 independent
algebra audits. E202 and E203 were separately authored.

## Disposition

**Pass for E202 and the E203 application.** The full stationary
derivative form satisfies
\[
 R(X)\ \ge\ \frac{32768}{2205225}\sum_a|X_a|_{\rm F}^2
 \qquad (V(X)=0,\quad 1\le u\le v\le3/2).
\]
The actual velocity map has rank eight and its kernel dimension
is twelve throughout the closed triangle. Independent unstarred
Bianchi reconstruction and a bidegree certificate check the
whole Gram and every stored cleared matrix entry. Expanding the
1,740 positive Bernstein coefficients back into ordinary power
polynomials verifies their exact link to all twelve signed row
sums. The minimum coefficient is \(384\), and the quantitative
constant passes unchanged.

E202 discharges the algebraic premise \(H_{\rm ratio}\) of E203.
For a supplied smooth critical connection on the stated closed
base, the global pointwise ratio bound \(9/4\) gives perfection
and the reconstructed ASD Einstein metric of scalar \(12K\).
The independent axial calculation supplies the alternative
\(H_{\rm axial}\) sign at its exact closed interval, including both
semidefinite endpoints. E203 retains its historical conditional
wording and lead disposition remains separate.

## Weighted trace, velocity and quaternion edge coordinates

Use the older \([e_i,e_j]=\epsilon_{ijk}e_k\), oriented Euclidean
coframe, ordinary Frobenius products and
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV\). In the algebra take
\(K=1\), \(d=(1,u,v)\), \(D=\operatorname{diag}d\),
\(\lambda=c^2=3/(1+u^2+v^2)\), \(Q=\lambda D^2\) and
\(F=-cD\Sigma\). The checker uses wedge signs and Hodge
complement signs of the frozen E189 primitives, tests self-duality
and the \(\Sigma\) products, and tests every identity
\(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\) on the four covectors.

For each axis, \(H=X-\operatorname{tr}(QX)I/3\) is symmetric
with weighted trace \(\operatorname{tr}(D^2H)=0\), since
\(\operatorname{tr}Q=3\). Conversely
\(X=H-\operatorname{tr}(H)I/3\) is trace-free and
\(\operatorname{tr}(QX)=-\operatorname{tr}H\), so the forward
map returns \(H\). Thus the twenty-dimensional source space
is unchanged in these coordinates. Write matrix entries as
covectors in the axes. For \(W=-V/(4c)\),
\[
 W_i=\sum_j d_jJ_jH_{ij},\qquad
 \sum_i d_iJ_iW_i=0.
\]
The first identity is the actual corrected speed in E187. In
the second, the terms from \(i\ne j\) cancel due to symmetry
and the quaternion sign, and the remaining term is
\(-\sum_i d_i^2H_{ii}=0\). The relation map onto the four
covector components is surjective because \(J_1\) is invertible
and \(d_1=1\). For the reverse rank bound take diagonal \(H\)
with \(H_{11},H_{22}\) arbitrary and \(H_{33}\) fixed by the
weighted trace. The output in the first two rows is then
\((d_1J_1H_{11},d_2J_2H_{22})\), an invertible map on eight
components with determinant \((d_1d_2)^4>0\).

For \(i<j\), take arbitrary covectors \(Z_{ij}\) and extend
antisymmetrically. The formula
\[
 H_{ij}=-J_iJ_j Z_{ij}\quad(i\ne j),\qquad
 d_iH_{ii}=\sum_{j\ne i}d_j Z_{ij}
\]
is symmetric off-diagonal and has zero weighted trace because
the weighted sums of \(Z_{ij}\) cancel. The equations
\(J_iW_i=0\) then hold by construction. Conversely
\(Z_{ij}=J_iJ_j X_{ij}\), since \((J_iJ_j)^2=-I\)
for \(i\ne j\) and the trace shift affects only diagonal
entries. This gives the full kernel isomorphism. Both formulas
use strictly positive \(d_i\) and make no division by a
spectral difference. All repeated-eigenvalue cases are covered.

## Full Bianchi term and the scalar matrix

The differentiated square-root equation gives
\(Y_{ij}=X_{ij}/(d_i+d_j)\) and \(D^AS=Y/c\). The unstarred
equation for \(b\), obtained by differentiating \(F=-cD\Sigma\)
and using \(d_{\Gamma^+}\Sigma=0\), has \(i\)-th row
\[
 [b,\Sigma]_i
   =-\frac{1}{\lambda d_i}\sum_{a,j}(Y_a)_{ij}\,dx^a\wedge\Sigma_j .
\]
The constant wedge matrix is invertible. On starring, it is
\(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\), with
\(\mathscr C^2=2I-\mathscr C\), so its inverse is
\((\mathscr C+I)/2\). The separate checker inverts the unstarred
matrix and checks the full residual in the exterior basis.

In the edge coordinates set
\[
 h_i=d_iH_{ii},\qquad s_i=-X_{ii}/(2d_i^2)
                    +\sum_{j\ne i} Z_{ij}/[d_i(d_i+d_j)] .
\]
Here \(J_jH_{ij}=-J_iZ_{ij}\) for \(i\ne j\).
Thus the starred right-hand row is \(\lambda^{-1}J_i s_i\).
Since \(\epsilon_{ijk}J_kJ_j=-J_i\) for distinct indices, the
inverse gives \(\lambda b_i=J_i(2s_i-\sum_\ell s_\ell)/2\).
The two skew terms are
\(\Xi=2[Y,D]+4\lambda D\operatorname{ad}(b)D\).
Both enter the scalar.

The principal Frobenius term equals
\(4\lambda\sum_{i,j}d_i^2|H_{ij}|^2\), by expansion and the
weighted trace shift. The commutator term in \(R\) has pair
contribution \(2\lambda(d_i^2-d_j^2)\langle X_{ij},\Xi_{ij}\rangle\)
for \(i<j\). This follows from
\([X,\Xi]_{ii}=-2\sum_jX_{ij}\Xi_{ij}\) and skew symmetry.
The \(Y\) contribution to this pair, divided by \(4\lambda\),
is \(-(d_j-d_i)^2|Z_{ij}|^2\). Adding it to the principal
\((d_i^2+d_j^2)|Z_{ij}|^2\) gives \(2d_i d_j|Z_{ij}|^2\).
For the mismatch term,
\(X_{ij}=-\epsilon_{ijk}J_kZ_{ij}\) and
\(\epsilon_{kji}=-\epsilon_{ijk}\). Hence
\(\Xi^{(b)}_{ij}=-2\epsilon_{ijk}d_i d_j
J_k(2s_k-\sum_\ell s_\ell)\), giving the remaining term
\(-w_{ij}\langle Z_{ij},2s_k-\sum_\ell s_\ell\rangle\) in
\(R/(4\lambda)\), where \(w_{ij}=(d_j^2-d_i^2)d_i d_j\).
In particular the E202 sign in (3) checks for the older bracket
and ordinary skew matrix convention.

All the \(s_i,h_i\) are real-coefficient linear combinations
of the three edge covectors, so the form is a direct sum of
four identical real scalar blocks \(G\). In their edge order
\((12,13,23)\), the rows of \(h\) have matrix
\[
 A=\begin{pmatrix}u&v&0\\-1&0&v\\0&-1&-u\end{pmatrix}.
\]
Let \(L=12(uv)^3(1+u)(1+v)(u+v)\), put \(B_{ip}=L s_i(e_p)\),
and use the row indexed by \(k\) complementary to edge \(p\) to
form \(K_{pq}=w_p(2B_{kq}-\sum_\ell B_{\ell q})\). Bilinear
polarization gives
\[
 M=2LG=2L\big(A^TA+\operatorname{diag}_{i<j}(2d_i d_j)\big)-K-K^T .
\]
There is a full factor of two in this cleared matrix. The
checker calculates this block from the incidence matrix and
edge covectors separately from the full geometric Gram.

## Exact bidegree proof for the full Gram

The full test uses a basis vector multiplied by \(L\), and
superscript \(\#\) denotes this scaling. The factor \(L\)
has degree at most five in each of \(u,v\). Each component
of \(H^\#,X^\#\) is polynomial of degree at most six in
each variable. Indeed the only diagonal denominators before
clearing are the \(d_i\) and the constant \(3\); the
numerators add at most one power from another \(d_j\).
The \(Y^\#\) operation divides by \(d_i+d_j\), and solving
for \(\lambda b^\#\) divides by \(d_i\) once more and
applies the constant inverse. These are exact polynomial
divisions after clearing: each diagonal summand needs at
most three powers of a \(d_i\), while an off-diagonal
summand needs its pairwise sum factor. Numerical factors
are harmless in \(\mathbb Q[u,v]\). Neither operation raises
either degree bound. The commutator term \([Y^\#,D]\)
adds at most one degree in each variable. The other skew
term has \(d_i d_j\) for \(i\ne j\), which also adds at
most one degree in each variable. Thus \(\Xi^\#\) has
bidegree at most \((7,7)\).

The principal polarization of \(R(X^\#)/\lambda\) has
individual degrees at most \(2+6+6=14\). The correction
has at most \(2+6+7=15\). The matrix \(M\) independently
has degrees at most nine in each variable by the block
formula: the principal part has bound seven, and
\(L s_i\) has bound six while \(w_p\) has bound three.
The stored power coefficients also meet that bound. The
claimed scaled full form has matrix \(2L M\) on each axis
block. Therefore the difference between it and the full
reconstructed Gram has bidegree at most \((15,15)\).

The independent checker uses the tensor grid
\[
 u=1+i/60,\qquad v=5/4+j/60,\qquad 0\le i,j\le15.
\]
Every node lies in the closed triangle. It reconstructs
the twelve scaled basis vectors, checks the trace and
inverse edge identities, velocity, Sylvester and unstarred
Bianchi residuals, and skewness, then compares all 144
full polarizations, including zero inter-axis blocks,
with \(2L M\). It also checks the independent incidence
formula against every stored \(M\) coefficient by the same
grid. For a polynomial of bidegree \((15,15)\), vanishing
at sixteen nodes in \(u\) for each fixed node in \(v\)
forces its polynomial in \(u\) to vanish there identically.
Each coefficient then has sixteen roots in \(v\) and
vanishes identically. This proves the full matrix identity
on the whole triangle, including its boundaries. The six
sanity samples and frozen generator replay are separate
checks. [Independent verifier](../numerics/e204_general_pinching_verify.py).

## Inverse Bernstein check and coercivity

The square map uses \(v=1+a/2\), \(u=1+ab/2\).
For \(v>1\) its inverse is \(a=2(v-1)\),
\(b=(u-1)/(v-1)\), and \(v=1\) forces \(u=1\)
and is covered by \(a=0\). Thus the whole closed triangle
is included. For each row \(i\), I independently substitute
its four signed sums by expanding each \(u^p v^q\).
Its monomial contribution to \(a^{r+s}b^r\) is
\(\binom{p}{r}\binom{q}{s}/2^{r+s}\).
Then I expand the stored Bernstein table \(\beta_{I,J}\)
*back* into power form. The power coefficient of \(a^r b^s\)
is
\[
 \binom nr\binom ms
 \sum_{I\le r,\ J\le s}
 (-1)^{r-I+s-J}\binom rI\binom sJ\beta_{I,J}.
\]
This follows by expanding the \((1-a)^{n-I}\) and
\((1-b)^{m-J}\) factors. It independently checks the forward
conversion in E202. All inverse expansions match exactly.

The row degrees are \((14,9),(14,8),(14,9)\), giving
\(4(150+135+150)=1740\) coefficients. For signs
\((-,-),(-,+),(+,-),(+,+)\), the minima are
\((768,384,1152,768)\), \((384,768,768,1152)\) and
\((768,1152,384,768)\) for the respective rows. Their
common denominators are \(3099672576,3444080640,1549836288\),
each verified as a least common multiple of the reduced
denominators. The Bernstein functions sum to one and are
nonnegative on the closed square. Hence each signed row
sum is at least \(384\), and minimizing the four signs gives
\(M_{ii}-\sum_{j\ne i}|M_{ij}|\ge384\). The symmetric form
satisfies \(z^TMz\ge384|z|^2\) by
\(2|z_i z_j|\le z_i^2+z_j^2\).

Every factor of \(L\) is positive and increasing on the
tested positive square containing the triangle, so
\(L\le L(3/2,3/2)=164025/64\). Also
\(\lambda\ge3/[1+2(3/2)^2]=6/11\).
The ordinary trace projection decreases the squared Frobenius
norm of \(H\). The diagonal terms each satisfy
\(|H_{ii}|^2\le2(3/2)^2\sum_{j\ne i}|Z_{ij}|^2\),
whence their total is at most \(9\sum_{i<j}|Z_{ij}|^2\).
The off-diagonal terms contribute exactly twice that edge norm
because the \(J_iJ_j\) are isometries. Thus
\(\sum_a|X_a|_{\mathrm F}^2\le11\sum_{i<j}|Z_{ij}|^2\).
Combining the constants gives
\[
 4\frac6{11}\frac{384}{2(164025/64)}\frac1{11}
 =\frac{32768}{2205225}.
\]

I read the complete E202 generator. Sparse polynomial operations
combine equal bidegrees and remove zero coefficients. Each asserted
lexicographic long division subtracts the exact integral leading
monomial and strictly decreases the leading remainder. The
assertions require a nonnegative quotient exponent pair and zero
integer remainder at each step. The symbolic full Gram check has
the correct target \(4L M\) because it sums the two unpolarized
mixed pairings before dividing by two. The source's forward
Bernstein calculation restores the common \(2^N\) after binomial
conversion. The inverse check above is separate. Both checkers
ran under Python 3.10.0. The original generator streamed to the
frozen JSON digest and the six stored grid records match the
independent block. No numerical eigenvalue or new source entered.

## E203 independent-connection application

**Actual criticality.** The variation of the wedge trace volume
is \(\delta\mu=\frac23\langle d_A a\wedge F\rangle\).
It is exact by differential Bianchi and the invariant bracket
pairing. Closedness removes the integral of the constant shift
between \(|q|^2\) and \(\operatorname{tr}Q^2\).
Differentiating \(F_i\wedge F_j=Q_{ij}\mu\) and pairing with
\(2Q\) gives the \(4QF\) variation and a term
\(-\operatorname{tr}(Q^2)\delta\mu\). Substituting the volume
variation gives \( (4Q-\tfrac23\operatorname{tr}(Q^2)I)F=(2I+4H)F\)
with \(H=q-|q|^2I/6\) here denoting the velocity's zeroth-order
coefficient. This notation is distinct from the weighted
derivative \(H_a\) above. Self-duality of \(F\) and \(HF\) gives
the ordinary \(L^2\) expression and places the equation at the
current reconstructed metric. The \(2F\) term drops by Bianchi
and self-duality. Since arbitrary smooth independent connection
variations are allowed in the open definite class, criticality
gives \(V=-4d_A^{*\widehat g}(HF)=0\) with no gauge projection.

Using self-duality before differentiating gives
\(V=4*((D^AH)\wedge F)\). Here
\((D^AH)_a=X_a-\operatorname{tr}(QX_a)I/3\), since
\(X_a=(\nabla^AQ)_a\) has zero trace. In matched frames
\(V_i=-4Kc\sum_{a,j}d_j(H_a)_{ij}J_jdx^a\). Equivalently
\(V_i=-4Kc\sum_j d_j J_j H_{ij}\) in the derivative notation.
This is the actual kernel constraint with its full trace
correction and includes the live metric adjoint.

**Frames and normalization.** The curvature wedge Gram gives
\((F^\sharp)^*F^\sharp=2K^2Q\), so the polar map
\(-F^\sharp S^{-1}/(\sqrt2 K)\) is an isometry to the unit
self-dual fiber. The round-compatible sign makes it oriented
for the adopted chiral convention. An orthonormal eigenframe
of \(Q\) can be ordered and made positive by changing a sign.
The induced normalized oriented chiral frame is realized by a
positive tangent coframe. For a unit \(n\), the orthogonal
map \(\cos(\theta/2)I+\sin(\theta/2)J_n\) lies in \(SO(4)\)
by its continuous path from identity. Conjugation rotates the
chiral span about \(n\), with infinitesimal action
\(\tfrac12[J_n,J_i]=J_{n\times e_i}\). This proves surjectivity
onto the required \(SO(3)\) frame action. Ordered eigenvalues
give exactly \(d=(1,\sqrt{\lambda_2/\lambda_1},
\sqrt{\lambda_3/\lambda_1})\) in the triangle, and the axial
case can always place its repeated pair first. Eigenframe
regularity is immaterial because \(X_a,b_a,D^AS_a\) and
\(\Xi_a\) are tensor values.

For positive changes \(G,O\) in internal and base frames,
the corresponding matrices conjugate by \(G\) and the base
indices mix by \(O\). The bracket and Hodge operations commute
with these changes. The recovered \(b\) is the unique tensorial
Bianchi solution, and \(\mathscr L_Q\) and \(\Xi\) have the
same covariance. Trace cyclicity and orthogonality of the
base change show invariance of both full terms of \(R\).
The speed transforms as an \(E\)-valued covector and its
vanishing is invariant. No derivatives of eigenframes enter.

At fixed coefficients in \(\widehat g\), Bianchi contains
the common constant \(-K\) and cancels it before recovering
\(b\). The speed has a common factor \(K>0\). The derivative
form carries no further explicit \(K\) at those coefficients.
For the same connection changing the normalization from one
to \(K\) scales the reconstructed metric by \(K^{-1}\).
The Levi–Civita connection and the transported chiral
connection agree under the constant-scale positive form
identification. The orthonormal coefficients of \(X,b,\Xi\)
gain \(\sqrt K\), so both terms of \(R\) gain \(K\).
These facts verify the sign transfer without mixing the old
bracket with any other normalization.

**Integrated consequence.** The critical connection makes
the constant path solve the old original equation. The exact
E05 identity gives
\[
 0=-2\int_M R(X)\,\mu
     -48K\int_M \sqrt{\det Q}\,|Q-I|^2\,\mu .
\]
The divergence identity and integration by parts use
\(\mu=2K^2dV_{\widehat g}\) with spatially constant factor.
The reaction coefficient is strictly positive and the
measure is smooth positive. The ratio sign from E202 or the
axial sign from E199/E201 makes the first integral
nonnegative before its minus sign. Thus the reaction
integral vanishes and smoothness forces \(Q=I\) at all
points. This applies at the axial semidefinite endpoints.
With \(D^AS=0\), the compatibility inverse gives \(b=0\).
In the assessed chiral decomposition \(F_{\Gamma^+}=-K\Sigma\)
means the trace-free Ricci and \(W^+\) blocks vanish and
the scalar block is \(K\). This is the reconstructed ASD
Einstein metric with scalar \(12K\).

The audit concerns supplied smooth critical connections
with one of the two specified pointwise spectral hypotheses.
It gives no realization of abstract derivative arrays,
spectral confinement, flow preservation, initialization or
classification outside the stated stationary result.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E204 request](../research-progress/handoffs/SP4-CME-E204_REQUEST_v1.md) | 10812465f177b3e78a083e60813af3379f2f8aad93f358cdce671cb10717a4d0 |
| [B98](../brainstorm/notes/B98_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 8619615c9a35c9c58cb834b277ebb1141a1f33f439283857bc2b42cab7553867 |
| [E202 proof](../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E202 generator](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E202 certificates](../numerics/e202_general_stationary_pinching_results.json) | 2402caedf00f18274caecf494e4d8a44c520ea7aec4248cc9bc1dfb2ff85454e |
| [E202 return](../research-progress/handoffs/SP4-CME-E202_RETURN_v1.md) | d11f6517edeea09b177f2cffb41ce78e9832dc88615fe6272874b04ffb5b04a0 |
| [E203 proof](../notes/203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E203 return](../research-progress/handoffs/SP4-CME-E203_RETURN_v1.md) | 05a9597f790f87992de97d8d4c86a32b9a397f64ac89ce8f149e3471752e0c8f |
| [E201 audit](E201_AXIAL_STATIONARY_SIGN_AUDIT_20261122.md) | c87ef42cf1daede198aa460fba6f0aec034e428551315f9a8462ef6cd9a82a1a |
| [E199 proof](../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d |
| [E05 identity](../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E04–E07 assessment](E04_E07_ESTIMATES_ASSESSMENT_20261122.md) | 1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c |
| [E189 verifier](../numerics/e189_stationary_kernel_verify.py) | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |
| [Nested E01A normalization](E01A_AUDIT_20261122.md) | c111d9c9128dcc5139e660edcab6307cecf7693ecaa4800bdb12ea7ea4a6791f |
| [Nested E01 assessment](E01_FOUNDATION_ASSESSMENT_20261122.md) | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
