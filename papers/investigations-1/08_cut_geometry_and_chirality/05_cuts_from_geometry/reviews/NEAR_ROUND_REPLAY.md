# Independent replay of the near-round width and sweepout arguments

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. The bounded read was routed as GPT-6.2 Sol/ultra. Actual serving
model and effort were unavailable. Reviewed the
[E12 return](../research-progress/handoffs/E12_ROUND.md)
(first read SHA-256 0105c85bea265e8843c197e64760f52627357bbddb969fb5fea1133f4fdfff9b)
and [E13 alignment](../notes/ALIGNED_FIRST_WIDTH_20261127.md)
(first read SHA-256 7e473c6c76cfc360b14761c7812ed326047afe008f949f6cdb9a58feb6e179ef),
including the smooth round-index argument, under the frozen
[E12](../research-progress/handoffs/ISSUE_NEAR_ROUND_20261127.md) and
[E13](../research-progress/handoffs/ISSUE_ALIGNMENT_20261127.md) requests at
base bc2c1bb. Throughout, \(\gamma\) is the unit round Riemannian metric on an
identified standard smooth \(S^4\), the hypersurface dimension is three, and
the width uses the integral fundamental class.

The smooth-neighborhood conclusion is supported. Every connected smooth
embedded index-one first-width cut near \(\gamma\) has positive induced
scalar curvature and can be the exact central leaf of a two-critical-point
Morse sweepout whose regular leaves have positive induced scalar curvature.
The finite-\(C^4\) compactness claimed in E12 has an independent argument in
that return. The cited changing-metric theorem alone supplies the smooth
topology conclusion.

## Width and graphical convergence

