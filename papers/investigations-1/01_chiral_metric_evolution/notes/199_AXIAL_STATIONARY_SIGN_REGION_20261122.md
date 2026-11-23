# E199 — Exact sign region for the axial stationary derivative form

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B97, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored E187's seven-case calculation and script. E189 independently checked that inherited finite algebra. The present proof classifies precisely the one-parameter axial family and uses the frozen E187 conventions. [E187/E189 assessment][assessment]

## Result

For every \(t>0\), the zero-speed map has rank eight and its kernel has dimension twelve. Set

\[
 t_- =\sqrt{\frac{\sqrt{201}-13}{8}},\qquad t_+=\sqrt{\frac72}.
\]

Inertia of the form \(R\) on this kernel is ordered as \((n_+,n_0,n_-)\), with \(n_0\) the dimension of its bilinear radical.

| Parameter | Inertia |
| --- | --- |
| \(0<t<t_-\) | \((8,0,4)\) |
| \(t=t_-\) | \((8,4,0)\) |
| \(t_-<t<t_+\) | \((12,0,0)\) |
| \(t=t_+\) | \((8,4,0)\) |
| \(t_+<t\) | \((8,0,4)\) |

Thus positive semidefiniteness holds precisely on the closed interval and positive definiteness on its interior. Both endpoints are transitions of the form on a kernel of unchanged dimension.

## Exact reconstruction and global velocity rank

Work at an oriented Euclidean four-point with the older bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), \(K=1\), and \(\Sigma_1=dx^{14}+dx^{23}\), \(\Sigma_2=dx^{24}+dx^{31}\), \(\Sigma_3=dx^{34}+dx^{12}\). Set \(s=t^2\), \(a_0=3/(s+2)\), \(c=\sqrt{a_0}\), \(d=(1,1,t)\), \(D=\operatorname{diag}d\), \(S=cD\), \(Q=S^2\), \(q=Q-I\) and \(F=-S\Sigma\). Denote \(J_k\alpha=*(\alpha\wedge\Sigma_k)\), so \(J_iJ_j=-\delta_{ij}I+\sum_k\epsilon_{ijk}J_k\). For four trace-free symmetric derivative matrices \(X_a\), put

\[
 (Y_a)_{ij}=\frac{(X_a)_{ij}}{d_i+d_j},\quad D_a^AS=Y_a/c,\quad
 P_a=S^{-1}D_a^AS=a_0^{-1}D^{-1}Y_a .                              \tag{1}
\]

With \(z_i=-\sum_{a,j}(P_a)_{ij}J_jdx^a\) and \(\mathscr C_{ij}=\sum_k\epsilon_{ijk}J_k\), take \(b=(\mathscr C+I)z/2\). Indeed \(\mathscr C^2=2I-\mathscr C\), and \(\mathscr Cb=z\) is the starred compatibility equation. Full Bianchi after multiplication by \(c\) is

\[
 \sum_{a,j}(Y_a)_{ij}J_jdx^a+a_0 d_i(\mathscr Cb)_i=0 .            \tag{2}
\]

This determines the actual \(b\) from \(F=-S\Sigma\) and the derivatives in the adopted algebra. The skew connection term is \(\Xi_a=2[Y_a,D]+4a_0D\operatorname{ad}(b_a)D\), with \(\operatorname{ad}(b_a)_{ij}=\sum_k\epsilon_{kji}(b_k)_a\). The form uses the full expression

\[
 R(X)=\sum_a\bigl(\langle X_a,\mathscr L_Q X_a\rangle-\langle q,[X_a,\Xi_a]\rangle\bigr),
 \qquad \mathscr L_Q X=2(QX+XQ)-\tfrac43\operatorname{tr}(QX)Q .    \tag{3}
\]

The pairings in (3) are Frobenius. The script checks the Sylvester equation (1), symmetric \(\mathscr C\), its square identity, (2), and skewness of \(\Xi_a\) as rational identities. In particular the Bianchi inverse is used before any restriction to the velocity kernel. [E187, (1)–(3)][e187] · [E05 integrated identity][energy]

