# SP4-CME-E51 — Focused audit of the round stability inputs

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I did not write E47 or E48.
My earlier work includes E29's integration audit, source verification,
and the separate conditional transfer E50. This is an internal proof
audit of the frozen linear and operator inputs. The three branch
digests and the primary PDF's byte count and digest matched before
use. The [request][req] and [return][ret] record exact identities.

**Verdict.** E47's positive round operator and weighted linear
isomorphism and E48's fixed operator and tame estimates pass.
I verified the Clifford chirality, Hessian normalization, spectral
trace, and derivative allocation directly. The printed-source
discrepancies are confirmed and scoped below. No new mathematical
premise is needed for these inputs. The nonlinear half-line problem
and the conditional transfer are separate packets. [E47][e47] · [E48][e48].

## Native conventions, Hessian and symbol

**Pass.** Let \(g_0=g_{A_0}\) be Fine's native metric, with
positive sectional curvature \(\kappa\). The pairing is the
positive negative-Killing form, and the equation uses native time.
In the comparison to the manuscript's internal \(\delta\) pairing
and metric with sectional curvature \(K\), the native volume
doubles relative to \(\mu=2K^2dV_{\widehat g}\). Thus
\(dV_{g_0}=4K^2dV_{\widehat g}\) and
\(g_0=2K\widehat g\), with \(\kappa=1/2\) in that comparison.
E47 keeps the actual native \(\kappa\) fixed. The two-form adjoint
scales by \((2K)^{-1}\) between the metrics, while the normalized
\(Q\) is unchanged. The native equation has the corresponding
clock \(\tau=2Kt\). In the fixed-operator computation there is no
further metric or time rescaling. At perfection Definition 1.5
makes \(F_0\) an isometry to \(\Lambda^+\), and Lemma 2.2 makes
this identification parallel. [Fine PDF, pp. 4–5 and 12][fine] ·
[Normalization assessment][e01].

For \(\eta_1=d_0 b\) the wedge Gram numerator varies by
\(2L_0(\eta_1)dV_{g_0}\) and the reference volume by
\(\frac23\operatorname{tr}L_0(\eta_1)dV_{g_0}\).
Thus \(DQ(A_0)[b]=2\Pi_0L_0d_0 b\). At \(Q=I\) the
first variation of \(|Q-I|^2\) vanishes, and its bilinear
second variation is twice the pairing of two \(DQ\)'s.
This gives the factor eight in E47 (1), using the native
energy \(\int\operatorname{tr}(Q^2)\,d\mu\) and its
constant topological term. Equivalently,
\(B_0=2I\), \(\dot B=4\dot Q\) since \(\dot Q\) is
trace free, and \(d_A^{*g_A}F_A=0\) by self-duality
and Bianchi. Write the physical vector field on the entire
definite region as \(-d_A^{*g_A}[(B-2I)F_A]\).
All adjoint variations hit zero at the reference, and
\(L_0^*M=MF_0\) in the fixed pairings. This gives exactly
\[
 Dv(A_0)b=-8d_0^*L_0^*\Pi_0L_0d_0b
          =-d_0^*P_0^*P_0d_0b,\qquad P_0=\sqrt8\,\Pi_0L_0 .
\]
This is the full linearization. Differentiating the
connection-space metric in the Hessian argument also makes
no contribution at a zero gradient. Fine's actual (4.5),
printed p. 33, uses the positive square root
\(\Theta_A^{1/2}\). The recall in the Proposition 4.12
proof, printed p. 38, uses \(\Theta^{-1/2}\), and p. 39
continues with it. Its kernel argument still works because
both are invertible scalings on the trace-free summand at
perfection. The coefficient is fixed by the direct variation.
For clarity in E47 use \(DQ(A_0)[b]\) rather than
\(\delta_0Q[b]\), since \(\delta_0\) also denotes \(d_0^*\)
in the fixed gauge. [Fine PDF, pp. 9, 17–18, 29–34, 38–39][fine].

