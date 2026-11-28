# SP4-M2-E08 · Continuum box certificate at the marked pole

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen revision 1 request](../research-progress/handoffs/REQUEST_M2_PHASE_REPLAY_20261127.md) specifies a bounded GPT-6.2 Sol/ultra reader. Actual serving variant and effort were unavailable. Base `6a422ce7814fe1ad278d6904970e3b19b05a9890`. SHA-256 prefixes of the reviewed inputs are `0ec89354ac427c91` (request), `70fe3a0850e0270b` ([ZERO-B01](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md)), `fd77bfc318afea4e` ([E07 phase replay](E07_PHASE_ARGUMENT_20261127.md)) and `4e7a6d0ac61ae9c6` (initial [endpoint checker](../numerics/check_marked_direction.py)). The parameterized checker at `27c62d0f63e925b3` reproduced the same bound on its $1/3$ moment path. This replay concerns that path.

**Certificate and replayed project deduction.** At $t=-3/4$ on the original profile A, the pole form at $p=\infty$ with unit incoming coefficient $u=(1,1,1)/\sqrt3$ has $u^{\mathsf T}V\ge 10038/10^6$ on the entire marked chart. Here $V$ denotes its flat plus coefficients in the positively oriented Euclidean end basis, as in E07. Its physical norm for the asymptotically Euclidean representative is at least the same bound, since $1-tF=1+(3/4)F\ge1$. The smooth compactified metric on the punctured sphere preserves nonvanishing. The bound gives a witness for this one entered class at its original pole. The geometry $Y>2.21$ and $e/T\le1.00731<2$ is a separate interval result for the same smooth exact profile. [Physical identification](E07_PHASE_ARGUMENT_20261127.md#fourier-law-and-the-physical-pole) · [ZERO-E05 geometry](../../investigations-2/02_zero_circles/notes/E05_STRESS_GEOMETRY.md)

## Box enclosure for the original mollifier

Write $s=3/4$, $f=F(x)$ and $m=E_\nu H_x^2$ in the notation of E07. The two arguments are
$$
\begin{aligned}
f &= \sum_j w_j\prod_{k=0}^3(h*\rho)(x_k-c_{j,k}),\\
m &= \sum_{i,j} w_i w_j\prod_{k=0}^3
    (h*\rho*\rho)(2x_k-c_{i,k}-c_{j,k}).
\end{aligned}
$$
In the second expression the sum is over ordered pairs. The canonical program counts each off-diagonal pair twice and each diagonal pair once. The positive weights are $w_j=(16,8,4,2,1)_j/31$. The auxiliary moment bound $m\le b^2$, with $b^2=4403963/6150400$, follows from $|E_\nu H_x^2|\le E_\nu|H_x|^2\le E_\nu|Z|^2$, where $Z$ is the translation factor. Both $f$ and $m$ are real and nonnegative by the convolution expressions. The doubled coordinate and summed centres come from squaring $H_x$, whereas the computation of $b^2$ uses centre differences.

The even cubic $h$ is nonnegative and decreases in the absolute argument on its support. On $[0,1]$ the derivative is $-3r+(9/4)r^2$. On $[1,2]$ it is $-(3/4)(2-r)^2$. A probability average of $h$ over displacements in $[-1/64,1/64]$ is bounded by its extrema on the enlarged interval. For the second convolution the displacements are supported in $[-2/64,2/64]$ and still have total mass one. Thus a box of centre $a$ and half-width $r$ gives a lower factor $h(|a_k-c_{j,k}|+r+1/64)$ for each factor of $f$. It gives an upper factor $h(\max\{0,|2a_k-c_{i,k}-c_{j,k}|-2r-2/64\})$ for each factor of $m$. Nonnegativity allows multiplication of the lower or upper factors and weighted summation, followed by taking the minimum of the two upper bounds for $m$. This applies to the given smooth mollifier without quadrature or profile replacement.

The root box is $[-2,2]^4$, and $m(x)=0$ whenever any $|x_k|\ge2$. In that coordinate the support of the second convolution shifted by the sum of centres satisfies $|2x_k|\le 2+2(4/5)+2/64=581/160<4$. The exterior estimate uses $f\ge0$. For example $f(0,0,0,2)>0.00388$ by the same rational lower bound at a single point, even though $m(0,0,0,2)=0$.

## Arithmetic and coverage

At $s=3/4$ the E07 correction bound can be written as
$$
R(x)=s\sqrt{\frac{(b^2+m)/2-f^2}{3}}
     +\frac{s^2}{2(1-sb)}\sqrt{b^4+m^2}.
$$
On each box, use a lower bound on $f$ and an upper bound on $m$. Over $f,m\ge0$ these substitutions increase the radicands or hold them fixed. The variance radicand is nonnegative by the moment inequality and was checked in both arithmetic implementations. An upward enclosure of $b^2$ and a positive upward enclosure of $b$ also increase the bound as long as $sb<1$.

The canonical checker uses coordinate denominator $D=15360$ and output scale $Q=10^6$. The spline cubics at a nonnegative grid argument $z/D$ have common denominator $4D^3$, and the lower $f$ is rounded down after positive weighted summation. The upper $m$ is rounded up before intersecting with the independently rounded upper $b^2$. The bounds on $b^2,b$ are $716045/Q,846195/Q$, verified by exact fractions and squaring. Write $L=Q f_{\mathrm{lo}}$, $M=Q m_{\mathrm{hi}}$, $B_2=716045$, $B=846195$ and $N=Q(B_2+M)-2L^2$. Then the scaled first term before integer upper rounding is $(3/4)\sqrt{N/6}$. The scaled tail before rounding is $9Q\sqrt{B_2^2+M^2}/[8(4Q-3B)]$. The code rounds the root arguments and roots upwards, and rounds positive outer quotients upwards. The denominator $4Q-3B=1461415$ is positive.

Each failed box is split at its midpoint in all four coordinates. Its sixteen closed children cover it, and their interiors are disjoint. The leaf count gives a separate volume check. Every tested leaf in the root was accepted at depth at most six, before the cap at ten. The maximum of accepted leaf bounds and the exterior bound controls the whole chart, including all box interfaces.

I reran the canonical code (Python 3.10.0, arm64). A separate exact replay used Python fractions, the full ordered pair sum for $b^2$ and $m$, endpoint interval dilation in each coordinate, and breadth-first subdivision. It evaluated each radicand as an exact rational, with $b$ and the two square roots enclosed upwards at $10^{-12}$ by integer square roots and comparison of squares. This implementation retained exact rational profile bounds instead of rounding $f,m,b^2$ to the canonical scale. Both runs tested 4,929 boxes and retained 4,621 leaves. The respective depth counts were $240,237,217,1223,2704$ at depths two through six. Their normalized volumes sum exactly to one.

| Replay | Exterior upper bound on $R$ | Global upper bound on $R$ | Global lower bound on $u^{\mathsf T}V$ |
| --- | ---: | ---: | ---: |
| Canonical checker | 0.810307 | 0.989962 | 0.010038 |
| Independent rational replay | 0.810305151610 | 0.989960262988 | 0.010039737012 |

The same worst accepted box occurred in both runs, $[0,1/8]\times[0,1/8]\times[1/8,1/4]\times[0,1/8]$. Its canonical $f_{\mathrm{lo}}$ and $m_{\mathrm{hi}}$ are $0.692736$ and $0.716045$. Independent one-point checks at its centre and at the origin gave respective correction upper bounds $0.867598293445$ and $0.837236760019$, with strict positivity of $f$ at both. The point $(2,2,2,2)$ admits the same $m=0$ exterior bound directly.

The certificate supplies the existential witness missing in the dated [E02 comparison](E02_ZEROS_AND_LAST_CIRCLE_20261127.md) for this one profile and parameter. A conclusion about the infimum over all directions, other poles or all entered classes requires its own argument. The frozen replay comprises an exact finite computation and the paper derivation of its applicability.
