# Independent check of the paired current and shifted round dilation

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. GPT-6.2 Sol/ultra was requested for the
bounded check. Actual serving settings are unavailable. Starting checkout
`7db310a`. Checked the working E13 note with SHA-256
`66790fb98b330d1d50b3436537d10c7f027e1b257d6ad752d061153f463948cd`.
[Check request](../research-progress/handoffs/CURRENT_CHECK_REQUEST_20261125.md)
· [E13 derivation](../notes/E13_THIRD_COLLAR_20261125.md)

## Face signs and angular part

For \(h=e^{2u}g\) put \(q_g(U)=\int_U\sigma_2(A_g)dV_g\) with
\(A_g=(\operatorname{Ric}_g-s_g g/6)/2\). EXTRACT-E07 fixes
\(J=q_g(U)-q_h(U)\). With the forward normal on both normalized faces,
write \(p=\rho u_{\nu_g}\), \(x=1+p\), and \(f=u|_\Sigma\).
Substitution into E07 (6) gives the flat-unit-sphere terms
\(-p\Delta f-\tfrac12(1+p)|Df|^2-\tfrac12(3p^2+p^3)\).
Here \(3p^2+p^3=P(x)=x^3-3x+2\) and the face integral of
\(\Delta f\) is zero. The remaining terms are
\(\bar N_0(\bar\nu,p\bar\nu+Df)
 -(\bar{II}-\bar\gamma)(Df,Df)/2-(\bar H-3)p^2/2\),
as in E13 (1). Under reversal of the normal,
\(p,\bar{II},\bar H,\bar\nu\) all reverse, so each term of E07 (6)
changes sign. The inner outward contribution is \(-F_-\), and the
outer outward contribution is \(F_+\).
[EXTRACT-E07, (2), (5) and (6)](../notes/E07_CONFORMAL_BOUNDARY_CURRENT_20261125.md)

Writing \(x=m+\xi\) with \(\int\xi=0\) gives
\[
 F_\Sigma=-\tfrac12\left(VP(m)+
       \int_\Sigma[3m\xi^2+\xi^3+(m+\xi)|Df|^2+2\xi\Delta f]\,d\mu\right)
       +R_\Sigma .
\]
The measures and differential operators are for the actual rescaled
induced metric. The signed difference and the Hölder estimates in
E13 (2), (4) and (5) follow. On the plateau test, \(\xi=-\varepsilon\phi\),
\(Df=\varepsilon D\phi\), \(\Delta f=-3\varepsilon\phi\) on the outer
face. The cubic terms are odd under reflection of the coordinate
\(\phi\). The remainder is zero on the flat faces. The term
\(2\xi\Delta f\) therefore gives
\(J=-3\varepsilon^2\int_{S^3}\phi^2\,d\mu\), with sign reversed when
the outer slope perturbation reverses. This test is local and assumes
no positivity of target Ricci.

## Round dilation and an exact face mean

Let \(g=c^2(1+r^2)^{-2}\delta\) be unit-volume round \(S^4\) in
stereographic coordinates, with the fixed constant \(c>0\). Let
\(\Phi_b(z)=b^2z-be_1\), \(h_b=\Phi_b^*g\), \(R=b^2r\) and
\(s=\theta\cdot e_1\). The outward radial normal and areal radius
\(\rho=cr/(1+r^2)\) give \(p=r\partial_r u_b\). Differentiating
\[
 u_b=\log b^2+\log(1+r^2)-\log(1+b^2+R^2-2bRs)
\]
gives
\[
 x_b=\frac{1+b^2-R^2}{A-2bRs}+\frac{2r^2}{1+r^2},
 \qquad A=1+b^2+R^2 .
\]
The rescaled induced measure is exactly the unit round \(S^3\) measure.
Its polar density after taking the mean of functions of \(s=\cos\theta\)
is \(2\sin^2\theta\,d\theta/\pi\). For \(A>|B|\),
\(\int_0^\pi(A-B\cos\theta)^{-1}d\theta=\pi/\sqrt{A^2-B^2}\)
by the half-angle substitution. Division of \(1-\cos^2\theta\) by
\(A-B\cos\theta\) then yields
\(\fint_{S^3}(A-Bs)^{-1}=2/(A+\sqrt{A^2-B^2})\), with the
\(B=0\) formula by continuity. Hence the exact mean is
\[
 m_b(r)=
 \frac{2(1+b^2-R^2)}{A+\sqrt{(1+(R-b)^2)(1+(R+b)^2)}}
      +\frac{2r^2}{1+r^2}.
 \tag{1}
\]

