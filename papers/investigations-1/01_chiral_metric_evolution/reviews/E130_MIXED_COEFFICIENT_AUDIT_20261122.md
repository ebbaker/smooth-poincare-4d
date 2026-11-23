# E130 — Audit of the mixed coefficient bound and third weighted jet

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E53 and E42, and checked E57's use in the E60 construction in E64. I did not author E57, E119 or E128. E121 was my selected source reinspection, separate from the E119 proof audit. Independence here concerns E128's new multiplication and third-jet arguments. [Request][req], [E128 derivation][e128], [B66][b66], [return and hashes][ret].

**Pass at the requested analytic scope.** The mixed critical product estimate holds for arbitrary coefficient arrays with the stated weighted bounds and arbitrary defect paths in the stipulated class. No equation for those arrays or paths is used. The third weighted background jet follows from the already assessed uniform mixed derivatives of total order four. I found no missing analytic premise or mathematical correction to E128. The geometry of E125 and any endpoint evolution estimate are outside this audit. [E128 request][req128], [E128 return][ret128], [E119/E122 assessment][a119].

## Exact norms, coefficient blocks and truncated time splits

Fix the four-dimensional volume-one torus charts, \(p=8\), \(s=1/2\), \(\lambda_j=2^j\), and the E53 inhomogeneous partition with \(j\ge0\). In the local calculation write \(q_k=\Delta_kq\), \(M_k=\sup_{0<t\le T}\|q_k(t)\|_8\), and \(I_k=\int_0^T\|q_k(t)\|_8\,dt\). The path cost is the sum of \(\lambda_k^sM_k+\lambda_k^{s+2}I_k\). The source \(F=L^1_t B^s_{8,1}\) has the blockwise \(L^1_t L^8\) sum with weights \(\lambda_\ell^s\), by Tonelli. Take \(0<T\le1\). [E53, inhomogeneous decomposition][e53], [E57 (2)][e57].

Let \(A\) have \(|\partial^m A|\le\epsilon t^{-m/2}\) for \(0\le m\le3\) in a fixed chart. Write \(b\) for either \(B\) or \(C\), with \(|\partial^m b|\le\epsilon t^{-(m+1)/2}\) for \(0\le m\le2\). In either case we may absorb fixed chart constants in \(C\epsilon\). The sum of the low block and all high blocks through \(j\) telescopes to \(\chi(2^{-j}\cdot)\), with bounded \(L^\infty\) operator norm independent of \(j\) by the periodized kernel bound. The enlarged block cutoff in E53 gives
\(\|\partial^d q_k\|_8\le C\lambda_k^d\|q_k\|_8\), including \(k=0\). For \(j\ge1\), divide the annular block symbol by a finite sum of pure derivative symbols using
\[
 \varphi(\xi)=\sum_i m_i(\xi)(2\pi i\xi_i)^m,\qquad
 m_i(\xi)=
 \frac{\varphi(\xi)\overline{(2\pi i\xi_i)^m}}
      {\sum_l |(2\pi i\xi_l)^m|^2}.
\]
The denominator is nonzero on the annulus and the symbols extend smoothly by zero off support. Their rescaled convolution kernels have uniformly bounded \(L^1\) norm. Using \(m=3\) for \(A\) and \(m=2\) for \(b\), and also the zero-order estimates, gives
\[
 \|A_j(t)\|_\infty\le C\epsilon\min(1,\lambda_j^{-3}t^{-3/2}),\qquad
 \|b_j(t)\|_\infty\le C\epsilon\min(t^{-1/2},\lambda_j^{-2}t^{-3/2}).
 \tag{1}
\]
These are spatial multiplier estimates only. [E53, periodized kernels][e53], [E128 (1)][e128].

