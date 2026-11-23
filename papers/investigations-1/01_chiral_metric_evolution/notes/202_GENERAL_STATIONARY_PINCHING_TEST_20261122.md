# E202 — Exact stationary derivative positivity on the ordered pinching triangle

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B98. Helper launch assigned gpt-6.2-sol/ultra. Independent runtime and lead model/effort attestations are unavailable. I authored the inherited E01A compatibility reconstruction, E02A defect equation and E05 integrated identity. E187/E189 provide the separately assessed finite stationary-kernel calculation. E202 uses that calculation's conventions and reuses its frozen coframe primitives and round check.

## Result

Let \(D=\operatorname{diag}(1,u,v)\), \(1\le u\le v\le3/2\), \(\lambda=c^2=3/(1+u^2+v^2)\), \(S=cD\) and \(Q=\lambda D^2\). For the actual zero-speed equation \(V=0\) on axis-major symmetric trace-free \(X=(X_a)_{a=1}^4\), the velocity map has rank eight and its kernel has dimension twelve throughout the closed triangle. With the full E187 skew term and Bianchi recovery, the derivative form obeys the uniform, non-optimal bound
\[
 R(X)\ \ge\ \frac{32768}{2205225}\sum_{a=1}^4 |X_a|_{\mathrm F}^{\,2}
 \qquad\text{for }V(X)=0 .
\]
In particular the restricted inertia is \((12,0,0)\) over the entire triangle, including the repeated-eigenvalue boundaries. The result is pointwise algebra for the proposed square-root eigenvalue ratio \(3/2\), or \(Q\) eigenvalue ratio \(9/4\). [E187/E189 assessment](../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) · [Exact certificate](../numerics/e202_general_stationary_pinching_results.json).

## Velocity kernel and its rank

Use the positive Euclidean tangent metric and the given orientation at the point, the older internal bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), \(K=1\), \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV\), and \(F=-S\Sigma\). The covector endomorphisms are \(J_j\alpha=*(\alpha\wedge\Sigma_j)\), so \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\). Use the E187 ordering \( (X_{11},X_{22},X_{12},X_{13},X_{23}) \) for each axis, with \(X_{33}=-X_{11}-X_{22}\). From here on each component \(X_{ij}\) is the covector with entries \((X_a)_{ij}\) in the four axes. Frobenius norms sum over all matrix indices, counting both off-diagonal entries.

Put \(d=(1,u,v)\), \(T=\operatorname{tr}D^2\) and \(H_a=X_a-\frac13\operatorname{tr}(QX_a)I\). The map \(X\mapsto H\) is a linear isomorphism from unweighted trace-free symmetric matrices to symmetric matrices with \(\operatorname{tr}(D^2H_a)=0\) at each axis. Its inverse is \(X_a=H_a-\frac13\operatorname{tr}H_a I\). Indeed, \(\operatorname{tr}(Q)=3\) and \(\operatorname{tr}(QH_a)=0\) show that the subtracted scalar in the forward map exactly restores \(H\). Define the triple of covectors \(W_i=-V_i/(4c)\) using E187 (3), which gives
\[
 W_i=\sum_j d_j J_j H_{ij}.
\]
The left relation \(\sum_i d_iJ_i W_i=0\) follows by cancellation of the off-diagonal terms using symmetry of \(H\) and the quaternion relation, and by \(\sum_i d_i^2H_{ii}=0\) on the diagonal. The map \((W_1,W_2,W_3)\mapsto\sum_i d_iJ_iW_i\) is onto the four covector components. Thus \(\operatorname{rank}W\le 8\). For the reverse inequality set all \(H_{ij}=0\) for \(i\ne j\), choose \(H_{11},H_{22}\) freely, and determine \(H_{33}\) by weighted trace. Then the \((W_1,W_2)\) map on those eight parameters is \((d_1J_1 H_{11},d_2J_2 H_{22})\), with nonzero determinant \((d_1d_2)^4\), since each \(J_i\) is a real orthogonal complex structure with determinant one. This is a lower rank certificate in invertible \(H\) coordinates, valid over the full triangle.

For \(i<j\) take arbitrary covectors \(Z_{ij}\), extend \(Z_{ji}=-Z_{ij}\), and write
\[
 H_{ij}=-J_iJ_j Z_{ij}\quad(i\ne j),
 \qquad H_{ii}=\frac{1}{d_i}\sum_{j\ne i}d_j Z_{ij}.
 \tag{1}
\]
The diagonal formula is \(J_i W_i=0\). These \(H\) have weighted trace zero by antisymmetry of \(Z\), are symmetric, and give \(W=0\). The inverse on the edge variables is \(Z_{ij}=J_i J_j X_{ij}\) for \(i<j\). It is exact and nonsingular even at \(u=v\) or \(u=1\). Thus the twelve coordinate directions of the covectors \((Z_{12},Z_{13},Z_{23})\) constitute a basis of the kernel. The code also checks its off-diagonal left inverse after reconstruction. The normalized speed is the actual E187 velocity with its trace correction. [E187 (3)](187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md).

