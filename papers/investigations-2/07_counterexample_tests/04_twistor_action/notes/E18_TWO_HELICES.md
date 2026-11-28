# Equal perpendicular critical helices · SP4-TWA-E18

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request v1](../research-progress/handoffs/E18_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and configured GPT-6.2
Sol/ultra helper. Actual backend serving variant and reasoning effort
were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and
all eight frozen input digests matched.

The minimized fourth-order coefficient in the specified two-helix test
with the four time levels per parity below is
\[
\omega^4\,\frac{29772745866921709978958207563}{174281498283558407756021760}
>170\,\omega^4,\qquad \omega=\frac{\pi}{2}.
\]
The test therefore yields no cheaper small-amplitude field at the
crossing and supplies no interval of subthreshold slopes with a cheaper
field. A separate lower certificate for the same equal-amplitude
kernel direction is \(42222312899\,\omega^4/248709120>169\,\omega^4\)
for every smooth homogeneous-Dirichlet second-order correction.

## Quartic at the null mode

Use the oriented flat Riemannian \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\)
with orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\), periodic spin
structure and commuting positive half-spinors. Identify the parallel
unit spinor with \(1\) in the E14 quaternion frame and use the real part
of the Hermitian pairing. Clifford square is negative, and the action
is \(S=J_g^4\). Fix \(b=51\pi/16\) and \(k=2\pi\). Put
\(T=\omega t\), \(X=kx_1\), \(Y=kx_2\), \(\beta=b/\omega=51/8\) and
\(F=\cos T\). A prime denotes \(\partial_T\). Scale all first derivatives
by \(\omega^{-1}\), denoting the resulting operators by
\(\widehat P,\widehat D,\widehat\nabla,\widehat{\operatorname{div}}\)
and \(\widehat{\operatorname{curl}}\). Integrals still use \(dt\,dx\)
and the spatial torus has volume \(1\). Define
\[
N=(0,\cos X,\sin X)+(\sin Y,0,\cos Y),\quad
m=\sin X\cos Y,\quad w=FN .
\]
The orientations give \(\operatorname{div}_x N=0\) and
\(\operatorname{curl}_x N=-kN\), with \(|N|^2=2(1+m)\).
Because \(F(\pm\pi/2)=0\), the spinors
\(\psi=e^{bt}(1+\varepsilon w+\varepsilon^2z)\) have the prescribed
traces \(e^{\pm b}\) whenever \(z\) has zero value at the two ends. For
each such smooth \(z\), these spinors are smooth and nowhere zero
for sufficiently small \(|\varepsilon|\), by uniform closeness of the
conjugated spinor to \(1\). [Quaternion sign and Hessian](E14_FIRST_NEGATIVE_MODE.md)

