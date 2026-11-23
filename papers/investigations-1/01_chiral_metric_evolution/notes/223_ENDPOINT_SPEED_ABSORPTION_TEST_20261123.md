# E223 — The stationary endpoint does not admit speed-only absorption

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B106, configured gpt-6.2-sol/ultra. Independent runtime and selected lead settings are unavailable. I authored the inherited E01A, E02A, E05, E202 and E209 calculations and the E219 independent audit. The E218/E219 lead assessment supplies the exact stationary radical. E223 recomputes the full polarized form at the one prescribed spectrum.

## Result

At old \(K=1\) and \(Q_0=\operatorname{diag}(6/11,6/11,21/11)\), there is no finite \(C\) depending on \(Q_0\) such that pointwise
\[
                       R_{Q_0}(X)\ge -C|V_{Q_0}(X)|^2
\]
for every trace-free symmetric first-derivative array \(X\). In the exact witness below, \(V(N)=0\), \(R(N)=0\), \(|V(Y)|^2=3552/121\), and
\[
             R(Y+\sigma N)=\frac{888}{121}
                             -\frac{18\sqrt{14}}{11}\sigma,
             \qquad  V(Y+\sigma N)=V(Y).
\]
Thus the derivative form is unbounded below along the fixed-speed ray \(\sigma\to+\infty\). This is an obstruction to the pointwise absorption strategy at the closed endpoint. [B106](../brainstorm/notes/B106_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md).

## Full form and exact reconstruction

Use the oriented old orthonormal internal frame with bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), Euclidean base coframe at the point, and \(\Sigma_1=dx^{14}+dx^{23}\), \(\Sigma_2=dx^{24}+dx^{31}\), \(\Sigma_3=dx^{34}+dx^{12}\). Write
\[
 t=\sqrt{7/2}=\sqrt{14}/2,\quad
 d=(1,1,t),\quad D=\operatorname{diag}d,\quad \lambda=c^2=6/11,
 \quad S=cD,\quad F=-S\Sigma,\quad q=Q_0-I.
\]
The sign is the round-compatible one. Set \(J_j\alpha=*(\alpha\wedge\Sigma_j)\); then \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\). The axis-major standard coordinates are \(((X_a)_{11},(X_a)_{22},(X_a)_{12},(X_a)_{13},(X_a)_{23})\) for \(a=1,2,3,4\), with \((X_a)_{33}=-(X_a)_{11}-(X_a)_{22}\). Call the corresponding coordinate vectors \(E_j\), zero based. They are not presumed Frobenius orthonormal. The final norm is the unscaled old Euclidean norm of the actual one-form velocity.

For each input \(X\), put
\[
 \begin{gathered}
 H_a=X_a-\tfrac13\operatorname{tr}(Q_0X_a)I,\qquad
 (U_a)_{ij}=(X_a)_{ij}/(d_i+d_j),\qquad
 P_a=\lambda^{-1}D^{-1}U_a,\\
 \frac{V_i(X)}c=-4\sum_{a,j}d_j(H_a)_{ij}J_jdx^a,\qquad
 z_i=-\sum_{a,j}(P_a)_{ij}J_jdx^a,\qquad
 \mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k,\qquad b=(I+\mathscr C)z/2 .
 \end{gathered}
 \tag{1}
\]
The actual corrected velocity has the common positive \(c\) displayed explicitly. The ratio of components \(V/c\) and the exact squared speed \(c^2\sum_i|V_i/c|^2\) both use only \(\mathbb Q(\sqrt{14})\), even though the omitted common factor \(c\) need not lie in that field. \(U_a=(c D_a^AS)\) is the rescaled Sylvester derivative, and \(\mathscr C^2=2I-\mathscr C\) gives \(\mathscr C b=z\) for the actual mismatch. The complete skew map and quadratic form are
\[
 \begin{aligned}
 \Xi_a(X)&=2[U_a,D]+4\lambda D\operatorname{ad}(b_a)D,\\
 \mathscr L_Q X_a&=2(QX_a+X_aQ)-\tfrac43\operatorname{tr}(QX_a)Q,\\
 R(X)&=\sum_a\bigl(\langle X_a,\mathscr L_{Q_0}X_a\rangle
                          -\langle q,[X_a,\Xi_a(X)]\rangle\bigr).
 \end{aligned}
 \tag{2}
\]
No restriction on \(V(X)\) is imposed in (1)–(2). All matrix pairings are Frobenius. The code checks the full Bianchi residual \(\sum_{a,j}(U_a)_{ij}J_jdx^a+\lambda d_i(\mathscr Cb)_i=0\) and the Sylvester residual, as well as skewness of the full \(\Xi_a\). It computes the full \(20\times20\) matrix of the symmetric polarization
\[
        B(X,Y)=\tfrac12\bigl(R(X+Y)-R(X)-R(Y)\bigr).
\]
For the matrix entries it also evaluates the unsymmetrized mixed formula from (2), then averages the two orders. This agrees with direct quadratic polarization in every entry. [E202 block and conventions](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) · [E187 component formulas](../numerics/e187_stationary_kernel.py).

