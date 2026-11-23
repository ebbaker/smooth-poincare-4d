# E159 — Geometric late-sequence continuation

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E composition under B80, configured
helper launch gpt-6.2-sol/ultra. Independent runtime attestation
and lead settings were unavailable. I authored the inherited
E09 curvature estimate and audited E137, E148 and E155 in E139,
E150 and E156, respectively. This composition uses the separate
lead assessments of E154 and E155/E156. The topology version
below treats \(H_{\rm top}\) as an explicit conditional premise.
[Request][req] · [B80][b80].

## General fixed-base criterion

Let \(M\) be a fixed smooth compact closed connected oriented
real four-manifold, and \(P\to M\) a fixed smooth principal
\(SO(3)\) bundle. Suppose \(A(\tau)\) is a supplied smooth
solution of the original Fine equation on \(0\le\tau<t_*\),
where \(0<t_*<\infty\), in the component with positive
curvature planes and the round-compatible curvature-map sign.
Use native time, the native negative Killing internal pairing
and the reconstructed Riemannian metric. Let \(t_n\) be times
in this interval with \(t_n\to t_*\), and put
\[
 A_n=A(t_n),\qquad F_n=F_{A_n},\qquad g_n=g_{A_n}.
\]
Assume there are constants \(D_0\ge1\), \(P_0\ge0\),
\(i_0>0\) and \(d_0<\infty\) such that for every \(n\)
\[
 \sup_M\mathscr D_n\le D_0,\qquad
 \sup_M\Psi_n\le P_0,\qquad
 \operatorname{inj}(M,g_n)\ge i_0,\qquad
 \operatorname{diam}(M,g_n)\le d_0.                              \tag{1}
\]
Here \(\mathscr D_n(x)\) is the supremum over the complete
unit source fiber of the largest-to-smallest tangent stretch
ratio of \(u\mapsto Q_n^{1/2}u/|Q_n^{1/2}u|\), with the two
stretches at the same direction. The native real quantity
is
\[
 \Psi_n=\|D_{\Gamma_n}\mathcal R_n\|_{L^2_f}
                      +\|\mathcal R_n\|_{L^2_f}^{\,2},
 \qquad (\mathcal R_n)_X(f)=P_f(T_n)_Xf .
\]
The horizontal derivative uses the \(\Gamma_n\)-horizontal
lift on the target unit round sphere and the live
Levi–Civita derivative on the existing base slot. The fiber
area is \(4\pi\); tensor norms square-sum the live base
slots before taking the fiber \(L^2\) norm. Injectivity
radius and diameter are those of the native \(g_n\).

Then \(A\) extends smoothly and definitely past \(t_*\)
in its original fixed identification. In particular, at a
finite maximal smooth definite lifespan in this component,
every sequence tending to its endpoint fails at least one
of the simultaneous uniform bounds (1).
[E137][e137] · [E145][e145] · [Sequential criterion][sequential].

## Explicit native Ricci and strain bounds

At a point of one slice write \(x=|\nabla^A T|_g\),
\(y=|T|_g^2\), \(z=|\nabla^\Gamma T|_g\),
\(C_0=4\sqrt3\) and \(k=\sqrt{4\pi/5}\). The exact
real fiber moments and the native commutator estimate
of E145 give \(\Psi=kz+k^2y\) and
\(|z-x|\le C_0 y\). Since \(k\le1+C_0\),
\[
 x+y\le z+(1+C_0)y
      \le \frac{1+C_0}{k^2}\,\Psi .
\]
Consequently (1) gives
\[
 B=\frac{(1+4\sqrt3)P_0}{k^2},\qquad
 \sup_M(x+y)\le B,\qquad
 \sup_M\bigl(|T|_g+|\nabla^AT|_g\bigr)\le\sqrt B+B .              \tag{2}
\]
The pointwise calculation is on the positive trace-three
cone. The commutator factor and the moments have no lower
eigenvalue assumption. [E145, (3)–(6)][e145].

Here is the curvature normalization for the Ricci input.
In the old convention \(F_A=-KS\widehat\Sigma\) as an
internal column, with \(S=Q^{1/2}\) and the
norm-\(\sqrt2\) self-dual triple \(\widehat\Sigma\).
The native internal orthonormal curvature components
gain \(\sqrt2\), since the native pairing is twice the
old bracket-frame pairing. Put \(c=2K\).
Then \(g=c\widehat g\) and
\(\tau=ct\), with \(Q\) unchanged. With
\(\sigma=c\widehat\Sigma/\sqrt2\), the native triple is
unit orthonormal self-dual, and the native curvature
has components \(F_A=-S\sigma\). In the corresponding
orthonormal component arrays
\(F_\Gamma+\sigma=\sqrt2(F_\Gamma^{\rm old}
                        +K\widehat\Sigma)\).
