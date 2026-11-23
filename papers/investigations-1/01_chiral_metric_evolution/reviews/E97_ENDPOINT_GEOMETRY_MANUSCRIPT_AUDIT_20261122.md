# E97 Lorentz inverse and near-round geometry manuscript audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
I authored the earlier E70 fixed Lorentz audit and the E67 critical
budget audit. I did not author E88, E89, E90 or E92. This is a check
of the lead-authored integration against those assessed inputs.
All line numbers refer to the frozen manuscript. [Frozen request][req].

**Disposition.** Both integrated results pass. The Lorentz
estimate uses its own fixed divergence inverse, with the full
weak kernel correction and only varying value smallness. The
geometry comparison uses the smooth round endpoint of the
same unadjusted flow, exact volume, and the intrinsic budget on
the stated smooth orbit neighborhood. The details below
identify optional precision edits to the compressed proof.

## Fixed divergence estimate

**4415–4455, `prop:lorentz-orbit-inverse`.**
The proposition inherits the selection by \(L^2\)-orthogonality to
the fixed smooth kernel \(N\) and the two residual slice tests from
`lem:varying-slice-inverse`. For arbitrary bundle one-form flux \(w\), the kernel
coordinate of \(d_0^*w\) on \(\psi_j\in N\) is
\((w,d_0\psi_j)_2\). Thus the displayed \(R_N w\) is exactly the
extension of the orthogonal kernel projection to weak divergences.
Its coefficient functionals are bounded in \(L^2\) and \(L^8\) by
smoothness of the fixed basis, and its output is smooth. If
\(w\in\ker S_0^*\) then \(R_Nw=0\) because
\(d_0\psi_j\in\operatorname{im}S_0\). The proof retains the
correction for general fluxes, including the layers used
later. The fixed weak inverse gives the \(H^1\) bound on
\(N^\perp\). [E88, (2)][e88] · [E89, weak endpoint][e89].

The density-weighted fixed scalar operator in a fixed chart has
principal symbol \(\tfrac23\mu|\xi|_{g_0}^2I\), and its fixed
first-order terms can be put into the divergence of \(M^i\phi\)
and a matrix \(D_1\) acting by multiplication. At 4449–4452,
calling \(D_1\) a zeroth-order matrix would make clear why
\((I-D_1)v\) is a value forcing in the next step. For the
right-hand side, \(F^i=\mu g_0^{ij}w_j\) and \(G\) has only
fixed frame multiples of that flux and \(-\mu R_Nw\).
Thus no derivative bound on \(w\) is used.
[E88, (3)–(4)][e88] · [E89, local form][e89].

**4456–4496.** Multiplication by \(\chi\) introduces both
principal cutoff terms. One is already
\(-\partial_i[A^{ij}(\partial_j\chi)\phi]\), and the
other is the rewritten term at 4457–4459. Also
\(-\chi\partial_iF^i=-\partial_i(\chi F^i)
+(\partial_i\chi)F^i\). Together these give the displayed
\(L^8\) flux and value estimates involving only \(w,R_Nw,\phi\).
The finite cover may be refined with the frozen constants
uniform in the centers from the fixed master charts.
After freezing, the flux symbol for the differentiated
solution is \(\xi_i\xi_j(I+A_*(\xi))^{-1}\), with the sign
coming from \(i\xi_i(-i\xi_j)\). This is a distinct divergence
multiplier. The prior \(G_0\) proof is used for the annular
weak-\((1,1)\) and adjoint interpolation argument, and does
not replace \(\mathcal K_0^\dagger d_0^*\) by \(G_0^{-1}\).
The value gradient multiplier \(i\xi_i(I+A_*(\xi))^{-1}\)
has high annular \(L^1\) kernel costs \(C2^{-j}\), plus a
smooth compact low multiplier. Same-piece absorption of the
coefficient variation precedes summing the cutoffs.
[E88, (3)–(6)][e88] · [E89, divergence multiplier][e89].