For a real \(\xi\ne0\), self-dual projection of
\(\xi\wedge\xi^\perp\) is an isomorphism onto \(\Lambda^+\).
Indeed the squared norm of the self-dual part of a
nonzero simple two-form is one half its squared norm.
Thus \(P_0(\xi\wedge\cdot)\) surjects onto the five-dimensional
trace-free symmetric space after projection and symmetrization.
It kills \(\xi\otimes e\) by the exterior square identity.
For the other kernel summand, contraction of the zero
five-form \(\xi\wedge F_{0i}\wedge F_{0j}\) gives
\[
 2L_0(\xi\wedge\iota_uF_0)_{ij}=\xi(u)\delta_{ij}.
\]
The factor two on the left follows from the explicit
one-half in \(L_0\). Printed Corollary 4.7 on p. 34
omits the half when applying its correct Lemma 4.6.
The trace-free nullspace is unaffected. For \(u\ne0\),
the \(\iota_uF_{0i}\) span \(u^\perp\), so they cannot
all lie in \(\mathbb R\xi\). The two images have dimensions
four and three with trivial intersection, exhausting the
seven-dimensional kernel. The other two quadratic symbol
terms, \(|\xi|^2|S_0^*b|^2\) and \(|w_0^*b|^2\), test
orthogonality to exactly those two images. This proves
positive rank-one symbol with a uniform margin by compactness.
[Fine PDF, pp. 34–35][fine] · [E47 (2)–(3)][e47].

## Round global kernel and chirality

**Pass.** Pairing \(G_0b\) with \(b\) gives the three squared
terms of E47 (4), with the rough Laplacian sign
\(\Delta_0=\nabla^*\nabla\). A kernel element is smooth by
the local elliptic argument below. Its \(S_0^*b\) is parallel.
With the round convention
\(R(X,Y)Z=\kappa(\langle Y,Z\rangle X-\langle X,Z\rangle Y)\),
a parallel nonzero \(v\) would give both \(R(X,v)v=0\)
and \(R(X,v)v=\kappa|v|^2X\) for \(X\perp v\). Thus
\(S_0^*b=0\), leaving \(b\) in \(V=\ker S_0^*\).

On the spin round sphere, the parallel identification with
\(\Lambda^+\) gives \(E_{\mathbb C}=\operatorname{Sym}^2S^+\) and
\[
 (T^*\otimes E)_{\mathbb C}
 =\bigl(S^-\otimes\operatorname{Sym}^3S^+\bigr)
       \oplus\bigl(S^-\otimes S^+\bigr).
\]
The map \(S_0\) is parallel and injective and has image
the second irreducible summand. The domain \(V_{\mathbb C}\)
is the first. The two targets of
\((\Pi_0L_0d_0,d_0^*)\) complexify to
\(\operatorname{Sym}^4S^+\oplus\operatorname{Sym}^2S^+\).
Each occurs once in \(T^*_{\mathbb C}\otimes V_{\mathbb C}\):
expand \(S^-\otimes S^-=\mathbb C\oplus\operatorname{Sym}^2S^-\)
and \(S^+\otimes\operatorname{Sym}^3S^+
=\operatorname{Sym}^4S^+\oplus\operatorname{Sym}^2S^+\).
Only the trivial \(S^-\) channel can reach those targets.
The pair symbol on \(V_{\mathbb C}\) has zero kernel by the
symbol check above and equal domain and target dimensions.
Both target projections are therefore nonzero. The two
parallel equivariant maps are the Clifford projections up
to nonzero constant scalings. Exterior differentiation and
divergence are parallel projections of the same covariant
derivative as the twisted Dirac, so this argument compares
full operators and gives no extra zeroth-order term.
One may state this multiplicity argument explicitly if
compressing the result. It gives exactly the kernel of
\(D^-:S^-\otimes\operatorname{Sym}^3S^+\to
S^+\otimes\operatorname{Sym}^3S^+\).
[Fine PDF, Lemmas 2.2 and 3.7–3.9, pp. 12 and 22–24][fine].

