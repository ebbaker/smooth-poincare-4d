# Independent check of the width-1/16 Weyl obstruction

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E under master B02 at checkout `48f36794f9b1`. Actual serving model and effort are unavailable. Readback of [the width-1/16 proof](NATIVE_TRIAL_INTEGRATION_20261127.md), working Git blob `d7e1fda7d97a`, using [the harmonic-map bounds](../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md) `f103fccfd777`, [the physical trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md) `e999229fcdf9`, [both tube maps](../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md) `59c3993e018e`, [both single-relator closings](../../investigations-1/07_positive_subcritical_entry/notes/SINGLE_RELATOR_CLOSURES.md) `51f66f28665d`, and [the band exchange](../notes/FIXED_WIDTH_BAND_TEST_20261127.md) `03f618c377cf`.

The strict energy obstruction checks. In the original smooth oriented Riemannian trial with \(L=2\operatorname{arcosh}5\), both complete bands have the same chiral cost \(c>169\pi^2/25\), using real two-form Hilbert–Schmidt norms. With the prescribed caps and all three restored funnels, the original closed trial obeys \(E_+=E_-=2c>338\pi^2/25\). The closed first eigenvalue remains unverified on this metric.

## Coefficients and curvature

On the subset \(3/20\le x=16s-1\le1/5\) and the first and last twentieth of each timed letter, use the conformal metric \(\bar g=A+tB\), where \(t=e^{-1/x+1/(1-x)}<1/40\). The latitude and azimuth degrees of freedom are those of the original tube. Put \(w=(z,\phi-\phi_i)=\delta rp+(c,0)\) with \(\delta=1/16\) and \(r=1+s\).

- On the phase interval \(0<u\le1/20\), the logistic odds are bounded by \(e^{-1/u+20/19}\). The factors for the first and second derivatives are bounded by \((1+19^{-2})u^{-2}\) and \((1+19^{-2})^2u^{-4}+2(1+19^{-3})u^{-3}\). Each exponential times a power increases up to \(1/20\). Bounding the endpoint odds by \(6\cdot10^{-9}\) then gives \(|c'|<2\cdot10^{-5}\) and \(|c''|<.01\), using the actual factor \(7\) for \(c'\) and \(49/(2\pi)\) for the linear term of \(c''\). The reflected phases have the same bounds.
- In the metric \(A\), the derivative of \(rp\) maps the radial and sphere tangents to orthogonal vectors. Its Hessian has the off-diagonal radial and sphere terms and diagonal terms \(\coth r\) in the longitude and \(-r\) on the sphere, both times \(p\). Its operator norm is therefore at most \(1+\max(r,\coth r)\). With \(r\in[343/320,43/40]\), the bounds \(1.28<\sinh r<1.30\), \(\coth r<1.3\) and \(.82<\sin\phi<.91\) give \(\|dw\|<.068\) and \(\|\nabla dw\|<.16\).
- For the hyperbolic Hessian bound, if \(T_j=\partial_j h_L\) and \(S_{ij}=D_iT_j\), commuting the two flat-domain covariant derivatives yields \(\|\Delta_D S\|\le6|T|^2|S|\). The terms are the derivative of \(\sum_aR(T_a,T_j)T_a\) in direction \(i\) and the commutator with \(D_i\). In the latter the trace \(\sum_a D_aT_a\) vanishes and the target curvature is parallel. Each of the six contractions with multiplicity is bounded by \(|T|^2|S|\) using \(\|R(u,v)\|\le |u||v|\) and Cauchy–Schwarz in the contracted index. Thus \(\Delta|S|^2\ge-12|T|^2|S|^2\). With \(|T|^2<50\) on the disk of radius \(1/6\), the disk Green formula bounds \(\int_{D_{1/12}}|S|^2\) by \(50\pi/\log2\). The subharmonic three-dimensional lift \(e^{\sqrt{600}z}|S|^2\) then gives \(|S|<360\), using \(e^{\sqrt{600}/12}<8\) and \(\log2>2/3\). This confirms the derivative estimate used in the composition.
- For the full product map \(F\), \(\|dF\|_A^2\le 28(.068)^2+(.91/1.28)^2<.85^2\). In the hyperbolic component the composed Hessian is bounded by \(360(.068)^2+\sqrt{28}(.16)\). In the spherical latitude and unit azimuth components the bounds are \(.16+.5/(1.28)^2\) and \(1.3/1.28+2(.068)/1.28\). The Euclidean sum of their squares gives \(\|\nabla dF\|<3\), so the proof's bound \(4.5\) has slack.