For smooth nearby metrics \(\operatorname{Ric}>0\), and the dimension
satisfies Zhou's \(2\le n\le6\). An embedded connected closed hypersurface
separates on \(S^4\) by the mod-two intersection argument, so it is two-sided
and orientable. Zhou's Theorem 1.1 and its least-area statement therefore
supply a multiplicity-one cut of index one. If the quantifier is extended
to every connected smooth embedded minimal \(\Sigma\) of area equal to
the width, the proof in §7 still applies. Its competitor-centered sweepout
from Proposition 3.6 and the two-parameter negative-direction deformation
use precisely these hypotheses and imply index at most one. The constant
Jacobi test makes the index at least one. The latitude competitors supply
the upper bound \(\mathcal W(g_j)\le (1+o(1))\,2\pi^2\) by the fundamental-class
discretization. Their nonconcentration follows from weak continuity on
the compact parameter interval and atomlessness of each latitude measure,
including the endpoint measures of mass zero. Uniform metric comparison
preserves this property for each nearby metric.
[Zhou, Theorem 1.1, Proposition 3.6, Theorems 5.5 and 5.8, §7](https://arxiv.org/pdf/1210.2112v2)

Sharp's Appendix Theorem A.6 is for varying ambient metrics converging
smoothly. Corollary A.7 gives single-sheeted smooth graphical convergence
when the limit has positive Ricci curvature. Smooth closed embedded
hypersurfaces, the dimension restriction, bounded volumes and bounded
index are present here. A limit has index at most one. For the E13
identification, let \(B(X)=\nabla_X\nu\) be its shape operator on the unit
sphere with unit normal \(\nu\). At a point in a tangential geodesic frame,
Euclidean differentiation gives \(D_{e_i}\nu=B(e_i)\). The tangential,
spherical-normal and radial components of the Euclidean Laplacian of
\(\nu\) are respectively \(\nabla H\), \(-|B|^2\nu\), and \(-H x\), by
Codazzi and the sphere Gauss formulas. Minimality gives
\(\Delta\nu=-|B|^2\nu\). Thus \(J\langle a,\nu\rangle=-3\langle a,\nu\rangle\)
for every constant \(a\in\mathbb R^5\), and some such function is nonzero.
If \(B\) is nonzero, the constant Rayleigh quotient is strictly below
\(-3\), giving a second negative eigenvalue. The limit is therefore totally
geodesic and its connected embedded image is an equator. This establishes
the smooth-limit identification directly.
[Sharp, Appendix A, Theorem A.6 and Corollary A.7](https://wrap.warwick.ac.uk/id/eprint/129477/7/WRAP-compactness-minimal-hypersurfaces-index-Sharp-2016.pdf#page=16)

For E12's finite-regularity argument, Sharp's Theorem A.3 and Remark A.4
apply locally to stable sheets when their area integrands converge in
\(C^3\) with uniform (8)–(12). In smooth fixed charts these integrands
depend smoothly on \(g_j\) and the conormal, in the form
\((\det g_j)^{1/2}\sqrt{Z^Tg_j^{-1}Z}\). Local coordinate normalizations
can be made with uniform bounds on the small fixed chart cover since the
metric matrices and their derivatives are uniformly controlled. An
index-one sequence is eventually stable off at most one point after
diagonal extraction over a countable basis, by the two disjoint supports
test. The limit is stationary by \(C^1\) metric convergence. Local smooth
sheets give integer weights away from the possible exceptional point.
Uniform local mass bounds remove any atom there. A limiting sheet has
a regular point of positive integer density.
[Sharp, Lemma 4.1 and Appendix A, (8)–(12), Theorem A.3, Remark A.4](https://wrap.warwick.ac.uk/id/eprint/129477/7/WRAP-compactness-minimal-hypersurfaces-index-Sharp-2016.pdf)

The cone over this spherical limit is four-dimensional and stationary
in \(\mathbb R^5\). In polar integration the \(r^3dr\) weight and the
divergence radial derivative give stationarity together with spherical
stationarity, and a cutoff at the vertex gives an error of order \(r^3\).
The density at its vertex, and at infinity about any center, is the
spherical mass divided by \(4\omega_4=2\pi^2\). At a regular point of the
link the cone density is an integer at least one. The area upper bound
forces equality in Euclidean stationary monotonicity about that point.
The cone is homogeneous about the point and equals its density-one
tangent plane there. Original homogeneity places the origin in that
plane, so the link is a multiplicity-one great equator. This step requires
a regular point off the exceptional set and does not require a separate
removability theorem at the exceptional point.
[Ramic, dissertation, §5.2 and pp. 41–42, stationary monotonicity and equality](https://www.math.ias.edu/delellis/sites/math.ias.edu.delellis/files/Jusuf.pdf)

The curvature blow-up proof then gives unscaled curvature bounds through
the possible exceptional point. With base points \(q_j\) realizing
\(\max |B_{g_j}|\to\infty\), bounded rescaled curvature gives one sheet
through the base point on a common small disk. Its minimal graph equation
gives \(C^2\) subsequential convergence to a Euclidean minimal graph with
base curvature one. On any fixed small rescaled radius its area ratio
is at most the limiting unscaled area ratio of the multiplicity-one
equator at any sufficiently small fixed original radius, up to the
monotonicity exponential error. Sending that original radius to zero
gives a ratio at most one, which contradicts the curvature-one limit by
the equality case. Uniform graphical patches and multiplicity one then
give global single-sheet \(C^2\) convergence. The needed stationary
Riemannian monotonicity is uniform here. For example uniform sectional
curvature and injectivity bounds give
\(\operatorname{tr}_{T\Sigma}\nabla^2(d^2/2)\ge3-Cd^2\) by radial Hessian
comparison. The divergence theorem and coarea give
\(r A'(r)\ge(3-Cr^2)A(r)\), where \(A(r)\) is the area in a ball centered
on the hypersurface, which has the required error tending to zero.
An alternative local graphical input after the density-one limit is the
intrinsic Riemannian Allard estimate with constants controlled by
sectional curvature and harmonic radius, applied at fixed small balls
on which stationarity, density one and the upper mass-ratio condition
hold, followed by elliptic estimates.
[De Lellis–Ramic, published §7.2, (7.1)](https://www.numdam.org/article/AIF_2018__68_5_1909_0.pdf)
· [Agnoletto et al., arXiv:2504.10758v2, Definition 3.12 and Theorem 3.2](https://pdfs.assets.alphaxiv.org/2504.10758v2.pdf#page=72)

**Source correction, 27 November 2026.** The URL ending in Jusuf.pdf in
the first E12 read is a 2016 dissertation by Jusuf Ramic. Its §5.2 is
the indicated passage. For the published joint De Lellis–Ramic article,
the corresponding reference is §7.2, (7.1), at the Numdam URL above.
The White notes give a useful smooth illustration of the conical
rigidity argument. The equality step for a stationary varifold uses
the varifold monotonicity formula.

## Scalar curvature, critical points and alignment

The E12 spectral test with \(C^2\) metric convergence is uniform over
unit vectors in the entire first eigenspace. Rayleigh comparison and
uniform local elliptic estimates give subsequential \(C^2\) convergence
to a normalized linear height. For E13 the larger spectral cluster
is necessary to choose the normal to the given cut when the eigenvalue
at four splits. There are exactly five eigenvalues counted with
multiplicity in \((2,7)\) near the round metric, by the min–max
characterization and the round cluster at \(4\) between \(0\) and \(10\).
The latter values follow by restricting harmonic homogeneous polynomials
of degrees zero, one and two in \(\mathbb R^5\). In the normalized round
coordinate basis, the restriction squared norm on an equator has one
zero eigenvalue and four eigenvalues \(15/16\).
Indeed \(\int_{S^3}x_i^2=2\pi^2/4\) on a tangential axis and
\(\int_{S^4}x_i^2=(8\pi^2/3)/5\). Basis subsequences and graphical
convergence pass this gap to the nearby restriction forms. The smallest
eigenvalue is simple and its normalized minimizing line tends to the
round normal height line. This yields uniqueness up to sign for the
selected direction on each pair \((g_j,\Sigma_j)\).

E13's flow coordinates avoid a loss from nearest projection to the
moving cut. Uniform \(C^3\) convergence of the chosen cluster functions
is sufficient because \(X=\nabla u/|\nabla u|^2\) then converges in
\(C^2\) on the belt. Smooth metric convergence supplies this via elliptic
estimates. \(C^4\) metric convergence is also sufficient for this
particular estimate. The level \(u^{-1}(0)\) and cut \(\Sigma_j\) are
single small graphs over the limiting equator. Projection along the
\(X\) flow from the latter to the former is a \(C^2\)-small perturbation
of that equatorial identification. It is a proper local diffeomorphism
of degree one, hence a diffeomorphism. The cut's resulting time
coordinate is \(C^2\)-small. Subtracting its trace with the fixed cutoff
gives a \(C^2\)-small change and stays strictly increasing in the time
coordinate. Its zero set is exactly \(\Sigma_j\), and the change is
smooth and supported in the regular belt. One may instead do the
extension in fixed round belt coordinates over the limiting equator
if a background marking rather than a construction from the pair is
desired.

On a compact belt the height gradient is uniformly bounded below, so
the contracted Gauss formula for the regular sections is continuous
in the ambient \(C^2\) metric and height. Round leaves there have scalar
curvature at least \(6\). On two fixed small round geodesically convex
caps the height Hessian stays uniformly definite. The Gauss term
\(2\sigma_2(B)\) is nonnegative there at every regular point even as
gradients tend to zero, and \(R_g-2\operatorname{Ric}_g(\nu,\nu)\) remains
uniformly positive. These pointwise checks include levels meeting both
a cap and the belt. Critical points lie only in the caps. Fixed
round geodesics between any two candidate points in a cap would have
both endpoint derivatives zero despite the definite Hessian. Hence
the global minimum and maximum are the unique cap critical points,
and both are nondegenerate. The regular level flow connects the given
cut on each side to the shrinking Morse levels; every regular level is
a three-sphere. This verifies the requested curvature, endpoints and
actual cut alignment for the smooth-neighborhood handoff.

The conclusions concern a specified smooth metric after a supplied
standard-sphere identification and fixed-radius normalization. There is
no need for a unique first-width cut, a generic metric, an energy
inequality, or an entering pinching assumption. The aligned sweepout
specifies its central leaf and its intrinsic curvature, with no
claim about an optimal maximal area or a mean-curvature evolution.
A sequence with \(C^j\) metric discrepancy less than \(1/j\) and a bad
cut in each metric would contradict the smooth-limit proof on a
subsequence, so these conclusions hold throughout a smooth neighborhood.
