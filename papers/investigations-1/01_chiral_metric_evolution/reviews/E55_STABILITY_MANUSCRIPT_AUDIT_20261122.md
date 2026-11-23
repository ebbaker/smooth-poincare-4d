# SP4-CME-E55 — Round stability manuscript integration audit

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I wrote E50 and E51 and earlier
source and integration audits. I did not write E47–E49 or the
manuscript integration. This is an internal audit of transcription
and scope, with prior participation. The [request][req] and
[return][ret] identify all six frozen inputs, which matched before
use. Line numbers refer to the frozen TeX. No shared edit or
build was made.

The assessed notes support the fixed-gauge stability theorem and
the round small-value corollary. The main corrections are to the
description of live versus reference operators, the differentiated
Galerkin norm, and the explicit graph-space and weak comparison
premises. The weighted constants, round kernel argument and
automorphism splice check. [Frozen manuscript][tex] ·
[Lead assessment][lead].

## Native conventions, fixed gauge and full Hessian

**Pass after correcting two descriptions of operator dependence.**
Lines 2903–2908 agree with the normalization at 1692–1703 and
E47. Relative to the manuscript pairing, the positive
negative-Killing pairing doubles the curvature volume to
\(4K^2dV_{\widehat g_0}\). In dimension four this gives
\(g_0=2K\widehat g_0\). The two-form covariant adjoint scales
by \((2K)^{-1}\), with unchanged normalized \(Q\), giving
native time \(\tau=2Kt\). For the earlier round representative
of sectional curvature \(K\), the sectional curvature of
\(g_0\) is \(K/(2K)=1/2\). Leaving it denoted by the fixed
native \(\kappa\) is correct.

At line 2909 narrow “All norms and adjoints” to the fixed
Sobolev and uniform norms and the reference gauge adjoints.
The physical vector field at line 2950 uses the live
\(d_A^{*g_A}\). One precise replacement is “The estimates use
the fixed reference norms. The gauge adjoints
\(\delta_0\) and \(S_0^*\) are fixed, while the physical
gradient uses \(d_A^{*g_A}\).”

With \(a=A-A_0\), the expression at 2918–2921 is exactly
\(v(A)-d_A\delta_0a-S_A\Delta_0S_0^*a\).
The infinitesimal action at 2925–2933 satisfies
\(R(\phi+\chi_Au,A)=-d_A\phi-S_Au\).
Putting \(\phi=-\delta_0a\) and \(u=-\Delta_0S_0^*a\)
makes \(R(\xi_{\rm st},A)\) the sum of the two positive
correction terms, so the manuscript sign in subtracting it
is correct. Both outer variations \(\delta d_A\) and
\(\delta S_A\) multiply zero inputs at \(a=0\).

At lines 2935–2952, the numerator derivative of the normalized
wedge Gram matrix is \(2L_0(d_0b)\), with relative volume
derivative \(\tfrac23\operatorname{tr}L_0(d_0b)\), hence
\(DQ(A_0)b=2\Pi_0L_0d_0b\). At \(Q_0=I\),
\(B_0=2I\), \(\dot B=4\dot Q\), and
\(L_0^*M=MF_0\). The physical input
\((B_A-2I)F_A\) vanishes at the reference by this identity.
Consequently the variation of the live adjoint against it
is zero and the full physical derivative is
\(-8d_0^*L_0^*\Pi_0L_0d_0\). The \(P_0=\sqrt8\,\Pi_0L_0\)
factor and \(G_0\) at 2946–2948 match E47 and E48. At
2950, “The bracketed two-form vanishes” avoids confusion
with a Lie bracket.

