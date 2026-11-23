# SP4-CME-E107 — Finite internal Coulomb gauge manuscript audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E101 and the inherited
E89 and E66 inputs, and did not author E98 or E99. This is an audit
of the lead's integration against the already assessed work.
The frozen target and input digests matched at consumption.
The lead was notified after the target was read. All manuscript line
numbers here refer to the consumed frozen working TeX.
See the [request][req] and [return][ret].

## Finite Lorentz gauge

The assumptions and conclusion at frozen lines 4954–4982 agree
with E98. The inherited fixed setting is the smooth oriented
standard round Riemannian \(S^4\) with its positive perfect chiral
\(\mathrm{SO}(3)\) connection \(A_0\), the native round metric and
the fixed internal pairing. The gauge covers the base identity.
The curvature of the perturbation and its higher derivatives are
absent from the \(L^{4,1}\) entry condition. The displayed norms of
\(\phi,u-I,d_0u,b\) are the quantitative E98 norms.
[E98 (1)][e98] · [E101, E98 check][e101].

The ordinary adjoint zero-form operator in lines 4985–5019 is
\(K=d_0^*d_0\). Parallelism and the pointwise curvature span give
zero kernel, as the center of \(\mathfrak{so}(3)\) is zero.
The fixed weak inverse is coercive and gives \(L^2\to H^1\) for
\(L=K^{-1}d_0^*\). The borrowed localization procedure is applied
to this operator with its own density-weighted symbol. In the
weak equation for \(q=Lw\), the displayed \(B,C,M,D_1\) follow
from \(\int(\partial_i+\gamma_i)\eta\cdot A^{ij}
(\partial_j+\gamma_j)q\) and moving \(C^j\partial_jq\) into
divergence plus value. The forcing is
\(-\partial_i F^i+\gamma_i^*F^i\) with
\(F^i=\mu g_0^{ij}w_j\), so the divergence and value signs
are correct. The frozen gradient-from-flux symbol uses
\(A_*(\xi)=\mu(x_*)|\xi|_{g_0(x_*)}^2I\).
No finite-rank subtraction or projected orbit operator is used.
The referenced cutoff identity and patch absorption carry over to
this symbol and the listed lower terms. The mollifier estimate
removes the \(L^8\) value remainder via the existing weak \(L^2\)
estimate. The common weak action justifies the layer argument,
and the reference ray estimate yields continuity and smooth graph
approximation. [E98 (2)–(3)][e98] · [E101, ordinary inverse][e101].

The gauge formula and exact exponential derivative in lines
5020–5047 use the action
\(u(A)=uAu^{-1}-(du)u^{-1}\). The remainder contains both
\((E_\phi-I)a\) and the integral with the subtractive sign.
Thus \(d_0^*b=d_0^*(a+N)-K\phi\) and the fixed-point sign is
\(\phi=L(a+N)\). If \(s=\|a\|_{4,1}\) and \(R=2C_Ls\),
the displayed bounds give image norm at most
\(C_Ls+C_LCR(s+R)\) and Lipschitz factor
\(C_LC(s+2R)\) on the radius-\(R\) ball. A single fixed
reduction in \(s\) ensures invariance, strict contraction and
a fixed small exponential chart. The weak inverse gives exact
Coulomb for the resulting \(L^2\) fluxes.
[E98 (6)–(8)][e98] · [E101, contraction check][e101].

The proof uses \(W^{1,4}\) tests in lines 5049–5072 before
deducing a second derivative of \(u\). The fixed metric
endomorphism derivative preserves skew and symmetric parts.
For smooth \(v\), \(vu^\top\) is admissible since \(u\in
W^{1,4}\cap C^0\), and the pairing against \(b\in L^4\)
is continuous on \(W^{1,4}\) on the finite-volume base.
Cyclic trace gives the two displayed terms. The resulting
distributional equation is \(D_0^i(b_i u)=b_iD_0^iu\).
Using \(b_i u=u a_i-D_{0,i}u\) and
\(\Delta_0=-D_0^iD_{0,i}\) on endomorphism zero-forms gives
\[
 \Delta_0u=b_iD_0^iu-(D_0^iu)a_i-uD_0^ia_i.
\]
With \(w=u-I\) the manuscript retains \(D_0I=0\), the
mass term \(w\), the drift signs and the bounded forcing
\(f=w-uD_0^ia_i\). The forcing depends on the smooth input.
Only \(\|\mathcal B\|_4\le C\|a\|_{4,1}\) is required to be
small. [E98 (9)][e98] · [E101, product test][e101].

