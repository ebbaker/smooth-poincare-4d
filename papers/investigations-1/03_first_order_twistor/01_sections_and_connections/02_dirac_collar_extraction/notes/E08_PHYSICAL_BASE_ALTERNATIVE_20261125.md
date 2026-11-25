# SP4-FOT-EXTRACT-E08 · The physical removable-base alternative

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E proof check. Helper configured
for GPT-6.2 Sol, ultra. The runtime does not expose the exact serving
variant or effort. [Frozen request](../research-progress/handoffs/E08_REQUEST_20261125.md).
The E06 and NECK-E09 notes were checked at SHA-256 prefixes 53b01797
and 2d83a863. The SEC manuscript SHA-256 prefix is 329513a3.

## Source and closed physical base

Fix a smooth closed connected oriented homotopy four-sphere \(M\).
Use smooth unit-volume positive Yamabe minimizers \(g_i\) with
\(s_i=Y([g_i])\to y>0\) and
\[
 E_i=E_+(g_i)=E_-(g_i)\longrightarrow e,\qquad
 4\pi^2\le E_i\le 8\pi^2-\delta,\qquad
 \int_M|B_{g_i}|\,dV_{g_i}\longrightarrow0 .
\]
The chiral energies use the real Hilbert–Schmidt Weyl-operator
norm on \(\Lambda^\pm\). Supply a connected smooth closed oriented
homotopy four-sphere \(N\), a smooth positive metric \(h_N\) on \(N\)
and a finite set \(P\) of smooth points. For every fixed truncation
\(N_b=N\setminus\bigcup_{p\in P}B_{h_N}(p,b)\), assume an
orientation-preserving embedding of a neighborhood of the
**whole** truncation under which the unscaled physical \(g_i\)
converges smoothly to \(h_N\). The images of all boundary faces
must lie in the same source for each chosen truncation.
Write \(e_N=E_\pm(h_N)\), which is common to both chiralities
by signature.

