# Independent half-flat replay · SP4-CUT-LED-E09

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI
Codex assistance. The [request][request] specifies Sol/ultra for the
independent reader. Actual backend model and reasoning effort were
unavailable for independent verification. Checkout
`bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`.
The reviewed [E07 note][e07] had SHA-256
`ed52d8b16e616f0b0c4c5235a7cf7fe8b46b6ad93150349bada125213fe82ad3`.
The [Berger eta input from E01][e01] had SHA-256
`d7d9df641d6999356e1b3dc2f4c4008ce3a368b04dd5ad180b14dba113d83be0`.

The smooth obstruction, the stated piecewise-smooth \(C^3\) extension
and the \(C^{2,1}\) reflected Pedersen example withstand replay. In the
parent energy normalization the double has
\(e=8\pi^2[k/(1+k)]^2\), strictly between \(0\) and \(8\pi^2\) for
\(0<k<\infty\). This is the energy of the \(C^{2,1}\) metric on standard
\(S^4\), computed from smooth pieces. Its curvature satisfies the two
opposite half-flat equations on the open sides, while its distributional
Bach tensor has a nonzero surface term.

## Smooth metric

Use one orientation on the connected boundaryless Riemannian
four-manifold. For a variation supported in a coordinate ball in
one side, the difference of chiral energies on that ball is
\(4\pi^2\int p_1\). Its first variation vanishes by the relative
Chern–Weil identity because the metric and connection are fixed near
the boundary. The argument does not use the sign of the boundary
correction in the ledger. The vanishing block has zero first
variation, including variation of the norm and volume, because it
is differentiated as a squared norm at zero. Hence the sum and
the full four-index Weyl functional both have zero first variation.
The compactly supported Euler–Lagrange equation is \(B=0\) by
Bahuaud–Guenther–Isenberg–Mazzeo, §1 through (1.1). This local
use follows also by extending the metric from a neighborhood of
the support to a closed four-manifold and using the same variation
there. Continuity gives \(B=0\) on the seam. The argument is
unchanged on the other side or on interchanging the two labels.
[Weyl first variation][var]

Lassas–Liimatainen Theorem 2.2 gives interior conformal harmonic
coordinates of class \(C^{r+1}\) for nonintegral \(r>2\) as specified
there, and smooth coordinates for a smooth metric. Theorems
1.3(c) and 3.7(c) give a real-analytic determinant-normalized
representative when \(n=4\), \(r>3\) and the weighted obstruction
tensor is zero. In their convention \(B=\mathcal O_{(4)}\) by
(26)–(28). Analyticity of the local positive-definite metric makes
its curvature operator and the oriented Hodge projector
\(\tfrac12(1\pm *)\) analytic in the same chart. Analytic identity
then propagates each chiral vanishing across any chart meeting
the corresponding nonempty open vanishing set. The set where
the block vanishes in a neighborhood is open and closed. The
conformal scale in a new chart changes each Weyl endomorphism by
a positive factor, so the argument is intrinsic and needs no
analytic cut or global analytic gauge. Theorem 3.8 of the source
states full-Weyl continuation. The blockwise step uses its
regularity premise rather than taking that conclusion as input.
[Lassas–Liimatainen, §§2 and 3.2][ll]

The compact simply connected case has a developing map to the
standard sphere by the conformally flat atlas. A local
diffeomorphism from a compact manifold is proper, with open
and closed image, and so is a covering onto \(S^4\). Simply
connectedness of the target makes it a diffeomorphism. An
umbilic cut of the resulting homotopy sphere has piece
signatures zero, since the intersection pairing on each piece
factors through the intersection pairing of the ambient sphere.
Product replacement with zero trace-free second fundamental form
then gives \(\eta=0\). Neither curvature positivity nor an energy
bound is used to prove the smooth obstruction. [Schoen–Yau,
p. 47 and §1][sy] · [APS I, Theorem (4.14)][aps] ·
[Source audit][sources]

## Piecewise-smooth \(C^3\) metric

