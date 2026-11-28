# A uniform lower bound for the pole triple on profile A

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. SP4-M2-B06, working tree based on `6a422ce`. The lead's precise serving variant and effort are unavailable. The bounded reviews used gpt-6.2-sol/ultra dispatches. Inputs are the original [metric, charts, weights and mollifier](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md), [flat transfer symbol](../../investigations-2/02_zero_circles/notes/E01_FLAT.md), [gate table](../../investigations-2/02_zero_circles/notes/E02_GATE_TABLE.md) and [same-metric geometry](../../investigations-2/02_zero_circles/notes/E05_STRESS_GEOMETRY.md).

**Project theorem.** Keep the marked infinity pole on the standard oriented smooth four-sphere. In the chart and coefficient basis of ZERO-B01, for every $-3/4\le t\le0$ the pole evaluations of profile A satisfy
$$
 \inf_{x\in\mathbb R^4,\ |u|=1}|\omega_{t,u}(x)|_{g_t}\ \ge\ 1/100 .
$$
Here $g_t=a^2dx_0^2+|dy|^2$, $a=(1+tF)/(1-tF)$, is the asymptotically Euclidean representative. The leading coefficient has Euclidean norm one. Every nonzero linear combination of the three forms is zero-free at this pole. At $t=-3/4$ the prior geometry certificate on this very class gives $Y>2.21$ and $0.00590\le E_+/(4\pi^2)\le1.00731$. The uniform assertion in $t$ above concerns pole evaluations. The geometry certificate quoted here concerns the endpoint.

## From the pole equation to symmetric Fourier integrals

Use the positive Euclidean end orientation of ZERO and $E_i^\pm=(dx^{0i}\pm dx^{jk})/\sqrt2$. A reflection after inversion from positive compact coordinates gives this chart. The graph of the physical self-dual space has minus coefficients $tF$ times its plus coefficients. For a unit leading $u$, write the plus field $V_tu=u+T\psi$ and the minus field $\psi=tF(u+T\psi)$, using the Euclidean isometric multiplier $T(\xi)=N(\xi)/|\xi|^2$ of [ZERO-E01, §1](../../investigations-2/02_zero_circles/notes/E01_FLAT.md). This is the A1 pole solution. Indeed its minus field is smooth and supported on the graph perturbation. The difference between its plus correction and $T\psi$ is flat, closed and self-dual, has harmonic coefficients and tends to zero. It vanishes. The Fourier integral norm of the graph is at most $v=|t|b<1$, so the equation has a unique Neumann series there. The physical norm is $(1-tF)|V_tu|$ by the orthonormal coframe. Positivity of $F$ gives $1-tF\ge1$ on the specified negative segment.

Let $P(x)=\prod_{k=0}^3 h(x_k)$ be the **unmollified** tensor product of the cubic spline of ZERO-B01, and $\nu$ its probability Fourier measure. Our convention is $P(x)=\int e^{ix\cdot\xi}d\nu(\xi)$. Each coordinate of $\xi$ is independent with even density $(3/(4\pi))\operatorname{sinc}^4(\xi_i/2)$, since $h$ is $3/2$ times the fourth convolution of the centred unit interval indicator, with $h(0)=1$. Write $c_j$ and $w_j$ for the five specified centres and positive weights $(16,8,4,2,1)/31$. The multiplier of the actual mollifier is $R(\xi)=\prod_k\int \cos(\xi_k z)\rho(z)dz$. At a fixed spatial point define
$$
 H_x(\xi)=e^{ix\cdot\xi}R(\xi)\sum_jw_je^{-ic_j\cdot\xi},\quad
 f=\mathbb E H_x=F(x),\quad m=\mathbb E H_x^2.
$$
Both $f$ and $m$ are real and nonnegative. In particular, $m=\sum_{i,j}w_iw_j\prod_k(h*\rho*\rho)(2x_k-c_{i,k}-c_{j,k})$. This uses the square of $H_x$, not its absolute square. By the translation second moment of ZERO-B01,
$$
 m\le\mathbb E|H_x|^2\le b^2=\sum_{i,j}w_iw_jP(c_i-c_j)=4403963/6150400.
$$

For independent increments $X_j\sim\nu$, put $S_j=X_1+\cdots+X_j$. The $n$th correction to $u^{\mathsf T}V_t(x)u$ is
$$
 t^n\mathbb E\left[\operatorname{Re}\!\left(\prod_{j=1}^n H_x(X_j)\right)
             u^{\mathsf T}T(S_n)\cdots T(S_1)u\right].
$$
Successive convolutions by the graph and applications of the Fourier multiplier give this order of partial sums. Negating every frequency conjugates the scalar factor and preserves each real $T$. The zero-frequency sets have measure zero. Absolute convergence follows from $v<1$.

## The angular and spatial estimates

For $G=u^{\mathsf T}T(X_1)u$, sign changes and coordinate permutations give $\mathbb E T(X_1)=0$. Let $k$ bound $\mathbb E G^2$. For the balanced direction $u=(1,1,1)/\sqrt3$, $k=1/3$. Uniformly on the entire unit sphere one can use $k=4/5$. Here is a finite proof. Write $q=X_1/|X_1|$, $\beta=\mathbb E(q_0^2q_1^2)$. In the symbol, the skew part drops out of $G$, leaving $2(q_0^2+(u\cdot q_{1:3})^2)-1$. Squaring and using sign symmetries, together with $4\mathbb E q_0^4+12\beta=1$, gives
$$
 \mathbb E G^2=8\beta+(1-24\beta)\sum_{i=1}^3 u_i^4.
