# E201 Independent all-parameter audit of the axial stationary form

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E audit under B97, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings are
unavailable. I authored the inherited E189 audit and exterior scalar
verifier, along with the earlier E07 jet calculation. I did not author
E187 or E199. The new all-parameter checking method uses the independent
E189 unstarred Bianchi solver and a proof by cleared polynomial degree.

## Disposition

**Pass.** For \(Q=3\operatorname{diag}(1,1,t^2)/(t^2+2)\) with
\(t>0\), the stationary velocity map has rank eight with one
fixed nonvanishing minor, and the displayed twelve-vector basis
spans its kernel at every parameter. Each of the four polarized
Gram blocks has one strictly positive pivot and two pivots with
signs of \(P(s)=4s^2+13s-2\) and \(L(s)=7-2s\), \(s=t^2\).
The two positive transitions are
\[
 t_-=\sqrt{(\sqrt{201}-13)/8},\qquad t_+=\sqrt{7/2}.
\]
The exact inertia in positive, zero, negative order is
\((12,0,0)\) on \((t_-,t_+)\), \((8,4,0)\) at both endpoints,
and \((8,0,4)\) outside the closed interval. The four endpoint
directions at each endpoint span the bilinear radical. This
classifies the abstract derivative form at the one axial family.

## Exterior reconstruction and the rank bound

Write \(\rho=t^2+2\), \(\lambda_i=3d_i^2/\rho\),
\(d=(1,1,t)\), \(D=\operatorname{diag}d\), \(c=\sqrt{3/\rho}\),
and \(F=-cD\Sigma\). Use the older oriented Euclidean coframe,
bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), \(K=1\) and the
\(\Sigma_i\) of squared norm two in E187. The checker builds each
\(J_i dx^a=*(dx^a\wedge\Sigma_i)\) by the wedge and Hodge
permutation rules. Their products give
\(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\). For example
\(J_1dx^4=-dx^1\), \(J_2dx^4=-dx^2\) and
\(J_1dx^2=dx^3\), consistent with \(J_1J_2dx^4=J_3dx^4\).
The code verifies every product on all four covector basis elements.

For \(X_a\) trace-free symmetric set
\(H_a=X_a-\operatorname{tr}(QX_a)I/3\). With \(W=V/c\)
the velocity entries are
\[
 W_i=-4\sum_{a,j}d_j(H_a)_{ij}J_jdx^a.
\]
In \(\sum_i d_iJ_iW_i\), the terms antisymmetric in \(i,j\)
cancel against the symmetric coefficients. The diagonal terms
reduce to \(4\sum_{a,i}d_i^2(H_a)_{ii}dx^a=0\) because
\(\operatorname{tr}Q=3\) and \(\operatorname{tr}(QH_a)=0\).
The relation map from the twelve velocity coordinates onto four
covector coordinates is itself onto. Arbitrary output \(u\) is
obtained with \(W_1=-J_1u\), \(W_2=W_3=0\). This proves rank at
most eight.

The independent determinant routine computes the minor at rows
\((3,6,2,1,5,7,0,4)\) and columns \((0,1,2,3,4,5,8,9)\)
in those orders, with signed exact row exchanges. After clearing
\(\rho^8\) its degree is at most \(24\), because each
\(\rho W\) entry has degree at most three. Independently the
claimed expression \(589824t^8/\rho^2\) clears to degree at
most \(20\), and equality at the 25 distinct positive rational
nodes \(1,\ldots,25\) proves the identity. It is strictly
positive for \(t>0\), proving the lower rank bound.

Each displayed \(B_j\) in E199 becomes a polynomial vector
of degree at most four after multiplication by \(3t\rho\).
The free coordinates give a literal identity matrix at all
parameters. The independent solve verifies the entire velocity
residual on these vectors. Clearing \(3t\rho^2\) in \(WB_j\)
gives degree at most seven, so the zero result holds globally.
There are twelve independent kernel vectors and the fixed
rank is eight. Neither the minor nor the basis uses a pivot
that can vanish at either transition.

