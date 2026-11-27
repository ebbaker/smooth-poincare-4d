# E55 · Retained Berger annuli and the signed cut criterion

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
assistance. Actual model and effort unavailable. Input checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0 and the working copies of
[E49](../notes/E49_ORBIFOLD_CAP.md), [E15](E15_QUATERNIONIC_COLLAR.md),
and the [parent ledger replay](../../01_chirality_ledger/reviews/PARENT_SECTION_3.md).
This is an analytical independent replay for smooth oriented
Riemannian four-dimensional disks, their cuts, and marked comparisons.
All chiral norms are real Hilbert–Schmidt norms on the Weyl operator.

In the physical orientation for the short-axis disk, an exact
retained E49 annulus extending in to $r=2/3$ already costs
$(3500/2187)\pi^2$ in $E_+$, above the strict target $3\pi^2/2$.
More generally, a separating outward-oriented quaternionic cut with
corrected eta $\xi\le-13/24$ excludes that target. Marked rescaled
$C^2$ comparison to the round flat cone ensures this condition
when sufficiently close.

## Retaining a finite part of the compactification

Let $W$ be the marked disk bundle over $\mathbb{RP}^2$ with outward
quaternion orientation and terminal Berger axes $(1,1,\sqrt3)$,
the collapsing circle on a short axis. The terminal face is umbilic.
Then $E_+(W)-E_-(W)=-5\pi^2$ and $e_W=(E_++E_-)/2
=E_+(W)+5\pi^2/2$. The strict cap target $e_W<4\pi^2$ is therefore
$E_+(W)<3\pi^2/2$. [E35 signed energies](../notes/E35_COVER_CAP.md)

Use the E49 parameters $v=-\log r$ and
$z=4e^{-2v}-2e^{-4v}=4r^2-2r^4$, with the Berger face at $r=1$.
Retaining the metric on the annulus as part of $W$ uses
$dr\wedge\sigma_{123}$, the outward-first orientation at $r=1$.
In E15's orientation $dv\wedge\sigma_{123}$ the plus block
vanishes and the minus block carries the energy. Since the two
orientations are opposite, physical retention in $W$ puts this
energy in the plus block. Using the E49 cap as the oriented
complement of $W$ instead requires the E15 orientation.

The equation $\ddot z+6\dot z+8z=0$ makes the nonzero E15
axial Weyl eigenvalue $2\dot z$. The other two eigenvalues have
half its opposite sign. Multiplying their summed squares by the
quotient volume element $\pi^2\,dv/4$ gives the physical
plus-chiral density $(3\pi^2/2)\dot z^2\,dv$ in the integral over
the retained region. Thus for $0<\rho<1$,
\[
 \begin{aligned}
 E_+([\rho,1])&=96\pi^2\int_\rho^1 r^3(1-r^2)^2\,dr\\
 &=\pi^2(4-24\rho^4+32\rho^6-12\rho^8)\\
 &=4\pi^2(1-\rho^2)^3(1+3\rho^2),\qquad E_-([\rho,1])=0 .
 \end{aligned}
\]
All smooth positive conformal representatives on this fixed
annulus have the same energy. As $\rho\downarrow0$ the plus
energy tends to $4\pi^2$. Its derivative with respect to
$\rho$ is $-96\pi^2\rho^3(1-\rho^2)^2$, so the retained energy
is at least the target precisely for
$\rho\le\rho_*$, where $\rho_*$ is the unique root in $(0,1)$ of
$(1-\rho_*^2)^3(1+3\rho_*^2)=3/8$. The explicit rational choice
$\rho=2/3$ gives
\[
 E_+([2/3,1])=\frac{3500}{2187}\pi^2
 =\frac32\pi^2+\frac{439}{4374}\pi^2 .
\]
Any smooth resolution on the interior with this exact retained
annulus has at least that much $E_+$, irrespective of its positive
Yamabe sign. The strict gap also excludes a sequence that retains
this marked annulus only in the sense of $C^2$ convergence, up
to conformal change and an orientation-preserving identification.
The Weyl integral is continuous under that convergence on
the fixed compact annulus. This estimate leaves modifications
that alter a larger region outside the tested retention
hypothesis. [E15 chiral formula](E15_QUATERNIONIC_COLLAR.md)
· [E49 compactification](../notes/E49_ORBIFOLD_CAP.md)

## The corrected eta on nested cuts

For a cut $\Sigma$ oriented with its normal toward the terminal
face first, use the parent normalizations
\[
 \mathcal T(\Sigma)=
 \int_\Sigma\langle B^\circ,\operatorname{curl}_h B^\circ\rangle\,dV_h,
 \qquad
 \xi(\Sigma)=\eta(\Sigma,h)+\frac{\mathcal T(\Sigma)}{12\pi^2},
 \qquad
 (\operatorname{curl}_h B)_{i\ell}
   =\varepsilon_\ell{}^{jk}\nabla_jB_{ik}.
\]
In the APS theorem the product-metric signature form is $p_1/3$
and eta is for the odd signature operator on even forms.
For a nonproduct collar, compare the Levi–Civita connection
to the product-boundary connection. Their tangential
difference is normal–tangent off-diagonal, with entries
$B_i$ and $-B_i$. Writing the difference as $\theta$, the
linear and cubic traces in the Pontryagin transgression
vanish at the boundary. Its quadratic trace is
$\operatorname{tr}(\theta\wedge d_0\theta)
=-2\sum_iB_i\wedge(d^\nabla B)_i$. With
$p_1=-\operatorname{tr}(\Omega\wedge\Omega)/(8\pi^2)$,
this gives $+\mathcal T/(4\pi^2)$ in the $p_1$ integral.
Trace terms in the boundary pairing cancel by symmetry.
The curvature-operator blocks give
$4\pi^2p_1=(|W^+|^2-|W^-|^2)dV$.
Changing the normal negates $B^\circ$ but leaves the
quadratic tensor pairing unchanged, while the orientation
change negates the curl pairing and the eta term. Thus in
a region $V$ between cuts $\Sigma_a,\Sigma_b$ ordered
outward,
\[
 E_+(V)-E_-(V)=12\pi^2\left(\tau(V)+
       \xi(\Sigma_b)-\xi(\Sigma_a)\right).
\]
This is the parent's exact ledger, with the inner face
contributing with a minus sign. [APS I, Theorem (4-14), p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24)
· [Checked parent ledger](../../01_chirality_ledger/reviews/PARENT_SECTION_3.md)