With \(a_j=\lambda_j^{-2}\), integration on \((0,\min(T,a_j)]\) gives costs \(C\epsilon a_j\) and \(2C\epsilon a_j^{1/2}\), respectively. If \(a_j<T\), the integrals after \(a_j\) are bounded by \(2C\epsilon\lambda_j^{-3}a_j^{-1/2}\) and \(2C\epsilon\lambda_j^{-2}a_j^{-1/2}\). If \(a_j\ge T\) there is no later interval, and the same early bounds apply. Thus
\[
 \|A_j\|_{L^1_t L^\infty}\le C\epsilon\lambda_j^{-2},\qquad
 \|b_j\|_{L^1_t L^\infty}\le C\epsilon\lambda_j^{-1}.
 \tag{2}
\]
For \(j=0\), the undifferentiated terms give \(C\epsilon T\) and \(2C\epsilon\sqrt T\), bounded by the right sides of (2) since \(\lambda_0=1\). This checks both the low mode and the requested horizon independence. [E128 (2)][e128].

## Every input interaction and output range

Fix a gap \(L\ge4\). The high block is supported at radii between \(\lambda_j/2\) and \(2\lambda_j\) for \(j\ge1\), the low block in a fixed ball. For separated indices the product has frequencies comparable to the larger scale by the triangle and reverse triangle inequalities. For comparable indices it is supported in a ball of radius a fixed multiple of the larger scale. All output projectors are bounded on \(L^8\), so in the separated case the sum of possible output weights is \(C\lambda_{\max(j,k)}^s\), and for comparable inputs the same bound follows from \(\sum_{\ell\le\max(j,k)+O(1)}\lambda_\ell^s\le C\lambda_{\max(j,k)}^s\). The latter uses \(s>0\) and includes the constant output. The three cases cover all \(j,k\ge0\). [E53, support conventions][e53], [E128, three product cases][e128].

- **Low coefficient, high defect.** Sum coefficients with \(j\le k-L\) before taking norms. The single partial-sum multiplier costs \(C\epsilon\) for \(A\) and \(C\epsilon t^{-1/2}\) for \(b\). This avoids counting \(k\) low blocks separately. For \(A\partial^dq\), \(0\le d\le2\), the block contribution is \(C\epsilon\lambda_k^{s+d}I_k\le C\epsilon\lambda_k^{s+2}I_k\). For \(b\partial^dq\), \(0\le d\le1\), split the integral at \(a_k\), clipped at \(T\). The early part uses \(M_k\) and \(\int_0^{\min(T,a_k)}t^{-1/2}\,dt\le2\lambda_k^{-1}\). The later part uses \(t^{-1/2}\le\lambda_k\) and \(I_k\), if it exists. Before the output weight this gives \(C\epsilon(2\lambda_k^{d-1}M_k+\lambda_k^{d+1}I_k)\), dominated by \(C\epsilon(M_k+\lambda_k^2 I_k)\). This time estimate also holds at \(k=0\), with no later part for \(T\le1\).
- **High coefficient, low defect.** Let \(m=2\) for \(A\), \(m=1\) for \(b\). For \(j\ge k+L\), (2) and \(M_k\) give cost \(C\epsilon\lambda_j^{s-m}\lambda_k^d M_k\). The \(j\) sum is bounded by
  \[
   C\epsilon\lambda_k^s M_k\,\lambda_k^{d-m}
                \sum_{j\ge k+L}2^{-(m-s)(j-k)} .
  \]
  The gaps \(m-s=3/2,1/2\) are strictly positive and \(d-m\le0\). This covers \(k=0\).
- **Comparable inputs.** For \(|j-k|<L\), sum every admissible output weight, including arbitrarily low output, as above. There are only \(2L-1\) possible coefficient indices for each \(k\). Use \(C\epsilon\) for \(A_j\) with \(I_k\), and \(C\epsilon t^{-1/2}\) for \(b_j\) with the same clipped time split on \(k\). This gives the previous \(H\) cost for \(A\) and \(M+H\) cost for \(b\) regardless of output cancellation in frequency.

Therefore \(\|A\partial^d q\|_F\le C\epsilon E_T(q)\) for \(d\le2\) and \(\|b\partial^d q\|_F\le C\epsilon E_T(q)\) for \(d\le1\). One can justify the decomposition first for \(q\) a spatial Fourier polynomial. For this \(q\), (2) also gives absolute convergence of the reconstructed coefficient series in \(L^1_tL^\infty\), including its low block, and its value agrees with the given coefficient by distributional Fourier reconstruction. The above pairwise estimates, with the low-coefficient sums grouped, identify the product in \(F\). Subsequent spatial truncation of \(q\) needs no convergence in the weighted coefficient derivative norm. This removes any requirement of differentiability in time or a coefficient equation. [E128 (3)–(5)][e128].

