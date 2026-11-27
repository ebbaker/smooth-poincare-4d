# GEO-E21 · Certified physical meridian area

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex.
Bounded E execution from the [frozen angular packet](ISSUE_BERGER_ANGULAR_INTEGRAL_20261127.md)
on the exact [E18 short suspension](E18_SHORT_SUSPENSION.md), baseline
`bc2c1bb`. The requested worker settings were GPT-6.2 Sol/ultra.
Actual serving model and effort are unavailable. The calculation is on the
specified smooth Riemannian \(S^4\) with the E18 unit round orbit normalization
and both prescribed sine poles. Surface area is independent of orientation
and chirality.

The physical area of the closed meridian \(D=\{\operatorname{Re}q=0\}\),
completed at both poles, satisfies
\[
  1.901985 \ \leq\ \operatorname{Area}_g(D)\ \leq\ 1.903738.
\]
The displayed width is \(0.001753\). A separate floating-point tensor
Gauss–Legendre calculation gave \(1.90292651462645\).

| Region (both halves) | Outward area enclosure |
| --- | ---: |
| Germ, \(\lvert s\rvert\leq 1/32\) | \([1.351715,1.352045]\) |
| Interpolation, \(1/32\leq\lvert s\rvert\leq1/16\) | \([0.495433,0.496857]\) |
| Sine ends, \(1/16\leq\lvert s\rvert\leq1/4\) | \([0.054836,0.054837]\) |
| Total, summed before decimal formatting | \([1.901985,1.903738]\) |

## Area formula and radial bounds

For fixed \(s\), the round normal to the equatorial \(S^2\) has frame
coefficients \(-\omega_i\), where \(\omega\in S^2\) is the imaginary quaternion
coordinate. The change of metric on the angular plane acts by the area
Jacobian \(\|\operatorname{cof}(\operatorname{diag}(a_1,a_2,a_3))\omega\|\).
The radial field is a unit tangent, so writing
\(c_1=a_2a_3,\ c_2=a_3a_1,\ c_3=a_1a_2\) gives
\[
 I=\int_{-1/4}^{1/4}\int_{S^2}
       \sqrt{c_1(s)^2\omega_1^2+c_2(s)^2\omega_2^2+c_3(s)^2\omega_3^2}
       \,d\omega\,ds .
\]
The substitution \(s\mapsto -s\) exchanges \(c_1,c_2\) and the angular
measure is invariant under the same exchange of coordinates. Both halves
therefore give equal areas. On each sine end the cofactor norm is
\(\sin^2 r\) with \(r=1/4-|s|\). The combined sine contribution is exactly
\[
 8\pi\int_0^{3/16}\sin^2 r\,dr
   =4\pi\left(\frac{3}{16}-\frac{\sin(3/8)}2\right).
\]

For \(x=s\geq0\) up to \(1/16\), put
\(b=1/(2\sqrt2)\), \(t=\sqrt{65}/4\), and
\(P(x)=2\log\sin(1/4-x)\). The three germ log cofactors \(G_i\) are
\[
  G_1=\log t-bx+\frac{31}{16}x^2,\qquad
  G_2=\log t+bx+\frac{31}{16}x^2,\qquad
  G_3=-\frac{67}{16}x^2.
\]
Then \(\log c_i=\chi G_i+(1-\chi)P\), with the E18 cutoff
\(\chi=F(1-z)/(F(z)+F(1-z))\), \(z=32x-1\), and \(F(y)=e^{-1/y}\)
for \(y>0\) and \(F(y)=0\) otherwise. On the inner half \(G_1,G_3\)
decrease and \(G_2\) increases. In particular
\((31/8)x\leq31/128<b\), which proves the first monotonicity.
Both \(P\) and \(\chi\) are nonincreasing, and \(G_i>P\) throughout
because \(e^{G_i}\geq e^{-1/16}\geq15/16\) while \(e^P\leq1/16\).
Thus \(\chi G_i+(1-\chi)P\) is increasing in the three arguments
\(G_i,P,\chi\) over their ranges on any radial cell. The minimum and maximum
endpoint values of each argument give lower and upper bounds for
\(\log c_i\) even when they occur at different endpoints. Exponentiating
twice the resulting bounds encloses \(c_i^2\). Each inner region uses
1024 equal radial cells of length \(1/(32\cdot1024)\).

## Angular bounds