Let \(H_a=X_a-\operatorname{tr}(QX_a)I/3\). Remove the common nonzero \(c\) from the velocity map and write \(W_i=V_i/c=-4\sum_{a,j}d_j (H_a)_{ij}J_jdx^a\). Flatten the 12 velocity coordinates by internal index followed by covector index, and the 20 derivative coordinates by axis and then \((X_{11},X_{22},X_{12},X_{13},X_{23})\), taking \(X_{33}=-X_{11}-X_{22}\).

For the upper rank bound, \(\sum_i d_iJ_iW_i=0\). In this sum symmetry of \(H_a\) and the quaternion relation cancel the off-diagonal terms. The remaining coefficient vanishes because \(\sum_i d_i^2(H_a)_{ii}=\operatorname{tr}(QH_a)/a_0=0\). The map \((W_i)\mapsto\sum_i d_iJ_iW_i\) is onto the four covector components, as \(d_1=1\) and \(J_1\) is invertible. For the lower rank bound, the determinant of the \(W\)-matrix minor with zero-based rows \((3,6,2,1,5,7,0,4)\) in that order and columns \((0,1,2,3,4,5,8,9)\) is

\[
                     \frac{589824 t^8}{(s+2)^2}>0 .                \tag{4}
\]

The script derives the minor by exact rational elimination and verifies it on the indicated fixed submatrix. Thus the velocity rank is eight for all \(t>0\). All operations in the final basis below have denominators nonzero there, so no specialization of a generic rank certificate is needed at either transition.

## Symbolic basis and block congruences

Let \(e_j\) be the coordinate unit vector in the original 20-vector, indexed from zero. Write \(B_j\) for the kernel vector with free coordinate \(j\) set to one, all other free coordinates zero. For compact display set

\[
 p=\frac{1+2s}{t(s+2)},\qquad r=\frac{s-1}{t(s+2)},\qquad
 u=\frac{1+2s}{3t},\qquad v=\frac{s-1}{3t},\qquad w=\frac{s+2}{3t} .
\]

The rational RREF kernel is as follows. Each row gives \(B_j-e_j\), so its free coordinate is explicit.

| \(j\) | \(B_j-e_j\) | \(j\) | \(B_j-e_j\) |
| ---: | --- | ---: | --- |
| 6 | \(-e_2-e_5\) | 7 | \(-e_0+e_1\) |
| 10 | \(p e_3+r e_9\) | 11 | \(r e_3+p e_9\) |
| 12 | \((e_4+e_8)/t\) | 13 | \(-u e_0+v e_1\) |
| 14 | \(-u e_2-w e_5\) | 15 | \(r e_4-p e_8\) |
| 16 | \(p e_4-r e_8\) | 17 | \((e_3-e_9)/t\) |
| 18 | \(-v e_2+w e_5\) | 19 | \(v e_0-u e_1\) |

The script checks the displayed basis against the symbolic row reduction, its exact residual \(W=0\), and its identity submatrix on the free coordinates. It computes the Gram matrix by polarization of (3), or equivalently by averaging the mixed pairing with its transpose. In each of the following ordered triples of \(B_j\), let \((z_0,z_1,z_2)\) denote the three listed vectors in order. The four triples are mutually orthogonal for this polarized form:

\[
 A:(B_6,B_{14},B_{18}),\quad B:(B_7,B_{13},B_{19}),\quad
 C:(B_{10},B_{11},B_{17}),\quad D:(B_{16},B_{15},B_{12}).           \tag{5}
\]

Here the block labels are only for the displayed triples. The last two Gram blocks agree in this order. Put \(P(s)=4s^2+13s-2\), \(L(s)=7-2s\). The exact bases of congruence, given as columns in the indicated block, and their diagonal entries are

