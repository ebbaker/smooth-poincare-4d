# Edition 03 independent review of the selected reference and spatial Euler flux

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent execution readback. The actual serving model
identifier and reasoning effort are unavailable. The science intake is
`a7bb158d6af806d2573a7702386622ed4c0bb1f1`. The candidate declarations and
their exact instantiations are in the accompanying Lean replay.
[Route 06](../../06_physical_scales_and_marked_annuli/research-progress/REGISTER.md) ·
[Route 07](../research-progress/REGISTER.md) ·
[Prior assessment](../../reviews/NATIVE_FEET_AND_PHYSICAL_JETS_20261125.md) ·
[Lean replay](ED03_REFERENCE_AND_FLUX_READBACK.lean)

## Physical comparison and finite signs

The latest tracked master, descent companion and physical neck sources at
intake are the E69–E72 versions written at `4b15d52a9301ca6796002774b712fc51a82c09c9`.
The physical-neck result obtains a proper flat limit and whole smaller-strip
coverage *given* a full, uniformly buffered band at an intermediate scale
on the original Yamabe representatives. It needs bounded rescaled volume,
a uniform pointwise curvature bound and vanishing full-curvature integral
on the same band. The radial defect and placement hypotheses then identify
the marked separation. The current critical-radius data alone do not
provide those joint inputs. Exact overlap comparison disks come from the
exact closed or smooth compactified ALE limit. The manuscript supplies no
identification with the selected balanced disk. The modified Ricci charge
uses positive-time markings in the different modified gauge.
[Physical window](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/physical_window.tex) ·
[Exact alternatives](../../../../papers/master/01_fixed_type_variational_descent/manuscript/exact_alternatives.tex) ·
[Scientific assessment](../../../../papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md)

The chosen width stays \(w=(n+1)^{-1}\). The global Euclidean reference on a
neighborhood of the buffered disk follows by positive convex extension of
the pulled reference. The physical path agrees with the marked affine
model throughout this neighborhood. The exterior metric germ equality concerns
the complement of the closed disk union the full trim. At the original
unit seam the step is exactly \(1/2\), so the terminal metric there is the
half-mix in every Gram entry. On \(\|x\|^2<1-w\) the terminal metric
is Euclidean. This open inner plateau is nonempty for \(n\ge1\), and a
strictly enclosed marked sphere has a flat neighborhood. The plateau can
include the original protected core. Its preservation as a marked subset
does not imply agreement of the metric there. Moving the actual cut to
an inner sphere changes the marked exterior and requires charging the
full intervening strip. Positivity of this pointwise convex path means
positive definiteness. Its positive Yamabe sign requires its energy ceiling
or a separate sign argument.
[Selected reference](../../../SmoothPoincare/Variational/SelectedDiskReference.lean) ·
[Finite collar analysis](../../../../papers/master/01_fixed_type_variational_descent/manuscript/disk_collar_comparison.tex)

The reference first jets vanish exactly. For the actual incoming Gram
entry \(G\), the Hessian bound still contains \(\|B-G\|_2/w^2\)
and \(\|DG\|_2/w\). The quadratic terms and changing inverse Gram,
oriented Weyl projections and volume density still have to be estimated.
On a fixed smooth buffered marking the pulled incoming volume of the
trim is \(O_i(w)\). As a per-source sufficient comparison, consider a
reference agreeing with the incoming full first jet on the seam. Smooth
Taylor expansion then gives \(B-G=O_i(w^2)\) and \(D(B-G)=O_i(w)\) on
the trim. The corresponding Hessian cutoff prices are \(O_i(w^{1/2})\)
and the first-jet price in \(L^4\) is \(O_i(w^{5/4})\). Agreement of
values alone only gives an \(O_i(w^{-1/2})\) estimate for the Hessian
prices. This first-jet criterion does not establish that an incoming
germ can be matched with a Euclidean or round reference. The cutoff
derivatives and the metric change have different supports.
[Selected physical jets](../../../SmoothPoincare/Variational/SelectedPhysicalJetControl.lean) ·
[Quadratic estimates](../../../SmoothPoincare/Variational/SelectedQuadraticJets.lean)

