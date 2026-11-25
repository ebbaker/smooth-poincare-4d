# Chiral evolution, Dirac methods, and surgery

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The exact serving model and reasoning effort
are unavailable. This comparison reviews the relevant analytical
statements and selected derivations of both companion manuscripts.
The proposed applications are candidates for a later research session.

| Manuscript inspected | Version and relevant passages |
| --- | --- |
| [Chiral curvature and metric evolution](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex) | Commit `541786549bf62dc70b55c9e9fd8072519755e413`, SHA-256 `8f7c71f36835f62acdd587960d8b61108908dd3fc1b50ab8b74a2549752796f6`. Curvature reconstruction and compatibility, temporal strain and positive endpoint continuation, metric compactness, the intrinsic Lorentz estimate, and the pointed twistor exclusion. |
| [Twistor spinors, Dirac concentration, and Yamabe spectral rigidity](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) | Commit `0a0abde6f5481fc564d8ca159769cb092e1996d2`, SHA-256 `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`. The derivative identity, puncture data and oscillation test, five-eigenvalue rigidity, the exact flat-neck comparison, Delaunay minimizers, and the integral Ricci criterion. |
| [Sections and connections](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) | The corrected 25 November working source listed in the [setup README](../../README.md), with the accompanying §15 application of a no-neck theorem. Sections 11–14 give the comparison hypotheses, critical-value gap and local neck estimates. |

## Where the chiral connection tools can help