Lines 5074–5104 keep the separate fixed endomorphism-valued
mass resolvent for \(p=2,3,6\). For \(p=2\) the localized
difference quotient supplies \(H^2\). For \(p=3,6\) the
compressed argument freezes the scalar top coefficient of
the expanded operator, absorbs first-order terms and controls
the \(L^2\) remainder by the weak mass inverse. Its
second derivative multiplier therefore has denominator
\(g_0^{k\ell}(x_*)\xi_k\xi_\ell\), as in E98 (4).
The right side initially belongs to \(L^2\) since
\(D_0w\in L^4\) and the drift coefficients are \(L^4\).
The same fixed drift operator is small on \(H^2\) using
\(H^2\subset W^{1,4}\) and on \(W^{2,3}\) using
\(W^{2,3}\subset W^{1,12}\). The \(W^{2,3}\) Neumann
solution is also in \(H^2\) on the compact base, so
uniqueness there identifies it with \(w\). With \(D_0u,b\)
now in \(L^{12}\), their products give the \(L^6\) right
side for \(W^{2,6}\). The polynomial right side and
\(W^{m,6}\) algebra yield all orders, followed by the
smooth logarithm on the fixed exponential chart.
This compression preserves the separate low-norm threshold
and qualitative smooth regularity argument.
[E98 (4)–(5), (9)][e98] · [E101, regularity check][e101].

## Static Coulomb gain and the combined consequence

Frozen lines 5107–5163 retain the actual curved first-order
operator \(\mathcal D=d_0\oplus d_0^*\) on adjoint one-forms.
Its principal squared symbol is \(|\xi|_{g_0}^2 I\) by the
wedge-contraction norm identity. Thus \(I+\mathcal D^*\mathcal D\)
has scalar principal part. For \(q=\mathcal Dv\), \(f=v\)
the equation with \(\mathcal D^*q+f\) is an identity on smooth
forms. If \(\mathcal D=L^i\partial_i+L^0\), its
density-weighted forcing flux is \(\mu(L^i)^*q\)
and its value forcing is \(\mu(L^0)^*q+\mu f\).
These are the flux and value to which the cited localization
applies. The lower coefficients and cutoffs are fixed. The value
forcing and the lower cost of \(v\) are absorbed by the recorded
mollifier interpolation, retaining \(\|v\|_2\). There is
no kernel assumption on \(\mathcal D\).
[E99 (2)–(4)][e99] · [E101, fixed static estimate][e101].

The static bootstrap preserves the three distinct uses of
the fixed estimate. At \(p=3\), \([b\wedge b]\) is
bounded by \(C\|b\|_4\|b\|_{12}\) and the embedding
\(W^{1,3}\subset L^{12}\) allows absorption using
small \(\eta\). At \(p=6\) the bracket costs
\(C\|b\|_{12}^2\), giving a uniform bound through
\(W^{1,6}\subset C^0\) when \(\eta\le1\). At \(p=8\)
the product bound uses \(\|b\|_\infty\|b\|_8\) and
\(\|b\|_8\le\operatorname{Vol}(g_0)^{1/24}\|b\|_{12}\).
The final Morrey power is \(1-4/8=1/2\).
The fixed embeddings and their cutoff errors are correctly
compressed. Curvature derivatives do not enter.
[E99 (1), (5)–(6) and static bootstrap][e99].

