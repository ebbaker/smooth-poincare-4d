# E148 — Original continuation from a normalized value-convergent sequence

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E derivation under [B74][b74],
configured gpt-6.2-sol / ultra. Independent helper runtime attestation
and actual lead identifiers are unavailable. The executor authored
E138, E143 and the inherited E28 and E50 smooth correspondence/comparison
work, and did not author E140 or E142. This proof uses E138 and E140
as discharged by the frozen combined assessment. All eight listed
input hashes were verified. [Request][req] · [Combined assessment][assess].

## Statement

Fix a smooth compact closed oriented real four-manifold \(M\) and a
smooth principal \(SO(3)\) bundle \(P\to M\). Use the native negative
Killing internal metric, native original time, and the positive
curvature planes with the round-compatible curvature-map sign.
Let \(A(\tau)\) be a supplied smooth solution of the original Fine
flow on \(0\le\tau<t_*\), \(0<t_*<\infty\), in this component.
Suppose there are times \(t_n\to t_*\) and smooth equivariant bundle
automorphisms \(h_n:P\to P\), covering orientation-preserving base
diffeomorphisms, such that
\[
 A_n=h_n^*A(t_n),\qquad F_n=h_n^*F_{A(t_n)}
 \quad\hbox{converge uniformly to }(A_\infty,F_\infty)
\]
in one fixed smooth background on this bundle. Here the convergence
of \(A_n\) is in connection differences from a fixed smooth affine
origin. Assume the continuous limiting curvature is positive definite.

Then \(A\) extends smoothly and definitely past \(t_*\) in its
original fixed identification. Thus a finite maximal smooth definite
lifespan excludes such a normalized positive \(C^0\) accumulation
pair. Conversely a supplied smooth definite extension gives such a
sequence by taking \(h_n=\mathrm{id}\) and any \(t_n\uparrow t_*\).
The criterion assumes existence of the convergent pair sequence.

## One common original lifespan in a fixed reference value ball

Let \(\mathcal K\) be a compact positive range of reference
connection and curvature values in a fixed background, with the
stated chirality and curvature-map sign. On \(\mathcal K\) the
native reference metrics and pairings admit uniform comparisons
to the fixed background. For the coupled symbol fix one admissible
\(\lambda\) from the uniform closed-curvature margin and bounded
cross block of E36. The reference graph-connection symbol has the
separate positive native rank-one margin of E29. The graph symbol
at the reference is strictly positive for each unit covector and
unit amplitude in the sign convention for the negative principal
symbol. All arrays are continuous algebraic functions on the
compact reference range. Off reference equality, the graph's
principal coefficient depends only on the current and reference
pair values, by substituting \(F_A\) in the affine first-jet
expression for \(W\) and keeping the vertical adjoint metric
fixed. The least graph margin on the compact unit-symbol set then
yields a common graph comparison radius \(\rho_{\rm gr}>0\)
in the native reference sup norm. This step uses the graph symbol's
own pairing. [E138 graph passage][e138] ·
[E140 reference choice][e140] · [E142 audit][e142] · [E143 audit][e143].

Fix the common E138 datum radius \(\epsilon>0\) in the given
background \(C^0\) norm and its radius \(R>0\) in the reference
completed norm. Let \(L_0\ge1\) bound the conversion of background
sup norms to reference sup norms over \(\mathcal K\).
Take, for example,
\[
 r_{\rm data}=\min\{\epsilon/2,\ \rho_{\rm gr}/(2L_0),\
                              R/(4L_0)\}>0 .                 \tag{1}
\]
For one smooth compatible reference \((\bar A,\bar F=F_{\bar A})\)
with its values in \(\mathcal K\), E138 gives one positive
\(T_{\rm ref}\) for all data in its background \(r_{\rm data}\)
ball. The reference may be nonstationary. For every **smooth**
compatible datum in this ball, the E36/E42 adjusted solution has
smooth data at \(s=0\), strong trace in the closed-slab completion
and smoothness in the interior. The following comparison makes
it smooth at \(s=0\) as well.

For the individual smooth datum the complete initial first-jet
image is compact and inside the open strongly parabolic graph
region by (1). A cutoff supported in that region and equal to
one near the jet image permits the E29 smooth local construction
with fixed reference. Its short lifespan may depend on the
datum's entire relevant smooth bounds. The solution's curvature
lift is a smooth compatible solution of E36 on that short
slab. Write \(U_{\rm sm}\) for its pair difference from the
reference. Its completed gradient norm on \(0\le s\le\ell\)
satisfies
\[
 \|U_{\rm sm}\|_{X_\ell}
   \le \sup_{[0,\ell]\times M}|U_{\rm sm}|
        +C_{\rm ref}\sqrt{\ell}\sup_{[0,\ell]\times M}|DU_{\rm sm}|.
                                                                    \tag{2}
\]
Here \(D\) and the pointwise norm are the fixed reference ones.
The supremum term tends to the initial norm, at most \(R/4\)
by (1). The lift belongs to the closed-slab completion since its
spatial \(C^1\) norm is continuous up to zero. Hence for some
individual \(\ell>0\) it is in the \(R\)-ball, where E138's
distributional uniqueness and the restriction of the fixed point
identify it with the adjusted solution. No common lower bound
on these individual comparison times is needed. Its smoothness
on the rest of \(0<s<T_{\rm ref}\) is from E138.
[E138][e138] · [E140 smooth initial comparison][e140] ·
[Combined assessment][assess].

