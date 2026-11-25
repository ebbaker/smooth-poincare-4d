# HT/IMM-R03 · Round area and the Gauss density

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Dispatched with `gpt-6.2-sol` at `ultra`.
Independent serving telemetry was unavailable. This review follows
the hypotheses in [the immersion manuscript](../../../../papers/master/manuscript/immersion_entry.tex)
and [the Route 08 register](../research-progress/REGISTER.md).

## Round measure and normalization

`gaussRoundMetric` is the induced unit round metric on the actual subtype
`Metric.sphere (0 : EuclideanSpace ℝ (Fin 5)) 1` with its stereographic
manifold structure. `gaussRoundArea_apply` and `gaussRoundArea_borel`
identify its Riemannian volume in the inherited sphere measurable structure
and the Borel structure used by parametric densities. The structures are
equal by `BorelSpace.measurable_eq`, and transport preserves values on sets,
including `univ`. For a sheet atlas, `GaussSheetAtlas.transportTargetMeasurableSpace`
performs the same transport through the atlas type while retaining its
partition, Jacobian, and sheet pushforwards.

`gaussRoundArea_eq_gaussConeArea` computes the round measure of a general
measurable set via the partial diffeomorphism $(u,t)\mapsto e^t u$ onto
punctured five-space. The pullback metric is $e^{2t}(g_{S^4}+dt^2)$.
The radial tangent vector $u$ has unit length and is perpendicular to the
included spherical tangent vectors. The Riemannian volume factor is
$e^{5t}$ in dimension five. Integrating over $t<0$ contributes $1/5$,
which cancels the factor $5$ in the definition of cone area. The unit ball
volume is $8\pi^2/15$ by the ambient Euclidean volume formula. It follows
that `gaussRoundArea_univ` gives $8\pi^2/3$, and ambient negation preserves
the same measure by `gaussRoundArea_antipodal`.

## One source parametrization and the sign

`gaussParamDensity_eq_mul_frameJacobian` uses the Euclidean four-space model
for its source manifold and parametrization. It applies the same
$A=dp$ in both Gram matrices. In the prescribed source orthonormal frame
those matrices have the form $A^\top A$ and $A^\top G A$, with $G$ the
round-target Gram matrix of $dn$ in the source frame. Both density formulas
carry $|\det A|$. The identity holds at a singular differential as well.
The chart-ratio continuity proof divides by the positive density of a
genuine source coordinate map.

`gaussFrameJacobian_eq_ambient` transports the sphere derivative through
the sphere inclusion and uses the same round metric as the measure theorem.
`ImmersionGaussNormal.frameJacobian_eq_abs_prod` yields the nonnegative
Jacobian $|\prod_i\kappa_i|$ using the actual signed principal data and
Weingarten formula. It accepts either choice of principal normal at each
point. The middle signature has two strictly negative and two strictly
positive curvatures, so the product is positive there and the absolute value
equals the signed determinant. The measurable extension in
`exists_measuredSheets_of_principal` is this absolute product on the locus
and zero on its complement.

## Dependencies of a global mean theorem

- `ImmersionGaussNormal.exists_regularSheets` uses the inverse-function
  theorem on an open set with invertible Gauss derivative throughout.
  It obtains countably many local inverse neighborhoods and a disjoint
  measurable source partition. The Gram density comparison applies once
  those sheets have been supplied. A specialization to the actual middle
  locus uses its openness and `mfderiv_isInvertible_of_principal`. The
  latter obtains invertibility from its positive Gram determinant and
  equality of source and target dimensions. Every curvature is nonzero
  at points of the specified middle signature.
- `indexedHeightTwoPoints_eq_gaussFibers` uses actual principal data at
  every source point and exact agreement of the indexing set with the
  middle-signature locus. It counts actual nondegenerate index-two
  critical points, including where the immersion has repeated image
  points. Two antipodal fibers are disjoint. Overlap among sheet images
  contributes multiplicity because the domain sheets are disjoint.
- `meanActualIndexTwo_eq_gaussMass` takes determinant integrability on the
  locus. The area formula then proves finite index-two fibers almost
  everywhere and the normalized mean with coefficient
  $2/(8\pi^2/3)$. The proof first treats multiplicity as extended counting
  measure and reduces to `ncard` on the conull finite set. Compact regular
  fibers provide a separate finiteness result for full fibers.
- Global Sard for the smooth normal supplies a conull set of directions
  with invertible normal differential on both full antipodal fibers. This
  is distinct from local invertibility at each point of the middle locus.
  Conversion from index-two counting to the topological floor uses actual
  Morse heights and the three- and four-dimensional handle argument.

`orientedMeanActualIndexTwo` supplies the measured atlas from those
pieces. It still takes an open middle locus and a pointwise principal frame
for the same immersion. The absolute principal product is continuous on
the whole source by the local chart ratio, including repeated eigenvalues
and zero curvature. Compact support on the compact source, together with
local finiteness of its Riemannian volume, supplies integrability. The
conditional strict energy theorem adds the order of the four signed
curvatures on the middle locus, integrability of its Weyl expression,
continuity of the excess there, and an almost-sure count floor. This
accounts for the hypotheses needed beyond the normalization and
multiplicity identities.
