# E50 · Compactified Berger cap and orbifold comparison

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
assistance. GPT‑6.2 Sol with ultra reasoning requested. Actual model
and effort unavailable. Input checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, [frozen E50
request](../research-progress/handoffs/E50_REQUEST_R1.md), and [E49
construction specification](../research-progress/handoffs/E49_REQUEST_R1.md).
The geometric inputs are the [E15 half-flat collar
replay](E15_QUATERNIONIC_COLLAR.md) and the [E35 oriented disk
cover](../notes/E35_COVER_CAP.md), working-tree SHA‑256 prefixes
e13a82fe1f7ac8ed and 25ee65328a65213b. Curvature integrals use the
chiral Hilbert–Schmidt norms of the Weyl endomorphism. All calculations
here are analytical.

The half-flat collar compactifies as a smooth orbifold cap, has
strictly positive Robin sign, and adds zero in the smaller
chirality of the short-axis disk. The glued original and its
actual twofold cover both have $2\chi_{\rm orb}+3\tau_{\rm orb}=0$.
The usual closed orbifold inequalities therefore do not improve
the short-axis disk's existing smaller-chirality bound.

## Compactification and Weyl energies

Let $r=e^{-v}$, $C=1+4r^2-2r^4$ and $c=\sqrt C$. On the end
take $g=C^{-1}dv^2+\sigma_1^2+\sigma_2^2+C\sigma_3^2$, where
the coframe is right invariant in the chosen quaternion orientation
and gives the unit round metric when $c=1$. Orient the end by
$dv\wedge\sigma_{123}$. Its outer face at $v=0$ then has the
orientation opposite to the short-axis disk's face. The boundary
metric is the exact marked Berger metric. The order-four subgroup
for the extending cover fixes a short axis in the marking.
The cap is an orbifold ball, so no short circle has to collapse
at a smooth disk-bundle bolt.

On Cartesian quaternions $x$ define $\alpha_0=\operatorname{Re}(dx\,\bar x)$
and $\alpha_3$ as the $k$ component of $\operatorname{Im}(dx\,\bar x)$.
Then $dr=\alpha_0/r$ and $\sigma_3=\alpha_3/r^2$ for $r>0$.
Using $\delta=dr^2+r^2\sum_a\sigma_a^2$, the compactification is
\[
 \bar g=r^2g
 =\delta-\frac{4-2r^2}{C}\alpha_0^2+(4-2r^2)\alpha_3^2 .
\]
Both correction terms are smooth tensors in $x$, vanish at the
origin, and remain invariant under the actual left $Q_8$ action.
Indeed $\alpha_0$ is invariant and conjugating by $Q_8$ preserves
the line of the $k$ component and acts on it by signs. The
metric is positive definite for $r>0$ by the polar expression
and equals $\delta$ at $0$. Thus the local chart is the effective
linear quotient by $Q_8$, respectively by its specified subgroup
$C_4$ on the twofold cover. The local orientation here is opposite
to the radial-first outward quaternion orientation since $v$
increases as $r$ decreases.

Write $z=c^2-1$. The chiral calculation of E15 gives
$E_\pm/\pi^2=(1/96)\int_0^\infty(\ddot z\pm6\dot z+8z)^2\,dv$
on $Q_8\backslash S^3$, with dots denoting $v$ derivatives.
Here $\ddot z+6\dot z+8z=0$. Since
$\dot z=-8e^{-2v}+8e^{-4v}$ and
$\int_0^\infty\dot z^2\,dv=8/3$, the exact cap pairs in the
orientation used for gluing are
\[
 (E_+,E_-)(Z)=(0,4\pi^2),\qquad
 (E_+,E_-)(\widetilde Z)=(0,8\pi^2).
\]
Conformal invariance gives the same energies after compactification.
The quotient integrals are over the regular part; the origin has
zero measure.

## Robin and glued Yamabe signs

