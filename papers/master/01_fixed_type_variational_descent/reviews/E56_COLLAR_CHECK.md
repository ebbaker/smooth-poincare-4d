# E56br · Independent check of the coordinate estimate and the marked collar

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and reasoning effort are
unavailable. The reviewed [E56b TeX](../manuscript/disk_collar_comparison.tex)
and [derivation](../notes/E56_DISK_COLLARS.md) have SHA-256 prefixes
`0aa8e17a535212f8` and `cea5fcb1bade172a`. The frozen E55 master
and descent TeX bundles are `15c0f568bb52bdde` and
`d68f8bb116c8bdbd`, with `b877c61b76b7` for the endpoint
charge section. This is a bounded recomputation of the coordinate
estimate, cutoff and actual markings.
[E55 disk and cap inputs](../../research-progress/handoffs/E53_E55_ENDPOINT_CHARGE_20261125.md)

**Assessment.** The derivative and localized chiral cutoff estimates
hold in the supplied conformal-coordinate gauge. The measured disk
charge and the smooth cap identification survive that cutoff on the
original source. The ball sandwich gives the marked domain and
curvature bound. Selecting a chart that also satisfies the distortion
and differentiated residual bounds remains a separate requirement.

## Differentiated coordinate estimate

For the four-dimensional conformal change \(p\mapsto u^2p\),
the volume factor in the coordinate density acquires \(u^4\),
and the two inverse metric factors acquire \(u^{-4}\). This
gives the exact invariance of \(\sqrt{\det p}\,p^{\alpha\alpha}
p^{j\alpha}\), of its coordinate divergence, and of that
divergence's coordinate derivative in the same chart.
The determinant-one metric is likewise unchanged.
Liimatainen–Salo's arXiv v1, pp. 1–2, defines \(p\)-harmonicity,
specifies the conformally invariant \(n\)-harmonic condition
and states ellipticity after fixing this gauge and the metric
determinant. The E56b estimate with a residual follows from
its own Euclidean symbol and cutoff argument.
[Primary preprint](https://arxiv.org/pdf/1310.3666)

In the Weyl symbol, take the first coordinate parallel to
\(\xi\). The transverse Riemann symbol vanishes. If the Weyl
symbol vanishes, tracing the transverse Euclidean
Kulkarni–Nomizu identity in dimension three forces the
transverse Schouten block to vanish. With the mixed block
zero by the mixed curvature components, the \(1a1b\) block
is a multiple of \(\delta_{ab}\). Thus in the original
coordinates the kernel consists of
\(h=\ell\delta+\xi\otimes u+u\otimes\xi\).
For trace zero \(2\ell+\xi\cdot u=0\). The \(4\)-harmonic
linearized symbol on this kernel is, up to the common Fourier
factor, \((|\xi|^2+2\xi_\alpha^2)u_\alpha\).
Differentiating adds the nonzero factor \(\xi\).
Joint injectivity and homogeneity therefore give the
claimed second-derivative estimate by Plancherel.

The highest-order coefficient differences of both operators
are \(O(a)\) for \(a=\|\log m\|_\infty\), by the matrix
exponential and the smooth algebraic Weyl projection.
The lower-order products are bounded by \(C|Dh|^2\).
For the compact test \(\chi^2h\), both commutators have a
first derivative multiplied by \(\chi\). With
\(X=\|\chi^2D^2h\|_2\),
\(Y=\|\chi Dh\|_2\) and \(J=\|\chi Dh\|_4^2\),
direct integration by parts gives
\[
 Y^2\le Ca(X+Y),\qquad J^2\le Ca(JX+J^{3/2}).
\]
For the quartic term one pairs
\(\chi^2|Dh|^2\) against \(\chi^2|D^2h|\).
The differentiated-cutoff term uses Hölder with
\(\|\chi Dh\|_4^3\) and the fixed \(\|D\chi\|_4\).
Thus \(Y\le C(\sqrt{aX}+a)\) and \(J\le Ca(X+a)\).
Inserting these into the Plancherel bound absorbs \(aX\)
for fixed small \(a\) and \(\sqrt{aX}\) by Young's inequality.
The result is \(X\le Cb\) and \(J\le Cab\) for
\(b=w+\tau+a\). The full-tensor Weyl input is exactly
\(w^2=4(E_++E_-)\) on the original collar. It bounds the
covariant Weyl components of the determinant-one metric in
Euclidean \(L^2\) by conformal invariance and uniform ellipticity.

## Cutoff and the induced mark

Set \(\theta_s=1-s\psi\). In the chiral density matrix,
the leading term \(L_\pm(D^2(\theta_s h))\) cancels against
\(\theta_s L_\pm(D^2h)\) up to the first- and zero-order
cutoff terms. The difference vanishes off the transition
support. On that fixed support the remainders cost at most
\(C(a\|D^2h\|_2+\|Dh\|_4^2+\|Dh\|_4+a)\).
Using the interior bounds gives the announced
\(C(a+\sqrt{ab}+ab)\) on the whole support and its exterior
half. The square of the density factor
\((\det m)^{1/4}\) is the coordinate volume multiplier.
Restoring the source conformal factor changes neither chiral
measure.

The E55 closed model subdisk sits compactly in its open
parametrized ball, so a narrower two-sided radial collar can
use the same angular sphere map. Rescaling its radial
parameter to the fixed coordinate annulus preserves the
induced seam and the orientation toward the retained
source. The same angular map extends over the removed disk.
Consequently the cylindrical cap gives a smooth metric on
the original oriented type. The associated estimates are
evaluated after that radial change, in the actual normalized
chart. A different seam or a reselected boundary needs its
own charge and marking check.
[Embedded ball construction](../../manuscript/physical_volume.tex)
· [Simultaneous removal and localized costs](../manuscript/fixed_type_chiral_energy_descent.tex)

The strict joined bound below \(2T\) uses both halves of
each collar and preserves sign along the closed path.
The retained bound uses the exterior allowance against
the exterior raw charge only. For a fixed E55 disk, the
limiting \(k_i\)-volume of the fixed inner comparison ball
is positive. The total-variation transfer therefore gives a
positive lower bound on the sum of the two chiral disk
charges. A subsequence fixes one chirality with positive
lower bound. Its vanishing collar allowance then gives a
positive same-type capped class of energy below \(T\), since
the closed chiral energies agree.
[Endpoint transfer](../manuscript/endpoint_charge.tex)

In the reparametrized round example, the radial derivative
of the logarithmic radial eigenvalue contains
\(\tfrac32 f_N''/f_N'\) on the cutoff plateau, with an
\(O(N^{-1/2})\) remainder. The fourth power of its sine
factor has a uniform positive integral on the smaller
fixed plateau, so \(\|Dh_N\|_4^2\ge cN\).
With \(w_N=0\) and \(a_N=O(N^{-1/2})\), the interior
estimate forces \(a_N\tau_N\ge c'N\) for large \(N\).
This tests the actual coordinate bound while keeping the
same embedded disk and faces. The unchanged stereographic
marking is itself round and the example carries zero
chiral charge.