For the smooth adjusted path \(\mathcal A(s)\), put
\(a=\mathcal A-\bar A\), \(F=F_{\mathcal A}\),
\(\bar g=g(\bar F)\), \(g=g(F)\), and
\[
 \phi=d_{\mathcal A}^{*\bar g}a,\qquad
 \beta=d_{\mathcal A}a,\qquad
 z=S_F^*d_{\mathcal A}^{*g}\beta,\qquad
 \xi=-\phi-\chi_{\mathcal A}(z).
\]
Here \(S_Fu=\iota_u F\), \(\chi_{\mathcal A}\) is the
\(\mathcal A\)-horizontal lift, and \(\phi\) is read as an
invariant vertical generator. The compatible adjusted equation
is \(\mathcal A_s=V(\mathcal A)+\mathcal L_\xi\mathcal A\),
with \(V\) the native original vector field. Under the left action
\(h\cdot A=(h^{-1})^*A\), the infinitesimal action is
\(-\mathcal L_\xi A\). Integrate
\[
 \dot j=-\xi(\mathcal A(s))\circ j,\qquad j(0)=\mathrm{id},
 \qquad A^\sharp(s)=j(s)^*\mathcal A(s).
\]
For every fixed \(\theta<T_{\rm ref}\) the generator is
smooth on \([0,\theta]\) for this datum. The total bundle
is compact, so the smooth invariant vector field has an
equivariant flow of diffeomorphisms on all of that slab.
Invariance follows by uniqueness under right translation;
the induced base maps are orientation preserving by the
identity-start isotopy. Differentiation cancels the transport
term,
\[
 \partial_s A^\sharp
   =j^*(\mathcal A_s+\mathcal L_{-\xi}\mathcal A)
   =j^*V(\mathcal A)=V(A^\sharp),
\]
where the last step is original-flow naturality for equivariant
orientation-preserving bundle automorphisms. Thus \(A^\sharp\)
is a smooth native original solution from the datum through
\(s=0\). We may take \(\theta=3T_{\rm ref}/4\) for **all**
smooth compatible data in this ball about this reference.
This common lifespan does not estimate the derivatives of
the different recovering flows. Smooth original uniqueness
is the assessed E28/E29 comparison. [E28][e28] ·
[E140 recovery][e140] · [Combined assessment][assess].

### Continuity and the initial recovery interval

E138 supplies Lipschitz continuity in \(C^0\) data for the
**adjusted** data map into the completed space and smooth
convergence on compact interior strips. For each smooth
datum the recovered original path is smooth through its own
initial time. The argument does not estimate the recovery
based at \(s=0\) in terms of the \(C^0\) pair distance.
Smooth convergence of the adjusted pair on positive strips
does not control the initially accumulated automorphism,
whose generator uses derivatives of the adjusted pair.
Accordingly no continuity of that based original solution
map in the fixed identification for the \(C^0\) pair topology,
or original recovery from merely continuous data at zero,
is used or established here.

There is a corresponding positive-strip assertion with a
different, explicit normalization. For convergent data in
the reference ball, fix a strip
\([s_0,s_1]\subset(0,T_{\rm ref})\). The adjusted solutions
converge smoothly there by E138. The recovery generator then
converges smoothly there, and the ODE flows started at the
identity at \(s_0\) converge smoothly by ordinary
smooth ODE dependence on the compact total bundle.
For a smooth datum with recovery \(j\) from zero,
the strip recovery is \(k(s)=j(s)\circ j(s_0)^{-1}\),
so \(j(s)^*\mathcal A(s)=j(s_0)^*k(s)^*\mathcal A(s)\).
The convergent strip-normalized paths differ from the
zero-based recovered ones by time-independent maps
depending on the datum. This says nothing about convergence
of \(j(s_0)\) itself. The continuation argument below
needs only the common lifespan.

## Compatibility and one reference for the normalized sequence

Pullback curvature is natural, so \(F_n=F_{A_n}\).
Each \(h_n\) preserves base orientation and the internal
Euclidean orientation, hence each \(F_n\) has the stipulated
curvature-map sign. For a fixed smooth affine origin \(A_b\)
write \(a_n=A_n-A_b\), \(a_\infty=A_\infty-A_b\).
Then
\[
 d_{A_b}a_n=F_n-F_{A_b}-[a_n\wedge a_n]/2 .
\]
The right side converges uniformly. The left side converges
distributionally by testing against the smooth fixed adjoint.
Thus \(F_\infty=F_{A_\infty}\) distributionally. Positivity of
the limit and continuity of the sign on the nondegenerate
curvature values keep the stated sign. The fixed background
need not already be adapted to the limit. [E38 closure][e38].

