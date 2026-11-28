# SP4-M2-E10 uniform replay for the original profile A

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The bounded dispatch was assigned as Sol 6.2/ultra. Actual
serving variant and effort were unavailable. The working base was
6a422ce7814fe1ad278d6904970e3b19b05a9890. Input hashes are SHA-256 prefixes.
[Request](../research-progress/handoffs/REQUEST_M2_UNIFORM_DIRECTION_20261127.md)
(c5948c9cd8c68d18) · [E07 phase estimate](E07_PHASE_ARGUMENT_20261127.md)
(fd77bfc318afea4e) · [E09 angular moment](E09_ANGULAR_MOMENT_20261127.md)
(668f98feb091c508) · [Producer box code](../numerics/check_marked_direction.py)
(27c62d0f63e925b3).

**Disposition.** The marked infinity pole on the smooth oriented standard
\(S^4\) has a definite pole triple everywhere off the puncture for the
original profile A at each \(t=-s\), \(0\le s\le3/4\). With unit leading
coefficients and the Riemannian asymptotically Euclidean representative
\(g\) of the graph, its smallest singular value is uniformly at least
\(1/100\). The all-direction derivation replays E07 and E09 and the
rational bounds below are independently reproduced certificates.

## Angular input

**Project theorem replay.** Use the oriented Euclidean end basis
\(E_i^\pm=(dx^{0i}\pm dx^{jk})/\sqrt2\) for cyclic \(i,j,k\).
Let \(\nu\) be the probability Fourier measure of the unmollified tensor
cubic. For \(\xi\) drawn from \(\nu\), put
\(q=\xi/|\xi|\), \(z=(q_1,q_2,q_3)\), \(\alpha=E q_0^4\) and
\(\beta=E q_0^2q_1^2\). For any real unit \(u\), the symmetric part of the
flat transfer matrix gives \(u^{\mathsf T}T(\xi)u=2(q_0^2+(u\cdot z)^2)-1\).
The diagonal entries of \(T\) have zero expectation by coordinate
exchangeability. Products of distinct coordinates are odd under a sign
change, giving \(E T=0\) also on the off-diagonal. With
\(S=\sum_i u_i^4\), sign symmetry gives
\(E q_0^2(u\cdot z)^2=\beta\) and
\(E(u\cdot z)^4=\alpha S+3\beta(1-S)\).
Using \(4\alpha+12\beta=1\) gives
\[
 E(u^{\mathsf T}Tu)^2=8\beta+(1-24\beta)S.
\]
Since \(1/3\le S\le1\), this is bounded by the larger of \(1/3\) and
\(1-16\beta\). The E09 computation integrates a lower marginal density
on each bin and finds the minimum ratio by testing the four endpoints in
the two numerator coordinates. That test follows from the sign of the
coordinate derivative of \(ab/(a+b+c)^2\), which permits an interior
maximum only. It proves the tighter bound \(121/200\).
[ZERO-E01 symbol](../../investigations-2/02_zero_circles/notes/E01_FLAT.md) · [E09 angular estimate](E09_ANGULAR_MOMENT_20261127.md)

**Independent certificate for \(4/5\).** The folded marginal density of
\(|\xi_0|\) is \(\frac3{2\pi}(\sin(r/2)/(r/2))^4\). On \([0,4]\) it is
at least \(\frac{21}{44}(1-r^2/24)^4\) by
\(\sin y\ge y-y^3/6\) and \(\pi<22/7\). The sine inequality follows by
integrating \(\cos y\ge1-y^2/2\), and the bound on \(\pi\) also follows
from the positive integral \(\int_0^1 x^4(1-x)^4/(1+x^2)\,dx=22/7-\pi\).
Use sixteen bins \([(i-1)/4,i/4]\) and bound the density below by its
polynomial lower bound at the right endpoint. The resulting lower mass
on bin \(i\) is \(p_i=21(384-i^2)^4/(176\cdot384^4)\).
On the box \((i,j,k,l)\) the normalized mixed moment integrand is at least
\((i-1)^2(j-1)^2/(i^2+j^2+k^2+l^2)^2\) by bounding the numerator and
denominator separately. The summands are nonnegative. Flooring each
weighted summand at scale \(10^{12}\) gives
\(\beta\ge12645096577/10^{12}>1/80\). This suffices for the \(4/5\)
angular bound used in the spatial replay.

