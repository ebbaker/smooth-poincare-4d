# E184 — Audit of the late critical limit in the manuscript

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B89, configured
`gpt-6.2-sol` / `ultra`. Independent runtime attestation and selected lead
settings are unavailable. I authored the E176 and E180 audits and
inherited E01C, E49, E137, E140, E162 and E165. I also audited the
earlier metric combination and integration in E169 and E172.
I did not author E179, E181 or this manuscript integration. The
independent check concerns the integrated new interface and its
scope, using the assessed chain. The [request][req] and six
frozen inputs were verified. Line numbers refer to the [frozen TeX][tex].

## Disposition

**Pass with local precision edits.** The late-limit theorem matches
E179/E181, and its stronger energy dichotomy is a valid immediate
use of the assessed E177 threshold. It uses that threshold on an
unshifted late slice of the actual original path. The proof requires
neither geometric control of the shifted slices nor uniform bounds
on recovery or normalizer derivatives. All five E180 repairs are
present. No new mathematical premise or B89 escalation is needed.
[E179 proof][e179] · [E181 audit][e181] · [Combined assessment][a179].

## Local precision edits

1. **Front matter, lines 90–93 and 367–371.** Explicitly qualify
   smooth accumulation by the one fixed positive shift and smooth
   bundle normalizers. For example, write “After a fixed positive
   time shift and bundle normalization, such a sequence gives a
   smooth critical accumulation pair at the limiting energy.”
   The unshifted compactness used in the proof is positive
   \(C^0\) pair compactness. The introduction can retain the
   energy-threshold dichotomy and the abstract can retain its
   zero-energy conclusion. Both describe the actual tail in that
   case.

2. **Limit statement, lines 5533–5539 and 5550–5555.** Name
   \(K_n\) as smooth equivariant automorphisms of \(P\) covering
   orientation-preserving diffeomorphisms of \(M\). The \(C^\infty\)
   convergence is in one fixed smooth affine pair background.
   In the zero-energy clause, “the original connection–curvature
   pair” and “the smooth base is diffeomorphic to standard
   \(S^4\)” make the scope of the imported round pullback
   explicit. The proof of that clause already supplies both
   statements by applying the fixed-family theorem.

3. **Adjusted limit, lines 5565–5570 and 5591–5601.** At the
   common-slab construction identify \((\mathcal A_*,\mathcal F_*)\)
   as the compatible adjusted solution from the continuous positive
   pair limit and note smooth convergence of the adjusted pairs
   on interior positive-time strips. At the frozen generator,
   state the compatible adjusted equation
   \(\partial_s\mathcal A_*=V(\mathcal A_*)+
   \mathcal L_{\xi_*}\mathcal A_*\) and use the gradient identity
   in its directional form
   \(D\mathscr E_A[V(A)]=-\int_M|V(A)|_g^2\,dV_g\).
   That identity holds at a smooth definite slice without
   assuming the adjusted path itself solves the original equation.
   These additions make the work of the referenced argument
   explicit.

4. **Fine comparison, lines 5632–5635.** The current comparison
   is accurate. If more explicit historical wording is wanted, use
   “Fine v2 leaves the exclusion of nonperfect connection-energy
   critical points open at the end of §1.6. His §5 result
   concerns the distinct definite-triple equation.” This is
   the scope of the inherited inspection and does not advance
   a claim about the current literature.

## Native category and compactness on the supplied times

The theorem inherits one fixed smooth closed connected oriented
homotopy four-sphere, one smooth principal \(SO(3)\) bundle, the
native reconstructed Riemannian metric, negative Killing pairing
and native original time. The positive-plane and round-compatible
curvature-map sign holds throughout the supplied maximal solution.
Only \(\sup_M\Psi\) and native diameter on the same \(t_n\) are
assumed bounded. The two-bound continuation corollary would give
smooth definite continuation in the original identification if
\(T_*<\infty\). Maximality therefore forces an infinite lifespan.
This justifies all the later shifted actual times.

The reference at lines 5561–5564 is to the compactness steps,
which use the two geometric bounds but no small energy. In
native form \(k^2=4\pi/5\) and \(B=(1+4\sqrt3)P_0/k^2\).
The strain estimate \(\mathcal G\le B\) controls
\(|T|+|\nabla^AT|\le\sqrt B+B\). Positivity and trace three
give \(|q|\le\sqrt6\) without an eigenvalue floor. With
\(Z_0=\sqrt6/2+(42+8\sqrt3)B\), the positive operator block
and the scalar and trace-free Ricci bounds give
\(|W^+|_{\mathrm{op,HS}}\le Z_0\) and
\(|\operatorname{Ric}|\le3+(2+2\sqrt3)Z_0\).
The common native volume is the fixed positive initial volume,
since \(\dot\mu_A=(2/3)d\langle\dot A\wedge F_A\rangle\).
It is also the characteristic value
\((8\pi^2/3)\langle p_1(\operatorname{ad}P),[M]\rangle\)
in the native pairing.

