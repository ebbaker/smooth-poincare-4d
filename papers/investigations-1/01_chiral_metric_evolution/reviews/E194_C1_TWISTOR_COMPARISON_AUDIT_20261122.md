# E194 Independent pointed \(C^1\) metric twistor audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B94, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings
are unavailable. I authored E192, the inherited audit of the
single-curve persistence lemma. E191's geometric comparison was
written independently by another helper. The E190/E192 lead
assessment is used at its stated scope.

## Disposition

**Pass with one notation correction.** In E191 (7) read
\(I_v\circ df\circ j\) for the printed comma between \(I_v\)
and \(df\). The calculation has this composition throughout.
The positive \(2i\,dA_f\) in the next paragraph uses the order
normal-valued one-form first, contracted symplectic one-form second,
as in Fine (7).

Given the actual smooth oriented pointed comparison embeddings,
strong \(C^1\) convergence to a smooth limit whose hyperkähler
universal cover has the chosen orientation, and the supplied
prelimit metric tamers, the embedded-sphere exclusion follows.
E191 retains its frozen conditional form. The separate E190/E192
assessment supplies \(H_{\rm pers}\), and the \(W^{1,8}\) regularity
test below supplies exactly the fixed right inverse it requires.

## Quantifiers, chirality, and total-space comparison

Fix a hypothetical embedded \(I_a\)-holomorphic parametrization
\(f:\mathbb{CP}^1\to\widetilde X\) on the hyperkähler universal
cover \(p:\widetilde X\to X\). Choose precompact open neighborhoods
\(W_0\Subset W\) of its image. The image \(p(\overline W)\) is
compact, even when \(p\) identifies points of \(W\). It is contained
in an open precompact \(U\subset X\) with its closure in a larger
compact comparison domain. In the connected pointed component,
one can enlarge that domain by compact paths to include the
basepoint and choose a connected smooth domain around the resulting
compact set. One actual comparison embedding \(f_i\) on a
neighborhood of that larger domain is used for each sufficiently
large \(i\) in the convergent sequence.

Work on the connected pointed components. In Fine's curvature
formulation, the strict inequality makes the continuous quadratic
form of the self-adjoint \(\mathsf A_i=W^+_{g_i}+s_{g_i}I/12\)
nonzero on every nonzero self-dual vector. It is therefore
definite. Continuity of its eigenvalues fixes the sign of
\(\det\mathsf A_i\) on the connected component. Fine's Theorem 1
then selects \(J_{\epsilon_i}\) with
\(\epsilon_i=\operatorname{sgn}\det\mathsf A_i\). A specified
canonical tamer on each component supplies \(\epsilon_i\) directly.
An infinite subsequence has one sign \(\epsilon\), preserving the
pointed convergence. The uniform orientation on \(X\) and the
orientation induced by the parallel hyperkähler triple on the
cover match the choice of \(\Lambda^+\).

Set \(h_i=f_i^*g_i\) on \(U\). The embedding is a diffeomorphism
onto its open image since source and target have the same
dimension. It is an oriented isometry from \(h_i\) to its image.
The twistor map of \(f_i\) uses the forward covector map
\(((df_i)^{-1})^*\). It preserves all relevant metric constructions
exactly, including the Levi–Civita horizontal distribution. Thus
only \(h_i\to g\) on the same domain needs an estimate.

On \(\Lambda^+_g\) let
\(\psi_i=(1+*_{h_i})/2|_{\Lambda^+_g}\). It maps into
\(\Lambda^+_{h_i}\), is uniformly nonsingular for large \(i\),
and preserves orientations. For the last statement one can
interpolate \(g\) to \(h_i\) through the compact near-\(g\)
positive metrics and retain nonsingularity along the path. The
normalized sphere map \(\beta_i\) has inverse the analogous
normalization of \(\psi_i^{-1}\). In a smooth oriented
\(g\)-orthonormal frame \(e\), put
\(G_i=\operatorname{Gram}_{h_i}(\psi_i e)\) and
\(e_i=(\psi_i e)G_i^{-1/2}\). Smooth dependence of the Hodge star,
inner product and square root on metric values gives
\(G_i\to I\) and \(e_i\to e\) in \(C^1\). In the trivializations
by \(e,e_i\), write \(\beta_i(x,y)=(x,b_i)\) with
\(b_i=S_i y/|S_i y|\), \(S_i=G_i^{1/2}\). For a base vector \(v\)
and a fiber vector \(w\),
\[
 db_i(v,w)=\frac{(I-b_ib_i^{\mathsf T})
                  ((dS_i)v\,y+S_i w)}{|S_i y|}.
\]
The denominator is uniformly positive on the compact domain.
The base derivative tends uniformly to zero and the fiber
derivative to the identity in these trivializations. The
coordinate formula for the inverse uses \(S_i^{-1}\) and has
the same convergence. This controls derivatives on the total
space, including mixed base-to-fiber components.