Lines 5165–5199 use finite volume to enter the Lorentz
theorem from fixed connection sup smallness. The exact
curvature relation
\(\beta_b=u\beta u^{-1}+(uF_0u^{-1}-F_0)\)
gives fixed sup control of the new curvature difference using
\(\|u-I\|_\infty\) and the reference curvature. It gives
the needed E99 datum with the \(L^4\) bound on \(b\).
Then \(d_0u=u a-bu\) gives the first derivative in \(C^0\)
from the two connection value bounds. Conversion to coordinates
adds fixed coefficients times \(u-I\).
The assessed \(W^{1,8}\) bound for \(u-I\) also follows
from this \(C^1\) estimate on the fixed compact sphere.
The proof provides the asserted \(C^1\) gauge control,
with no uniform Hölder bound on \(d_0u\) established.
The base identity explains why the reconstructed metric
is unchanged wherever the curvature reconstructs it.
The final scope excludes horizontal placement \(S_0^*b=0\).
[E101, combination][e101] · [Lead assessment][assess].

## Feehan comparison and manuscript references

The frozen citation identifies a valid comparison. The fixed
base, critical norms and weighted divergence costs agree with
E93 and R25. The two representative costs add
\(\|d_0^*a\|_{L^\sharp\cap L^2}\) to, respectively,
\(\|a\|_{L^{2\sharp,4}}\) and \(\|a\|_{H^1_{A_0}}\).
The quotient distances take infima over fixed-base gauges.
Theorems 1.1–1.2 concern quotient placement and neighborhoods,
while Theorems 8.2 and 8.4 use chosen-representative hypotheses.
The new manuscript proof is a separate Lorentz contraction and
static gain. In particular it does not need to deduce Feehan's
weighted divergence or quotient smallness from its own hypotheses.
E107 uses only the recorded selected-passage inspection of the
published version and supplies no new source inspection.
[E93 source audit][e93] · [R25 canonical source record][r25].

The manual Feehan entry at frozen lines 7089–7093 agrees with
R25 and the canonical BibTeX author, title, journal, year, volume,
issue, pages and DOI. That DOI identifies the published version
recorded with the canonical publisher-PDF URL. A first-use scan
finds the 33 keys in exact manual bibliography order, with Feehan
after Hamilton's Nash–Moser article and before Ludewig. A
source-level scan found no duplicate labels, unresolved internal
references or unmatched citation keys, including the subsection,
proposition, lemma, corollary and cited orbit-inverse proposition.
The manuscript was not built in this audit.
[Canonical bibliography][bib] · [R25 catalog][catalog].

## Exact wording corrections

1. At frozen lines 4959–4962 separate the quotient and
   representative hypotheses. Use “Feehan's fixed-base
   critical-exponent slice results on a closed Riemannian
   four-manifold use quotient distances defined from connection
   norms and weighted divergence terms (Theorems 1.1–1.2).
   The local representative constructions use the corresponding
   costs on a chosen representative (Theorems 8.2 and 8.4).”
   Keep both locators on the same canonical citation key.
2. At frozen lines 5129–5130 say “The adjoint flux multiplier
   has weak \((1,1)\) and strong \(L^2\) bounds, giving the
   \(L^p\) estimates by duality at \(3/2,6/5,8/7\).”
   Both bounds are applied to the adjoint before interpolation
   and duality. The referenced annular estimates justify the
   current calculation.

Beyond those precision edits, the frozen integration passes
within the E98/E99/E101 scope. No shared files were edited.

[req]: ../research-progress/handoffs/SP4-CME-E107_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E107_RETURN_v1.md
[e98]: ../notes/98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
[e99]: ../notes/99_VALUE_SMALL_COULOMB_ESTIMATE_20261122.md
[e101]: E101_VERTICAL_GAUGE_STATIC_GAIN_AUDIT_20261122.md
[assess]: E98_E101_VERTICAL_GAUGE_ASSESSMENT_20261122.md
[e93]: E93_CRITICAL_GAUGE_SOURCE_AUDIT_20261122.md
[r25]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#critical-gauge-source-discovery--feehan-2001
[bib]: ../../../../references/references.bib
[catalog]: ../../../../references/README.md