To remove \(\|\phi\|_8\), the scale-\(h\) convolution
term has \(L^{8/5}\) kernel norm \(Ch^{-3/2}\) by four-dimensional
scaling. The difference costs \(Ch\|\partial v\|_8\) by
translation and integration of derivatives. On reconstructing,
fixed frame and cutoff derivatives give an extra
\(Ch\|\phi\|_8\), which is absorbed first. The resulting
\(\|\phi\|_8\le\varepsilon\|D_0\phi\|_8+
C_\varepsilon\|\phi\|_2\) then absorbs into the global gradient
estimate. The low \(\|\phi\|_2\) bound is from the weak inverse
and \(\|w\|_2\le V^{3/8}\|w\|_8\). At 4490–4495,
mentioning the first absorption would expose the full order
of this argument. The compressed inequalities are correct.
[E88, (6)–(7)][e88] · [E89, remainder removal][e89].

**4497–4501.** The \(L^8\) estimate first applies to smooth
fluxes and their smooth fixed inverse images. Smooth
\(L^8\) approximation also converges in \(L^2\) on the
fixed compact base, so the \(W^{1,8}\) and \(H^1\) outputs
agree. The earlier vector-layer argument works for
\(D_0^j\mathscr L\), \(j=0,1\), on arbitrary tensor layers.
An input layer of distribution measure \(m\) has endpoint
sizes \(m^{1/2}\) and \(m^{1/8}\). Geometric interpolation
of the output gives \(C(m^{1/2})^{1/3}(m^{1/8})^{2/3}
=Cm^{1/4}\). The input layers integrate in \(L^2\) by
\(m^{1/2}\le V^{1/4}m^{1/4}\), and the strongly
measurable outputs integrate in the complete Lorentz norm.
The common operator and the \(L^1\) identification yield
the derivatives of the same weak solution. The proof
preserves \(R_N\) at the layer level.
[E88, (8)][e88] · [E89, common endpoints][e89].

## Varying inverse and continuous representative

**4503–4544.** The displayed \(M_B\) follows by expanding
\(d_B=d_0+[b,\cdot]\) before the fixed divergence. Both
\((\mathsf P_B-\mathsf P_0)d_0\phi\) and
\(\mathsf P_B[b,\phi]\) are fluxes in \(\ker S_0^*\).
The perturbation estimate uses the uniform pointwise bounds
on the projections and on their difference, with no derivative
of either one. The \(R_N\) terms vanish for these fluxes and
for \(\mathsf P_Br\). Thus applying \(\mathcal K_0\) to
\((I+\mathscr L M_B)\phi=\mathscr L\mathsf P_Br\) gives precisely
\(\mathcal K_B\phi=d_0^*\mathsf P_Br\) on all weak tests.
The Lorentz graph norm is complete by closure of the weak
derivative, and its \(H^1\) inclusion follows from the fixed
finite-volume layer bound for values and derivatives.
Orthogonality to \(N\) is closed in this norm. The small
operator norm makes the Neumann solution unique there and
the weak uniqueness from the preceding lemma identifies it
with the exact parameter. The formulas for \(u,s\) then use
the same value-bounded fiber maps. In particular the
quantitative proof uses no varying-coefficient smooth
regularity constants. [E88, (9)][e88] · [E89][e89].

Averaging the ray integral results in the kernel
\(|x-y|^{-3}\). Its integral on a set of measure \(m\) is
at most \(Cm^{1/4}\) by splitting at \(m^{1/4}\).
Layer integration gives the claimed sup estimate in the
Lorentz graph norm. Fixed frame and cutoff derivatives add
only its value term. For weak sections, magnitude truncation
reduces translation continuity to bounded compactly supported truncations,
where the \(L^2/L^8\) inequality applies. Mollification
therefore approximates in the graph norm and gives a
uniform limit, identified with the weak section by its
\(H^1\) convergence. This yields the \(C^0\) representative
of \(\phi\), while \(u\) is still controlled only in \(L^{4,1}\).
The qualification at 4543–4544 correctly limits the endpoint.
[E88, continuous endpoint][e88] · [E89, exact scope][e89].

## Quantitative near-round geometry

