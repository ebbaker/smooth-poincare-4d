# E225 Independent audit of the sharp-endpoint mixed witness

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, configured gpt-6.2-sol/ultra.
Actual selected-lead settings and independent runtime attestation
are unavailable. I authored E218 and E220, as well as the local
jet input E02C. E223 was separately authored. The assessed E218/E219
record supersedes the two historical intermediate E199 basis
coefficients in E218 v1. This audit uses its accepted edge
radicals directly and independently reconstructs the new mixed
entries of E223.

## Disposition

**Pass.** The full pointwise form at \(Q_0=\operatorname{diag}
(6/11,6/11,21/11)\) has a nonzero mixed pairing between an
assessed stationary radical and a standard full-space jet.
The actual unscaled old velocity and its squared norm, the
full skew term, the local realization, and all eighty exact
mixed pairings agree with E223. The pointwise speed-only lower
bound fails at this one spectrum. No repair is needed.

## Independent reconstruction in unstarred form coordinates

Work in the older \(K=1\) conventions of E223 at a positively
oriented Euclidean tangent point with oriented bracket
\([e_i,e_j]=\epsilon_{ijk}e_k\). Write \(e^a=dx^a\),
\(\Sigma=(e^{14}+e^{23},e^{24}+e^{31},e^{34}+e^{12})\),
\(J_i\alpha=*(\alpha\wedge\Sigma_i)\),
\(t=\sqrt{14}/2\), \(d=(1,1,t)\), \(D=\operatorname{diag}d\),
\(\lambda=6/11\), \(c^2=\lambda\), \(S=cD\), and
\(F=-S\Sigma\). The trace-free symmetric tensor \(X\)
uses five ordinary matrix coordinates
\((X_{11},X_{22},X_{12},X_{13},X_{23})\) per base axis,
with \(X_{33}=-X_{11}-X_{22}\). These determine the twenty
zero-based coordinate vectors \(E_j\).

Independently expand the exterior product with each
\(\Sigma_j\) from the displayed two-form pairs. The starred
product gives \(J_j\), with both signs taken from the oriented
permutations. At any input \(X\), put \(T_a=\operatorname{tr}(Q_0X_a)\)
and \(U_{a,ij}=X_{a,ij}/(d_i+d_j)\), so that
\(D^A_aS=U_a/c\). In grouped covector notation the actual
velocity and the unstarred Bianchi equations are
\[
 \begin{aligned}
 \frac{V_i(X)}{c}
    &=-4\sum_{a,j}d_j\big(X_{a,ij}-\tfrac13T_a\delta_{ij}\big)
                              J_je^a,\\
 \sum_j U_{ij}\wedge\Sigma_j
    &+\lambda d_i\sum_{k,j}\epsilon_{kji}b_k\wedge\Sigma_j=0.
 \end{aligned}
 \tag{1}
\]
The first line is the original velocity from the trace-corrected
derivative and self-dual Bianchi formula, with \(c\) explicitly
restored to take the physical norm. The second line follows
by multiplying \(d_A(S\Sigma)=0\) by \(c\), using
\(d_A\Sigma=[b\wedge\Sigma]\) in the adapted identification.

For the independent check, the Bianchi operator of the second
line after moving its source and dividing row \(i\) by
\(\lambda d_i\) was assembled by exterior products alone.
In the row order internal \(i\) then sorted triples \(123,124,134,234\),
and column order internal \(k\) then covector axis \(a\),
the integer entry in row \((i,I)\), column \((k,a)\) is
\(\sum_j\epsilon_{kji}[e^a\wedge\Sigma_j]_I\).
Rational elimination with first available pivot gives pivots
\((-1,-1,-1,-1,1,1,1,1,-2,2,-2,2)\) and six row swaps.
This has determinant \(16\). Solving over
\(\mathbb Q(\sqrt{14})\) and multiplying back checks the full
unstarred residual for every tensor tested. The independent
calculation uses neither the frozen starred Bianchi inverse
nor any matrix data from E223 to find \(b\).