The original metric has scalar curvature
$6(1-4r^2+6r^4)\ge2$ and its finite boundary is totally geodesic.
The compactified boundary is umbilic. In the trace convention
$H=\operatorname{tr}B$, the Robin quadratic form has bulk
$6|df|^2+R f^2$ and boundary contribution $2H f^2$.
For a smooth orbifold test function $f$ on the compact cap, set
$u=rf$ on the end. Conformal covariance of the quadratic form
gives
\[
 Q^{\bar g}_Z(f)=\int (6|du|_g^2+R_g u^2)\,dV_g
       \ge 2\int r^{-2}f^2\,dV_{\bar g}
       \ge 2\|f\|_{L^2(\bar g)}^2 .
\]
For example, first cut $f$ off near $r=0$. Such cutoffs
converge to $f$ in $H^1(\bar g)$ as the cut radius tends to
zero in dimension four. The corresponding cylindrical
tails tend to zero in the displayed energy since $u$ and
$|du|$ are $O(r)$ and the cylindrical volume density in
$v$ is constant. Smooth invariant chart functions are
dense in orbifold $H^1$. This proves strict positivity for
both group orders. The raw compactified metric has
$R_{\bar g}=96(r^2-1)$, so its positive Robin sign depends
on the complete form, including the boundary term.
[Conformal covariance and Robin normalization](../../02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md)

To glue to a smooth disk cap $W$ with a marked umbilic
boundary, use conformal factors with prescribed normal
derivative to make both boundaries totally geodesic while
matching their intrinsic metrics. A required boundary scale
extends as a smooth positive factor with prescribed first
normal jet. In these gauges the closed form before smoothing
is $Q_W+Q_Z$ on the subspace of pairs of $H^1$ functions
with the same trace. The strictly positive Robin signs of
both pieces imply coercivity on this subspace. The same is
true when $Q_W$ has zero lowest Robin eigenvalue and $Q_Z$
is strictly positive. A normalized zero minimizer would be
zero on $Z$ and a lowest Neumann null function on $W$
vanishing on the boundary. Uniqueness from the maximum
principle and the boundary point lemma excludes this, and
compactness of the $H^1$ inclusion into $L^2$ then gives
an $L^2$ spectral gap. Combining it with the gradient
estimate gives coercivity. This argument also gives
positivity of the cap's own reflected double. The strictly
positive sign lifts to the twofold orbifold cover by lifting
a positive eigenfunction and using the conformal scalar
transformation, or by first lifting the positive signs in
the totally geodesic gauges of the two caps.

For completeness, if the Robin sign of $W$ is negative
or unknown, the exact seam condition before smoothing is
coercivity on the matching-trace subspace. An equivalent
boundary test requires both Dirichlet conformal Laplacians
strictly positive and the sum of their Dirichlet-to-Neumann
quadratic forms coercive on $H^{1/2}$ of the face. The
Dirichlet signs are necessary by extension by zero.
When they hold, decompose each function into its
zero-trace part and the unique conformal-Laplacian null
extension of the common trace. Integration by parts
makes the decomposition orthogonal for the quadratic
form. The zero-trace sum is coercive and the remaining
form on the trace is the sum of the two boundary
operators, with $6\partial_\nu$ in the totally geodesic
gauges. The trace and null-extension maps are bounded in
the indicated Sobolev norms. This proves the criterion.

The joined metric is $C^1$ across the smooth face. Productize
in collars of widths tending to zero, leaving the orbifold
point unchanged. The boundary first jet is already zero
in the totally geodesic gauges, so these smooth metrics
converge in $C^1$ and $W^{2,p}$ for finite $p$. Their
Weyl energies converge to the sums of the original cap
energies. Scalar curvature converges in $L^2$, and
orbifold $H^1\hookrightarrow L^4$ follows in finite charts
by the ordinary local estimates. Thus the conformal
Laplacian forms converge in their $H^1$ bound and strictly
positive sign gives strictly positive Yamabe constant for
all sufficiently close smoothings. Positivity of the
compactified comparison cap alone does not supply the
matched positivity condition.

## Closed orbifold estimates in the branch convention

Put $M=W\cup Z$ and $\widetilde M=\widetilde W\cup\widetilde Z$.
The topological cone adds one to Euler characteristic
and leaves signature unchanged over the rational homology
sphere link. The underlying fundamental groups are trivial,
since coning off the boundary kills the image of its
fundamental group, which surjects to the disk cap's
fundamental group downstairs. In the orbifold fundamental
group calculation the boundary instead maps isomorphically
to the orbifold ball's group. Van Kampen therefore gives
$C_2$ downstairs and the trivial group upstairs. The given
twofold cover is the universal orbifold cover and its
singular group is $C_4$. The groups $Q_8$ and $C_4$ act
freely on the link in the smooth oriented charts described
above. In particular the universal orbifold cover still
has a singular point.