For a flat inner set \(A\), measurable disjoint transition set \(C\),
and both signed aggregate equalities on \((A\cup C)^c\), the exact
global saving is
\[
 S_s=\lambda_g^s(A)-\bigl(\lambda_h^s(C)-\lambda_g^s(C)\bigr)
     = E_+(g)-E_+(h).
\]
At a positive same-type endpoint this is at most \(e-I\) in either
sign. This comparison keeps the increased transition charge and uses
zero terminal charge on \(A\). These and the full complement agreement
are explicit hypotheses of the signed theorem. The larger marked disk
has a distinct exterior-cap test. With dyadic ratio \(q=2^{-k}\), division
error \(\tau_d\), and positive same-type matched cap allowance \(\delta_d\),
a joined endpoint below \(2T\) forces
\[
 S_s^{\rm disk}>(1-q)e+q\lambda_g^s(Q)+I-2T-\tau_d-\delta_d.
\]
The protected-core term and the two losses are essential. For a positive
joined endpoint the exact complete exterior must absorb at least
\(S_s^{\rm disk}-(e-I)\). The flattening construction does not supply
the path ceiling, matching at the original seam, or a strict joined
saving with all costs paid on the selected widths. The latest local
clamped variation remains subject to the bound \(e-I\).
[Finite cap test](../../../SmoothPoincare/Variational/BalancedMarkedExterior.lean) ·
[Master disk calculation](../../../../papers/master/manuscript/balanced_disk.tex) ·
[Core variation](../../../../papers/master/01_fixed_type_variational_descent/manuscript/core_variation.tex)

For the selected radius \(1-w\), the disjoint regions are the closed
inner disk \(B\setminus W\), the whole open trim \(W\), and the
remaining region \(R_0=(B\cup W)^c\). Since the inner disk is flat
at the endpoint \(h\), the combined cost
\(\lambda_h^s(W)+\lambda_h^s(R_0)-\lambda_g^s(R_0)\)
equals \(E_+(h)-\lambda_g^s(R_0)\). Positivity gives \(E_+(h)\ge I\).
The containment of \(R_0\) in the closed exterior of \(B\) and the
dyadic division put \(\lambda_g^s(R_0)\le q(e-\lambda_g^s(Q))+\tau_d\).
The resulting lower bound is
\[
 I-q(e-\lambda_g^s(Q))-\tau_d .
\]
The actual cost is strictly larger when the division tolerance is
strict, as in the Lean hypothesis. The protected charge enters with
positive coefficient \(q\). If
\(e_i\to I\) and \(\tau_{d,i}\to0\) at one fixed depth, then the lower
limit is at least \((1-q)I\) in both signs. Given the actual equality
of exterior chiral charges on \(R_0\), the exterior increase cancels.
At positive depth with \(I>0\), every late positive endpoint flat on
the inner region and obeying this exterior equality has strictly
positive charge on the trim in the tested sign. Thus a thin raw trim
and a shifted Euclidean cap germ leave an actual transition cost to
check.
[Combined cost](../../../SmoothPoincare/Variational/SelectedReferenceCost.lean)

