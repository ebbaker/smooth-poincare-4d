# Independent reading A of the original-flow and parameter-limit argument

26 November 2026. For Edward B. Baker III, with OpenAI Codex assistance.
Bounded execution packet BFA-E01, Reader A. Selected GPT-6.2 Sol/ultra
per the request. Actual serving model and effort were unavailable.
Analytical readback on checkout 4da586548b445ccfe9145c6a5671c0f7ecd433f3.

| Input | SHA-256 |
| --- | --- |
| Frozen attainment TeX | 60b0b09152cff7dcfd36706728651a7b97121940b5e5229cf056729d98dcfa16 |
| [Activation](../research-progress/handoffs/ACTIVATION_20261126.md) | c56c3f5c03a25f256ae395382955200d17a28b193798703422ff40987518c186 |
| [Readings](../research-progress/handoffs/READINGS_20261126.md) | 38c4a831baf7ed7945a59b3527ced073a7af21bfb9401b9c161d7b7ab896597a |
| [Scalar-deficit addendum](../research-progress/handoffs/READING_ADDENDUM_20261126.md) | c4c6c98cb40fb682503bcc0f2173c2a68767e9e81ca42773d9d8b80c50bce50e |
| [Marked necks TeX](../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex) | e9aa2e4335c9408b5fb0736c8cd2ddeed4c5b6eedd250ca1a9b9bf23ad3fc612 |

The frozen argument passes the four requested alternatives, with the
source and exposition corrections below. No fatal dependency was found
within the entered range. The supplied positive conformal class with
common chiral energy below \(8\pi^2\) remains the premise for applying the
attainment theorem to any particular smooth homotopy sphere. Rigidity of the
attained minimum above the closed critical gap is a further problem.

## Strict estimate on the physical flow

