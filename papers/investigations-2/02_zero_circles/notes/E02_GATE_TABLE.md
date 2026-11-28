# E02 gate table for the marked infinity pole

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. For [request revision 1](../research-progress/handoffs/REQUEST_E02_GATE_20261127.md)
the dispatch selected gpt-6.2-sol/ultra. The helper has no separate serving
telemetry. Inputs were
the working tree based on `6a422ce`, the
[E01 solver](../numerics/e01_fourier.py) (`41dd56e89d718435`),
its [validation](E01_FLAT.md) (`1a64cdcab9f95585`),
the [B01 profiles and bounds](../brainstorm/notes/B01_GATE_SCOPE.md)
(`70fe3a0850e0270bf`), and the [independent replay](../reviews/B01_REPLAY.md)
(`e9d9528261a3bd98`). Identifiers in parentheses are SHA-256 prefixes.

**Setting.** The smooth oriented standard sphere has the single specified
marked pole $p$ at infinity. The unit leading coefficients are in its
oriented Euclidean self-dual basis. Minimum norms use the Riemannian
asymptotically Euclidean representative $g=a^2dx_0^2+|dy|^2$ and include
the limiting value 1. Chiral energy uses the Hilbert–Schmidt curvature
operator convention and $T=4\pi^2$. $Y$ is the Yamabe constant of the
smooth compactified conformal class.

## Numerical diagnostics

**Heuristic.** The floating-point diagnostics describe the computed
periodic grids and the midpoint energy estimates.

The centered odd grids have period 8 in each coordinate and spacing
$8/n$. The primary grid has $n=17$. The three stress cases use a second
grid with $n=25$. The same E01 solve takes all three columns with the
periodic zero mode set to zero. The residual is the discrete $L^2$ graph
defect relative to the forcing. The zero-amplitude residual is set to zero.

The one-dimensional convolution and its first two derivatives use
64-point Gauss–Legendre quadrature on each subinterval of the rescaled
mollifier support, split where the cubic argument meets a breakpoint
of $h$. The normalized mollifier mass uses the same order on its full
support. Tensor products and the prescribed translates give $F$,
$\nabla_yF$, and $D_y^2F$. The energy estimate is the grid midpoint
sum with weight $(8/n)^4$ of
$|(D_y^2a)_0|^2/(16\pi^2a)$ against $dx$. All curvature support lies
strictly inside the box. The sampled minimum is the least singular value
of $(1-tF)V$ over grid nodes, also including 1 at the end. At a given node
the singular value minimizes over the entire unit sphere of directions.

| Profile | $t$ | $n$ | Relative residual | Estimated $e/T$ | Sampled minimum $d_{\rm grid}$ | Certified upper bound for $|d_{\rm grid}-m_\omega|$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| A | $0$ | 17 | 0 | 0.000000000 | 1.000000000 | 0.000000 |
| A | $-1/4$ | 17 | $3.909\,10^{-12}$ | 0.024941784 | 0.979536257 | 0.247846 |
| A | $1/4$ | 17 | $3.909\,10^{-12}$ | 0.040834810 | 0.795871167 | 0.218970 |
| A | $-5/16$ | 17 | $1.776\,10^{-12}$ | 0.037059796 | 0.974498295 | 0.334000 |
| A | $5/16$ | 17 | $1.776\,10^{-12}$ | 0.068963373 | 0.746460741 | 0.275333 |
| A | $-33/64$ | 17 | $4.259\,10^{-12}$ | 0.086706809 | 0.958310089 | 0.732365 |
| A | $-33/64$ | 25 | $5.813\,10^{-12}$ | 0.083945399 | 0.956864515 | 0.730919 |
| A | $-3/4$ | 17 | $6.003\,10^{-12}$ | 0.156931902 | 0.939929503 | 0.939930 |
| A | $-3/4$ | 25 | $8.850\,10^{-12}$ | 0.152340516 | 0.938061107 | 0.938062 |
| B | $0$ | 17 | 0 | 0.000000000 | 1.000000000 | 0.000000 |
| B | $-1/4$ | 17 | $2.198\,10^{-12}$ | 0.006075815 | 0.982217393 | 0.203809 |
| B | $1/4$ | 17 | $2.198\,10^{-12}$ | 0.007683308 | 0.904795809 | 0.126387 |
| B | $-5/16$ | 17 | $1.378\,10^{-12}$ | 0.009247252 | 0.977830568 | 0.254820 |
| B | $5/16$ | 17 | $1.378\,10^{-12}$ | 0.012407584 | 0.881227557 | 0.158217 |
| B | $3/4$ | 17 | $3.115\,10^{-12}$ | 0.092816010 | 0.718419620 | 0.383193 |
| B | $3/4$ | 25 | $5.484\,10^{-12}$ | 0.089675321 | 0.710453984 | 0.375227 |

