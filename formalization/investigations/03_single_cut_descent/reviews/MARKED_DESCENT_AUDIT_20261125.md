# Marked reassembly and one-cut descent

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The delegated helper was configured as
GPT-6.2 Sol with ultra reasoning. The serving variant and effort are
unavailable independently of that configuration. This bounded E25/E28 audit
checks the smooth reassembly on
the supplied core and the analytic premises of the descent. The frozen inputs
are at `7db310a2a9219c537b440d7c2fb39e602a32b729`. The working checkout also
contained `0c3399d831d71a1a17c29ffcba14ee0593315cbe`, with additional Route 02
comparison results. Evidence here is a mathematical derivation and a source
and declaration inspection. No Lean theorem was added or verified by this
packet. [Route plan][plan] · [Program scope][parent] · [Frozen component
premises][route2]

## The marked pieces and their orientations

Let $M$ be a smooth closed connected oriented homotopy four-sphere. In the
smooth Riemannian compactification $(\widehat X,\bar h)$, let
$K_s=\widehat X\setminus B_s(p)$, where $B_s(p)$ is the open normal ball.
Use an oriented normal frame at $p$ and one orthogonal reflection $J$.
The chart $P_s(t,\omega)=\exp_p(s e^{-t}J\omega)$ is positively oriented
for $dt\wedge\operatorname{vol}_{S^3}$. Both the radial derivative and the
angular reflection reverse their respective orientations. One oriented
comparison embedding $\iota_i$ on a neighborhood of the entire core and
buffer defines $K=\iota_i(K_s)$, $F=\iota_i\circ P_s$, and the exterior
$V=\overline{M\setminus K}$. Thus $t<0$ lies in $K$, $t>0$ lies
in $V$, and $F(0,\cdot)=F_0$ is their common boundary marking. Use
outward-normal-first orientations on each piece. [NECK-E03][cut]

| Identification | Sign and collar |
| --- | --- |
| $F_0:S^3\to\partial K$ | Positive, since $+\partial_t$ points out of $K$. |
| $F_0:S^3\to\partial V$ | Negative, since $-\partial_t$ points out of $V$. |
| $a_K(v)=\exp_p(sJv)$ on the core cap $D_K$ | The cap inherits the orientation of $\widehat X$, so $a_K$ is negative relative to the standard oriented coordinate disk. Glue $a_K(\omega)$ to $F_0(\omega)$. These induced boundary orientations are opposite. The cap side of the signed chart has $t=-\log\lvert v\rvert\ge0$. |
| $a_V(v)$ on the exterior cap $D_V$ | Give this parameter disk the standard orientation. Glue $a_V(\omega)$ to $F_0(\omega)$ on $V$, again reversing the boundary orientation. The cap side of the signed chart has $t=\log\lvert v\rvert\le0$. |

Construct both glued smooth structures using the displayed collars. In
particular $a_V$ extends to an orientation-preserving parametrization of
a neighborhood of the whole closed disk in $\widehat V$. For $r>1$
close to $1$, set $a_V(r\omega)=F(\log r,\omega)$. This jointly
specifies the seam chart and the ball neighborhood on which the extension
theorem will act. On the core side the map $\iota_i^{-1}$ on $K$ and the
identity on the actual normal ball give the marked diffeomorphism
$\widehat K\to\widehat X$. In seam charts that map is $F(t,\omega)\mapsto P_s(t,\omega)$.
Its construction only uses the normal chart supplied by removability. [NECK-E03][cut] · [NECK-E02/E05][descent]

Each connected collar meets every component that has boundary. A component
missing the boundary would disconnect the ambient manifold, so $K$ and $V$
are connected.
Open thickenings retract to $K,V,S^3$ and give the van Kampen free product
$\pi_1(M)=\pi_1(K)*\pi_1(V)$. The two factors are trivial. In integral
Mayer–Vietoris the boundary of the oriented fundamental class of $M$ is
an oriented fundamental class of the separating $S^3$, up to the choice
of sign in the connecting map. The resulting $H_4(M)\to H_3(S^3)$ is an
isomorphism. Together with the homology of $M$ and $S^3$, this gives the
integral homology of a point on both sides. Capping with the designated
standard disks gives smooth closed simply connected integral homology
four-spheres. By Hurewicz a generator of $H_4$ is represented by a map
from $S^4$, and the simply connected Whitehead theorem makes this a
homotopy equivalence. The core topology can therefore be obtained before
using recognition or the closed Bach-flat gap on $\widehat X$.

