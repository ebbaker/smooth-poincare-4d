# SP4-CME-E86 — Independent intrinsic orbit-budget audit

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored the frozen
E66 estimate and earlier E50, E63, E74 and E76 inputs underlying
parts of the manuscript. I did not author E84 or E70 or edit
the frozen manuscript. All four frozen digests matched the
[request][req] before use. This review independently checks the
transfer in E84, using the assessed E66 estimate. No primary
source was newly inspected or imported. [B50][b50] · [Return][ret].

**Disposition.** E84 passes as a conditional theorem for a
supplied smooth slice representative and, separately, for the
saturation of a neighborhood from a supplied pointed section.
The exact live Lorentz and temporal budget invariances are
correct. The initial strain threshold and budget constant
are uniform in the fixed pullback. The limit and its composition
order agree with the frozen manuscript's smooth recovery.

## Curvature and metric covariance

Use the fixed positive native round setting in E84.
Let \(A=g^*B\), where \(g\) is a smooth principal \(SO(3)\)
automorphism over an orientation-preserving \(f\), and write
\(U_x:E_x\to E_{f(x)}\) for its induced orientation-preserving
fiber isometry. Naturality of \(d+\tfrac12[\ \wedge\ ]\) on
principal connection forms gives
\[
 F_A(X_1,X_2)=U_x^{-1}F_B(Df_xX_1,Df_xX_2).
\]
This acts on the internal slot and both exterior covector
slots. In the native orthonormal internal frame convention
\(\nu_B=\tfrac13\sum_iF_{B,i}\wedge F_{B,i}\).
The change of frame preserves the sum of squares and base
pullback commutes with wedge. Hence
\(\nu_A=f^*\nu_B\) as volume forms and measures, using the
orientation of \(f\), and the positive plane satisfies
\(\Lambda^+_{G_A}=f^*\Lambda^+_{G_B}\).
For \(f^*G_B\), the Hodge star is conjugated by the oriented
tangent isometry \(Df\). Thus this metric has exactly that
plane and that volume. The frozen reconstruction uniqueness
then gives \(G_A=f^*G_B\). Both orientations are preserved,
so the curvature-map sign stays in the reference branch.