Let \(\gamma_i\) be the Levi–Civita connection matrix on
\(\Lambda^+_{h_i}\) in \(e_i\). Its local formula uses only
the first derivatives of \(h_i\) and \(e_i\), so
\(\gamma_i\to\gamma\) uniformly. The horizontal representative
of \(v\) is \((v,-\gamma_i(v)y)\). Thus \((v,w)\) has vertical
part \(w+\gamma_i(v)y\). The pointwise horizontal complex
structure is \(\epsilon I_{h_i,y}\), with
\(h_i(I_{h_i,y}v,w)=\sqrt2\,\alpha_y(v,w)\) for an ordinary
unit two-form \(\alpha_y\). The \(\sqrt2\) follows from the
length of a Hermitian fundamental form in real dimension four.
Applying the canonical structure to the horizontal and vertical
parts gives
\[
 J_{\epsilon,h_i}(v,w)=
 \left(\epsilon I_{h_i,y}v,\,
 j_y(w+\gamma_i(v)y)-\gamma_i(\epsilon I_{h_i,y}v)y\right).
\]
The vertical \(j_y\) is the same standard sphere structure in
the oriented frames. All coefficients converge in \(C^0\), as
does \(\beta_i^* J_{\epsilon,h_i}\) by the two derivative
comparisons. Finite frames give uniform convergence on the
compact region. Naturality identifies this with
\(\Phi_i^*J_{\epsilon,g_i}\) for the composite twistor map
\(\Phi_i\). This only differentiates metric data once.

## The closed forms on the covering neighborhood

The vertical oriented plane \(V\) is the perpendicular plane
to the tautological unit vector in the pulled-back positive
three-plane. Projecting the metric connection to \(V\) gives
an \(SO(2)\) connection. Its real scalar curvature in the
positive-area convention is closed, since the \(SO(2)\)
curvature is locally the differential of the scalar connection
form. On a fiber this is the curvature of the unit round
sphere connection, namely its area form. In the ordinary
integral Euler convention Chern–Weil gives
\([\omega]=2\pi e(V)_{\mathbb R}\). The fiber integrals
\(\int_{S^2}\omega=4\pi\) and \(\langle e(TS^2),[S^2]\rangle=2\)
check the common positive normalization. The differential
of \(\Phi_i\) on each vertical plane is oriented, so
identifies \(V\) with \(\Phi_i^*V_i\) as oriented bundles.
Consequently \([\Phi_i^*\omega_{g_i}]=[\omega]\) on \(Z_g|_U\)
and the pulled-back forms tame the pulled-back structures.

The induced twistor map \(\Pi:Z_{\widetilde X}|_W\to Z_g|_U\)
of \(p\) is locally a diffeomorphism. Its pointwise derivative
and inverse derivative are uniformly bounded on the compact
set over \(\overline W_0\). Thus pulling back
\(\widetilde J_i=\Pi^*(\Phi_i^*J_{\epsilon,g_i})\) transfers the
\(C^0\) convergence there. Pointwise the pullback uses
\((d\Pi)^{-1}J_i\,d\Pi\), which only needs the inverse on
tangent spaces. Pullback also preserves taming and the
cohomology equality. This remains valid if the sphere or
its neighborhood projects noninjectively to the base.

On the cover the parallel hyperkähler frame trivializes
\(\Lambda^+\) with trivial connection. Hence on
\(\widetilde X\times S^2\) the limit form is the pullback of
unit sphere area, and \(J_\epsilon=\epsilon I_b\oplus j_b\).
Take \(b=\epsilon a\) in \(u_\epsilon=(f,b)\), since
\(\epsilon I_{\epsilon a}=I_a\). Both lifts are smooth embedded
holomorphic parametrizations with zero limit form area. In
particular, the plus and minus comparisons both use the same
domain complex orientation. For the persistence lemma the
single fixed compact neighborhood is
\(\overline W_0\times S^2\) inside the open \(W\times S^2\).
All structures and class identities are available on the
open neighborhood.

## Both-sign lift regularity