The continuous endpoint graph in this fixed background is
compact. Choose a uniform closed fiber-ball tube of radius
\(r_{\rm tube}>0\) about the graph whose total space
\(\mathcal K\) remains in the positive definite region with
this sign. The limit graph has positive distance from the
tube boundary in the fixed value norm. Uniform norm
comparisons and symbol margins on this compact range give
the setup for (1), before choosing a smooth reference.
Take \(\delta<\tfrac14\min\{r_{\rm tube},r_{\rm data}\}\)
and apply E38 to pick **one** smooth compatible definite
reference \((\bar A,\bar F)\) whose pair distance to the
limit is \(<\delta\). Its values lie in \(\mathcal K\).
Fix its \(T_{\rm ref}>0\) and \(\theta=3T_{\rm ref}/4\)
as above. Uniform convergence of the normalized slices and
\(t_n\to t_*\) let us choose one \(n\) such that
\[
 \|(A_n-\bar A,F_n-\bar F)\|_{C^0_b}<2\delta<r_{\rm data},
 \qquad 0<t_*-t_n<T_{\rm ref}/2.
\]
Thus the smooth normalized datum starts the original
solution \(A^\sharp(s)\), \(0\le s\le\theta\), on a slab
long enough to cross \(t_*\) after the time shift.
The choice order fixes the radius before the approximate
reference, the reference before its time, and the time
before the incoming slice. It uses one converging sequence
and compatibility of the normalized limit. [E38][e38] ·
[E138][e138] · [E140 choice order][e140].

## Undoing the fixed normalization and matching the overlap

With this one selected \(n\), define
\[
 A_{\rm ext}(\tau)=(h_n^{-1})^*A^\sharp(\tau-t_n),
                 \qquad t_n\le\tau\le t_n+\theta .
\]
The inverse is the smooth equivariant inverse of the one
fixed automorphism \(h_n\). Because the map is independent
of time and \(V\) is natural, \(A_{\rm ext}\) solves the
native original equation. The time variable changes only by
translation. Contravariance gives
\[
 A_{\rm ext}(t_n)=(h_n^{-1})^* h_n^*A(t_n)
                      =(h_n\circ h_n^{-1})^*A(t_n)=A(t_n).
\]
In terms of the adjusted connection the same composition
is \((j(\tau-t_n)\circ h_n^{-1})^*\mathcal A(\tau-t_n)\).
No derivatives of a family indexed by \(n\) enter. Only
smoothness of the selected map, its inverse, and the
individual recovery is needed. Naturality preserves the
chosen definite sign on the full recovered slab.
[E28][e28] · [E140][e140].

The assessed smooth original uniqueness gives equality near
\(t_n\) with the supplied original path. If the supremum
of the times up to which they agreed were strictly
less than \(t_*\), the two smooth paths would agree at that
common slice by continuity. Recenter the smooth uniqueness
comparison at the shared connection to extend their equality
further. Thus they agree throughout \([t_n,t_*)\).
The overlap is an equality in the original fixed
identification. The supplied path before \(t_n\) and
\(A_{\rm ext}\) from \(t_n\) onward consequently splice
smoothly, giving a smoothly definite extension with
\(t_n+\theta>t_*\). The normalized sequence was used just
for the existence of the one late datum. The unnormalized
trajectory was not required to belong to an adjusted ball
or to converge in advance. [Combined continuation assessment][assess].

## Logical boundary

If the flow has a finite maximal smooth definite lifespan,
a sequence with the normalized positive uniform pair limit
would contradict maximality by this construction.
If it has a smooth definite extension, continuity in every
fixed background of the same bundle gives both limits
with the identity automorphisms along any increasing sequence
to the endpoint. Thus existence of the stated sequence is
equivalent to extendibility in this category. It does not supply the normalization maps or
deduce value compactness from boundedness, and it has no
varying-manifold or varying-bundle claim. No temporal strain
budget is assumed or estimated here. The native Fine,
Taylor and Koch–Lamm source roles are inherited from the
assessments, with no new primary inspection.
[Combined assessment][assess] · [Canonical source record][sources].

[req]: ../research-progress/handoffs/SP4-CME-E148_REQUEST_v1.md
[b74]: ../brainstorm/notes/B74_VALUE_COMPACTNESS_ORIGINAL_CONTINUATION_20261122.md
[e28]: 28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e38]: 38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e138]: 138_UNIFORM_VALUE_RADIUS_LOCAL_THEOREM_20261122.md
[e140]: 140_CONDITIONAL_FINITE_BUDGET_ORIGINAL_RESTART_20261122.md
[e142]: ../reviews/E142_UNIFORM_RADIUS_AUDIT_20261122.md
[e143]: ../reviews/E143_ORIGINAL_RESTART_AUDIT_20261122.md
[assess]: ../reviews/E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md