All sampled singular minima were positive. The change of sampled minimum
from $n=17$ to $25$ has magnitude $0.001446$, $0.001868$, and $0.007966$
on A at $-33/64$, A at $-3/4$, and B at $3/4$, respectively. These
resolution differences are diagnostics. The residual measures periodic
iteration alone, and the E01 calibration applies to its own comparison
family. The error column here instead uses the continuum enclosure
$[L,1]$ below, taking $\max(|d_{\rm grid}-L|,|d_{\rm grid}-1|)$ for the
displayed estimate and rounding up.

## Continuum enclosures from B01

**Certificate.** For nonzero center offsets $c_j$ set
$h_j=h(|c_j|)$. The exact rational calculation
\[
 b^2=\left(w_0+\sum_{j=1}^4w_jh_j\right)^2+
       \sum_{j=1}^4 w_j^2(1-h_j^2)
\]
gives $b_A^2=4403963/6150400$ and $b_B^2=54360023/276768000$.
For each row, $b_+$ is the rational upper bound
$10^{-9}(1+\lfloor10^9\sqrt{b^2}\rfloor)$, evaluated by integer square
root. Use $v=|t|b_+$, $m=(1-v)/(1+v)$, $d=1-v$ and
$D=14|t|/d^2+9t^2/d^3$, with $d=1$ for negative A. The B01 lower minimum
estimate is $d\max(0,(1-2v)/(1-v))$, rounded down to $L$. Since
$3<\pi$ and $\sqrt6<5/2$, a lower bound for the Yamabe test
$K=(48\pi/\sqrt6)m-2D$ is $K_L=(288/5)m-2D$, rounded down. If $K_L>0$,
$Y\ge\sqrt m K_L>0$. The energy enclosure is $[0,U]$ with
$U=D^2/(144m)$ rounded up. All rounding in these bounds is rational.

| Profile | $t$ | Enclosure for $m_\omega$ | $K_L$ | Yamabe sign by B01 | Upper bound $U$ for $e/T$ |
| --- | ---: | ---: | ---: | --- | ---: |
| A, B | $0$ | $[1.000000,1]$ | 57.600000 | Positive | 0.000000 |
| A | $-1/4$ | $[0.731691,1]$ | 29.359918 | Positive | 0.176113 |
| A | $1/4$ | $[0.576902,1]$ | 23.929426 | Positive | 0.490201 |
| A | $-5/16$ | $[0.640499,1]$ | 23.000019 | Positive | 0.329518 |
| A | $5/16$ | $[0.471128,1]$ | 12.918886 | Positive | 1.265092 |
| A | $-33/64$ | $[0.225946,1]$ | 3.381880 | Positive | 1.634722 |
| A | $-3/4$ | $[0.000000,1]$ | $-18.251018$ | Inconclusive | 7.524988 |
| B | $\pm1/4$ | $[0.778409,1]$ | 35.656277 | Positive | 0.236978 |
| B | $\pm5/16$ | $[0.723011,1]$ | 29.047728 | Positive | 0.484945 |
| B | $3/4$ | $[0.335227,1]$ | $-52.281299$ | Inconclusive | 22.812951 |

The threshold is $e/T<2$. Every base row and A at $-33/64$ is
certifiably positive and subcritical with all directions zero-free at
the marked pole. For A at $-3/4$, B01 is inconclusive on all three
conditions. For B at $3/4$, B01 certifies zero-freeness for every
direction and leaves positivity and subcriticality inconclusive.

**First zero along the specified segments.** For A the exact Wiener
estimate excludes zeros for every $|t|<\tau_A=1/(2b_A)$, where
$\tau_A\simeq0.590881$. This covers every parameter in $(-\tau_A,5/16]$
of the sampled A span. If there is a first zero when moving from $0$
toward $-3/4$, its parameter must lie in $[-3/4,-\tau_A]$. That interval
specifies where a first zero is still possible under the enclosure.
For B, $3b_B/4<1/2$ gives a zero-free triple at every parameter in the
full span $[-5/16,3/4]$. The grid runs detected no zero. The only
portion of the tested spans where these estimates leave zero-freeness
open is A at $t\in[-3/4,-\tau_A]$. The energy and Yamabe bounds
certify the full parameter intervals $[-33/64,5/16]$ for A and
$[-5/16,5/16]$ for B: on each fixed side of zero, $m$ is decreasing in
$|t|$ and $D$ is increasing, so the bounds at the endpoints apply throughout.
All of these statements concern the prescribed profiles at the one
marked infinity pole.

## Reproduction

[Driver](../numerics/e02_gate.py) · [execution record](../numerics/e02_results.txt).
The run used Python 3.10.0 and NumPy 1.25.1 on arm64. Run the driver
from the repository root.

```sh
PYTHONDONTWRITEBYTECODE=1 python3 papers/investigations-2/02_zero_circles/numerics/e02_gate.py
```
