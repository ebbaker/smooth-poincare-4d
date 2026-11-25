# SP4-MASTER-E10 · Exact product smoothing of a simple ramification patch

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution of the
[frozen E10 request](../research-progress/handoffs/E10_BRANCH_PATCH.md)
following [E01](E01_LOCAL_ENTRY.md). Requested GPT-6.2 Sol/ultra.
Actual serving model and reasoning effort were unavailable to this helper.
Committed inputs at fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2.
The launch master TeX hash prefixes are a499b313e6d5 and 3f3722b56d34.

## Topological input and metric hypothesis

The representation theorem of Massimiliano Iori and Riccardo Piergallini,
*4-manifolds as covers of the 4-sphere branched over non-singular
surfaces*, *Geom. Topol.* **6** (2002), 393–401, gives a simple
five-sheeted PL branched cover of the standard PL $S^4$ by any closed
connected oriented PL four-manifold, with locally flat PL branch
surface. Simplicity means that a meridian has transposition monodromy,
so a normal punctured disk has one double cover and three single
sheets. The source can be the PL manifold associated to the given
smooth manifold. The theorem is stated for PL maps and PL branch
surfaces. A smooth metric, smooth metric coordinates for a branch
map, compatibility with a round pullback, and a product metric
on a fixed patch are additional inputs. The calculation uses a
smooth local product on the source, independently of how it is
realized. Primary passages checked were the definition on pp. 394–395
and the displayed theorem on p. 395, published text as reproduced in
arXiv:math/0203087v2 (23 July 2002).
[Primary theorem](https://arxiv.org/pdf/math/0203087#page=3)
· [Publication DOI](https://doi.org/10.2140/gt.2002.6.393)

The heuristic for the normal model is that in a smooth complex
squaring chart the flat metric in the unbranched normal plane pulls
back away from the branch point to $dr^2+4r^2d\theta^2$ when the
radius $r$ is that of the base. The angular variable on the ramified
sheet has period $2\pi$, so this is a cone of angle $4\pi$.
The test below uses the following hypothesis, stronger than the
meridian monodromy, on a fixed open tangential patch $U$ of positive
finite area and a fixed normal coordinate radius $R_*$. The patch
in a smooth oriented four-manifold with a Riemannian metric is
isometric to the product
\[
 (U,h)\times(D_{R_*},\,dr^2+f_\epsilon(r)^2d\theta^2),
       \qquad \theta\in\mathbb R/(2\pi\mathbb Z).
\]
Here $h$ is fixed and smooth, $K$ is its bounded Gauss curvature,
and $f_\epsilon>0$ on $0<r<R_*$. The normal metric extends
smoothly at the origin, so $f_\epsilon(0)=0$ and
$f_\epsilon'(0)=1$. At $r=\epsilon$, $f_\epsilon'(\epsilon)=2$
and for $\epsilon\le r<R_*$, $f_\epsilon(r)=2r+c_\epsilon$.
Assume $0<f_\epsilon(r)\le C\epsilon$ on $0<r\le\epsilon$ with
$C$ fixed. It follows that $|c_\epsilon|\le C_0\epsilon$ for a
fixed $C_0$. These assumptions allow nonmonotone derivatives.
An example is $f_\epsilon(r)=\epsilon F(r/\epsilon)$, where
$F(s)=s+\int_0^s\beta(t)\,dt$ and $\beta$ is a smooth cutoff
rising from zero on $t\le1/4$ to one on $t\ge1/2$.
This profile is exactly Euclidean at the center and matches
a shifted cone on the outside.

## Both chiral transition energies

The normal Gauss curvature is $k_\epsilon=-f_\epsilon''/f_\epsilon$,
and $R=2(K+k_\epsilon)$ on the product. The signed normal Gauss
curvature of its core is
\[
 \int_{D_\epsilon} k_\epsilon\,dA_{\rm normal}
    =-2\pi\int_0^\epsilon f_\epsilon''\,dr=-2\pi .
\]
This uses the endpoint slopes and remains true if the curvature
changes sign. Take an oriented orthonormal frame with the two tangent
vectors of $U$ first and the two normal vectors last. The curvature
operator on two-forms has eigenvalues $K$ and $k_\epsilon$ on the
two oriented area forms and vanishes on mixed forms. In either
chiral block, projection of the curvature operator has eigenvalues
$(K+k_\epsilon)/2,0,0$. Subtracting $R/12$ gives the Weyl eigenvalues
\[
 \left(\frac{K+k_\epsilon}{3},-\frac{K+k_\epsilon}{6},
                         -\frac{K+k_\epsilon}{6}\right)
\]
in each chirality. Thus the Hilbert–Schmidt norm squared is
$(K+k_\epsilon)^2/6$ in each block. Reversing orientation exchanges
these equal answers.

For $A=\operatorname{Area}_h(U)$ and
$V_\epsilon=\int_0^\epsilon f_\epsilon\,dr$,
the exact core energies are
\[
 \begin{aligned}
 E_+(U\times D_\epsilon)=E_-(U\times D_\epsilon)
  &=\frac{\pi}{3}\int_U\int_0^\epsilon
       \frac{(f_\epsilon''-K f_\epsilon)^2}{f_\epsilon}\,dr\,dA_h\\
  &=\frac{\pi}{3}\left(
      A\int_0^\epsilon\frac{(f_\epsilon'')^2}{f_\epsilon}\,dr
       -2\int_U K\,dA_h+V_\epsilon\int_U K^2\,dA_h\right).
 \end{aligned}
\]
Cauchy–Schwarz gives
\[
 \int_0^\epsilon\frac{(f_\epsilon'')^2}{f_\epsilon}\,dr
     \ge\frac{|\int_0^\epsilon f_\epsilon''\,dr|^2}{V_\epsilon}
     =\frac{1}{V_\epsilon}\ge \frac1{C\epsilon^2}.
\]
Both core energies diverge at least as
$\pi A/(3C\epsilon^2)-\frac{2\pi}{3}|\int_U K\,dA_h|$.
For the explicit scaled profile the first integral equals
$\epsilon^{-2}\int_0^1(F'')^2/F\,ds$, finite because $F''$ is
supported away from the center, so the order is $\epsilon^{-2}$.
On the exterior cone of this product, the chiral density is
$K^2/6$ since $f_\epsilon''=0$ there. Chiral energies are
nonnegative on every region and conformally invariant, so the
one exact patch alone rules out a fixed subcritical chiral
bound for arbitrary smooth completions or conformal factors.

## Compactly supported Yamabe test

Fix a nonzero real $\phi\in C_c^\infty(U)$ and put
\[
 A_2=\int_U\phi^2\,dA_h,\qquad
 D_2=\int_U |d\phi|_h^2\,dA_h,\qquad
 B_2=\int_U K\phi^2\,dA_h .
\]
Use $0<\epsilon<\rho<R<R_*$ and the logarithmic radial cutoff
\[
 \chi_{\rho,R}(r)=
 \begin{cases}
 1 & 0\le r\le\rho,\\
 \log(R/r)/\log(R/\rho) & \rho<r<R,\\
 0 & r\ge R .
 \end{cases}
\]
The function $u=\phi\chi_{\rho,R}$ is an $H^1$ test supported in the
patch and extends by zero to any smooth completion. It can also
be smoothed in $H^1$ at fixed parameters. In dimension four the
Yamabe numerator is $Q(u)=\int(6|du|^2+Ru^2)\,dV$.
Using angular measure $2\pi$, normal volume $f_\epsilon\,dr\,d\theta$,
and the product scalar formula gives
\[
 Q(u)=2\pi\left[
  6 A_2 \int_0^R f_\epsilon|\chi_{\rho,R}'|^2\,dr
  -2 A_2 \int_0^R f_\epsilon''\chi_{\rho,R}^2\,dr
  +(6D_2+2B_2)\int_0^R f_\epsilon\chi_{\rho,R}^2\,dr
 \right].
\]
The middle integral is exactly one. Hence the normal defect
contributes $-4\pi A_2$ to the numerator. For $r\ge\epsilon$,
$f_\epsilon(r)\le(2+C_0)r$. In particular, with constants depending
only on the core bound and slope,
\[
 \int_0^R f_\epsilon\chi_{\rho,R}^2\,dr\le C_1R^2,\qquad
 \int_0^R f_\epsilon|\chi_{\rho,R}'|^2\,dr
     \le\frac{2+C_0}{\log(R/\rho)}.
\]
The first estimate groups the $C\epsilon^2$ core area and the
conical exterior. The second uses only $\rho<r<R$ and integrates
$dr/r$.

Choose $R<R_*$ first so that
$C_1R^2(6D_2+2|B_2|)<A_2/2$. Then choose $L$ with
$6(2+C_0)/L<1/2$ and put $\rho=R e^{-L}$. For every
$\epsilon<\rho$ the estimates give $Q(u)<-2\pi A_2$.
This ordering puts all normal curvature in the region on which
the radial cutoff is one. The exterior completion has no contribution
to this test, so its conformal class has strictly negative Yamabe
constant on any smooth closed completion.

A shrinking test strengthens the estimate. Keep $L$ fixed as above
and choose $\rho=2\epsilon$, $R=2e^L\epsilon$. For sufficiently small
$\epsilon$ the same negative numerator bound holds. The squared
$L^4$ norm is at most
$\big(2\pi C_1 R^2\int_U|\phi|^4dA_h\big)^{1/2}$.
Hence $Y\le -c/\epsilon$ for a fixed $c>0$. No upper bound on
$f_\epsilon''$ was used. The divergence conclusion is the upper
bound for the Yamabe infimum supplied by these explicit tests.
Its sign is conformally invariant. [Lee–Parker, §2, (2.7), p. 43](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf#page=7)

## Scope of the failure and return to B02

Any exact patch with the fixed hypotheses causes both failures,
independently of the exterior smooth completion and its topology.
Thus even on a homotopy sphere this specified smoothing cannot
provide a positive class below $8\pi^2$ as $\epsilon\to0$.
The PL representation supplies neither the product estimates
used here nor a lower bound on the area of a patch in a separate
family of metrics.

A different base normal angle can change the defect. For example,
a base cone angle $\pi$ pulls back under the transverse double cover
to $2\pi$, so the local slope change in this proof disappears.
That option requires independent global construction and estimates
for the base geometry and all sheets. A nonproduct metric change
that acts on the mixed curvatures or contributes comparable scalar
curvature inside the testing region also requires a new estimate
for each chirality and the complete scalar form. Collapsing the
tangential area changes the factor $A/\epsilon^2$ in the curvature
bound, and changing the tangential metric also changes the gradient
cost relative to the defect in the scalar test. Spreading the
slope correction beyond the shrinking core changes its area and
where the defect is sampled. These changes evade the hypotheses
of this packet. Their ability to create an entry class remains
open. Return the construction choice to B02.