## All eighty pairings at the stationary radical

Normalize \(N_a\) by the edge data \((Z_{12},Z_{13},Z_{23})=(-t/2,1,-1)dx^a\), \(a=1,2,3,4\), in the assessed exact radical. Equation (1)'s weighted-trace \(H\) recovers the diagonal from \(H_{ii}=d_i^{-1}\sum_{j\ne i}d_j Z_{ij}\) with \(Z_{ji}=-Z_{ij}\). Thus its entries are \(H_{11}=(t/2)dx^a,\ H_{22}=-(t/2)dx^a,\ H_{33}=0\), so \(X=H\) for each \(N_a\). The off-diagonal covectors are
\[
        X_{12}=(t/2)J_3dx^a,\qquad X_{13}=J_2dx^a,\qquad X_{23}=J_1dx^a .
\]
The script checks the inverse extraction \(J_iJ_jX_{ij}=Z_{ij}\) and directly verifies all \(V(N_a)=0\) and \(R(N_a)=0\). [Assessed radical](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md).

For compact display put \(\xi=\sqrt{14}\). Here are all nonzero values \(B(N_a,E_j)\); each unlisted entry among the eighty is zero.

| Radical | Nonzero entries \((j,B(N_a,E_j))\) |
| --- | --- |
| \(N_1\) | \((0,-9\xi/11),\ (1,9\xi/11),\ (7,-18\xi/11),\ (13,-63/11),\ (19,63/11)\) |
| \(N_2\) | \((2,18\xi/11),\ (5,-9\xi/11),\ (6,9\xi/11),\ (14,63/11),\ (18,63/11)\) |
| \(N_3\) | \((3,63/11),\ (9,-63/11),\ (10,-9\xi/11),\ (11,9\xi/11),\ (17,-18\xi/11)\) |
| \(N_4\) | \((4,-63/11),\ (8,-63/11),\ (12,18\xi/11),\ (15,-9\xi/11),\ (16,9\xi/11)\) |

Each row is checked three ways by direct quadratic polarization, by symmetrized (2), and by contraction with the full original-coordinate matrix. There are twenty nonzero entries. The JSON retains all eighty in sparse format along with the full symmetric matrix, the velocity columns \(V/c\), and the original coordinate vectors of the radicals. [Exact record](../numerics/e223_endpoint_speed_absorption.json).

## The explicit witness and a direct mixed-term check

Take \(Y=E_0\), so \(Y_1=\operatorname{diag}(1,0,-1)\) and \(Y_2=Y_3=Y_4=0\). Take \(N=N_1\). In original coordinates this is
\[
                N=\frac t2 E_0-\frac t2 E_1+\frac t2 E_7-E_{13}+E_{19}.
\]
For \(Y\), the corrected matrix \(H_1\) in (1) is \(\operatorname{diag}(16,5,-6)/11\). Substitution gives
\[
 \frac{V_1(Y)}c=-\frac{64}{11}dx^4,\qquad
 \frac{V_2(Y)}c=\frac{20}{11}dx^3,\qquad
 \frac{V_3(Y)}c=\frac{24t}{11}dx^2 .
\]
Thus \(|V(Y)|^2=3552/121\) from \(\lambda=6/11\). Since \(Y_1\) and \(q\) commute, its scalar skew pairing in \(R(Y)\) is zero. The principal contribution is \(4\operatorname{tr}(Q_0Y_1^2)-\frac43\operatorname{tr}(Q_0Y_1)^2=888/121\).

For the decisive mixed entry, the symmetric principal pairing is \(12t/11\). This follows from the first base slot \(\operatorname{diag}(t/2,-t/2,0)\) of \(N\) and the diagonal of \(\mathscr L_{Q_0}Y_1\). In the skew part, \(\langle q,[Y_a,\Xi_a(N)]\rangle=0\) by commuting \(Y\) and \(q\). The other order retains the full \(\Xi(Y)\). Its Sylvester skew part vanishes because \(Y\) is diagonal. For \(Y\) the Bianchi input in (1) is \(z_i=\sigma_i J_i dx^1\) with
\[
      (\sigma_1,\sigma_2,\sigma_3)
             =\left(-\frac1{2\lambda},\,0,\,\frac1{2\lambda t^2}\right).
\]
Using \(\mathscr C_{ij}J_j=-J_i\) for \(i\ne j\) yields \(b_i=\bigl(2\sigma_i-\sum_j\sigma_j\bigr)J_i dx^1/2\). In covector notation (2) therefore gives
\[
       \Xi(Y)_{13}=t(1-t^{-2})J_2dx^1,\qquad
       \Xi(Y)_{23}=t(1+t^{-2})J_1dx^1 .
\]
The \((1,2)\) pair has zero \(q\)-difference. Since \(N_{13}=J_2dx^1\) and \(N_{23}=J_1dx^1\), the two remaining skew contributions sum to
\[
   \sum_a\langle q,[(N)_a,\Xi_a(Y)]\rangle
     =2(\lambda_3-\lambda_1)\bigl(t(1-t^{-2})+t(1+t^{-2})\bigr)
     =60t/11 .
\]
Consequently
\[
                   B(N,Y)=12t/11-(60t/11)/2=-18t/11=-9\sqrt{14}/11 .
\]
This direct check matches the first nonzero table entry. For any real \(\sigma\), quadraticity gives \(R(Y+\sigma N)=R(Y)+2\sigma B(N,Y)+\sigma^2R(N)\) and linearity gives \(V(Y+\sigma N)=V(Y)\). Taking \(\sigma\to+\infty\) gives the claimed failure for every finite \(C\), even with \(Q_0\) fixed.

