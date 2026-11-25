# Independent check of the removable-base metric limit

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Serving model and reasoning effort unavailable
for independent attestation. Working checkout
`cf03e8f09359cac317499f6928edb09e4f80c280`.
Scope is the supplied physical removable-base alternative and the
conditional local curvature measure statements below.
[Physical base](../notes/E08_PHYSICAL_BASE_ALTERNATIVE_20261125.md)
· [Source ball lower bound](../../01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md#an-intrinsic-volume-bound-before-extracting-a-chart)

## Intrinsic estimates and comparison maps

Let \(g_i\) be the smooth volume-one positive Yamabe source metrics
in the fixed SEC band with \(\delta>0\). Use the uniform physical
ball lower bound \(\operatorname{Vol}_{g_i} B(x,r)\ge cr^4\) for
\(r\le r_0\). Let \((N,h)\) and \(P=\{p_1,\dots,p_k\}\) be the
smooth closed physical base and its finitely many removable points.
Assume simultaneous orientation-preserving embeddings \(\Phi_{i,b}\)
of neighborhoods of the whole compact truncation
\(K_b=N\setminus\bigcup_j B_h(p_j,b)\), with smooth physical convergence
at fixed \(b\). The balls are pairwise disjoint normal-coordinate
balls. The physical base has volume one by E08. The empty-omission
case gives smooth convergence on the entire closed source through a
surjective same-dimensional embedding, so assume \(k\ge1\).

The connected image of \(K_b\) and its complement have \(k\) common
sphere faces. As in NECK-E09 the \(H_0\) Mayer–Vietoris sequence,
using \(H_1(M)=0\), gives precisely one complementary component
\(P_{ij}(b)\) incident to each face. Every component meets a face
by connectedness, and the rank of \(H_0\) shows the number of
components equals the number of faces. This step uses the full
simultaneous embedding. At fixed \(b\),
\[
 \lim_i\sum_j\operatorname{Vol}_{g_i}P_{ij}(b)
     =\operatorname{Vol}_h(N\setminus K_b)=O(b^4).
\]
For \(x\in P_{ij}(b)\), put
\(d=d_{g_i}(x,\partial P_{ij}(b))\) in the ambient metric.
The open source ball \(B(x,\min(d,r_0))\) lies in that component
for \(d>0\). Hence small physical volume forces
\(d\le c^{-1/4}\operatorname{Vol}_{g_i}(P_{ij}(b))^{1/4}\)
once the volume is \(<cr_0^4\). A nearest-boundary minimizing
geodesic reaches the boundary from within \(P_{ij}(b)\); otherwise
it reaches that boundary for the first time at a shorter distance.
The induced intrinsic metric on the face is \(C^0\)-close to that
of the normal \(h\)-sphere for large \(i\) at fixed \(b\), so its
intrinsic diameter is at most \(Cb\) with a uniform constant.
Joining two points through nearest boundary points and the face gives
\[
 \limsup_i\max_j \operatorname{diam}_{\rm intr} P_{ij}(b)\le C' b .
 \tag{1}
\]
Here the intrinsic length metric includes curves on the boundary.

Distances between points of the embedded core can be shortened by
paths entering the complementary pieces. For each piece delete the
portion of a source minimizing path from its first entry into the
piece's interior to its last exit and replace it by a face path.
The endpoints of the deleted subpath lie on the same face.
Each operation costs at most that face's intrinsic diameter plus
an arbitrarily small error. Such a replacement creates no visits
to other complementary interiors, since distinct faces are
disjoint. Thus one operation per piece suffices, including when the
original path has infinitely many crossings. This bounds the
difference between the intrinsic core distance and the ambient
distance by the sum of the face diameters. Apply the same argument
to \(K_b\) in \(N\) with its deleted normal balls. The intrinsic
core distances in the two metrics differ by a factor tending to
one at fixed \(b\), by smooth comparison. They have uniformly
bounded diameter, using the ambient \(h\) diameter and the same
face estimate. The distortion of \(\Phi_{i,b}^{-1}\) on the core
is therefore \(O(b)+o_i(1;b)\).
[NECK-E09, complement incidence](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md#simultaneous-cuts-and-complement-topology)

Define \(F_{i,b}:M\to N\) by the inverse comparison on the closed
core and by mapping each complementary **interior** to its label
\(p_j\). This map is Borel, as required for the measure comparison.
Continuity at the moving seam is unnecessary for a GH approximation.
By (1), a point in a complementary interior can be moved to its
nearest face at cost \(O(b)\) for large \(i\), and its image to the
corresponding point of the normal sphere at cost \(b\).
The triangle inequality then bounds the full distortion by
\(Cb+o_i(1;b)\). The image is \(O(b)\)-dense in \(N\).

Choose a slow diagonal by fixing \(b_m\downarrow0\) and then the source
thresholds at which the \(C^2\) comparison errors on \(K_{b_m}\),
the face and volume bounds, and the curvature boundary errors
below are as small as prescribed. A volume tolerance \(O(b_m^4)\)
keeps the \(O(b_m)\) rate in (1) along the diagonal. Entrywise use the resulting
\(b_i=b_{m(i)}\) and \(F_i=F_{i,b_i}\). The volume on exterior
interiors tends to zero, while on the core the pushed-forward
measure converges to \(dV_h\) by the physical metric comparison.
Thus \(F_i\) realize measured GH convergence to \((N,d_h,dV_h)\).
This argument chooses a single comparison map at each source index.
It requires no compatibility between embeddings at distinct fixed
radii for this claim. It does not assert a canonical attachment
label across all possible choices of comparison.

## Individual curvature atoms

Use the same slow diagonal with uniform \(C^2\)-close pullbacks on
the whole core. The pushforward of each core curvature density
converges weakly to its smooth \(h\) density on \(N\).
Indeed the comparison gives small density differences on the
retained subset relative to the smooth fixed \(h\) measure, and
the omitted \(h\) balls have vanishing volume and bounded curvature.
Since the source curvature measures have uniformly bounded
total mass in the SEC band, pass to a further subsequence on
which their masses on each of the finitely many complementary
pieces converge. The map \(F_i\) sends each interior measure to
the associated point mass. Boundaries are smooth of codimension
one and carry zero mass for all smooth source densities.

To check the coefficients separately, take at each face the
oriented Cartesian half-spin frames from an \(h\)-normal chart
and the symmetric frame identification for the pulled-back
physical source metric. On the scale \(b\) the fixed \(h\) chart
is Euclidean up to \(O(b^2)\) in \(C^2\), and smooth convergence at
fixed \(b\) adds \(o_i(1;b)\). The scale-invariant tangential
connection and curvature norms in MATCH-E12 therefore give
vanishing Chern–Simons on each individual face in the chosen
diagonal. Apply the relative formula with that face oriented
as the boundary of \(P_{ij}(b)\), opposite to its core
orientation. The upper chiral signed mass is
\(E_i+Y_i^2\operatorname{Vol}(P_{ij}(b))/48\), and the lower
bound is \(-D_i/4\ge-E_i\), where \(D_i\) is the full source
trace-free Ricci square integral. The fixed gap \(\delta\) to
\(8\pi^2\), small volume and small single-face Chern–Simons show
the relative integer is zero for all sufficiently large \(i\).
Thus the signed masses on each piece tend to zero individually.
[EXTRACT-E06 physical-frame estimates](../notes/E06_PHYSICAL_END_FRAMES_20261125.md)
· [MATCH-E12 curvature and volume margins](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md#consequence-in-the-physical-yamabe-band)

The two chiral masses on piece \(j\) then have a common limit
\(e_j\ge0\), its scalar-square contribution vanishes, and its
trace-free Ricci-square mass tends to \(4e_j\).
In the four-index convention
\[
 |\mathrm{Rm}|^2=4(|W^+|^2+|W^-|^2)+2|\operatorname{Ric}_0|^2+R^2/6,
\]
so its Riemann-square mass tends to \(16e_j\).
In particular the pushed-forward weak limits are the respective
smooth densities of \(h\) plus atoms \(e_j,e_j,4e_j,16e_j\)
at \(p_j\). The scalar-square measure has its smooth limit only.
The sum of the chiral weights is the physical deficit
\(e-E_+(h)\). An identity for just the whole residual would
give equality of total chiral defects, so the single-face
frames matter for the separate coefficients.
[SEC physical curvature convention](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3895)

In the round-base fixed-type minimizing case of NECK-E19,
the cap argument can be imposed on the same slow diagonal by
including the required \(C^4\) and IMS buffer tolerances alongside
the metric and face requirements. With that packet's hypotheses,
including the positive-band
minimizing sequence on the nonstandard candidate type,
all residual mass belongs to one surviving exterior piece.
The finite labels permit a subsequence with one stable label;
then the round metric limit has a single concentration point
with nonzero masses \(e,e,4e,16e\).
The metric argument alone supplies no single-label assertion.
[NECK-E19, one survivor](../../01_neck_geometry/notes/E19_ROUND_BASE_SINGLE_PUNCTURE_20261125.md#one-survivor-and-concentration-at-one-physical-puncture)