For marked parallel cuts in the actual disk bundle each
intervening region has zero signature. In fact parallelism
is unnecessary for this use: for any finite list of
disjoint nested separating cuts diffeomorphic to
$Q_8\backslash S^3$, each of the resulting pieces has
$H_2(-;\mathbb Q)=0$. The links have zero first and second
rational homology, so Mayer–Vietoris splits the second
rational homology of $W$ as the direct sum of those of the
pieces, and $W$ retracts to $\mathbb{RP}^2$. This includes
the region between one interior cut and the terminal face.
In an ambient filling with nonzero regional signatures
the zero-signature variation bound need not apply.

For such an ordered sequence, additivity and the pointwise
nonnegativity of both chiral integrands give
\[
 E_+(W)\ \ge\ 12\pi^2\sum_j
       \big(\xi(\Sigma_{j+1})-\xi(\Sigma_j)\big)_+,\qquad
 x_+=\max(x,0).
\]
Taking the supremum over finite partitions gives the
positive variation bound for a parallel family. Its inner
limit at any smooth small tube about the bolt is zero:
the enclosed region retracts to $\mathbb{RP}^2$, and the
signed curvature integral goes to zero by bounded curvature
and the vanishing tube volume. At the terminal umbilic
Berger face $\mathcal T=0$ and $\eta=-5/12$. Keeping only
the outgoing region of any such cut already gives
\[
 E_+(W)\ge12\pi^2\big(-5/12-\xi(\Sigma)\big)_+ .
\]
Thus $\xi(\Sigma)\le-13/24$ is sufficient to exclude
the strict budget. Multiple positive excursions can also
violate the budget even when every individual cut stays
above this value. For the exact E49 annulus the signed
ledger gives
$\xi(\rho)=-5/12-E_+([\rho,1])/(12\pi^2)$, which tends
to the round value $-3/4$. The finite-radius calculation
and the signed criterion agree.

## Application to round-conical slices

The round quaternionic link in the outward marking has
$\eta=-3/4$, and a coordinate sphere in the round
Euclidean cone has $B^\circ=0$. Suppose an interior
separating slice in $W$, oriented toward the terminal
face, has a marked annular neighborhood which after
constant rescaling is close in $C^2$ to a neighborhood of
the unit sphere in the Euclidean quotient
$(\mathbb R^4\setminus\{0\})/Q_8$. Use the specified
quaternionic representation and the outward sphere
orientation. If the normalized error is $\delta$, the
intrinsic eta difference is $O(\delta^2)$ by the
round-reference variation identity. The induced metric
has the corresponding $C^2$ comparison, and the ambient
comparison gives $B^\circ$ and
$\nabla^h B^\circ$ both $O(\delta)$ at the reference slice.
Therefore $\mathcal T=O(\delta^2)$. Both terms in $\xi$
are unchanged by constant scaling. In particular
\[
 \left|\eta+\tfrac34\right|+
 \frac{|\mathcal T|}{12\pi^2}\le \frac5{24}
 \quad\Longrightarrow\quad \xi\le-\frac{13}{24}.
\]
The round eta value follows from the fixed-point average
of APS II: the six order-four elements have contributions
$-1$ and the central involution contributes zero.
[APS II, §2, pp. 410–413](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf)
· [Quadratic eta and extrinsic comparison](../../01_chirality_ledger/notes/ETA_VARIATION.md)

This covers an ALE gluing or bubble sequence whenever
it supplies that marked separating slice with normalized
$C^2$ convergence. For an ALE chart with
$\partial^\ell(g-g_{\rm Eucl})=O(R^{-\tau-\ell})$ for
$0\le\ell\le2$ and $\tau>0$, rescaling a fixed-ratio
annulus of radius $R$ gives the needed comparison with
$\delta=O(R^{-\tau})$. If the comparison is transferred
from an ALE model to actual metrics on $W$, the transferred
annulus must also be $C^2$ close. A purely intrinsic
near-round metric gives no control of the transgression,
and an ALE model with a different oriented link or no
such embedded separating realization does not meet the
hypotheses. In particular a compact bubble core with
nonzero rational $H_2$ cannot sit inside this $W$ as the
inner side of a rational homology sphere cut. The argument
does not assume existence or convergence of an arbitrary
bubble sequence. [Bando–Kasue–Nakajima, *On a construction
of coordinates at infinity*, Invent. Math. 97 (1989),
pp. 313–349, definition and scope of ALE comparison](https://geodesic.mathdoc.fr/item/IM_1989__97_2_143705/)