| Block | New vectors in order | Diagonal entries |
| --- | --- | --- |
| \(A\) | \(z_0,\ z_1-z_2-\frac{s+2}{3t}z_0,\ z_1+z_2-\frac t2z_0\) | \(\frac{48}{s+2},\ \frac{8P(s)}{s(s+2)},\ \frac{12sL(s)}{s+2}\) |
| \(B\) | \(z_0,\ z_1+z_2,\ z_1-z_2-\frac t2z_0\) | \(\frac{48}{s+2},\ \frac{8P(s)}{s(s+2)},\ \frac{12sL(s)}{s+2}\) |
| \(C,D\) | \(z_0-z_1-z_2,\ z_0+z_1,\ \frac{z_0-z_1+z_2}{2}\) | \(\frac{48}{s+2},\ \frac{72P(s)}{(s+2)^3},\ \frac{12L(s)}{s+2}\) |

The change determinants are respectively \(2,-2,2,2\). In particular there are no exceptional positive parameters for the bases. Here are intermediate block entries that give the reductions directly. In block \(A\), the first diagonal is \(48/(s+2)\), and its two mixed entries are \((16+20s)/(t(s+2))\) and \((-16+4s)/(t(s+2))\). Removing that diagonal by congruence leaves

\[
 \frac1{s(s+2)}
 \begin{pmatrix}
 -4+26s+29s^2-6s^3 & 4-26s+13s^2-6s^3\\
 4-26s+13s^2-6s^3 & -4+26s+29s^2-6s^3
 \end{pmatrix} .                                                  \tag{6}
\]

Its difference and sum directions give the second and third entries in the table. In block \(B\), the first diagonal is again \(48/(s+2)\), the mixed entries are \(12t/(s+2),-12t/(s+2)\), and the lower submatrix has equal diagonals \((-4+26s+32s^2-6s^3)/(s(s+2))\) and off-diagonal \((-4+26s-16s^2+6s^3)/(s(s+2))\). The sum direction is already orthogonal to the first vector. Removing the first entry from the difference direction gives the stated last pivot.

For each of \(C,D\) the Gram block is \(\begin{psmallmatrix}a&b&d\\ b&a&-d\\d&-d&c_2\end{psmallmatrix}\), with

\[
 \begin{aligned}
 a&=\frac{60+306s+72s^2-6s^3}{(s+2)^3},&
 b&=\frac{-132+162s+72s^2+6s^3}{(s+2)^3},\\
 d&=\frac{12(3-s)}{s+2},&c_2&=\frac{24(4-s)}{s+2}.
 \end{aligned}
\]

The vector \(z_0+z_1\) is orthogonal to the other two directions and has square \(2(a+b)=72P/(s+2)^3\). The vector \(z_0-z_1-z_2\) has square \(48/(s+2)\) and pairing \(-24/(s+2)\) with \(z_2\). Adding half that vector to \(z_2\) makes the last direction orthogonal and gives square \(12L/(s+2)\). This avoids dividing by \(4-s\) even at \(t=2\). The corresponding original Gram determinants are \(1152PL/(s+2)^3\) for \(A,B\) and \(10368PL/(s+2)^5\) for \(C,D\).

The exact computation verifies the zero mixed blocks, each displayed congruence, and the original-coordinate Gram of all twelve transformed vectors computed directly from the reconstructed form. These checks include the velocity and full Bianchi residuals. All denominators in the final certificates are strictly positive for \(t>0\), which can also be read from their normalized coefficientwise nonnegative representations. [Script][script] · [Exact block and congruence certificates][results]

## Exact roots and endpoint radicals