The ordinary two-form norm scales by \(c^{-1}\)
in its base slots. The curvature-operator, live Ricci
and scalar norms also have inverse-metric degree one,
so the old scalar target becomes \(12K/c=6\).
In particular the E137 pointwise identity and bound are
\[
 \begin{aligned}
 \mathfrak B_+(g)
 &=\left(|W^+|_{\rm op,HS}^2
           +\tfrac14|\operatorname{Ric}_0|_g^2
           +\tfrac1{48}(s_g-6)^2\right)^{1/2}
   =\tfrac12|F_\Gamma+\sigma|_{g,\mathrm{native}},\\
 \mathfrak B_+(g)&\le
 Z:=\tfrac12|Q-I|+6x+(42+8\sqrt3)y .                           \tag{3}
 \end{aligned}
\]
This is the old floor-free chiral bound divided by \(c\).
The coefficient on \(|Q-I|\) is \(K/c=1/2\).
The two strain terms scale by \(c^{-1}\) in their
base slots, so their coefficients are unchanged.
Equation (3) is local on any definite slice in the
stated component, independently of E137's separate
round-basin time estimate. It uses the positive
chiral curvature operator block, not \(W^-\).
[E137, (12)–(13)][e137].

Since the eigenvalues are positive and sum to three,
\(|Q-I|^2=\operatorname{tr}(Q^2)-3\le6\).
Equations (2) and (3) give the uniform constant
\[
 Z_0=\frac{\sqrt6}{2}+(42+8\sqrt3)B,\qquad Z\le Z_0 .            \tag{4}
\]
In dimension four
\(\operatorname{Ric}=\operatorname{Ric}_0+(s_g/4)g\)
and \(|g|_g=2\). Equation (3) gives
\(|\operatorname{Ric}_0|\le2Z_0\) and
\(|s_g-6|\le4\sqrt3\,Z_0\). Therefore
\[
 |\operatorname{Ric}_{g_n}|_{g_n}
       \le K_{\rm Ric}:=3+(2+2\sqrt3)Z_0                     \tag{5}
\]
on every selected slice. This is an absolute
Hilbert–Schmidt tensor norm bound and in particular
controls both sides of the Ricci operator. The constant
\(3\) comes from \(|(6/4)g|_g=3\). The distortion,
injectivity and diameter assumptions do not enter
this derivation of \(K_{\rm Ric}\).

The exact fiber ratio identity gives
\(\mathscr D^2=\lambda_{\max}(Q)/\lambda_{\min}(Q)\).
Using \(\lambda_{\max}\ge1\), its bound in (1) gives
the independent floor \(Q_n\ge D_0^{-2}I\).
Conversely a floor \(m I\) gives
\(\mathscr D\le\sqrt{3/m}\) on this cone. The floor is
used only for the positive pair compactness step.
[E137, (2)–(3)][e137] · [Static pair assessment][static].

## Metric normalization and original continuation

Apply the assessed Anderson R29 input to the smooth
metrics \(g_n\) on this one fixed closed manifold \(M\).
The exact theorem used is in the undated author-hosted
*Cheeger-Gromov theory and applications to general
relativity*, Definition 1.1 p. 2, Theorem 2.2,
hypotheses (2.3) and proof pp. 4–6. The three input
bounds are (5), \(i_0\), and \(d_0\), all in the live
metric. This supplies a subsequence and smooth
diffeomorphisms \(\psi_n:M\to M\) such that
\(\psi_n^*g_n\) converges strongly in \(C^{1,\alpha}\)
to a positive metric on the fixed smooth base, for
one fixed \(0<\alpha<1\), for instance \(\alpha=1/2\).
Only strong \(C^1\) convergence is used below. No
volume hypothesis, curvature bound beyond Ricci, or
varying-smooth-type theorem is invoked.
[E154 source check][e154] · [E154 assessment][metric] ·
[Canonical R29][r29].

On the connected oriented base each normalizer has
one orientation sign. Pass to a subsequence with
the same sign. For positive sign use
\(\varphi_n=\psi_n\). If all reverse orientation,
fix one member \(\psi_{n_0}\) and take
\(\varphi_n=\psi_n\circ\psi_{n_0}^{-1}\). Then
\(\varphi_n\) is orientation preserving, and
\[
 \varphi_n^*g_n=(\psi_{n_0}^{-1})^*(\psi_n^*g_n).
\]
Pullback by this one smooth fixed map preserves
strong metric convergence and positivity of the
limit. This does not require a separately supplied
reversing map. Both cases give exactly the
orientation-preserving metric normalizers required
for E155. [E154 assessment][metric].