## Reduction of the full derivative form

Use \(Y_{ij}=X_{ij}/(d_i+d_j)\) so \(DY_a+Y_aD=X_a\) and \(D_a^A S=Y_a/c\). Let \(P_a=\lambda^{-1}D^{-1}Y_a\), \(z_i=-\sum_{a,j}(P_a)_{ij}J_jdx^a\), \(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\). Then \(\mathscr C^2=2I-\mathscr C\), and \(b=(\mathscr C+I)z/2\) solves the starred Bianchi equation. Preserving the complete reconstruction gives
\[
 \Xi_a=2[Y_a,D]+4\lambda D\,\operatorname{ad}(b_a)D,
 \qquad
 R(X)=\sum_a\big(\langle X_a,\mathscr L_QX_a\rangle
             -\langle Q-I,[X_a,\Xi_a]\rangle\big),
\]
where \(\mathscr L_QX=2(QX+XQ)-\frac43\operatorname{tr}(QX)Q\). These use exactly the E187 older-bracket signs and orientation. [E187 (1)–(2)](187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md) · [E05 derivative form](07_PINCHED_ENERGY_GAP_20261122.md).

Set the covectors
\[
 h_i=d_i H_{ii}=\sum_{j\ne i}d_j Z_{ij},
 \qquad
 s_i=-\frac{X_{ii}}{2d_i^2}
             +\sum_{j\ne i}\frac{Z_{ij}}{d_i(d_i+d_j)}.
 \tag{2}
\]
Indeed, for \(i\ne j\), \(J_jH_{ij}=-J_i Z_{ij}\). Hence \(z_i=\lambda^{-1}J_i s_i\). Since for distinct \(i,j,k\) the product \(\epsilon_{ijk}J_kJ_j=-J_i\), reconstruction gives
\[
 \lambda b_i=\tfrac12J_i\left(2s_i-\sum_\ell s_\ell\right).
\]
The principal term in \(R\) is \(4\lambda\sum_{ij} d_i^2|H_{ij}|^2\) by the weighted trace projection. For \(i<j\), the contribution of that pair to \(\sum_a\langle Q-I,[X_a,\Xi_a]\rangle\) is \(2\lambda(d_j^2-d_i^2)\langle X_{ij},\Xi_{ij}\rangle\). Here the factor \(\epsilon_{kji}\) in \(\operatorname{ad}(b_a)\) equals \(-\epsilon_{ijk}\), the same sign multiplying \(J_kZ_{ij}\) in \(X_{ij}\). The Sylvester skew term uses \((d_j^2-d_i^2)(d_j-d_i)/(d_i+d_j)=(d_j-d_i)^2\). Combining all terms therefore gives
\[
 \frac{R(X)}{4\lambda}
   =\sum_i |h_i|^2+2\sum_{i<j}d_i d_j|Z_{ij}|^2
       -\sum_{i<j}(d_j^2-d_i^2)d_i d_j
           \left\langle Z_{ij},\,2s_k-\sum_\ell s_\ell\right\rangle ,
 \tag{3}
\]
where \(k\) is the index distinct from \(i,j\). All expressions in (2) are linear combinations of the \(Z_{ij}\) by real scalar coefficients. Equation (3) is thus the direct sum of four identical scalar symmetric \(3\times3\) blocks \(G\), in edge order \(12,13,23\). Neither skew contribution is dropped.

## Exact signed-row certificate over the continuum

Let \(L=12(uv)^3(1+u)(1+v)(u+v)>0\) and \(M=2LG\). To specify \(M\) as a polynomial matrix, number the edges \(p\) and write \(e_p\) for the scalar edge unit vector. Set \(A_{ip}=h_i(e_p)\), \(B_{ip}=L s_i(e_p)\), \(w_p=(d_j^2-d_i^2)d_i d_j\) for edge \(p=(i,j)\), and \(K_{pq}=w_p(2B_{kq}-\sum_\ell B_{\ell q})\). Then
\[
 M=2L\left(A^TA+\operatorname{diag}_{(i,j)}(2d_i d_j)\right)-K-K^T .
 \tag{4}
\]
The common factor clears all denominators in (2). Its factor \(12\) also supports integer arithmetic through the direct Sylvester and Bianchi reconstructions in the verifier. The polynomial coefficients of the matrix in the \(u,v\) power basis are recorded in the JSON.