As a function of \(s>0\), \(P\) is strictly increasing since \(P'(s)=8s+13\), starts at \(-2\), and its sole positive root is \((\sqrt{201}-13)/8\). In the \(t\) variable the exact evaluations \(P((1/3)^2)=-41/81\) and \(P((2/5)^2)=114/625\) isolate \(t_-\) in \((1/3,2/5)\). The linear \(L\) has sole positive root \(7/2\) in \(s\); \(L((9/5)^2)=13/25\) and \(L(2^2)=-1\) isolate \(t_+\) in \((9/5,2)\). Both roots are simple in \(t>0\) and their order follows from the disjoint intervals. Thus both factors are positive precisely in the open middle interval, one is zero at each endpoint with the other positive, and exactly one is negative outside. The positive first direction and positive prefactors in every block give the inertia table.

At \(t=t_-\) the radical has the following basis evaluated at that root:

\[
 B_{14}-B_{18}-\frac{s+2}{3t}B_6,\qquad
 B_{13}+B_{19},\qquad B_{10}+B_{11},\qquad B_{16}+B_{15}.             \tag{7}
\]

At \(t=t_+\) it is

\[
 B_{14}+B_{18}-\frac t2 B_6,\qquad
 B_{13}-B_{19}-\frac t2 B_7,\qquad
 \frac{B_{10}-B_{11}+B_{17}}2,\qquad
 \frac{B_{16}-B_{15}+B_{12}}2.                                    \tag{8}
\]

The definition of \(B_j\) above makes these explicit original-coordinate formulas over \(\mathbb Q(t_-)\) and \(\mathbb Q(t_+)\). The exact diagonalization provides their radical certificates. They are independent by the invertible changes and the disjoint coordinate blocks, and in each case eight other directions are positive. The JSON also records the vectors in original sparse coordinates as rational functions to evaluate at the designated root. [Endpoint certificates][results]

## Reproduction and interpretation

The [checker][script] ran with Python 3.10.0. No symbolic library was available in the checked Python interpreters. It uses standard-library `Fraction` for polynomial and rational-function arithmetic and the frozen E187 coframe primitives. No install or numerical eigenvalue was needed. Regenerate with `python3 numerics/e199_axial_stationary_sign.py > numerics/e199_axial_stationary_sign_results.json` from the investigation directory. Exact substitution reproduces every E187 kernel basis and restricted Gram entry, as well as the inertia, at all seven prescribed points. The final JSON regenerated byte for byte. [E187 data][e187data] · [E189 independent verifier][e189]

For E05's proposed sign route, the calculation supplies a closed axial interval where the derivative integrand is nonnegative subject to the actual velocity constraint. If spectral confinement to that interval were already supplied on a smooth stationary connection, the reaction term in E05 would give the remaining strict sign unless \(q=0\). Outside that interval the present algebra does not supply such a sign. This is a classification of one pointwise one-parameter kernel form. No spectral confinement, global realization of the derivative arrays, preservation under a flow, or assertion about other spectra follows from the calculation.

| Input or output | SHA-256 |
| --- | --- |
| [E199 request][req] | `392a5807c62d5301c0ef6baeec43491afe7869853078d859abd221e4462d6998` |
| [B97][b97] | `001d4b4b696bf9aecbc9ae28e370164281a03526d7540dddba605ae5bae7697c` |
| [E187 derivation][e187] | `6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4` |
| [E187 script][e187script] | `fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56` |
| [E187 exact data][e187data] | `0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad` |
| [E189 verifier][e189] | `e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8` |
| [E187/E189 assessment][assessment] | `65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40` |
| [E05][energy] | `cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb` |
| [E199 exact checker][script] | `015822bfcb450d58a023688dc0ae73651cb9e83e2f3ae73ca88fd1ba033c9862` |
| [E199 JSON certificates][results] | `df3af1193ad64823c132a8a39c429f0343aace80166772479c0d2614f2e7bead` |

[req]: ../research-progress/handoffs/SP4-CME-E199_REQUEST_v1.md
[b97]: ../brainstorm/notes/B97_AXIAL_STATIONARY_SIGN_REGION_20261122.md
[e187]: 187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md
[e187script]: ../numerics/e187_stationary_kernel.py
[e187data]: ../numerics/e187_stationary_kernel_results.json
[e189]: ../numerics/e189_stationary_kernel_verify.py
[assessment]: ../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md
[energy]: 07_PINCHED_ENERGY_GAP_20261122.md
[script]: ../numerics/e199_axial_stationary_sign.py
[results]: ../numerics/e199_axial_stationary_sign_results.json