For the square let \(c_i=c(e_i)\) with the Riemannian Clifford
sign \(c_ic_j+c_jc_i=-2\delta_{ij}\).
At a normal frame the diagonal derivatives give
\(\nabla^*\nabla\), the mixed terms give
\(\sum_{i<j}c_ic_j[\nabla_i,\nabla_j]\), and the spin
curvature is
\[
 R^S_{ij}
 =\tfrac14\sum_{a,b}\langle R(e_i,e_j)e_a,e_b\rangle c_ac_b
 =-\tfrac{\kappa}{2}c_ic_j .
\]
Each \(i<j\) contributes \(+\kappa/2\), since
\((c_ic_j)^2=-I\). The six pairs give \(+3\kappa I\).
For the chirality check put \(\omega=c_1c_2c_3c_4\).
In the convention that \(S^+\) carries the self-dual
representation, \(\omega=+I\) on \(S^-\). For example
\(c_1c_2+c_3c_4=c_1c_2(1-\omega)\) is zero there,
and cyclic basis pairs give the same on all of \(\Lambda^+\).
Conversely the anti-self-dual Clifford action is zero on \(S^+\).
Since the round curvature operator is \(\kappa I\),
the \(S^+\) curvature and the induced
\(\operatorname{Sym}^3S^+\) curvature are self-dual
in their base slots. Their twisting term in this square
contracts self-dual base two-forms with Clifford action
on \(S^-\) and hence vanishes exactly. The full Dirac
operator is formally self-adjoint with these conventions,
so its square on the negative-chirality input is
\[
 (D^-)^*D^-=\nabla^*\nabla+3\kappa I .
\]
It has positive quadratic form on each nonzero section.
That proves \(\ker G_0=0\) on round \(S^4\) without importing
a general-perfect vanishing theorem. Fine's Proposition 4.12
invokes its Theorem 3.13, but here the round square supplies
the required vanishing. The Hitchin, LeBrun and Horan
citations remain bibliographic pointers. [E47, round square][e47] ·
[Fine PDF, §3.4 and Proposition 4.12][fine] · [Canonical source record][source].

## Fixed realization, graph scale and time trace

**Pass.** Freeze the leading form in a small fixed chart.
Plancherel uses positive rank-one symbol on
\(i\xi\otimes\widehat b\). Smooth coefficient variations
are small in that chart compared with this lower bound.
A squared partition cancels linear cutoff cross terms,
and lower-order terms are absorbed at cost \(C\|b\|_2^2\).
Together with \(q[b]\ge0\), this gives
\(\|b\|_2^2+q[b]\asymp\|b\|_{H^1}^2\). The closed symmetric
form defines \(J=I+G_0\). Its weak inverse exists by
coercivity, is symmetric on \(L^2\), and maps bounded \(L^2\)
sets into bounded \(H^1\) sets, which are relatively compact
in \(L^2\).

For the domain, the weak equation with \(L^2\) forcing first
gives local \(H^2\) by a spatial difference quotient and
cutoff energy. The forcing quotient is moved to the test,
where the bounded difference quotient costs one derivative
of the test. The coefficient differences act on the known
\(H^1\) field. Freezing and Young's inequality give the
uniform quotient-gradient bound. Running the localized
second-order Fourier estimate and commuting derivatives
then bounds \(H^{s+2}\) by
\(C_s(\|G_0b\|_{H^s}+\|b\|_2)\), absorbing the intermediate
\(H^{s+1}\) term by interpolation. This identifies the
domain as \(H^2\) and gives smooth eigenvectors. The
positive symmetric compact inverse yields an orthogonal
spectral basis. Nonnegativity and the trivial kernel imply
\(\lambda_1=\inf\operatorname{spec}G_0>0\).
Iterating \(J\)'s elliptic estimates gives
\(\|J^kb\|_2\asymp\|b\|_{H^{2k}}\).
The form identity
\(\|J^{k+1/2}b\|_2^2=\|J^kb\|_2^2+q[J^kb]\)
and the same elliptic estimates give the odd-order
equivalence. No interchange of a moving metric with the
reference pairing is used. [E47, realization][e47] ·
[E29, fixed local estimates][e29].

The spectral ratio \((\lambda-\alpha)/(1+\lambda)\) is
increasing for \(0<\alpha<\lambda_1\), so
\(G_0-\alpha I\ge\theta J\) with
\(\theta=(\lambda_1-\alpha)/(1+\lambda_1)>0\).
In the variables \(b=e^{\alpha t}a\), \(g=e^{\alpha t}f\),
testing with \(J^m b\) on the finite spectral space pairs
\(J^{(m-1)/2}g\) with \(J^{(m+1)/2}b\). The diffusion
term controls \(\|b\|_{\mathcal H^{m+1}}^2\).
Absorption and integration give the \(C_bH^m\) and
\(L^2H^{m+1}\) estimates, and the equation gives \(b_t\)
in \(L^2H^{m-1}\) because the shifted operator maps
between those two spatial spaces. Differences of finite
projections obey the same estimate. Thus the limit is
strongly continuous into \(H^m\) including the prescribed
trace and solves the equation. Its weighted derivative is
\(e^{\alpha t}a_t=b_t-\alpha b\). Scalar modal equations
give uniqueness for a prescribed trace.