For the form, the independent scalar solver first sets
\((Y_a)_{ij}=X_{aij}/(d_i+d_j)\). The full unstarred
compatibility equation assigns the \(i\)-th three-form
\[
 [b,\Sigma]_i=-\frac{\rho}{3d_i}
                 \sum_{a,j}(Y_a)_{ij}\,dx^a\wedge\Sigma_j .
\]
The fixed twelve-dimensional wedge matrix is inverted in
E189 using exact elimination and the full residual is tested
on every solve. Its starred matrix is symmetric and obeys
\(\mathscr C^2=2I-\mathscr C\), also checked from the exterior
rules. This identifies the same geometric Bianchi solution as
E199's starred formula. It gives the skew matrices
\(\Xi_a=2[Y_a,D]+4(3/\rho)D\operatorname{ad}(b_a)D\)
in the older bracket convention.

With the Frobenius inner product the principal scalar equals
\(4\sum_{a,i,j}\lambda_i(H_a)_{ij}^2\).
Indeed expansion subtracts
\(\frac43\sum_a\operatorname{tr}(QX_a)^2\)
from \(4\sum_{a,i,j}\lambda_i X_{aij}^2\).
For the remaining sign,
\([X_a,\Xi_a]_{ii}=-2\sum_j X_{aij}\Xi_{aij}\), so
\[
 R(X)=4\sum_{a,i,j}\lambda_i(H_a)_{ij}^2+
      2\sum_{a,i<j}(\lambda_i-\lambda_j)X_{aij}\Xi_{aij}.
 \tag{1}
\]
The checker evaluates this scalar and polarizes it, avoiding
E199's coframe residual, symbolic row reduction and pairwise
matrix pairing implementations.

## Global check of the actual Gram entries

The polynomial degree argument covers reconstruction and every
entry of the polarized form. For a polynomial array \(X\) of
degree at most four, as obtained by clearing \(3t\rho\) on a
basis vector or sum, the following bounds follow directly from
the displayed equations.

| Quantity | Clearing factor | Maximum degree after clearing |
| --- | --- | ---: |
| \(H\) | \(\rho\) | 6 |
| \(Y\) | \(t(t+1)\) | 6 |
| \(b\) | \(t^2(t+1)\) | 9 |
| \(\Xi\) | \(\rho t^2(t+1)\) | 11 |
| \(R(X)\) | \(\rho^3 t^2(t+1)\) | 19 |

The three Sylvester denominator types are \(2,1+t,2t\),
so the indicated factor for \(Y\) is sufficient over
\(\mathbb Q\). To get the entries for \(b\), multiply the
cleared \(Y\) terms by \(\rho\,t/d_i\), of degree at most
three, then apply the constant inverse wedge matrix. The two
terms of \(\Xi\) have degrees at most \(6+1+3=10\) and
\(9+2=11\) after clearing. In (1), the principal numerator
has degree at most \(2+2\cdot6+3=17\). The commutator
numerator has degree at most \(2+4+11+2=19\). Those degrees
include the additional factors to achieve the indicated common
denominator. Since \(R\) is quadratic, the Gram matrix of
the original \(B_j\) therefore clears by
\(9t^4(t+1)\rho^5\) to degree at most 19. The same degree
bound holds for mixed entries by polarization.

Here are the checked entries, with symmetry supplying lower
triangle values. Rows and columns are in the exact E199 orders
\((6,14,18)\), \((7,13,19)\), \((10,11,17)\), \((16,15,12)\).
Use \(g=48/\rho\). The verifier checks the whole \(12\times12\)
Gram matrix, including zero entries in all six distinct mixed
block pairs.

| Entry | A | B | C and D |
| --- | --- | --- | --- |
| \(00\) | \(g\) | \(g\) | \(a_c\) |
| \(01\) | \((16+20s)/(t\rho)\) | \(12t/\rho\) | \(b_c\) |
| \(02\) | \((-16+4s)/(t\rho)\) | \(-12t/\rho\) | \(d_c\) |
| \(11\) | \((4+118s+112s^2-18s^3)/(3s\rho)\) | \(h_b\) | \(a_c\) |
| \(12\) | \((-4-94s+44s^2-18s^3)/(3s\rho)\) | \(k_b\) | \(-d_c\) |
| \(22\) | \((4+70s+88s^2-18s^3)/(3s\rho)\) | \(h_b\) | \(c_c\) |

