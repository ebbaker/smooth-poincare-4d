# SP4-M2-E07 · Signed phase estimate at the marked pole

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [revision 1 request](../research-progress/handoffs/REQUEST_M2_PHASE_REPLAY_20261127.md) assigns a bounded GPT-6.2 Sol/ultra replay. Actual serving variant and effort are unavailable to this reader. Working tree based on \(\texttt{6a422ce7814f}\). Inspected the request (\(\texttt{0ec89354ac427c91}\)), [ZERO-B01](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md) (\(\texttt{70fe3a0850e0270b}\)), [ZERO-E01](../../investigations-2/02_zero_circles/notes/E01_FLAT.md) (\(\texttt{1a64cdcab9f95585}\)), [ZERO-E02](../../investigations-2/02_zero_circles/notes/E02_GATE_TABLE.md) (\(\texttt{11927731822e6546}\)) and [ZERO-E05](../../investigations-2/02_zero_circles/notes/E05_STRESS_GEOMETRY.md) (\(\texttt{659762ac184ac873}\)). Identifiers in parentheses are SHA-256 prefixes of the inputs read. The argument below is an independent paper replay of the proposed estimate. The endpoint box certificate is the separate E08 packet.

## Fourier law and the physical pole

Use the positively oriented Euclidean end chart of ZERO-E01, with positive compact normal coordinates reflected after inversion if necessary. In the bases \(E_i^\pm=(dx^0\wedge dx^i\pm dx^j\wedge dx^k)/\sqrt2\) for cyclic \(i,j,k\), \(T(\xi)\) is the real even orthogonal multiplier from flat minus to flat plus coefficients determined by closedness. Fix profile A of ZERO-B01 with its original probability bump \(\rho\), centres \(c_j\), weights \(w_j>0\) and graph \(tF I_3\), where \(t=-3/4\) at the endpoint and \(s=|t|\). On the punctured sphere the smooth representative is \(g=a^2(dx^0)^2+\sum_{i=1}^3(dx^i)^2\), \(a=(1+tF)/(1-tF)\), which is Euclidean near infinity. The chart and unit \(u=(1,1,1)/\sqrt3\) specify the leading form at the marked infinity pole. [Graph and normalization](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md) · [Closed symbol](../../investigations-2/02_zero_circles/notes/E01_FLAT.md#1-closed-symbol)

Let \(\nu\) be the probability Fourier measure of \(\prod_{k=0}^3h(x_k)\). The one-coordinate density is nonnegative and even by the fourth-convolution construction of \(h\), with total mass \(h(0)=1\). In particular \(\nu\) is absolutely continuous, with independent identically distributed even coordinates. Write
\[
Z(\xi)=\sum_jw_j e^{-ic_j\cdot\xi},\qquad
P_\rho(\xi)=\prod_{k=0}^3\int_{\mathbb R}e^{-iy\xi_k}\rho(y)\,dy,\qquad
H_x(\xi)=e^{ix\cdot\xi}Z(\xi)P_\rho(\xi).
\]
The factors of \(P_\rho\) are real with magnitude at most one. Define \(f=E_\nu H_x\), \(m=E_\nu H_x^2\) and \(B_x=E_\nu|H_x|^2\). Fourier inversion gives the following real quantities:
\[
\begin{aligned}
f&=F(x)=\sum_jw_j\prod_{k=0}^3(h*\rho)(x_k-c_{j,k}),\\
m&=\sum_{i,j}w_iw_j\prod_{k=0}^3(h*\rho*\rho)(2x_k-c_{i,k}-c_{j,k}),\\
0&\le m\le B_x\le E_\nu|Z|^2
=\sum_{i,j}w_iw_j\prod_{k=0}^3h(c_{i,k}-c_{j,k})=:b^2.
\end{aligned}
\]
Positivity of \(m\) uses nonnegative profile A weights and the nonnegative real convolutions. The doubled argument and sum of centres come from \(H_x^2\). The differences of centres come from \(|Z|^2\). Exact rational evaluation on the specified centres gives \(b^2=4403963/6150400\). At \(s=3/4\), \(v=sb\) satisfies \(v^2=39635667/98406400<(16/25)^2\).

For the actual normalized pole, let \(\psi\) denote its flat minus coefficients. The graph makes \(\psi\) smooth and compactly supported. The A1 leading expansion in the reflected end chart implies that the flat plus coefficients \(V\) tend to \(u\). The closed-symbol relation gives \(V=u+T\psi\): subtracting the right-hand side gives a closed flat self-dual form with harmonic coefficients, tending to zero by the pole expansion and the decay of \(T\psi\). Equivalently, one may use the ZERO-E01 compact-graph existence and uniqueness argument and the infinity normalization. Then \(V=u+tT(FV)\). The smooth compact support of \(\psi\) places it in the Fourier integral algebra. The Neumann expansion for \(V-u\) therefore converges uniformly since \(\|F\|_A\le b\) and \(v<1\), and it computes this actual pole. [A1 and normalized end](../../investigations-2/01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_02_03_MARKED_END_20261127.md) · [Physical identification and contraction](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md)

## Signed scalar and exchangeability

Let \(\xi_1,\ldots,\xi_n\) be independent draws from \(\nu\) and put \(S_j=\sum_{\ell=1}^j\xi_\ell\). Partial sums vanish with probability zero. Iterating the convolution for \(T(F\,\cdot)\), with multiplication nearest \(u\) indexed first, gives the \(n\)-th contribution to \(u^{\mathsf T}(V-u)\) as
\[
t^n E\!\left[A_n\prod_{\ell=1}^n H_x(\xi_\ell)\right],
\qquad A_n=u^{\mathsf T}T(S_n)\cdots T(S_1)u .
\]
Every \(A_n\) is real. Simultaneously replacing all frequencies by their negatives conjugates the product and preserves \(A_n\) and the joint law. Its contribution is therefore exactly \(t^n E[A_nY_n]\) with \(Y_n=\Re\prod_\ell H_x(\xi_\ell)\). The moment identity
\[
E Y_n^2=\frac{B_x^n+m^n}{2}
\]
follows from \(2(\Re z)^2=|z|^2+\Re z^2\) and independence. These identities retain each signed Fourier phase up to the Cauchy–Schwarz step.

For \(n=1\), write \(q=\xi_1/|\xi_1|\), \(\alpha=E q_0^4\) and \(\beta=E(q_0^2q_1^2)\). Signs and coordinate permutations preserve the law of \(q\). The ZERO-E01 rotation numerator yields
\[
A_1=q_0^2-\tfrac13(q_1^2+q_2^2+q_3^2)
 +\tfrac43(q_1q_2+q_1q_3+q_2q_3).
\]
The diagonal expectations cancel and the mixed expectations vanish, so \(E A_1=0\). The diagonal square contributes \(4\alpha/3-4\beta/3\), the mixed square contributes \(16\beta/3\), and their product is odd in at least one coordinate. The identity \(4\alpha+12\beta=E|q|^4=1\) gives \(E A_1^2=1/3\). Thus subtracting \(E Y_1=f\) costs nothing and gives
\[
|E[A_1Y_1]|\le\frac1{\sqrt3}
\sqrt{\frac{B_x+m}{2}-f^2}
\le\frac1{\sqrt3}\sqrt{\frac{b^2+m}{2}-f^2}.
\]
This exact first moment computation uses the stated equal-coordinate \(u\) and the tensor symmetry. It needs no assumption of uniform angular distribution on \(S^3\).

For \(n\ge2\), exchange \(\xi_1,\xi_2\). The product of the \(H_x\) factors, each \(S_j\) with \(j\ge2\) and the joint law remain the same. One can replace \(A_n\) inside \(E[A_nY_n]\) by
\[
\bar A_n
=u^{\mathsf T}T(S_n)\cdots T(S_2)
\frac{T(\xi_1)+T(\xi_2)}2\,u .
\]
Orthogonality of the common product bounds its absolute square by \(\left|\frac12(T(\xi_1)+T(\xi_2))u\right|^2\). Since \(E T(\xi)=0\) by the same signs and coordinate permutations, the independent vectors \(T(\xi_1)u,T(\xi_2)u\) have mean zero and unit norm, so the expectation of the latter square is exactly \(1/2\). This bound on \(E\bar A_n^2\) does not require independence of \(\bar A_n\) and \(Y_n\). Cauchy–Schwarz gives \(|E[\bar A_nY_n]|\le \frac12\sqrt{b^{2n}+m^n}\). With \(0\le m/b^2\le1\) and \(v<1\), sum over \(n\ge2\) to obtain
\[
\boxed{\quad |u^{\mathsf T}(V-u)|\ \le\ 
R(x):=\frac{s}{\sqrt3}\sqrt{\frac{b^2+m}{2}-f^2}
+\frac{v^2}{2(1-v)}\sqrt{1+(m/b^2)^2}\quad .}
\]

## Lower bound and scope

The graph coefficient \(V_i\) multiplies \(E_i^++tF E_i^-\). In the \(g\)-orthonormal coframe \((a\,dx^0,dx^1,dx^2,dx^3)\) this combination is \(1-tF\) times its unit self-dual basis vector. It follows that
\[
|\omega_u(x)|_g=(1-tF(x))|V(x)|
\ge (1-tF(x))\max\{0,1-R(x)\}.
\]
At \(t=-3/4\), \(F\ge0\) and the metric factor \(1+sF\) is at least one. Multiplication by the positive pointwise conformal norm factor on the punctured sphere preserves nonvanishing. A verified upper bound \(R<1\) at every finite point proves zero-freeness for this one coefficient at the original infinity pole. The proof may be combined with the existing all-direction exterior bound and a verified compact-core certificate. A witnessed coefficient need not make the full evaluation map invertible and does not provide a second pole or a result for other smooth classes. The entry and Yamabe premises for this specific endpoint carry the separate ZERO-E05 evidence. [Exterior estimate](../../investigations-2/02_zero_circles/brainstorm/notes/B03_ENERGY_AND_REMAINING_CORE.md) · [Endpoint geometry](../../investigations-2/02_zero_circles/notes/E05_STRESS_GEOMETRY.md)