## An oriented map with the specified seam

On the actual capped exterior $\widehat V$ the signature is zero and the
Euler characteristic is two. With the project Hilbert–Schmidt convention,
$\int|W|_{(0,4)}^2=4(E_++E_-)=8E_+$. A smooth Riemannian cap metric with
$Y([g_{\widehat V}])>0$ and $E_+(g_{\widehat V})<4\pi^2$ meets
Chang–Gursky–Yang Theorem A. Simple connectivity gives the standard smooth
$S^4$. Compose with an orthogonal reflection of $S^4$ if the resulting
map reverses orientation to obtain an orientation-preserving
$f:\widehat V\to S^4$. This uses the conformal-class Yamabe constant and
the strict Weyl bound of Theorem A, p. 107 and Remarks 1–2. [Published
Chang–Gursky–Yang][cgy]

Take $S^4=D_-\cup D_+$ with standard hemispheres. Choose their
stereographic parameter disks with a common angular variable and reciprocal
radii. On $D_-$ the signed equatorial coordinate is $t=\log r$, and
on $D_+$ it is $t=-\log r$, where $r\le1$ in either disk. The
exterior-of-$D_-$ direction has $t>0$. Choose the common angular
marking so the $D_-$ parametrization $a_-$ is positive, and extend it
across the equator by the same stereographic chart. Then
$f\circ a_V\circ a_-^{-1}$ is an orientation-preserving diffeomorphism
from a neighborhood of the smooth closed cell $D_-$ into $S^4$.
Palais Theorem C, p. 277, supplies an ambient diffeomorphism $A$
agreeing there after shrinking the neighborhood. The corrected
$A^{-1}\circ f$ sends the actual exterior cap to $D_-$ and matches
its parametrization on an open neighborhood of the cap. Its restriction
therefore identifies $V$ with $D_+$, taking $F(t,\omega)$ near
$t=0^+$ to $(t,\omega)$ in the equatorial collar. [Palais,
Theorem C][palais]

Send $D_+$ to the actual normal ball by its parameterized identification
with $D_K$. The resulting map $V\to D_K$ has formula
$F(t,\omega)\mapsto P_s(t,\omega)$ on an exterior collar. On $K$ use
$\iota_i^{-1}$. Both formulas are one and the same diffeomorphism on the
signed seam. They give a bijective smooth map with smooth inverse
$\Psi:M\to\widehat X$ that preserves orientation and agrees with the
specified comparison inverse throughout $K$.

Boundary equality by itself gives a continuous piecewise map. In a signed
normal coordinate, $t\mapsto t$ on $t\le0$ and $t\mapsto 2t$ on
$t\ge0$ agree at zero and have smooth diffeomorphic restrictions to the
half charts, while their derivatives differ at the seam. A gluing theorem
for these particular smooth maps must use compatible collar germs, or
prove smooth matching and invertibility in the seam chart by another
method. Hatcher's component theorem, p. 553, also gives a disk extension
of any boundary diffeomorphism of the standard $S^3$. A smooth isotopy
to an orthogonal map, constant near the two parameter endpoints, yields
an extension radial-product near the boundary and orthogonal near the
center. That extension realizes a boundary map in a chosen product
collar. When other normal jets are prescribed, adjusting the collars is
an additional step. The Palais proof above consumes a full ball-neighborhood
map and directly obtains that compatibility. The cell in the theorem is
already a specified smooth disk supplied by capping. Its complement is
identified after smooth recognition of the capped exterior, so the argument
requires no smooth four-dimensional Schoenflies claim for a sphere supplied
only as an arbitrary embedding. [Hatcher, opening page][hatcher] · [Source
record R122 and R126][joint]

## Remaining hypotheses for the descent

1. **Component and fixed cut.** For E28 take the fixed smooth type $M$,
   volume-one positive Yamabe minimizers $g_i$, and the source band
   $4\pi^2\le E_i\le8\pi^2-\delta$ with $E_i\to e$ and total Bach norms
   tending to zero. Take a supplied nonflat smooth complete blow-up along
   a shrinking scale, with orientation-preserving embeddings on whole
   compact truncations, finitely many differentiated ALE ends, and positive
   end decay through order five. E11 must give one trivial end and the
   geometric budgets $E_+=E_-=e_X$ and $d=4e_X$. E12 brings in the
   smooth one-point conformal compactification with positive Yamabe
   constant, preserved chiral energy and exact Bach-flatness. The actual
   smooth chart at the added point is an input to NECK-E03. Ache–Viaclovsky
   Definition 1.6, Theorem 1.8 and Remark 7.2 concern removal in an
   appropriate chart for a punctured constant-scalar-curvature
   obstruction-flat metric with the stated $C^0$ orbifold derivative
   control. Trivial group here gives an ordinary smooth point.
   [SEC §§11.1–11.4][sec] · [Ache–Viaclovsky v2][ache]