## Local realization of the arrays and scope

Each finite \(X=Y+\sigma N\) can be realized as the full first quotient derivative at the center of an actual smooth local connection. To check this in the same \(K=1\) conventions, prescribe \(F_i^*=-s_i\Sigma_i\) with \(s_i=\sqrt{(Q_0)_{ii}}>0\) in a trivial oriented bundle on a Euclidean chart. Let \(A^0=\frac12\sum_a x^a\iota_{\partial_a} F^*\), so \(A^0(0)=0\) and \(dA^0=F^*\). With \(V^a_i=-\sum_j(X_a)_{ij}J_jdx^a/s_j\), use
\[
                   A=A^0+\frac12\sum_a(x^a)^2 V^a .
\]
Here \(V^a\) is a coefficient one-form for the polynomial connection. The actual curvature has \(F_A(0)=F^*\) and \(\partial_aF_A(0)=dx^a\wedge V^a\), since its bracket term is \(O(|x|^2)\). The fixed-covector quotient differential in E02C is a right inverse on trace-free matrices. The pairing with \(\Sigma_j\) is \(\langle V_i^a,J_jdx^a\rangle\), giving the Gram variation \(X_a\) and no trace correction. Thus \((\nabla_a^AQ)(0)=X_a\) because \(A(0)=0\). The center metric is Euclidean by the positive plane and the density normalization \(2dV_{\rm eucl}\). Exact curvature gives Bianchi and hence the actual recovered mismatch in (1). Positivity and sign hold in a sufficiently small chart neighborhood for each finite array. The construction fixes the endpoint spectrum at the center, without a spectral bound throughout that neighborhood. It makes no assertion that these jets arise on a globally pinched connection or a flow. [E02C curvature symbol and quotient](04C_VOLUME_AND_JETS_20261122.md).

The result excludes the stated speed-only pointwise bound at \(Q_0\). Whether the full closed endpoint admits an integrated energy-gradient estimate by another argument remains unresolved. There is no nearby-spectrum study, claim of an actual critical nonperfect connection, or global-flow consequence.

## Reproduction and verified identities

The [script](../numerics/e223_endpoint_speed_absorption.py) ran in Python 3.10.0 using exact rational pairs in \(\mathbb Q(\sqrt{14})\), with the frozen quaternion and bracket primitives. Replay reproduced the JSON byte for byte. From the investigation directory use

```sh
python3 -B numerics/e223_endpoint_speed_absorption.py > numerics/e223_endpoint_speed_absorption.json
```

| Artifact | SHA-256 |
| --- | --- |
| [E223 request](../research-progress/handoffs/SP4-CME-E223_REQUEST_v1.md) | 2294e81b0ec1465303d742699fae17d5eb7fc6129c6add954e8519347d5f0cc2 |
| [B106](../brainstorm/notes/B106_ENDPOINT_SPEED_ABSORPTION_TEST_20261123.md) | 2abc6e7fc730d4b2dffd86d5d475bd5ca92739750e46331ed38b32f9331ddce1 |
| [E218/E219 assessment](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa |
| [E209 derivation](209_PINCHED_GRADIENT_DOMINATION_20261123.md) | 79234d9f02a6c6d34d1e7f6af3e0deb70ecd7425f022083c180ea8a97b923abd |
| [E202 derivation](202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E202 generator](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E187 generator](../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E219 verifier](../numerics/e219_sharp_stationary_verify.py) | 446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae |
| [E02C](04C_VOLUME_AND_JETS_20261122.md) | 0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838 |
| [E223 script](../numerics/e223_endpoint_speed_absorption.py) | a7e19e60f9d46e0445dade72d1658da19e528b61b39d3465511dee221391170e |
| [E223 exact record](../numerics/e223_endpoint_speed_absorption.json) | 6460cc140328afbc3e40afc4afe231a35f7645c40c6b5c56eae181957e7306ee |

The [E223 return](../research-progress/handoffs/SP4-CME-E223_RETURN_v1.md) records the derivation identity and scope.