At lines 3070–3075, “The outer \(d_A,S_A\) are algebraic”
misstates the order of \(d_A\). The exact split is
\(-d_A\delta_0a=-d_0\delta_0a-[a,\delta_0a]\).
The first term has two derivatives and a fixed top coefficient.
The second has at most one derivative of \(a\). In the
horizontal term, \(\Delta_0S_0^*\) differentiates \(a\)
twice at most and the outer \(S_A\) is algebraic in \(F_A\).
For the physical term, the live codifferential differentiates
the curvature input or metric coefficients once, and all their
undifferentiated multipliers are smooth in \((x,a,F_A)\).
Using the fixed exterior-symbol map from \(D^2a\) into
\(DF_A\) gives exactly the quasilinear form at 3071.
Replace the sentence at 3074 with this derivative accounting.
[E47, normalization and Hessian][e47] · [E48, (1)–(6)][e48] ·
[E51, checked inputs][e51].

## Positive symmetric round operator and trace

**Pass with the graph premises made explicit.** Lines 2975–2989
match the rank-one quadratic symbol in E47. For nonzero \(\xi\),
self-dual projection of \(\xi\wedge \xi^\perp\) is an
isomorphism, since its kernel would give a nonzero simple
anti-self-dual two-form. This verifies surjectivity after
symmetrization and removal of trace. The wedge identity and
the absence of intersection between \(\operatorname{im}S_0\)
and \(\xi\otimes E\) give exactly the seven-dimensional first
kernel. The two remaining nonnegative terms test orthogonality
to those images. The whole symbol is strict by compactness of
the unit covector and unit amplitude sets. The proof uses the
fixed rank-one pairing.

Lines 2991–3016 preserve the round global kernel argument.
The energy identity first gives \(\nabla S_0^*b=0\).
If \(v=S_0^*b\ne0\), then \(R(X,v)v=\kappa|v|^2X\)
for \(X\perp v\), contradicting parallelism. In the parallel
decomposition of \(T^*_{\mathbb C}\otimes E_{\mathbb C}\),
the image of \(S_0\) is \(S^-\otimes S^+\), leaving
\(V_{\mathbb C}=S^-\otimes\operatorname{Sym}^3S^+\).
The two targets in the manuscript occur once each in
\(T^*_{\mathbb C}\otimes V_{\mathbb C}\), through the
trivial channel in \(S^-\otimes S^-\). Invertibility of the
pair symbol on \(V\) shows that neither projection vanishes.
Since the identifications are parallel, the comparison is
of full first-order operators with no zeroth-order term.
The sign at 3007 follows from
\(R^S_{ij}=-\kappa c_i c_j/2\) and \((c_ic_j)^2=-I\).
Each of six pairs gives \(+\kappa/2\). The twisting
curvature is self-dual in the base slots. With
\(\omega=c_1c_2c_3c_4=+I\) on \(S^-\) in the chosen
orientation, the self-dual Clifford action vanishes there,
as in \(c_1c_2+c_3c_4=c_1c_2(1-\omega)\).
Thus \((D^-)^*D^-=\nabla^*\nabla+3\kappa I\) and the
kernel is zero on this round sphere. The compressed proof
retains the decisive chirality and parallel-map facts.
[E47, symbol and round square][e47] · [E51, round kernel][e51].

At lines 3018–3028 the local freezing and difference quotients
give the lower form bound, elliptic regularity and \(H^2\)
operator domain. Smooth eigenvectors and compact resolvent
follow from the fixed closed form. The graph and geometric
Sobolev norms agree at even orders by elliptic iteration,
and at odd orders by
\(\|J^{k+1/2}b\|_2^2=\|J^kb\|_2^2+q[J^kb]\).
The proof as written supplies the integer scale. In the
lemma at 2957–2960 say “for each integer \(m\ge1\)” and
include \(a_{\rm in}\in H^m\) and
\(e^{\alpha\tau}f\in L^2H^{m-1}\). E47 originally states
the linear estimate for an integer \(m\ge6\) for the
nonlinear application. The displayed spectral proof works
for every integer \(m\ge1\); a real-index statement would
need an interpolation argument. The nonlinear theorem
retains \(m\ge6\).