For each tensor use the two skew summands
\[
 (\Xi_{\rm S})_{a,ij}=2(d_j-d_i)U_{a,ij},\qquad
 (\Xi_b)_{a,ij}=4\lambda d_i d_j
                    \sum_k\epsilon_{kji}(b_k)_a.
\]
Define the symmetric principal polarization and the one-order
skew contraction by
\[
 \begin{aligned}
 P(X,Y)&=2\sum_{a,i,j}(q_i^++q_j^+)X_{a,ij}Y_{a,ij}
       -\tfrac43\sum_a\operatorname{tr}(Q_0X_a)
                         \operatorname{tr}(Q_0Y_a),\\
 C(X,Z)&=2\sum_{a,i<j}(q_j^+-q_i^+)X_{a,ij}Z_{a,ij},
              \qquad q_i^+=(Q_0)_{ii}.
 \end{aligned}
\]
For skew \(Z\), the second identity is precisely
\(\sum_a\langle Q_0-I,[X_a,Z_a]\rangle\), by examining
the two diagonal contributions of each internal pair.
Thus the independent pairing was
\[
 B(X,Y)=P(X,Y)-\tfrac12\big(
 C(X,\Xi_{\rm S}(Y))+C(X,\Xi_b(Y))+
 C(Y,\Xi_{\rm S}(X))+C(Y,\Xi_b(X))\big).
 \tag{2}
\]
This computes in the full twenty-dimensional domain. The
principal matrix is symmetric for the Frobenius pairing,
and this formula includes both skew terms in both orders.
The coordinate basis itself can be nonorthonormal.

I reconstructed each \(N_a\) by the assessed weighted-trace
inverse on \(Z=(-t/2,1,-1)e^a\), with
\(X_{ij}=-J_iJ_j Z_{ij}\) off the diagonal and the diagonal
\(X_{ii}=d_i^{-1}\sum_{j\ne i}d_j Z_{ij}\) at this radical.
The latter already has ordinary trace zero. This yields
the exact original-coordinate vectors in E223, with all
four velocities and quadratic values zero. Direct calculation
using (1)–(2), under Python 3.10.0 with rational pairs
and no imported E-series code, matched all 400 entries of
the E223 full symmetric coordinate Gram, all 240 entries of
the twenty \(V/c\) columns, and all eighty mixed entries.
Each mixed entry also agrees with contraction of that full
matrix against the original coordinates of the independently
reconstructed radical. There are five nonzero entries per
axis. Writing \(\xi=\sqrt{14}\), the nonzero entries are
recorded below in column-value order.

| Radical | \((j,B(N_a,E_j))\) |
| --- | --- |
| \(N_1\) | \((0,-9\xi/11),(1,9\xi/11),(7,-18\xi/11),(13,-63/11),(19,63/11)\) |
| \(N_2\) | \((2,18\xi/11),(5,-9\xi/11),(6,9\xi/11),(14,63/11),(18,63/11)\) |
| \(N_3\) | \((3,63/11),(9,-63/11),(10,-9\xi/11),(11,9\xi/11),(17,-18\xi/11)\) |
| \(N_4\) | \((4,-63/11),(8,-63/11),(12,18\xi/11),(15,-9\xi/11),(16,9\xi/11)\) |

The E223 script checks its full basis matrix by direct quadratic
polarization and by the two ordered evaluations. Its eighty
entries use this matrix and both polarizations on standard
coordinate vectors, irrespective of their velocities. The
stationary restriction alone gives only the choice of radicals.
A separate frozen-script replay reproduced the JSON byte for byte.
[E223 generator](../numerics/e223_endpoint_speed_absorption.py) ·
[Exact record](../numerics/e223_endpoint_speed_absorption.json) ·
[Radical assessment](E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md).

## Direct witness and exact scope of failure