For each row \(i\) of \(M\), form the four signed sums \(P=M_{ii}+\sigma M_{ij}+\tau M_{ik}\), \((\sigma,\tau)\in\{-1,1\}^2\), with \(j<k\) the other columns. The square coordinates \(v=1+a/2,\ u=1+ab/2\) map \([0,1]^2\) onto the ordered triangle. In these coordinates, write the power coefficients of \(P\) as \(p_{rs}\), and use degrees \(n,m\) in \(a,b\). Its tensor Bernstein coefficient \((I,J)\) is
\[
 \sum_{\substack{r\le I\\s\le J}}
 p_{rs}\,\frac{\binom I r}{\binom n r}\,\frac{\binom J s}{\binom m s}.
 \tag{5}
\]
The computation uses integer polynomials after multiplying the substitution by \(2^N\), \(N=\max(r+s)\) in the \(u,v\) power basis, and restores that denominator after conversion. Positivity is exact. The Bernstein basis is nonnegative and sums to one on the entire square, including the boundary and the collapsed \(a=0\) side.

| Row of \(M\) in edge order | Degrees \((n,m)\) | Minimum coefficients for \((-,-),(-,+),(+,-),(+,+)\) | Common coefficient denominator for each of those four arrays |
| --- | --- | --- | ---: |
| \(12\) | \((14,9)\) | \(768,384,1152,768\) | 3099672576 |
| \(13\) | \((14,8)\) | \(384,768,768,1152\) | 3444080640 |
| \(23\) | \((14,9)\) | \(768,1152,384,768\) | 1549836288 |

All 1740 coefficients are stored as integer numerators with their exact common denominators. No degree elevation or rectangular subdivision was needed. In particular \(M_{ii}-\sum_{j\ne i}|M_{ij}|\ge384\) everywhere. For real \(z\), the inequality \(2|z_i z_j|\le z_i^2+z_j^2\) gives \(z^TMz\ge384|z|^2\). Using \(\lambda\ge6/11\), \(L\le L(3/2,3/2)=164025/64\), and (3)–(4) gives
\[
 R(X)\ \ge\ 4\,\frac6{11}\,\frac{384}{2(164025/64)}
                         \sum_{i<j}|Z_{ij}|^2 .
\]
The ordinary projection of the diagonal of \(H\) to trace zero decreases its squared norm. Equation (1) and \(d_j/d_i\le3/2\) give \(\sum_i|H_{ii}|^2\le9\sum_{i<j}|Z_{ij}|^2\). Adding the off-diagonal norm \(2\sum_{i<j}|Z_{ij}|^2\) yields \(\sum_a|X_a|_{\mathrm F}^2\le11\sum_{i<j}|Z_{ij}|^2\), which gives the stated bound.

## Reproduction and safeguards

The [script](../numerics/e202_general_stationary_pinching.py) uses Python 3.10.0 standard-library integer arithmetic and fractions. A second calculation inside it starts with the full E187 matrix and covector formula on each of the twelve polynomially scaled basis directions. It checks the quaternion and \(\mathscr C\) algebra, the weighted-trace projection, the kernel basis left inverse, the Sylvester residual, all twelve velocities and Bianchi components, and skewness of \(\Xi\). It polarizes the original full form in those components and checks all 144 entries against (4), including the zero inter-axis blocks. This supplements the displayed derivation. At round, \(q=0\) and \(\mathscr L_I=4I\), hence \(R=4\sum_a|X_a|^2\) on all twenty dimensions. Replaying the round E187 case checks this and \(R=16\) on the E07 tensor, and all its restricted Gram entries agree after extracting the \(Z\) coordinates. The only accepted E187 axial sample with square-root ratio at most \(3/2\) is the round sample. The six requested grid points have positive exact scalar row gaps recorded in the JSON. They are sanity checks. The continuum result uses (5).

Run from the investigation directory.

```sh
python3 -B numerics/e202_general_stationary_pinching.py > numerics/e202_general_stationary_pinching_results.json
```

The final script reproduced byte-identical output on replay. It uses no numerical eigensolver, installed algebra package, or external source. The algebra concerns pointwise abstract derivatives satisfying the actual velocity and Bianchi relation. It establishes no realization theorem, general spectral classification, stationary connection theorem or flow consequence. The finite test stops at the proposed closed region.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E202 request](../research-progress/handoffs/SP4-CME-E202_REQUEST_v1.md) | 23f5cc5c0d1543f14f470b0982d74d1380cc3851b5c00d8578cbc8e1cccef815 |
| [B98](../brainstorm/notes/B98_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 8619615c9a35c9c58cb834b277ebb1141a1f33f439283857bc2b42cab7553867 |
| [E187 note](187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md) | 6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4 |
| [E187 code](../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E187 results](../numerics/e187_stationary_kernel_results.json) | 0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad |
| [E187/E189 assessment](../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) | 65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40 |
| [E189 verifier](../numerics/e189_stationary_kernel_verify.py) | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |
| [E05](07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E202 script](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E202 certificate](../numerics/e202_general_stationary_pinching_results.json) | 2402caedf00f18274caecf494e4d8a44c520ea7aec4248cc9bc1dfb2ff85454e |

The [E202 return](../research-progress/handoffs/SP4-CME-E202_RETURN_v1.md) records the note identity and the exact outcome.