Specify that
\(e^{\alpha\tau}a\in C_b([0,\infty);H^m)\cap L^2H^{m+1}\)
and \(e^{\alpha\tau}a_\tau\in L^2H^{m-1}\) for the
distributional derivative. This gives a strong representative
at each time, as needed for the restarts. For
\(b=e^{\alpha\tau}a\), the increasing spectral ratio
\((\lambda-\alpha)/(1+\lambda)\) yields the exact
\(\theta\) at 3032. Pairing the forcing and solution in
opposite orders \(m-1,m+1\) yields the inequality at
3034–3038. Young's inequality, integration and the
equation then give the stated estimate, including the
weighted derivative since
\(e^{\alpha\tau}a_\tau=b_\tau-\alpha b\).
The graph trace argument at 3043–3051 correctly uses
finite projections, their differences, and the
\(L^2H^{m+1}\), \(L^2H^{m-1}\) bound for the derivative
pairing. This avoids the distinct printed trace-space
mismatch examined by E47 and E51. [E47, graph and trace][e47] ·
[E51, weighted realization][e51].

## Weighted fixed point and smooth comparison

**Pass with an exact energy-norm correction and compressed
regularity details to restore.** At 3076–3090, with
\(s=m-1\ge5\), the jet is controlled in \(H^s\) by
\(\|a\|_{H^m}\). In the composition derivative only one
factor can have derivative order \(\ge s-2\), since
\(2(s-2)>s\). The other factors retain at least \(H^3\)
and are bounded in dimension four. The leading remainder
is a linearly vanishing coefficient multiplying \(D^2a\),
and the lower remainder is quadratic in the jet.
In the difference, put \(D^2(a-b)\) in \(H^s\) or put
\(D^2b\) there and estimate the coefficient difference in
\(H^s\). This verifies the displayed two-term bound and
the derivative allocation, including \(m=6\).

At 3092–3109 each product places the time weight only on
its \(L^2H^{m+1}\) factor. In the difference this high
factor may be \(a-b\) or \(a,b\), according to the term.
The two resulting sums fit the stated \(M\) bound.
The map on the closed ball has size at most
\(C_{\rm lin}\eta+C_{\rm lin}MR^2\le3R/8\) and
Lipschitz constant \(2C_{\rm lin}MR\le1/4\).
Its fixed-point norm satisfies
\(\|a\|_X\le C_{\rm lin}\|a_{\rm in}\|_{H^m}
+\|a\|_X/8\), giving \(8C_{\rm lin}/7\).
The constants transcribe E49. The theorem's small
\(H^m\) assumption on a smooth initial connection
already puts its jet in the definite tube. The fixed
connection is stationary and no extra initial
derivative bound is assumed. [E48, remainder][e48] ·
[E49, weighted contraction][e49].

At 3111–3137, choose a fixed smooth jet cutoff equal to
one on a neighborhood of the entire weighted solution
jet, supported in the open uniformly parabolic region.
Use convex interpolation of the leading coefficient to
\(g_0^{ij}I\) and cut off the lower term. The weighted
solution solves the same fixed cutoff equation as the
finite-dimensional approximations. At lines 3117–3127,
define
\(\Lambda=(I+D^*D)^{1/2}\) and
\(E_k(u_N)=\|\Lambda^k u_N\|_2^2\).
For even \(k\), \(\Lambda^k\) is differential with
scalar principal symbol. The projections commute with
it and drop from the energy pairing. This is the
differentiated graph norm. Replacing it by an arbitrary
equivalent \(H^k\) norm inside a time derivative does
not follow from norm equivalence.

The compact proof uses Gårding on \(\Lambda^k u_N\)
with bounded coefficient \(C^1\) norms. At fixed
\(\|u_N\|_{C^2}\le M_2\), the composition estimate gives
a coefficient \(H^k\) norm of size
\(C_{k,M_2}(1+\|u_N\|_{H^{k+1}})\). The commutator
uses the Lipschitz coefficient against
\(\|D^2u_N\|_{H^{k-1}}\) and the coefficient \(H^k\)
norm against \(\|D^2u_N\|_\infty\). Fixed matrix lower
terms have order \(k-1\) before composition with \(D^2\)
and cost no more than \(k+1\) derivatives of \(u_N\).
Young's inequality then gives the displayed energy
inequality in the exact graph norm. The Taylor inputs
and the finite-chart construction agree with E49.