For the \(\bar g\)-orthonormal frame \((n,m,k,l)\) used in the proof, the two-plane tangent to the marked sphere proves \(j_k,j_l\le.36\) by min–max, where \(j_v=|dF(v)|\). The normal satisfies \(j_n\le \sqrt{1+.025(.85)^2}\sqrt{28}\delta<.35\) by \(J(I+tJ^*J)^{-1}=(I+tJJ^*)^{-1}J\), with \(J=dF\). The tangential maximum eigenvalue is at least \(b/(1+tb)\) for \(b=(.82/1.30)^2\), by testing the longitude. With the lower bound for \(|ds|^2_{\bar g}\) and \(B_{ll}\le.36^2\), the absolute coefficient of \(t''\) in \(D=K_{nm}-K_{nl}-K_{km}+K_{kl}\) exceeds \(.12\).

In \(A\)-normal coordinates, the twice-differentiated part of \(K_{vy}\) is \(\partial_v\partial_y\bar g_{vy}-(\partial_v^2\bar g_{yy}+\partial_y^2\bar g_{vv})/2\). For a fixed coefficient of \(F^*g_{\rm target}\) it gives the target curvature term and the quadratic covariant Hessian term in the proof. In the single-weight-derivative contribution, for example, \(t_v(\partial_y B_{vy}-\partial_vB_{yy})=t_v(\langle Jv,H_{yy}\rangle-\langle Jy,H_{vy}\rangle)\). The Christoffel product is \(|G_{vy}|^2-\langle G_{vv},G_{yy}\rangle\) in the curvature convention \(K_{vy}=R_{vyyv}\). The comparison \(\bar g\ge A\) bounds each covector norm, and the rank-one Hessian of \(s\) gives the squared contraction with the one unit longitude covector. Using \(.217\) as the coefficient for \(G_{nl}\), the summed Christoffel bounds are \(8(.096)^2+.345024t'+.516298(t')^2\). The frozen four-section bound is less than \(8.11\). The remaining linear terms are bounded by \([4(1.3)(.85)^2/2+4.5(2(.35)+.85+.36)]t'\). This recovers the conservative scalar inequality
\[
 |D|\ge (3/25)t''-9-11t'-(53/100)(t')^2.
\]

## Exact interval replay and integrated norm

The following independent rational partition has forty cells and certifies \(|D|>133\). It uses twenty terms after the constant in the positive exponential series. The reported bound \(>130\) is therefore also certified.

```python
from fractions import Fraction as Q
from math import factorial

def odds(x):
    y = 1 / x - 1 / (1 - x)
    partial = sum(y**j / factorial(j) for j in range(21))
    tail = (y**21 / factorial(21)) / (1 - y / 22)
    return 1 / (partial + tail), 1 / partial

floors = []
for i in range(40):
    a = Q(3, 20) + Q(i, 800)
    b = a + Q(1, 800)
    derivative = 16 * odds(b)[1] * (a**-2 + (1 - b)**-2)
    bracket = (b**-2 + (1 - a)**-2)**2 - 2*a**-3 + 2*(1 - a)**-3
    assert bracket > 0
    second_derivative = 256 * odds(a)[0] * bracket
    floors.append(Q(3, 25)*second_derivative - 9 - 11*derivative
                  - Q(53, 100)*derivative**2)
assert 133 < min(floors) < 134
```

Schouten cancels in the four-section contrast. In the simple orthonormal two-form basis, Cauchy–Schwarz on the four Weyl diagonal entries gives \(D^2\le4\|W\|_{\rm HS}^2\), and the latter squared norm is the sum of both chiral squared norms. The strip volume in \(\bar g\) is greater than \(8\pi^2(1.28)/3200\), from radial width \(1/320\), longitude fraction \(1/10\), and \(\bar g\ge A\). The conformally invariant densities let one integrate in that metric on the subset. The complete band has equal chiral integrals by the signature-zero single-relator closing with Weyl-flat complement. Thus the \(>130\) bound gives the stated \(c>169\pi^2/25\). The restored funnels and both radius-one caps are Weyl-flat, so their addition leaves the sum of the two complete band integrals in each closed chirality. The independent [original funnel test](../notes/ORIGINAL_FUNNEL_TEST_20261127.md) strengthens a sufficient condition for a negative closed sign and still needs a band value.
