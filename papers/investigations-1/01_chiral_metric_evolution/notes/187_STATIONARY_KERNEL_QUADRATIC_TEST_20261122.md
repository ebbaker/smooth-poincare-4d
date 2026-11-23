# E187 — Exact quadratic tests on the stationary derivative kernel

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E computation under B92, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I previously checked the round linearization and principal defect operator in E01B and E02B, and authored the inherited E179 stationary-accumulation proof. E187 uses the frozen E01A compatibility recovery, E02A defect equation, E05 integrated identity, and E07 test tensor. The calculation concerns abstract first derivatives at one oriented point.

## Exact formulas and conventions

Use the older bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), Euclidean metric and orientation, \(K=1\), and the self-dual forms

\[
 \Sigma_1=dx^{14}+dx^{23},\qquad
 \Sigma_2=dx^{24}+dx^{31},\qquad
 \Sigma_3=dx^{34}+dx^{12} .
\]

In particular \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV\). Write \(J_j\alpha=*(\alpha\wedge\Sigma_j)\), so \((J_jdx^a)_b=(\Sigma_j)_{ab}\). Put \(\lambda_0=3/(2+t^2)\), \(c=\sqrt{\lambda_0}\), \(d=(1,1,t)\), and \(D=\operatorname{diag}d\). Then \(Q=\lambda_0D^2\), \(S=cD\), \(q=Q-I\) and \(F=-S\Sigma\). The unknown is \(X=(X_a)_{a=1}^4\) with each \(X_a\) symmetric and trace-free. Define

\[
  (Y_a)_{ij}=\frac{(X_a)_{ij}}{d_i+d_j},\qquad
  D_a^A S=Y_a/c,\qquad
  P_a=S^{-1}D_a^AS=\lambda_0^{-1}D^{-1}Y_a .                    \tag{1}
\]

The first identity gives \(DY_a+Y_aD=X_a\), exactly the rescaled Sylvester equation. Positive \(t\) makes all denominators legitimate. The difference connection \(b=A-\Gamma^+\) satisfies \(d_A\Sigma=[b,\Sigma]\) since \(d_{\Gamma^+}\Sigma=0\). Bianchi for \(F=-S\Sigma\) requires \((D^AS)\wedge\Sigma+S[b,\Sigma]=0\). Thus define \(z_i=-\sum_{a,j}(P_a)_{ij}J_jdx^a\) and \(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\). Then \(\mathscr C b=z\). The chosen \(J\) satisfy \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\). Contracting the two epsilon symbols gives \((\mathscr C^2)_{i\ell}=J_\ell J_i-\delta_{i\ell}\sum_k J_k^2=2\delta_{i\ell}I-\mathscr C_{i\ell}\). Both skew factors in its blocks make \(\mathscr C\) symmetric. Accordingly the Bianchi reconstruction is \(b=(\mathscr C+I)z/2\). The script checks the matrix identity and actual compatibility on every input basis direction. Its full rational Bianchi residual is \(\sum_{a,j}(Y_a)_{ij}J_jdx^a+\lambda_0d_i(\mathscr Cb)_i=0\), obtained by multiplying the starred Bianchi equation by \(c\). [E01A compatibility subsection][compat]

In the older internal orthonormal bracket, \((\operatorname{ad}(b_a))_{ij}=\sum_k\epsilon_{kji}(b_k)_a\). The skew endomorphisms and the requested derivative form are therefore entirely rational:

\[
 \begin{aligned}
 \Xi_a&=2[Y_a,D]+4\lambda_0D\operatorname{ad}(b_a)D,\\
 \mathscr L_Q X&=2(QX+XQ)-\tfrac43\operatorname{tr}(QX)Q,\\
 R(X)&=\sum_a\bigl(\langle X_a,\mathscr L_Q X_a\rangle
                       -\langle q,[X_a,\Xi_a]\rangle\bigr).       \tag{2}
 \end{aligned}
\]

Here \([U,W]=UW-WU\) for endomorphisms and the pairings are Frobenius. As \(q\) is diagonal, the commutator term is evaluated as \(\sum_{a,i,j}q_{ii}((X_a)_{ij}(\Xi_a)_{ji}-(\Xi_a)_{ij}(X_a)_{ji})\). This retains the sign of the integrated E05 identity. [E02A][defect] · [E05, (3)][energy]

