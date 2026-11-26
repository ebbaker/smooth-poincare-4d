# HT-E08a · Open gluing at the selected marked edge

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort were unavailable.
The Edition 03 intake was a7bb158d6af806d2573a7702386622ed4c0bb1f1,
with working E41 topic generation b23a1d54. This return concerns actual
regular sublevels and a specified isolated index-one step on the smooth
four-dimensional source. [Owning register](../REGISTER.md) ·
[Previous assessment](../../../reviews/ROUNDED_EDGES_AND_REFERENCE_COST_20261125.md) ·
[Lean source](../../../../SmoothPoincare/Heights/MarkedEdgeGluing.lean) ·
[Selected two-birth edge](../../../../SmoothPoincare/Heights/SelectedBirthEdge.lean)

## Open domains and marked overlaps

The four supplied partial diffeomorphisms represent the two incoming
body patches, the rounded block, and the outgoing collar. Forward maps
agree on each open source intersection, and inverse maps agree on each
open target intersection. The assembled forward and inverse maps have
exactly the two unions as their domains and restrict to the original
maps throughout each entire patch. If the two unions cover the
whole bodies, the same formulas give a global smooth diffeomorphism.
When a common chart covers the entire source and target intersection,
its forward equations force the inverse agreement. Domain coverage
on the target is essential to this implication. [Open assembly and
overlap inverse](../../../../SmoothPoincare/Heights/MarkedEdgeGluing.lean)

For two supplied signed collars $A$, $B$ and a smooth level
comparison $d$, the overlap map is $B(d,\operatorname{id})A^{-1}$ and
its inverse is $A(d^{-1},\operatorname{id})B^{-1}$. The two domains
are the complete collar images when $d$ identifies the base domains
and the signed strips have the same width. The checked forward and
inverse formulas retain the entire level point and its signed real
coordinate. On collars calibrated by the source and model heights,
the signed height differences also agree throughout the overlap.
The same $A$ can be the native outgoing chart from the previous
rounded-rim and next-cut construction. [Common actual outgoing
chart](../../../../SmoothPoincare/Heights/OutgoingEdgeTransport.lean) ·
[Signed overlap](../../../../SmoothPoincare/Heights/MarkedEdgeGluing.lean)

## The actual stored trace

On the open part of the native lower body where
$f<f(p)-\varepsilon-\eta$, the literal lower insertion is a
diffeomorphism to the corresponding open portion of the stored
trace. Its inverse reads the ambient point through the stored
trace diffeomorphism. The proof uses both deep-lower equations and
smooth corestriction into the native regular sublevel. The region
is available wherever the strict inequality holds.

For any assembled comparison $F$ on the actual upper sublevel,
composition with the stored trace $E$ has source $E^{-1}(\operatorname{source}F)$,
target $\operatorname{target}F$, and inverse $E^{-1}F^{-1}$.
With full covers the global comparison has both exact representative
equations $FE[\mathrm{lower}(x)]$ and $FE[\mathrm{cell}(z)]$.
On the literal deep lower insertion, the forward equation evaluates
$F$ on the original sublevel point and the inverse returns its
original lower representative. For an entire smooth tube $u$ on the
native outgoing level, the result uses $F$ of the native level-to-body
inclusion of $u$. The inverse returns the same trace point at every
tube parameter. Compact parameters and a Hausdorff target preserve
closed embedding when the original tube is injective. The model
boundary marking or frame comparison is supplied by the relevant
collar maps. [Native trace](../../../../SmoothPoincare/Heights/EndHandleBands.lean) ·
[Native level inclusion](../../../../SmoothPoincare/Heights/RegularEndMarkings.lean)

## Remaining geometric comparisons

The two closed incoming balls and their complete boundary spheres
can be recovered from two actual births under the stated empty
predecessor and intervening regular bands. Disjoint compact body
images allow disjoint open ambient chart neighborhoods, preserving
both coordinate maps. Distinct native component labels then place
the two entire actual feet on opposite marked boundary spheres.
The named result exists_twoBirthCharts_withNativeEdgeFeet gives
the incoming bodies and the attaching incidence on one specific
chronological edge under those hypotheses.
[Surviving birth bodies](../../../../SmoothPoincare/Heights/SurvivingBirthBodies.lean) ·
[Native edge incidence](../../../../SmoothPoincare/Heights/NativeEdgeIncidence.lean)