Here
\[
\begin{aligned}
 h_b&=\frac{-4+26s+32s^2-6s^3}{s\rho},&
 k_b&=\frac{-4+26s-16s^2+6s^3}{s\rho},\\
 a_c&=\frac{60+306s+72s^2-6s^3}{\rho^3},&
 b_c&=\frac{-132+162s+72s^2+6s^3}{\rho^3},\\
 d_c&=\frac{12(3-s)}{\rho},&
 c_c&=\frac{24(4-s)}{\rho}.
\end{aligned}
\]
Each asserted raw entry has denominator dividing \(t^2\rho^3\).
After multiplication by \(9t^4(t+1)\rho^5\), its numerator
has degree at most 17. Thus the independent comparison of
the raw Gram with this table at the 25 chosen exact nodes
proves the entire table for every positive \(t\). No estimate
between numerical samples is involved.

For the serialized records the checker also tests numerator
degree at most eight and denominator degree at most six, with
monic coefficientwise nonnegative denominators. This gives
positive denominators on \(t>0\). Cross multiplication with
the expected rational expressions fits the same node count.
For example the raw Gram and diagonal values use the common
denominator \(t^2\rho^3\) and cleared numerator degree at most
ten, so the largest cross degree there is at most
\(\max(8+8,6+10)=16\). Basis vectors clear by \(3t\rho\),
transformed vectors by \(6t^2\rho\), and change entries by
\(2t\). The minor formula has numerator degree eight and
denominator degree four. These bounds also check the
original-coordinate vectors stored for the endpoint radicals.

## Congruence and exact endpoint signs

In A, the two mixed pairings with the first vector have
difference \(g\rho/(3t)\) and sum \(gt/2\). Removing the
first direction by congruence produces the equal-diagonal
Schur block in E199 (6). The difference and sum of its
two remaining basis vectors have squares \(8P/(s\rho)\) and
\(12sL/\rho\), respectively. Their corrected representatives
are \(z_1-z_2-\rho z_0/(3t)\) and \(z_1+z_2-tz_0/2\).
In B the sum pairs to zero with \(z_0\) and has square
\(2(h_b+k_b)=8P/(s\rho)\). The difference pairs with
\(z_0\) by \(24t/\rho\). Subtracting its projection
\((t/2)z_0\) changes the square \(2(h_b-k_b)\) by
\(-12s/\rho\), leaving \(12sL/\rho\).

In C and D the sum \(z_0+z_1\) is orthogonal to
\(z_0-z_1\) and \(z_2\), and its square is
\(2(a_c+b_c)=72P/\rho^3\). The identity
\(2(a_c-b_c)=c_c\) shows that \(u=z_0-z_1-z_2\)
has square \(48/\rho\). Its pairing with \(z_2\) is
\(2d_c-c_c=-24/\rho\), so \(z_2+u/2\) is orthogonal
to \(u\) and has square \(c_c-12/\rho=12L/\rho\).
The column-change determinants are \(2,-2,2,2\), obtained
directly from these columns. All changes and Gram
denominators are regular at every positive parameter.
The original Gram determinants divide the diagonal products
by four, giving \(1152PL/\rho^3\) for A and B and
\(10368PL/\rho^5\) for C and D. The independent checker
also tests every congruence entry. With the raw Gram clearing
factor \(t^2\rho^3\) and changes clearing by \(2t\),
the congruence identity has degree at most 14 after clearing
\(4t^4\rho^3\).

