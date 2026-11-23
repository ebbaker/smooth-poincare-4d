# SP4-CME-E58 — Audit of the critical flat quasilinear model

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I did not write E53 or E54. I worked
on other branch estimates and audits. This packet independently
checks the nonlinear steps while taking the assessed E53 linear
result as an input. Both frozen hashes matched before use. The
[request][req] and [return][ret] identify the versions.

**Pass.** The global mild theorem holds in the stated small ball for
the fixed unit flat \(\mathbb T^4\), finite-dimensional real vector
system, and \(B=B^{1/2}_{8,1}\). The audit found no failed estimate
or missing analytic input. Below, all norms use the exact E53
partition and volume normalization. [E54][e54] · [Assessed E53][linear].

## Difference norm and spatial products

**Both directions check.** For \(0<s<1\) let
\(\mathfrak d_s(u)=\int_{\mathcal F}|h|^{-4-s}\|\delta_hu\|_8\,dh\).
The auxiliary cutoff equals one on each block's support.
Its derivative multiplier has kernel \(L^1\) bound \(C2^j\),
including the fixed low block at \(j=0\). Translation invariance
of the \(L^8\) norm and integration of the block derivative along the
segment of length \(|h|\) give
\[
 \|\delta_h\Delta_j u\|_8
 \le C\min(1,2^j|h|)\|\Delta_j u\|_8 .
\]
Since \(\mathcal F=[-\tfrac12,\tfrac12)^4\) lies in \(|h|\le1\),
the radial integral of the weight for this majorant is bounded by
\[
 C\left(2^j\int_0^{2^{-j}}r^{-s}\,dr
             +\int_{2^{-j}}^1r^{-1-s}\,dr\right)
 \le C_s2^{sj}.
\]
This includes \(j=0\), with an empty second interval. Absolute
\(L^8\) reconstruction and Tonelli prove
\(\|u\|_8+\mathfrak d_s(u)\lesssim\|u\|_{B^s_{8,1}}\).

In the other direction the high-block kernels have zero mean
since their frequency symbols vanish at zero. Take a fixed
decay order \(L>4+s\) in the periodized kernel estimate. For
the \(\ell=0\) translate, write \(r=|h|>0\) and split the block
sum at \(2^jr=1\). The part with \(2^jr\le1\) is bounded by
\(C r^{-(4+s)}\) by geometric summation. The other part is
bounded by \(C r^{-L}\sum_{2^jr>1}2^{(4+s-L)j}
\le C r^{-(4+s)}\), including when the first part is empty.
For \(\ell\ne0\), coordinatewise
\(|h_i+\ell_i|\ge|\ell_i|/2\) whenever \(\ell_i\ne0\).
This gives \(|h+\ell|\ge|\ell|/2\). The translated tail is
therefore bounded by
\[
 C\sum_{j\ge1}2^{(4+s-L)j}\sum_{\ell\ne0}|\ell|^{-L}<\infty,
\]
since \(L>4+s\) controls the block sum and \(L>4\) the lattice
sum. On this cube the resulting constant is bounded by a
constant times \(r^{-(4+s)}\). Hence
\(\sum_{j\ge1}2^{sj}|K_j(h)|\lesssim |h|^{-4-s}\).
The zero-mean subtraction in the high blocks uses
\(u(x-h)-u(x)\), whose \(L^8\) norm equals
\(\|\delta_hu\|_8\) by translation. Minkowski and Tonelli
give the reverse bound for the high blocks, and the low-block
\(L^1\) kernel gives \(C\|u\|_8\). This proves the exact
equivalence used at \(s=1/2\). [E54, translation norm][e54] ·
[E53, kernel normalization][e53].

**Product and composition checks.** For a fixed bilinear map \(P\),
the two product increments are
\(P(\delta_hu,\tau_hv)\) and \(P(u,\delta_hv)\). Taking
their \(L^8\) norms and integrating against the difference
weight gives the two terms in E54 (3). The ordinary
\(L^8\) part has the same bound. The critical embedding
into \(C^0\cap L^\infty\) gives the \(B\) algebra estimate.
This applies to matrix evaluation on a vector and, in two
uses, to a value-dependent bilinear coefficient evaluated
on two vectors. The map norm is the finite-dimensional
operator norm.