The numerical invariants and Weyl differences are as
follows. Here $\tau_{\rm orb}$ is the curvature signature
integral, and the eta correction uses the orientation of
the boundary of the complement of a small singular ball.

| Invariant | $M$ | $\widetilde M$ |
|---|---:|---:|
| $\chi_{\rm top}$ | $2$ | $3$ |
| $\chi_{\rm orb}=\chi_{\rm top}-1+1/|\Gamma|$ | $9/8$ | $9/4$ |
| $\tau_{\rm top}$ | $0$ | $-1$ |
| Round complement-link eta | $-3/4$ | $-1/2$ |
| $\tau_{\rm orb}$ | $-3/4$ | $-3/2$ |
| $E_+-E_-$ | $-9\pi^2$ | $-18\pi^2$ |
| $b_2^+$ and $b_2^-$ | $0,0$ | $0,1$ |

The signature correction can also be fixed without any
link orientation notation: the disk's signed difference
is $-5\pi^2$ downstairs and $-10\pi^2$ upstairs by the
Berger APS values, and the added differences from the
compactified comparison cap are $-4\pi^2$ and $-8\pi^2$.
Both methods give the same signature integrals. The round
link in APS on the excised complement has the opposite
orientation to the boundary of the tiny ball in the
oriented singular chart. [APS I, (4-14)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24)
· [E46 eta calculation](E46_CAP_COVER.md)
· [Sung, §3.3 and (11)–(12)](https://arxiv.org/pdf/2108.03808#page=11)

Sung uses the Weyl operator norm $|W|^2=W_{ijkl}W^{ijkl}/4$.
Theorem 1.4(i)–(iii) is for smooth closed oriented
Riemannian orbifolds with a strictly positive class.
Its correction for a finite universal orbifold covering
is $8\pi^2/(|\pi_1^{\rm orb}|\,|\widetilde\Gamma|)$ for
the largest isotropy group of that cover. Here the
denominators are $2\cdot4$ and $1\cdot4$. The versions
using the ordinary fundamental group or $H_1$ give the
same numbers. Equivalently these are the corrections
from the local Yamabe bubble bounds $Y^2\le
384\pi^2/|\Gamma|$, where the orbifold quotient divides
the energy and the $L^4$ integral by $|\Gamma|$. For
a class having a unit-volume orbifold Yamabe minimizer,
equation (5) and the orbifold characteristic formulas
give
\[
 E_\pm\ge
 2\pi^2(2\chi_{\rm orb}\pm3\tau_{\rm orb})-Y^2/48 .
\]
One can apply Theorem 1.4 directly even when attainment in
the comparison class itself has not been checked. Sung
treats the relevant minimizing-sequence issue in §3. No
smooth manifold cover is required in (i).
[Sung, Theorem 1.4 and §3, author version](https://arxiv.org/pdf/2108.03808#page=5)
· [Published article](https://doi.org/10.1007/s10455-021-09798-x)

For both orbifolds $2\chi_{\rm orb}+3\tau_{\rm orb}=0$,
so plus curvature gets only its nonnegativity floor.
The opposite orientation gives $E_-\ge8\pi^2$ and
$E_-\ge16\pi^2$, respectively. Signed nonnegativity
already gives $E_-\ge9\pi^2$ and $18\pi^2$. Sung's
orbifold Gursky inequality in (v) applies on the
orientation-reversed cover, with $b_2^+=1$ in that
orientation, and yields the weaker bound $E_-\ge12\pi^2$.
The smaller block in the stated orientations has
$b_2^+=0$ on both, and there is no verified global
harmonic-Weyl hypothesis for (vi). The positive comparison
has the intended zero cost in that block, and the
closed characteristic combination removes the prospective
gain. In particular these comparisons leave the prior
$E_+(W)\ge\pi^2/6$ from the reflected smooth cover as
the stronger available bound.
