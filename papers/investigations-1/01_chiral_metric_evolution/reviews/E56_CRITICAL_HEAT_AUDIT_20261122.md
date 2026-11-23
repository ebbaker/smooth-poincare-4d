# SP4-CME-E56 — Focused audit of the finite-p flat heat estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. Consumed [E53][e53] at SHA-256 `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312`, matching the [frozen request][req]. This audit recalculates the embedding and evolution on the real, volume-one flat \(\mathbb T^4\), at \(p=8\), \(s=1/2\), with the full weak gradient. No external primary theorem or new source is used.

**Verdict.** The embedding, weak-gradient completion, damped heat estimate and trace conclusions pass. No hidden normalization, integrability or completeness premise was found in this scope. The strong initial trace for a general specified force is in \(B^{1/2}_{8,1}\) and hence uniform in space. The graph-norm initial trace in E53 concerns the homogeneous term. [E53][e53].

## Dyadic and inverse-derivative checks

The partial multiplier sum is \(\chi(2^{-N}k)\) through block \(N\), which converges to one on each lattice frequency. For positive blocks the support is between \(2^{j-1}\) and \(2^{j+1}\), with zero at both ends. Consequently blocks at distance two or more have zero product, including block zero against blocks \(j\ge2\). These observations give distributional reconstruction and bounded overlap. Periodization of \(2^{4j}\check m(2^j x)\) gives the multiplier \(m(2^{-j}k)\): unfolding over the lattice gives its Fourier coefficient, with no extra factor for the specified torus volume and \(2\pi\) convention. The \(L^1\) bound follows by unfolding the absolute integral. The \(L^\infty\) bound follows by summing the Schwartz decay, with exponent greater than four, on the lattice translates of a centered cube. Thus

\[
 \|K_{j,m}\|_r\lesssim 2^{4j(1-1/r)},\qquad
 \|D^\beta\Delta_j U\|_\infty\lesssim
             2^{(|\beta|+1/2)j}\|\Delta_j U\|_8.
\]

The second bound uses \(r=8/7\) and a cutoff equal to one on the already localized block. Its constants use a finite number of symbol derivatives on fixed supports. The positive smoothness weights give absolute reconstruction in \(L^8\). Blockwise \(L^8\) limits and Fatou show completeness. Truncating the block series gives a finite trigonometric polynomial, and applying each block to its tail gives an error bounded by the weighted summable tail because overlapping weights are comparable. In particular the \(s=1/2\) embedding into \(C^0\) follows by summing the zero-derivative estimate uniformly.

For \(j\ge1\) the inverse derivative multiplier on gradient component \(i\) is \(2^{-j}\varphi(2^{-j}k)(2^{-j}k_i)/(2\pi i|2^{-j}k|^2)\). Multiplying by the derivative multiplier \(2\pi i k_i\) and summing over \(i\) leaves \(\varphi(2^{-j}k)\) at each nonzero frequency, with zero at the origin. The inverse derivative therefore contributes \(2^{-j}\), and the weighted block estimates for an arbitrary split of the full tensor \(f=DU=f_2+f_8\) give

\[
 2^{j/2}\|\Delta_j U\|_8\lesssim
      2^{j/2-j+3j/2}\|f_2\|_2 +2^{j/2-j}\|f_8\|_8.
\]

The first kernel gain uses \(1+1/8=1/2+5/8\), so \(r=8/5\), and the second uses \(r=1\). The split is taken before the multiplier is applied to these tensors. Since the component multipliers act on arbitrary tensors, the split has no gradient constraint. Factoring \(2^j\) gives \(2^jK(t_j,f)\) with \(t_j=2^{-3j/2}\) and \(t_j^{-2/3}=2^j\). For \(t_j\le t\le t_{j-1}\), monotonicity of \(K\) and \((t/t_j)^{-2/3}\ge1/2\) bound each sampled term by its interval integral up to a universal factor, since the logarithmic interval length is \((3/2)\log2\).

For \(\mu(v)=|\{|f|>v\}|\), the tensor layer \(f/|f|\,1_{\{|f|>v\}}\) has \(L^2,L^8\) norms \(\mu^{1/2},\mu^{1/8}\). Assign it to the smaller cost and integrate in \(v\). The strongly measurable split layers are integrable in their assigned spaces for fixed \(t>0\) because \(\min(\mu^{1/2},t\mu^{1/8})\le t^{2/3}\mu^{1/4}\). The resulting tensors sum to \(f\) by the layer identity in \(L^1\), and Minkowski bounds \(K(t,f)\) by the integrated cost. For nonzero \(\mu\) the crossover is \(t=\mu^{3/8}\). Integrating the weighted cost below and above it gives

\[
 \int_0^\infty t^{-2/3}\min(\mu^{1/2},t\mu^{1/8})\,\frac{dt}{t}
       =\bigl(3+\tfrac32\bigr)\mu^{1/4}.
\]

Tonelli and \(\|f\|_{4,1}=4\int_0^\infty\mu(v)^{1/4}\,dv\) therefore give the integral upper bound \((9/8)\|f\|_{4,1}\). Estimating the low block in \(L^8\) gives (4) of E53, with its stated value term. [E53, (1)–(4)][e53].

