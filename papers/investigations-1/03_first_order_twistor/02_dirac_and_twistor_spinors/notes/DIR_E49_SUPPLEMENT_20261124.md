# SP4-FOT-DIR-E49 supplement · Arguments completed for the manuscript

24 November 2026, America/New_York. Prepared for Edward B. Baker III with LLM
assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning
effort max as the session's configuration records it. Written while the
session put the results of [E48](DIR_E48_20261124.md), [E49](DIR_E49_20261124.md)
and [E50](DIR_E50_20261124.md) into the
[manuscript](../manuscript/dirac_twistor_and_yamabe_rigidity.tex) at the
author's request. This is a supplement to the E49 note by the session that
wrote it. No new packet was issued, and no second reader checked it.
[Owning register][register] · [Computation record][numerics] ·
[Draft history](../DRAFT_HISTORY.md).

**Result.** Three statements about the Delaunay metrics on $S^1(L)\times S^3$
that E49 took from numerics or from the imported description now have short
proofs: the period $T(m)$ increases, the bound
$3\lambda_5/s-1\le R(m)-1$ needs no identification of $\lambda_5$, and a
multiply wrapped solution is unstable. With the symmetry theorem of
Caffarelli, Gidas and Spruck and the existence of a minimizer, these give the
full statement that the one-period Delaunay metric is the Yamabe minimizer
and that its relative pinching tends to zero. Two exact curvature identities
are added. The equality $\epsilon=\nu_1(m)-1$, the coefficient $15/16$ as an
equality and the joint-law table of E49 remain numerical.

