# SP4-CME-E116 — Lorentz norms of the initial round annular strain

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E112. This is a calculation continuation using its frozen annular estimates. [Request][req], [B62][b62], [return and input hashes][ret].

## Actual round input and distribution bounds

Use E112's closed smooth oriented round Riemannian \(S^4\), positive chiral adjoint bundle \(E\), negative-Killing internal metric, and native round metric \(G\) of sectional curvature \(1/2\). Write \(D_0\) for the induced reference connection on \(\operatorname{Sym}^2_0 E\), extended to base slots as needed. In E112's fixed normal ball at \(p\), \(\rho=d_G(p,\cdot)\) is the radius, and \(M\) is a symmetric trace-free endomorphism of norm one extended by radial parallel transport. The smooth unweighted connection atom \(a^{(r)}\) and its attained round defect \(q^{(r)}=DQ_{A_0}(a^{(r)})\) are supported in the annulus \(r<\rho<2r\), with zero extension through its collars. The estimates of E112 give
\[
 q^{(r)}=2f(\rho/r)M+e^{(r)},\qquad
 f(u)=\chi(u)+\tfrac14u\chi'(u),\qquad
 |D_0e^{(r)}|\le C r,\qquad |D_0M|\le C r
 \quad(r<\rho<2r).
 \tag{1}
\]
Here \(\chi\in C_c^\infty((1,2))\) is fixed, nonnegative and nonzero. The errors and all norms in (1) use the actual reference connections and native metric. [E112, (4)–(5)][e112].