The map \(t\mapsto s=t^2\) is strictly increasing on the
positive axis. \(P'(s)=8s+13>0\) there and \(P(0)=-2\).
The quadratic formula gives the sole positive root
\((\sqrt{201}-13)/8\). Evaluating at the squared endpoints
of \((1/3,2/5)\) gives \(-41/81,114/625\).
The decreasing \(L\) has the single root \(7/2\), bracketed
in \(t\) by \((9/5,2)\) with values \(13/25,-1\).
The two intervals are disjoint and ordered. Both roots are
simple. Thus the first pivot is always positive, the \(P\)
pivot turns positive at the lower endpoint, and the \(L\)
pivot turns negative at the upper endpoint. This proves the
inertia and positive semidefinite interval.

At \(t_-\) the four radical vectors are the second
congruence directions in A, B, C and D:
\[
 B_{14}-B_{18}-\frac{\rho}{3t}B_6,\quad B_{13}+B_{19},\quad
 B_{10}+B_{11},\quad B_{16}+B_{15}.
\]
At \(t_+\) they are the corresponding third directions:
\[
 B_{14}+B_{18}-\frac t2 B_6,\quad
 B_{13}-B_{19}-\frac t2 B_7,\quad
 \tfrac12(B_{10}-B_{11}+B_{17}),\quad
 \tfrac12(B_{16}-B_{15}+B_{12}).
\]
Each zero diagonal direction pairs to zero with an entire basis.
The four directions are independent because all the bases and
changes are invertible at the endpoints. The eight remaining
pivots are positive there. Hence these spans are exactly the
bilinear kernels, including their original-coordinate
representatives recorded in the JSON.

## Implementation and evidence boundary

I read the complete E199 generator. Its polynomial long division
strictly reduces the remainder degree with exact Fraction
arithmetic. Euclidean gcd and the leading coefficient give
reduced rational functions with a monic denominator, and zero
has denominator one. The symbolic elimination works over that
field. The selected fixed submatrix is checked separately,
including row order, and the final positive minor supplies the
pointwise rank statement independent of any intermediate pivot.
The generator verifies the Sylvester, starred inverse, full
Bianchi and skew residuals, the kernel free identity and
velocity, and the zero mixed blocks. It checks both the
congruence transformation and the Gram directly in the transformed
original coordinates. Its endpoint sign assertions record the
polynomials and brackets, while the root count and bilinear
radical dimension follow from the analytic argument. No floating
point result is used.

The separate verifier ran successfully with Python 3.10.0.
Alongside the 25-node global certificate it matched all seven
E187 eigenvalue tuples, pivot lists, kernel bases, full
restricted Gram matrices and inertias. In particular \(1/2,1\)
have \((12,0,0)\), while \(1/8,1/4,2,4,8\) have \((8,0,4)\).
A separate generator replay streamed to SHA-256 gave the
same E199 certificate digest. That replay is supplementary.
The independent proof uses no E199 or E187 generator routine.
[Independent verifier](../numerics/e201_axial_sign_verify.py).

The inherited E05 identity is the interpretation of this
derivative sign. This audit provides no stationary connection
realizing the arrays, spectral confinement to the axial family,
general pinching, flow preservation or new source theorem.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E201 request](../research-progress/handoffs/SP4-CME-E201_REQUEST_v1.md) | cfc7899aab7551c288e40ced50fed4683e93c678b028e5835a364aa78f33c7fc |
| [E199 proof](../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d |
| [E199 generator](../numerics/e199_axial_stationary_sign.py) | 015822bfcb450d58a023688dc0ae73651cb9e83e2f3ae73ca88fd1ba033c9862 |
| [E199 certificates](../numerics/e199_axial_stationary_sign_results.json) | df3af1193ad64823c132a8a39c429f0343aace80166772479c0d2614f2e7bead |
| [E199 return](../research-progress/handoffs/SP4-CME-E199_RETURN_v1.md) | 5506d9dd58de70f062f4e48a75683e5bec7854771e0e0b3d000d8183b946369e |
| [E187/E189 assessment](E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) | 65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40 |
| [E187 proof](../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md) | 6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4 |
| [E189 verifier](../numerics/e189_stationary_kernel_verify.py) | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |
| [E05 energy gap](../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [Nested B97](../brainstorm/notes/B97_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | 001d4b4b696bf9aecbc9ae28e370164281a03526d7540dddba605ae5bae7697c |
| [Nested E199 request](../research-progress/handoffs/SP4-CME-E199_REQUEST_v1.md) | 392a5807c62d5301c0ef6baeec43491afe7869853078d859abd221e4462d6998 |
| [Nested E187 generator](../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [Nested E187 certificates](../numerics/e187_stationary_kernel_results.json) | 0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad |
