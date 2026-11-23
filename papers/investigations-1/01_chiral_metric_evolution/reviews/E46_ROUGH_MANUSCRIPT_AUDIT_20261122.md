# SP4-CME-E46 — Integration audit of the small continuous-data subsection

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I wrote the E38 density proof and
E43 linear audit, and worked on source provenance in E40. I did not
write E41, E42, E44 or the manuscript integration. This is a
comparison within the same investigation. The [request][req] and
[return][ret] identify the five verified frozen inputs. Line numbers
refer to the consumed manuscript, before later lead edits or addition
of the separate continuation corollary. No shared files were edited.

The statement of the fixed-reference small continuous-data result is
supported by E41–E44. The audit found proof steps to restore from the
longer derivations and two scope sentences to clarify. The needed
arguments already appear in accepted notes. No new analytic premise
is needed for the stated adjusted local theorem. [Frozen manuscript][tex] ·
[E41][e41] · [E42][e42] · [E43][e43] · [E44][e44].

## Norms, reference pairing and linear estimates

**Pass.** Lines 2562–2579 keep the fixed reference geometry and
fixed bundle connection \(D\) of the independent pair, with
\(P_0=P(x,0)\). Applying \(D\) to \(P(x,U)\) in the divergence
rewrite costs a fixed-\(x\) derivative times \(DU\) and a value
derivative applied to \(DU\) times \(DU\). The first enters \(h_1\)
and the second \(h_2\). The divergence equation therefore retains
the coefficients of E42 (1). The rank-one margin is for a real
covector and the fixed fiber pairing, extended to its complexification
for Fourier arguments. In lines 2618–2626, the frozen form is tested
on \(i\zeta\otimes\widehat v(\zeta)\). Localization by the squared
partition cancels the linear cutoff cross terms and leaves a
zeroth-order form error. This is the E41/E43 Gårding argument for
nonsymmetric coefficients. It imposes no full-array positivity.
[E41 (2)][e41] · [E43, localized energy][e43].

At lines 2585–2595 the parabolic dimension is six. With \(p>6\)
and \(q=p/2\), the upper weights \(r^{1-6/p}\) and \(r^{2-6/q}\)
give the exact factors \(r^{1-6/p}\|DU\|_p\),
\(r^{1-6/p}\|G\|_p\), \(r^{2-6/q}\|f\|_q\) of E41.
The tent weights \(r^{-2}\) and \(r^{-4}\) give the two \(L^2\)
gradient and flux terms and the \(L^1\) forcing term. Fixed
density and fixed metric balls provide uniform volume comparisons
on the selected chart scale. No extra assumption on the initial
first jet enters these norms. At 2596–2599, it would be clearer to
say “every element of \(X_T^\circ\) is represented by a continuous
section with the indicated weak spatial gradient.” This states
the completed-space identification without implying a characterization
by continuity and finite norm alone. [E41 statement][e41] ·
[E42 (3)][e42] · [E44, multiplication and trace][e44].

### Parametrix and causal passage

**Pass with an omitted proof link to restore.** The complex shift
in lines 2627–2631 bounds the Hermitian part of \(P_y(\zeta+i\eta)\)
below by \(c'|\zeta|^2-C'|\eta|^2\), by absorbing the mixed term
from the quadratic expansion. The norm-square evolution of the
matrix exponential and shift \(\eta=\kappa(x-y)/t\) give the
Gaussian of E41 (3). Each ordinary spatial derivative costs
\(t^{-1/2}\), each time derivative \(t^{-1}\). The resulting
residual after patching costs \(t^{-1/2}N_b\) at positive time.
Its leading derivative uses one coefficient difference
\(P_0(x)-P_0(y)=O(d(x,y))\) against the second spatial
derivative of the frozen kernel. Cutoffs, frame differentiation
and density terms are lower order.

At lines 2633–2637, “patch the frozen kernels using the source
density and a smooth partition” should specify a second cutoff
in \(x\), equal to one near the associated source partition
support. In each chart the kernel is a map between the two
framed fibers; its \(y\)-density factor cancels the fixed
integration density. The frozen kernel has matrix integral \(I\).
The rescaling \(y=x-\sqrt t\,z\), Gaussian tails and the
partition sum give a uniform approximate identity on
continuous sections and, by Schur and density, a strong
\(L^2\) one. Define the positive-time residual \(R\) by
\(R=(\partial_t-L)K_0\) for \(t>0\). After causal extension
the identity is \((\partial_t-L)K_0=\delta+R\). This
distinction supplies the initial term of the series and makes
its telescope valid in distributions. In particular, the
line 2635 residual bound is a positive-time estimate,
not a bound on the causal distribution including \(\delta\).

The longest-link estimate in lines 2638–2644 retains a common
Gaussian exponent and costs \((m+1)^2t^{-2}\) at the longest
link before integrating the others. The \(m\)-dimensional
simplex and powers \(\tau_0^{-k/2}\prod_{i=1}^m\tau_i^{-1/2}\)
give the exact power \(t^{(m-k)/2}\) and the stated Gamma quotient.
Only \(k=0,1\) is used in the global kernel series. A first
output derivative is justified by the integrable simplex weights.
Applying the operator to the series uses the causal identity and
distributional cancellation, with the Schur integrable tail
tending to zero. The norm of the correction to \(K_0\) is
\(O(\sqrt t)\). The fixed adjoint has the same real rank-one
coercivity, and pairing its weak solution with the forward
solution at complementary times identifies the source derivative
in (2653) with the first output derivative for the adjoint.
Energy comparison with the strong \(L^2\) trace justifies the
semigroup identification. No mixed second derivative of \(K\)
is needed. [E41, kernel construction][e41] ·
[E43, causal series and adjoint][e43].

### Duhamel, upper cylinders and completion

**Pass with details worth retaining.** At lines 2660–2666,
the early divergence forcing has \(L^1\) mass bounded by
\(r^2 Z_T(G)\) times the volume factor \(O(r^3)\), giving
\(r^5 Z_T(G)\). The late slab kernel norms scale as
\(r^{6/q'-4}\) and \(r^{6/p'-5}\), since the integrals in
\(t-s\) have powers \(2-2q'\) and \(2-\frac52p'\).
The forcing factors \(r^{6/q-2}\) and \(r^{6/p-1}\)
cancel them. The annular cover has polynomial multiplicity
and a summable Gaussian factor. The localized energy form
tests by \(\eta^2 U\) and uses Gårding on \(\eta U\).
The cross term is absorbed by the square-gradient term and
\(Cr^{-2}|U|^2\). The localized spacetime volume is
\(O(r^6)\), so the latter costs \(O(r^4\|U\|_\infty^2)\).
The same \(r^4\) factor appears in the squared tent norm,
the forcing pairings and initial energy. These are the
dimension-four E41/E43 estimates.

At lines 2668–2686, the two-derivative frozen multiplier is
bounded by accretivity, while its off-origin kernel bounds
of orders \(-6,-7,-8\) yield the integrated difference
condition. Parabolic dyadic decomposition and adjoint duality
apply the divergence term as a bounded singular integral.
The nondivergence term has \(5p'<6\) for the one-derivative
kernel in spacetime \(L^{p'}\) and
\(1+1/p=1/q+1/p'\) for Young's inequality. The scaled
coefficient difference costs \(O(r)\|Dv\|_p\) after
divergence rewriting, with the cutoff derivative terms
assigned to lower-order forcing. The upper slices in the
support are covered by radius \(r\) and \(r/\sqrt2\) balls
on \([r^2/2,r^2]\) and \([r^2/4,r^2/2]\), respectively.
The scaled powers at line 2680 are correct.

At lines 2683–2686, add the starting \(H^1\) fact for the
difference quotient argument. For smooth sources apply the
first output kernel derivative to the bounded combined smooth
source \(f+\operatorname{div}_D G\), with the integrable
time factor \((t-s)^{-1/2}\) after spatial integration.
The resulting local \(H^1\) estimates start the quotient
iteration on strictly interior time strips, independently
of the asserted upper-cylinder bound. This also makes clear
why no derivative of a singular mixed kernel integral is
being taken. [E41, upper cylinders][e41] · [E43, frozen CZ][e43].

At lines 2688–2695 the formula for smooth homogeneous data
and the same first-output-derivative estimate give the
specified uniform spatial \(C^1\) traces on the closed
slab. Approximation in that norm gives \(X_T\) approximation
since \(Z_T(Dv)\le C\sqrt T\|Dv\|_\infty\).
The two linear bounds then extend the maps into \(X_T^\circ\)
for continuous \(u_0\) and completed sources. This retains
E44's smooth-evaluation step, including uniform zero trace
for sources smooth through zero and their completion.

At lines 2696–2699, briefly expand how truncation reaches the
general finite-norm case. For each fixed \(\delta>0\), the
upper-cylinder cover gives global \(L^q\oplus L^p\) for the
truncated forces on \(s\ge\delta\). Approximation supported
above \(\delta/2\) converges in \(Y_T\oplus Z_T\) for this
truncation. Its \(Y_T\oplus Z_T\) bound is controlled by
the original forcing norms. Removing the truncation gives
uniform value convergence away from zero by the global
\(L^1\oplus L^2\) bounds and the kernel estimates, then
weak gradient passage on the defining cylinders. Pairing
with the uniformly spatial \(C^1\) adjoint test evolution
gives distributional zero trace independently of any
uniform trace. Lines 2811–2818 faithfully state the E43
example. For its source the spatial \(L^1\) mass is \(O(t)\)
and the upper-cylinder \(L^q\) norm is \(O(r^{6/q-2})\).
The heat convolution at the origin over \(s\in[t/2,3t/4]\)
is bounded below by \(ct^{-2}\int_{t/2}^{3t/4}s\,ds>c'\),
so it lies outside the completed source class. [E41, forcing and traces][e41] ·
[E43, trace test][e43] · [E44, smooth evaluations][e44].

## Contraction, lifted parameters and regularity

**Pass with two dependencies to make explicit.** The weighted
quadratic bound in lines 2724–2731 uses
\(r^{2-6/q}=(r^{1-6/p})^2\) and \(r^{-4}=(r^{-2})^2\).
The \(O(T)\) bounded-source and \(O(\sqrt T)\) first-order
factors come from the stated cylinder volumes. Difference
estimates on the \(X_T\) radius-\(R\) ball give
\(K(T+\sqrt T+R)\), as in E42 (4)–(5). The products
preserve the completions by density and the same inequalities.
The parameter-family estimates at lines 2764–2769 add
\(K|s|R\) to the source size and \(K|s|\) to its
Lipschitz constant because \(P_s-P_0=O(|U|+|s|)\).
State these additions and choose \(R\) below the fixed
parameter-chart cutoff \(s_0\), as well as the displayed
limits at lines 2737–2740. With \(T\le R^2\), \(R\le1\)
and \(|s|\le R\), the transformed Duhamel term has
\(X_T\) size at most \(4AKR^2\le R/16\) and
Lipschitz constant at most \(4AKR\le1/16\).
The larger data bound \(R/(8A)\) therefore gives image
radius \(3R/16\). The theorem uses the smaller
\(\epsilon=R/(16A)\). These constants check. The difference
bound for fixed points is \(A/(1-\vartheta)\), and the finite
top-radius cover places the difference of a weak solution and
its mild evaluation in \(L^2H^1\). The homogeneous difference
has zero uniform trace and \(\partial_\tau z\in L^2H^{-1}\).
Time regularization, Gårding and Gronwall justify uniqueness
with the prescribed trace in the same completed ball.
[E42 (6)–(8)][e42] · [E44, energy identification][e44].

At lines 2753–2763 the lifted pullback moves coordinates by
\(O(|s|t)\), is the identity at \(t=0\), and changes
\(DU\) by a bounded transformed derivative and a bounded
smooth multiplier times \(U\). On \(t\le r^2\), a fixed
number of radius-\(r\) balls covers each enlarged image
without altering the anchored time interval. The derivative
error has \(Z_T\) bound \(O(\sqrt T\|U\|_\infty)\). This
gives strong continuity from smooth density, rather than
assuming parameter differentiability of the rough pullback.
Conjugation changes the principal value coefficient by the
smooth Jacobian and fiber transport and contributes only
lower terms of first derivative degree at most two. The
distributional residual is preserved by passage from smooth
sections using the multiplication bounds.

At lines 2770–2772, explicitly invoke strong continuity
and the \(3R/16\) margin to put the lifted pullback
inside the uniqueness ball for sufficiently small \(s\).
Uniqueness only applies after this check. The placement
also persists near a datum by the uniform bounds on the
pullback and Lipschitz dependence of \(U\). The transformed
mild map is \(C^\infty\) by uniform Taylor bounds on smooth
coefficient multipliers on the bounded tube, with at most
two gradient factors in each value derivative and the same
bounded linear \(H\) for the datum. The Neumann inverse
therefore differentiates the parameter fixed point in
\(X_T^\circ\). At a fixed \(t>0\), the derivative of the
parameter-to-point map at zero is
\(s\mapsto t\sum s_\alpha V_\alpha(x)\). Four spanning
fields give the local inverse used at lines 2773–2777.
Bounded evaluation on \(X_T^\circ\) and undoing smooth
transport give joint derivative continuity in space, time,
and datum. The spatially differentiated distributional
equation has continuous right-hand sides and can be
integrated in time, then iterated for all mixed derivatives.
Finite covers give uniform convergence on compact strips
strictly inside \(0<\tau<T\). The manuscript uses \(t\)
as local time in the kernel and lift. Declaring there that
it denotes the same native time \(\tau\) avoids any clock
ambiguity. [E42, lifted parameters][e42] · [E44, derivative convergence][e44].

## Compatibility and statement boundaries

**Pass after retaining the common value neighborhood and
comparison-class check.** The density construction of lines
2780–2792 uses only continuity of the connection difference
and its local exterior derivative. To make the partition
argument explicit, subtract the original local section inside
each partition term before differentiating. Its partition
derivative multiplies the difference of the convolved
and original one-forms, which tends uniformly to zero.
Local smooth transition derivatives cancel covariantly with
the reference connection. The bracket is continuous in the
values. Hence the approximating pairs are genuinely compatible,
converge uniformly and fit the \(R/(8A)\) margin for all
sufficiently large indices. [E38, (4)–(7)][e38] · [E42][e42].

At lines 2721–2723 or 2795–2800, specify that the value tube
is chosen small enough for both the independent system and
the principal coefficients of the fixed-reference adjusted
connection equation on \(F=F_A\). The latter is a separate
open condition from Section `subsec:fixed-adjoint`. On the
graph the compatibility correction vanishes, and
\(W(x,a,F_A,Da,DF_A)\) gets its additional \(D^2a\) only
through the fixed exterior-symbol part of \(DF_A\).
Thus the principal array is controlled by values \((a,F_A)\).
This does not put a bound on the full symmetric first jet
of a smooth approximant. Its initial jet image is compact
inside the open parabolic jet region, so its own jet cutoff
and the smooth compact-bundle theorem give an individual
lifespan. At 2795–2803, add that this lift is in
\(X_\ell^\circ\) and its norm tends to its initial sup norm
as \(\ell\downarrow0\). The lift is continuous in spatial
\(C^1\) up to zero by smooth-data regularity. The derivative
cost is at most \(C\sqrt\ell\|DU\|_\infty\). This places
it in the exact completed uniqueness class on the short
comparison interval. The common rough fixed-point time \(T\)
remains independent of these individual intervals.
[E42, compatible passage][e42] · [E44, smooth comparisons][e44].

Lines 2803–2808 then apply the curvature constraint from a
positive slice where it is already zero. The coefficient
\(\|h^{-1}h_\tau\|_\infty\) in the moving-metric energy
inequality is bounded for each approximant on each compact
positive-time portion. Gronwall gives compatibility throughout
\(0<\tau<T\) for each approximant, without integrating a
bound up from zero or using one uniform in the approximant.
The \(X_T\) comparison gives uniform convergence of both
values at fixed slices. The derivative part of the curvature
formula passes by testing against the fixed smooth formal
adjoint; the bracket converges uniformly. The pointwise
identity on \(0<\tau<T\) follows from interior smoothness.
The time-zero identity is supplied. If “every slice” in
lines 2714–2716 includes the closed-cylinder top \(T\),
state the one-line closure as \(\tau\uparrow T\) using
the continuous pair. [E38, closure][e38] ·
[E42, compatible passage][e42] · [E44, positive-time constraint][e44].

The theorem does keep the solution inside its value tube for
the supplied local interval, since the solution remains in the
radius-\(R\) ball and \(R\le\rho/4\). At lines 2820–2822,
qualify the sentence about preservation to concern persistence
beyond this local interval. The recovery and incoming unadjusted
endpoint statements at 2822–2825 have the correct bounded
scope. Clarify abstract line 61 to identify the adjusted
independent-pair system and preservation of curvature
compatibility when supplied initially. Introduction lines
286–288 already identify a local construction. At line 311
allow a stated weaker regularity class as an explicit exception
to the default smoothness convention, alongside the existing
real-field convention. The initial-data and global conclusions
at 302–306 remain appropriately limited. [Frozen manuscript][tex].

## Source version and citation at dependence

**Pass with an additional direct pointer.** At lines 2581–2585
Koch–Lamm is credited for the contraction and parameter idea,
where the compact argument separates its own bundle estimates
and norms. Bibliography lines 4701–4707 separate the publication
*Mathematica Bohemica* **140**(4), 457–477 (2015), DOI
`10.21136/MB.2015.144463`, from the inspected
arXiv:1310.3658v1 of 14 October 2013. The primary preprint
§2, particularly printed pp. 4–5, was reopened on
22 November 2026. Its printed upper \(Y^0\) expression is
distinct from the displayed dimensionally scaled manuscript
norm. The manuscript does not import the source's scalar
Theorem 1.1 or treat the final journal text as inspected.
For extra clarity the bibliography can say “journal metadata
verified; final text not inspected.” The canonical record
already gives that limitation and the relevant E41–E44
consumers. [Koch–Lamm v1][kl] · [Canonical record][source].

Taylor at lines 2374 and 4693–4699 matches the canonical
1991 title, series and DOI and identifies the inspected
undated repaginated author-hosted text. Chapter 7,
Propositions 7.3.A–B, printed p. 149, were reopened
on 22 November 2026. The first uses \(H^s\) data with
\(s>n/2+2\), and the first-jet quasilinear specialization
uses \(s>n/2+1\). These are strongly parabolic vector-system
statements, and
E29 supplies the smooth compact-bundle argument using
the negative Hermitian Fourier condition. At line 2796,
keep the cross-reference to the fixed-adjoint construction
and add the Taylor §7.3 citation as its smooth-system
input at this second point of dependence. This makes
the smooth comparison's source visible without attributing
the rough theorem to Taylor. Fine's distinct citation to
Proposition 8.1 of the 2011 edition remains metadata-only
in the canonical record. No further primary theorem or
local reading copy was used. [Taylor host file][tay] · [Canonical record][source].

[req]: ../research-progress/handoffs/SP4-CME-E46_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E46_RETURN_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e38]: ../notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e41]: ../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e43]: E43_COMPACT_LINEAR_AUDIT_20261122.md
[e44]: E44_ROUGH_SYSTEM_AUDIT_20261122.md
[kl]: https://arxiv.org/pdf/1310.3658v1#page=4
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf#page=149
[source]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#further-use-of-the-same-inspected-parabolic-sources
