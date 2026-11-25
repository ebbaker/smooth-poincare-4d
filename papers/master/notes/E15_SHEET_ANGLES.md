# SP4-MASTER-E15 · One common cone angle on all sheets

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution of the
[frozen E15 packet](../research-progress/handoffs/E15_SHEET_ANGLES.md)
at HEAD 64a0bfae5759353d49a68cb47e59305566809061, using the working
[E10 product-patch note](E10_BRANCH_PATCH.md). Requested GPT-6.2 Sol/ultra.
Actual serving model and reasoning effort were unavailable to this helper.

## Four normal disks over a simple branch value

The Iori–Piergallini representation theorem concerns a simple
five-sheeted PL cover of the standard PL four-sphere, with a locally
flat PL branch surface. At a simple branch value a meridian acts on the
five sheet labels as one transposition. Its cycle lengths are
$2,1,1,1$, giving four source normal disks, with the angular
period on each disk set to $2\pi$. In an exact metric cone model
over a base angle $2\pi\alpha$, the double angular cover has
slope $2\alpha$ and the three single covers each have slope $\alpha$.
The PL theorem supplies the cycle data. The four disjoint exact
product neighborhoods and common cone metric are separate smooth
metric hypotheses. The definition of simplicity and the displayed
representation theorem were checked on p. 395 of
Iori–Piergallini, *Geom. Topol.* **6** (2002), 393–401, as reproduced
in arXiv:math/0203087v2.
[Primary passage](https://arxiv.org/pdf/math/0203087#page=3) ·
[Publication DOI](https://doi.org/10.2140/gt.2002.6.393)

Let all four products have the fixed tangential metric $h$ on an
open patch $U$ with area $A>0$ and bounded Gauss curvature $K$.
In disk $j$ write the normal metric as $dr^2+f_j(r)^2d\theta^2$,
with the dependence on $\epsilon$ suppressed.
The metric is smooth at $r=0$, so $f_j(0)=0$ and $f'_j(0)=1$.
At $\epsilon$ the profile has slope $\beta_j$, and on
$\epsilon\le r<R_*$ it is $f_j(\epsilon)+\beta_j(r-\epsilon)$,
where $R_*>0$ is fixed. The slopes are
\[
 \beta_0=2\alpha,\qquad \beta_1=\beta_2=\beta_3=\alpha,\qquad
 \alpha=\alpha_\epsilon>0 .
\]
Set $V_j=\int_0^\epsilon f_j(r)\,dr$ and require
$0<V_j\le C\epsilon^2$ for a common $C$. The physical normal
core area is $2\pi V_j$. This area bound suffices for the chiral
estimate. The Yamabe test below also uses $f_j(\epsilon)\le C_0\epsilon$,
supplied by the pointwise core bound in E10.

## Chiral energies and optimization

The signed normal Gauss curvature of disk $j$ is
\[
 \int_{D_\epsilon}k_j\,dA_{\mathrm{normal}}
     =-2\pi\int_0^\epsilon f_j''(r)\,dr
     =-2\pi\delta_j,\qquad \delta_j=\beta_j-1.
\]
In an orthonormal product frame the curvature operator has
eigenvalues $K,k_j$ on its two area forms and zero on mixed forms,
with $k_j=-f_j''/f_j$. The normalized self-dual or anti-self-dual
sum of the two area forms has projected curvature
$(K+k_j)/2$. The other two directions in each projection have
zero projected curvature. Since $R=2(K+k_j)$, subtracting $R/12$
gives Weyl eigenvalues $(K+k_j)/3,-(K+k_j)/6,-(K+k_j)/6$ in
each real chiral block. Their squared Hilbert–Schmidt norm is
$(K+k_j)^2/6$. This also verifies the same integrated
normalization $\pi/3$ for either chirality.

Let $\mathcal K=\int_U K\,dA_h$ and
$\mathcal K_2=\int_U K^2\,dA_h$. If $\mathcal U_\epsilon$ is the
union of the four cores, then
\[
 \begin{aligned}
 E_\pm(\mathcal U_\epsilon)
 &=\frac{\pi}{3}
     \left[A\sum_{j=0}^3\int_0^\epsilon\frac{(f_j'')^2}{f_j}\,dr
          -2\mathcal K\sum_{j=0}^3\delta_j
          +\mathcal K_2\sum_{j=0}^3 V_j\right],\\
 \int_0^\epsilon\frac{(f_j'')^2}{f_j}\,dr
 &\ge \frac{\delta_j^2}{V_j}.
 \end{aligned}
\]
The second line follows by Cauchy–Schwarz applied to
$\int_0^\epsilon f_j''\,dr=\delta_j$. Each core has multiplicity one
in the source energy, including the ramified core.

The uniform common upper area bound gives the least-squares factor
\[
 D(\alpha)=\sum_{j=0}^3\delta_j^2
   =(2\alpha-1)^2+3(\alpha-1)^2
   =7(\alpha-5/7)^2+\frac37 .
\]
Its minimizing common angle is $2\pi(5/7)=10\pi/7$.
At this angle the slope defects are $3/7,-2/7,-2/7,-2/7$.
The signed sum is $-3/7$ even though the ramified core has negative
normal curvature integral. Optimizing the largest absolute defect
instead gives $\alpha=2/3$ and maximum defect $1/3$, from
$\min_{\alpha>0}\max\{|2\alpha-1|,|\alpha-1|\}$.
If optimizing the leading bound for fixed individual $V_j$, set
$w_0=V_0^{-1}$ and $w_s=\sum_{j=1}^3 V_j^{-1}$. The weighted
quadratic is minimized at
$\alpha=(2w_0+w_s)/(4w_0+w_s)$ with minimum
$w_0w_s/(4w_0+w_s)$. The $5/7$ value optimizes the universal
equal-weight lower bound and does not assume the areas actually
saturate their common bound.

For common tangential $h$, keep the exact cross term and omit
the nonnegative contribution of $\mathcal K_2$. Then, writing
$x=\alpha-5/7$ and using $\sum_j\delta_j=5\alpha-4$,
\[
 \begin{aligned}
 E_\pm(\mathcal U_\epsilon)
 &\ge \frac{\pi}{3}\left[\frac{A}{C\epsilon^2}D(\alpha)
                               -2\mathcal K(5\alpha-4)\right]\\
 &\ge \frac{\pi}{3}\left[
    \frac{3A}{7C\epsilon^2}+\frac67\mathcal K
                             -\frac{25C\epsilon^2\mathcal K^2}{7A}\right].
 \tag{1}
 \end{aligned}
\]
The second line completes the square in $x$. The optimal
$\alpha$ for the first-line lower-bound expression is
$5/7+5C\epsilon^2\mathcal K/(7A)$ for sufficiently small $\epsilon$.
In particular the leading lower bound $\pi A/(7C\epsilon^2)$ has
an $O(1)$ tangential correction uniform in $\alpha_\epsilon$,
even for unbounded $\alpha_\epsilon$.

The same leading obstruction holds if the exact products have
different fixed tangential metrics of common area $A$, with
Gauss curvatures $K_j$. On the disjoint union define the
two squared norms by integrating $\delta_j^2/V_j$ and $V_jK_j^2$,
respectively, against each tangential area measure. Pointwise
radial Cauchy–Schwarz bounds $3E_\pm/\pi$ below by the squared
norm of the difference of $\delta_j/\sqrt{V_j}$ and
$\sqrt{V_j}K_j$. The reverse triangle inequality then gives
\[
 \sqrt{3E_\pm/\pi}\ \ge\
 \left(\sqrt{\frac{3A}{7C\epsilon^2}}
             -\sqrt C\,\epsilon
                \left(\sum_{j=0}^3\|K_j\|_{2}^2\right)^{1/2}\right)_+ .
\]
No other region can reduce the integral of either squared chiral
norm. Both bounds persist on any smooth completion containing the
four patches, and after conformal changes. In particular, no choice
of common angle yields a fixed subcritical chiral bound as
$\epsilon\downarrow0$. For $\alpha=1/2$ the ramified slope becomes
one, but all three single slopes then have defect $-1/2$.
Their contributions give $D(1/2)=3/4$.

## Yamabe sign for excess angle

Suppose that some disk has $\beta\ge1+\kappa$ with fixed $\kappa>0$.
Set $\delta=\beta-1$. It suffices to test that one product.
For $r\ge\epsilon$ the inherited endpoint bound gives
$f(r)\le(\beta+C_0)r$. This estimate will be used relative
to $\delta$, so no fixed upper bound on $\beta$ is needed.
Fix $0\ne\phi\in C_c^\infty(U)$ on the tangential patch and write
$I_2=\int\phi^2$, $J_2=\int |d\phi|^2$ and $B_2=\int K\phi^2$.
For $0<\epsilon<\rho<R<R_*$ let $\chi=1$ below $\rho$,
$\chi=\log(R/r)/L$ on $\rho<r<R$ with $L=\log(R/\rho)$,
and $\chi=0$ beyond $R$. In dimension four the conformal form
for the test $u=\phi\chi$ is
\[
 Q(u)=2\pi\left[
        6 I_2\int f|\chi'|^2\,dr
       -2 I_2\delta
       +(6J_2+2B_2)\int f\chi^2\,dr
        \right].
\]
The normal scalar defect contributes $-4\pi I_2\delta$
since $\chi=1$ throughout its support. The logarithmic
gradient integral is at most $(\beta+C_0)/L$, and the
volume integral is at most $C_1(1+\beta)R^2$ from the core
area and the linear exterior profile. Both ratios
$(\beta+C_0)/\delta$ and $(1+\beta)/\delta$ are bounded in
terms of $C_0$ and $\kappa$.

Choose $R<R_*$ first so the positive bound on the tangential
term in brackets is at most $I_2\delta/2$. Next choose $L$
large enough that the radial gradient term in brackets is
at most $I_2\delta/2$, and set $\rho=R e^{-L}$.
For every $\epsilon<\rho$ this gives $Q(u)\le -2\pi I_2\delta$.
The test has compact support in the product and gives strictly
negative Yamabe constant on every closed smooth completion.
Keeping the same $L$ and taking $\rho=2\epsilon$, $R=2e^L\epsilon$
also works for sufficiently small $\epsilon$. Since
$\|u\|_4^2\le C_2R\sqrt{1+\beta}$, this gives the stronger bound
$Y\le-c_\kappa/\epsilon$ with a positive constant independent of
$\beta$. Conformal invariance follows from covariance of the
Yamabe quotient. [Lee–Parker, §2, (2.7), p. 43](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf#page=7)

For the common-angle model, $\max_j\beta_j=2\alpha$. In particular
the curvature-optimal angle $\alpha=5/7$ gives a fixed excess
$3/7$ on the ramified disk. For $\alpha\le1/2$ every signed
normal defect in the scalar form is nonnegative. If the maximal
angle excess tends to zero, the above uniform sign estimate does
not apply. No Yamabe sign on an arbitrary completion is deduced
in those regimes. The chiral obstruction (1) holds in all of them.

## Geometric scope

Changing the angle alone within this common exact product family
fails the entry bound. Distinct exterior angles on different
source sheets could eliminate the slope defects but would
abandon the common base pullback metric. A degeneration of
the tangential area on the scale of the normal-core areas, a
correction spread over larger normal area, or a nonproduct
transition with mixed curvature can evade (1) by changing an
explicit hypothesis. Each requires its own two-chirality energy
and scalar-form estimates. The PL representation theorem
provides no such metric controls. The packet concludes the
common-angle test and leaves the global starting-class
construction open.