For the velocity remove just the common nonzero \(c\) from \(F_k=-cd_k\Sigma_k\). The rational constraint rows are the components of

\[
 (V_i/c)_b=-4\sum_{a,k}d_k
     \left((X_a)_{ik}-\frac{\operatorname{tr}(QX_a)}{3}\delta_{ik}\right)
      (\Sigma_k)_{ab}.                                           \tag{3}
\]

This is the actual zero-speed constraint from the product of the derivative flow matrix with the self-dual curvature. It imposes the velocity equation at the point and retains Bianchi through (1)–(2). [E07][kernel]

## Exact certificate method

The [script][script] uses only Python's standard library and `Fraction`. For each axis its coordinates are \((X_{11},X_{22},X_{12},X_{13},X_{23})\), with \(X_{33}=-X_{11}-X_{22}\). Flatten in ascending axis order to give 20 real coordinates. The velocity rows are ordered by internal index and then covector index. Rational RREF uses ascending columns and the first available nonzero row for a pivot. Each kernel-basis vector sets one free coordinate to one and the other free coordinates to zero, with the remaining eight coordinates obtained by RREF. The resulting zero-based pivot and free columns, basis vectors, and exact restricted matrix are in the [results][results]. In every case the same eight pivot columns occur, namely \(0,1,2,3,4,5,8,9\).

The restricted matrix is the polarization of (2). More explicitly, form the mixed pairing with \(X\) in the first slot and \(\mathscr L_Q Y,\Xi(Y)\) in the second, then average with the transposed mixed pairing. Symmetric rational elimination replaces remaining basis vectors \(v_j\) by \(v_j-G_{0j}v_0/G_{00}\) at each nonzero diagonal pivot, and updates the form by its Schur complement. The script's general fallback for a nonzero off-diagonal with zero diagonal is the invertible basis operation \(v_i\gets v_i+v_j\). Stored congruence basis vectors are in the original 20 coordinates. The script checks their membership in the velocity kernel, full rank in the RREF free coordinates, and exact re-evaluation of their complete polarized diagonal matrix. This gives an exact inertia certificate without floating-point eigenvalues. On each indefinite case it re-evaluates the listed witness in the original matrices and checks all twelve velocity residuals equal zero.

At round \(Q=I\), the whole 20-variable matrix agrees exactly with \(4\) times its Frobenius Gram matrix. The E07 tensor \(X_1=\operatorname{diag}(1,-1,0)\), \(X_2=-(E_{12}+E_{21})\), \(X_3=X_4=0\) is in the computed kernel and has \(R=16\). Reconstruction checks also cover the Sylvester residual, the \(\mathscr C\) compatibility residual, the full rational Bianchi residual and skewness of \(\Xi\).

## Seven cases

Inertia is ordered as \((n_+,n_0,n_-)\) for the *restricted* form.

| \(t\) | Eigenvalues of \(Q\) | Velocity rank | Kernel dimension | Inertia |
| --- | --- | ---: | ---: | --- |
| \(1/8\) | \((64/43,64/43,1/43)\) | 8 | 12 | \((8,0,4)\) |
| \(1/4\) | \((16/11,16/11,1/11)\) | 8 | 12 | \((8,0,4)\) |
| \(1/2\) | \((4/3,4/3,1/3)\) | 8 | 12 | \((12,0,0)\) |
| \(1\) | \((1,1,1)\) | 8 | 12 | \((12,0,0)\) |
| \(2\) | \((1/2,1/2,2)\) | 8 | 12 | \((8,0,4)\) |
| \(4\) | \((1/6,1/6,8/3)\) | 8 | 12 | \((8,0,4)\) |
| \(8\) | \((1/22,1/22,32/11)\) | 8 | 12 | \((8,0,4)\) |

For \(t=1/2\) the congruence diagonal is

\[
 (64/3,64/3,334/27,1280/167,40,15/2,15/2,944/135,3328/531,832/45,832/135,832/135).
\]