The full graph trace is also intrinsic, as E47 asserts.
For each finite projection \(v\) of \(b\), integrate the
derivative of \(\|v\|_{\mathcal H^m}^2\) toward a sequence
tending to infinity where that norm tends to zero. This
gives the uniform-square bound
\(2\|v_t\|_{L^2\mathcal H^{m-1}}\|v\|_{L^2\mathcal H^{m+1}}\).
Applying it to projection differences gives a continuous
representative for the full graph space, including at
zero, tending to zero at infinity. Closedness of the
distributional derivative gives completeness. These
facts verify the weighted isomorphism in the actual
\(H^m\) solution and trace spaces of E47 (6). [E47, half-line isomorphism][e47].

**Printed trace comparison confirmed.** The displayed
\(P_{2k}\) norm on p. 39 contains the pair
\(L^2H^{2k}\) and first time derivative in \(L^2H^{2k-2}\).
The same graph argument gives trace in \(H^{2k-1}\).
In the eigenmode extension \(e^{-tG_0}a_0\), the squared
weight of time derivative \(j\), after integration, is
\[
 \frac{(1+\lambda)^{2(k-j)}\lambda^{2j}}
      {2(\lambda-\alpha)}
 \ \lesssim\ (1+\lambda)^{2k-1}.
\]
Finite spectral projections and late-time cutoffs justify
membership in the displayed completion. Thus the range
of the trace is exactly \(H^{2k-1}\). The printed
continuous map into \(H^k\) is consistent with this
embedding, but the asserted isomorphism into
\(P_{2k-2}\times H^k\) on pp. 39–40 cannot be onto
when \(k\ge3\). A datum in \(H^k\setminus H^{2k-1}\)
has no preimage even with zero forcing. This comparison
concerns those displayed spaces. It is separate from
the new weighted graph estimate. [Fine PDF, pp. 39–40][fine].

## E48 fixed operator and quadratic estimates

**Pass.** The curvature is \(F_0+\operatorname{Alt}(Da)+
[a\wedge a]/2\). In \(DF_A\) the only second derivatives
come from the fixed exterior-symbol map on \(D^2a\).
For the physical term \(v=-d_A^{*g_A}[(B-2I)F_A]\), the
codifferential acting on this two-form gives one derivative
of its pointwise curvature expression and the
Levi-Civita connection difference times its undifferentiated
value. The latter connection difference is linear in \(Dg_A\)
with smooth metric coefficients, so it too has only
one \(DF_A\) factor. These terms are additive. The vertical
correction is \(-d_0\delta_0a-[a,\delta_0a]\), with
fixed top coefficient. The horizontal correction contains
\(\Delta_0 S_0^*a\), whose product rule differentiates
fixed coefficients and \(a\) twice at most. The outer
\(S_A\) is algebraic in \(F_A\). No further derivative
falls on it. Thus the total top coefficients are smooth
in \(x,a,F_A\), with remaining terms smooth in \(x,a,Da\).
Exchanging the ordered reference covariant derivatives
adds only fixed base and internal curvature contractions.
[E48 (2)–(4)][e48].

With the left action \(h(A)=(h^{-1})^*A\),
\(R(\phi+\chi_A Y,A)=-d_A\phi-S_A Y\).
The generator \(\xi_{\rm st}=-\delta_0a-
\chi_A(\Delta_0S_0^*a)\) therefore yields the two
negative correction terms in \(v-R(\xi_{\rm st},A)\).
The variation of each outer operator in those terms
hits an input that vanishes at \(a=0\). Together with
the exact physical Hessian above this gives the full
linearization \(-G_0\) with all fixed commutators included.
The principal margin persists by continuity in the fixed
pairing. [Fine PDF, (3.4) and Lemma 4.4][fine] ·
[E48 (5)–(6)][e48].

