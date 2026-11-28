# WIN-E05 · Area bound from the fixed conformal coefficients

28 November 2026 UTC, 27 November in America/New_York. Prepared for
Edward B. Baker III with OpenAI Codex assistance. Actual serving model
and effort unavailable. Checkout
`e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. This is the fixed-marking
packet in the [frozen request R1](../../research-progress/handoffs/REQUEST_TWO_CAPS_R1.md),
SHA-256 prefix `fab10d9daf5a3eee`. The primary project inputs are
[WIN-E03 area](E03_AREA.md) `784f047d1c8ff3a5`, its
[replay](../reviews/E04_AREA.md) `f80ebf2372b9d635`,
[POLE A1](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md)
`db13563024da1a55`, and
[POLE E04](../../../01_chiral_transfer_and_pole_forms/notes/E04_REALIZATION.md)
`0dc61bfb07a67b35a`.

**Working project theorem.** For the already realized WIN-E03
Riemannian conformal class \(c_1\) and pole \(p\) on the oriented
standard smooth \(S^4\), the projective direction area has an explicit
positive lower bound in terms of the graph of the Hodge positive
plane, the flat neighborhood of the original transverse disk, and
its Taubes parameters. The estimate requires no boundary values of
the other pole forms. WIN-E03 did not specify numerical values for
the compatible graph or its flat buffer, so the result is a
coefficient-based enclosure rather than a numerical value for the
old mark. The deduction awaits a non-author replay.

## Same marking and coefficient data

Use WIN-E03's geometrically oriented Euclidean stereographic
coordinates \(x\) on \(X=S^4\setminus\{p\}\), with the fixed reflection
from inverted coordinates where needed. Write \(E_\pm\) for the
constant real Euclidean self-dual and anti-self-dual spaces. Let
\(B(x):E_+\to E_-\) be the graph map of \(\Lambda^+_{c_1,x}\) in this
flat splitting. This is the map of the fixed class. The \(c_1\)
positive planes have \(\|B(x)\|_{\mathrm{op}}<1\).
E04's realization gives a flat exterior and the WIN-E03 prescription
gives a flat open neighborhood of the closed disk \(K\). Thus \(B\)
is smooth, is compactly supported, and vanishes on a neighborhood
of \(K\). Its supremum norm is strictly less than one by compactness.
Choose coefficient bounds
\[
 b\ge\|B\|_{L^\infty(\mathrm{op})},\quad b<1,\qquad
 \operatorname{supp}B\subset\overline{B_L(0)},\qquad
 0<\ell<\operatorname{dist}(\partial K,\operatorname{supp}B).
\]
The norm at each boundary point is Euclidean and the balls
\(B_\ell(q)\), \(q\in\partial K\), are four-dimensional. The A1
leading coefficient space is identified isometrically with \(E_+\)
using the fixed compact representative \(\delta_y\) near \(p\).

## Exact inverse on flat \(L^2\)

For a constant coefficient \(\eta\in E_+\), let \(\omega_\eta\)
be its A1 pole form at this same \(c_1,p\). Split it in flat
coordinates as
\[
 \omega_\eta=\eta+u+v,\qquad u=P_+\omega_\eta-\eta,\qquad
 v=P_-\omega_\eta=B(\eta+u).
\]
Here \(v\) is compactly supported and smooth. A1 supplies
\(u=O(r^{-2})\), which tends to zero but by itself is borderline for
\(L^2(\mathbb R^4)\).

For a frequency \(\xi\ne0\) write \(n=\xi/|\xi|\) and let
\(R_n=I-2n\otimes n\) be reflection in its orthogonal hyperplane.
The Fourier closure equation \(\xi\wedge\widehat\omega_\eta=0\)
on this set means each closed two-form symbol is \(n^\flat\wedge a\)
with \(\iota_n a=0\), understood distributionally. Reflection negates
this two-form and exchanges the two Euclidean chiralities. Therefore
its positive component equals \(-R_n^*\) times its negative component.
Define \(\mathscr T:L^2(E_-)\to L^2(E_+)\) by the multiplier
\(-R_n^*\), with arbitrary value at \(\xi=0\).
Plancherel gives \(\|\mathscr T v\|_2=\|v\|_2\) because reflection
is pointwise orthogonal on two-forms. The multiplier equation
\(\widehat u=-R_n^*\widehat v\) holds off the origin, where the
constant \(\eta\) makes no contribution. Consequently
\(u-\mathscr T v\) is a polynomial, by the structure of
distributions supported at one point in Fourier space.
A nonzero polynomial has magnitude bounded below by a positive
constant on an exterior cone, using its leading homogeneous term.
Since \(u\to0\), this would contradict \(\mathscr T v\in L^2\).
Thus \(u=\mathscr T v\) globally and both corrections are in \(L^2\).

The graph equation becomes
\[
 (I-B\mathscr T)v=B\eta,\qquad
 \|v\|_2=\|u\|_2\le\frac{\|B\eta\|_2}{1-b}.
\]
The composition \(B\mathscr T\) has operator norm at most \(b\),
so the inverse is the norm-convergent
Neumann series. This controls the same A1 form, as shown by the
Fourier argument. No change of normalization, chart or class is
needed.

## Boundary enclosure and projective area

On \(B_\ell(q)\) one has \(v=0\), so \(u\) there is closed
and Euclidean self-dual. It is coclosed, hence harmonic
componentwise. Apply the mean value property and Cauchy–Schwarz
to its vector of coefficients:
\[
 |\omega_\eta(q)|\le|\eta|+
 \frac{1}{\sqrt{\operatorname{Vol}B_\ell^4}}\,
 \frac{\|B\eta\|_2}{1-b}
 =|\eta|+\frac{\sqrt2}{\pi\ell^2}\frac{\|B\eta\|_2}{1-b}.
\]
This holds uniformly for \(q\in\partial K\). If
\(P\) bounds \(\|B\eta\|_2\) for all unit \(\eta\in u_0^\perp\),
the bound is
\[
 M\ \le\ \overline M=1+\frac{\sqrt2}{\pi\ell^2}\frac{P}{1-b}.
\]
For instance, \(P=b\pi L^2/\sqrt2\) is valid, giving
\[
 \overline M=1+\frac{b}{1-b}\left(\frac{L}{\ell}\right)^2.
\]
For a representative known in coordinates one may bound \(b\)
from a certified Euclidean condition-number bound \(\kappa\)
on its positive metric matrix. In an oriented Euclidean
eigenframe with eigenvalues \(\lambda_i\), the flat chiral pair
for complementary coordinate two-planes has graph singular
value \(|1-t|/(1+t)\), with
\(t=\sqrt{\lambda_k\lambda_l/(\lambda_i\lambda_j)}\).
It lies between zero and \((\kappa-1)/(\kappa+1)\).
This makes the coarser factor \(b/(1-b)\le(\kappa-1)/2\)
available using that choice of certified \(b\).

Use the same WIN-E03 disk and unit residue \(u_0\) of the
inserted form. In its notation \(\delta=\sqrt{2\epsilon}\),
\(s=\min(2\sqrt\epsilon,R-\sqrt\epsilon)\) and the disk radius
is \(a\), with \(0<a<\min(\delta-\sqrt\epsilon,s)\). The core
model gives \(m\ge m_0=(sa-a^2)/T>0\). The nonzero disk
degree persists for projective angular distance
\(\theta<\arctan(m_0/\overline M)\). The two antipodal caps in the
unit residue sphere have total normalized area
\[
 \mu(D(c_1,p))\ \ge\
 1-\frac{\overline M}{\sqrt{\overline M^2+m_0^2}}
 \ \ge\ \frac{m_0^2}{2(\overline M^2+m_0^2)}\ >0.
\]
The last bound also avoids a subtraction when the certified
patch is small. The round value at the same pole is zero by
the WIN-E03 control.

## Optional residual estimate and what still needs to be specified

For a sharper certified enclosure, take a trial field
\(v_*\in L^2(E_-)\) supported outside the flat balls and form its
\(L^2\) residual \(e=v_*-B(\eta+\mathscr T v_*)\). Then
\(\|v-v_*\|_2\le\|e\|_2/(1-b)\). On each flat ball,
\(\mathscr T(v-v_*)\) is Euclidean self-dual and closed,
since \((I+\mathscr T)(v-v_*)\) satisfies the closure symbol and
its negative part vanishes there. It is distributionally
harmonic and thus smooth there. The
same mean-value bound gives, uniformly on \(\partial K\),
\[
 |\omega_\eta-(\eta+\mathscr T v_*)|
 \le \frac{\sqrt2}{\pi\ell^2}\frac{\|e\|_2}{1-b}.
\]
Here the displayed left side uses \(v_*=0\) on the boundary.
The coarse coefficient-only bound is already the zero-trial
case. This packet did not evaluate trial fields or residuals.

The old marking retains the qualitative flat neighborhood
and compact support from E04, but neither WIN-E03 nor its
replay records a particular numerical graph, a certified \(b<1\),
an exterior support radius \(L\), or a lower bound \(\ell\).
The Taubes form determines the constraint that \(B\) send its
flat positive component to its negative component. This
constrains one vector at each nonzero point and leaves the
action on perpendicular vectors free within the positive-plane
condition. Its exact standard tail is likewise a prescription
on the form, while \(L\) bounds the support of the chosen
conformal graph. Thus substituting the insertion's support
radius for \(L\), or the whole inner-ball margin for \(\ell\),
requires those corresponding metric prescriptions in the
realization. A finite numerical certification now needs the
actual fixed coefficient data or certified scalar bounds for
them, with numerical Taubes and disk parameters. It no longer
needs enclosures of the two unknown perpendicular pole fields.