At 3133–3137 the common-time statement uses a first-exit
argument. A short version is to record
\(E_6(u_N(0))\le C_6R^2\) and choose threshold
\(2(1+C_6R^2)\). Below it \(H^6\hookrightarrow C^2\)
gives the common \(M_2\). Then the energy inequality
bounds \(1+E_6\) by
\((1+C_6R^2)e^{C_{6,M_2}\tau}\), excluding a first hit
for a fixed sufficiently short time. This makes the
dependence only on \(H^6\) visible. The higher bounds
hold on the same interval and use each datum's higher
norms only in their constants. The projected time
derivative has an \(H^{k-2}\) bound from the equation.
Interpolation and compact embedding give convergence
in \(C_\tau H^{k-1}\) for a diagonal sequence. The
equation then gives time regularity up to zero from
spatial continuity at all orders.

At 3139–3147, explicitly say both paths solve the same
fixed cutoff equation. Subtract with leading coefficient
evaluated at the weighted path. The leading coefficient
difference times the smooth comparator's \(D^2u\) is
linear in \(w,Dw\) with bounded coefficients by the
mean-value formula. A finite-slab difference has
\(w\in CH^m\cap L^2H^{m+1}\) and
\(w_\tau\in L^2H^{m-1}\). Time regularization makes
the \(L^2\) pairing legitimate. The coefficient along
the weighted path is spatially \(C^1\), so after
Gårding and Young's inequality the comparison obeys
\(\partial_\tau\|w\|_2^2\le C\|w\|_2^2\).
Zero strong trace at the start of each slab gives
equality. The comparator is thereby inside the
agreement region. On overlapping half-length restarts,
the new initial datum is smooth from the previous
comparison and its \(H^6\) norm is uniformly bounded
from the weighted \(C_bH^m\) representative. This
justifies the smooth all-time claim and its initial
regularity without a uniform higher-norm assumption.
[E49, cutoff construction and comparison][e49] · [Lead assessment][lead].

## Small-value transfer and scope statements

**Pass.** Lines 3152–3184 use small connection and actual
curvature values relative to one fixed round reference.
The pair \((A_{\rm in},F_{A_{\rm in}})\) supplies the
initial compatibility required by E42. Its smooth
comparison at that reference is individual. In the
joint value tube its on-graph principal coefficients
are controlled, so the smooth construction uses
a cutoff surrounding its own compact initial jet image.
The smooth lift lies in the completed ball on a short
interval by continuity and its gradient seminorm
bound \(C\sqrt\ell\sup|DU|\). Uniqueness identifies it
with the E42 path there. This provides smoothness at
zero for each smooth input. The time of that comparison
may shrink with the higher initial norms.

The smoothing time \(\tau_0=T/2\) is fixed
from the common E42 interval. Its zero datum is
stationary because \(Q_0=I\), the physical multiplier is \(B_{A_0}=2I\),
Bianchi holds and both gauge inputs vanish. Continuous
dependence of all derivatives on a compact positive-time
strip makes \(\widehat A(\tau_0)\) \(H^m\)-small as
the datum tends uniformly to the round pair. The
curvature condition gives strict definiteness for the
small datum and on the common local interval.
The corollary can explicitly state a single \(B_0\)
and a smooth path \(h\) on \([\tau_0,\infty)\) at
3160–3162, to make the quantifier in the estimate
unambiguous. A fixed \(\epsilon\) and \(\tau_0\)
suffice for all such smooth data.
[E42, smoothing and individual comparison][e42] · [E50, transfer][e50].