Fix a closed convex ball in the common coefficient domain.
For a smooth \(F\) on it, the values and increments of
\(F(u)-F(0)\) cost at most \(c_1=\sup\|DF\|\) times the
respective \(L^8\) and difference sizes of \(u\). At volume
one the constant \(F(0)\) has exactly its tensor norm in the
low block and vanishes in all other blocks. For \(w=u-v\)
write \(F(u)-F(v)=\int_0^1DF(v+\theta w)w\,d\theta\).
On translating, one increment differentiates \(w\) and costs
\(c_1\|\delta_hw\|_8\). The other increment differentiates
\(DF\), costing
\[
 c_2\|w\|_\infty(\|\delta_hu\|_8+\|\delta_hv\|_8),
 \qquad c_2=\sup\|D^2F\|.
\]
Convexity puts the pointwise segments for both estimates
in the same tube. The \(L^8\) part costs \(c_1\|w\|_8\).
By the two norm equivalences this proves (4) without a
coefficient extension or a derivative of \(u\) in the
coefficient estimate. [E54 (3)–(4)][e54].

## Time norms, value tube and forcing differences

**Block-time order checks.** Set
\(a_j=2^{sj}\|\Delta_jU\|_{L^\infty_tL^8}\) and
\(b_j=2^{(s+2)j}\|\Delta_jU\|_{L^1_tL^8}\).
Scalar time interpolation at fixed \(j\) gives
\[
 2^{(s+1)j}\|\Delta_jU\|_{L^2_tL^8}
 \le \sqrt{a_j b_j}.
\]
Cauchy–Schwarz after summing \(j\) gives
\(J(U)\le M(U)^{1/2}H(U)^{1/2}\). The \(\ell^1\) sum
remains outside \(L^2_t\) in \(J\). Minkowski gives the
ordinary \(L^2_t B^{s+1}_{8,1}\) norm bounded by \(J\);
Tonelli gives equality between \(H\) and the ordinary
\(L^1_tB^{s+2}_{8,1}\) norm. At any time
\(\|U(t)\|_B\le M(U)\), in the direction used.
The auxiliary multiplier on each block gives
\(\|D^k\Delta_jU\|_8\le C 2^{kj}\|\Delta_jU\|_8\) for
\(k=1,2\). Commutation and summation then give
\(\|DU\|_{L^2_tB}\lesssim J(U)\) and
\(\|D^2U\|_{L^1_tB}\lesssim H(U)\).
Finite block sums are continuous and converge strongly
at almost every time in the higher Besov norms where
the weighted sum is finite. This makes their derivatives
strongly measurable and identifies them distributionally.
[E54 (5)–(6)][e54] · [E53, dense block reconstruction][e53].

The diffusion array at real \(\xi\) has Hermitian quadratic
form bounded below by
\[
 |\xi|^2|v|^2-\left(\sum_{i,j}\|A^{ij}(z)\|_{\mathrm{op}}\right)
 |\xi|^2|v|^2 ,
\]
using \(|\xi_i\xi_j|\le|\xi|^2\). Choosing \(\rho\) with
the sum at most \(1/2\) is possible since \(A^{ij}(0)=0\).
The same real matrix operator norm applies after complexifying
the fiber. Thus rank-one positivity holds without assuming
symmetry. An \(X\) radius \(R\le\rho/(2C_{\rm emb})\)
keeps both paths and their pointwise segments inside that
one tube, uniformly for all times. Smooth coefficient
bounds and all constants may be taken on the single
closed \(\rho\) ball. Composition is continuous in time
in \(B\) on the bounded paths, so all products used
below have the requisite strong measurability.

**Both principal terms and all gradient differences check.**
Suppressing the fixed finite tensor indices, the principal
difference is
\[
 A(U)D^2w+(A(U)-A(V))D^2V,\qquad w=U-V.
\]
The coefficient sizes in \(L^\infty_tB\) are bounded by
\(C M(U)\) and
\(C(1+M(U)+M(V))M(w)\), respectively. The first bound
uses \(A(0)=0\). The second derivatives contribute
\(H(w)\) and \(H(V)\) from \(L^1_tB\).
This gives exactly E54 (7), including the direct
\(M(U)H(U)\) bound.