**4706–4752, `cor:intrinsic-round-geometry`.**
The hypotheses import exactly the smooth invariant orbit
neighborhood \(\mathcal W\) and the intrinsic threshold
\(\ell\le\ell_*\) of the preceding corollary. The fixed
unadjusted flow retains the same base points and internal
fibers for the endpoint comparison. The applicable
logarithmic inequalities in the proof of
`prop:temporal-strain` are for every fixed nonzero tangent
and internal vector, and thus compare full quadratic forms.
Integrating gives loss at most \(C_*J(\infty)\le
4512\sqrt2\,C\ell=D\). At the smooth limit the metric is
the pullback \(h=f_\infty^*g_0\) and \(Q=I\), because the
pullback conjugates \(Q(A_0)=I\) by an internal isometry.
Reversing both endpoint form comparisons gives the
stated bounds for \(g,Q(A_{\rm in})\). At 4745 it would be
clearer to say that both comparisons are reversed. Pointwise
volume conservation holds along the same unadjusted path,
and its exact endpoint equality persists on multiplying
both normalized metrics by \(c=2K\). Both native terms in
the integrand have factor \(c^{-1}\) against \(d\tau=c\,dt\),
so \(J\) and the displayed exponent are unchanged.
[E90, endpoint forms and volume][e90] · [E92, E90 check][e92].

**4754–4789.** Lengths acquire \(e^{\pm D/2}\), and
infima over curves and suprema over endpoints give the
distance and diameter bounds. The dual metric forms
have factors \(e^{\pm D}\) after reversing the inverted
quadratic-form inequalities. The common volume gives
the same \(L^2\) denominator and equivalent \(H^1\)
form norms. Min–max for the nonnegative scalar Laplacians
therefore gives \(e^{\pm D}\) on all eigenvalues with
multiplicity, including \(\lambda_0=0\). At 4719, specify
“nonnegative scalar Laplace eigenvalues” to distinguish
this sign from the earlier \(\Delta=\nabla^a\nabla_a\)
notation. The common volume identifies the two function
norms in the given round Sobolev inequality, so only
\(C_\nabla\) gains \(e^D\).

In native scale \(h\) has curvature \(K/(2K)=1/2\) and
diameter \(\pi\sqrt2\). Dividing the metric by \(c\)
divides distances by \(\sqrt c\) and multiplies scalar
eigenvalues by \(c\). From normalized to native the
squared \(L^4\) function norm and gradient energy both
scale by \(c\), while the squared \(L^2\) norm scales
by \(c^2\). Thus the displayed conversion of the
Sobolev pair is correct. At \(\ell=0\) the finite-time
\(Q\) comparisons are equalities, and the smooth
limit gives \(Q(t)=I\) throughout. The original
gradient is zero there by its \(Q-I\) expression
or self-duality and Bianchi. The initial connection
therefore equals its round pullback limit. Positive
strain gives the stated form and variational comparison on
\(\mathcal W\) with the fixed threshold. The last paragraph
at 4791–4800 retains the metric derivative and placement
scope. [E90, distance, spectrum, Sobolev and zero strain][e90] ·
[E92, E90 check][e92].

## References and frozen versions

All five distinct internal reference targets used by the
two proofs resolve uniquely. There are 32 distinct active
citation keys, exactly matching the 32 manual entries in
first-use order. All are present in the canonical bibliography.
The two inserted arguments use no new bibliography entry.
No primary passage was opened or newly imported. This review
concerns these two insertions and their immediate dependencies.
Only the assigned audit and return were written.

| Artifact | SHA-256 |
| --- | --- |
| [E97 request][req] | `f15f33d83c0c2b3df082167bbab5cd72352e808f72cde720e443219596c95f6c` |
| [Frozen manuscript][ms] | `1cc4f80cb6c61b2292e4cfe808d792876c88544d4e9d3dde1fc3a8a2d17a0c9f` |
| [E88][e88] | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| [E89][e89] | `0f3e17807d50c6c35be82c2c442a3f3fce0bc139dfbb1cd83074ced88b371484` |
| [E90][e90] | `6d67f6bc601df3dc0940ee8815be30f26c83c2849f6153913deb61569ef69395` |
| [E92][e92] | `3093463d094a65495b6e40abce8ccb09fd6144c0b2455c7fef90bd53d86d82c4` |

[req]: ../research-progress/handoffs/SP4-CME-E97_REQUEST_v1.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e88]: ../notes/88_LORENTZ_ORBIT_SOLVER_20261122.md
[e89]: E89_LORENTZ_ORBIT_AUDIT_20261122.md
[e90]: ../notes/90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
[e92]: E92_GEOMETRY_AND_FROZEN_MODEL_AUDIT_20261122.md