The E06 volume argument first passes the source Yamabe inequality
to compactly supported tests in \(N\setminus P\) using the smooth
physical comparison. The physical scalar curvature passes to
\(s_{h_N}=y\), and this holds across \(P\) by continuity. Smooth
point cutoffs at radius \(b\) have squared gradient integral
\(O(|P|b^2)\). For each cutoff take the source limit first, and
then remove the cutoff. This gives the closed Yamabe inequality
with lower bound \(y\). Applied to the constant test it gives
\(y\sqrt{\operatorname{Vol}(N,h_N)}\le
y\operatorname{Vol}(N,h_N)\). Physical volume comparison on fixed
truncations and then exhaustion bound the volume by one. Hence
\[
 \operatorname{Vol}(N,h_N)=1,\qquad s_{h_N}=Y([h_N])=y .
 \tag{1}
\]
The base is a volume-one positive Yamabe minimizer. Smooth
comparison and the small total Bach norm give \(B_{h_N}=0\) on
every compact subset of \(N\setminus P\). Indeed the integral
of the limiting Bach norm is zero on those subsets. Smooth
removability gives the same exact equation on \(N\).
[EXTRACT-E06, cutoff and volume argument](E06_PHYSICAL_END_FRAMES_20261125.md#volume-exhaustion-is-automatic-for-the-physical-removable-base) · [SEC §11.1 and §12.4](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

## A nonflat smooth SEC ALE component cannot coexist

Suppose there is a complete connected smooth nonflat ALE
component \(X\) as in SEC §§11.1–11.4, with positive
differentiable end decay and full compact embeddings under the
constant length rescaling \(\lambda_i^{-2}g_i\), \(\lambda_i\to0\),
on the same subsequence. Assume its fixed truncations and
\(N_b\) have disjoint comparison images in their interiors for
all sufficiently large \(i\). The physical scalar rescales by
\(\lambda_i^2\), and the total Bach norm is invariant in
dimension four, giving the scalar-flat and exact Bach-flat
component equations by smooth convergence. The SEC one-end
and smooth compactification results then give a single
Euclidean end, a smooth closed positive-Yamabe Bach-flat
homotopy-sphere compactification \((\widehat X,\widehat h_X)\),
and a common chiral energy \(e_X>4\pi^2\). The positive
energy uses nonflatness. In this class the AE identity
\(\int_X|\operatorname{Ric}_{h_X}|^2\,dV_{h_X}=4 e_X\)
and scalar-flatness imply that zero chiral energy would be flat.
This imports the stated SEC theorem hypotheses, including
the full-core topology and the smooth compactification.
[SEC §§11.3–11.4, AE end and compactification](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4047) · [SEC §12.1, energy of a nonflat component](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4357)

If \(e_N>0\), the same exact closed Bach-flat gap on \(N\)
gives \(e_N>4\pi^2\). At fixed \(b\) and fixed inner
truncation \(K_A\), use disjoint interiors and smooth
comparison to get
\[
 E_+(h_N;N_b)+E_+(h_X;K_A)\le e .
\]
The inner constant rescaling preserves either chiral
integral. Exhaust both comparison domains after taking
\(i\to\infty\) at fixed \(b,A\). Then \(e_N+e_X\le e\le
8\pi^2-\delta\), in contradiction with the two positive
lower thresholds. No conclusion about energy left outside
these images is used.
[SEC §12.1, exact closed gap](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4357) · [Chang–Chen, Theorem 2.1 and norm convention](https://nzjmath.org/index.php/NZJMATH/article/download/152/60/450)

If \(e_N=0\), the closed rigidity statement or zero Weyl
recognition gives the round conformal class. Equation (1)
then gives \(y=Y_{\rm rd}\), where \(Y_{\rm rd}=8\sqrt6\,\pi\).
Transport each fixed compactly supported test on \(X\) to
the source via its rescaled comparison, and pass to the
limit there. The Yamabe quotient is invariant under the
constant rescaling and the source constants tend to \(y\).
Thus \(Y_c(X,h_X)\ge y\). Conformal transport of compact
tests to \(\widehat X\) followed by cutoff at its smooth
added point gives
\[
 Y([\widehat h_X])=Y_c(X,h_X)\ge y .
\]
The cutoff argument uses the same finite-point capacity
estimate as above, after smooth compactification. But
\(e_X>0\) makes \([\widehat h_X]\) nonround, so sharp
Yamabe rigidity gives \(Y([\widehat h_X])<Y_{\rm rd}\).
This is the contradiction in the round-base case.
It needs no energy bound for the complement of the
comparison images. Indeed the obstruction at the maximal
source Yamabe limit \(y=Y_{\rm rd}\) applies to any supplied
nonflat smooth component meeting the SEC hypotheses,
even without the base comparison.
[SEC §§11.1 and 11.4, compactly supported Yamabe inequality and compactification](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868) · [Schoen, Theorem 2, p. 493](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf)

## Below the round Yamabe value

If \(y<Y_{\rm rd}\), (1) excludes the round conformal
class on \(N\), so the exact closed gap gives
\(e_N>4\pi^2\). Smooth comparison on fixed base truncations
alone gives \(e_N\le e\), so
\[
 0\le e-e_N<4\pi^2-\delta .
\]
Apply NECK-E09 to the full exterior comparison with the
actual finite family of punctures and the uniform positive
source Yamabe bound. Its capped complement energies are
strictly subthreshold and the original manifold is
orientation-preservingly diffeomorphic to \(N\). The
construction fixes the finite cap buffer first, then
a small fixed normal radius at every puncture, then
takes \(i\) large on the larger whole truncation.
The chiral tail in the omitted balls tends to zero by
smoothness. This identifies the smooth type using the
marked caps. It does not require a classification of
the residual geometry.
[NECK-E09, finite-puncture type transfer](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md)

Define \(I^+(M)=\inf_{Y([g])>0}E_+(g)\) on the fixed
original smooth type. The transported \(h_N\) is admissible,
hence \(I^+(M)\le e_N\le e\). This gives
\(e-e_N\le e-I^+(M)\) for near-minimizers. If \(e=I^+(M)\),
then \(e=e_N=I^+(M)\), and \(h_N\) gives an exact closed
Bach-flat attaining class on the original type. The entire
physical complement of the base has vanishing chiral
energy in the iterated limit. This argument has not
classified a nonround attaining class.

More explicitly, let \(R_{i,b}\) be the whole complement of
the image of \(N_b\). For fixed \(b\), subtract the integral
on the comparison image from the corresponding source
total, and then exhaust \(N\). This gives
\[
\begin{aligned}
 \lim_{b\downarrow0}\lim_i E_\pm(g_i;R_{i,b})&=e-e_N,\\
 \lim_{b\downarrow0}\lim_i\int_{R_{i,b}}
           |\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}
       &=4(e-e_N),\\
 \lim_{b\downarrow0}\lim_i
             \int_{R_{i,b}}s_i^2\,dV_{g_i}&=0 .
\end{aligned}
\tag{2}
\]
In the second line use closed Gauss–Bonnet in the physical
Yamabe metrics on \(M\) and on \(N\), both with \(\chi=2\)
and \(\tau=0\), and use (1) to identify the limiting
scalar-square terms. Equivalently, the physical accounting
from E06 cancels the same signed charges. The last line
is physical volume exhaustion. Formula (2) includes any
additional topology or branching in the omitted region.
It concerns smooth comparison before exhaustion, so
unrestricted moving radii are not used.
[SEC §11.1, scalar and Ricci budgets](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868) · [EXTRACT-E06, physical charge accounting](E06_PHYSICAL_END_FRAMES_20261125.md#signed-charge-and-the-physical-ricci-accounting-criterion)

## At the round Yamabe value

If \(y=Y_{\rm rd}\), sharp rigidity and (1) identify
\(N\) with the round conformal sphere. In this physical
gauge \(h_N\) itself is the volume-one round metric up
to isometry. In fact \(W=0\), its scalar is \(Y_{\rm rd}\),
and the closed homotopy-sphere Gauss–Bonnet formula with
volume one gives \(\operatorname{Ric}_{0,h_N}=0\).
The curvature is therefore positive constant sectional
curvature. Every admissible source has \(Y([g_i])<Y_{\rm rd}\)
because \(E_i\ge4\pi^2\). For fixed \(M\) this branch gives
\(\sup_{[g]}Y([g])=Y_{\rm rd}\), as a supremum over its
conformal classes. No realization of the supremum follows.

In this branch (2) leaves the entire positive source
Weyl mass \(e\ge4\pi^2\) outside the exhausting base images,
in either chirality. The physical trace-free Ricci mass
there tends to \(4e\), and its full four-index Riemann
integral tends to \(16e\), since the scalar-square
contribution tends to zero. The exterior has exhausted
volume even though curvature accounting has not exhausted
energy. The absent smooth nonflat SEC ALE components
do not account for this remaining mass. It could only
be resolved by an additional theorem on the residual
regions or by excluding this branch. The strict threshold
in NECK-E09 is not available from \(e-e_N=e\ge4\pi^2\),
so type transfer does not follow. Even if \(e=I^+(M)\),
the round class on the base is not thereby a competitor
on \(M\), since the smooth identification is missing.

The round limit gives local spinor data at each **fixed**
puncture radius under the comparison. For example a
smooth base field across the puncture has normalized
cylinder \(H^{1/2}\) trace of size \(O(b^{3/2})\) from the
Dirac spin weight and bounded angular derivatives on
the unit comparison sphere. For a specified ordinary
Green pole in a locally conformally flat chart with
nonzero normalized source, the leading \(b^{-3}\) term
has instead cylinder trace of size \(O(b^{-3/2})\).
These are comparison traces with the stated
normalizations. Smooth convergence supplies their
transport at fixed \(b\). It gives no actual trace
matching, spinor normalization or differentiated
twistor estimate on the unresolved source complement.
[EXTRACT-E01, physical-to-cylinder trace weights](E01_BUFFERED_SPIN_STRIP_20261125.md#conformal-weights-and-the-two-ends) · [DIR §4.1, normalization of the Dirac Green pole](../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L516)

## Omissions and other comparison gauges

Any fixed finite set of smooth removable points is
allowed. Its cutoff errors add, and the source limit is
taken on the entire matched finite truncation. If there
are no omitted points, the whole closed base embeds in
\(M\) in the same dimension. The image is both open and
closed and is all of \(M\). Then \(e=e_N\), so the round
branch is incompatible with the band. For additional
omitted smooth points in an inner component, the
capacity and nonnegative energy limits tolerate their
omission from compact tests if the full topology,
regularity and compactification hypotheses used to
obtain its SEC energy threshold are verified separately.
Neither an orbifold point nor an unverified end or
component supplies that theorem. If desired, one slow
diagonal can be selected by giving comparison
thresholds at fixed radii first. This changes neither
the disjoint energy inequality nor the scope of (2).

An exterior compact comparison after multiplication by
nonconstant positive conformal factors still gives
\(e_N\le e\), and \(e_N+e_X\le e\) on disjoint fixed
comparisons. It gives \(Y([h_N])\ge y\) by conformal
transport of compact tests, and exact Bach-flatness
by the invariance of the total Bach norm. If the
resulting base is nonround the two-energy obstruction
and the finite-puncture type transfer still apply.
A round conformal comparison by itself gives only
\(Y([h_N])=Y_{\rm rd}\) with \(y\le Y_{\rm rd}\).
The equality \(y=Y_{\rm rd}\), scalar and volume
saturation, same-gauge Ricci accounting, and the
round-base exclusion of an ALE component cannot be
inferred by this route unless the needed physical data
or maximal Yamabe value are supplied independently.