Now apply E155/E156 to the original smooth
connections \(A_n\) and these \(\varphi_n\).
Equation (2) gives its strain and full derivative
bounds, the distortion supplies its \(Q\) floor,
and the metric convergence supplies its remaining
hypothesis. It produces smooth equivariant
automorphisms \(H_n:P\to P\) covering
\(\varphi_n\) and, after a further subsequence,
uniform convergence of
\((H_n^*A_n,H_n^*F_n)\) in a fixed smooth affine
pair background. The limit is continuous, positive
with the same sign and distributionally compatible.
The construction uses the chiral isometry and
positive metric square root to identify the fixed
bundle. It does not require any uniform derivative
bound for \(\varphi_n,H_n\) or their inverses.
[E155][e155] · [Static pair assessment][static].

The times on this subsequence still tend to \(t_*\).
The assessed E148 criterion applies directly to
the normalized pairs. It starts from a single late
smooth slice, undoes that slice's one fixed bundle
automorphism and uses smooth original uniqueness
on the overlap. The extension is in the supplied
original identification. This proves the general
criterion and its finite-maximal-lifespan exclusion.
There is no estimate on times between the selected
slices or need for time-continuity of the
normalizing maps. [Sequential assessment][sequential].

## Conditional three-bound version

Assume the following extra premise \(H_{\rm top}\).
For a fixed smooth compact closed connected oriented
simply connected real four-manifold \(M\) with
\(H^2(M;\mathbb R)=0\) and a fixed smooth
\(SO(3)\) bundle, the E155 positive accumulation
conclusion holds with its uniform \(Q\)-floor
hypothesis deleted. More explicitly, for smooth
definite connections of the same positive-plane
round-compatible sign, retain the uniform native
supremum bound on \(|T|+|\nabla^AT|\) and supplied
smooth orientation-preserving diffeomorphisms whose
pulled-back metrics converge strongly in \(C^1\)
to a positive metric. Assume that a subsequence of
the pairs then converges uniformly in a fixed
affine background under smooth equivariant bundle
automorphisms covering those diffeomorphisms, to a
positive continuous compatible pair of the same
sign with the supplied limiting metric. There is
no additional hypothesis in \(H_{\rm top}\) on
the least eigenvalues of the input \(Q\)'s.

Under this premise the preceding continuation
criterion holds on such a base with the distortion
bound in (1) omitted. Indeed the \(\Psi\) bound
alone gives (2) and (5) on the same positive
definite slices. The supplied injectivity and
diameter bounds still allow R29 and the same
orientation refinement. Apply \(H_{\rm top}\)
at the pair step in place of the floor-dependent
E155 theorem. The resulting positive pair
sequence gives E148 and the analogous
finite-maximal-lifespan exclusion. At the scope
of this packet \(H_{\rm top}\) remains conditional.
The separate E157 test is not used as proof.
[B80][b80] · [Sequential assessment][sequential].

## Evidence and reference scope

The four-bound implication above has no pending
topology premise. Both versions are tests on a
supplied smooth flow and supplied spatial sequence
bounds. They produce neither those bounds along
general flows nor initial definite data on arbitrary
homotopy spheres, global existence or convergence,
or a novelty finding. R29 is the inspected undated
author text, with the inspected pages and access
record from E154 and no retained copy. The distinct
1990 R28 article remained inaccessible at the theorem
level and is not a source theorem for this proof.
No primary search, reinspection, or numerical
test entered E159. [Canonical R29][r29].

## Consumed frozen identities

| Input | SHA-256 |
| --- | --- |
| [E159 request][req] | 27b09690b62c61acedcc0fc2c9a6ccc5253db385a905a79794b8005bbb144406 |
| [B80][b80] | 82ab9edb9e10eb9eebc9d7de75a023452ab9f4af8d55da814ec3683b88c290a1 |
| [E154 source check][e154] | fc77960efb3cfbc5e4d22691ec2c145c4b0b445fe59f8828c045c2f88e0ed133 |
| [E154 assessment][metric] | ea4b36e70a665ade7fa143e97be1f3f2238db7657591f729b22b27802e4594ec |
| [E155][e155] | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |
| [E155/E156 assessment][static] | 3fae61f8eb3c3dd391dd98595ceeddf0cac173296a3ce53867830f538d4bbc70 |
| [E137][e137] | 8b2622b44a5a46106f28f67e2a37b2e1a129d238281a7be1f811498a48d95193 |
| [E145][e145] | 544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4 |
| [E148/E150 assessment][sequential] | 6c9480a6dfaedbff17156541faa9c350e61bcf7925d5ae4cec88e8a7d93d4557 |

[req]: ../research-progress/handoffs/SP4-CME-E159_REQUEST_v1.md
[b80]: ../brainstorm/notes/B80_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md
[e154]: ../reviews/E154_RICCI_COMPACTNESS_SOURCE_CHECK_20261122.md
[metric]: ../reviews/E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md
[e155]: 155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[static]: ../reviews/E155_E156_STATIC_PAIR_COMPACTNESS_ASSESSMENT_20261122.md
[e137]: 137_REAL_COMPARISON_TIME_CONTROL_20261122.md
[e145]: 145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md
[sequential]: ../reviews/E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md
[r29]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r29-selected-passage-upgrade