These data meet the assessed same-base metric compactness
hypotheses. The positive \(C^1\) metric convergence, the full
strain derivative bound, simple connectivity and \(H^2(M;\mathbb R)=0\)
meet the topological pair compactness hypotheses. Consequently
the smooth equivariant normalizers \(h_n:P\to P\) act on the
same bundle and give a positive continuous compatible pair
limit of the same sign in a fixed affine background. The proof
of that proposition supplies their global lifts from the chiral
isometries. No smoothness of the unscaled metric limit is
used. The volume, metric and pair argument is applied to the
unshifted \(A(t_n)\) only. [Combined metric assessment][metrica] ·
[Fixed-family assessment][a177].

## Actual shifted path and limiting critical pair

The references to the earlier common head construction import
the correct quantifier order. Fix a compact positive value tube
about the compatible limit and choose datum, completion and
smooth graph-comparison radii there. Choose one smooth compatible
approximating reference well within both the datum and tube radii.
Fix its \(T_{\rm ref}>0\) before taking late data. The reference
need not be stationary.
The compatible adjusted limit and all late adjusted data
paths lie on the common reference slab, with smooth convergence
on compact interior positive-time strips. Each smooth datum
has an individual graph comparison at zero, identifying a
smooth adjusted path there. Thus the invariant generator is
smooth individually on \([0,\theta]\), \(\theta=3T_{\rm ref}/4\).
Compactness of the principal bundle lets
\(\dot j_n=-\xi_n\circ j_n\), \(j_n(0)=\mathrm{id}\),
integrate throughout this common closed interval. Each \(j_n\)
is equivariant with orientation-preserving base map. No common
derivative estimate on \(j_n\) is required.

For each \(n\), differentiation of pullback cancels
\(\mathcal L_{\xi_n}\mathcal A_n\) in the adjusted equation,
so \(j_n(s)^*\mathcal A_n(s)\) is the original flow from
\(h_n^*A(t_n)\). Then
\[
 (h_n^{-1})^*j_n(s)^*\mathcal A_n(s)
       =(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s)
\]
is the original flow from \(A(t_n)\). The actual trajectory
shifted to start at \(t_n\) is defined on this whole interval.
Smooth original uniqueness identifies the paths first near
zero and then through \(\theta\) by recentering at any last
common smooth slice. The curvature follows by naturality.
This verifies the actual shifted path relation at 5569–5577.

The previously derived native gradient is
\(V(A)=-4d_A^{*g}[(q-|q|^2I/6)F_A]\), with
\(D\mathscr E_A[V(A)]=-\int |V(A)|_g^2\,dV_g\).
The inherited variation differentiates the trace-square wedge
Gram using the ordinary form norm and positive volume. Its
native-clock coefficient is one. The nonnegative original
energy is nonincreasing, so \(\mathscr E_\infty\) is finite
and defined. Equivariant positive base maps conjugate the
pulled-back \(Q\) by an internal isometry and pull back its
volume form. The energy is invariant under each such map,
including time-dependent recovery at each fixed time.
Consequently
\[
 0\le\mathscr E(\mathcal A_n(s))-\mathscr E_\infty
       \le\mathscr E(A(t_n))-\mathscr E_\infty\longrightarrow0
          \qquad(0\le s\le\theta).
\]
The right bound is uniform in \(s\). Smooth adjusted
convergence in the positive value tube passes the \(Q\),
volume and energy on each fixed \(0<s<\theta\) to
\(\mathcal A_*(s)\). Its energy is exactly
\(\mathscr E_\infty\) throughout that interval.

At one such \(s\), the generator \(\xi_*(s)\) of the
smooth compatible adjusted equation is a smooth principal
invariant vector field on \(P\). Freezing \(s\) gives its
autonomous flow \(\chi_\rho\) for \(\rho\) near zero.
Equivariance follows from right invariance and ODE
uniqueness, and the induced base isotopy is orientation
preserving because it starts at identity. Thus energy of
\(\chi_\rho^*\mathcal A_*(s)\) is constant in \(\rho\).
Differentiating at zero gives
\(D\mathscr E_{\mathcal A_*}[\mathcal L_{\xi_*}\mathcal A_*]=0\).
This is a directional variation of one smooth positive
slice. The adjusted equation and the negative-gradient
directional identity give
\[
 0=\partial_s\mathscr E(\mathcal A_*)
       =-\int_M|V(\mathcal A_*)|^2_{g_{\mathcal A_*}}
                                            \,dV_{g_{\mathcal A_*}}.
\]
Smoothness and positivity imply \(V=0\) pointwise and hence
the stated critical equation. The adjusted representative
may still move by Lie transport. This argument does not
integrate a recovery of the limit from the rough trace at zero.

With \(s_0=T_{\rm ref}/2\) one has \(0<s_0<\theta\).
Set \(G_n=j_n(s_0)\circ h_n^{-1}\). Its inverse is
\(K_n=h_n\circ j_n(s_0)^{-1}\), a smooth equivariant
positive base normalizer. Since \(K_n^*G_n^*=\mathrm{id}^*\),
the normalized actual shifted pair equals the adjusted pair
at \(s_0\) exactly. Hence smooth adjusted convergence gives
the asserted smooth pair limit
\((A^\dagger,F_{A^\dagger})\) of the actual shifted slices,
with \(\mathscr E(A^\dagger)=\mathscr E_\infty\).
There is no need for convergence of either \(K_n\) or \(j_n\).