Choose parallel axes \(I_3=I_a\), \(I_1I_2=I_3\).
The complex bundle along the curve is
\((f^*T\widetilde X,I_3)\oplus\underline{\mathbb C}\),
where the second factor is the tangent complex line at \(b\).
With the factor \(1/2\) in \(\bar\partial_J\), product
differentiation gives precisely
\[
 D_0(\eta,v)=
 \left(\bar\partial_{f^*T\widetilde X}\eta+
             \frac{\epsilon}{2}I_v\circ df\circ j,\,
       \bar\partial v\right).
\]
The derivative of the base complex structure in the
horizontal argument is zero using the parallel \(I_3\)
and the Levi–Civita connection. That connection induces the
holomorphic Dolbeault operator along \(f\). In a holomorphic
base coordinate this is the ordinary linearization of the
fixed integrable Cauchy–Riemann equation. The derivative of
the vertical complex structure multiplies the derivative of
the constant vertical map, which vanishes. Thus \(\bar\partial
v=0\) implies \(v\) is constant. If \(v\ne0\), rotate the
\((I_1,I_2)\) axes around \(I_3\), then rescale the entire real
kernel section so \(\epsilon I_v=I_2\). The horizontal forcing
becomes \(I_1df/2\) since \(df\circ j=I_3 df\) and \(I_2I_3=I_1\).

Embeddedness makes \(N=f^*T\widetilde X/df(T\mathbb{CP}^1)\)
a holomorphic line everywhere. The parallel holomorphic
symplectic form \(\Omega=\omega_{I_1}+i\omega_{I_2}\) gives
\(\theta=\Omega(df(\cdot),\cdot)\), a holomorphic
\((1,0)\)-form valued in \(N^*\). The factorization through
\(N\) uses the isotropic complex tangent line. Pair the
projected horizontal equation in the order
\((\bar\partial_N\eta_N+\beta/2)\wedge\theta\), where
\(\beta=\pi_N I_1df\). The first term is the differential of
the global scalar one-form \(\theta(\eta_N)\), so its
integral vanishes. Pointwise choose an induced orthonormal
pair \(s,js\) with \(e=df(s)\), \(n=I_1e\). Then
\(df(js)=I_3e\), \(I_3n=I_2e\), and the normal
values of \(\beta\) are \(n,-I_3n\). The contractions
\(\Omega(e,n)=1\), \(\Omega(e,I_3n)=i\) and
\(\Omega(I_3e,n)=i\) give
\[
 (\beta\wedge\theta)(s,js)
     =\Omega(I_3e,n)-\Omega(e,-I_3n)=2i.
\]
The factor \(1/2\) leaves \(i\int dA_f\ne0\). This rules
out nonzero \(v\) for either \(\epsilon\). The holomorphic
normal isomorphism \(N\to (T\mathbb{CP}^1)^*\) given by
\(\Omega\) is nonzero at every point, since \(df\) is
injective and \(\Omega\) nondegenerate. Hence \(N=\mathcal O(-2)\).
It has no nonzero holomorphic section, so the remaining
kernel consists of \(df\) of holomorphic vector fields on
\(\mathbb{CP}^1\). These have complex dimension three and
give real dimension six.

The diagonal Dolbeault operator has complex rank three and
degree zero. The horizontal determinant is trivial from
\(\Omega\) and the vertical line is constant. The ordinary
Dolbeault real index formula, used also in Fine Corollary 9,
yields \(2(3(1-0)+0)=6\). The off-diagonal term is smooth
and zeroth order. It is compact \(W^{1,p}\to L^p\) on the
closed domain by the compact Sobolev embedding, preserving
the Fredholm index.

### Fixed \(W^{1,8}\) and dual regularity

The following local verification makes the Sobolev passage
explicit. In a complex coordinate and smooth complex bundle
frame, evaluate anti-linear forms on \(\partial_x\) and
multiply by two. The real principal part is
\(\partial_x+I\partial_y\) with constant complex matrix
\(I^2=-1\) and \(I^{\mathsf T}=-I\). All remaining terms are
smooth and zeroth order. Its dual distribution equation in
these coordinate pairings has constant principal part
\(-\partial_x+I\partial_y\). One can absorb any smooth
density and local fiber pairing into the dual components.
Each constant principal part is elliptic and has
\(\|\nabla w\|_p\le C_p\|D_* w\|_p\) on compactly supported
smooth inputs for \(p=2,8,8/7\).