The written (4.9) on p. 38 instead has the live adjoints
and live Laplacian. With the rough reading of that
Laplacian as in the gradient-square form of Proposition
4.12, the cubic differential of the literal horizontal
term comes from the two derivatives of the varied
\(S_A^*a\) and the derivative of the varied Christoffel
coefficient in \(-g^{ij}\partial_i\Gamma^k_{j\ell}X^\ell\).
After multiplication by the outer \(S_A\), it lies in
\(\operatorname{im}S_A\). In a horizontal curvature
variation \(b=S_A Y\), naturality gives
\(D_F g[\xi\wedge b]=\xi\otimes Y^\flat+Y^\flat\otimes\xi\),
in the real symbol convention. The contracted Christoffel
variation in the vertical term is \(|\xi|_g^2Y\), so
its cubic part is \(-|\xi|_g^2\xi\otimes a(Y)\).
The images \(\operatorname{im}S_A\) and
\(\xi\otimes\mathfrak{so}(E)\) intersect trivially for
any definite curvature basis by the earlier contraction
argument. Thus the vertical cubic part cannot cancel if
\(a(Y)\ne0\). E48's small supported smooth perturbation
realizes this condition while preserving definiteness.
This verifies the scoped literal derivative-order observation
and the distinction from the fixed gauge. [Fine PDF, (4.9)][fine] ·
[E48 (7)][e48].

For the quadratic estimates set \(s=m-1\ge5\).
The first jet \(j(a)=(a,Da)\) is bounded in \(H^s\)
by \(C\|a\|_{H^m}\). It therefore stays in a fixed
smooth coefficient tube for small \(\|a\|_{H^m}\).
In differentiating a smooth coefficient through order
\(s\), the sum of orders of positive-order jet factors
is at most \(s\). Two factors of order at least \(s-2\)
would contribute at least \(2s-4>s\), so at most one
factor needs \(L^2\) allocation. Every other derivative
of order at most \(s-3\) has at least \(H^3\) regularity
and is in \(L^\infty\) in dimension four. Terms with no
large factor are bounded in \(L^2\) by finite chart
volumes. The same allocation proves the \(H^s\) product
bound. The cutoff and transition tensors have bounded
fixed derivatives.

Taylor and mean-value subtraction give
\(\|C^\sharp(j(a))\|_{H^s}\lesssim\|a\|_{H^m}\),
and its difference bound by \(C\|a-b\|_{H^m}\).
The Taylor remainder \(L^\sharp\) is quadratic in the
jet. Its difference uses one jet difference and one
bounded \(H^s\) jet factor along a segment, of size
\(\|a\|_{H^m}+\|b\|_{H^m}\). Both segment endpoints and
the segment stay in the fixed tube. Since
\(\|D^2a\|_{H^s}\lesssim\|a\|_{H^{m+1}}\), the principal
product difference splits into
\(C^\sharp(j(a))D^2(a-b)\) and
\((C^\sharp(j(a))-C^\sharp(j(b)))D^2b\).
The respective norms are bounded by
\(C\|a\|_{H^m}\|a-b\|_{H^{m+1}}\) and
\(C\|b\|_{H^{m+1}}\|a-b\|_{H^m}\).
The lower-order quadratic term is absorbed by the same
sum using the continuous Sobolev embeddings between
adjacent orders. This proves both bounds in (10), with
the required one-higher-derivative budget and no
unverified product at the endpoint \(m=6\). [E48 (8)–(10)][e48].

## Evidence record

On 22 November 2026 I reinspected the frozen local copy of
Joel Fine, *A gauge theoretic approach to the anti-self-dual
Einstein equations*, arXiv:1111.5005v2, 29 November 2011.
Relevant selected passages included Definitions 1.4–1.5
and Lemma 2.2, pp. 4–5 and 12, Lemmas 3.7–3.9 and the
chirality argument, pp. 22–24, (3.4) and the gradient and
action formulas, pp. 19 and 29–34, and Propositions
4.12–4.13 and the stability proof, pp. 38–40. I rendered
and visually verified pp. 33 and 38–40 for the square-root
signs and trace notation and checked p. 34's algebraic
identity directly against the PDF text. The local PDF is
447930 bytes with its previously recorded digest. No copy
was overwritten, no new reading copy was retained, and
the original retrieval details remain unknown. These
are selected-passage and formula checks. [Frozen local PDF][fine] ·
[Versioned primary link][fineonline] · [Canonical record][source].

[req]: ../research-progress/handoffs/SP4-CME-E51_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E51_RETURN_v1.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e48]: ../notes/48_FIXED_STABILITY_GAUGE_20261122.md
[e29]: ../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
[e01]: E01_FOUNDATION_ASSESSMENT_20261122.md#normalization-correction-to-integrate
[fine]: ../../../../references/1111.5005v2.pdf
[fineonline]: https://arxiv.org/pdf/1111.5005v2
[source]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#fixed-reference-stability-follow-up