## Energy alternative and source comparison

Let \(\delta(M,P,P_0,D_0)>0\) be the assessed initial
family threshold for the specified smooth base, bundle
and two bound constants. If \(\mathscr E_\infty<\delta\), then
for sufficiently large \(n\) the original unshifted
\(A(t_n)\) satisfies both bounds and
\(\mathscr E(A(t_n))<\delta\). The strict inequality
follows from the positive gap \(\delta-\mathscr E_\infty\)
and convergence of the actual original energies. The E177
theorem applied to this one actual smooth datum gives an
original global definite tail with smooth exponential
convergence to one fixed round pullback on \(P\).
Time translation makes it a path from \(A(t_n)\)
at its original time. Recentered smooth original uniqueness
identifies its entire tail with the supplied path. Energy
is continuous under the smooth convergence to the perfect
round pair, so \(\mathscr E_\infty=0\).
The finite native time translation changes constants at
each fixed order and preserves the exponential exponent.
This clause includes \(\mathscr E_\infty=0\). If the limiting
energy is positive, it must be at least \(\delta\), and
the already constructed critical accumulation has positive
energy, hence is nonperfect. The proof uses neither bounds
on that critical limit from the selected family, nor
whole-path convergence or critical-point classification in
the positive case. [E177/E178 assessment][a177].

The comparison at 5632–5635 matches the inherited
Fine2011 arXiv:1111.5005v2 record. The end of §1.6
explicitly leaves exclusion of nonperfect critical points
unresolved for the connection energy in that source.
The §5 definite-triple result concerns a different
Euler–Lagrange problem. Neither result is used as a theorem
about the smooth accumulation pair constructed here.
No fresh inspection or claim about present novelty entered
this audit. [Canonical Fine source record][fine].

## E180 repairs and manuscript checks

All five E180 items are applied in the frozen TeX:

| Item | Verified location and scope |
| --- | --- |
| Abstract hypothesis and spectral role | Lines 86–90 say small initial supremum of the transport density, and assign the induced plane-curvature rank-one exclusion to that corollary. |
| Uniform and graph radii | Lines 5344–5352 distinguish datum and completion radii from the graph comparison radius, use compatible smooth approximation within a quarter of both radii, and fix one reference time before late data. |
| Round \(m=6\) and splice | Lines 5280–5283 and 5456–5469 give the fixed \(m=6\) round threshold, fixed-map naturality and exact splice value. |
| Source and development roles | Lines 5380–5388 cite Fine v2 §4.1, Proposition 4.2, (4.1) for the negative gradient. Lines 5414–5422 distinguish Hirzebruch's \(\langle p_1(TM),[M]\rangle=3\operatorname{sign}(M)\) at §4, p. 11, (16) from the branch's Chern–Weil contraction in ordinary two-form norms. Lines 5426–5444 give rotation-transition uniqueness and open/closed image and covering. Schoen–Yau pp. 47 and 49–50 remain a comparison for the conformal developing method. |
| Arbitrary-data scope | Line 11299 states that round entry remains to be established for arbitrary definite data in the selected component. The proved initial classes and the unresolved initialization are kept separate. |

The abstract and Introduction correctly connect zero limiting
energy with convergence of the actual trajectory. The Introduction
correctly states the positive threshold alternative and leaves
the nonperfect critical case separate. Adding the fixed-shift
and normalization qualifier in item 1 of this audit makes their
description of smooth accumulation exact. The remarks do not
claim propagation of geometric estimates, existence of qualifying
initial data on arbitrary smooth homotopy spheres, or convergence
in the positive-energy case. [E180 repair record][e180].

The comment-stripped TeX has 77 citation commands with 79
key occurrences and 37 distinct keys, all in the root catalog.
The 37 unique bibliography entries match first-citation order.
Fine is entry 10, Anderson, Wright and Bando–Kasue–Nakajima
are 28–30, and Hirzebruch and Schoen–Yau are 31–32.
The 346 labels are unique and all 445 reference occurrences
resolve. The protected section
`\section{The closed defect equation at the round connection}`
is exactly 4,501 bytes from frozen lines 7780–7907 through
the byte before the next section header. Its SHA-256 is
`c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab`.
Only the audit and return were written. Build and visual
inspection remain with the lead. [Return and identities][ret].

[req]: ../research-progress/handoffs/SP4-CME-E184_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E184_RETURN_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e180]: E180_INTRINSIC_ENTRY_MANUSCRIPT_AUDIT_20261122.md
[e179]: ../notes/179_BOUNDED_LATE_SEQUENCE_STATIONARY_LIMITS_20261122.md
[e181]: E181_STATIONARY_ACCUMULATION_AUDIT_20261122.md
[a179]: E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md
[a177]: E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md
[metrica]: E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[fine]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#follow-up-nonlinear-flow-and-singularity-evidence