For each \(i,j\) the complete gradient difference is
\[
 Q^{ij}(U)[\partial_iw,\partial_jU]
 +Q^{ij}(U)[\partial_iV,\partial_jw]
 +(Q^{ij}(U)-Q^{ij}(V))[\partial_iV,\partial_jV].
\]
No slot interchange or symmetry is used. The first two
terms cost \(C(1+M(U))(J(U)+J(V))J(w)\) by time
Cauchy–Schwarz and the two \(B\) products. The coefficient
difference in the last term costs
\(C(1+M(U)+M(V))M(w)J(V)^2\). The single-field term
costs \(C(1+M(U))J(U)^2\), with the constant allowing
nonzero \(Q^{ij}(0)\). These are exactly (8).
On \(R\le1\),
\(J(V)^2\le\|V\|_X^2\le\|V\|_X\) and the other
bounded coefficient factors can be absorbed. This proves
(9) with one \(C_N\) and the exact Bochner forcing
norm \(L^1_t B\) on the whole half-line.
[E54 (7)–(9)][e54].

## Mild fixed point, traces and Hessian

**E53 input conditions and constants check.** The datum is
real in \(B^{1/2}_{8,1}\) and (7)–(9) give strongly
measurable forcing in \(L^1(0,\infty;B^{1/2}_{8,1})\),
as required by E53 (6) for \(e^{t(\Delta-1)}\).
This is the constant-coefficient heat Duhamel map;
there is no need to import a variable-coefficient
linear theorem. Damping controls the low block on the
whole half-line. The path space is exactly E53's
finite-\(E_\infty\) class with strong \(B\) continuity.
For completeness, a Cauchy sequence in \(X\) is
uniformly Cauchy in \(B\), hence has a continuous
path limit. Passing to each block and using Fatou
for its time integral and the block sums gives
\(\|U_n-U\|_X\le\liminf_m\|U_n-U_m\|_X\).
This also shows the radius-\(R\) ball is closed.

With the linear constant \(K\), \(R\) as in E54 and
\(\epsilon=R/(4K)\), the image bound is
\(K\epsilon+KC_NR^2\le R/4+R/8=3R/8\)
and its Lipschitz constant is \(2KC_NR\le1/4\).
The fixed point is real by real iteration. By E53
it has the strong \(B\) trace, and \(\|u\|_\infty
\le C_{\rm emb}\|u\|_B\) gives the uniform spatial
trace. Its nonlinear products are the actual weak
derivative products in \(L^1_tB\), so the Duhamel
equation gives the distributional equation.

Any distributional path with the given trace in the
same small \(X\) ball has the same \(L^1_tB\)
source bound. Subtract its Duhamel solution for
its own source and apply E53 uniqueness, equivalently
the scalar distributional ODE for each Fourier
coefficient with zero initial value. It must
therefore be a fixed point in the same ball.
For two initial data the difference inequality gives
\(K/(1-1/4)=4K/3\). For one fixed point,
\(\|U\|_X\le K\|U_0\|_B+KC_NR\|U\|_X\)
gives \(\|U\|_X\le(8K/7)\|U_0\|_B\).

E53 (7) applies to this actual path. Its endpoint
Bernstein estimate for the Hessian of a block is
\(C2^{(2+1/2)j}\|\Delta_jU\|_8\) in \(L^\infty_x\).
Time integration and summation give
\(\int_0^\infty\|D^2U(t)\|_\infty\,dt\le CH(U)\).
The derivative is the \(L^1_tC^0_x\) limit of the
block derivatives and agrees with the weak Hessian.
Finally the full weak-derivative graph embedding
of E53 (4) gives the sufficient threshold
\(\|U_0\|_8+\|dU_0\|_{4,1}\le\epsilon/C_{\rm grad}\).
For the nonlinear solution this gives the same
strong Besov and uniform traces as before. A strong
Lorentz derivative trace for a forced solution is
outside this conclusion. [E53 (4), (6)–(7)][e53] ·
[E54, contraction and trace][e54].

The result is the stated mild flat calibration. This audit
does not infer smoothness at positive time or transfer
the estimates to a geometric evolution. The arguments
above use the two frozen derivations and elementary
integral, Fourier and fixed point estimates. No additional
primary source or reading copy was used.

[req]: ../research-progress/handoffs/SP4-CME-E58_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E58_RETURN_v1.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e54]: ../notes/54_CRITICAL_QUASILINEAR_MODEL_20261122.md
[linear]: E53_CRITICAL_HEAT_ASSESSMENT_20261122.md