For \(p=2\) use the Fourier symbol. For \(p=8\), the Hilbert
identity \((Hf)^2=f^2+2H(fHf)\) from E190/E192 for real
Schwartz \(f\) and its established \(L^4\) bound give
\[
 \|Hf\|_8^2
 \le \|f\|_8^2+2\|H\|_{4\to4}\|f\|_8\|Hf\|_8 .
\]
Indeed \(Hf\in L^2\cap L^\infty\) and the \(L^4\) and
\(L^2\) extensions agree on \(fHf\). This proves the \(L^8\)
bound by density. Directional averaging gives the two
Riesz bounds in \(L^8\), with the same operator on
smooth inputs as in E192. Real duality extends these to
\(L^{8/7}\) because their \(L^2\) adjoints are their negatives.
Factoring the constant first-order operators against their
conjugates gives the Laplacian and expresses each derivative
as a linear combination of products of two Riesz transforms
on the equation, just as for the \(L^4\) estimate.

With a finite partition of unity, the commutators and the
zeroth-order coefficients give
\(\|\xi\|_{W^{1,p}}\le C(\|D_0\xi\|_p+\|\xi\|_p)\) for
\(p=2,8\). This estimate and compact embedding give a
finite-dimensional kernel and closed range. In detail the
kernel unit ball is compact in \(W^{1,p}\), by the estimate
on kernel differences. On a closed complement to the kernel,
if \(\|\xi\|_{W^{1,p}}\le C\|D_0\xi\|_p\) failed,
a unit sequence with equation tending to zero would have a
subsequence converging in \(L^p\), and hence in \(W^{1,p}\)
by the estimate. The limit would be a unit kernel element
in the complement, an impossibility. This complement
estimate proves closed range.

A distributional solution of either the operator or its
adjoint with component function \(w\in L^p_{\rm loc}\)
satisfies \(D_* w=B(x)w\) locally for smooth \(B\).
For a compactly supported cutoff \(\chi\), \(D_*(\chi w)\)
is in \(L^p\) by the distributional product rule. Mollifying
and applying the constant estimate gives a uniform \(L^p\)
bound for the first derivatives. Weak passage identifies
them, gaining one local Sobolev derivative. Differentiating
the distribution equation with its smooth zeroth-order
coefficient and repeating on smaller disks proves all
local Sobolev orders and then smoothness. This applies to
\(W^{1,8}\) kernel sections and to all annihilators in
\(L^{8/7}\), since they solve the formal adjoint
distribution equation by testing against smooth sections.
It also applies to \(p=2\), so the smooth kernels and
annihilators are the same at \(p=2\) and \(p=8\). At \(p=2\)
the Dolbeault index computation and compact perturbation
give index six. The closed range and the common smooth
solution spaces transfer the kernel and cokernel dimensions
to \(p=8\). Hence its cokernel is zero and the range is all
of the specified \(L^8\) anti-linear target.

Use a fixed smooth auxiliary \(L^2\) pairing to project onto
the six smooth kernel sections. This finite-rank projection
is bounded on \(W^{1,8}\), so its kernel is a closed linear
complement. Restriction of \(D_0\) to that complement is a
bounded bijection onto the \(L^8\) target. The bounded inverse
theorem supplies the single bounded linear right inverse
there. There is no adjustment of the analytic space as
the perturbed twistor structures vary.

## Persistence and area

The E190/E192 assessment applies to the fixed smooth
six-dimensional neighborhood, smooth embedded \(u_\epsilon\),
fixed anti-linear target and right inverse just established.
Its perturbation threshold is fixed by those data. For all
sufficiently large \(i\) in the selected subsequence, the
smooth pulled-back \(\widetilde J_i\) satisfy it. There is a
smooth nonconstant holomorphic sphere \(u_i\) homotopic to
\(u_\epsilon\) within the compact neighborhood. Closedness
of the forms and equality of the cohomology classes on the
open neighborhood give
\(\int u_i^*\widetilde\omega_i=
\int u_\epsilon^*\widetilde\omega_i
=\int u_\epsilon^*\widetilde\omega=0\).
For an oriented domain pair \(v,jv\) the left-hand density
is \(\widetilde\omega_i(du_i v,\widetilde J_i du_i v)\).
Strict taming makes it nonnegative everywhere and positive
where \(du_i\ne0\). At a point where the holomorphic
differential is nonzero it has real rank two, and smooth
nonconstancy gives an open set of such points. The integral
is positive for each such \(i\). This contradiction requires
no uniform taming constant or limit of the curvature forms.
It uses smooth maps, including the perturbed map, without an
embeddedness claim for that map.

## Primary-source inspection and scope