The new reference receipt gives a positive matched example on the
standard sphere. A small nonzero Weyl perturbation in \(Q\) supplies
its signed saving and leaves the original trim flat. A disjoint
conformal perturbation on the inner disk away from \(Q\) tunes the
full curvature division by continuity, while its chiral and spectral
densities vanish all along the affine path. The actual Euclidean cap
then reconstructs the original conformally round metric. The exterior
has positive full curvature and zero chiral charge. This example
therefore lies at \(I^+(S^4)=0\) with a matched original collar. In
the other test the constant anisotropic incoming collar is flat. The
one-dimensional fiber of the interpolated metric has radius \(a\)
over a Euclidean three-dimensional base. Its only possibly nonzero
curvature operator block is \(-D_{\mathrm{base}}^2a/a\). Projection
removes the trace of that block and multiplies by \(1/2\) in each
chirality. On a fixed angular sector and a subinterval where
\(\phi''>0\), its trace-free base Hessian is bounded below by a
positive multiple of \(\alpha w^{-2}\). The generating region has
volume bounded below by a multiple of \(w\). Thus the actual chiral
cost grows at least as \(\alpha^2 w^{-3}\) for either sign although
the raw trim charges vanish. This tests the fixed Euclidean reference
in the prescribed coordinates. No analogous positive matched saving
is supplied on a hypothetical nonstandard minimizing sequence.
[Construction and curvature tests](../research-progress/handoffs/ED03_DISK_REFERENCE.md)

A native constant reference retains the original unit seam when the
incoming Gram is constant on an open neighborhood of the full closed
trim. It matches the positive Gram encoded by \(L^*L\) in the original
chart. The entire trim is flat at every time and the full closed
exterior of the original disk, including its seam, is fixed as a
metric germ. The terminal metric is flat near the entire closed disk.
This includes constant anisotropic incoming data by choosing the same
constant Gram as reference. The matching premise does not follow from
vanishing incoming curvature in an arbitrary marking. Interior energy
along the path and positivity of the cap remain separate tests. The
chiral restriction theorem handles supplied independent frames when
the lifted orthogonal frame change preserves the self-dual projector
and conjugates the actual curvature matrices.
[Constant native reference](../../../SmoothPoincare/Variational/MatchedFlatDisk.lean) ·
[Exterior charge and frames](../../../SmoothPoincare/Variational/ExteriorGermCharge.lean)

## Euler coefficient, spatial sign and time control

Use the ordered four-slot tensor norm, the Hilbert–Schmidt norms of the
two real chiral Weyl blocks, and \(Z=\operatorname{Ric}-Rg/4\). In an
oriented orthonormal frame the manuscript's Euler density is
\[
 \mathcal E=\tfrac14(|\mathrm{Rm}|^2-4|\operatorname{Ric}|^2+R^2)\,dV
   = (|W^+|^2+|W^-|^2+R^2/24-|Z|^2/2)\,dV.
\]
It is twice the Pfaffian of the curvature two-forms and integrates to
\(8\pi^2\chi(M)\). For unit sectional curvature the ordinary Pfaffian
coefficient is \(3\), the full ordered curvature norm square is \(24\),
the Ricci square is \(36\), and the scalar is \(12\). Consequently the
manuscript coefficient is \(6\). This checks the factor of two separately
from the choice of curvature endomorphism sign. For a polarized invariant
polynomial \(P\) with \(P(\Omega,\Omega)=\mathcal E\), the actual spatial
primitive is \(2P(\dot\omega,\Omega)\). Differentiation gives
\(\dot\Omega=D\dot\omega\), and covariant Bianchi yields
\(\partial_t\mathcal E=d(2P(\dot\omega,\Omega))\).
[Chern–Simons, §3, (3.3)–(3.4)](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf) ·
[Charged-flow proof](../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex)

