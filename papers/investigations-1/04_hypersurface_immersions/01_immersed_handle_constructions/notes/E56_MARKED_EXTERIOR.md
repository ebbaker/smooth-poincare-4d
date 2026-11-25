# E56d · Spectral tests on a marked punctured double

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The bounded B02/IMM-HDL return selects a reflected collar
and tests its exact spectral and chiral costs. Actual serving model and
effort are unavailable. Inputs were the E53–E55 receipt with SHA-256
prefix `7a5d95fb9860`, the transitive master TeX digest
`15c0f568bb52bdde`, the handles digest `293dd3c42f80a4c6`, and the
height digest `f8995353a388aab0`. The independent curvature, scalar
obstruction and cylinder sign checks used the same product hypotheses.
[Round-marked exterior form](../../../../master/reviews/E54_SPECTRAL_ENDPOINT.md#recognition-from-a-marked-exterior) ·
[E53–E55 receipt](../../../../master/research-progress/handoffs/E53_E55_ENDPOINT_CHARGE_20261125.md) ·
[Mazur handle marking](../../02_two_handle_recognition/notes/E53_HEIGHT_DIAGRAMS.md#mixed-case-isotopy-to-the-belt-of-the-first-2-handle)

## Same-domain markings and the reflection reduction

Let \(W\) be a smooth compact oriented contractible four-manifold
with boundary \(Y\). For an orientation-preserving
\(f:Y\to Y\), form \(D_f W=W\cup_f(-W)\) with collared gluing, where
\(-W\) is the second copy with reversed orientation. Inserting
\([0,L]\times Y\) changes only the collar coordinate. The first end
is marked by the given identification with \(Y\), and the second
by \(f\). Van Kampen gives simple connectivity, and the
Mayer–Vietoris sequence and Poincaré–Lefschetz duality give
integral homology of \(S^4\). Thus \(D_fW\) is a smooth homotopy
four-sphere. No boundary extension of \(f\) into \(W\) is used.

Choose a marked coordinate ball in each copy, away from the seam
collar. Use exact unit round products on their puncture collars,
given by \(r^{-2}g_{\mathrm{Euc}}\) in the chosen coordinates. On
the two seam collars use a prescribed cross-section metric
\(\gamma\) in the common cylinder coordinates, so the second
copy uses \((f^{-1})^*\gamma\) in its own marking. These prescribed
germs have disjoint support and can be joined to smooth metrics
on the respective interiors by convex interpolation. The
retained metric extends by conformally flat caps in the actual
ball markings to a metric on \(D_fW\). The proof below concerns
the raw interior with these choices and requires no bound on the
cost of interpolating the half metrics. It charges the whole
interpolation as part of those metrics when using an exterior
positivity test.

For the identity double take identical reflected metrics and
corresponding marked balls on the two halves. Split the inserted
collar at its midpoint. Denote by \(P\) one punctured half,
including its half-cylinder, and by \(\tau(v)\) the trace at its
marked round end. Use \(V=R\) for the ordinary form or
\(V=R-6\Lambda\) for the modified form, where \(\Lambda\) is the
maximum of the two largest signed eigenvalues of \(W^\pm\) as
endomorphisms on real two-forms. Set

\[
\mathcal Q_P^{V}(v)
=\int_P(6|dv|^2+Vv^2)\,dV
 +6\langle\tau(v),\sqrt{1-\Delta_{S^3}}\tau(v)\rangle.
\]

Use all of \(H^1(P)\), with free trace at the doubled seam.
Orientation reversal exchanges the chiral blocks and preserves
\(\Lambda\). The doubled exterior form is the sum of the two
half forms, with the seam traces required to match. If the half
form is strictly positive on every nonzero test, so is the full
form. Conversely, the even extension of a half test lies in
\(H^1\) and exactly doubles its value. Hence the signs needed for
strict positivity are equivalent to the one-half test. The
Neumann condition at the middle seam for a minimizing
eigenfunction is a natural boundary condition of that test.
For a twist preserving the common half germ, positivity on one
half suffices by restriction. The converse by even extension
requires the specific test to have twist-invariant seam trace.
For the identity double, in either orientation the positive
chiral energy of the capped exterior is the sum of both chiral
energies on one punctured half, because the round ends and caps
have zero Weyl curvature.

## Obstruction from the retained seam alone

Let the retained exterior contain a full collared region
\([0,L]\times Y\) with metric conformal to \(dt^2+\gamma\).
For a warped metric \(ds^2+a(s)^2\gamma\) with \(a(s)>0\),
the conformal length is \(L=\int ds/a(s)\). Use the convention
that \(-\Delta_\gamma\) is nonnegative. In a \(\gamma\)-orthonormal
Ricci eigenframe \(e_i\) with eigenvalues \(r_i\), put
\(e_0=\partial_t\). The product curvature operator is diagonal,
with \(K_{0i}=0\) and \(K_{jk}=R_\gamma/2-r_i\) on the opposite
pair to \(0i\). The chiral projection uses the orthonormal
vectors \((e^0\wedge e^i\pm e^j\wedge e^k)/\sqrt2\), in cyclic
order. The diagonal of the projected curvature on either
chiral block is \(K_{jk}/2\); subtract \(R_\gamma/12\) to take
its trace-free part. Consequently on the product representative

\[
\lambda_i^\pm=\frac{R_\gamma}{6}-\frac{r_i}{2},\qquad
R-6\Lambda=3r_{\min},\qquad
|W^\pm|_{\rm HS}^2=\frac14|\operatorname{Ric}_{0,\gamma}|^2 .
\]

Define the two numbers
\(\ell_{\rm mod}=\lambda_1(-6\Delta_\gamma+3r_{\min})\)
and \(\ell_{\rm ord}=\lambda_1(-6\Delta_\gamma+R_\gamma)\)
on the closed \(Y\). The first Dirichlet eigenvalue on the
product strip for each corresponding form is
\(\ell+6\pi^2/L^2\). The lower bound follows from the
one-dimensional Dirichlet Poincaré inequality and the
cross-section Rayleigh inequality. The test
\(v(t,y)=\sin(\pi t/L)\phi(y)\), for an \(L^2\)-normalized first
eigenfunction \(\phi\), attains it. This is an \(H^1\) test
after zero extension to the rest of the retained domain and
has zero traces on the marked round ends. Hence if
\(\ell<0\), any

\[
L\sqrt{-\ell}\ \ge\ \pi\sqrt6
\]

prevents strict positivity. In the ordinary case it also
prevents positive Yamabe sign for any smooth cap or any
completion retaining this metric on the strip. In the
modified case it prevents a positive modified quotient there.
On a conformally product strip multiply the test by the
inverse conformal factor. The boundary term in conformal
covariance vanishes for zero traces. These conclusions are
independent of the geometry of the halves, the chosen marked
balls and any twist. Equality obstructs strict positivity.
The constant is dimensionless, since rescaling \(\gamma\)
rescales \(\ell\) inversely to squared length.

Both chiral energy measures are conformally invariant on the
strip. Its exact additive charge to either chirality is
\(L\int_Y|\operatorname{Ric}_{0,\gamma}|^2\,dV_\gamma/4\).
This equality counts the internal seam collar once. Neither
the charge nor the sign calculation uses an immersion.

For an exact product and fixed half metrics there is also a
strictly shorter obstruction when \(\ell<0\). Write
\(k=\sqrt{-\ell/6}\). Take any fixed tests on the two halves
with trace \(\phi\) in the common cylinder markings and zero
trace at the round ends. The trace in the second copy is
\(\phi\circ f^{-1}\). Let \(H\) be the sum of the two half form
values for these tests, excluding the inserted collar. Such
tests can be made by extending the prescribed trace on short
collars and cutting off before the punctures. For
\(0<L<\pi/k\) extend across the inserted collar by

\[
v(t,y)=b(t)\phi(y),\qquad
b(t)=\frac{\cos(k(t-L/2))}{\cos(kL/2)} .
\]

It has the two specified traces and solves \(b''=-k^2b\).
Its form value is \(6[bb']_0^L=-12k\tan(kL/2)\).
The global test is nonpositive once
\(H\le 12k\tan(kL/2)\). If \(H>0\), this holds starting at
\(2k^{-1}\arctan(H/(12k))<\pi/k\), and if \(H\le0\) it holds
for every positive \(L<\pi/k\). For \(L\ge\pi/k\) the
zero-trace obstruction already applies. The shorter bound
charges the actual trace extensions and is for those fixed
half metrics.

## The actual Mazur double

Take \(W=W^-(0,3)\) as the lower half of the \(n=1\) diagram in
Isoshima's Figure 37. The cut is after its first two-handle,
so \(Y\) is the middle cut in that specific double.
Akbulut–Kirby identify this \(W\) with the Mazur example
and identify its boundary, up to the choice of orientation,
with \(\Sigma(2,5,7)\). The identity double is standard
by Isoshima's Theorem 3.3. Marked punctures can be taken in the
interiors of the diagram's two dual zero-handles and exchanged
under identity doubling. Collar insertion, conformal
rescaling and capping respect the displayed cut and do not
invoke a diffeomorphism to the round sphere.
[Akbulut–Kirby, §§1 and 7, Proposition 1 and Theorem 2(1)](https://math.berkeley.edu/~kirby/papers/Akbulut%20and%20Kirby%20-%20Mazur%20manifolds%20-%20MR0544597.pdf) ·
[Isoshima, arXiv:2403.17356v2, Proposition 2.11, Theorem 3.3 and Figure 37](https://arxiv.org/pdf/2403.17356v2)

The section metric cannot avoid a negative transverse
eigenvalue. Since \(1/2+1/5+1/7<1\), Milnor's Corollary 6.6
and the Euler-characteristic calculation after Theorem 2.7
give a finite circle-bundle cover \(Z\to Y\) over a closed
orientable surface \(S\) of genus at least two. The circle
bundle is oriented along its fibers. The preimage of an
essential simple closed curve in \(S\) is a torus whose
fundamental group injects into \(\pi_1(Z)\), by injection of
the fiber from \(\pi_2(S)=0\) and injection of the base circle.
The projection onto \(\pi_1(S)\) is surjective, so
\(b_1(Z)\ge 2\,\mathrm{genus}(S)>3\). If \(Y\) admitted a metric
with nonnegative scalar curvature, the pullback to \(Z\)
would be flat by Schoen–Yau's theorem for compact orientable
three-manifolds containing a surface subgroup of positive genus.
Harmonic one-forms on a closed flat three-manifold are parallel,
so its first Betti number is at most three. This contradiction
rules out every nonnegative scalar curvature metric on \(Y\).
[Milnor, Theorem 2.7, Corollary 6.6 and proof](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnbries.pdf) ·
[Schoen–Yau, PNAS 75 (1978), p. 2567, Theorem 3](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11113-Shing-Tung_Yau_216.pdf)

In any smooth \(\gamma\) the first eigenvalue \(\mu\) of
\(-8\Delta_\gamma+R_\gamma\) is therefore negative. Its positive
first eigenfunction \(w\) would otherwise give scalar curvature
\(\mu w^{-4}\ge0\) for \(w^4\gamma\). Testing on \(w\) and using
\(3r_{\min}\le R_\gamma\) gives
\(\ell_{\rm mod}\le\ell_{\rm ord}\le\mu<0\).
[Conformal scalar formula, Lee–Parker, §1, eq. (1.1)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

There is an explicit length check on the local homogeneous
cross-section. Milnor's Corollary 6.5 realizes \(Y\) as
\(\Pi\backslash\widetilde{\mathrm{SL}}(2,\mathbb R)\).
Use the left-invariant metric \(\gamma_a\) with bracket
constants \(a,a,-a\) in a cyclic orthonormal basis for \(a>0\).
The metric descends under the left action of \(\Pi\). Milnor's
Ricci formula, with \(\mu_i=(a+a-a)/2-\lambda_i\) for bracket
constants \(\lambda_i\), gives the three Ricci curvatures
\((-3a^2/2,-3a^2/2,a^2/2)\). Thus the modified and ordinary
transverse potentials are the constants \(-9a^2/2\) and
\(-5a^2/2\), and each is the lowest eigenvalue of its
transverse operator. The corresponding obstructions are

\[
aL\ \ge\ \frac{2\pi}{\sqrt3}\quad\text{(modified)},\qquad
aL\ \ge\ \pi\sqrt{\frac{12}{5}}\quad\text{(ordinary)} .
\]

The exact retained collar charge per chirality is
\((2/3)a^4L\operatorname{Vol}_{\gamma_a}(Y)\).
Positive transitions or a cap cannot cancel the test once it
fits entirely within the strip. The fixed-\(\gamma\) failure
for long collars does not give a uniform upper bound for
unrescaled length as \(\gamma\) varies. This packet assesses
the reflected conformally product ansatz on a nontrivially
marked standard double, including any such strip in a
twisted double. It gives no positivity claim for short or
non-product collars, no immersed realization of the handle
diagram, and no qualifying exterior on a new smooth type.
[Milnor, Brieskorn manifolds, Corollary 6.5](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnbries.pdf) ·
[Milnor, Curvatures of left invariant metrics, §4, equation (4.2) and Theorem 4.3](https://core.ac.uk/download/pdf/82428733.pdf)