Take \(Y=E_0\), with \(Y_1=\operatorname{diag}(1,0,-1)\),
and \(N=N_1\). The coframe gives
\(J_1e^1=e^4,\ J_2e^1=-e^3,\ J_3e^1=e^2\).
The radical has diagonal \(t/2,-t/2,0\) in axis one
and off-diagonal covectors
\((tJ_3e^1/2,J_2e^1,J_1e^1)\) in edge order.
Thus \(N=(t/2)E_0-(t/2)E_1+(t/2)E_7-E_{13}+E_{19}\).
Here \(T_a=0\), so the trace-corrected tensor is \(N\) itself.
Substitution in (1) gives \(V(N)=0\).
For \(Y\), the corrected diagonal is \((16,5,-6)/11\)
in axis one, since \(T_1=-15/11\). Equation (1) gives
\[
 \frac{V(Y)}{c}=\frac1{11}(-64e^4,\ 20e^3,\ 24t e^2),
 \qquad
 |V(Y)|^2=\frac{6}{11}\frac{64^2+20^2+(24t)^2}{11^2}
            =\frac{3552}{121}.
\]
The unscaled norm here uses the old internal pairing and
one Euclidean covector slot. Since \(Y\) commutes with \(Q_0\),
the skew contraction in its quadratic value is zero. Formula
(2) on the diagonal gives
\(R(Y)=4(27/11)-\tfrac43(15/11)^2=888/121\).

A hand calculation of the mixed sign follows directly from
the unstarred equations. For \(Y\), let \(b_1=x e^4\),
\(b_2=-y e^3\), \(b_3=z e^2\). The three internal components
of \([b\wedge\Sigma]\) are
\(-(y+z)e^{123}, -(x+z)e^{124}, -(x+y)e^{134}\).
The \(U\)-source components are \(e^{123}/2,0,-e^{134}/(2t)\).
Therefore
\[
 y+z=\frac1{2\lambda},\quad x+z=0,\quad
 x+y=-\frac1{2\lambda t^2},\qquad
 (x,y,z)=(-33/56,\ 55/168,\ 33/56).
\]
The invertibility check above makes this the full solution.
The Sylvester skew summand vanishes for diagonal \(Y\).
The Bianchi summand gives
\((\Xi_b(Y))_{13}=t(1-t^{-2})J_2e^1\) and
\((\Xi_b(Y))_{23}=t(1+t^{-2})J_1e^1\).
The \(12\) component is present in the map and has zero
contraction weight because \(q_1^+=q_2^+\).
It follows that \(C(N,\Xi_b(Y))=2(15/11)(2t)=60t/11\).
Also \(C(Y,\Xi_{\rm S}(N))=C(Y,\Xi_b(N))=0\) since \(Y\)
has no off-diagonal entries. The principal cross term is
\(P(N,Y)=4(6/11)(t/2)=12t/11\) since \(\operatorname{tr}(Q_0N_a)=0\).
Thus \(B(N,Y)=12t/11-30t/11=-18t/11=-9\xi/11\).

The verified \(R(N)=0\) and the linearity of \(V\) yield
\[
 R(Y+\sigma N)=\frac{888}{121}-\frac{18\xi}{11}\sigma,
 \qquad
 V(Y+\sigma N)=V(Y).
\]
The positive \(Q_0\) remains fixed. Each finite jet has
Frobenius square \(2+t\sigma+\tfrac{15}{2}\sigma^2\).
The form has no finite pointwise lower bound depending only
on this \(Q_0\) and this fixed velocity. In particular
\(R\ge -C(Q_0)|V|^2\) fails on the full derivative space,
as does the stronger absorption bound
\(R\ge\kappa |X|^2-C(Q_0)|V|^2\) for \(\kappa\ge0\).
Each homogeneous bound would also fail on
any positive-radius jet ball around zero, by rescaling each
finite member of the witness family. The fixed-speed
unboundedness uses the unrescaled family.
[E223 witness](../notes/223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md).

## Realization and covariance