2. **Cap positivity and recognition.** Put $T=4\pi^2$. The closed
   Bach-flat gap from E13 gives $e_X>T$ for this nonflat component.
   It uses smooth-type recognition in the strict range, the CGY equality
   theorem at $T$, and Chang–Chen's Bach-flat rigidity on a supplied
   standard sphere through the inclusive full-tensor threshold $32\pi^2$.
   Choose a finite Yamabe buffer length first so the localization error
   fits in the positive margin from $Y_i\ge\sqrt{48\delta}$. Then choose
   a fixed small normal radius $s$, before passing to sufficiently large
   $i$. The compactification tail goes to zero with $s$, the fixed-core
   transfer error goes to zero with $i$, and the $C^2$ cap bound gives
   the splice Weyl cost. With $0<\varepsilon<\delta/4$ as in NECK-E02/E05
   the losses sum to $4\varepsilon$, and $E_+(g_{\widehat V})<e-e_X+4\varepsilon<T$. Equivalently use the Route 03 scalar margin
   with a bound on the combined errors straddling the same fixed cut.
   All exterior source mass is already charged to $E_i$, and the
   positivity and Weyl cap estimates suffice for E25. A cap Bach bound
   would require the separate $C^4$ splice control.
   [NECK-E01][cap] · [NECK-E02/E05][descent] · [CGY Theorems A–B][cgy] ·
   [Chang–Chen preprint, §1 Remark 2 and Theorem 2.1][changchen]

3. **Residual and transport.** After taking the common subsequence for
   $Y_i\to y$, the residual inputs are the limiting source Euler identity,
   the AE identity $d=4e_X$, and the Ricci budget $d\le D$. The Yamabe
   transfer gives $0\le y\le\widehat Y$, and nonflatness gives
   $\widehat Y<Y_{\rm rd}$ by sharp Yamabe rigidity and the nonzero Weyl
   energy. These yield the strict $e_X<e$ on a supplied sequence. The
   uniform $\kappa_\delta>0$ additionally needs the separate
   fixed-band deficit $\widehat Y\le Y_{\rm rd}-d_\delta$ for exact
   critical classes, which SEC §12.2 derives using its exact compactness
   alternative. Use the smooth map $\Psi$ from the one cut to set
   $g_{\mathrm{new}}=\Psi^*\bar h$. Diffeomorphism covariance transfers
   the Yamabe constant and Bach-flatness, and orientation preservation
   identifies $\Lambda^+$, so $E_+(g_{\mathrm{new}})=e_X$. This
   gives $I^+(M)\le e_X<e$, strengthened to $I^+(M)\le e_X\le e-\kappa_\delta$ with the deficit. For exclusion, exact minimization
   uses the strict conclusion and near minimization requires the strict
   comparison $e-I^+(M)<\kappa_\delta$. [SEC §§11.5 and 12.1–12.2][sec] ·
   [Schoen, Theorem 2][schoen]

The frozen Route 02 public import already contains the arithmetic
`sourceBandScalarBudget`, `oneALEEndOfSubcriticalBounds`,
`q8EtaContradictionOfSubcriticalBand`, `componentResidual`,
`strictComponentResidual`, `componentResidual_lt` and
`uniformComponentResidual`. The end-count inputs are real order and
energy bounds. `strictComponentResidual` takes the limiting Euler
identity, $d=4e_X$, $d\le D$, $0\le y\le\widehat Y$ and
$\widehat Y<Y_{\rm rd}$ as arguments. `componentResidual_lt` takes
$e_X>4\pi^2$ as an argument. `uniformComponentResidual` takes the
positive admissible deficit and its upper bound on $\widehat Y$ as
arguments. Actual smooth ALE topology, the curvature identities and their
geometric passage to the limit, removability, the closed Bach-flat gap,
and the uniform deficit remain geometric obligations in E11–E13. The
additional fixed-domain comparison results at `0c3399d` supply
pullback-volume and density convergence where their hypotheses are met.
The parent FOT-E04 recognition and the metric-covariance inputs also have
separate geometric scope. [Frozen declaration files][budgets] ·
[Frozen end arithmetic][ends] · [Route 02 premise audit][route2] ·
[Parent register][parent]