Put \(u=|\omega_3|\) and write the other coordinates in azimuth
\(\varphi\). With the angular measure normalized to mass one, the
sign symmetries reduce the average to independent uniform averages over
\(u\in[0,1]\) and \(\varphi\in[0,\pi/2]\). At fixed \(u\) define
\[
  A_1=(1-u^2)c_1^2+u^2c_3^2,\qquad
  A_2=(1-u^2)c_2^2+u^2c_3^2 .
\]
The true integrand is \(\sqrt{A_1\cos^2\varphi+A_2\sin^2\varphi}\).
The chord inequality for the concave square root and Jensen's inequality
bound its azimuthal average from below and above, respectively.
\[
  \frac{\sqrt{A_1}+\sqrt{A_2}}{2}
  \ \leq\ \frac{2}{\pi}\int_0^{\pi/2}
                \sqrt{A_1\cos^2\varphi+A_2\sin^2\varphi}\,d\varphi
  \ \leq\ \sqrt{\frac{A_1+A_2}{2}} .
\]
Since both bounds increase in each squared cofactor, they can use its
radial lower or upper bound, respectively. Each resulting axial
integrand has the form \(\sqrt{m(1-u^2)+q u^2}\) with \(m\geq q>0\),
as checked for every input to the axial quadrature. Its second derivative
is \(m(q-m)/(m(1-u^2)+q u^2)^{3/2}\). On 32 equal subintervals the
trapezoid rule therefore gives a lower bound and the midpoint rule
gives an upper bound. The total factor for the inner sums is \(8\pi\),
from \(4\pi\) for the sphere and 2 for radial reflection.

## Arithmetic and reproduction

Run the [standard-library script](../../numerics/berger_meridian_area.py)
from the repository root.

```sh
python3 papers/investigations-1/08_cut_geometry_and_chirality/05_cuts_from_geometry/numerics/berger_meridian_area.py
```

The run used Python 3.10.0 on Darwin arm64. Every interval endpoint is an
integer multiple of \(2^{-96}\), with products and division rounded
outward by integer quotients, and roots rounded outward with integer
square root. Sine uses its alternating series through degree 13 with
one-sided remainder of magnitude at most \((1/2)^{15}/15!\), since all
its arguments are in \([0,1/2]\). For \(0\le y\le1/2\), the exponential
Taylor polynomial through degree 20 has a nonnegative remainder at most
\(2(1/2)^{21}/21!\). Halving and repeated squaring handle other
nonnegative inputs. Reciprocation handles negative inputs down to \(-64\),
and \(0<e^y<2^{-64}\) for \(y<-64\). For a logarithm of a positive
argument \(a\), the script sums 48 terms of
\(2\sum_{j\geq0}v^{2j+1}/(2j+1)\), where \(v=(a-1)/(a+1)\). It checks
\(|v|\leq7/10\), which bounds the omitted tail by
\(2(7/10)^{97}/(97(1-(7/10)^2))<10^{-15}\).
For \(\pi\), Machin's identity and 32 terms of each alternating
arctangent series give one-sided errors bounded by the first omitted
terms. Decimal display is rounded outward after summation.

The separate floating diagnostic used 32, 64, 96 and 128 Gauss–Legendre
nodes per variable on each of the two inner regions, evaluating the
three-cofactor norm directly on the tensor product of the \(x,u,\varphi\)
nodes with NumPy 1.25.1. The last three orders gave
\(1.90292651462645\) to the shown precision. The enclosure above comes
from the interval calculation.

## Scope and input identity

The E18 analytic comparison \(I<777\pi/512<2\pi^2t\) also follows
independently of quadrature. In its inner region every cofactor is less
than \(3\), using \(e^u\leq(1-u)^{-1}\) for \(0\leq u<1\) to bound
the germ radii by \(9/8,9/8,5/2\). Each outer region uses
\(\sin^2 r<r^2\). These bounds apply to the named E18 metric, whose cap
midpoints have negative ambient scalar curvature. The area calculation concerns
this explicit metric, while the [independent boundary-flux obstruction](../../notes/BERGER_COMPLETION_OBSTRUCTION_20261127.md)
rules out an entering completion of the exact Berger datum on any homotopy four-sphere.

| Working input or executable | SHA-256 |
| --- | --- |
| `ISSUE_BERGER_ANGULAR_INTEGRAL_20261127.md` | `81fd6733f8cc63b56129ddb79873861d35ea12fc009c964c604fae2e4dc0057b` |
| `ISSUE_BERGER_COMPLETION_20261127.md` | `57bc237161733cf033cdb9eb081c3d0c4fe85e53dabe55cbdf5056c856b58ef8` |
| `E18_SHORT_SUSPENSION.md` | `c874777cf5b5194b985b75d324e53630258f3ee9fa625188cfddc136cb2aec5b` |
| `E06_GERM.md` | `589e2ad26823a71e8c9868afdf6d7ce28776f335f980b868935cf48bedc8f25e` |
| `berger_meridian_area.py` | `20eda86f9f8892156c56958b79dbd8c85fc89ff02bb21b3b6b27ccca11286c5a` |
