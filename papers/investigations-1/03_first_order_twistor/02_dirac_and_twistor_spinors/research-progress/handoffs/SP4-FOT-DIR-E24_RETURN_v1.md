# SP4-FOT-DIR-E24 · Sharp total fourth-energy loss per unit degree · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Fixed E routing in the request was
gpt-6.2-sol / ultra. Actual helper and selected lead model identifiers
and reasoning efforts were unavailable for independent verification.
[Request v1](SP4-FOT-DIR-E24_REQUEST_v1.md) · [Owning register](../REGISTER.md) ·
[Technical note](../../notes/DIR_E24_20261124.md).

**Completed.** HEAD was f178fbb604f7f972b639fa8c1fc05f649c9bc8fc
and all eight frozen working-tree digests matched. For the fixed closed
oriented Riemannian domain and smooth sphere-valued strong $W^{1,2}$
limit $F$, with $V=\operatorname{Vol}(S^4)=8\pi^2/3$,

\[
 \liminf_j E_4(f_j) \ge E_4(F)+16V|1-\deg F|,
 \qquad E_4(f)=\int_M |df|_{\mathrm{HS}}^4\,dV_g.
\]

Along a subsequence of bounded fourth energy, $U_j=df_j-dF$
satisfies $\int |U_j|^3\le\|U_j\|_2\|U_j\|_4^2\to0$, which
controls the cubic mixed terms of both expansions. Keeping
the unit normal $f_j$ in the pure determinant permits orthogonal
projection of $U_j$ onto $f_j^\perp$ and the bound
$|\det(f_j,U_j(e_1),\dots,U_j(e_4))|\le |U_j|^4/16$.
The fourth norm splits off $E_4(F)$ with error $o(1)$.

For the E15 balanced recovery at a supplied Yamabe equality metric,
the limit energy is $\lambda_1^2+16V(1-\deg F)$ in all three cases.
Each inverse-stereographic core contributes $16V+o(1)$, both
transition derivatives are bounded for $\rho=\sqrt\epsilon$, and
the exact balance correction changes the fourth energy by
$O(\rho^4)$ times the bounded uncorrected energy. The zero-degree
example requires a supplied degree-zero first eigenmap. The round
reflection with two insertions gives the degree-$-1$ case at
$48V=128\pi^2$ and proves sharpness of the per-unit constant
$16V=128\pi^2/3$.

With a balanced near-zero sequence on a supplied unit-volume
Yamabe minimizer of a homotopy four-sphere,
$\liminf E_4(f_j)<\lambda_1^2+16V$ gives a subsequence with an
orientation-preserving homothetic diffeomorphism as its limit.
A degree-$-1$ limit also recognizes the smooth sphere and costs
two degrees. The total inequality leaves arbitrary atom
quantization for separate analysis. The direct source checks
were Listing's §1 and Theorem 3 (6), PDF p. 4, and Talenti's
opening Theorem and eqs. (1)–(3), printed p. 353.
[Listing](https://home.mathematik.uni-freiburg.de/mlisting/scalar_symmetric.pdf#page=4) ·
[Talenti](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf#page=1).