~~~python
from itertools import product
from math import prod

scale = 10**12
mass_denominator = 176 * 384**4
mass_numerator = {i: 21 * (384 - i*i)**4 for i in range(1, 17)}
lower_sum = 0
for indices in product(range(1, 17), repeat=4):
    i, j, _, _ = indices
    numerator = (i - 1)**2 * (j - 1)**2
    denominator = sum(k*k for k in indices)**2
    lower_sum += (
        scale * numerator * prod(mass_numerator[k] for k in indices)
        // (mass_denominator**4 * denominator)
    )
assert lower_sum == 12645096577
assert 80 * lower_sum > scale
~~~

## Phase estimate and the full parameter segment

**Project theorem replay.** Let
\(H=e^{ix\cdot\xi}\sum_j w_j e^{-ic_j\cdot\xi}
\prod_{k=0}^3\int e^{-iy\xi_k}\rho(y)\,dy\).
Then \(f=E H=F(x)\), and \(m=E H^2\) is the tensor convolution
\(h*\rho*\rho\) evaluated at \(2x-c_i-c_j\) and summed with the pair
weights \(w_iw_j\). Thus \(f,m\ge0\).
The absolute second moment \(B_x=E|H|^2\) satisfies
\(m\le B_x\le b^2=4403963/6150400\).
The last fraction is computed from the signed translation polynomial
using the original unmollified tensor cubic at differences of centers.
For the physical normalized pole, the flat plus coefficients \(V_tu\)
satisfy \(V_tu=u+tT(FV_tu)\) by the compact graph and Euclidean closedness.
The \(L^2\) correction is unique because \(|t|\|F\|_\infty<1\). The
Fourier series represents the same correction because \(|t|b<1\).
The compact minus correction has decaying transfer, which gives the
specified leading coefficient at the puncture.
[ZERO-B01 profiles](../../investigations-2/02_zero_circles/brainstorm/notes/B01_GATE_SCOPE.md) · [E07 identification](E07_PHASE_ARGUMENT_20261127.md#fourier-law-and-the-physical-pole)

For the \(n\)-th Picard term let \(S_j=\xi_1+\cdots+\xi_j\) for iid
increments, \(A_n=u^{\mathsf T} T(S_n)\cdots T(S_1)u\) and
\(Y_n=\Re\prod_{j=1}^n H(\xi_j)\).
Simultaneous reflection of the increments makes the imaginary part of
their expected product with \(A_n\) vanish. By independence
\(E Y_n^2=(B_x^n+m^n)/2\). For \(n=1\), \(E A_1=0\), so
centering \(Y_1\) at \(f\) and applying Cauchy–Schwarz uses the variance
bound \((b^2+m)/2-f^2\) and the angular moment \(4/5\).
For \(n\ge2\), exchanging the first two increments preserves the
scalar phase product and each partial sum \(S_2,\ldots,S_n\).
The first transfer vector becomes
\(D=(T(\xi_1)+T(\xi_2))u/2\) inside the expectation.
Orthogonality, independence and \(ET=0\) give \(E|D|^2=1/2\).
By Cauchy–Schwarz each coefficient's magnitude
is at most \(\frac12\sqrt{b^{2n}+m^n}\).
Since \(m/b^2\le1\), the summed correction for \(t=-s\) satisfies
\[
 \left|u^{\mathsf T}(V_t(x)-I)u\right|
 \le
 R_s(x)=s\sqrt{\frac45\left(\frac{b^2+m}{2}-f^2\right)}
       +\frac{s^2}{2(1-sb)}\sqrt{b^4+m^2}.
\]
Both coefficients are nondecreasing in \(s\) on \(0\le s\le3/4\).
All of \(b,f,m\) and the angular input are independent of \(s\).
An upper bound at \(s=3/4\) therefore controls the full segment.

## Independent spatial box check

**Certificate.** Cover \([-2,2]^4\) by dyadic boxes. On an axis of a
box, write its endpoints \(\ell,r\) and a center offset \(c\).
The one-dimensional \(h*\rho\) at \(x-c\) is bounded below by \(h\)
evaluated at \(\max(|\ell-c|,|r-c|)+1/64\).
The corresponding \(h*\rho*\rho\) at \(2x-c\) is bounded above by \(h\)
at the distance from \(c\) to \([2\ell-2/64,2r+2/64]\).
The support and unit mass of the probability mollifiers and even radial
monotonicity of \(h\) give both inequalities; the products and sums
preserve them since all factors and weights are nonnegative.
Outside the root box, some \(|x_k|>2\).
For every pair of centers,
\(|2x_k-c_{i,k}-c_{j,k}|>4-8/5>2+1/32\).
Thus \(m=0\) there, and \(f\ge0\) suffices for the exterior bound.

At scale \(Q=10^6\), write \(B=\lceil Q b^2\rceil\) and \(B_u=\lceil
\sqrt{QB}\rceil\). Let \(F_\ell/Q\) be the rounded lower bound for \(f\)
and \(M_u/Q\) the rounded upper bound for \(m\), intersected with \(B/Q\).
The two contributions to \(Q R_{3/4}\) are bounded above by rounding up
the following square roots separately:
\[
 \sqrt{\frac{9\left[Q(B+M_u)-2F_\ell^2\right]}{40}},
 \qquad
 \sqrt{\frac{81Q^2(B^2+M_u^2)}{64(4Q-3B_u)^2}} .
\]
The first inequality substitutes the lower \(f\) using \(f\ge0\).
For the second, \(4Q-3B_u>0\) and replacing each input by an upper bound
increases the result. The implementation uses lower corners and
side lengths with coordinate denominator \(7680\), explicitly sums
all 25 ordered center pairs and rounds up each complete squared
contribution. It imports no producer functions. A rejected box is
replaced by all 16 children. The exact volume sum and the finite depth
limit check completion.

~~~python
from collections import Counter
from functools import lru_cache
from itertools import product
from math import isqrt

coordinate_scale, Q = 7680, 10**6
D = coordinate_scale
offsets = (D//2, 2*D//3, 3*D//4, 4*D//5)
weights = (16, 8, 4, 2, 1)
radius = D//64
profile_denominator = 4*D**3
tensor_denominator = profile_denominator**4
children = tuple(product((0, 1), repeat=4))


@lru_cache(None)
def profile(distance):
    if distance > D:
        return max(2*D - distance, 0)**3
    return profile_denominator - 6*D*distance**2 + 3*distance**3


@lru_cache(None)
def axis(axis_index, left, side):
    right = left + side
    offset = offsets[axis_index]
    lower_f = tuple(
        profile(max(abs(left-shift), abs(right-shift)) + radius)
        for shift in (0, offset)
    )
    expanded_left, expanded_right = 2*(left-radius), 2*(right+radius)
    upper_m = tuple(
        profile(max(expanded_left-shift, shift-expanded_right, 0))
        for shift in (0, offset, 2*offset)
    )
    return lower_f, upper_m


pairs = [
    (weights[i]*weights[j], tuple((i == k)+(j == k) for k in range(1, 5)))
    for i, j in product(range(5), repeat=2)
]


def ceil_root(numerator, denominator=1):
    root = isqrt(numerator//denominator)
    return root + (root*root*denominator < numerator)


B = (Q*4403963+6150399)//6150400
B_u = ceil_root(B*Q)
assert 4*Q > 3*B_u


def error(f, m):
    variance_twice = Q*(B+m) - 2*f*f
    assert variance_twice >= 0
    first = ceil_root(9*variance_twice, 40)
    tail = ceil_root(81*Q*Q*(B*B+m*m), 64*(4*Q-3*B_u)**2)
    return first + tail


def verify_boxes():
    exterior = error(0, 0)
    target = 99*Q//100
    assert exterior <= target
    cells = [((-2*D,)*4, 4*D, 0)]
    leaves = Counter()
    tested = 0
    maximum = exterior
    while cells:
        left, side, depth = cells.pop()
        tested += 1
        lower_axes, upper_axes = zip(
            *(axis(k, lo, side) for k, lo in enumerate(left))
        )
        a, b, c, d = lower_axes
        lower_sum = (
            16*a[0]*b[0]*c[0]*d[0] + 8*a[1]*b[0]*c[0]*d[0]
            + 4*a[0]*b[1]*c[0]*d[0] + 2*a[0]*b[0]*c[1]*d[0]
            + a[0]*b[0]*c[0]*d[1]
        )
        f = Q*lower_sum//(31*tensor_denominator)
        a, b, c, d = upper_axes
        upper_sum = sum(
            weight*a[i]*b[j]*c[k]*d[l] for weight, (i,j,k,l) in pairs
        )
        denominator = 31**2*tensor_denominator
        m = min(B, (Q*upper_sum+denominator-1)//denominator)
        upper = error(f, m)
        if upper <= target:
            leaves[depth] += 1
            maximum = max(maximum, upper)
        else:
            assert depth < 10 and side % 2 == 0, (left, side, upper)
            half = side//2
            for choice in children:
                origin = tuple(lo+bit*half for lo, bit in zip(left, choice))
                cells.append((origin, half, depth+1))
    assert sum(n*16**(10-k) for k, n in leaves.items()) == 16**10
    assert tested == 427489 and exterior == 952599 and maximum == 990000
    print(exterior, tested, sorted(leaves.items()), maximum)


verify_boxes()
~~~

The replay tested 427489 nodes. The accepted leaf counts at depths
2 through 9 were 240, 152, 1176, 6018, 23434, 72138, 170589 and 127024.
The exterior correction is bounded by \(952599/10^6\) and the whole-space
correction by \(990000/10^6\). The producer's \(4/5\) run uses staged
rounding and tests 427505 nodes, with the same whole-space upper bound.

## Singular value, endpoint geometry and quantifiers

**Project theorem replay.** For every unit incoming \(u\),
\(u^{\mathsf T}V_t(x)u\ge1-R_s(x)\ge1/100\). The flat projection
therefore bounds the Euclidean norm \(|V_t(x)u|\) from below.
In the metric coframe
\((a\,dx^0,dx^1,dx^2,dx^3)\) with \(a=(1+tF)/(1-tF)\),
the orthonormal self-dual coefficients are \((1-tF)V_t(x)u\).
Since \(t=-s\) and \(F\ge0\), the factor is at least one. Taking the
infimum over real unit \(u\) gives the same lower bound on the smallest
singular value of the evaluation map in the asymptotically Euclidean
normalization. A conformal change to the smooth compact representative
preserves nonvanishing and rank at every point off \(p\).

At \(t=-3/4\) this yields a zero-free form in every nonzero direction at
the one marked pole of the positive Yamabe and subcritical profile A
class certified by ZERO-E05. It is one instance of the bridge on the
standard sphere. The all-class bridge quantifies over every positive
subcritical conformal class on \(S^4\), and Z quantifies over arbitrary
smooth homotopy four-spheres. Those existence questions remain open.
[Endpoint geometry](../../investigations-2/02_zero_circles/notes/E05_STRESS_GEOMETRY.md) · [Master 2 frame](../research-overview/OVERVIEW.md)
