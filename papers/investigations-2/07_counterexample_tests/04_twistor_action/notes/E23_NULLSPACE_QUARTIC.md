# Reduced quartic on the first Dirichlet nullspace · SP4-TWA-E23

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. [Frozen request v1](../research-progress/handoffs/E23_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and configured
GPT-6.2 Sol/ultra helper. Actual backend model and reasoning effort
were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`
and all nine frozen input SHA-256 digests matched.

Use the oriented flat Riemannian \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\),
the orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\), and the periodic
spin structure. In the [E14 quaternion model](E14_FIRST_NEGATIVE_MODE.md#clifford-sign-and-stationarity)
of the positive half-spin bundle use the parallel unit spinor \(1\),
Clifford square \(X\cdot X=-|X|^2\), and real parts of Hermitian
pairings. The action is \(S=J_g^4\). Fix \(b=51\pi/16\), \(k=2\pi\)
and \(\omega=\pi/2\). For kernel fields \(W=\cos(\omega t)N(x)\),
write \(N=\sum_j r_j n_j^{\phi_j}\), where \(a_j=r_j e^{i\phi_j}\)
are the complex amplitudes. For cyclic \((j,\ell,m)\) set
\(n_j^{\phi_j}=I_\ell\cos(kx_j+\phi_j)+I_m\sin(kx_j+\phi_j)\)
in the imaginary quaternion basis. These spatial waves have unit
pointwise norm, zero divergence, and curl equal to \(-k n_j^{\phi_j}\).

The minimized fourth-order coefficient of the additive Dirichlet
variation \(e^{bt}(1+\varepsilon W+\varepsilon^2 z)\) has the form

\[
q(W)=A\sum_j|a_j|^4+C\sum_{i<j}|a_i|^2|a_j|^2,\qquad
A=\frac{12227}{6144}\omega^4,\qquad
C\ge\frac{41232414979}{248709120}\omega^4>165\omega^4 .
\]

In particular \(C>2A\) and \(q(W)\ge A(\sum_j |a_j|^2)^2\), with
equality exactly when at most one amplitude is nonzero. All real
scalar and vector corrections in the homogeneous Dirichlet \(H^1\)
complement of the nullspace enter this minimization.

## Additive coefficient and symmetries

Put \(T=\omega t\), \(F=\cos T\), \(\beta=b/\omega=51/8\), and use
primes for \(\partial_T\). Hats on differential operators divide their
first derivatives by \(\omega\). Integrate throughout with \(dt\,dx\),
so the torus has volume one and the time interval has length two.
Write \(A_0=\Pi(dt\otimes\cdot)\), \(\mathcal B=\widehat P+\beta A_0\),
\(a_0=\beta A_0 1\) and \(\nu=|a_0|^2=3\beta^2/4=7803/256\).
For \(u=\operatorname{Re}z\), \(V=\operatorname{Im}z\), define

\[
U=|W|^2,\qquad M_W=|\mathcal BW|^2-\nu U,\qquad
L(z)=2(a_0,\widehat Pz)=\frac{\beta}{2}
                  \big(3u'-\widehat{\operatorname{div}}_x V\big).
\]

The last identity follows by taking the real part of
\((\widehat Pz)(e_0)=\tfrac34\partial_T z+\tfrac14\sum_i I_i\widehat{\partial}_i z\).
For \(W=FN\), \(W\) is imaginary, \(\widehat{\operatorname{div}}_xW=0\),
and \((a_0,\mathcal BW)=0\) pointwise. With
\(h=1+\varepsilon W+\varepsilon^2 z\), write
\(S[e^{bt}h]/\omega^4=\int_M (|\mathcal Bh|^2/|h|^2)^2\).
For smooth zero-trace \(z\) the path is uniformly nonzero at small
\(\varepsilon\). The squared field norm has coefficients
\(1,\ 0,\ U+2u,\ 2(W,z),\ |z|^2\) through degree four.
The quotient has constant coefficient \(\nu\), linear coefficient
zero, quadratic coefficient \(M_W+L(z)\) and quartic coefficient
\(|\mathcal Bz|^2-\nu|z|^2-(M_W+L(z))(U+2u)\).
Squaring thus gives the normalized fourth-order coefficient

\[
\begin{aligned}
\mathcal I_W(z)&=\mathcal I_W(0)+\mathcal L_W(z)+\mathcal Q(z,z),\\
\mathcal I_W(0)&=\int_M(M_W^2-2\nu M_WU),\\
\mathcal L_W(z)&=2\int_M\big((M_W-\nu U)L(z)-2\nu M_Wu\big),\\
\mathcal Q(z,z)&=\beta^2\int_M
  \left(\tfrac98 (|\widehat{d}u|^2+|\widehat{d}V|^2)
  +\tfrac14(3u'-\widehat{\operatorname{div}}_x V)^2
  +\tfrac{3\beta}{4} V\cdot\widehat{\operatorname{curl}}_x V\right).
\end{aligned}
\tag{1}
\]

The quadratic term is one half of the conjugated E14 Hessian divided
by \(\omega^4\), as one can also check from the coefficient at \(W=0\).
Stationarity and the E14 null identity remove the terms at orders
one and two of the integrated action. The cubic term from \(W\)
alone vanishes because the squared norms along \(1+\varepsilon W\)
are even. The mixed cubic term is the Hessian pairing with \(W\)
and vanishes since \(W\) belongs to its kernel.

The coefficient (1) extends continuously to zero-trace \(H^1\) in
\(z\). This is a form-domain extension of the Taylor coefficient
initially computed on smooth fields. Let \(\mathcal K\) be the E14
nullspace and \(\mathcal K^\perp\) its \(L^2\) orthogonal complement in
zero-trace \(H^1\). This complement also equals the \(H^1\) orthogonal
complement because all kernel modes are Laplacian eigenfields with
the same eigenvalue. The form \(\mathcal Q\) is coercive on
\(\mathcal K^\perp\). Indeed the scalar and longitudinal terms of
the E14 block have the full positive gradient bound. In the transverse
block, the next higher negative-helicity resonance is bounded below
by the minimum of the thresholds at spatial length \(k\), temporal
frequency \(2\omega\), and spatial length \(\sqrt2 k\), temporal
frequency \(\omega\). This follows from monotonicity of
\(\lambda+\omega_n^2/\lambda\) at \(\omega_n=\omega,2\omega\) on
\(\lambda\ge k\), and monotonicity in \(\omega_n\) at fixed \(\lambda\).
Both thresholds exceed \(b\), so the transverse gradient has a
strict gap on the complement. Time Poincaré then gives the \(H^1\)
bound. [E14 spectrum](E14_FIRST_NEGATIVE_MODE.md#frequencies-threshold-and-nullity)

Thus \(\omega^{-4}q(W)=\min_{z\in\mathcal K^\perp}\mathcal I_W(z)\)
is a homogeneous real quartic polynomial. The bounded inverse
of \(\mathcal Q\) maps the quadratic forcing \(\mathcal L_W\) to the
minimizing correction, and substitution gives degree four.
Torus translations rotate each of \(a_1,a_2,a_3\) independently, so
only \(|a_i|^4\) and \(|a_i|^2|a_j|^2\) can occur. For an
orientation-preserving signed coordinate permutation \(R\), choose
the unit quaternion \(p\) whose conjugation realizes \(R\) on imaginary
quaternions. The field map \(h(t,x)\mapsto p h(t,R^{-1}x)\bar p\)
fixes \(1\) and preserves the action. Indeed the spatial quaternionic
Dirac sum transforms equivariantly by the rotation of both \(I_i\)
and the derivatives. The gradient and Clifford-projection norms are
preserved. This map preserves the complement and permutes the three
amplitude norms. Transitivity on axes and unordered pairs gives
the claimed common coefficients \(A\) and \(C\).

## Two perpendicular waves and the full forced sector

With \(X=kx_1\), \(Y=kx_2\), take
\(N=(0,\cos X,\sin X)+(\sin Y,0,\cos Y)\).
Then \(m=\sin X\cos Y\) gives \(|N|^2=2(1+m)\) and
\(|\widehat{\nabla}_x N|^2=32\). The two chiral expressions are
\(\widehat D W=-(F'+4F)N\) in the negative factor and
\((\widehat P W)(e_0)=(3F'-4F)N/4\) in the positive factor.
The projection identity
\(|\widehat PW|^2=|\widehat{\nabla}W|^2-|\widehat DW|^2/4\)
and \(A_0^*\widehat PW=(\widehat PW)(e_0)\) yield

\[
M_W=32F^2+\left(\tfrac34(F')^2
 +\tfrac{3\beta-4}{2}FF'-(4+2\beta)F^2\right)2(1+m).
\]

With \(c_2=\cos(2T)\), \(s_2=\sin(2T)\), this gives

\[
\begin{aligned}
M_W&=M_0+mM_1,\qquad U=(1+m)U_0,\qquad U_0=1+c_2,\\
M_0&=-\tfrac32 c_2-\tfrac{121}{16}s_2,\qquad
M_1=-16-\tfrac{35}{2}c_2-\tfrac{121}{16}s_2.
\end{aligned}
\tag{2}
\]

The scalar source and derivative source in (1) involve only \(1\)
and \(m\). Spatial integration by parts turns the divergence in
\(L\) into forcing along \(\widehat{\nabla}_x m\). Thus the projected
correction has the three time coefficients in

\[
z=u_0(T)+u_1(T)m+v_1(T)\widehat{\nabla}_x m .
\tag{3}
\]

This projection separates the whole Dirichlet quadratic form.
The scalar shapes \(1,m\) and the vector shape
\(\widehat{\nabla}_x m\) are eigenfunctions of the corresponding
spatial Laplacians, with eigenvalues \(0,32,32\) for their negatives.
Spatial integration by parts gives orthogonality of their gradient
terms, and the time-derivative terms retain orthogonality. For the
scalar–divergence square,
\(\widehat{\operatorname{div}}_x\widehat{\nabla}_x m=-32m\),
while the divergence of an orthogonal vector remainder pairs to
zero with \(1\) and \(m\). The curl term has no cross pairing with a
gradient. This verifies separation even for additional modes at
the same spatial frequency and for arbitrary real vector components.
The forced space is orthogonal to \(\mathcal K\), since its spatial
frequencies are zero or the mixed second shell. Every other sector
has zero forcing and nonnegative Dirichlet Hessian by E14, and
therefore may be set to zero. In particular there is no surviving
forcing at twice either single wave vector.

Use \(H_j=M_j-\nu U_0\) for \(j=0,1\), \(G_1=3u_1'+32v_1\), and let
\(\langle\, ,\,\rangle\) and \(\|\cdot\|\) be the real time pairing
and norm in \(L^2(dt)\). The spatial integrals
\(\int m=0\), \(\int m^2=1/4\), and
\(\int|\widehat{\nabla}_x m|^2=8\) reduce (1) to

\[
\begin{aligned}
\mathcal I_W(0)&=\|M_0\|^2+\tfrac14\|M_1\|^2
 -2\nu\langle U_0,M_0+M_1/4\rangle=\tfrac{575557}{512},\\
\mathcal L_W&=3\beta\langle H_0,u_0'\rangle-4\nu\langle M_0,u_0\rangle
 +\tfrac{\beta}{4}\langle H_1,G_1\rangle-\nu\langle M_1,u_1\rangle,\\
\mathcal Q&=\tfrac{27}{8}\beta^2\|u_0'\|^2
 +\tfrac{\beta^2}{4}\left[
 \tfrac98(\|u_1'\|^2+32\|u_1\|^2+
                  32\|v_1'\|^2+1024\|v_1\|^2)+\tfrac14\|G_1\|^2\right].
\end{aligned}
\tag{4}
\]

## Exact lower certificate by periodic relaxation

Relax just the three time coefficients in (3) from zero endpoint
values to equal endpoint values on \([-\pi/2,\pi/2]\) in \(T\).
They now belong to the period-\(\pi\) \(H^1\) space. This enlarges
the set of corrections in the already separated forced sector.
The unforced sectors were dealt with on the original Dirichlet
space. Equation (4) is nonnegative in its quadratic part on the
periodic forced sector as well, and separates by time frequencies
because its coefficients are constant. The forcing has only
frequencies \(0,\pm2\) in \(T\). The constant in \(u_0\) is both
unforced and quadratic-null, and all higher harmonics minimize at
zero. Here \(c_2,s_2\) each have squared \(L^2(dt)\) norm one and
the constant has squared norm two.

The table uses \(u_{j,c},u_{j,s}\) for the cosine and sine coefficients
of \(u_j\), and indices \(c,s\) for the corresponding coefficients
of \(v_1\). Its constant coefficients have index \(0\). If a row has
variables \(x,y\), quadratic term
\(\beta^2(d x^2+2e xy+f y^2)\) and force \(l_x x+l_y y\),
the decrease from the constant term on minimizing is

\[
\frac{f l_x^2-2e l_xl_y+d l_y^2}{4\beta^2(df-e^2)}.
\]

Using \(c_2'=-2s_2,\ s_2'=2c_2\) in (4) gives the four blocks below.
In particular the two mixed off-diagonal entries come from
\(G_1=3u_1'+32v_1\).

| Variables \((x,y)\) | \((d,e,f)\) | \((l_x,l_y)\) | Exact decrease |
| --- | --- | --- | --- |
| \((u_{0,c},u_{0,s})\) | \((27/2,0,27/2)\) | \((60435/128,-9639/32)\) | \(219529/1536\) |
| \((u_{1,0},v_{1,0})\) | \((18,0,704)\) | \((7803/8,-606849/128)\) | \(375967513/720896\) |
| \((u_{1,c},v_{1,s})\) | \((99/8,-12,388)\) | \((310131/512,-6171/16)\) | \(43111473/235520\) |
| \((u_{1,s},v_{1,c})\) | \((99/8,12,388)\) | \((-29223/128,-626433/256)\) | \(8754813/81920\) |

For example, the two mixed cosine-sine forces for the third row are
\(-3\beta H_{1,s}/2-\nu M_{1,c}\) and \(8\beta H_{1,s}\).
The constant mixed forces are \(32\nu\) and \(16\beta(-16-\nu)\).
The positivity of both mixed matrices follows from
\((99/8)388-12^2=9315/2\). Subtracting the table entries from the first
line of (4) gives the exact relaxed minimum. Hence for the full
original Dirichlet complement,

\[
\frac{q(1,1,0)}{\omega^4}\ge
\frac{575557}{512}
 -\frac{237360255421}{248709120}
=\frac{42222312899}{248709120}>169.
\tag{5}
\]

## Exact single-wave coefficient and full sign

For the single wave \(N=(0,\cos X,\sin X)\), the same projection
calculation gives \(U=U_0/2\) and \(M_W=M_0/2\), with \(U_0,M_0\)
from (2). Only the scalar mean \(u_0\) is forced. The orthogonality
argument for (3) applies with the mixed block absent, so all scalar
nonconstant and vector modes can be set to zero. The normalized
constant term for that direction is one quarter of the pure mean
contribution \(19313/128\) in the first line of (4). The mean forcing
is one half of that in (4), and its Hessian is unchanged. Its
periodic relaxation is exact for the Dirichlet problem because a
periodic function has a common endpoint value which can be subtracted
without changing the quadratic or linear term. The derivative term
is invariant under this subtraction, and \(\int M_0\,dt=0\) makes
the remaining source invariant. Thus

\[
\frac A{\omega^4}=
\frac14\left(\frac{19313}{128}-\frac{219529}{1536}\right)
=\frac{12227}{6144}.
\]

In the [E15 helical chart](E15_HELICAL_COMPETITOR.md), the path
\(e^{\varepsilon^2 w}(\cos(\varepsilon F)+\sin(\varepsilon F)n_1)\)
has additive correction \(z=w-F^2/2\). This shift maps the whole
zero-trace scalar mean space to itself. The third- and fourth-order
differences of paths make zero contribution to the quartic action
coefficient by the null Hessian pairing with \(W\) and stationarity,
respectively, for their zero-trace coefficients. This explains the
agreement with E15 and shows why its one-wave value survives the
full scalar and vector relaxation.

The invariant polynomial has \(q(1,1,0)=2A+C\). Equation (5) gives
the displayed lower bound for \(C\), and also

\[
\frac{C-2A}{\omega^4}\ge
\frac{13414172353}{82903040}>0 .
\]

This is the sign of the full reduced quartic at the first nullspace.
The exact Dirichlet two-wave minimum was bounded from below by a
periodic minimum, so the calculation gives a lower certificate for
the mixed coefficient. It concerns the fourth-order coefficient at
the specified stationary field and slope. A nonlinear local
minimality theorem, a finite-amplitude comparison and the sharp
global transition are separate problems.

## Sources and reproducibility

Checked the nine frozen inputs, including the [E14 Hessian and spectrum](E14_FIRST_NEGATIVE_MODE.md),
[E15 chart and coefficient](E15_HELICAL_COMPETITOR.md), and
[B08 choice](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md). The
projection and equation (1.1) in Friedrich's published §1, p. 59,
were rechecked on 28 November 2026 for the Riemannian twistor sign.
The [E18 equal-wave control](E18_TWO_HELICES.md) supplied a comparison
for the candidate periodic lower bound. Equations (1)–(4) recompute
the actual forcing, and the independent block calculation checks
the rational certificate and the Dirichlet complement.
[Friedrich, published scan](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
