# SP4-M2-E09 angular moment for every pole direction

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [bounded E09 request](../research-progress/handoffs/REQUEST_M2_UNIFORM_DIRECTION_20261127.md) (SHA-256 prefix `1fde3dab2ce17fb73`) specifies Sol 6.2/ultra. The serving variant and effort are unavailable. The working base is `6a422ce7814fe1ad278d6904970e3b19b05a9890`. The fixed inputs are the oriented Euclidean end symbol from [ZERO-E01 §1](../../investigations-2/02_zero_circles/notes/E01_FLAT.md#1-closed-symbol) (`1a64cdcab9f95585`) and the unmollified tensor law from [ZERO-B01](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md#continuum-bounds-for-all-directions-and-all-spatial-points-at-the-marked-pole) (`70fe3a0850e0270b`). This is a project calculation and finite rational certificate for the angular moment used by B06.

## Exact dependence on the direction

Let \(\xi\) have the unmollified iid spline Fourier law. Put \(q=\xi/\lVert\xi\rVert\), \(v=(q_1,q_2,q_3)\), \(\alpha=\mathbb E q_0^4\) and \(\beta=\mathbb E q_0^2q_1^2\). The zero vector has probability zero. Sign and permutation symmetry and \(\sum q_i^2=1\) give \(\mathbb E q_i^2=1/4\) and \(4\alpha+12\beta=1\).

In the orthonormal chiral bases of ZERO-E01, the skew terms of \(T(\xi)\) cancel in a quadratic form. For every \(u\in\mathbb R^3\) with \(\lVert u\rVert=1\), put \(S(u)=\sum_{i=1}^3u_i^4\). The symmetric part of the multiplier gives
\[
C_u=u^{\mathsf T}T(\xi)u
   =2\big(q_0^2+(u\cdot v)^2\big)-1,\qquad \mathbb E C_u=0 .
\]
By sign symmetry \(\mathbb E q_0^2(u\cdot v)^2=\beta\), and
\(\mathbb E(u\cdot v)^4=\alpha S(u)+3\beta(1-S(u))\). Consequently
\[
\mathbb E C_u^2
 =4\big(\alpha+5\beta+(\alpha-3\beta)S(u)\big)-1
 =8\beta+(1-24\beta)S(u).
\]
The interval \(1/3\le S(u)\le1\) follows by Cauchy–Schwarz and \(\sum u_i^2=1\). The balanced and axial directions attain its ends. The respective second moments are \(1/3\) and \(1-16\beta\). Thus the uniform moment is bounded by \(\max\{1/3,1-16\beta\}\) regardless of the slope of the affine function.

## Certified lower sum for \(\beta\)

In the convention \(h(x)=\int e^{ix\xi}\widehat h(\xi)\,d\xi\), the fourfold box convolution with coefficient \(3/2\) gives the signed marginal density \(\frac{3}{4\pi}(\sin(\xi/2)/(\xi/2))^4\). The mass is \(h(0)=1\). On \(0\le t=|\xi|\le4\) the inequality \(\sin z\ge z-z^3/6\) at \(z=t/2\) and \(\pi<22/7\) give the lower density
\[
\frac{3}{2\pi}(1-t^2/24)^4
  \ \ge\ \frac{21}{44}(1-t^2/24)^4 .
\]
The sine bound follows by integrating \(\cos z\ge1-z^2/2\). The latter follows by integrating \(\sin z\le z\). Both sides of the sine-ratio comparison are nonnegative on the interval used here.

Write \(t_i=i/4\), \(0\le i\le16\), and \(M_i=\frac{21}{44}\int_{t_i}^{t_{i+1}}(1-t^2/24)^4\,dt\). Independence gives a lower probability \(\prod M_i\) for the corresponding four-coordinate box in absolute coordinates. In a box indexed by \(i,j,k,l\), set \(z=t_{k+1}^2+t_{l+1}^2\). The ratio for \(\beta\) is \(ab/(a+b+c)^2\) with \(a=|\xi_0|^2,\ b=|\xi_1|^2,\ c=|\xi_2|^2+|\xi_3|^2\). Replace \(c\) by its upper bound \(z\). For fixed \(b,z\), as a function of \(a\) the derivative has the sign of \(b+z-a\) when \(b>0\), so the minimum on a closed interval is an endpoint. If \(b=0\) the function is zero. The same reasoning holds with \(a,b\) exchanged. Hence a lower ratio \(L_{ijkl}\) is the minimum over the four endpoint pairs for \(a,b\) with \(c=z\). The box sum \(\sum M_iM_jM_kM_l L_{ijkl}\) bounds \(\beta\) from below since the integrand outside the grid is nonnegative.

The following integer computation reproduced the sum with all five factors rounded down at scale \(D=10^8\). The common coordinate denominator cancels in the ratio, so the endpoint squares in the code are \(i^2\). The last assertion is the comparison used for the uniform ceiling.

~~~python
from fractions import Fraction
from itertools import product
from math import comb

D = 10**8


def antiderivative(t):
    return sum(
        Fraction((-1)**k * comb(4, k), (2*k + 1) * 24**k)
        * t**(2*k + 1)
        for k in range(5)
    )


ends = [antiderivative(Fraction(i, 4)) for i in range(17)]
masses = [
    int(D * Fraction(21, 44) * (right - left))
    for left, right in zip(ends, ends[1:])
]
total = 0
for i, j, k, l in product(range(16), repeat=4):
    z = (k+1)**2 + (l+1)**2
    lower_ratio = min(
        D * a * b // (a + b + z)**2
        for a in (i**2, (i+1)**2)
        for b in (j**2, (j+1)**2)
    )
    total += masses[i] * masses[j] * masses[k] * masses[l] * lower_ratio

assert total == 246985174054500647388970140308182395975
assert 3200 * total > 79 * D**5
~~~

Every summand is nonnegative. The first comparison records the exact numerator of the computed lower bound over \(D^5\), and the second gives \(\beta>79/3200\). Therefore
\[
\boxed{\quad\mathbb E\big[(u^{\mathsf T}T(\xi)u)^2\big]\le
           \frac{121}{200}\qquad\text{for every }\lVert u\rVert=1.\quad}
\]
The law in this estimate is the unmollified increment law of the marked profile. It gives the B06 first-order angular input. The endpoint spatial box certificate has a separate owner and test.