On 22 November 2026 I reopened Joel Fine, *Limits of Riemannian
4-manifolds and the symplectic geometry of their twistor spaces*,
arXiv:1602.03829v2, in primary HTML, the indexed 12-page PDF
and the unversioned submission history. The accepted v2 posting
is 15 November 2016, and the PDF separately displays 4 April
2018. Published-body inspection remains outside the packet.
No additional literature search or retained local source
copy was used. [Primary v2 HTML](https://arxiv.org/html/1602.03829v2) ·
[Indexed v2 PDF](https://arxiv.org/pdf/1602.03829v2) ·
[Version history](https://arxiv.org/abs/1602.03829).

- §1.1, Theorem 1 and Definition 2, identifies the metric
  curvature condition and the sign of taming. §2.1, printed
  pp. 5–7 / indices 4–6, constructs the projected vertical
  connection and Lemma 6 checks the normalized projection,
  \(C^2\)-metric to \(C^1\)-structure convergence and the
  Euler-class comparison. For ordinary area \(4\pi\) the
  branch uses the explicit \(2\pi\) Euler factor. The
  \(C^1\)-metric to \(C^0\)-structure step is the direct
  first-jet calculation above. [Fine v2 §2.1](https://arxiv.org/html/1602.03829v2#S2.SS1).
- §§2.2–2.3, pp. 7–10 / indices 6–9, gives the \(p>2\)
  setup and Proposition 7 with \(C^1\) perturbations, then
  the product twistor structure, Proposition 8 (6)–(7)
  and Corollary 9. The product formula forces the
  \(\epsilon a\) lift, although the sentence immediately
  following it uses \(a\) for both signs. The wedge
  contraction and index above are checked for the embedded
  sphere. The standard Dolbeault index formula used in the
  source is retained as such. The exact \(p=8\) inverse
  passage is the branch calculation above. [Fine v2 §§2.2–2.3](https://arxiv.org/html/1602.03829v2#S2.SS2).
- §2.4, pp. 10–11 / indices 9–10, uses a fixed compact
  cover region, sign subsequence, class equality and
  zero-versus-positive-area contradiction in the original
  pointed \(C^2\) setting. The present \(C^0\) persistence
  input is the assessed E190/E192 result. [Fine v2 §2.4](https://arxiv.org/html/1602.03829v2#S2.SS4).

The audit excludes embedded holomorphic spheres under the
specified smooth limit, metric taming and pointed \(C^1\)
hypotheses. It supplies no metric extraction, taming from
native connection definiteness, multiply covered statement,
ALE sphere-classification input or novelty claim. Lead
assessment of E191/E194 is separate.

## Verified inputs

| Artifact | SHA-256 |
| --- | --- |
| [E194 request](../research-progress/handoffs/SP4-CME-E194_REQUEST_v1.md) | 256033a0f422479f0ed45e6fc61002b78527591f8c0a2aead84e8711968bef97 |
| [B94](../brainstorm/notes/B94_C1_TWISTOR_LIMIT_COMPARISON_20261122.md) | c1ada5247f59596398e916c0b589a0f19bab818d666aee628ce7950c78da8d9a |
| [E191 request](../research-progress/handoffs/SP4-CME-E191_REQUEST_v1.md) | f5069f4e2d602ccb626d6617f1aeef5321317331b7357bc32563d0462702116f |
| [E191 proof](../notes/191_CONDITIONAL_C1_TWISTOR_LIMIT_20261122.md) | e2426b287fcf7d85381948bdf404aa5563c82f0b408f32da170de9a24cbf22fa |
| [E191 return](../research-progress/handoffs/SP4-CME-E191_RETURN_v1.md) | 10ddde36af1bc9466bf6486a333065291f50495ddecebd83861982d9acaf81e3 |
| [E190/E192 assessment](E190_E192_C0_PERSISTENCE_ASSESSMENT_20261122.md) | cb7c27443cb70b5b1b6345c67e419c1b3e6bc0d8f25354bf6d5addf3b64eb871 |
| [E186 assessment](E186_TWISTOR_COMPARISON_ASSESSMENT_20261122.md) | aabd5b851a0373d8d2331a5ace9035a634eb2933d7f731632255780d08901f65 |
| [Nested E190 proof](../notes/190_C0_CURVE_PERSISTENCE_TEST_20261122.md) | c928a60dfe4fe6fbafe4428261f7b77164648a88382c20ca5ff06b8f9302a2ea |
| [Nested E192 audit](E192_C0_PERSISTENCE_AUDIT_20261122.md) | a0e7a764dfe73ab2a8997a71707e347b212c761cd72a9a37842b7d610253bbed |
| [Nested E186 source audit](E186_TWISTOR_LIMIT_SOURCE_AUDIT_20261122.md) | 31ead6b42eff300f3afb0633e802ba3ba75f15e69a431cc5fc656003bc4f4c6e |