$$
The endpoints of $\sum u_i^4\in[1/3,1]$ give $1/3$ and $1-16\beta$. On the positive absolute-frequency interval $[0,4]$ the density is at least $(21/44)(1-z^2/24)^4$, by $\sin y\ge y-y^3/6$ on $[0,2]$ and $\pi<22/7$. The latter bound also follows by integrating $x^4(1-x)^4/(1+x^2)$ on $[0,1]$, which gives $22/7-\pi>0$. Divide $[0,4]$ into sixteen equal intervals. Bound their probabilities below by width times this density at the upper endpoint. On the four-dimensional bin indexed by $i,j,k',l\in\{0,\ldots,15\}$, the angular ratio $q_0^2q_1^2$ is at least
$$
 (ij)^2/((i+1)^2+(j+1)^2+(k'+1)^2+(l+1)^2)^2.
$$
Summing only these positive contributions and rounding all factors down at scale $10^8$ gives $\beta>1/80$. The [integer verifier](../numerics/check_marked_direction.py) includes this sum. Thus $k=4/5$ suffices in all directions.

For $n=1$, subtract $f$ from $\operatorname{Re}H_x$ using $\mathbb EG=0$. Cauchy–Schwarz bounds the correction by $s\sqrt{k((b^2+m)/2-f^2)}$, $s=|t|$. For $n\ge2$, exchange $X_1,X_2$. The scalar product of the $H_x$ and every $S_j$ for $j\ge2$ stay fixed. In the expectation the rightmost vector can therefore be replaced by $(T(X_1)+T(X_2))u/2$. Its mean squared norm is $1/2$, since $T$ is orthogonal, the increments are independent and $\mathbb E T=0$. Orthogonal transport by the remaining factors and scalar projection cannot increase that norm. No independence between the angle and scalar factors is needed for Cauchy–Schwarz. Independence of the $X_j$ gives
$$
 \mathbb E\left(\operatorname{Re}\prod H_x(X_j)\right)^2
 \le (b^{2n}+m^n)/2 .
$$
Consequently the $n$th absolute contribution is bounded by $v^n\sqrt{1+(m/b^2)^n}/2$. Since $0\le m\le b^2$, summing for $n\ge2$ proves
$$
 |u^{\mathsf T}(V_t(x)-I)u|\le
 s\sqrt{k\big((b^2+m)/2-f^2\big)}
 +\frac{s^2}{2(1-sb)}\sqrt{b^4+m^2}.
 \tag{1}
$$
The bound increases with $s$ up to $3/4$. Keeping the real phase in (1) is essential to this certificate. With spatial information discarded, even the balanced-direction test loses its sign at the endpoint. [Earlier estimate and failure](../reviews/E05_DIRECTIONAL_ESTIMATE_20261127.md)

## Exact certificate at the endpoint

Only two scalar convolutions need spatial bounds in (1). No pole equation is discretized. For a box of centre $z$ and half-width $w$, the lower bound for $f$ replaces each factor by $h(|z_k-c_{i,k}|+w+1/64)$. The upper bound for $m$ replaces each factor by $h((|2z_k-c_{i,k}-c_{j,k}|-2w-2/64)_+)$. The cubic is even and decreasing in absolute distance. These bounds integrate the original probability mollifier by its support. Outside $[-2,2]^4$ we have $m=0$ and $f\ge0$ because each centre coordinate is at most $4/5$ and the support of $h*\rho*\rho$ is contained in $[-2-2/64,2+2/64]$. Only the vanishing of $m$ is used there.

The [checker](../numerics/check_marked_direction.py) splits a box into all sixteen children whenever its upper bound exceeds $99/100$. It represents coordinates exactly with denominator 15360, evaluates the spline by integer cubic polynomials, rounds $f$ down and $m,b^2,b$ and square roots up. Every leaf satisfies the target. The accepted bound is uniform over the continuum in the box and over directions.

| Angular moment used | Tested boxes | Exterior correction upper bound | Uniform lower bound for the projection |
| --- | ---: | ---: | ---: |
| $1/3$, balanced direction | 4,929 | 0.810307 | 0.010038 |
| $4/5$, all directions | 427,505 | 0.952599 | 0.010000 |

Run `python3 papers/master-2/numerics/check_marked_direction.py` from the repository root. For the all-direction pass the leaf counts at depths $2$ through $9$ are $240,152,1176,6018,23434,72138,170588,127040$. Their normalized four-volumes sum to the root volume. For a real unit $u$, $|V_tu|\ge u^{\mathsf T}V_tu\ge1/100$ even though $V_t$ need not be symmetric. The physical factor $1-tF\ge1$ completes the proof. At the marked end the limiting norm is one.

The earlier finest-grid minimum 0.938061107 was a periodic diagnostic. The lower bound above certifies the sign, without estimating the true minimum to the precision of that diagnostic. Combined with the original table it settles the prescribed pole on every sampled class. It neither supplies a conformal gauge on a general manifold nor bounds a Fourier norm by chiral energy. [Original fixed-chart obstruction](../../investigations-2/02_zero_circles/brainstorm/notes/B03_ENERGY_AND_REMAINING_CORE.md)


**Verification.** Independent readers checked the [phase argument](../reviews/E07_PHASE_ARGUMENT_20261127.md), [balanced boxes](../reviews/E08_BOX_CERTIFICATE_20261127.md), [angular moment](../reviews/E09_ANGULAR_MOMENT_20261127.md), and [all-direction theorem with independently implemented box arithmetic](../reviews/E10_UNIFORM_REPLAY_20261127.md). The independent full calculation needed 427,489 boxes under its rounding convention and recovered the same $1/100$ global lower bound. The finite certificates and the replayed mathematical argument have [separate formal obligations](../research-progress/handoffs/TO_FORMALIZATION_MARKED_DIRECTION_20261127.md).