Write \(A=\Pi(dt\otimes\cdot)\), \(\mathcal B=\widehat P+\beta A\),
\(a=\beta A1\), and \(\nu=|a|^2=3\beta^2/4\). At the conjugated spinor
\(h=1+\varepsilon w+\varepsilon^2z\), the normalized squared twistor
quotient is \(Q_\varepsilon=|\mathcal Bh|^2/|h|^2\), so
\(S/\omega^4=\int_M Q_\varepsilon^2\). The quaternion formula for the
time component of \(P\) gives \((a,\mathcal Bw)=0\) pointwise. Define
\[
U=|w|^2,\quad M_w=|\mathcal Bw|^2-\nu U,\quad
u=\operatorname{Re}z,\quad
L(z)=2(a,\widehat Pz)=\tfrac{\beta}{2}
       (3u'-\widehat{\operatorname{div}}_x\operatorname{Im}z).
\]
The denominator squared norm begins with \(1+\varepsilon^2(U+2u)\).
The coefficient of \(\varepsilon^2\) in \(Q_\varepsilon\) is therefore
\(M_w+L(z)\), since \(2(a,\mathcal Bz)=L(z)+2\nu u\). The coefficient
of \(\varepsilon^4\) in \(Q_\varepsilon\) is
\[
|\mathcal Bz|^2-\nu|z|^2-(M_w+L(z))(U+2u).
\]
There is no coefficient of \(\varepsilon\) in \(Q_\varepsilon\).
Squaring gives the normalized integrated fourth-order coefficient
\[
\mathcal I(z)=\int_M(M_w^2-2\nu M_w U)
 +2\int_M\big((M_w-\nu U)L(z)-2\nu M_w u\big)+\mathcal Q(z,z).
\]
Here \(\mathcal Q(z,z)\) is half the real E14 Hessian divided by
\(\omega^4\) in the conjugated coordinates. This identification also
follows by setting \(w=0\) in the quartic expansion, so the perturbation
of the conjugated spinor is solely \(\varepsilon^2 z\).

For the explicit \(M_w\), the chiral Dirac expression on \(w\) is
\(\widehat D w=-(F'+4F)N\), and \((\widehat Pw)_0=(3F'-4F)N/4\).
The projection norm is
\(|\widehat Pw|^2=|\widehat\nabla w|^2-\tfrac14|\widehat D w|^2\).
Also \(A^*\widehat Pw=(\widehat Pw)_0\) and
\(|\widehat\nabla w|^2=(F')^2|N|^2+32F^2\). Substitution gives
\[
M_w=32F^2+\left(\tfrac34(F')^2+
  \tfrac{3\beta-4}{2}FF'-(4+2\beta)F^2\right)|N|^2.
\]
In terms of \(C=\cos(2T)\) and \(S_2=\sin(2T)\), this is \(M_0+mM_1\),
and \(U=(1+m)U_0\), where
\[
M_0=-\tfrac32 C-\tfrac{121}{16}S_2,\qquad
M_1=-16-\tfrac{35}{2}C-\tfrac{121}{16}S_2,\qquad U_0=1+C .
\]
These formulas give \(\int_M M_w=0\), and zero traces and periodicity
give \(\int_M L(z)=0\). This verifies the null second-order action
coefficient. The fourth-order expansion for the product-mode \(z\)
below has remainder \(O(\varepsilon^6)\). Indeed translation by
\((1/2,1/2,0)\) negates \(w\) and fixes \(z\), so the integrated
action is even in \(\varepsilon\). Its analyticity near zero follows
from the positive lower norm bound. This also verifies the cubic
cancellation directly in the finite family. For general smooth
zero-trace \(z\), Taylor expansion at the stationary field gives the
cubic coefficient as the sum of the pure-\(w\) cubic and the Hessian
pairing of \(w\) and \(z\). The pure cubic is zero because
\(\operatorname{Re}w=(a,\mathcal Bw)=0\) gives pointwise evenness
when \(z=0\), and the pairing vanishes because \(w\) is in the E14
Hessian kernel. The remainder after the quartic term for general fixed
\(z\) is \(O(\varepsilon^5)\).

## Product sectors and exact minimization

Use each of the four even profiles \(E_j=\cos(2jT)-(-1)^j\) and four
odd profiles \(O_j=\sin(2jT)\), \(1\le j\le4\). All vanish at both
ends. The real spatial product modes have frequencies
\((0,0)\), \((\pm2,0)\), \((0,\pm2)\) and \((\pm1,\pm1)\) in the angular
coordinates \(X,Y\). The linear term of \(\mathcal I\) forces only
\[
z=u_0(T)+u_1(T)m+v_1(T)\widehat\nabla_x m .
\]
Here the last term is an imaginary spinor. The mixed scalar
shape is \(m\), and integration by parts sends the mixed divergence
forcing to the vector shape \(\widehat\nabla_xm\).
The Hessian separates this subspace from its spatial orthogonal
complement. In the gradient terms this follows from
\(-\omega^{-2}\Delta_xm=32m\) and its gradient version. In the
scalar–divergence square the identities
\(\widehat{\operatorname{div}}_x\widehat\nabla_x m=-32m\) and spatial
integration by parts give the separation. The curl term has zero
cross pairing with a gradient. The orthogonal complement in the
product modes is unforced and has nonnegative Hessian by E14. Thus
the minimum is achieved in the displayed 24-dimensional real sector.

Set \(G_1=3u_1'+32v_1\). Write \(\langle f,g\rangle=\int_{-1}^1 fg\,dt\),
and \(\|f\|^2=\langle f,f\rangle\). The spatial identities
\(\int m=0\), \(\int m^2=1/4\), and
\(\int|\widehat\nabla_xm|^2=32/4\) yield
\[
\begin{aligned}
\mathcal I(0)&=\|M_0\|^2+\tfrac14\|M_1\|^2
  -2\nu\langle U_0,M_0+M_1/4\rangle=\frac{575557}{512},\\
\mathcal L(z)&=3\beta\langle M_0-\nu U_0,u_0'\rangle
-4\nu\langle M_0,u_0\rangle
+\tfrac{\beta}{4}\langle M_1-\nu U_0,G_1\rangle
-\nu\langle M_1,u_1\rangle,\\
\mathcal Q(z,z)&=\tfrac{27}{8}\beta^2\|u_0'\|^2+
 \tfrac{\beta^2}{4}\left[
 \tfrac98(\|u_1'\|^2+32\|u_1\|^2
             +32\|v_1'\|^2+1024\|v_1\|^2)+\tfrac14\|G_1\|^2\right].
\end{aligned}
\]
Then \(\mathcal I=\mathcal I(0)+\mathcal L+\mathcal Q\).
The quadratic form is positive definite on the trial space because all
three time functions have zero end values and \(\beta\ne0\).
For the basis \(e_i\) of the displayed sector, assign the \(E_j,O_j\)
to each of \(u_0,u_1,v_1\) in turn, in increasing \(j\) within each parity.
The explicit minimizing correction has these time coefficient
coordinates \(c=-\tfrac12 H^{-1}d\), where the rational entries are
\(H_{ij}=\mathcal Q(e_i,e_j)\) by polarization and
\(d_i=\mathcal L(e_i)\). The minimum is
\(\mathcal I(0)+\tfrac12 d^\mathsf{T}c\).

## Lower certificate over all Dirichlet time profiles

The separation by the spatial shapes \(1,m,\widehat\nabla_x m\) uses
their spatial eigenspace and integration-by-parts properties, so it
also applies to any smooth homogeneous-Dirichlet \(z\). The linear term
vanishes on the orthogonal spatial complement, and its quadratic
term is nonnegative by the E14 Dirichlet Hessian result at \(b=b_H\).
Keep that complement in the original Dirichlet space. The three forced
time coefficients with zero endpoint values belong to the larger
periodic \(H^1\) form domain on the interval of length \(\pi\) in \(T\).
Relax only these three coefficients to that domain, using the same
displayed quadratic expression and the same linear term.

The constant mean-scalar coefficient is unforced and has zero
quadratic cost. The forcing on the remaining coefficients lies at
frequencies \(0\) and \(2\) in \(T\). All higher periodic modes are
orthogonal to these modes in the constant-coefficient form and have
nonnegative quadratic energy. Minimizing on \((1,\cos(2T),\sin(2T))\)
for each forced coefficient, omitting the constant mean-scalar
coefficient, gives \(42222312899/248709120>169\). By inclusion this is
a lower bound for \(\mathcal I(z)\) for every smooth zero-trace \(z\)
with this fixed \(w\), including the product family. It uses the same
quartic Taylor coefficient and does not assert any competing field
with periodic ends. The code below replays both rational calculations.

```python
from fractions import Fraction as F

beta = F(51, 8)
nu = 3 * beta**2 / 4
mean = {(1, "c"): F(-3, 2), (1, "s"): F(-121, 16)}
mixed = {**mean, (0, "c"): -16, (1, "c"): F(-35, 2)}
unit = {(0, "c"): 1, (1, "c"): 1}

def add(f, g, scale=1):
    result = f.copy()
    for mode, value in g.items():
        result[mode] = result.get(mode, 0) + scale * value
    return result

def dot(f, g):
    return sum(((2 if j == 0 else 1) * a * g.get((j, kind), 0)
                for (j, kind), a in f.items()), F(0))

def derivative(f):
    return {(j, "s" if kind == "c" else "c"):
            2*j*(-a if kind == "c" else a)
            for (j, kind), a in f.items() if j}

def divergence(u, v):
    return add({mode: 3*a for mode, a in derivative(u).items()}, v, 32)

def linear(z):
    u0, u1, v1 = z
    return (3*beta*dot(add(mean, unit, -nu), derivative(u0))
            - 4*nu*dot(mean, u0)
            + beta*dot(add(mixed, unit, -nu), divergence(u1, v1))/4
            - nu*dot(mixed, u1))

def bilinear(z, w):
    u0, u1, v1 = z
    a0, a1, b1 = w
    gradient = (dot(derivative(u1), derivative(a1)) + 32*dot(u1, a1)
                + 32*dot(derivative(v1), derivative(b1)) + 1024*dot(v1, b1))
    return beta**2 * (F(27, 8)*dot(derivative(u0), derivative(a0))
                      + F(9, 32)*gradient
                      + dot(divergence(u1, v1), divergence(a1, b1))/16)

def minimize(basis):
    force = [linear(e) for e in basis]
    rows = [[bilinear(e, f) for f in basis] + [-d/2]
            for e, d in zip(basis, force)]
    for j, row in enumerate(rows):
        pivot = row[j]
        assert pivot > 0
        row[j:] = [x/pivot for x in row[j:]]
        for below in rows[j+1:]:
            multiplier = below[j]
            below[j:] = [x - multiplier*y
                         for x, y in zip(below[j:], row[j:])]
    c = []
    for j in reversed(range(len(rows))):
        row = rows[j]
        c.insert(0, row[-1] - sum(x*y for x, y in zip(row[j+1:-1], c)))
    constant = dot(mean, mean) + dot(mixed, mixed)/4 - 2*nu*dot(
        unit, add(mean, mixed, F(1, 4)))
    return constant + sum(x*y for x, y in zip(force, c))/2, c

trial, periodic = [], []
for component in range(3):
    for kind in ("c", "s"):
        for j in range(1, 5):
            v = [{}, {}, {}]
            v[component][j, kind] = 1
            if kind == "c":
                v[component][0, "c"] = -(-1)**j
            trial.append(v)
    for mode in ((0, "c"), (1, "c"), (1, "s")):
        if component or mode[0]:
            v = [{}, {}, {}]
            v[component][mode] = 1
            periodic.append(v)

minimum, correction = minimize(trial)
assert minimum == F(29772745866921709978958207563, 174281498283558407756021760)
assert minimum > 170
assert minimize(periodic)[0] == F(42222312899, 248709120)
```

## Source inspection and scope

Checked Friedrich's published §1 projection and equation (1.1) on
28 November 2026 for \(P_X=\nabla_X+X\cdot D/4\) in dimension four.
The orientation sign and Hessian used here are the fixed-background
calculation in E14. The small-slope estimates in the frozen E11–E13
inputs concern their separate prescribed range. The present quartic
test fixes the equal specified first-order helices. The exact
minimizer is in the displayed correction family and the relaxed
certificate bounds the same quartic over all smooth homogeneous-
Dirichlet second-order corrections. Other first-order kernel
amplitudes, finite perturbations and different end data remain outside
the result.
[Friedrich, published copy, §1](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) ·
[E14 calculation](E14_FIRST_NEGATIVE_MODE.md) ·
[E13 independent replay](../reviews/E13_GLOBAL_MINIMUM_REPLAY.md)