In an oriented Euclidean chart with trivial oriented internal
bundle, prescribe \(F_i^*=-s_i\Sigma_i\) with
\(s_i=\sqrt{(Q_0)_{ii}}\). Let
\[
 A^0=\tfrac12\sum_a x^a\iota_{\partial_a}F^*,\qquad
 U_i^a=-\sum_j(X_a)_{ij}J_je^a/s_j,\qquad
 A=A^0+\tfrac12\sum_a (x^a)^2 U^a .
\]
These \(U^a\) are constant connection-coefficient one-forms,
distinct from the Sylvester derivative above.
Since \(dA^0=F^*\) and \(A(0)=0\), the bracket term is
\(O(|x|^2)\). Thus \(F_A(0)=F^*\) and
\(\partial_aF_A(0)=e^a\wedge U^a\).
The curvature planes and old curvature density
\(2dV_{\rm eucl}\) in these \(K=1\) coordinates give the
Euclidean reconstructed old metric at the center.
For \(M_{ij}=(F_i\wedge F_j)/(2dV_{\rm eucl})\), the
center derivative is
\[
 \partial_aM_{ij}
 =-\tfrac12\big(s_j\langle U_i^a,J_je^a\rangle+
               s_i\langle U_j^a,J_ie^a\rangle\big)
 =(X_a)_{ij}.
\]
The \(J_je^a\) are orthonormal for fixed \(a\), and each
\(X_a\) is symmetric trace-free. Hence differentiation of
\(Q=3M/\operatorname{tr}M\) gives \(\partial_aQ=X_a\) at
zero, where \(\nabla^A Q=\partial Q\). Actual curvature
satisfies Bianchi and its recovered mismatch is the one used
in (1). Openness gives positive planes and the same
curvature-map sign in a sufficiently small neighborhood for
each finite jet. This construction confines the spectral
statement to the center. It supplies no neighborhood-wide
pinching, closed datum, or integrated energy-gradient
counterexample. Those conclusions do not follow from the
pointwise failure.
[E02C quotient differential](../notes/04C_VOLUME_AND_JETS_20261122.md).

The velocity, Frobenius tensor form and \(Q\) spectra are
invariant as geometric quantities under compatible oriented
frame changes. In matched old orthonormal model frames at
arbitrary fixed \(K>0\), the common \(K\) cancels from Bianchi
and enters the velocity as the single factor \(K\). The form,
as a function of the model tensor components, is unchanged.
Equivalently, for a fixed realized connection changing the old
calibration from \(1\) to \(K\) sends
\(\widehat g_1\) to \(K^{-1}\widehat g_1\). In the corresponding
orthonormal coefficients \(X\) gains \(\sqrt K\), so \(R\)
gains \(K\). The squared old velocity norm gains \(K^3\),
from the old velocity as a one-form gaining \(K\) and the
inverse metric gaining \(K\). In native conventions
\(g_A=2K\widehat g_K\), \(V_{\rm n}=(2K)^{-1}V_{\rm o}\) and
the internal metric doubles, so the squared pointwise norm
gains \(2(2K)^{-3}\) relative to the old norm at that \(K\).
All factors are fixed positive constants with \(Q_0\)
unchanged. They preserve this local speed-only obstruction.
[E209 normalization](../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md).

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E225 request](../research-progress/handoffs/SP4-CME-E225_REQUEST_v1.md) | 2a85615f94ed6e03f6aeca8afc7a51fca6b7c3af36d88c6fefe762c44eebdba7 |
| [B106](../brainstorm/notes/B106_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 2abc6e7fc730d4b2dffd86d5d475bd5ca92739750e46331ed38b32f9331ddce1 |
| [E223 note](../notes/223_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 3c2d30a27031494fd189669b52df82f4a1b51aa1ce359cbfc6841bbf2baadbd4 |
| [E223 generator](../numerics/e223_endpoint_speed_absorption.py) | a7e19e60f9d46e0445dade72d1658da19e528b61b39d3465511dee221391170e |
| [E223 exact record](../numerics/e223_endpoint_speed_absorption.json) | 6460cc140328afbc3e40afc4afe231a35f7645c40c6b5c56eae181957e7306ee |
| [E223 return](../research-progress/handoffs/SP4-CME-E223_RETURN_v1.md) | 7530a2b1f3f898b76a97411fb1274df5f4a40d5745145261eb48f3424150bcc5 |
| [E218/E219 assessment](E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E209 derivation](../notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E02C](../notes/04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