The recovery at 3186–3209 matches E50. For either
adjustment \(v-R(\xi,A_{\rm adj})\), solve
\(\dot j=-\xi(A_{\rm adj})\circ j\) and \(g=j^{-1}\).
Time-dependent smooth invariant fields on the compact
frame bundle exist on every finite interval of the
given adjusted path. At 3190 specify the “right-trivialized
velocity of \(g\)” as \(\operatorname{Ad}_g\xi\);
\(\ell(g^{-1})_*\dot g=\xi\) is its left-trivialized
form. The infinitesimal action cancels and gives the
physical equation. Taking \(c=g_{\rm loc}(\tau_0)\)
aligns the stable tail to the local branch at the splice
by the left product \(c\,g_{\rm st}\). The local
recovery deliberately exists a little past \(\tau_0\).
Smooth uniqueness recentered at \(c\cdot B_0\)
therefore gives a right overlap of actual trajectories,
which makes the splice smooth. The inverse is ordered
\(g_{\rm st}^{-1}c^{-1}\), so its action yields exactly
the stable path at the same time. These are the
compositions in E50 (10)–(12). The estimate requires
neither a uniform recovery bound at zero nor a limiting
automorphism. [E50, exact action and splice][e50] · [E52][e52].

Abstract line 61 and introduction 289–294 keep the
fixed round basin, smooth datum, both value closeness
conditions, and convergence modulo time-dependent
automorphisms. They are consistent with the corollary.
The outstanding-challenges text at 4885, 4895–4903 and
4909–4916 leaves the appropriate general intrinsic
strain, preservation, concentration and initialization
questions open. The concluding line 4916 can say
“linear Ricci correspondence” to preserve the
transverse-traceless scope. The precise limits at
3212–3217 also check.

## Primary references

The source identity at 4983–4987 is Joel Fine,
arXiv:1111.5005v2, revised 29 November 2011. I reopened
the statement of Theorem 4.11 on 22 November 2026,
which has an initial definite connection small in
\(L_k^2\), an integer \(k\ge3\), and a perfect reference
on a compact four-manifold. Its conclusion is stated
modulo bundle automorphisms. Source dependence at
2910–2913, 2932–2933 and 3014–3016 is correctly
separated into stability precedent, action signs,
and the Dirac identification. Fine's printed live
gauge and half-line trace discrepancy were checked in
E47/E48/E51. The manuscript uses a separately
specified fixed gauge and graph-space proof.
At lines 224–226 and 1770–1771, use “Fine states”
for the general source results, keeping the
already assessed distinction between those statements
and the corrected implementation given here.
This wording leaves the stated source scope and the
separately proved round conclusion intact.
[Fine v2, §§4.2–4.3][fine] · [E51][e51] · [Canonical record][source].

At 3120–3123 and 5083–5089 the Taylor citation is the
undated, repaginated author-hosted text of the
1991 monograph, DOI `10.1007/978-1-4612-0431-2`
for the original publication. On 22 November 2026
I reopened (3.1.18)–(3.1.20), printed p. 66, and
Proposition 3.6.A, (3.6.14), printed p. 94. The first
uses bounded values, smooth coefficient derivative
bounds of order above \(s\), and a smoothing remainder.
The commutator is used for \(p=2,\sigma=0,s=k\),
on the scalar principal part in fixed charts, as in
E49. These support the two tame bounds, while the
fixed compact-bundle evolution and the \(H^6\) restart
are supplied in the derivation. No new source version,
full-paper reading or retained PDF is asserted.
[Taylor host file][tay] · [Canonical source record][source].

[req]: ../research-progress/handoffs/SP4-CME-E55_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E55_RETURN_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[lead]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e48]: ../notes/48_FIXED_STABILITY_GAUGE_20261122.md
[e49]: ../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e51]: E51_STABILITY_INPUTS_AUDIT_20261122.md
[e52]: E52_STABILITY_TRANSFER_AUDIT_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2#S4.SS3
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
[source]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#taylor-composition-and-commutator-input-for-stability