A smooth four-ball model with the specified incoming maps still needs
their full collar germs to agree with its handle block on the actual
open overlaps. The body charts and local foot orientation identify the
marks on the boundary. The retained rounded model below supplies a
global comparison with the original trace and its actual outgoing
marking. Agreement of that comparison with the independent radial
calibration also needs an open-overlap equation. The forest iteration
and diagram-specific recognition remain separate.
[Pinned actual attachment engine](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/SublevelTransport.lean#L656) ·
[Scientific marked end reduction](../../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex) ·
[Current immersion argument](../../../../../papers/master/manuscript/immersion_entry.tex)

## Checks

The toolchain was Lean 4.35.0-rc3 at
470d5ce1400764999581fd26d5d72b00d990b0f4 and Lake
5.0.0-src+470d5ce. Mathlib was pinned to
c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry to
788efe97894474c032de6dfb1289d515f613d15a. The manifest SHA-256 is
839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239.
The checked TeX input hashes start f7a9522959429fdb and
9681e2deb71434b7 for the immersion and marked-recognition sources.

The targeted Lake build passed without diagnostics in 10,121 jobs.
All 24 exact type and 24 axiom queries passed through the importing leaf
probe. They reported only propext, Classical.choice and Quot.sound.
The module SHA-256 is
cf89d7e83054df169a2639729cfef64a577d61cd780d96437c3ff0592c382eba.

An importing application independently composed two specified native
births and their intervening regular transports with the actual incoming
cut of a specified index-one step. It uses the empty predecessor,
the two isolations and the regular interval from the second birth
to the named cut. It recovers both full closed ball images and
both boundary sphere images in disjoint open chart targets. For
distinct native edge labels it checks every point of each actual
attaching disk on its corresponding marked sphere. The application
passed without diagnostics. The application input SHA-256 is
931574a555fccdce21374a47a7499f7d7dfb1012cf003caed3c49dfa9518c6bc.
The companion birth-body source generation begins 38ca99a379010f48.

The same application is now exported as
SmoothPoincare.IsolatedOneHandle.exists_twoBirthCharts_withNativeEdgeFeet.
The targeted SelectedBirthEdge build completed in 10,123 jobs.
Its module SHA-256 is
33f33cd229c62e6d922451ae5cb4f046fc4256aa980239efdbc3d5a6021c7c7e.

## Outgoing representative check

The public inverse called morseHandleAdjunctionToUpperSublevelInv
is defined on the sharp attachment's image at $f(p)+r^2/2$. Its
lower branch returns the literal lower class, and its other branch
chooses a cell representative in that image. The rounded public
representative formulas instead refer to the named equivalence onto
a specified rounded-function sublevel, with explicit rounding and
cutoff parameters. The private engine connects that equivalence to
its outgoing diffeomorphism through a second smooth map. The public
existence wrapper drops that intermediate map and its comparison
equation. Consequently the representative formulas have no equation
with the stored outgoing map of a supplied IsolatedOneHandle.
The available outgoing preimage is the stored inverse applied to
the native level inclusion, and it gives the exact whole-tube
equations above. A common chart covering the full overlap still
allows automatic recovery of inverse agreement from forward
agreement. [Sharp representative inverse](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/ManifoldHandle.lean#L7165) ·
[Rounded representative equations](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/ManifoldHandle.lean#L18780) ·
[Public wrapper](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/SublevelTransport.lean#L1033)

Two additional importing tests passed without diagnostics. The first
uses the stored inverse after the actual regular level inclusion and
checks smoothness and exact recovery on the full outgoing level. The
second changes the stored trace by postcomposing with any smooth
upper-body self-diffeomorphism $G$ that fixes the deep lower sublevel.
The same chart, attaching map and deep-lower fields satisfy
IsolatedOneHandle with the changed trace. At each point moved by $G$,
its outgoing preimage changes from $E^{-1}y$ to $E^{-1}G^{-1}y$.
This identifies the additional normalization needed to recover the
specific rounded representatives. The checked input SHA-256 values
start 1d23354b734ef0ea for the smooth outgoing preimage and
0246a3f10e39511d4 for the change of trace. The public type and axiom
query for exists_twoBirthCharts_withNativeEdgeFeet also passed and
reported only the three foundations above.

## The fresh normalized trace and the original outgoing mark

Both geometric factors of the pinned private engine have public
constructors. The first maps the adjunction of the new cuts to the
rounded-function sublevel, and the second carries that sublevel to
the new actual upper body. The private real-parameter lemma can be
verified directly. With $R$ the same original Morse radius and
$a=\min(\varepsilon_{\rm old},R^2/16)$, take
$$
 \varepsilon_{\rm new}=\eta_{\rm new}=a/4,\qquad
 r_{\rm new}=\sqrt a/2,\qquad
 \delta=\theta=a/20,\qquad R_0=\sqrt{2a},\quad R_1=3R/4.
$$
The fresh witness has the original critical point, Morse chart,
height and isolating band. The open rounded core strictly contains
the actual native rims for its new radius. The old deep cutoff is
strictly below $f(p)-a/2$, so the fresh trace also fixes the ambient
point of every original deep representative. The theorem retains the
rounded function and both maps with their inverse equations. In the
rounded model, the native lower representatives take the exact
cap-rounding formula and the native handle representatives take the
exact rounded handle parametrization. Each of the two smooth factors
also has the exact deep identity in both directions. Complete smooth
regular marked comparisons join the original lower cut to the refined
lower cut and the refined upper cut to the original upper cut. Those
comparisons track all supplied level and body marks. The refinement
has new attaching radii and does not assume that regular transport
carries the original foot embedding to the newly constructed one.
[Fresh retained result](../../../../SmoothPoincare/Heights/RetainedRoundedTrace.lean) ·
[Pinned rounded adjunction map](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/ManifoldHandle.lean#L20260) ·
[Pinned outgoing rounded-sublevel comparison](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/SublevelTransport.lean#L52)

Write $E$ and $E'$ for the original and refined trace maps,
$R_{\mathrm{rd}}$ and $R_{\mathrm{up}}$ for the retained factors,
and $s,\ell$ for the body and level maps of the **same** regular
upper band from the refined to the original cut. The whole original
trace maps smoothly to the refined rounded body by
$$
 F=R_{\mathrm{up}}^{-1}s^{-1}E,\qquad F^{-1}=E^{-1}sR_{\mathrm{up}}.
$$
With the actual level inclusions $\iota_0,\iota_1$, the outgoing
equations are
$$
 F E^{-1}\iota_0(y)=R_{\mathrm{up}}^{-1}\iota_1(\ell^{-1}y),\qquad
 F^{-1}R_{\mathrm{up}}^{-1}\iota_1(x)=E^{-1}\iota_0(\ell x).
$$
Both hold on the entire levels and hence throughout the full
parameter domain of every supplied tube. The map
$e=(E')^{-1}s^{-1}E$ transfers the original trace to the refined
trace, and $F=R_{\mathrm{rd}}e$ in both directions. Thus applying
$F$ to the pullback by $e^{-1}$ of any refined lower or handle
representative gives the corresponding exact rounded point formula.
This determines a smooth map from the original stored trace with its
outgoing marking. The equality to the independent radial
calibration and the global round-ball model still require the stated
overlap and body data. [Original trace comparison](../../../../SmoothPoincare/Heights/OriginalRoundedTrace.lean)

RetainedRoundedTrace and OriginalRoundedTrace passed targeted
Lake builds of 10,122 and 10,123 jobs. Their SHA-256 hashes are
5460fc23d8933a64edf0ba73864475705eda9b54f888343b266210272795e2f2 and
d2071ac3b778374552e1bc349091be6c83121112a38e2dac2fc8b5b4f9c7e7df.
The importing replays checked nine exact types and axiom reports,
with only propext, Classical.choice and Quot.sound. Two application
checks passed without diagnostics. One applies the fresh construction
and checks that the closed old deep set lies in the open new deep set.
The other applies the original-to-rounded comparison to every parameter
of a supplied outgoing tube, and checks the inverse with the same level
map. Their input SHA-256 values are
eb0fc36ca372b64a89c5769def45e69f235774adbb7a5a35f662225717d7003b and
138f51fd16ee3850aa434181c6ba5b371307ce80736330dd2c55b7a664a14d37.

## The retained outgoing level and signed collars

The regular-sublevel boundary theorem identifies the entire boundary
of the actual rounded body with $g^{-1}(f(p))$ and the entire boundary
of the actual refined upper body with $f^{-1}(c)$, where
$c=f(p)+\varepsilon$. Smooth local invertibility of the retained
$C.\mathrm{toUpper}$ preserves these boundary points in both directions.
Factoring both restrictions through their level-set smooth atlases
gives the level diffeomorphism $d$ and its inverse, with both exact
level-to-body inclusion equations. [Regular-sublevel boundary theorem](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/RegularSublevelBoundary.lean#L17)

The signed comparison uses full native height collars $A,B,E$ of one
positive width $w$ on the rounded level, the refined outgoing level
and the next cut. Their targets are the respective full open height
bands. The product partial diffeomorphisms $P,Q$ satisfy
$$
 P(A(x,t))=B(d(x),t),\qquad Q(B(y,t))=E(\ell(y),t)
 \qquad (|t|<w),
$$
with the exact inverses for every such parameter. Here $\ell$ is the
level map of the same regular marked ambient comparison used for
the refined outgoing-to-next-cut band. The height coordinates are
$f(p)+t$, $c+t$ and $\mathrm{hi}+t$ respectively. The forward and inverse
zero-section values of $P$ agree pointwise with the original retained
body comparison. Equality with its inward restriction for $t<0$, or
with the independently calibrated radial germ in the rounded core,
requires a separate open-overlap comparison. A local tangential
shift $(x,t)\mapsto(x+tv,t)$ in Euclidean collar coordinates illustrates
why the zero-section and height equations alone leave the inward
germ free. [Retained outgoing level and transport](../../../../SmoothPoincare/Heights/RetainedOutgoingCollar.lean)

The targeted Lake build passed 10,125 jobs without warnings. The
source SHA-256 is
54100be471bf1e84823920cbe327ea40f68d67bc57aba2cb9d4d3a5c9c56c31b.
Importing queries checked the exact three public types and reported
only propext, Classical.choice and Quot.sound. An importing application
for every point of an arbitrary parametrized level mark verifies the
retained value at zero and the next-cut transport and inverse on the
closed strip $[-w/2,w/2]$. Its input SHA-256 is
abcb9299fd8369db8da6535c1552e1c54e85d5b0a91e7c0a5ff47038ca959ce6.

## A two-sided collar continuing the retained body map

Fix an actual full signed rounded height collar $A$ of width $w$.
Corestrict $A(x,-s)$ for $0\le s<w$ to the actual rounded sublevel,
then apply the retained $C.\mathrm{toUpper}$ and the actual upper
inclusion. This half-collar has injective zero section. Its derivative
is bijective at every point, including the boundary. Indeed, the
half-interval inclusion followed by time reversal has a bijective
derivative, as does $A$ on its open source. The rounded sublevel
inclusion also has a bijective derivative, so the derivative of the
corestriction is bijective by the chain rule. The retained body map
and the upper sublevel inclusion preserve this bijectivity.
[Smooth sublevel corestriction](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/RegularLevel/Sublevel.lean#L3818) ·
[Derivative of the sublevel inclusion](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/SublevelInclusion.lean#L236)

The pinned half-collar extension gives a smooth diffeomorphism from
the entire rounded level times a two-sided interval of radius
$0<b\le w$ to an open neighborhood of the entire outgoing level.
Write its ambient map as $B$. For every $x$ on the rounded level
and every $0\le s<b$,
$$
 B(x,s)=C.\mathrm{toUpper}(A(x,-s)),\qquad
 C.\mathrm{toUpper}^{-1}(B(x,s))=A(x,-s),
$$
with the actual sublevel inclusions understood. This is pointwise
agreement on the full inward half of the new collar. Its target
parameter comes from the retained comparison. An equality of this
parameter with the target $f$-height, or identification with the
independently normalized radial germ, requires additional comparison.
[Half-collar extension](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Manifold/HalfCollarExtension.lean#L23) ·
[Retained inward collar](../../../../SmoothPoincare/Heights/RetainedInwardCollar.lean)

The targeted Lake build passed 10,142 jobs without warnings. The
source SHA-256 is
2bb96e22f49c1904dddc50a7bd7756dec150e2019e78fd76b53e806e6c3376a7.
An importing application instantiates $A$ with the actual full
native rounded height collar based at the inverse image of the
outgoing axis point. It verifies both equations and the source
height $f(p)-s$ throughout the inward half. The exact public type and
axiom query reported only propext, Classical.choice and Quot.sound.
The importing input SHA-256 is
0fad18910ca6fcf1803cabb3ab2a68a596dde6a1f1bd82d74697c87852ecde3a.
