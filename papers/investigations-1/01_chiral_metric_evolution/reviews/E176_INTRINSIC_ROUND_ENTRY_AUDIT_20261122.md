# E176 — Independent audit of intrinsic small-strain round entry

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B87, configured
`gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers
are unavailable. I did not author E174. I authored inherited E01C,
E49, E137, E140, E162 and E165, and contributed the E142, E147,
E158 and E169 audits. Independence concerns the new E174 combination
and its interfaces. It is not a separate audit of all its ancestors.
The [request][req] and nine frozen inputs were verified.

## Disposition

**Pass under E174's frozen \(H_{\rm small}\).** The fixed-base
compactness, common reference, smooth positive-time limit, native
defect dissipation and fixed-map splice check. No mathematical
defect or additional compactness, persistence or rough-data premise
was found. The [E171/E173 assessment][small] separately
discharges the historical \(H_{\rm small}\) premise, which remains
as written in the frozen [E174 note][e174].

One optional notation improvement is to write the round
identification on adjoint bundles as
\(\sigma_0^{-1}((df)^{-1})^*\sigma^\dagger\), where
\(\sigma_0:\operatorname{ad}P_0\to\Lambda^+_{g_0}\) is the
native round chiral isometry. This makes the target of the
isometry explicit. It is implicit in E174's definition of
the native round chiral bundle and changes no argument.

## Small data, diameter and characteristic volume

The quantification is for one fixed smooth closed connected
oriented homotopy sphere \(M\) and one fixed smooth
\(SO(3)\) bundle \(P\). The admissible initial data are
smooth, positive-plane definite and have the round-compatible
curvature-map sign in native normalization. If no positive
threshold works for the whole asserted property, then for
each threshold \(1/n\) there is a datum on this exact \(M/P\)
with \(\sup_M\Psi<1/n\) for which the property fails.
The class may be empty, in which case the threshold implication
is vacuous. Existence is not inferred from that implication.

Write \(x=|\nabla^A T|\), \(y=|T|^2\), and
\(z=|\nabla^\Gamma T|\) in the live full covariant norms.
The assessed E145 identities retained in E159 give
\(\Psi=kz+k^2y\), \(k^2=4\pi/5\), and
 \(x\le z+4\sqrt3 y\). Since \(k<1+4\sqrt3\),
\[
 \mathcal G=x+y\le\frac{1+4\sqrt3}{k^2}\Psi .
\]
The sufficient static threshold is therefore
\(\sup_M\Psi\le k^2\varepsilon_{\rm sm}/(1+4\sqrt3)\).
In the frozen premise
\[
 \varepsilon_{\rm sm}=\min\left\{\frac{\sqrt{p_*}}{72\sqrt6},
 \frac{\sqrt5}{36},\frac{3}{4(2+\sqrt3)(78+8\sqrt3)}\right\}.
\]
The first term matches E171's \(\sqrt{p_*}/(2C_{\mathcal C})\)
with \(C_{\mathcal C}=36\sqrt6\). The other two are the
plane-curvature and Ricci thresholds. The polynomial minimum
is on the specified compact trace-three simplex complement.
The bad sequence is eventually within this threshold, so
\(\|q_n\|_\infty\le72\sup\mathcal G_n\to0\) and
\(\operatorname{Ric}_{g_n}\ge\tfrac34g_n\). It also gives
\(|T_n|+|\nabla^{A_n}T_n|\le
\sqrt{\sup\mathcal G_n}+\sup\mathcal G_n\).
[Small-strain assessment][small] · [E159 assessment][geo].

The chiral bound has right side at most
\(36\mathcal G_n+6x+(42+8\sqrt3)y
\le(78+8\sqrt3)\mathcal G_n\).
With \(Z_n=(78+8\sqrt3)\sup\mathcal G_n\), this gives
\(|W^+|_{\rm op,HS}\le Z_n\),
\(|\operatorname{Ric}_0|\le2Z_n\), and
\(|s-6|\le4\sqrt3\,Z_n\). In four dimensions
\(|g|_g=2\), hence \(|\operatorname{Ric}|\le
3+(2+2\sqrt3)Z_n\). These bounds are in native units,
with the Weyl norm the Hilbert–Schmidt norm on the ordinary
self-dual two-form block. None needs \(W^-\) or a supplied
uniform \(Q\)-floor.

For any two distinct points a unit-speed minimizing
geodesic \(\gamma\) of length \(L\) exists by completeness.
Let \(E_1,E_2,E_3\) be a parallel orthonormal normal frame
and set \(V_j(u)=\sin(\pi u/L)E_j(u)\). The sum of the
fixed-endpoint index forms is nonnegative and equals
\[
 \int_0^L\left(3(\pi/L)^2\cos^2(\pi u/L)
       -\operatorname{Ric}(\dot\gamma,\dot\gamma)
                  \sin^2(\pi u/L)\right)du .
\]
The lower Ricci bound makes this at most
\(3\pi^2/(2L)-3L/8\). Therefore \(L\le2\pi\) for
all such pairs, giving the native diameter bound.

For any smooth connection on this fixed \(P\), the four-form
\(\mu_A=\langle F_A\wedge F_A\rangle/3\) is global.
Along the affine connection path between two choices,
\(\dot F_A=d_Aa\), where \(a\) is its global adjoint-valued
one-form velocity. The two degree-two wedge factors commute
under the symmetric pairing. By metricity and Bianchi,
\[
 \dot\mu_A=\tfrac23\langle d_Aa\wedge F_A\rangle
           =\tfrac23d\langle a\wedge F_A\rangle .
\]
Definiteness is irrelevant to this identity, so the
characteristic integral is shared by different initial
connections even if the affine path leaves the definite set.
At every positive definite endpoint, tracing the wedge Gram
gives \(\mu_A=dV_{g_A}\). Stokes on the closed base gives
the fixed positive volume \(v_P\) along the sequence.
In a native orthonormal frame the real adjoint trace is
\(\operatorname{tr}(\operatorname{ad}(e_i)\operatorname{ad}(e_j))
=-\delta_{ij}\). Thus the representative
\(-\operatorname{tr}(\operatorname{ad}F_A\wedge\operatorname{ad}F_A)/
(8\pi^2)\) gives \(v_P=(8\pi^2/3)\langle p_1(E),[M]\rangle\).
This matches Fine's native negative Killing normalization.
The old internal frame would give a different prefactor for
its old wedge-volume integral. [Foundation assessment][found].

## Normalized pairs and the common smooth lifespan

The assessed metric theorem applies to these smooth metrics
with their absolute Ricci and \(W^+\) bounds, common positive
volume, and diameter bound. It gives smooth orientation-preserving
maps \(\varphi_n:M\to M\) and a positive strong \(C^{1,1/4}\)
metric limit modulo them, with weak \(W^{2,8}\) in a fixed smooth
atlas. No stronger raw metric regularity is used.
[Compactness assessment][metric].

The pair step uses the given full native derivative bound,
simply connectedness and \(H^2(M;\mathbb R)=0\), as well as
positive strong \(C^1\) metric convergence. The sign makes
\(-F_n^\sharp Q_n^{-1/2}:E\to\Lambda^+_{g_n}\) a smooth
oriented isometry on each slice. Pull it back by \(\varphi_n\),
and let \(J_n:\Lambda^+_{g_b}\to\Lambda^+_{\varphi_n^*g_n}\)
be the isometry induced by the positive metric square root
relative to one fixed smooth reference \(g_b\). Comparing with
the fixed oriented \(\sigma_b:E\to\Lambda^+_{g_b}\) gives
\((\varphi_n^*\sigma_n)^{-1}J_n\sigma_b:E\to\varphi_n^*E\).
This is the adjoint-frame map of a smooth equivariant
automorphism \(h_n:P\to P\) over \(\varphi_n\). No change of
bundle or independent lifting assumption enters. The assessed
topology part yields a positive uniform pair limit in a fixed
affine background. In particular for \(a_n=h_n^*A_n-A_b\),
\[
 d_{A_b}a_n=h_n^*F_{A_n}-F_{A_b}
                         -\tfrac12[a_n\wedge a_n].
\]
The right side converges uniformly and the left side
distributionally, so the limit is compatible. Continuity
of the sign on the positive set preserves its component.
[Pair and topology assessment][geo].

The quantifier order is as in E148. First take a compact
positive value tube around that continuous compatible graph.
The tube determines a fixed coupled symbol choice, uniform
rank-one margins, norm comparisons and the common datum,
completion and graph radii. For example the datum radius
is the minimum of \(\epsilon/2,\rho_{\rm gr}/(2L_0)\) and
\(R/(4L_0)\), before selecting a reference. Choose one smooth
compatible approximate reference within a quarter of the tube
and datum radii by E38. This can be nonstationary. Fix its
reference-dependent time \(T_{\rm ref}\) and then take all
sufficiently late data. The limit datum and these data lie in
the same small ball. Their compatible adjusted solutions on
that one slab converge smoothly on compact interior positive-time
strips. This is the assessed adjusted data continuity, which
does not imply convergence of recoveries started at zero.
[Uniform radius assessment][local] · [E148][seq].

For each smooth datum the individual graph comparison gives
smoothness through zero and identifies its adjusted solution.
With \(V\) the native original velocity, the adjusted equation
is \(\partial_s\mathcal A_n=V(\mathcal A_n)+
\mathcal L_{\xi_n}\mathcal A_n\). On the compact total bundle
integrate \(\dot j_n=-\xi_n\circ j_n\), \(j_n(0)=\mathrm{id}\)
on \([0,\theta]\) with \(\theta=3T_{\rm ref}/4\). This works
for each smooth datum on the same slab because each generator
is individually smooth there. Its equivariance and identity
start give orientation-preserving base diffeomorphisms.
Differentiating \(j_n^*\mathcal A_n\) cancels the extra
Lie derivative and naturality gives the original equation.
Applying the fixed \(h_n^{-1}\) gives
\[
 A_n^{\rm loc}(s)=(j_n(s)\circ h_n^{-1})^*\mathcal A_n(s)
                  \quad (0\le s\le\theta),
\]
which has initial value \(A_n\). The time \(s_0=T_{\rm ref}/2\)
is interior both to the adjusted interval and the original head.
Neither uniform bounds on \(j_n\) and \(h_n\) nor rough recovery
of the limiting datum at zero enters. [E148][seq].

## Energy and the perfect slice

Let \(Q>0\), \(\operatorname{tr}Q=3\) and \(q=Q-I\).
The defect energy is
\(\mathcal E=\int |q|^2\mu_A=\int\operatorname{tr}(Q^2)\mu_A-3v_P\).
For a fixed smooth variation \(a\), if
\(Z_{ij}=F_i\wedge F_j\), differentiating \(Z_{ij}=Q_{ij}\mu_A\)
gives \(\dot Q\mu_A=\dot Z-Q\dot\mu_A\). Thus
\[
 \begin{aligned}
 \delta\mathcal E
 &=\int\!\left(2\operatorname{tr}(Q\dot Z)
                           -\operatorname{tr}(Q^2)\dot\mu_A\right)\\
 &=\int\!\left\langle d_Aa\wedge
                 \big(4Q-\tfrac23\operatorname{tr}(Q^2)I\big)F_A
                  \right\rangle .
 \end{aligned}
\]
The factor \(4\) uses the two curvature factors and the
derivative of the trace square. Because the second factor is
self-dual the wedge pairing is the ordinary positive two-form
pairing with \(dV_g\), with no factor from ordered \(ab\)
indices. Integration by parts yields the gradient
\(d_A^{*g}[(4Q-(2/3)\operatorname{tr}(Q^2)I)F_A]\)
for the native one-form \(L^2\) metric. Since \(d_A^{*g}F_A=0\)
by Bianchi, the term \(2IF_A\) drops out after the adjoint.
The original velocity is the negative gradient, equivalently
\(-4d_A^{*g}[(q-|q|^2 I/6)F_A]\). Therefore
\[
 \frac{d}{ds}\mathcal E(A(s))
       =-\|\partial_s A\|_{L^2(g,\mathrm{native})}^2 .
\]
In the old convention with \(g=c\widehat g\), \(c=2K\),
and \(s=ct\), the energy doubles. The derivative therefore
scales by \(2/c\). The old integrated one-form norm uses
\(dV_{\widehat g}\), and its squared velocity norm scales by
\(2c^{-1}c^2c^{-2}=2/c\), respectively from the internal
pairing, one-form norm, metric volume and time change.
This independently confirms sign and unit coefficient.
[Gradient audit][grad] · [Foundation assessment][found].

Under a smooth equivariant automorphism with a positive base
map, \(Q\) is pulled back and internally conjugated and
\(\mu_A\) is pulled back. Hence \(\mathcal E\) is invariant
under each map, including the recovery at each fixed time.
It follows that
\[
 0\le\mathcal E(\mathcal A_n(s))=\mathcal E(A_n^{\rm loc}(s))
         \le\mathcal E(A_n)\le v_P\|q_n\|_\infty^2\to0
                 \quad (0\le s\le\theta).
\]
There is no claim that the adjusted equation itself is an
original gradient equation. For every fixed \(0<s<\theta\),
smooth adjusted pair convergence permits passage in the
energy. The limiting adjusted curvature is that of the
limiting smooth connection by compatibility. Since it stays
positive, zero energy means \(Q=I\) pointwise on that slice.
The proof uses neither smoothing of the raw unscaled metric
limit nor a defect-energy law for rough data at zero. At
\(s_0\) it gives a smooth perfect \(A^\dagger=\mathcal A_*(s_0)\)
and its own smooth native metric \(g^\dagger\).

## Round identification and tail composition

At the perfect slice \(T=0\), so the assessed compatibility
inverse gives \(A^\dagger=\Gamma^+\) in the oriented chiral
labels of
\(\sigma^\dagger=-(F_{A^\dagger})^\sharp:E\to\Lambda^+_{g^\dagger}\).
Then \(F_{\Gamma^+}=-\sigma^\dagger\). The native chiral
identity gives \(W^+=0,\operatorname{Ric}_0=0,s=6\).
The scalar target is \(6\) because the native round metric
has sectional curvature \(1/2\). With the inherited
Hirzebruch signature theorem the exact integral is
\[
 12\pi^2\operatorname{sign}(M)=
 \int_M (|W^+|_{\mathrm{op,HS}}^2-|W^-|_{\mathrm{op,HS}}^2)
                   dV_{g^\dagger}.
\]
For the real curvature matrix the representative has
\(-\operatorname{tr}(\Omega\wedge\Omega)/(8\pi^2)\);
the two Hilbert–Schmidt Weyl terms remain after cancellation
of equal-norm transpose Ricci blocks and scalar blocks, with
the scalar/Weyl mixed terms zero by trace. Combining that
contraction with \(\operatorname{sign}(M)=\langle p_1(TM),[M]\rangle/3\)
gives the displayed constant in the ordinary two-form convention.
Signature zero and \(W^+=0\) force \(W^-=0\) by smoothness
and positivity of volume. Thus the full curvature operator
is \((1/2)I\). This uses the signature identity already checked
in E01C, Hirzebruch §4, p. 11, (16), in the inspected version.
[E01C source and contraction][sig].

The constant curvature Jacobi equation gives the local normal
polar metric \(dr^2+2\sin^2(r/\sqrt2)g_{S^3}\); hence there
are local oriented isometries into \(S^4_{\sqrt2}\).
A transition is determined by its value and tangent orthonormal
frame at one point. The unique agreeing rotation of the target
matches it near that point by geodesics and then everywhere
on its connected overlap piece. Rotation uniqueness gives
the cocycle law on triple overlap pieces. The chart-chain and
homotopy-square continuation from E01C now uses those rotations,
not the conformal transition group. Simple connectivity
therefore yields a global smooth orientation-preserving local
isometry \(f:M\to S^4_{\sqrt2}\). Its image is open and compact,
hence all the connected target. A proper local diffeomorphism
is a covering, and the connected source and simply connected
target make it one-sheeted. Thus \(f\) is a smooth isometric
identification of the given smooth base. This uses the checked
developing-map method, already attributed to Schoen–Yau's
conformal version in E01C, with the local round isometry
argument given here. No new primary passage was opened.
[E01C development][sig].

Let \(E_0=\operatorname{ad}P_0\) be the round adjoint bundle.
The forward chiral isometry over \(f\) sends a two-form by
\(((df)^{-1})^*\). Thus the adjoint isometry over \(f\) is
\(\sigma_0^{-1}((df)^{-1})^*\sigma^\dagger:E\to E_0\),
and the corresponding oriented-frame map is the smooth
equivariant \(\Phi:P\to P_0\). Naturality of the chiral
Levi–Civita connection gives
\(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\).
This uses the actual discovered smooth isometry and the
given definite bundle, with no auxiliary classification of
principal bundles needed.

At \(s_0\), smooth adjusted convergence on \(P\) and the
fixed \(\Phi^{-1}:P_0\to P\) yield smooth convergence
of \(((\Phi^{-1})^*\mathcal A_n(s_0),
(\Phi^{-1})^*\mathcal F_n(s_0))\) to \((A_0,F_0)\)
on \(P_0\). These data are smooth compatible and enter the
assessed fixed \(C^0\) value basin for large \(n\). Let \(B_n(u)\)
denote their smooth global original round-basin solutions in
native time \(u\). With the single fixed map
\[
 L_n=\Phi\circ j_n(s_0)\circ h_n^{-1}:P\longrightarrow P_0 ,
\]
contravariance gives
\[
 L_n^*B_n(0)=(\Phi^{-1}\circ L_n)^*\mathcal A_n(s_0)
       =(j_n(s_0)\circ h_n^{-1})^*\mathcal A_n(s_0)
       =A_n^{\rm loc}(s_0).
\]
The same identity holds for curvature. Naturality for this
time-independent round identification and translation
\(u=s-s_0\) make \(L_n^*B_n(s-s_0)\) an original path on
\(P\). Smooth uniqueness, recentered at any common slice,
identifies both paths on their whole overlap \([s_0,\theta]\).
Thus they splice smoothly into the global original path from
\(A_n\). Its slice at \(s_0\) enters the round value basin under
\(L_n\), not just under a comparison of adjusted metrics.
[Round small-value assessment][basin] · [E148][seq].

The assessed smooth limiting recovery gives a fixed smooth
equivariant automorphism \(j_{n,\infty}:P_0\to P_0\) with
smooth inverse and original limit \(j_{n,\infty}^*(A_0,F_0)\)
on \(P_0\). The original limit on \(P\) is
\[
      (j_{n,\infty}\circ L_n)^*(A_0,F_0).
\]
This is one fixed equivariant round identification for the
datum. Relative to the round reference \(\Phi^*(A_0,F_0)\)
on \(P\), the fixed automorphism is
\(\Phi^{-1}\circ j_{n,\infty}\circ L_n\).
Fixed smooth pullback and a finite native time translation
preserve the exponential exponent \(\lambda_1(G_0)/2\);
the constants at each fixed order can depend on the datum
and comparison maps. No time-dependent normalization of the
asserted limit remains. [Smooth limit assessment][limit].

Every sufficiently late member of a supposed bad sequence
therefore has the whole required property. This gives a
non-effective \(\epsilon(M,P)>0\) for the fixed smooth
\(M/P\), with the empty-class case as above. The existence
of qualifying data supplies a smooth diffeomorphism to round
\(S^4\). The audit supplies no initialization, uniformity
across bases or bundles, uniform datum-independent high-order
constants, or initial pair value approximation to the round
orbit. Its entry is at positive time. Only the frozen and
inherited source records were used. [Return and hashes][ret].

[req]: ../research-progress/handoffs/SP4-CME-E176_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E176_RETURN_v1.md
[e174]: ../notes/174_CONDITIONAL_INTRINSIC_SMALL_STRAIN_ROUND_ENTRY_20261122.md
[small]: E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md
[metric]: E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[geo]: E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
[local]: E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[seq]: ../notes/148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md
[found]: E01_FOUNDATION_ASSESSMENT_20261122.md
[grad]: E01A_AUDIT_20261122.md
[sig]: E01C_AUDIT_20261122.md
[basin]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[limit]: E76_E77_SMOOTH_LIMIT_ASSESSMENT_20261122.md
