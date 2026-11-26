# E67r1 · Exact Bach-flat types, spectral gap and isolation

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent review MASTER-E67r1 v1. The dispatch
specified GPT-6.2 Sol at ultra effort. Actual serving settings are
unavailable. The frozen neck transitive TeX SHA-256 prefix is
3ff701729d047bb6, tracked in the E59–E62 receipt. The E15 owning
subsection in the fixed inputs belongs to the closed-and-conformal
alternatives file, SHA-256 prefix 4e7e947122b44591.
The independently checked master candidate had SHA-256 prefix
09b529b82f6551e3.
[Input receipt](../../../../../master/research-progress/handoffs/E59_E62_SPECTRAL_WINDOWS_20261125.md)
· [Master candidate](../../../../../master/manuscript/exact_closed_types.tex)
· [Exact compactness and marked ALE descent](../manuscript/marked_necks_and_chiral_energy.tex)
· [Fixed-type critical value](../manuscript/closed_and_conformal_alternatives.tex)

**Assessment.** In a fixed strict subcritical band, exact Bach-flat
positive classes on smooth homotopy four-spheres admit only finitely
many underlying smooth types. On the nonstandard types their ordinary
spectral deficit attains its minimum, which is strictly positive.
The same argument gives closed smooth compactness for sublevels a
fixed distance below the first possible bubbling deficit. Exact classes within a
uniform band-dependent tolerance of the infimum over all positive
classes are actual minimizers. The last assertion includes a vacuous
case on any represented type whose lowest exact value lies above that
infimum. These conclusions are non-effective.

## Compactness and inherited marks

Fix \(T=4\pi^2\) and \(\delta>0\), with \(e_i\le 2T-\delta\).
On a nonstandard smooth closed oriented homotopy four-sphere
an exact Bach-flat positive class has \(e_i>T\) by the closed
critical gap. Choose its smooth volume-one Yamabe representative
\(g_i\), with \(Y_i=R_{g_i}\). Bach-flatness is conformally
invariant. In the fixed orientation \(e_i=E_+(g_i)=E_-(g_i)\),
using Hilbert–Schmidt Weyl-operator norms. The budgets are
\[
 Y_i^2=48(2T-e_i)+12\int|\operatorname{Ric}^0_{g_i}|^2dV_{g_i},
 \qquad \sqrt{48\delta}\le Y_i\le Y_{\rm rd}.
\]
The full four-index curvature integral is uniformly bounded.
The precise normalized Sobolev coefficient in the compactness
theorem follows by taking the square root of the usual Yamabe
test inequality, and this form is preserved under constant
rescaling. One takes a subsequence with \(Y_i\to y\) and
\(e_i\to e\).