For a conditional Lean interface, the topological construction needs the
actual smooth capped types, an oriented diffeomorphism of the recognized
exterior, the specified extended disk and seam charts, and a proof of
smooth restriction and matching or the corresponding geometric lemmas.
A boundary pushout elimination rule for smooth maps would fail the seam
example above. The output needed for full E25 is an oriented
$C^\infty$ diffeomorphism with its core restriction, or an existence
statement returning that witness. E28 also needs smooth metric pullback
and invariance of the actual $E_+$, Yamabe and Bach quantities under
that map. A functional of a supplied homeomorphism or an arithmetic
identity between abstract energies can certify its own premise, while
the marked smooth realization needs the indicated additional input.

[plan]: ../research-plan/PLAN.md
[parent]: ../../research-progress/REGISTER.md
[route2]: ../../02_neck_energy_accounting/reviews/GEOMETRIC_PREMISES_20261125.md
[cut]: ../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md
[descent]: ../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md
[cap]: ../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md
[sec]: ../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3859
[joint]: ../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md
[budgets]: ../../../FirstOrderTwistor/ComponentBudgets.lean
[ends]: ../../../FirstOrderTwistor/ALEEndCount.lean
[palais]: https://paperzz.com/doc/8888202/extending-diffeomorphisms
[hatcher]: https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf
[cgy]: https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3
[ache]: https://arxiv.org/pdf/1106.1249v2
[changchen]: https://arxiv.org/pdf/2109.08208v1
[schoen]: https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf

## Closing check of the Lean interfaces

The Route 03 source at working checkout `0c3399d` supplies two conditional
steps that meet at the chosen cut. `selectFixedSphericalCut` chooses the
buffer, a fixed arbitrarily small positive radius and one eventual source
tail from the supplied scalar limits and cap bounds. Its energy threshold
allows $e_X=4\pi^2$ when the error allowance is strictly below $\delta$.
`SmoothCutGluing.ofRecognizedExterior` composes actual smooth partial
maps, given recognition and the signed chart identities. It takes the
cover equalities and both exact open-overlap equalities as arguments.
Geometric application still has to realize these data for the same selected
exterior, using one common signed collar and the corrected recognition
there. The global smooth gluing theorem then supplies the forward and
inverse maps with their marked restrictions and transports the supplied
patch orientations. [Cut selection](../../../FirstOrderTwistor/CutSelection.lean) ·
[Exterior patch](../../../FirstOrderTwistor/ExteriorPatch.lean) ·
[Oriented gluing](../../../FirstOrderTwistor/OrientedCutGluing.lean)

`MarkedMetricTransfer.competitor` constructs an oriented smooth
diffeomorphism and the actual Riemannian pullback with positive Yamabe
constant. `classYamabeFour_pullback` proves equality of sets of normalized
scalar values, using scalar and volume naturality, and therefore equality
of their real infima. The geometric interpretation uses finite positive
volume and integrable scalar curvature on a smooth nonempty closed
manifold. The conformal-factor range is nonempty, and the usual
four-dimensional Yamabe quotient and Hölder give a uniform lower bound
within each fixed class, namely
$\min(0,\inf R_g)\operatorname{Vol}(g)^{1/2}$.
[Yamabe transport](../../../FirstOrderTwistor/YamabeTransport.lean)

`chiralFrameEnergy_pullback` proves equality of the totalized integrals
from supplied almost-everywhere orthogonal conjugacy. Integrability and
identification with physical $W^+$ come from the application. A measurable
choice of local orthonormal frames suffices, since the squared norm is
intrinsic and smooth. The competitor witnesses nonemptiness of the
positive-Yamabe energy range, and squared-norm nonnegativity supplies its
lower bound. To interpret the formal infimum as $I^+(M)$, the input
`WM` must represent the physical positive block for every admissible
source metric. The conjugacy premise concerns only the pullback competitor.
The strict and uniform conclusions use their stated residual data.
The geometric closed-gap and uniform-deficit inputs, Bach-flatness of
the compactification and its transport, and realization of the supplied
cap metrics and collar hypotheses remain separate from this checked
composition. [Chiral transport](../../../FirstOrderTwistor/ChiralTransport.lean) ·
[Same-type composition](../../../FirstOrderTwistor/SphericalCut.lean)