## Fixed atlas, density in the path class and source identification

Use the E57 partition pieces \(q_{a,{\rm in}}=(\eta_a q)_a\), and zero-extended outer pieces \(q_a=(\rho_a q)_a\) with \(\rho_a=1\) near \(\operatorname{supp}\eta_a\). Within that neighborhood the actual derivatives are the derivatives of the outer pieces in the fixed frames. The fixed product derivative expands
\[
 Dq=\partial q+\gamma q,\qquad
 D^2q=\partial^2q+L_1(x)\partial q+L_0(x)q .
\]
The second includes the fixed base Christoffels on the first derivative slot. Hence the localized \(A\) terms require ordinary orders \(0,1,2\), and the localized \(B,C\) terms orders at most \(1,0\), respectively. The frame and coefficient multipliers are fixed and smooth. Derivatives of them only replace a higher coefficient derivative by a lower one, which is allowed with the stated weights because \(t\le1\). Thus all localized hypotheses persist with fixed constants. Coefficients are extended by zero after localization with \(\eta_a\), so there is no chart boundary contribution. [E57, cutoffs and fixed derivative conventions][e57], [E128, compact localization][e128].

In the outer piece, reconstruct \(q=\sum_b \rho_b q_{b,{\rm in}}\) in its source charts and express in chart \(a\). Every overlap operator is composition with a fixed transition multiplied by a fixed smooth compactly supported matrix and cutoffs. Its \(L^8\) bound follows by change of variables, and \(W^{4,8}\) by differentiating it in the fixed overlaps. For an input block \(j\), Bernstein gives cost \(C\lambda_j^4\) in \(W^{4,8}\). For \(k\ge1\), the fourth-order divided annular symbol yields \(C\lambda_k^{-4}\) from \(W^{4,8}\). Combining with the \(L^8\) bound gives \(C\min(1,2^{4(j-k)})\), with just \(C\) at output \(k=0\). The weighted sum at either exponent \(\sigma=s\) or \(s+2\) splits as
\[
 \sum_{0\le k\le j}2^{\sigma k}
 +\sum_{k>j}2^{\sigma k}2^{-4(k-j)}
 \le C_\sigma 2^{\sigma j}.
\]
Both \(\sigma>0\) and \(4-\sigma>0\) hold at \(1/2,5/2\). The estimates commute with taking the time supremum of each input contribution or integrating its norm, so \(\sum_a E_T(q_a)\le C E_T(q)\) with the specified chart norm. Summing the localized product estimates gives (6) of E128. [E57 (2)–(3)][e57].

For completeness, the local \(E_T\) norm controls uniform \(B^s\) convergence and \(L^1_tB^{s+2}\) convergence. The local traced class is complete by the blockwise bounds and Fatou, and the global class is its bounded reconstruction projection range, since localization followed by reconstruction is the identity on a global section. Fourier partial sums of each inner piece approximate in both path norms by finite block overlap and the \(\ell^1\) tails. Reconstruct through the same cutoffs and transitions. In the strongly traced class the finitely many mode coefficients remaining are continuous on \([0,T]\), so smooth time approximation uniformly in each coefficient gives \(E_T\) convergence for a fixed truncation. The error at \(t=0\) is measured in the strong \(B^s\) trace, since its norm is bounded by the \(M_T\) error. In a merely strongly measurable path class only the spatial approximation is asserted, with no smooth time-density claim. [E53, completeness and Fourier truncation][e53], [E57, trace and reconstruction][e57].