## Weak graph and uniform representative

The exact norm identity comes from writing \(s^{-3/4}=1+\frac34\int_s^1r^{-7/4}\,dr\) and using Tonelli. With \(F_f(r)=\sup_{|E|=r}\int_E |f|\), this gives \(\|f\|_{4,1}=F_f(1)+\frac34\int_0^1r^{-7/4}F_f(r)\,dr\). The supremum formula uses the nonatomic volume measure. It gives the triangle inequality and, by averaging translates, contraction of normalized positive convolutions. The \(L^1\)-Lipschitz continuity of \(F_f(r)\) at each \(r\) and Fatou make this norm complete: an \(L^{4,1}\)-Cauchy sequence first converges in \(L^1\), after which the norm of its difference to the limit is bounded by the liminf of its difference norms. A Cauchy pair of fields and gradients therefore passes the distributional derivative identity to the limits in \(L^8\) and \(L^{4,1}\).

For density, the rearrangement of the amplitude tail is bounded by \(f^*\) on a shrinking interval of length \(\mu(N)\), proving its norm tends to zero. For bounded tensors, positive periodic mollification converges in \(L^1\), and the rearrangement weight is integrable against the common sup bound. Markov's inequality gives the pointwise convergence to zero of the difference rearrangements for every positive rearrangement parameter. Thus mollification converges also in \(L^{4,1}\). Truncation and contraction give the claim for general tensors. Simultaneous spatial mollification of a weak field and its gradient commutes with differentiation, proving density in the closed graph. The embedding applies to these approximations and gives convergence in \(B^{1/2}_{8,1}\) and in the sup norm. The resulting continuous representative is unique because it agrees with the \(L^8\) field almost everywhere on the torus. [E53, completion following (4)][e53].

## Damped Duhamel estimate and path trace

For \(j\ge1\) put \(q_j=2^{2j}\). The derivative bounds for \(\psi(\zeta)e^{-4\pi^2q_jt|\zeta|^2}\) on the fixed annulus have a polynomial in \(q_jt\) multiplying an exponential in \(-q_jt\). The polynomial is absorbed by reducing the exponential rate. The periodized \(L^1\) kernel estimate then gives \(Ce^{-c q_j t}\) on \(\Delta_jU\). At \(j=0\) the finitely many modes all decay at least as \(e^{-t}\); their coefficient norms are bounded by the \(L^1\) norm of the block, hence its \(L^8\) norm. This handles \(q_0=1\) and includes the constant mode. The damping is essential to a uniform-in-\(T\) bound for the full path norm since an undamped constant would contribute \(T\) to its second sum.

Since the heat and blocks commute, writing \(d_j(t)=\|\Delta_j U(t)\|_8\) gives directly

\[
 d_j(t)\lesssim e^{-cq_jt}\|\Delta_j U_0\|_8
    +\int_0^t e^{-cq_j(t-s)}\|\Delta_j f(s)\|_8\,ds.
\]

Take the time supremum at each block and also integrate after multiplication by \(q_j\). In the source term the inner integral in \(t\) from \(s\) to \(T\) is bounded by \(1/c\), including when \(T=\infty\). Summing with \(2^{j/2}\) gives both sums in \(E_T\) with the same source and datum norms. The supremum in the first sum is inside the block sum, as claimed. The bounded heat multipliers and dense polynomials imply strong semigroup continuity in \(B^{1/2}_{8,1}\). The source integral is Bochner continuous by dominated convergence and is bounded near zero by \(C\int_0^t\|f(s)\|_{B^{1/2}_{8,1}}ds\). This proves the specified strong Besov and uniform trace. For the homogeneous solution with graph datum, the periodized positive heat kernel is also an approximate identity on both graph components, and commutation with the gradient gives the stronger graph trace stated in E53.

For the finite-\(E_T\), blockwise-continuous class, the first sum bounds the sup Besov norm and makes the time-continuous tails uniformly small. An \(E_T\)-Cauchy sequence has a continuous Besov limit, and Fatou applied to the blockwise difference norms and integrated norms gives convergence in \(E_T\). Thus the stated path class is complete. Each Fourier mode of a distributional solution with the same strong trace satisfies the time equation \(U_k'+(1+4\pi^2|k|^2)U_k=f_k\) on \((0,T)\). Its integrating-factor solution and the strong slice trace determine it uniquely, including at \(k=0\). This justifies uniqueness in the stated class. Smooth finite-frequency approximations of the data and the Bochner source converge by the same uniform estimate, which also gives the distributional equation for the integral solution.

Finally the Bernstein exponent at order two is \(2+1/2=5/2\). The second sum in \(E_T\) controls the sum of \(L^1_t C_x^0\) norms of the Hessian blocks. Tonelli gives absolute uniform convergence of the spatial derivatives through order two at almost every time. The derivative series also converges in \(L^1_t C_x^0\), identifying the weak Hessian and proving the stated time-integrated sup estimate. These conclusions use the fixed flat multiplier and the specified source norm. [E53, (5)–(7)][e53].

[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[req]: ../research-progress/handoffs/SP4-CME-E56_REQUEST_v1.md