For the fixed tangent bundle identification with
\(\dot J=\operatorname{Ric}^{\sharp}J\), the differentiated Koszul formula
and frame correction give
\[
 \langle \dot\omega(v)w,z\rangle
 = (\nabla_z\operatorname{Ric})(v,w)-(\nabla_w\operatorname{Ric})(v,z).
\]
This is skew in the endomorphism pair. Define the spatial current \(X\)
by \(\iota_XdV=2P(\dot\omega,\Omega)\). For a common stationary test
\(\chi\), the derivative of the Euler moment is
\(\int\chi\operatorname{div}X\,dV=-\int d\chi(X)\,dV\). Thus its
absolute value is bounded by
\(C\|d\chi\|_\infty\|\mathrm{Rm}\|_2\|\nabla\operatorname{Ric}\|_2\)
using the metric and volume on the same slice. The finite time estimate
uses a fixed terminal cutoff, the pointwise gradient weight
\((\tau/s)^b\), a uniform curvature \(L^2\) norm and time \(L^2\)
bound on the remaining factor. At \(b=1/4\) the squared weight integrates
to \(2\tau\). The initial normalization gives
\[
\int\chi\mathcal E_0=2(m_++m_-)+m_S/12-m_F/4,
\]
so the terminal full-region Ricci-square lower bound subtracts the
initial Weyl and scalar terms with coefficients \(4,1/6\) and loses
twice the transport error. The initial test is one on the charged set.
The terminal test is the same function and vanishes off the full tested
terminal region. Neither slice's volume is replaced by the other.
[Independent science derivation](../../../../papers/master/01_fixed_type_variational_descent/reviews/E71_EULER_TRANSPORT.md) ·
[Lee–Lee, Theorem 1.1 and Lemma 3.2](https://arxiv.org/html/2510.12673v2) ·
[Terminal charge](../../../SmoothPoincare/Variational/ModifiedFrameDecomposition.lean)

The Lean slice estimate performs actual Riemannian integration by parts
for a smooth test and furnished smooth current. The finite-time wrapper
uses the supplied moment-derivative identification with the spatial
divergence, supplied pointwise bounds and slice-wise integrability. The
frame jets establish normalization and the local Bianchi transgression
with fixed base vectors during time differentiation. The primitive's
norm is bounded by \(144\,|\mathrm{Rm}|\,|\nabla\operatorname{Ric}|\)
in ordered component norms. The Ricci-flow lemma derives the intrinsic
skew connection-variation expression. An application on the manuscript
sequence still needs the global current constructed from the actual
fixed-bundle Pfaffian and its identification in the tested derivative.
The pointwise skew-jet derivative follows for an actual supplied Ricci
flow, with its two base vectors kept fixed and two given bundle paths
solving the Ricci gauge equation at the regular time. Pair exchange
identifies its value with the frame curvature on the same slice.
Combining the derivative with the actual spatial Bianchi identity
gives the local normalized Pfaffian derivative at that time.
The manuscript's Lipschitz distance cutoff needs a smooth approximation
in the same buffers for an application of the smooth-test Lean theorem.
[Spatial flux](../../../SmoothPoincare/Variational/SpatialEulerFlux.lean) ·
[Curvature derivative](../../../SmoothPoincare/Variational/SpatialEulerVariation.lean)

## Replay

The pinned toolchain is Lean `4.35.0-rc3` at
`470d5ce1400764999581fd26d5d72b00d990b0f4`. The Lake manifest SHA-256 is
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.
The replay through the sole `import SmoothPoincare` passed 45 exact type
and axiom pairs, nine anonymous applications and the seam midpoint
helper with zero errors or warnings. It used `lake env lean` after
the public 10,564-job Lake build. The reported axiom union is
`propext`, `Classical.choice` and `Quot.sound`. The public and direct
six-leaf logs are byte-identical, with SHA-256
`50ecf0ffac200ba964a980b19059bd88a66e1432bb290419c1198f0ad6db02e8`.
The applications test the original seam's half-mix, the shifted flat
inner disk, a matched trim at half time and its complete retained
exterior, actual positive saving in both signs, finite and eventual
combined costs at depth one, and the normalization and time-weight
constants.

| Input | SHA-256 prefix |
| --- | --- |
| SelectedDiskReference | `7f20fb9247000014` |
| SelectedReferenceCost | `8b78bbc82e62df33` |
| ExteriorGermCharge | `4f740caae26377ba` |
| MatchedFlatDisk | `b9cfe8236b96aa37` |
| SpatialEulerFlux | `fbc6342cb7b2b71b` |
| SpatialEulerVariation | `9cc7bd6b8a43d7d5` |
| Public root | `bfded74abbafb74d` |
| Independent replay | `217bf131c1691b2a` |