Use the real Riemannian curvature-operator norm and the ordinary norm on
Ricci. Bour's double-form curvature norm is the former. The signature is
zero on the oriented closed source, so \(F_W=2e\). The pointwise
orthogonal decomposition of the curvature operator gives
\(F_{\rm Rm}=2e+D/2+S/24\), hence \(F_{\rm Rm}=16\pi^2+D\).
With \(0<\alpha<1\), both
\(F^\alpha=2(1-\alpha)e+\alpha D/2\) and
\(F^\alpha=2e+\alpha S/24-16\alpha\pi^2\) follow. In the unit-volume
initial Yamabe representative,
\[
 S_0=Y_0^2,\qquad
 D_0=4e_0-(Y_{\rm rd}^2-Y_0^2)/12,\qquad Y_{\rm rd}^2=384\pi^2.
\]
Writing \(m=(1-\alpha)16\pi^2-F^\alpha(g_0)\) gives
\(m=2(8\pi^2-e_0)-\alpha Y_0^2/24\). For the sequence in the request,
\(m\to2(8\pi^2-I)>0\). On any slice, Gauss–Bonnet in its Yamabe
representative gives \(Y^2/24\ge16\pi^2-2e\). The functional lower
bound and \(e\le8\pi^2\) imply
\[
 (1-\alpha)16\pi^2-F^\alpha
 \le(1-\alpha)(16\pi^2-2e)\le Y^2/24.
\]
For \(e>8\pi^2\) the left side is negative. Monotonicity gives
\(Y^2\ge24m\), so continuity from \(Y_0>0\) gives the uniform positive
branch. Bour's Lemma 4.5 uses the quotient with leading coefficient one,
so its constant for \(Y^2\) must be multiplied by \(36\) here.
[Bour v1, introduction, §3 and Lemma 4.5](https://arxiv.org/html/1012.0342v1)

Every slice is therefore a competitor on \(M\). For
\(\epsilon=e_0-I\), the two functional representations give
\[
 I\le e(t)\le e_0/(1-\alpha),\qquad
 S(t)\le Y_0^2+48\epsilon/\alpha,\qquad
 D(t)\le D_0+4(1-\alpha)\epsilon/\alpha.
\]
For all sufficiently late indices these give common strict margins
below \(8\pi^2\) for each chirality and \(32\pi^2\) for \(D\), with
\(S\le384\pi^2+48\alpha\). Scale invariance of each integral in dimension
four allows constant rescalings and nonnegative exhaustion bounds. A
nonconstant conformal change preserves the two Weyl integrals. The
later Yamabe reset of an exact compactification has its own \(D\) estimate.

## Fixed positive parameter

In Bour's conventions, \(\widetilde\delta\mathrm{Rm}=-\mathsf D\mathrm{Ric}\) and
\(\delta\mathsf D\mathrm{Ric}=\Delta_{\rm B}\mathrm{Ric}+\nabla^2R/2+\mathrm{Rm}*\mathrm{Rm}\), where
\(\Delta_{\rm B}\) is nonnegative. For
\(\partial_tg=-2\operatorname{grad}F^\alpha\) the leading part, in the
analyst's Laplacian, is
\[
 \Delta_{\rm an}\mathrm{Ric}-\frac{1-\alpha}{6}\Delta_{\rm an}R\,g
 -\frac{2+\alpha}{6}\nabla^2R .
\]
This is Bahuaud–Helliwell equation (4) with \(k=1\), \(c=1\),
\(a=-(1-\alpha)/6\) and \(b=(2+\alpha)/6\). Since \(a>-1/6\), their
Theorem A gives a unique smooth short-time solution on compact smooth
data. In Bour's Proposition 2.1 the inverse pullback of \(V_{g,g_0}\)
would also pull back \(g_0\). Treating the background as fixed in that
line is a source gap. Theorem A supplies the reverse map gauge for the
particular natural system here, including continuation from a smooth
limiting metric.
[Bour v1, §§2–3 and Propositions 9.2–9.3](https://arxiv.org/html/1012.0342v1) ·
[Bahuaud–Helliwell v1, §1 and Theorem A](https://arxiv.org/html/1407.4406v1)

In Lemma 6.2, Bour's coefficient is \(c_\alpha=\alpha/2\). The cubic
terms with \(2m+2\) derivatives and quartic terms with \(2m\)
derivatives are absorbed by the positive
\(\|\nabla^{m+2}\mathrm{Rm}\|_2^2\) term using the §9 interpolation and Young
estimates. The remainder is bounded by
\(C_{\alpha,m}\|\mathrm{Rm}\|_\infty^{m+2}\mathcal R_0\). With
\(f_k(t)=\sum_{j=0}^k(c_\alpha t)^j\mathcal R_{2j}(t)/j!\),
its differentiated weights cancel the dissipation from every preceding
summand. The printed exponent \(j+2\) must be \(2j+2\). If
\(\|\mathrm{Rm}\|_\infty\le K\) on a slab, this gives
\[
 f_k'\le C_{\alpha,k}K^2(1+K^2t)^k f_k.
\]
Gronwall and the \(\mathcal R_0\) bound at the start of the slab control
all even derivative \(L^2\) energies on its positive-time interior. Odd
orders follow by integration by parts, and the Sobolev inequality
with bounded scalar term gives all pointwise derivative bounds. These
constants are allowed to depend on a fixed \(\alpha\). The argument
uses Bour's particular curvature evolution and needs no transfer of
Streets' \(L^2\) flow estimates.
[Bour v1, §§5–7, Lemma 6.2 and Propositions 9.15 and 9.21](https://arxiv.org/html/1012.0342v1)

In the bounded-curvature branch the derivative estimates give smooth
continuation at a finite endpoint. In fixed reference coordinates,
\(\partial_tg=P(g)\) and
\(\partial_t\Gamma=g^{-1}*\nabla P\) bound the changes of the metric and
connection. Integrating this last equation and differentiating inductively
with the reference connection gives spatial bounds of every order and a
smooth metric at the endpoint. Volume is preserved since
\(dF^\alpha_g(g)=0\). Noncollapse with unit volume bounds the diameter by
packing separated unit-scale balls along a minimizing geodesic. For
infinite time the exact dissipation factor is
\(\int\|\operatorname{grad}F^\alpha\|_2^2dt
=(F^\alpha(g_0)-F^\alpha(g(t)))/2\). Bour §8 omits the \(1/2\) in the
integrated line. A sequence with gradient norm tending to zero gives a
smooth critical limit after whole-manifold diffeomorphisms, with all
physical budgets and unit volume.
[Bour v1, §8, proofs of Theorems 1.9 and 1.11](https://arxiv.org/html/1012.0342v1#S8)

In the unbounded-curvature branch, let \(t_i\) be first hits of
\(Q_i\to\infty\) and choose base points where the maximum is attained.
On rescaling by \(Q_i\), time is \(s=Q_i^2(t-t_i)\). Gradient as a
covariant two-tensor scales by \(Q_i^{-1}\), its squared \(L^2\) norm
by \(Q_i^{-2}\), and \(ds=Q_i^2 dt\). Thus dissipation on a fixed
rescaled backward interval equals dissipation on the original interval
approaching the terminal time, which tends to zero. The fixed-\(\alpha\)
slab estimates started at an earlier rescaled time give derivative
bounds through \(s=0\). In smooth pointed markings of the terminal slice,
integration of the connection evolution and the metric equation gives
uniform spatial and time derivatives on the same compact sets over the
backward interval. This supplies smooth convergence up to \(s=0\),
where stationarity follows by continuity. The pointed limit is complete
and nonflat at the curvature-one base point. Its rescaled source volumes
diverge, excluding a compact pointed limit, since a whole compact
comparison would embed onto the connected source. Unit ball
noncollapse implies infinite volume. The trace is
\(\alpha\Delta_{\rm B}R/4=0\). A cutoff test on the complete limit
gives \(\int\phi^2|\nabla R|^2\le4\int R^2|d\phi|^2\). The inherited
\(S\) bound makes \(R\) a constant, and infinite volume makes it zero.
The gradient then reduces to the Bach equation. Compact Yamabe tests
give the homogeneous Sobolev inequality with the same \(y>0\).

## Marked limit, used at both occurrences

Tian–Viaclovsky's 2005 Theorem 1.1 gives differentiated curvature decay
from scalar-flat Bach-flatness, the Sobolev inequality and finite
full curvature energy. Its extra \(b_1\) hypothesis concerns the
end and chart conclusion. The 2008 Theorem 1.1 gives finitely many
order-zero ALE ends from \(o(r^{-2})\) decay, the same Sobolev inequality
and \(\mathrm{Ric}_-\in L^2\). A compact core and these finitely many product
ends imply finite \(b_1\), after which the stronger differentiated
charts in the 2005 theorem justify the input to Ache–Viaclovsky.
Their Theorem 1.2 uses \(n=4,\ k=1\) and gives order two.
[Tian–Viaclovsky 2005 v3, Theorem 1.1 and §7](https://arxiv.org/pdf/math/0310302) ·
[Tian–Viaclovsky 2008, Theorem 1.1](https://ems.press/content/serial-article-files/43177) ·
[Ache–Viaclovsky v2, Theorem 1.2](https://arxiv.org/pdf/1106.1249)

One embedding on a connected neighborhood of the entire compact
truncation supplies simultaneous collars. Small \(C^2\) errors
after the logarithmic gauge cost \(O(\eta_2^2)\) per splice on the
uncut source. The global \(E_+\) bound remains below \(9\pi^2\).
The marked-neck quotient proposition applies to this metric and
these embedded slices. Hillman allows the trivial, quaternionic
and binary icosahedral alternatives. The last is excluded by
spin signature divisibility after plumbing. For \(Q_8\) the six
order-four elements each contribute cotangent product of magnitude one
in the same orientation and the central element contributes zero,
giving \(|\eta_{\rm sig}|=6/8\). APS with product boundary and zero
side signatures then gives positive chiral difference
\(12\pi^2(6/8)=9\pi^2\) on one side. The trivial-group conclusion
comes before Gauss–Bonnet with Euclidean boundaries.
[Hillman v1, Theorem 5.2(1)](https://arxiv.org/pdf/2408.10535#page=62) ·
[Marked necks, quotient obstruction](../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex)

Cutting along all \(k\) separating spheres gives a tree of pieces.
Connectedness of the core makes its exterior neighbors distinct.
The simply connected capped pieces follow by van Kampen and the trivial
free product. Mayer–Vietoris gives vanishing \(H_2\) in every piece.
Thus the capped pieces are homotopy spheres and \(\chi(X)=2-k\).
On \(X\), scalar-flat Gauss–Bonnet reads
\(8\pi^2(2-k)=E_++E_- -D_X/2+8\pi^2 k\).
This forces \(k=1\) with the inherited strict Ricci budget.

For the exterior harmonic factor in the one-ended case, prescribe
\(a_L=L^{-2}\) on an outer truncation sphere of radius \(L\) and
positive fixed data on the inner sphere. In the analyst's sign the
function \(r^{-2}(1+r^{-\beta})\) is subharmonic and
\(r^{-2}(1-r^{-\beta})\) is superharmonic in the ALE metric at large
radius. Small and large multiples give both inequalities uniformly
in \(L\). Interior estimates give \(\Delta_{\rm Euc}a=O(r^{-6})\).
The cutoff Newton potential has a positive \(r^{-2}\) coefficient
by the lower bound. On \(|z|\le r/2\) the kernel difference is
\(O(r^{-2-\beta}|z|^\beta)\). On \(|z|\ge r/2\) the \(O(|z|^{-6})\)
source gives an \(O(r^{-4})\) contribution, including the kernel
singularity close to the evaluation point. This supplies the
remainder \(O(r^{-2-\beta})\) and rescaled elliptic estimates
differentiate it. After inversion, the \(m\)-th coefficient error is
\(O(\rho^{\beta-m})\) through \(m=5\). This meets Definition 1.6 and
Remark 7.2 in Ache–Viaclovsky, and their Theorem 1.8 gives a smooth
chart since the group is trivial. The smooth Bach tensor is zero at
the added point by continuity from conformal Bach-flatness on \(X\).
Conformal covariance of Yamabe test functions and the vanishing
\(H^1\) capacity of the added point give \(Y_N=Y_c(X)\ge y\).
[Ache–Viaclovsky v2, Definition 1.6, Theorem 1.8 and Remark 7.2](https://arxiv.org/pdf/1106.1249)

Conformal invariance and the compact homotopy sphere signature give
\(E_+=E_-=e_X\) and hence \(D_X=4e_X\). A conformally round
compactification would therefore force flat \(h\). The closed critical
gap gives \(e_X>4\pi^2\). In the gap proof, Chang–Gursky–Yang use the
full four-index norm \(8e_X\) for a homotopy sphere. Their Theorem A
gives strict recognition and Theorem B excludes the two equality
possibilities on a nonstandard homotopy sphere. Chang–Chen's
Theorem 2.1 includes equality on the standard sphere.
[Chang–Gursky–Yang, Theorems A and B](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf) ·
[Chang–Chen, published Theorem 2.1](https://web.math.princeton.edu/~chang/21Chang-Chen-nz.pdf)

Take a small normal ball in the removable chart and compare on a
larger fixed truncation containing both buffers. In the product gauge
the \(C^2\) error is \(O_\ell(s^2)+o_i(1;s,\ell)\). Raw exterior
energy is bounded above in the limit by
\(8\pi^2-\eta-e_X+E_+(N;B_s)\). First choose the buffer length to
absorb the Yamabe localization loss, then choose \(s\) small and the
comparison index large so the exterior capped energy including the
splice is less than \(4\pi^2\). The positive source Yamabe constant
enters the buffered cut in a conformally related representative, so
the source may be physical rather than Yamabe. Strict recognition
applies to the capped exterior. The local inverse comparison across
the seam extends over the parametrized cap with the radial collar
map chosen linear near the center. Palais's disk-neighborhood
extension in the standard sphere and its inverse identify the
complement with the actual deleted normal ball and glue to the
core and its inverse. Only after this oriented diffeomorphism does
the compactified class provide \(I\le e_X\). Compact exhaustion
independently gives \(e_X\le\liminf e_i\).
[Marked necks, buffered cut and marked topology](../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex) ·
[Palais, Theorem C](https://doi.org/10.1090/S0002-9939-1960-0117741-0)

## Mixed critical sequence

For a closed output retain the physical metric with \(p_j=\alpha_j\).
For a pointed output pull back the marked compactification and use a
unit-volume Yamabe representative with \(p_j=0\). The new \(D\) in the
second case is bounded by \(4e_X\) by compact Gauss–Bonnet and the
Yamabe upper bound, and thus also by the scalar-flat model's \(D_X\).
Both selections obey the same \(y,\eta,d_*\) margins and
\(I\le e(q_j)\le e_{j,0}/(1-\alpha_j)\to I\), without a selection
rule on how often each kind occurs. Positive regularization gives
constant \(R_j\) by the trace equation, and the exact Yamabe gauge
has constant \(R_j\) by construction. The constant test gives
\(R_j\ge y\) and the unit-volume \(S\) bound gives \(R_j\le C\).

The constant-scalar Euler equation in the manuscript has the correct
sign and coefficients. In Bour's Proposition 4.4 use
\(\mathring{\mathrm{Rm}}(E)=\mathring W(E)-E^2+\tfrac12|E|^2g-\tfrac{R}{12}E\)
and \(\mathrm{Ric}\circ E=E^2+RE/4\). Several quadratic terms in the
printed proof omit the square on the norm. The basic formula with
\(-p_j R_jE/12\) added to \(\operatorname{grad}F_W\) gives the printed
proposition's constant-scalar equation with principal part
\(\tfrac12\nabla^*\nabla E\). In the constant rescaling \(g=\lambda q_j\),
every term of the equation as a covariant two-tensor is multiplied by
\(\lambda^{-1}\), since \(E\) as a covariant tensor is unchanged and
\(R\) becomes \(R_j/\lambda\).
[Bour v1, Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4)

In the normalized curvature gauge, the Yamabe inequality with scalar
term at most \(C/\lambda\) gives
\(V(r)/r^4\ge [y/(4(24+C))]\big(V(r/2)/(r/2)^4\big)^{1/2}\)
for \(0<r\le1\). Iteration uses the Euclidean small-ball ratio at
each individual center and gives a uniform lower volume bound.
Cheeger–Gromov–Taylor Theorem 4.7 then gives uniform injectivity.
Use the local harmonic radius estimate with bounded Ricci and
injectivity, which has no diameter requirement for the charts.
The Anderson 1990 publisher text was access-limited. The author
survey §2 and Hebey's Theorem 1.2 give the harmonic-coordinate
estimate and the harmonic-coordinate Ricci equation.
[Cheeger–Gromov–Taylor, author-hosted scan p. 47](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/536.pdf#page=33) ·
[Anderson's discussion, §2](https://www.math.stonybrook.edu/~anderson/cargese.pdf) ·
[Hebey, Theorem 1.2](https://ndl.ethernet.edu.et/bitstream/123456789/23501/1/Emmanuel%20Hebey.pdf)

In uniform \(C^{1,\gamma}\) harmonic charts the Ricci identity controls
the metric in \(W^{2,p}\), \(p>4\). The rough-Laplacian equation for
\(E\) has uniformly elliptic principal coefficients, bounded
first-order coefficient \(\Gamma\), and zeroth-order term
\((\partial\Gamma)E\in L^p\), with \(E\) already bounded by normalized
curvature. The other source terms are bounded algebraic expressions.
The interior \(W^{2,p}\) estimate gives \(E\in C^{1,\gamma'}\).
The Ricci equation upgrades the metric first, and alternating the
two equations gives all higher derivatives on smaller balls. The
constants use \(p_j\in[0,1]\) and do not divide by \(p_j\).

At bounded unscaled curvature, the unit-volume and lower-ball-volume
bounds give bounded diameter and a whole oriented closed limit. It is
Bach-flat by \(p_j\to0\), has \(Y\ge y\), and has \(e=I\) by smooth
convergence. If the maximum unscaled curvature is unbounded, a
subsequence realizing divergence and a maximum base point give a
complete nonflat scalar-flat Bach-flat limit. Its source volumes
diverge and its scalar curvatures tend to zero. The marked limit
argument applies to these different source slices, giving
\(I\le e_X\le\liminf e(q_j)=I\). A mixed sequence with bounded and
unbounded subsequences is covered by either extraction. The selected
class minimizes the Weyl functional on the open subset of positive
Yamabe metrics on \(M\), giving the asserted second variation.

## Addendum readback and drafting discrepancies

Keeping the initial scalar deficit in the physical bound gives, at all
smooth times of a fixed late trajectory,
\[
 D(t)\le4I+4\epsilon/\alpha-(Y_{\rm rd}^2-Y_0^2)/12 .
\]
If that trajectory produces a pointed model, constant-scale invariance
and exhaustion give the same upper bound for \(D_X\). Its exact
scalar-flat identity and its same-type admissibility give
\(D_X=4e_X\ge4I\). Therefore
\(0\le Y_{\rm rd}^2-Y_0^2\le48\epsilon/\alpha\le48\alpha\).
This verifies the addendum for an initial Yamabe class whose own
original fixed-\(\alpha\) flow has the pointed output.

The frozen TeX compresses the fixed-terminal-marking argument and leaves
the outer harmonic Dirichlet values implicit. The estimates and
boundary data above supply those details. It should identify the
marked-neck proposition by its actual title and state explicitly that
the Bach tensor vanishes at the filled point by continuity. These
items leave the hypotheses and conclusions of the frozen theorem
intact. This is a same-family mathematical readback within the stated
source scope, with no independent human referee review.

## Revised manuscript and master readback

| Revised input | SHA-256 |
| --- | --- |
| Intermediate attainment TeX | 67fa6a8da4b6bb8ad5df4e6805daf6c520f8cbc01201d4f024b9528075cc658d |
| [Final attainment TeX](../manuscript/fixed_type_attainment.tex) | 719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1 |
| [Master exact closed types](../../../master/manuscript/exact_closed_types.tex) | c0a711c557f41c0db041501567589605ddd6c9c4b6d5d1c343a236df2f72a865 |

The revisions preserve each of the four alternatives and the equality
on the oriented source. In the direct positivity estimate the upper
bound \(e\le2T-m/[2(1-\alpha)]\) yields the stronger
\(Y^2\ge24m/(1-\alpha)\). The sign argument via the first eigenvalue
uses continuity on the compact source and the strictly nonzero
Yamabe constant. For the revised pointwise smoothing, if \(U\) is a
curvature derivative, then \(U,\nabla U\) first have \(L^4\)
bounds. The inequality applied to \(|U|^2\) gives \(L^8\)
because \(\|d(|U|^2)\|_2\le2\|U\|_4\|\nabla U\|_4\).
Applying this also to \(\nabla U\) gives the inputs to Bour's
Proposition 9.16 with \(m=q=8,\ p=\infty\), as specified in the
final TeX.
The expanded terminal connection argument supplies the required
common time-independent markings. The revised exterior harmonic
Dirichlet data, near and far estimates for the Newton potential,
and smooth Bach-flat extension agree with the readback above.
[Bour v1, Proposition 9.16](https://arxiv.org/html/1012.0342v1#S9)

Peters's Theorem 4.3, attributed there to Jost and Karcher, gives
the stated \(C^{1,\gamma}\) harmonic charts on compact metrics with
bounds depending on dimension, injectivity radius and curvature.
In particular the chart size uses no global diameter bound for the
rescaled metrics. DeTurck–Kazdan Lemma 4.1 and equation (4.3)
give precisely the harmonic-coordinate Ricci identity that starts
the \(W^{2,p}\) bootstrap. The author survey alternative from the
frozen readback is unnecessary in this revision.
[Peters, Theorem 4.3](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf) ·
[DeTurck–Kazdan, Lemma 4.1 and equation (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf)

The strengthened deficit inequality retaining \(4(e_X-I)\) follows
from the same physical estimate. For a source subsequence with
\(e_i\to e_{\rm src}\), subtraction on the original source gives
exterior chiral mass \(e_{\rm src}-e_X+E_\pm(N;B_s)\) after the
comparison limit. Sending \(s\) to zero next gives
\(e_{\rm src}-e_X\) for both signs. This is at most
\(e_{j,0}/(1-\alpha_j)-I\) at fixed late \(j\), and is exactly zero
in the second pointed case. The final fixed original-flow statement
uses the iterated upper limit, for which the same upper bound holds
without an energy-convergence assumption.

The master corollary follows from attainment and the finiteness
statement of the exact positive Bach-flat band. For
\(I^+(M)\le2T-\delta\), \(\delta>0\), a metric within \(\delta/2\)
of the infimum provides strict entry, including at the upper
endpoint of the band. Attainment puts the exact class into that
same closed band on the same oriented type. The explanatory flow
summary uses sufficiently late indices for the strict Ricci margin.
The final TeX identifies the neck proposition by its actual title.
No new mathematical gap appeared in the final readback.