With smooth one-sided extensions and matching three-jets in a
smooth atlas, the third derivatives are locally Lipschitz. In
a flattened seam chart, integrate the bounded piecewise fourth
derivatives along segments on each side and use continuity at
the cut. The weak fourth derivatives have no measure term.
Equivalently the Weyl tensor and its first covariant derivatives
are continuous at the seam, so the second covariant divergence
has the classical piecewise values and no extra surface term.
In this regularity range that divergence is a geometric
distribution. Changing to a \(C^{4,\alpha}\) conformal harmonic
chart preserves the \(C^{3,\alpha}\) metric regularity for
\(0<\alpha<1\) and the zero distribution by change of variables
in its first-order weak divergence formulation for \(\nabla W\).
Thus (27)–(28), Proposition 3.5 and Theorem 3.7(c) apply, for
example with \(r=7/2\). The argument gives Weyl-flatness for the
stated piecewise-smooth \(C^3\) gluing. The assumption that all
third derivatives agree is stronger than the boundary datum.
[Lassas–Liimatainen, §3.2][ll]

## Pedersen compactification and seam

Checked equation (7.14), printed p. 43, and the continuation
on p. 44 of Pedersen's 1985 thesis. The explicit coefficient
functions are those of E07 after multiplication by
\((1-\rho^2)^2\). For a check at the origin, put
\(A=(1+k\rho^2)/(1+k\rho^4)\), \(B=1+k\rho^2\),
\(C=(1+k\rho^4)/(1+k\rho^2)\) and let \(\delta\) denote
the Euclidean polar metric with unit round angular factor.
The compactification is
\[
 B\delta+(A-B)d\rho^2+(C-B)\rho^2\sigma_3^2.
\]
Here \(A-B=O(\rho^4)\) and \(C-B=O(\rho^2)\) with smooth
even coefficients after dividing by the indicated powers.
Both \(\rho\,d\rho\) and \(\rho^2\sigma_3\) extend smoothly in
Cartesian coordinates. Thus the metric is smooth and equals
\(\delta\) at the center. In the collar the further positive
rescaling divides by \(\rho^2(1+k\rho^2)\) and is extended as
one near the center. It gives the unit normal form
\[
 dt^2+\sigma_1^2+\sigma_2^2+q(\rho(t))\sigma_3^2,\qquad
 q=\frac{1+k\rho^4}{(1+k\rho^2)^2},\quad
 D_t=fD_\rho,\quad f=\rho\sqrt{1+k\rho^4},
\]
where \(t<0\) on the first ball near the boundary and \(t=0\) on it.
The conformal compactification and further rescaling preserve the
vanishing Weyl block. The self-dual Einstein metric is Pedersen's.
The jet comparison and reflected double are deductions from his
formula. [Pedersen, Chapter I, §§6–7][ped]