One can check \(Q\) by a bilinear form on internal vectors:
\(Q_A\) pairs \(e,e'\) by the wedge of the two curvature
forms obtained by pairing \(F_A\) with \(e,e'\), divided by
\(\nu_A\). In the pullback the corresponding internal vectors
are \(U_xe,U_xe'\); the wedge numerator and denominator
have the same base pullback. Therefore
\[
 Q_A(x)=U_x^{-1}Q_B(f(x))U_x .
\]
This uses the normalized wedge Gram matrix and the live
volume. Neither the fixed round measure nor a fixed internal
coordinate frame is required for the identity.
[E84 (1)–(2)][e84] · [Frozen manuscript, reconstruction and
native normalization][ms].

## Strain slots and the distribution function

The pullback internal connection intertwines the covariant
derivative of \(Q\). In a local frame the derivative of
\(U^{-1}Q_BU\) is combined with the transformed internal
connection, so the result is the conjugate of the original
covariant derivative with argument \(DfX\).
The positive square root, its inverse, and trace-free
projection commute with this conjugation. Thus
\[
 T(A)_X=U_x^{-1}T(B)_{Df_xX}U_x .
\]
For the derivative of \(T\), use the product connection on
\(T^*M\otimes\operatorname{End}E\). Explicitly it subtracts
\(T(A)_{\nabla_X^{G_A}Y}\) from the internal covariant
derivative of \(T(A)_Y\). The torsion-free metric
uniqueness makes \(\nabla^{G_A}\) the pullback of
\(\nabla^{G_B}\). It follows that
\[
  (\nabla^A T(A))_{X,Y}
       = U_x^{-1}(\nabla^B T(B))_{Df_xX,Df_xY}U_x .
\]
Here \(X\) is the derivative slot and \(Y\) the covector
slot of \(T\). Conjugation accounts for both endomorphism
slots. Contracting with the respective live metrics, for which
\(Df_x\) is an isometry, and the fixed orthogonal endomorphism
pairing gives both pointwise norm identities in E84 (5).
[E84 (3)–(5)][e84] · [Frozen manuscript, native strain
and derivative in the critical budget proof][ms].

Let \(t_C(x)=|T(C)(x)|_{G_C}\) and
\(m_C(\lambda)=\nu_C\{t_C>\lambda\}\).
Since \(t_A=t_B\circ f\) and \(\nu_A=f^*\nu_B\), the set
for \(A\) is the \(f\)-inverse image of the set for \(B\) and
change of variables gives \(m_A(\lambda)=m_B(\lambda)\)
for all \(\lambda\ge0\).
The E66 norm convention gives
\[
 \mathscr L(C)=\int_0^{\nu_C(M)}s^{-3/4}t_C^*(s)\,ds
             =4\int_0^\infty m_C(\lambda)^{1/4}\,d\lambda .
\]
The factor \(4\) comes from integrating \(s^{-3/4}\) up
to the distribution measure after applying Tonelli to
the rearrangement. Thus \(\mathscr L(g^*B)=\mathscr L(B)\)
exactly. Constants in reference-volume comparisons from
the static estimate play no role in this equality.
[E84 (6)][e84] · [E66 (7)][e66] · [E70, norm and live metric
checks][e70].

## Original equation and the two clocks

In the frozen manuscript the native original field is
\[
 v_{\rm F}(A)=-d_A^{*G_A}
       \left[\left(4Q_A-\tfrac23\operatorname{tr}(Q_A^2)I\right)F_A\right].
\]
The pullback commutes with \(d_A\) after transporting the
connection, and is an isometry of the respective live \(L^2\)
pairings on forms by the metric, fiber and measure identities.
Testing against arbitrary pullbacks proves the adjoint
intertwining
\(d_{g^*B}^{*G_{g^*B}}g^*=g^*d_B^{*G_B}\).
The curvature factor and trace polynomial are equivariant.
Consequently \(v_{\rm F}(g^*B)=g^*v_{\rm F}(B)\).
Along a path, fixed \(g\) differentiates by the linear
pullback on connection differences. Thus
\(A_{\rm flow}(\tau)=g^*B_{\rm flow}(\tau)\) solves
the original equation at the same native time. The
frozen short-time uniqueness statement applies at a smooth
definite datum by choosing that datum as the reference,
so it applies to \(g^*B\) without reference value bounds
on \(g^*B-A_0\). This identifies the paths on common
intervals. [E84 (7)][e84] · [Frozen manuscript,
subsec:fixed-adjoint and flow:gradient-equation][ms].

At each \(\tau\), the entire native summand
\(|\nabla T|_{G}+|T|_{G}^{2}\) pulls back as a scalar.
Its spatial supremum is unchanged because \(f\) is
onto. Thus the native budgets agree on finite time
intervals, and the nonnegative integrands give equality
at infinity by monotone limits.

For the fixed conversion \(G=c\widehat g\), \(\tau=ct\),
\(c=2K>0\), the native internal pairing is a constant
rescaling of the \(K\)-normalized pairing. In the associated
orthonormal frames it multiplies the wedge Gram numerator
and its volume normalization by the same factor, leaving
\(Q\) unchanged. An endomorphism's Hilbert–Schmidt norm
is unchanged by uniform scaling of the internal inner
product, since the orthonormal basis rescales inversely.
The rescaled Levi–Civita derivative is identical.
The native squared one-covector norm of \(T\) and unsquared
two-covector norm of \(\nabla T\) both acquire \(c^{-1}\).
Therefore \(d\tau=c\,dt\) cancels that factor in the
budget. The codifferential itself in the native equation
has factor \(c^{-1}\), by contraction with the inverse
metric, consistent with the same time conversion.
For the initial Lorentz norm, the one-covector modulus
acquires \(c^{-1/2}\), while the distribution measure
acquires \(c^2\) with argument \(c^{1/2}\lambda\).
Its fourth root contributes \(c^{1/2}\), which cancels
the change of the layer argument. The \(L^{4,1}\) norm
is thus unchanged in this four-dimensional conversion.
[E84, native budget][e84] · [Frozen manuscript,
sec:definite-flow and thm:critical-global-budget][ms].

## Thresholds, fixed pullbacks and the limit

For a supplied \(B=A_0+b\), the E66 hypothesis is exactly
\(S_0^*b=d_0^*b=0\) and
\(\|b\|_{\infty;0}+\|F_B-F_0\|_{\infty;0}\le\rho\),
with the fixed native reference and the critical localization
used in the manuscript. The frozen fixed-slice proposition
has this same statement. The slice equations and the
value tube concern the supplied representative \(B\).
The chosen \(g\) is any allowed smooth automorphism.

Take \(\epsilon_{\rm cr}\) at most the common admissible
threshold for the frozen whole-time result and its limiting
recovery corollary. With \(C_{\rm sl}\ge1\) a fixed slice
constant and \(\ell_*=\epsilon_{\rm cr}/(2C_{\rm sl})\),
the assumption \(\mathscr L(g^*B)\le\ell_*\) gives
\[
 \delta_B=\|(b,F_B-F_0)\|_{\mathcal B^{1/2}}
      \le C_{\rm sl}\mathscr L(B)
      = C_{\rm sl}\mathscr L(g^*B)
      \le\tfrac12\epsilon_{\rm cr}.
\]
This applies the critical theorem in the fixed coordinates
of \(B\). It gives \(J_{B_{\rm flow}}(\infty)\le
C_{\rm cr}\delta_B\), with the flow globally smooth and
definite. The pulled-back path therefore satisfies the
same budget exactly and has
\[
 J_{A_{\rm flow}}(\infty)\le
 C_{\rm cr}C_{\rm sl}\mathscr L(A_{\rm in}).
\]
The reference analysis uses value bounds and the assessed
operator and localization constants. Pullback preserves
the integrand supremum without any bounds on \(g\) in
those reference coordinates. Thus these thresholds and the
budget constant are genuinely uniform in all allowed fixed
smooth \(g\). The orbit transfer makes no estimate of the
fixed-reference critical norm for \(g^*B\).
[E84 (8)–(10)][e84] · [E66 (1)–(2)][e66] · [E70][e70] ·
[Frozen manuscript, prop:fixed-slice-strain,
thm:critical-global-budget and cor:critical-recovery-limit][ms].

The frozen critical-recovery corollary uses the \(m=6\)
splice, and its proof imports the smooth stable-tail
convergence. Write \(j_\infty\) for the corresponding
direct limiting automorphism for the input \(B\),
including its finite splice factor.
The representative flow tends in smooth norms to
\(j_\infty^*(A_0,F_0)\), with metric
\(\bar j_\infty^*g_0\) in the native scale. The identity
\(g^*j_\infty^*=(j_\infty\circ g)^*\)
gives the pulled-back limit connection and curvature, and
the base composition is \(\bar j_\infty\circ f\).
Thus (11) has the correct order, with the same native
round scale in the limiting metric. A fixed smooth
pullback preserves smooth convergence by continuity in
each order. Constants in those norms can depend on this
pullback's derivatives and the smooth datum. The frozen
quantitative identity-distance bound on the representative's
recovery plays no role in E84's estimate for an arbitrary
\(g\). [E84 (11)][e84] · [Frozen manuscript,
thm:round-smooth-limit and cor:critical-recovery-limit][ms].

## Conditional saturation and continuity

Retain the explicit premise of a supplied smooth local
right inverse of \((\gamma,b)\mapsto\gamma^*(A_0+b)\)
on an open smooth neighborhood \(\mathscr U_0\) of
\(A_0\), with \(b\in\mathscr X\) and pointed value
\((\mathrm{id},0)\). Its component \(B(C)=A_0+b(C)\)
depends continuously on \(C\) in the smooth topology.
By continuity of curvature as a first-jet expression,
\(\|b(C)\|_{\infty;0}+\|F_{B(C)}-F_0\|_{\infty;0}\)
is continuous and vanishes at the reference. Thus its
strict sublevel \(\mathscr U_1\) at \(\rho\) is open and
contains \(A_0\).

For each fixed \(h\) in the allowed automorphism group,
pullback is affine continuous on smooth connections with
continuous inverse \((h^{-1})^*\), by the fixed smooth
chain and product rules. It preserves the chosen curvature
orientation and sign as above. It therefore maps
\(\mathscr U_1\) to an open set. The union
\(\mathscr U_{\rm sat}=\bigcup_h h^*\mathscr U_1\) is
open, contains the round orbit, and is invariant under the
allowed group by composition and inverses.
For \(C\in\mathscr U_1\), the supplied representation
\(C=\gamma(C)^*B(C)\) gives
\(h^*C=(\gamma(C)\circ h)^*B(C)\).
Thus it is the same slice representative \(B(C)\) with
the same reference radius. Neither compatibility between
the local choices on overlapping translates nor a single
section on the union is required for this conclusion.

Finally \(\mathscr L\) is continuous in the smooth
topology of the positive definite sector. Indeed smooth
convergence of \(A_n\to A\) gives convergence of \(F\)
and \(\nabla Q\), and the reconstructed metric, inverse
square root, and volume densities converge uniformly by
smooth algebraic dependence in the definite sector.
Thus \(t_n=|T(A_n)|_{G_{A_n}}\) tends uniformly to
\(t=|T(A)|_{G_A}\), and
\(1-\eta_n\le\nu_{A_n}/\nu_A\le1+\eta_n\) for
\(\eta_n\to0\). The layer formula compares norms for a
fixed modulus across these measures by factors
\((1\pm\eta_n)^{1/4}\). In the fixed measure \(\nu_A\)
the difference of the norms of \(t_n,t\) is at most
\(\|t_n-t\|_{4,1;\nu_A}\le
4\nu_A(M)^{1/4}\|t_n-t\|_\infty\), by the triangle
inequality in the E66 convention. This proves continuity.
The strict condition \(\mathscr L<\ell_*\) therefore
gives an open subregion of the saturation containing the
round orbit, since \(Q(A_0)=I\) and \(\nabla^{A_0}I=0\).
The budget and limit also hold for points in the saturation
with \(\mathscr L=\ell_*\) by the same inclusive estimate.
[E84, conditional section and saturation][e84] ·
[B50][b50] · [E66, Lorentz norm and completeness][e66].

The audit confirms the conditional combination with a
pointed smooth section. It leaves that section as a premise
of E84. The resulting neighborhood is in the smooth
topology, with no placement result for the entire
value-small or critical basin.

[req]: ../research-progress/handoffs/SP4-CME-E86_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E86_RETURN_v1.md
[b50]: ../brainstorm/notes/B50_INTRINSIC_BUDGET_ON_ORBIT_NEIGHBORHOOD_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e66]: ../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e70]: E70_FIXED_SLICE_AUDIT_20261122.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