For fixed \(a>0\) and \(R=b\pm a\), (1) gives
\(m_\pm=\mp 2a/b+O_a(b^{-2})\).
On each such face the denominator of the angular part of \(x_b\)
is \(1+a^2+2bR(1-\cos\theta)\).
In the second moment its inverse square is integrable against the
polar density with bound \(O_a(b^{-3})\), by
\(1-\cos\theta\ge 2\theta^2/\pi^2\), \(\sin\theta\le\theta\)
and the change of variable \(v=b\theta\).
The numerator squared is \(O_a(b^2)\). Thus
\(\|x_b-m_\pm\|_2^2=O_a(b^{-1})\). On the cap \(\theta\le b^{-1}\),
the denominator is bounded above by a constant depending on \(a\)
and the numerator has magnitude bounded below by \(a b\) for
sufficiently large \(b\). This cap has measure bounded below by
a positive constant times \(b^{-3}\), giving a positive
\(a\)-dependent lower bound on \(\|x_b-m_\pm\|_3^3\).

In the coordinates \(y=\Phi_b(z)\) the shell is
\(\{b-a\le |y+be_1|\le b+a\}\).
At each finite \(y\), \(|y+be_1|-b\to y_1\), so this shell converges
in indicator away from the two hyperplanes \(y_1=\pm a\).
In the round physical metric \(q_g(U_b)\to0\).
The target \(q_{h_b}(U_b)\) converges by dominated convergence to
\(\int_{\{|y_1|\le a\}}\sigma_2(A_g)dV_g\). This lies strictly between
\(0\) and the total \(4\pi^2\). Consequently \(J\) has a nonzero
negative limit strictly greater than \(-4\pi^2\), with
\(2\operatorname{dist}(J,4\pi^2\mathbb Z)\) bounded away from zero.
These are smooth orientation-preserving pullbacks of round \(S^4\)
and have positive Schouten curvature. They have \(E_\pm=0\), and the
log-width is \(\log((b+a)/(b-a))\to0\).

## Separated widths in the same dilation family

Allow arbitrary concentric source faces \(r_{b,-}<r_{b,+}\).
Assume \(q_g(U_b)\to0\), the widths
\(\log(r_{b,+}/r_{b,-})\) have positive lower limit, and
\(m_b(r_{b,+})-m_b(r_{b,-})\to0\). Then **\(J\to0\) in this family**.
Suppose instead that \(q_{h_b}(U_b)\) is bounded below on a subsequence.
A fixed Euclidean ball in the image coordinates must intersect each
image shell there, since the round measure outside sufficiently large
balls is arbitrarily small. Its radius \(K\) gives
\(R_{b,-}\le b+K,\ R_{b,+}\ge b-K\).
In particular \(r_{b,-}\to0\), and the source volume condition forces
\(r_{b,+}\to0\) as well. Along a further subsequence set
\(\lambda_\pm=\lim R_{b,\pm}/b\in[0,\infty]\).
Then \(\lambda_-\le1\le\lambda_+\). From (1), for any
\(R/b\to\lambda\) with \(r\to0\), the limiting mean is
\[
 F(\lambda)=
 \begin{cases}
  1-\lambda^2,&0\le\lambda\le1,\\
  \lambda^{-2}-1,&1\le\lambda\le\infty .
 \end{cases}
\]
This is strictly decreasing on the compactified interval. Matching
means force \(\lambda_-=\lambda_+=1\), hence the width tends to zero,
a contradiction. The use of stereographic log-width is equivalent
in this shrinking case to the log-ratio of the physical areal radii.

Separated widths with exactly equal means do occur in a region of
vanishing target mass. To see this, take \(r=c_0 b^{-1/2}\) with
\(c_0\in[1/2,3/2]\). Here \(R\gg b\), and
\(\fint |R\theta-be_1|^{-2}=R^{-2}\) by the same polar identity
with \(A=b^2+R^2\). The pointwise difference after adding \(1\)
to the squared distance is \(O(R^{-4})\), uniformly on the sphere.
It follows that
\[
 m_b(c_0 b^{-1/2})=-1+
   b^{-1}(c_0^{-2}+2c_0^2)+O(b^{-2})
\]
uniformly in the indicated compact interval. The coefficients
at \(c_0=1/2,1,3/2\) are \(9/2,3,89/18\).
The intermediate value theorem gives \(c_{b,+}\in(1,3/2)\)
with the mean exactly equal to that at \(c_{b,-}=1/2\) for
all sufficiently large \(b\). The log-width is at least \(\log 2\).
The image shell lies at distance at least \(b^{3/2}/2-b\)
from the origin, so its target mass tends to zero directly.

The nonzero-current obstruction in E13 is confirmed on the shrinking
round shells it specifies. The additional separated-width test applies
only to concentric faces and this explicit shifted round dilation.
Control of the marked positive-energy band, with general embeddings
and general positive Schouten representatives, remains with B05.