Writing \(d=1+k\), direct differentiation at \(\rho=1\) gives
\[
 q=\frac1d,\quad q_\rho=0,\quad q_{\rho\rho}=\frac{8k}{d^3},
 \quad q_{\rho\rho\rho}=\frac{24k(1-3k)}{d^4},\qquad
 f=\sqrt d,\quad f_\rho=\frac{1+3k}{\sqrt d}.
\]
Consequently \(q_t=0\), \(q_{tt}=8k/d^2\), and
\[
 q_{ttt}=f^3q_{\rho\rho\rho}+3f^2 f_\rho q_{\rho\rho}
        =\frac{48k}{d^{5/2}}.
\]
On the identity double the angular metric is \(h(-|t|)\) in a
smooth signed collar. Tangential and mixed derivatives are
controlled by the common smooth angular coframe. The zero
first derivative and the reflected even second derivative
give \(C^{2,1}\) across the cut. The third derivatives differ,
since \(\partial_t^3h(0^+)=-\partial_t^3h(0^-)\) and the
displayed coefficient is nonzero for \(k>0\). The cut is
totally geodesic because \(B=h'/2=0\) in the outward direction
on the first ball and also in the opposite outward direction
on the second. Choose the common orientation on the doubled
manifold. Reflection is an orientation-reversing isometry and
interchanges \(\Lambda^+\) and \(\Lambda^-\), so it exchanges
the two chiral vanishing equations and their energies. The
continuous Weyl tensor is zero on the seam because the
restriction of each block vanishes there.

To check that the halves are genuinely nonflat, write
\(D=h'''(0^-)\) and let \({}^\circ\) use \(h(0)\). The intrinsic
Ricci derivative and derivatives of terms quadratic in \(h'\)
vanish at \(t=0\). With the sphere-positive curvature-operator
sign the Gauss normal formula gives \(R'_{i0j0}=-D_{ij}/2\),
\(\operatorname{Ric}'_{ij}=-D_{ij}/2\),
\(\operatorname{Ric}'_{00}=-\operatorname{tr}D/2\) and
\(R'=-\operatorname{tr}D\) on the first side. Since \(h'(0)=0\),
differentiating the Schouten subtraction gives
\[
 (W_{i0j0})'(0^-)=-D_{ij}^\circ/4,\qquad
 (W_{i0j0})'(0^+)=+D_{ij}^\circ/4.
\]
The trace-free part of a nonzero multiple of
\(\sigma_3^2\) is nonzero. The opposite blocks are therefore
nonzero near the seam in their respective open sides. In (27),
with two covariant divergences, terms with fewer than two
normal derivatives cannot give a surface measure for the
continuous \(W\). The tangential components get the singular
part \(\tfrac12D^\circ_{ij}\delta_{t=0}\), up to the overall
Bach sign convention, from the jump in
\(\partial_t W_{i0j0}\). Here \(\delta_{t=0}\) is the delta
in the common unit normal coordinate. Each open half is
Bach-flat. This surface term tests the weak Bach equation
separately from the a.e. chiral equations. [Bach divergence
formula (27)][ll]

## Exact energy on the weak double

The boundary in outward-first orientation has Berger ratio
\(v=q(1)=1/(1+k)\). In the orientation
\(\sigma_1\wedge\sigma_2\wedge\sigma_3>0\) for the
Maurer–Cartan sign \(d\sigma_i=2\sigma_j\wedge\sigma_k\) of
E01, its eta is \(+\tfrac23(1-v)^2\). The normalized
coframe of the round model is unique up to the isometric
choice and common scale of the invariant basis. If the
boundary orientation is reversed, the value is negative.
Thus orientation conventions on the preliminary Pedersen
coordinates are unnecessary for the absolute value
\[
 |\eta|=\frac23\left(\frac{k}{1+k}\right)^2.
\]
The smooth closed ball used as a piece has signature zero and
\(B^\circ=0\). Its curvature-operator energy difference is
\(12\pi^2\eta\) by product replacement with the same boundary
metric and zero boundary transgression. Hence positive eta
in the stated orientation puts the surviving energy in \(W^+\),
with \(W^-=0\). Reversing orientation exchanges these statements.
The nonzero block on either ball contributes
\[
 12\pi^2|\eta|=8\pi^2\left(\frac{k}{1+k}\right)^2,
\]
so each piece has half this value of \(e_V\). Their sum equals
each chiral energy on the reflected double. The smooth-ball
calculation suffices because the seam has zero four-volume
and the two opposite blocks are exchanged by reflection.
The proof uses neither a signature theorem for the weak global
metric nor a smoothing of the glued metric. The strict
inequality at every finite \(k>0\) is an energy statement.
[Berger eta in E01][e01] · [APS I, Theorem (4.14)][aps]

[request]: ../research-progress/handoffs/E09_REQUEST_R1.md
[e07]: ../notes/HALF_FLAT.md
[e01]: ../notes/FS_BALLS.md
[sources]: ../references/PRIMARY_20261127.md
[var]: https://arxiv.org/html/2508.06633v1#S1
[ll]: https://arxiv.org/html/1912.08030v2
[sy]: https://math.jhu.edu/~js/Math646/schoen-yau.conformal.pdf
[aps]: https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf
[ped]: https://people.maths.ox.ac.uk/hitchin/files/StudentsTheses/pedersen.pdf#page=53