The completed source is the Banach space \(L^1_t\mathcal B^s\), by the local Besov completeness and bounded reconstruction. The estimate extends for fixed coefficients with such approximations. On any positive time strip, convergence of \(q\) in \(L^1_t\mathcal B^{s+2}\) entails convergence of its fixed derivatives through order two in \(L^1_tL^8\), by the local block derivative bounds and reconstruction. The coefficient values are bounded there. This identifies the limit with the actual product in distributions on the strip. Applying the same estimate to coefficient differences gives continuity for their corresponding weighted norm completions. Such limits identify the coefficients on positive strips by local uniform convergence. Coefficients need no trace at zero and no time-cutoff approximation in their weighted supremum norms. These checks justify the extension at the stated analytic scope. [E128, completed spaces][e128].

## Assessed uniform parameter derivatives and ordered third jet

Use E119's fixed E42 map \(\mathsf S\), time \(\mathcal T\le1\), and \(X_{\mathcal T}^{\circ}\) completion. For \(r=\sqrt t\le\sqrt{\mathcal T/4}\) the scale-local lift is
\(\Psi_r(s,u)=\mathcal T_{r,s}\mathsf S(u)\), where \(z(\tau)=r\eta(\tau/r^2)s\) and transport is by the fixed connection. E119 (10) explicitly bounds all distributions of parameter and datum derivatives with total order at most four. In particular \((|\alpha|,j)=(3,1)\) is inside that result on the same fixed balls. A check of the only singular coefficients gives the same source estimate: a speed coefficient \(r^{-1}\eta'(\tau/r^2)\sum s_i b_i(z,x)\) stays on \([r^2/2,2r^2]\); each derivative of \(b_i\) in \(s\) introduces \(r\eta\), and at most one derivative strikes the explicit \(s_i\). The same holds for the speed's value term. Hence through three derivatives the amplitude is bounded by \(C/r\) on the same band. Upper cylinders meeting it have radii comparable to \(r\); in tents its time length is at most \(Cr^2\). The E119 \(Y_1\) and \(Y_0\) bounds for a coefficient with this amplitude are \(C\) and \(Cr\), respectively, and E119's gradient and value products use them unchanged. No added smallness radius or inversion is needed. That proof uses the same fixed Neumann inverse on the E42 spaces. [E119 (7)–(10)][e119], [E119/E122 assessment][a119], [E42, completed product estimates][e42].

Since \(\Psi_r(s,0)=0\), integrate \(D_u\partial_s^\alpha\Psi_r(s,\theta u)[u]\) for \(0\le\theta\le1\). This gives \(\|\partial_s^\alpha\Psi_r(s,u)\|_{X_{\mathcal T}^{\circ}}\le C\|u\|_\infty\) for \(0\le|\alpha|\le3\), uniformly in \(r\). Evaluation at a time-space point is bounded by the \(X\) supremum term. For a direction \(a\) in parameter space, at \(t=r^2\) the curve is the time-\(r\lambda\) flow of \(V=V_a\) for scalar \(\lambda\), with transport along that flow. The \(k\)-th derivative at \(\lambda=0\) evaluates \(r^kD_V^k Z_0\) for \(Z_0=\mathsf S(u)(r^2)\). At every fixed \(r>0\) a local inverse to the four independent spanning directions gives the relevant spatial smoothness, and the bounds only need evaluation at zero parameter. The pointwise spanning map has a uniformly bounded right inverse by compactness of the base. Thus a unit \(X\) can be realized as \(V_a(x)\) with \(|a|\le C\). [E119, parameter extraction][e119], [E128 (7)–(8)][e128].

Use the convention that the first Hessian slot is the differentiation slot. Let \(W=\nabla^0_V V\). The second direction derivative is \(D_V^2Z_0=D^2Z_0(V,V)+D_WZ_0\). Differentiating its two terms in order gives
\[
 D_V^3Z_0=D^3Z_0(V,V,V)+D^2Z_0(W,V)
                  +2D^2Z_0(V,W)+D_{\nabla^0_V W}Z_0 .
\]
Indeed the derivative of \(D^2Z_0(V,V)\) inserts one \(W\) in each Hessian slot, while the derivative of \(D_WZ_0\) contributes the ordered \(D^2Z_0(V,W)\) again. For bounded \(a\), \(W\) and \(\nabla^0_V W\) are bounded using the fixed smooth fields. Multiplying by \(r^3\), their two- and one-derivative terms are controlled by the lower weighted estimates because \(r\le1\). Uniform diagonal cubic contraction bounds recover the fully symmetric third derivative by polarization.

To recover the entire ordered tensor, let \(\mathcal R_D\) be the curvature of \(D\) and \(R^0\) the base curvature, with the usual commutator sign \(D_XD_Y-D_YD_X-D_{[X,Y]}\). Torsion-freeness gives the first-two swap by commuting on \(DZ_0\), which has an extra covector slot:
\[
 D^3Z_0(X,Y,Z)-D^3Z_0(Y,X,Z)
     =\mathcal R_D(X,Y)D_ZZ_0-D_{R^0(X,Y)Z}Z_0 .
\]
The last-two swap is the derivative of the antisymmetric Hessian:
\[
 D^3Z_0(X,Y,Z)-D^3Z_0(X,Z,Y)
   =(D_X\mathcal R_D)(Y,Z)Z_0+\mathcal R_D(Y,Z)D_XZ_0 .
\]
Here \(D_X\mathcal R_D\) differentiates the endomorphism and both covector slots. These adjacent swaps generate all permutations. All fixed curvature and first-curvature-derivative bounds remain finite on the compact reference. Every difference from the full symmetrization is therefore \(O(|DZ_0|+|Z_0|)\) in unit directions. With the factor \(r^3\) the lower weighted estimates control it. This verifies
\[
 \sup_{0<t\le\mathcal T/4}
 \sum_{k=0}^3 t^{k/2}\|D^k\mathsf S(u)(t)\|_\infty\le C\|u\|_\infty.
\]
The argument is linear in the datum size and uses one datum derivative. A quadratic remainder through spatial order three would require a different mixed order, outside the claim. [E128 (8)–(9)][e128], [E119 (10)][e119].

## Coefficient chain rules

Let \(\delta=\|u\|_\infty\) on the fixed small ball and \(U=\mathsf S(u)\). For a smooth \(A(x,U)\) with \(A(x,0)=0\), covariant differentiation at fixed value in the \(x\) variable preserves the vanishing at \(U=0\). Any chain-rule term with no differentiated \(U\) is therefore \(O(\delta)\), using the bounded value derivatives on a fixed tube. Terms containing differentiated \(U\) are bounded by products of \(\delta t^{-k_i/2}\) with \(\sum k_i\le m\) at spatial order \(m\le3\). Thus they are bounded by \(C\delta t^{-m/2}\) using \(\delta\le1\) and \(t\le1\). This accounts for fixed-frame and connection derivatives as bounded lower terms.

For \(b=b_0(x,U)+b_1(x,U)[DU]\), use the same rule on \(b_0(x,0)=0\). In the affine summand each Leibniz term retains a differentiated \(U\) factor from the explicit \(DU\) slot or its derivatives, and the total differentiated order is at most \(m+1\). At \(m=2\) the maximal-order term is \(b_1(x,U)[D^3U]\). The combined time cost of every product is at most \(t^{-(m+1)/2}\). At least one factor supplies \(\delta\), which gives \(C\delta t^{-(m+1)/2}\) for both \(B\) and \(C\) through \(m=2\). Fixed derivative changes add lower orders on the same tube. These are the weighted hypotheses in the mixed product estimate, with constants for the specified coefficient maps. This concludes the analytic audit without any geometric application or new external premise. [E128, coefficient corollary][e128].

[req]: ../research-progress/handoffs/SP4-CME-E130_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E130_RETURN_v1.md
[req128]: ../research-progress/handoffs/SP4-CME-E128_REQUEST_v1.md
[ret128]: ../research-progress/handoffs/SP4-CME-E128_RETURN_v1.md
[b66]: ../brainstorm/notes/B66_MIXED_DEFECT_PRODUCT_TEST_20261122.md
[e128]: ../notes/128_MIXED_PARABOLIC_COEFFICIENT_PRODUCTS_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e57]: ../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e119]: ../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[a119]: E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md