For \(t=1\) it is \((16,16,16,15,24,15,15,40/3,10,40/3,40/3,40/3)\). Both certify positivity on the twelve-dimensional kernel. The [results][results] give full certificates for every case, including the four negative pivots at each indefinite value.

For compact witness notation in the original matrices, write \(E_{ij}^{\rm sym}=E_{ij}+E_{ji}\) for \(i<j\). Each unlisted \(X_a\) is zero.

| \(t\) | Nonzero matrices \(X_a\) in the original axis slots | Exact \(R(X)\) |
| --- | --- | --- |
| \(1/8\) | \(X_1=\operatorname{diag}(-11/4,-21/8,43/8),\ X_3=E_{13}^{\rm sym}\) | \(-156673/1376\) |
| \(1/4\) | \(X_1=\operatorname{diag}(-3/2,-5/4,11/4),\ X_3=E_{13}^{\rm sym}\) | \(-1537/88\) |
| \(2\) | \(X_1=(17/38)E_{23}^{\rm sym},\ X_2=(25/38)E_{13}^{\rm sym},\ X_3=E_{12}^{\rm sym},\ X_4=\operatorname{diag}(-4/19,0,4/19)\) | \(-8/19\) |
| \(4\) | \(X_1=(11/24)E_{13}^{\rm sym},\ X_2=(5/24)E_{23}^{\rm sym},\ X_3=\operatorname{diag}(1,0,-1)\) | \(-11/54\) |
| \(8\) | \(X_1=(43/176)E_{13}^{\rm sym},\ X_2=(21/176)E_{23}^{\rm sym},\ X_3=\operatorname{diag}(1,0,-1)\) | \(-11651/2662\) |

## Consequence and reproducibility

The E05 stationary identity is \(0=-2\int R\mu-48K\int\sqrt{\det Q}|q|^2\mu\). A pointwise nonnegative derivative term throughout a supplied spectral region would force perfection for stationary connections confined to that region. The five witnesses disprove that proposed pointwise nonnegativity on the stationary first-derivative kernel at the five indicated spectra. This is a local algebraic obstruction to that sufficient route. The negative arrays are not shown to occur on an actual critical connection or in a flow. The two positive tests are discrete certificates and give no nonnegativity region between spectra, stationary gap for arbitrary data, or classification.

Run from the investigation directory with `python3 numerics/e187_stationary_kernel.py > numerics/e187_stationary_kernel_results.json`. The recorded interpreter was Python 3.10.0. The final script ran twice with byte-identical output and every exact assertion passed. No further spectral value, external library or primary source reinspection entered. The E05 and E07 hashes below are the packet's current-byte inputs.

| Input or output | SHA-256 |
| --- | --- |
| [E187 request][req] | `f16ffeb64cbddec145c93decda529a584a44e43042e0878cf780b21f6ea1e257` |
| [B92][b92] | `4368eb9bf3ef70004be357711a42f926b314b2d037aa96482582755bbfa5d8a9` |
| [E05][energy] | `cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb` |
| [E04–E07 assessment][assess] | `1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c` |
| [E07][kernel] | `dba99850da0f4ed3f56a46c3c8753d3cf69c0d3505ef97976523a907baf17ab9` |
| [E01A compatibility][compat] | `c111d9c9128dcc5139e660edcab6307cecf7693ecaa4800bdb12ea7ea4a6791f` |
| [E02A][defect] | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| [Exact script][script] | `fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56` |
| [JSON certificates][results] | `0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad` |

[req]: ../research-progress/handoffs/SP4-CME-E187_REQUEST_v1.md
[b92]: ../brainstorm/notes/B92_STATIONARY_COERCIVITY_ALGEBRA_20261122.md
[energy]: 07_PINCHED_ENERGY_GAP_20261122.md
[assess]: ../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md
[kernel]: 09_DISSIPATION_KERNEL_20261122.md
[compat]: ../reviews/E01A_AUDIT_20261122.md
[defect]: 04A_NONLINEAR_Q_20261122.md
[script]: ../numerics/e187_stationary_kernel.py
[results]: ../numerics/e187_stationary_kernel_results.json
