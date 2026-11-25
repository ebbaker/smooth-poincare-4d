# E58 · Check of auxiliary-volume disk selection above the endpoint

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort are unavailable. This is a
bounded analytical check on the fixed nonstandard smooth homotopy
four-sphere and positive Riemannian conformal classes. It uses the
modified representative and the existing marked disk selection proof.
[Endpoint charge, SHA-256 prefix `b877c61b76b7e07c`](../manuscript/endpoint_charge.tex) ·
[Master physical volume, `b972bc5466245c5d`](../../manuscript/physical_volume.tex) ·
[Master TeX bundle `15c0f568bb52bdde`](../../research-progress/handoffs/E53_E55_ENDPOINT_CHARGE_20261125.md)

## Capacity with the spectral median

Take ordinary unit-volume Yamabe metrics \(g_i\) with
\(e_i=E_+(g_i)=E_-(g_i)\to I<4T/3\), \(T=4\pi^2\).
Take the unit-volume modified representatives \(q_i\) from
the endpoint argument. Write \(L_i\) for the larger of the
two signed maximum Weyl eigenvalues in this gauge,
\(l_i=\|L_i\|_{2,q_i}\), \(\mu_i=dV_{q_i}\), and
\(\nu_i=L_i^2\,dV_{q_i}\). The fixed smooth type gives
\(R_{q_i}=6L_i+c_i\) with \(c_i\le0\); the required conformal
factor is \(C^{2,\alpha}\). The ordinary Yamabe inequality
on this representative and the pointwise Weyl eigenvalue
bound give \(0<Y_i\le 6 l_i\) and \(l_i^2\le4e_i/3\).
[Modified minimizer and sign](../../reviews/E54_SPECTRAL_ENDPOINT.md#the-modified-yamabe-near-minimizers)

On any set \(U\) with \(\nu_i(U)\le l_i^2/2\), the Yamabe
inequality and Hölder give for \(v\) supported there

\[
\left(Y_i-\frac{6l_i}{\sqrt2}\right)\|v\|_{4,q_i}^2
\le 6\int |dv|_{q_i}^2\,dV_{q_i}.
\]

In the physical gauge Gauss–Bonnet gives
\(Y_i^2=48(2T-e_i)+12D_i\), \(D_i=\int |\operatorname{Ric}_{0,g_i}|^2\).
Also \(18 l_i^2\le24e_i\). Consequently the coefficient is
bounded below by
\(\sqrt{48(2T-e_i)}-\sqrt{24e_i}>0\) uniformly after discarding
finitely many indices. The exact squared gap including the
spectral deficit \(B_i=4e_i/3-l_i^2\) is
\(Y_i^2-18l_i^2=96T-72e_i+12D_i+18B_i\).

Smooth positive-Ricci metrics \(k_i\in[g_i]\) exist by the
positive Yamabe and positive total \(\sigma_2\) argument
of the physical-volume section, since \(I<2T\). Define their
constant scale by the least comparison radius carrying half of
\(\nu_i(M)\), and let \(p_i\) be an attaining center. Each
\(\nu_i\) is absolutely continuous relative to the smooth
comparison volume, so its distance spheres are null.
The same compactness and continuity argument as in
the physical-volume section gives
\(\nu_i(B_1(p_i))=l_i^2/2=\max_x\nu_i(B_1(x))\).
Thus the capacity inequality applies on any comparison ball
of radius at most one, or on the exterior of any
\(B_r(p_i)\) with \(r\ge1\).

With \(\chi\) equal to one on the relevant plateau, write \(A\)
for the comparison annulus supporting its gradient. By the
conformal invariance of \(\int|d\chi|^4\), the right hand side
above is at most
\(6(\int |d\chi|_{k_i}^4\,dV_{k_i})^{1/2}\mu_i(A)^{1/2}\).
The two logarithmic cutoffs in the physical-volume proof
therefore give exactly its contraction and both power bounds
for \(\mu_i\), with the new uniform floor. These bounds imply
tightness and vanishing small-ball mass. They apply even when
the \(\mu_i\) mass of the spectral median ball is unknown.

For noncollapse first use the tail bound to choose a fixed
\(D\) with \(\mu_i(B_D(p_i))\ge1/2\). Relative volume comparison
packs that ball into a uniformly bounded number of radius
\(1/4\) balls. One has \(\mu_i\)-mass bounded below. Apply the
capacity inequality to a linear cutoff supported on its
concentric radius \(1/2\) ball, using the spectral support bound
there. This yields a uniform positive lower bound for the
comparison volume of \(B_{D+1}(p_i)\). Relative volume
comparison now gives uniform lower bounds \(c_A r^4\) at
radii \(0<r\le1\) on every fixed pointed window \(B_A(p_i)\).

## Absolutely continuous auxiliary volume and marked disks

Take a subsequence with a pointed noncollapsed Ricci limit
\((X,d,p)\), comparison volume limit \(m=\mathcal H^4\), and
local weak limits \(\mu,\nu,\beta\) of \(\mu_i,\nu_i,\beta_i\),
where \(\beta_i=|\operatorname{Rm}_{g_i}|_{\rm tens}^2\,dV_{g_i}\)
is the physical full-curvature measure. The physical curvature
and spectral masses are uniformly bounded. Tightness gives
\(\mu(X)=1\). Small-ball decay gives \(\mu(\{x\})=0\) at each
limit point.

On the comparison metrics write \(q_i=w_i^2 k_i\). The scalar
equation and positive scalar curvature of \(k_i\) give

\[
-\Delta_{k_i}w_i\le V_iw_i,\qquad
V_i=(R_{q_i})_+w_i^2/6,\qquad
\int_G V_i^2\,dV_{k_i}\le \nu_i(G).
\]

In a fixed pointed window and at a point outside the atoms
of \(\nu\), choose a sufficiently small fixed continuity
radius \(r>0\) for \(\nu\), centered on that point and
transferred to the sources as in the physical-volume proof.
The local weak convergence makes \(\|V_i\|_{2,B_r}\)
less than the strict absorption threshold in the same local
Sobolev estimate used there. Apply only the \(p=4\) step
with \(\int w_i^4\,dV_{k_i}=1\). This gives a uniform
\(L^8(k_i)\) bound on \(w_i\) on \(B_{r/2}\), from which
\(\mu_i\) have bounded \(L^2(k_i)\) densities there.
Cauchy–Schwarz against compactly supported continuous
tests and volume convergence give a local \(L^2(m)\)
density for \(\mu\) near the point. A countable subcover
of the nonatomic centers and \(\mu\)-nullity of the
countable \(\nu\)-atom set give \(\mu\ll m\) globally.
No common absorption radius on a whole window is needed.
[Local Sobolev estimate and volume transfer](../../manuscript/physical_volume.tex)

The finite disk selection now applies at \(\mu\)-almost every
center. Such a center is Euclidean regular, has finite positive
density \(d\mu/dm\), and lies outside the countable atoms of
\(\beta\). Differentiation gives the density and shrink ratios
used in the physical-volume proof with an \(L^1(m)\) density.
For arbitrarily small fixed continuity radii the weak limits
give arbitrarily small \(\beta\)-mass in the containing balls.
Use the same finite disjoint selection and compact subdisks
of smooth model embeddings. For each tolerance \(\delta>0\),
physical full-curvature ceiling \(\zeta>0\) and maximum
comparison radius \(r_*>0\), let \(U_i\) be the resulting union
of pairwise disjoint marked disks. Then \(\mu_i(M\setminus
U_i)<\delta\), and the containing balls have physical
curvature integral \(<\zeta\) and fixed radii \(<r_*\) for
all large \(i\). The argument uses the existing Cheeger–Colding
volume and smooth embedding results with their same comparison
hypotheses. [Published locators and inspection record](../references/README.md)

## Captured chiral energy

The ordinary Yamabe test on the constant function gives
\(\int_M L_i\,d\mu_i\ge Y_i/6\). On the omitted set its integral
is at most \(l_i\sqrt{\delta}\). Cauchy–Schwarz on \(U_i\),
using \(\mu_i(U_i)\le1\), and the pointwise estimate
\(L_i^2\le\frac23(|W^+|^2+|W^-|^2)\) give

\[
(\lambda_i^++\lambda_i^-)(U_i)\ge
\frac32\bigl(Y_i/6-l_i\sqrt{\delta}\bigr)_+^2 .
\]

Subtract from this the upper bound \(e_i\) on the opposite
chirality to obtain, for each sign, independent of the
partition of the two densities,

\[
\lambda_i^\pm(U_i)\ge
\frac32\bigl(Y_i/6-l_i\sqrt{\delta}\bigr)_+^2-e_i
\ge Y_i^2/24-e_i-C\sqrt{\delta}
\ge 4T-3e_i-C\sqrt{\delta}.
\]

The uniform \(C\) follows from bounded \(Y_i\) and \(l_i\).
To state an arbitrarily small fixed chiral error, choose the
volume tolerance before selecting the finite family. An
\(o(1)\) error uses a diagonal along disk families selected
for decreasing tolerances. At \(I<5T/4\) the last bound for
one sign exceeds the limiting minimizing excess \(I-T\)
with positive margin for small enough tolerance. Any
actual two-sided collar control and the required positive
replacement still have to be established on those disks.