Notation is that of E49: $g_0=dt^2+g_{S^3}$, $u_m(t)=\operatorname{dn}(x\,|\,m)$
with $x=t/\sqrt{2-m}$, $m_1=1-m$ (written $m'$ in E49), $g_m=u_m^2g_0$,
$s=12/(2-m)$, $T(m)=2K\sqrt{2-m}$, $I_{2j}=\int_0^K\operatorname{dn}^{2j}$, and

\[
 R(m)=\frac{4(2-m)I_4-I_6-m_1E}{4I_6}.
\]

## 1. The period increases

With $2mm_1\,dK/dm=E-m_1K$ and $2m\,dE/dm=E-K$,

\[
 T'(m)=\frac{F(m)}{m\,m_1\sqrt{2-m}},\qquad F(m)=(2-m)E-2m_1K,\qquad
 F(0)=0,\qquad F'(m)=\tfrac32(K-E)>0 .
\]

So $T$ is an increasing bijection from $(0,1)$ onto $(\sqrt2\,\pi,\infty)$.
E49 had confirmed this on a grid. Schoen's count of solutions on
$S^1\times S^{n-1}$ depends on the corresponding monotonicity, which his
notes leave unchecked ([R99][sources]); this settles it for $n=4$.

## 2. Periodic solutions from the first integral

A positive periodic solution of $-6u''+6u=su^3$ conserves
$u'^2-u^2+su^4/12$. If it is not constant, translate and scale it so that its
maximum is $u(0)=1$; scaling $u$ rescales $s$. Equating the first integral at
the maximum and at the minimum $u_{\min}\in(0,1)$ gives $u_{\min}^2=12/s-1$,
hence $6<s<12$ and $s=12/(2-m)$ for one $m\in(0,1)$. The function $u_m$ solves
the same initial value problem, so $u=u_m$. With the radial symmetry of
[R107][sources], the metrics of constant scalar curvature in $[g_0]$ on a
circle of length $L$ are the multiples of $g_0$ and of
$u_m(t-t_0)^2g_0$ with $T(m)=L/j$, $j\ge1$.

## 3. Multiply wrapped solutions are unstable

For a function $\phi$ of $t$, $\Delta_{u^2g_0}\phi=-u^{-4}(u^2\phi')'$ and the
Rayleigh quotient is $\int u^2\phi'^2dt/\int u^4\phi^2dt$. The function
$\sigma=u'/u$ satisfies $-(u^2\sigma')'=\tfrac s3u^4\sigma$. Let $u=u_m$ on a
circle of length $jT(m)$ with $j\ge2$. Then $\sigma$ has $2j\ge4$ zeros. Let
$J_1,J_2,J_3$ be three of the arcs between consecutive zeros and $\sigma_i$
the restriction of $\sigma$ to $J_i$, extended by zero. Integration by parts
on $J_i$ gives $\int u^2\sigma_i'^2=\tfrac s3\int u^4\sigma_i^2$. Choose
$(a_1,a_2)\ne0$ with $\int u^4(a_1\sigma_1+a_2\sigma_2)\,dt=0$. The function
$\psi=a_1\sigma_1+a_2\sigma_2$ has mean zero and Rayleigh quotient $s/3$. If
$\lambda_1\ge s/3$ it would be a first eigenfunction, hence a solution of the
linear equation above that vanishes on $J_3$, hence zero. So $3\lambda_1<s$.
E49 had quoted Sturm oscillation for this step.

A minimizer exists, has constant scalar curvature and satisfies
$s\le3\lambda_1$. The product has $\lambda_1\le(2\pi/L)^2<2=s/3$ for
$L>\sqrt2\,\pi$. Hence for $L>\sqrt2\,\pi$ the minimizers are exactly the
translates and multiples of $g_m$ with $T(m)=L$, and for $L\le\sqrt2\,\pi$
they are the multiples of $g_0$.

## 4. The bound for $\lambda_5$ without identifying it

Let $\theta_1,\dots,\theta_4$ be the coordinate functions on $S^3$. For
$\phi=f(t)\theta_i$ the Rayleigh quotient in $g=u^2g_0$ is
$\int u^2(f'^2+3f^2)dt/\int u^4f^2dt$, and for $u=f=u_m$ it equals
$\tfrac s3R(m)$, by
$\int_0^K\operatorname{dn}^2\operatorname{dn}'^2=(2-m)I_4-I_6-m_1E$. The five
functions $\sigma,u_m\theta_1,\dots,u_m\theta_4$ have mean zero and are
mutually orthogonal in $L^2(dV_g)$ and in the Dirichlet form, because
$1,\theta_1,\dots,\theta_4$ are orthogonal on $S^3$. On the span of the last
four the Rayleigh quotient is identically $\tfrac s3R(m)$, so
$\lambda_4\le\tfrac s3R(m)$; since $\lambda_1=s/3$ this gives $R(m)\ge1$. On
the span of all five the quotient is then at most $\tfrac s3R(m)$, and the
min–max principle gives

\[
 0\le\frac{3\lambda_5}{s}-1\le R(m)-1=\tfrac{15}{16}m_1+O\bigl(m_1^2\log\tfrac1{m_1}\bigr),
 \qquad \frac{A(g_m)}{s}\le\tfrac45\bigl(R(m)-1\bigr).
\]

E49 stated this bound "given the identification of $\lambda_5$". The
identification is not needed for the upper bound, so
$\epsilon(g_L)\to0$ is now a theorem, with
$\epsilon\le(\tfrac52+o(1))(1-Y/Y(S^4))$.

## 5. Two curvature identities

In the arclength $r$ along the axis the metric is $dr^2+u^2g_{S^3}$, with
$K_{\rm rad}=\tfrac s{12}-cu^{-4}$, $K_{\rm tan}=\tfrac s{12}+cu^{-4}$ and
$c=m_1/(2-m)$, so

\[
 {\rm Ric}_0=\frac c{u^2}\bigl(-3\,dt^2+g_{S^3}\bigr),\qquad
 {\rm Hess}_0\,\sigma=\sigma\,{\rm Ric}_0 .
\]

The least Ricci eigenvalue is attained at the necks and equals
$\tfrac s4(1-1/m_1)$. It is negative for every $m\in(0,1)$, which sharpens
the statement in E49 that it tends to $-\infty$.

The function $\sqrt{m_1}/\operatorname{dn}$ solves
$w''=(2-m)w-2w^3$ with the initial data of $\operatorname{dn}(\cdot+K)$, so
$u_m(t+T/2)=\sqrt{m_1}/u_m(t)$. This inversion exchanges
$\int u^4$ with $m_1^2\int u^{-4}$ and $\int u'^2u^2$ with
$m_1^2\int u'^2u^{-6}$. It gives $\int|{\rm Ric}_0|^2=s^2{\rm Vol}/12$
directly, in agreement with Gauss–Bonnet, and

\[
 \int|{\rm Hess}_0\,\sigma|^2\,dV=-\int{\rm Ric}_0(\nabla\sigma,\nabla\sigma)\,dV
 =\int\sigma^2|{\rm Ric}_0|^2\,dV=\frac{s^2}{12}\int\sigma^2\,dV
\]

exactly, at every length. [E50](DIR_E50_20261124.md) had the first equality
from its Bochner identity and the value from the computed record.

## What changed in the status of E49

| Statement | In E49 | Now |
| --- | --- | --- |
| $T(m)$ increasing | grid of 2,200 values | proved (§1) |
| periodic solutions are the $u_m$ | imported from Schoen | proved from the first integral (§2), given radial symmetry |
| multiply wrapped solutions unstable | Sturm oscillation, quoted | proved (§3) |
| $\epsilon\le R(m)-1$ | given the identification of $\lambda_5$ | proved without it (§4) |
| $\epsilon=\nu_1(m)-1$, coefficient $15/16$ as an equality | numerical | numerical |
| joint-law quantities | numerical | numerical |
| radial symmetry of solutions | imported, source not inspected | imported; statement inspected ([R107][sources]) |

## Inputs and evidence

Working tree at HEAD `3fb565b70247a57e4fcc7e65886c57ce0ca0e1ab` with the
uncommitted files of this session's first turn. The proofs above are direct.
Imported with their hypotheses: Theorem 8.1 of Caffarelli, Gidas and Spruck,
applied to $v=u/|y|$ on $\mathbb R^4\setminus\{0\}$ with the nonlinearity
$sv^3/6$ ([R107][sources]); the existence and regularity of a Yamabe
minimizer, as the manuscript already cites it; the derivative formulas and
the expansions of $K$ and $E$ from the NIST Digital Library
([R108][sources]). The script
[e49_manuscript_checks.py](../numerics/e49_manuscript_checks.py), with output
[E49_MANUSCRIPT_CHECKS.txt](../numerics/E49_MANUSCRIPT_CHECKS.txt), checks at
thirty digits the formula for $T'$ and $F'$, the half-period inversion, the
eigen-equation of $\sigma$ and the Rayleigh quotient $s/3$ of one nodal arc,
the closed form of $R(m)$ against quadrature, $R(m)>1$ on 207 values of $m$,
and both curvature integrals. It confirms with sympy the two sectional
curvatures, $\Delta\sigma=\tfrac s3\sigma$ and
${\rm Hess}_0\,\sigma=\sigma\,{\rm Ric}_0$, and compares $R(m)$ with the
computed fifth eigenvalue at eight values of $m$. All checks pass. These are
checks of algebra and not proofs. The same model wrote E49, this supplement
and the manuscript section in one session, so this is not an independent
check.

[register]: ../research-progress/REGISTER.md
[numerics]: ../numerics/README.md
[sources]: ../../../../../references/SOURCE_NOTES_DIRAC_B23_20261124.md
