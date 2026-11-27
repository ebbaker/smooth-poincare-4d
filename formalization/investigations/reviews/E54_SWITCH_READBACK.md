# FOT-E54 · Independent width-1/15 energy replay

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort were unavailable to this independent E reader. Baseline `b607bd17e795`. I read the [E54 widened trial](../11_intrinsic_entry_from_marked_exteriors/notes/E54_WIDENED_SWITCH.md), the [original physical trial](../../../papers/investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md), the [marked tube embeddings](../../../papers/investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md), and the prior [independent curvature calculation](../../../papers/master/reviews/PAUSE_STRIP_INDEPENDENT_20261127.md). This replay concerns the two specified bands of the oriented smooth minus Miller–Schupp carrier with long cuff length $2\operatorname{arcosh}5$, real two-form Hilbert–Schmidt normalization and the prescribed caps and three compactified funnels.

The width-$1/15$ metric exceeds the strict-entry budget in both chiralities. The E54 packet floor $34656\pi^2/3125$ for each closed chirality is valid. The fresh partition below also yields a strict physical lower bound $36504\pi^2/3125$ for each closed chirality. The first eigenvalue of the conformal Laplacian on this widened trial remains undetermined.

## Physical constants

For $x=1+15(s-1/8)$ and $3/20\le x\le1/5$, the actual coordinates are $s\in[41/600,43/600]$ and $r=1+s\in[641/600,643/600]$. In particular $ds=dx/15$, giving strip width $1/300$. The flat step attaches the same inner and outer metrics at $s=7/120$ and $1/8$ with their full jets. Both original framed maps and all complementary pieces are unchanged. The whole strip lies inside the original footprints. The harmonic data used here are the existing bounds $\|dh_L\|\le\sqrt{28}$ and $\|\nabla dh_L\|<360$ there. [Harmonic marking bounds](../../../papers/master/notes/HARMONIC_MARKING_ENCLOSURE_20261127.md)

On the strip, the radial bounds follow from the odd Taylor series and $r<27/25$. At $641/600$ the sum through degree five exceeds $32/25$. At $27/25$ the terms from degree seven have tail ratio below $1/60$, giving $\sinh r<131/100$. The exponential series at $641/300$ gives $e^{2r}>23/3$, hence $\coth r<13/10$. The latitude satisfies $|\phi-\phi_i|\le r/16\le27/400$ and $0.82<\sin\phi<0.91$, from the sine addition formula and $0.866<\sqrt3/2<0.867$. The same phase windows retain $|c_i'|<1/50000$ and $|c_i''|<1/100$ in the physical longitude. The odds $T=\exp[-1/x+1/(1-x)]$ satisfy $T<1/40$. All scalar arithmetic in these estimates was checked with rational Taylor bounds.

The resulting rational bounds on $\mathcal W=(z,\phi-\phi_i)$ are $\|d\mathcal W\|<0.068$ and $\|\nabla d\mathcal W\|<0.16$. In the Hessian of $rp$, the radial–sphere mixed bilinear form has operator norm at most one and the other term has norm at most $\max(r,\coth r)$. The composed map $F_i$ satisfies $\|dF_i\|<0.85$ and $\|\nabla dF_i\|<3$ using separate hyperbolic, latitude and unit-azimuth components. In the conformal gauge $\bar g=A+TB_i$ the frame norms obey $j_n<0.35$, $j_m<0.85$, $j_k,j_l<0.36$. For example, the $A$-unit longitude gives $B_i>(0.82/1.31)^2>0.39$ on that vector, and $B_i<0.13A$ on the sphere tangent plane. The tangential eigenvalue transformation $\lambda\mapsto\lambda/(1+T\lambda)$ bounds the $-T''$ coefficient in the four-section contrast below by $0.26/[2(1+0.025(0.85)^2)^3]>0.12$.

For the $T'\nabla ds$ term in each section, the rank-one longitude covector contracts to $-\tfrac12 T'\coth r\,|e^1(v)Jy-e^1(y)Jv|^2$. Because $A\le\bar g$, the norm inside is at most $0.85$. I checked the first-kind covector coefficients $(.36,.362,.065,.065,.510,.217,.153,.065)$ in the order $(nn,mm,kk,ll,nm,nl,km,kl)$. With the constant term $0.096$ the four quadratic covector contributions sum to at most $8(0.096)^2+0.345024T'+0.516298(T')^2$. Combining the frozen terms and the other single-weight derivative terms gives the conservative floor

\[
 |K_{nm}-K_{nl}-K_{km}+K_{kl}|
 \ge (3/25)T''-9-11T'-(53/100)(T')^2.
\]

## Exact interval replay

I used a fresh partition of 64 closed cells and bounded $e^y$ with its Taylor polynomial through degree 24. Every entry was checked with `fractions.Fraction`.

```python
from fractions import Fraction as Q
from math import factorial

def odds(x):
    y = 1/x - 1/(1-x)
    assert 0 <= y < 26
    partial = sum(y**j / factorial(j) for j in range(25))
    tail = y**25 / factorial(25) / (1 - y/26)
    return 1/(partial+tail), 1/partial

floors = []
for k in range(64):
    a = Q(3, 20) + Q(k, 1280)
    b = a + Q(1, 1280)
    slope = 15 * odds(b)[1] * (a**-2 + (1-b)**-2)
    bracket = (b**-2 + (1-a)**-2)**2 - 2*a**-3 + 2*(1-a)**-3
    assert bracket > 0
    second = 225 * odds(a)[0] * bracket
    floors.append(Q(3, 25)*second - 9 - 11*slope - Q(53, 100)*slope**2)
assert floors[0] == min(floors)
assert 117 < min(floors) < 118
```

## Complete costs and scalar sign

In each band, the phase windows occupy $1/10$ of the physical longitude and the whole framed sphere has area $4\pi$. The strip volume in $\bar g$ therefore exceeds $(32/25)(1/300)(2\pi/10)(4\pi)=(32/25)(8\pi^2/3000)$. Schouten cancels in the four-section contrast $D$, so Cauchy–Schwarz on four Weyl diagonal entries gives $D^2\le4(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)$. The strip contributes to the sum of the complete energies. The signature-zero single-relator closure for each band, with its Weyl-flat complement, gives equality of the complete signed energies within that band. Each energy is conformally invariant, and positivity permits using the strip lower bound on the complete band. Using $114$ or $117$ for $|D|$ gives per-band lower coefficient $17328/3125$ or $18252/3125$ respectively. The prescribed caps, retained exterior and three complete funnels contribute zero Weyl cost. Adding the two band estimates gives the factor of two on each closed chirality. The marked reflection exchanges bands, preserves $s$ and the common switch, and exchanges chiralities, in agreement with the complete ledgers. The separate per-band estimates already suffice for the closed lower bound. [Single-relator signature](../../../papers/investigations-1/07_positive_subcritical_entry/notes/SINGLE_RELATOR_CLOSURES.md) · [Framed reflection](../../../papers/master/notes/FIXED_WIDTH_BAND_TEST_20261127.md)

The calculation supplies an energy exclusion at every scalar sign on this one metric. A sign certificate would require a bound on the full closed conformal-Laplacian form or a strict test with the actual widened-band numerator and verified cap and funnel contributions on that same metric. The fixed width-$1/16$ Rayleigh calculations used their own band values, so they do not supply the numerator at width $1/15$. [Original Rayleigh trial](../../../papers/master/notes/NATIVE_RAYLEIGH_TRIAL_20261127.md)