The bounded-curvature case has uniform injectivity and derivative
bounds, and the physical diameter bound keeps the limit closed.
In the unbounded case, rescaling at a maximum keeps global
scaled curvature at most one, with norm one at the marked basepoint.
Scaled small-ball volumes have a uniform lower ratio, and the
curvature bound gives a uniform comparison upper volume on
small fixed balls. Exact Bach-flat constant-scalar regularity
then gives smooth pointed convergence on whole compact subsets.
The bounded curvature and injectivity bounds exclude orbifold
points on these sets even though the general compactness
theorem permits them. \(b_1(M_i)=0\), the uniform normalized
Sobolev coefficient, total curvature bound and positive lower
total volume bound are valid for the rescaled sequence.
The noncompact pointed limit has order-zero ALE ends by the
Bach-flat version of Tian–Viaclovsky's compactness theorem.
The scalar-flat obstruction-flat decay theorem improves the
order in the smooth charts. The alternative and its constants
do not require fixing the source smooth type.
[Tian–Viaclovsky, (1.2), Theorem 1.1, remark after Theorem 1.3 and Theorem 4.1](https://arxiv.org/pdf/math/0312318)
· [Ache–Viaclovsky, Definition 1.1 and Theorem 1.2](https://arxiv.org/pdf/1106.1249)

In the closed branch the embedding of the entire closed limit is
a diffeomorphism by openness and compactness. Smooth convergence
and the source Yamabe inequalities give the limiting Yamabe
constant \(y\), with equality by testing the unit-volume constant
function. In the ALE branch the scalar-flat limit has compact-test
constant at least \(y\), and its full embedded core supplies
ordinary integral Mayer–Vietoris. There is one exterior component
per link: the map from \(H_0\) of the link union to \(H_0\) of
the connected core and the exteriors is injective by \(H_1(M_i)=0\).
All links have integral \(H_2=0\) and finite \(H_1\). Thus \(H_2\)
of the core vanishes, its first homology is finite and \(k\)
links give \(\chi=2-k\) by the pair sequence. The positive
Yamabe bound after compactification uses the
transported compact-test constant and the zero capacity of
the one missing point.

More explicitly, for ALE end group orders \(q_j\), \(q=\max q_j\),
and \(e_{X,\pm}=E_\pm(h;X)\), the combination of Euler boundary
terms, the scalar-flat Ricci budget and the radial quotient
test gives
\[
 (2T-e)+\tfrac12(e_{X,+}+e_{X,-})
       +T\left(k-2+\sum_jq_j^{-1}\right)
 \le y^2/48\le 2T/q .
\]
If \(k\ge2\), the difference of the left side and \(2T/q\)
is at least \(\delta+T(k-2)(1+q^{-1})\). In the one-end
case the topology and spin part of the link argument leaves
\(1\) or \(Q_8\). The APS calculation on the limit truncation
excludes \(Q_8\) because it would require
\(|e_{X,+}-e_{X,-}|=9\pi^2>e\). This uses the actual smooth
embedding of the link for its topology and the asymptotic
product on the limit for its energy calculation. The
smooth removable ordinary chart gives a homotopy sphere
\(\widehat X\) by van Kampen and Mayer–Vietoris. Nonflatness,
the signature identity and \(d=4e_X\) for
\(d=\int|\operatorname{Ric}_h|^2\) give \(e_X>0\); the closed
exact gap improves this to \(e_X>T\). Thus the residual is
\(e-e_X<T\). The compatible collar and positive marked cap
identify the compactified type with each late \(M_i\).
This identification does not assume a smooth Schoenflies
statement for an arbitrary embedded sphere. Its discarded side
is capped with the supplied marking and recognized independently
from positive Yamabe sign and its strict residual energy.
[Finite-puncture and ALE marked transfers](../manuscript/marked_necks_and_chiral_energy.tex)
· [Inherited end and marking checks](../../../../../master/reviews/E11_COMPLETE_LIMIT_CHECK.md)

There is no circular use of the quantitative uniform drop
\(\kappa_\delta\) in the compactification itself. The qualitative
marked identification and \(Y([\bar h])\ge y\) precede the
compactness lemma's proof of a uniform exact Yamabe gap from
\(Y_{\rm rd}\). The latter gap then applied to the already
constructed compactified exact class gives \(\kappa_\delta\)
via the scalar-flat Ricci budget. The finiteness of smooth types
and spectral conclusion use the qualitative transfer. E15's
lower-sublevel exclusion uses the later quantitative drop.

## Finiteness and the spectral deficit

If there were infinitely many nonstandard types in this band,
choose one exact sequence with pairwise distinct types. The
smooth closed limit or the one-point compactification is a single
smooth type, and the markings identify all late indices of the
subsequence with it. This contradicts the chosen sequence.
Fixing an orientation on each source does not affect this test.

Let \(L=\max(\lambda_{\max}(W^+),\lambda_{\max}(W^-))\) in
the real Weyl blocks, and
\(\Delta([g])=36\int L^2dV_g-Y([g])^2\).
Its first term is a conformal invariant, and \(L^2dV\)
is locally invariant as a measure, under all positive
conformal factors including constant rescaling. Chen–Zhu's
strict and equality theorems give \(\Delta>0\) on a
nonstandard positive class. The spherical conclusion follows
from simple connectivity and the exclusion of the
\(\mathbb{CP}^2\) and product-of-surfaces alternatives by
\(b_2=0\). Suppose a sequence in the stated nonstandard exact
band has \(\Delta_i\downarrow0\), after passing to a subsequence.
In the closed branch, smooth convergence gives
\(\Delta([h])=0\) and the whole closed diffeomorphism gives
the contradiction. In the ALE branch, for each fixed whole
truncation smooth convergence gives its limiting spectral integral.
Exhaustion and the source's full nonnegative integral give
\[
 \int_{\widehat X}L_{\bar h}^2dV_{\bar h}
 =\int_X L_h^2dV_h
 \le\liminf_i\int_{M_i} L_{g_i}^2dV_{g_i}.
\]
The ordinary puncture has zero measure; the first equality
uses conformal invariance and the smooth compactification.
Together with \(Y([\bar h])\ge y\) this gives
\(\Delta([\bar h])\le\lim_i\Delta_i=0\).
The alternative marked same-type result again contradicts
Chen–Zhu on the nonstandard type. No spectral identity on
the entire exterior or continuity of its physical volume
is needed. Since every deficit in the nonstandard band is
strictly positive, the exclusion of such a sequence gives a
uniform \(\xi_\delta>0\) with \(\Delta\ge\xi_\delta\),
with the empty family interpreted vacuously.
[Chen–Zhu, Theorems 1.4 and 1.6](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1805784609151475713-1805784609151475713-dfd4e7a2ab88de50d337d60e7620a3c8.pdf)

### A quantitative deficit drop on the true complement

For a fixed compact truncation \(K\Subset X\), let
\(\sigma_i=\int_{M_i} L_{g_i}^2dV_{g_i}\to\sigma_\infty\)
and \(\sigma_h(K)=\int_K L_h^2dV_h\).
The pointwise inequality for either sign is
\(|W^s|^2_{\rm HS}\le6L^2\). To verify the constant, the three
eigenvalues \(\lambda_j\) of one trace-free block satisfy
\(\lambda_j\le L\) and \(\sum(L-\lambda_j)=3L\).
Thus \(\sum\lambda_j^2=\sum(L-\lambda_j)^2-3L^2\le6L^2\).
On the actual source complement of the image of \(K\),
subtract the converging integrals on that image from the
whole source totals before applying the inequality. In the
limit this gives
\[
 e-E_s(h;K)\le6(\sigma_\infty-\sigma_h(K)).
\]
Exhausting \(X\) yields \(6(\sigma_\infty-\sigma_X)\ge
e-e_X\ge\kappa_\delta\) by the quantitative marked descent.
The sign \(Y([\bar h])\ge y\) is in the needed direction:
\[
 \Delta([\bar h])
 =\lim_i\Delta_i-36(\sigma_\infty-\sigma_X)
                          -(Y([\bar h])^2-y^2)
 \le\lim_i\Delta_i-6\kappa_\delta .
\]
In particular the resulting class is a competitor for the
spectral infimum in the very same family, since it is exact,
positive and on the same nonstandard type, with
\(e_X<2T-\delta\). If that family is nonempty, an infimizing
sequence is therefore in the closed branch. Its smooth limit
attains the infimum, positive by Chen–Zhu. In fact for a
fixed \(b<\inf\Delta+6\kappa_\delta\) the **closed** sublevel
\(\Delta\le b\) is sequentially smoothly compact after marked
diffeomorphisms. This proof does not exclude bubbling for a
sequence approaching the upper boundary of the entire open
range. Local analyticity of the Weyl functional is used for
the energy values below, and no local constancy of \(\Delta\)
is needed.

## Isolation relative to the all-class infimum

For every one of the finitely many represented types \(M\),
let \(\mathcal A_M\) and its least exact positive subcritical
value \(a_M\) be as in E15. This set is nonempty and
\(I^+(M)\le a_M<2T\). The E15 compactness argument first
chooses a band containing a minimizing sequence for \(a_M\)
and an upper endpoint \(b<a_M+\kappa_\delta\).
The marked ALE alternative would give a strictly smaller
exact positive value on the same type. The closed alternative
therefore gives attainment. The local Bach gauge, analytic
kernel graph and finite-dimensional gradient inequality make
the exact chiral value locally constant near a smooth
limiting metric. Compactness in the strict sublevel above
first attainment yields isolation. Neither uniqueness of the
metric nor finiteness of the complete critical spectrum is
required.
[E15 independent analytic and compactness check](E15_CRITICAL_VALUES_CHECK_20261125.md)

Choose, for each represented \(M\), a positive tolerance
\(\gamma_M\) as follows. If \(a_M>I^+(M)\), use
\((a_M-I^+(M))/2\). Every exact energy on that type is
at least \(a_M\), so the near-infimum premise cannot hold.
If \(a_M=I^+(M)\), take half of an E15 isolation radius
of \(a_M\). An exact energy within this tolerance of the
all-class infimum then equals the infimum and the given class
actually attains it. The minimum of the finitely many
\(\gamma_M\) is positive and works uniformly in the original
\(\delta\) band. The factor of one half permits inclusive
or strict phrasing of the tolerance. For an empty band any
positive tolerance works. This deduction does not assert
existence of any exact class close to \(I^+(M)\) on a
particular type.

## Filled-base consequence in the master candidate

For a minimizing sequence with \(\Delta_i\to0\), the
candidate's lower-semicontinuity statement uses the spectral
mass as a function of the two self-adjoint, trace-free Weyl
matrix densities in common orthonormal frames. The maximum
of the two largest eigenvalues is nonnegative and convex
on that vector space. Squaring preserves convexity on its
nonnegative range. The square-root volume density multiplying
the two matrix blocks is positive, so homogeneity gives
precisely the conformal spectral measure. Weak local \(L^2\)
convergence therefore suffices for lower semicontinuity.
The strong local chiral convergence of the minimizing theorem
also gives direct convergence by the Lipschitz estimate for
largest eigenvalues. The compact tests and zero capacity of
the ordinary marked points give \(Y_{\rm base}\ge y\), and
hence \(\Delta_{\rm base}\le0\). Chen–Zhu identifies the
standard smooth sphere. A positive-energy filled base would
have the original nonstandard type by the whole-base theorem,
so it must have zero energy and be conformally round.
The same marked theorem leaves one exterior carrying both
chiral energies in the limit.

Persistence under an actual round restart additionally
uses preserved conformal geometry on the retained portion,
vanishing discarded and newly introduced chiral measures,
and the long-buffer comparison
\(\liminf Y([c_i])\ge y\) on the same capped exteriors.
The latter bound does not follow from the positivity wall
alone. The spectral upper bound by combined chiral mass
transfers the first two assertions to the spectral measure.
The Yamabe lower bound and Chen–Zhu on the capped nonstandard
type give \(\Delta([c_i])\to0\). Those late caps then cannot
be exact Bach-flat representatives in the fixed strict band.
The proof gives no bound on repetitions among noncritical
restarts. [Whole-base theorem and local comparison](../../../../../master/manuscript/variational_comparison.tex)
· [Independent spectral transfer check](../../../../../master/01_fixed_type_variational_descent/reviews/E67_SPECTRAL_TRANSFER.md)