The compatibility inverse for a normalized positive frame of
self-dual two-forms recovers the difference \(b=A-\Gamma^+\) from
\(d_A\Sigma\). For a supplied definite connection the real
direction-sphere comparison recovers a strain \(T\). The
curvature bound controls \(W^+\), trace-free Ricci and \(s-12K\) of
the reconstructed metric by
\[
 K|Q-I|+6|\nabla^A T|+(42+8\sqrt3)|T|^2,
\]
with \(K>0\) the round-curvature normalization. This is a way to turn
connection bounds into enough metric control to compare a collar or a
capped piece. It requires the positive round-compatible curvature
plane and control of the strain derivative. The static transport
criterion recognizes a supplied homotopy sphere when that expression
is at most \(K\) everywhere. The continuation theorem extends a
supplied definite trajectory with a positive continuous compatible
limit on its fixed smooth bundle. Bounded Ricci, bounded \(W^+\), a lower
volume bound and an upper diameter bound also supply fixed-base metric
compactness on a homotopy sphere. The fixed-round-basin estimate
\(\int_0^\infty\sup(|\nabla^AT|+|T|^2)\,dt
\lesssim\|T_{\rm in}\|_{L^{4,1}}\) illustrates the type of endpoint
product estimates worth testing. Its hypotheses include small initial
connection and curvature values on the closed round background.
[Chiral manuscript, propositions on compatibility and transport, theorems on positive endpoints and metric compactness, §13 and the static transport criterion](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

For the unit product cylinder \(dt^2+g_{S^3}\), the Levi–Civita
connection comes from the three-dimensional factor. In an adapted
frame its positive chiral curvature two-forms are purely tangential,
so \(F_i\wedge F_j=0\). In the curvature block formula the same
degeneration is \(C^2-DD^\top=0\), with
\(C=W^++sI/12=I/2\) and \(D\) the off-diagonal Ricci block.
On the flat cone the Levi–Civita curvature itself is zero. Thus the
usual definite reconstruction is singular on both natural neck
representatives. A conformal gauge or a different connection could
change this test. It would have to give uniform metric control
over the region used for surgery. An independent \((\Sigma,A)\)
formulation lets the metric exist where the chiral curvature forms
fail to span a positive plane, and makes the compatibility defect a
quantity to estimate on a supplied collar. The construction of
that collar and of compatible capped data remains open.
[Chiral manuscript, §§4–5](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex) · [Sections and connections, §3](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

Two restrictions guide a prospective flow argument. The relation to
normalized Ricci flow is a transverse traceless linearization at the
round connection. The nonlinear pullback metric energy and the
Weyl functional have different gradients. The prescribed eigenvalue
ratio caps also fail to be invariant under the tested short-time
original connection flow. The round stability and compactness results
are therefore applicable to supplied definite pieces with their own
bounds. The pointed twistor exclusion can eliminate a supplied
nonflat Ricci-flat ASD ALE limit under pointed \(C^1\) embeddings
and strict metric twistor taming. A general scalar-flat Bach-flat
bubble need not be Ricci-flat or ASD, and deriving taming from the
neck hypotheses would be a separate premise.
[Chiral manuscript, Ricci comparison, energy discrepancy, spectral-ratio tests and pointed twistor exclusion](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

## Where the Dirac and Yamabe tools can help

For \(T=P_g\psi\), the projected derivative of the twistor defect
satisfies
\[
 |\Pi(d^\nabla T)^+|^2
   =\tfrac12 |W^+|_{\mathrm{HS}}^2|\psi|^2 .
\]
A normalized spinor with controlled zeros and an estimate of the
projected derivative could therefore serve as a chiral curvature test
on a supplied collar. Small first-order twistor error alone gives
no such bound, as the oscillatory family of actual Green fields
shows. The Dirac Green construction supplies a fixed nonzero
Euclidean end value on a punctured homotopy sphere after choosing a
flat germ and an invertible compact Dirac operator. Interior zeros
and a uniform relative derivative estimate remain separate problems.
On an exact unit round product collar, the Dirac operator in the
product spin identification has form \(c(dt)(\partial_t+D_{S^3})\),
up to the convention for the induced tangential operator. Bär's
spectrum has gap \(3/2\) in absolute value. This is a model for
exponential decay of the modes directed into the collar from either
end and for testing a boundary matching estimate. Extending that control
to the perturbed collar would still leave the metric and Weyl
estimates to prove.
[Dirac manuscript, §§2.3 and 4](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [Bär, Theorem 1, unit round sphere](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf)

The Yamabe results supply both a test and an obstruction. For a
volume-one Yamabe minimizer, exact equality
\(\frac35\sum_{j=1}^5\lambda_j=s\) recognizes the round sphere. A
controlled family of capped metrics could use this endpoint if
minimization and the five modes pass to a nondegenerate limit. The
metric hypotheses are essential. In the exact conformal gluing of
§10.1, inserting a round region at a flat ball by inversion returns
the original conformal class and its Yamabe minimizers. Changing the
class in a shrinking ball of a fixed core has only a vanishing effect
on the upper bound for its Yamabe constant. On \(S^1\times S^3\) the
Delaunay minimizers have Weyl and Bach curvature zero and approach
both relative five-eigenvalue equality and the round Yamabe value
as the circle lengthens. They show
how those observables can miss a region of vanishing volume on that
topology. The example is outside the homotopy-sphere class.
[Dirac manuscript, §§7, 9, 10.1 and 10.2](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [Schoen source record R99](../../../../../../../references/SOURCE_NOTES_DIRAC_B23_20261124.md)

A direct post-cap test on a smooth homotopy four-sphere is the
Dirac manuscript's integral Ricci criterion. In volume-one
constant positive scalar curvature gauge it is
\[
 \int |\operatorname{Ric}_0|^2\,dV<s^2/12-16\pi^2 .
\]
In this topology it is the same Chang–Gursky–Yang threshold
\(Y>0,\ E_+<4\pi^2\), expressed through Gauss–Bonnet. It makes
clear why an apparently round cap does not suffice. The inequality
concerns the whole closed piece and requires \(s>8\sqrt3\,\pi\).
[Dirac manuscript, §10.3](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [Chang–Gursky–Yang, Theorem A and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf)

## What transfers from surgery

Perelman's argument in dimension three obtains canonical
neighborhoods and suitable rescaled necks, cuts a neck at its
central \(S^2\), attaches a controlled cap, and restarts while
preserving the estimates needed at later singularities. The
topological accounting and the extinction result are further
steps. In dimension four Chen–Zhu give a Ricci-flow surgery theorem
for compact metrics of positive isotropic curvature and with no
essential incompressible space form. These are geometric hypotheses
on their input. A positive Yamabe sign and a bound on \(\int|B|\)
alone supply neither the curvature pinching nor the canonical
neighborhoods used in that theorem.
[Perelman, arXiv:math/0303109v1, §§1.5, 2, 4.4–4.5 and 5](https://arxiv.org/pdf/math/0303109) · [Finite extinction, arXiv:math/0307245v1, Theorem 1.1](https://arxiv.org/pdf/math/0307245) · [Chen–Zhu, arXiv:math/0504478v3, Theorem 1.1 and §5](https://arxiv.org/pdf/math/0504478)

For the present problem, a first surgery test could require a
single embedded spherical collar with rescaled \(C^4\) control.
A fixed interpolation to a smooth conformally flat cap is then a
candidate for \(O(\eta^2)\) added Weyl energy and \(O(\eta)\) Bach
cost when the collar error is \(\eta\) in that norm. The reference
cap and cutoff geometry must be fixed in rescaled coordinates
for the jet estimates. Shrinking the physical radius alone gives
no saving for either integral. A \(C^2\) comparison would suffice
for the local Weyl cost, while a Bach cost estimate needs fourth
derivatives or additional structure. The splice at a fixed smooth point
in §13.2 is a useful model with stronger input. A local cap test
would also check positivity of the post-cut Yamabe class, agreement
on the retained region, and the total error allowed by the
strict upper energy margin. The ability to find one such collar
would be weaker than a single gauge on the full long neck and
could be enough for one controlled replacement.
[Sections and connections, §§6, 13.2 and 14](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

An embedded two-sided \(S^3\) in a smooth homotopy sphere separates.
Cutting and filling both boundaries by smooth four-balls gives
two smooth homotopy four-spheres, by van Kampen and Mayer–Vietoris.
Reversing the cut expresses \(M\) as the connected sum of the
capped pieces. The smooth gluing uses extension of a boundary
diffeomorphism of \(S^3\) over the ball, from the component statement
of the Smale conjecture. An \(S^3/\Gamma\) link with nontrivial
\(\Gamma\) requires a different filling and accounting. A Weyl-flat
neck can have such a link. For connection surgery the bundle
extensions matter as well. For example
\(p_1(\Lambda^+)[M]=2\chi(M)+3\tau(M)=4\) on each closed homotopy
sphere, so the sum of the two capped characteristic numbers is
eight. Curvature-volume conservation on the original closed bundle
does not give an additive budget across this cut.
[Sections and connections, §12.4](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Hatcher, Ann. Math. 117 (1983), opening statement and component consequence](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf) · [Chiral manuscript, static transport criterion](../../../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

If the total post-cap \(E_+\) stays below \(8\pi^2\) and both capped
classes have \(Y>0\), at most one piece can require further
recognition by the \(4\pi^2\) criterion. This gives a possible
induction once there is a rule to finish or improve the remaining
piece. A complete surgery argument would need a restart theorem,
control of the accumulated cap costs and a termination or convergence
mechanism, together with a record of every gluing. The codimension
at least three scalar-curvature and Yamabe surgery results in the
Dirac outlook concern, in particular, replacing \(S^1\times D^3\)
by \(D^2\times S^2\) in dimension four. The Yamabe theorem gives
\(\sigma(N)\ge\min\{\sigma(M),\Lambda_{4,1}\}\) for this surgery,
with an explicit certified bound of \(38.9\) for \(\Lambda_{4,1}\).
Even with \(\sigma(M)\) at the round value, that certified level
lies below \(8\sqrt3\,\pi\). A spherical cut and cap is a
codimension-one replacement and requires its own Yamabe estimate.
[Dirac manuscript, §11](../../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [Ammann–Dahl–Humbert, arXiv:1204.1197, Theorem 1.2 and Example 4.7](https://arxiv.org/pdf/1204.1197) · [Existing source records R103 and R105](../../../../../../../references/SOURCE_NOTES_DIRAC_B23_20261124.md)

## Candidate approaches

| Approach | First bounded test | What a successful test would supply |
| --- | --- | --- |
| Annular Bach estimate | Prove a length-independent estimate for linearized Weyl curvature on a round annulus from end data and divergence-free forcing. | A test of the expected end decay, followed by a separate test of the highest-order nonlinear terms against the density conservation law. This is the most direct route toward an energy identity. |
| Intrinsic neck control | On a supplied rescaled collar, test a transverse field in a controlled metric gauge and estimate its trace-free Lie derivative and first derivative. Compare this with a compatible independent \((\Sigma,A)\) gauge. | A criterion usable on spherical quotients and a possible way to select a spherical cut when the link is known. |
| One controlled metric surgery | Fix one embedded spherical collar, a fixed smooth cap and the exact data preserved on the retained side. Check both scale-invariant energy costs and the Yamabe sign on the capped pieces. | A single replacement usable in a compactness or flow argument. In the round product model, the known conformally flat cap and the Dirac spectrum give separate tests of metric and spinor data. |
| Chiral-flow restart and recognition | On the capped piece, test whether an actual positive compatible connection pair and the static transport bounds are available. Track the bundle extension and curvature volume. | A restart or round-limit theorem under existing chiral hypotheses on the capped piece. The exact product degeneracy identifies a concrete obstacle for the Levi–Civita choice. |
| Dirac or Yamabe certification | Check the projected spinor derivative with lower norm control, or test the full integral Ricci budget after minimization on a capped piece. | A way to certify the whole piece. The exact flat-gluing and Delaunay examples test any proposal based only on the presence of a round region or near equality of five eigenvalues. |

The direct energy route needs control across the entire neck.
The surgery route could begin with one controlled cross-section,
provided it separately proves what can be discarded, how evolution
or minimization restarts, and how the original \(M\) is recovered.
These are complementary tests under SEC-B36. The
[parent register](../../../research-progress/REGISTER.md) owns the
choice of a first bounded request.