For the unweighted strain \(T^{(r)}=\tfrac12D_0q^{(r)}\),
\[
 T^{(r)}=\frac{f'(\rho/r)}{r}\,d\rho\otimes M
           + f(\rho/r) D_0M+\tfrac12 D_0e^{(r)} .
 \tag{2}
\]
The last two terms have actual norm at most \(C_1r\). The leading tensor has norm \(|f'(\rho/r)|/r\) since the distance covector \(d\rho\) has native norm one on the annulus and parallel transport preserves \(|M|=1\). There is a closed interval \([u_-,u_+]\subset(1,2)\) of positive length on which \(|f'|\ge m>0\). Indeed \(u^3 f(u)=\tfrac14(u^4\chi(u))'\) implies that identically zero \(f\) would force \(u^4\chi(u)\) constant and hence zero. A nonzero smooth function compactly supported in \((1,2)\) has a nonzero derivative somewhere, which gives the stated interval by continuity.

Take the fixed ratio \(R>2\) from the E112 heat estimates and, before choosing \(N\), shrink the allowed ball scale \(\sigma\) so that \(C_1\sigma^2\le m/2\). The E112 choices remain valid on this smaller scale, because every geometric error bound and every heat-window requirement there holds for all sufficiently small \(\sigma\) with that fixed \(R\). From (2) we obtain constants \(L=m/2>0\) and \(U\ge L\), independent of \(r\le\sigma\), so that
\[
 \begin{split}
 &|T^{(r)}|\ge L/r \quad \text{on } B_r=\{u_-r<\rho<u_+r\},\\
 &|T^{(r)}|\le U/r \quad \text{on } A_r=\{r<\rho<2r\},
           \qquad T^{(r)}=0\quad\text{off } A_r.
 \end{split}
 \tag{3}
\]
In native normal coordinates, \(dV_G=(1+O(\rho^2))\,dx\). On the fixed ball its density has finite upper and positive lower bounds, so there are \(v,V>0\) such that \(\operatorname{Vol}_G(B_r)\ge v r^4\) and \(\operatorname{Vol}_G(A_r)\le V r^4\). This follows by scaling the fixed Euclidean radial regions. The upper estimate uses the entire smooth annulus, including any collar where the actual strain vanishes.

Set \(\delta_N=N^{-1/2}\), \(r_k=\sigma R^{-k}\), and \(a_N=\delta_N\sum_{k=1}^N a^{(r_k)}\) as in E112. The actual initial linearized strain is \(T_N(0)=\delta_N\sum_{k=1}^N T^{(r_k)}\). The annuli are disjoint, so on \(A_{r_k}\) its norm is exactly \(\delta_N|T^{(r_k)}|\). With \(g_N=|T_N(0)|_G\) and \(\mu_N(\lambda)=\operatorname{Vol}_G\{g_N>\lambda\}\), (3) implies the full distribution bounds for every \(\lambda\ge0\),
\[
 v\sum_{k=1}^N r_k^4\,\mathbf 1_{\{\lambda<L\delta_N/r_k\}}
 \ \le\ \mu_N(\lambda)
 \ \le\ V\sum_{k=1}^N r_k^4\,\mathbf 1_{\{\lambda<U\delta_N/r_k\}}.
 \tag{4}
\]
Both sums use the strict superlevel convention. The positive-measure lower regions are disjoint and lie inside the actual supports.

## Rearrangement convention and its exact distribution factors

For a bounded nonnegative measurable \(g\) on \(S^4\), let \(\mu_g(\lambda)=\operatorname{Vol}_G\{g>\lambda\}\), and \(g^*(s)=\inf\{\lambda\ge0:\mu_g(\lambda)\le s\}\) for \(s>0\), extended by zero above the whole volume. Right continuity of \(\mu_g\) follows from monotone convergence for the indicators \(\mathbf 1_{\{g>\lambda'\}}\) as \(\lambda'\) decreases to \(\lambda\). If \(s\ge\mu_g(\lambda)\), the infimum defining \(g^*(s)\) is at most \(\lambda\). If \(0<s<\mu_g(\lambda)\), right continuity gives \(\mu_g(\lambda+\epsilon)>s\) for some \(\epsilon>0\), so monotonicity gives \(g^*(s)\ge\lambda+\epsilon\). Consequently \(g^*(s)>\lambda\) exactly when \(0<s<\mu_g(\lambda)\). For \(1\le q<\infty\), insert the layer formula \((g^*(s))^q=q\int_0^{g^*(s)}\lambda^{q-1}\,d\lambda\) and exchange nonnegative integrals,
\[
 \begin{split}
 \|g\|_{(4,q)}^q
   &:=\int_0^\infty s^{q/4-1}(g^*(s))^q\,ds\\
   &=q\int_0^\infty \lambda^{q-1}
                   \int_0^{\mu_g(\lambda)}s^{q/4-1}\,ds\,d\lambda
     =4\int_0^\infty \lambda^{q-1}\mu_g(\lambda)^{q/4}\,d\lambda\\
   &=4\int_0^\infty\big(\lambda\mu_g(\lambda)^{1/4}\big)^q
                         \,\frac{d\lambda}{\lambda}.
 \end{split}
 \tag{5}
\]
In particular \(\|g\|_{(4,1)}=4\int_0^\infty\mu_g(\lambda)^{1/4}\,d\lambda\) with the exact factor four. At \(q=4\), (5) equals the usual fourth-power \(L^4(dV_G)\) layer formula.

For the weak convention,
\[
 \|g\|_{(4,\infty)}:=\sup_{s>0}s^{1/4}g^*(s)
                 =\sup_{\lambda>0}\lambda\mu_g(\lambda)^{1/4}.
 \tag{6}
\]
In fact for \(s<\mu_g(\lambda)\), \(s^{1/4} g^*(s)\ge s^{1/4}\lambda\). Let \(s\) increase to \(\mu_g(\lambda)>0\) to prove one bound. For \(0<\lambda<g^*(s)\) one has \(\mu_g(\lambda)>s\). Let \(\lambda\) increase to \(g^*(s)>0\) to prove the other bound. Zero terms do not affect either supremum. The tensor Lorentz norm below is defined by applying (5) or (6) to its native pointwise norm.

## Summation across the level bands

For the upper estimate set \(U_k=U\delta_N/r_k\) and \(U_0=0\). For \(\lambda\in[U_{k-1},U_k)\) with \(1\le k\le N\), (4) gives the geometric sum
\[
 \mu_N(\lambda)\le V\sum_{j=k}^N r_j^4
             \le C_{\rm vol}\,r_k^4,\qquad
 C_{\rm vol}=\frac{V}{1-R^{-4}} .
 \tag{7}
\]
Thus the lowest band includes all support volumes with the same upper bound at \(k=1\), and the bands closer to the highest level include only the corresponding smaller annuli. At every \(\lambda\ge U_N\), \(\mu_N(\lambda)=0\). Integrating on each band by (5) gives
\[
 \|T_N(0)\|_{(4,q)}^q
   \le \frac4q C_{\rm vol}^{q/4}
       \sum_{k=1}^N r_k^q(U_k^q-U_{k-1}^q)
   \le \frac4q C_{\rm vol}^{q/4}U^q\delta_N^q N.
 \tag{8}
\]
The integral on the lowest band is finite since \(q>0\). Equations (6)–(7) also give \(\|T_N(0)\|_{(4,\infty)}\le C_{\rm vol}^{1/4}U\delta_N\).

For the lower estimate, put \(L_k=L\delta_N/r_k\). The \(N\) level bands \([L_k/4,L_k/2]\) are disjoint because \(L_{k+1}/L_k=R>2\). Throughout the \(k\)-th band, \(\mu_N(\lambda)\ge v r_k^4\) by (4). Keeping these bands in (5) yields
\[
 \|T_N(0)\|_{(4,q)}^q
   \ge \frac4q v^{q/4}\sum_{k=1}^N r_k^q
                 \big((L_k/2)^q-(L_k/4)^q\big)
   =\frac4q\,v^{q/4}L^q(2^{-q}-4^{-q})\delta_N^q N.
 \tag{9}
\]
At any \(\lambda=L_k/2\), (6) gives a weak lower bound \(v^{1/4}L\delta_N/2\). In particular
\[
 c_q\delta_N N^{1/q}\le \|T_N(0)\|_{(4,q)}
       \le C_q\delta_N N^{1/q}\quad (1\le q<\infty),\qquad
 c\delta_N\le \|T_N(0)\|_{(4,\infty)}\le C\delta_N .
 \tag{10}
\]
The constants may depend on the fixed finite \(q\), the round geometry, the cutoff, \(R\) and \(\sigma\), and are independent of \(N\).

## Consequence for the round linearized derivative integral

For the same fixed \(R\) and the smaller fixed \(\sigma\), the E112 proof gives
\[
 I_N:=\int_0^\infty\|D_0T_N(\tau)\|_\infty\,d\tau
      \ge c\,\delta_N N .
 \tag{11}
\]
The lower bound already comes from the \(N\) disjoint positive native-time windows of E112. The integrand uses the full covariant Hessian of \(q_N/2\), and the time integral is finite for each \(N\). For finite \(q>1\), (10)–(11) give \(I_N/\|T_N(0)\|_{(4,q)}\ge c_q' N^{1-1/q}\). For \(q=\infty\) the ratio is at least \(c'N\). Thus no uniform linear estimate of this derivative integral by the initial \(L^{4,q}\) strain can hold for \(1<q\le\infty\) on the tested round linearized data. This also holds for the entire \(J_{\rm lin}\), which includes the nonnegative squared-strain integral. At \(q=1\), the lower-bound quantity in (11) and the initial Lorentz norm both have order \(\delta_N N\). The argument leaves an upper budget estimate at \(q=1\) open. All trajectory assertions here are about the actual round linearization. [E112, (1) and disjoint native-time windows][e112].

[req]: ../research-progress/handoffs/SP4-CME-E116_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E116_RETURN_v1.md
[b62]: ../brainstorm/notes/B62_LINEARIZATION_TEST_AND_LORENTZ_THRESHOLD_20261122.md
[e112]: 112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
