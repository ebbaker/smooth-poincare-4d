# SP4-FOT-MATCH-E11 · Relative Bochner bound for harmonic spinors

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Delegated configuration gpt-6.2-sol / ultra.
Serving metadata are unavailable for independent verification. This is a
local analytic result with a conditional residual criterion. Versions and
scope are fixed in [request revision 1](../research-progress/handoffs/E11_REQUEST_20261125.md).

## Statement and conventions

Let \((U,g)\) be an oriented smooth Riemannian spin four-region, and
\(\chi\in C_c^\infty(U;\mathbb R)\) supported in its interior. Let
\((\psi_a)_{a=1}^N\) be smooth positive half-spinors satisfying the actual
equations \(D_g\psi_a=0\). Put
\[
 S=\sum_a|\psi_a|^2,\qquad Q=\sum_a|\nabla\psi_a|^2,
 \qquad u^2=Q/S\quad\text{on }\{S>0\}.
\]
Use the DIR convention \(c(X)^2=-|X|^2\), \(D=\sum_i c(e_i)\nabla_{e_i}\),
\(R(X,Y)=[\nabla_X,\nabla_Y]-\nabla_{[X,Y]}\), and
\(\langle\mathcal R(X\wedge Y),Z\wedge V\rangle=\langle R(X,Y)V,Z\rangle\).
Use the four-index tensor norm for \(\mathrm{Rm}\), the full Ricci tensor
norm and the Hilbert–Schmidt norm on the self-dual Weyl block.
If \(S>0\) almost everywhere on the support, then
\[
 \int_U \chi^2|W^+|_{\mathrm{HS}}^2\,dV
 \le C\int_U\left(\chi^2|\mathrm{Ric}|^2+\chi^2|\mathrm{Rm}|u^2
             +\chi^2u^4+|d\chi|^2u^2\right)\,dV .                 \tag{1}
\]
The constant is determined by dimension and the chosen tensor norms.
The estimate holds in the extended sense if a relative integral is
infinite. The opposite chirality gives the corresponding estimate for
\(W^-\) with the reversed orientation. [DIR §§2.2–2.3](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L203)

## Commutator and differentiated estimate

Write \(q_a=\nabla\psi_a\in\Gamma(T^*U\otimes S^+)\) and let
\(D^{T^*}\) act on the spin factor with the tensor product connection.
At a normal frame and with \(X\) parallel to first order at the point,
\[
 (D^{T^*}q_a)(X)
 =\nabla_X(D\psi_a)+\sum_i c(e_i)R^S(e_i,X)\psi_a
 =\tfrac12 c(\mathrm{Ric}^{\sharp}X)\psi_a.                       \tag{2}
\]
The sign uses the spin curvature contraction in DIR §2.2, with the two
curvature arguments reversed there. In particular
\(\sum_a|D^{T^*}q_a|^2=\tfrac14|\mathrm{Ric}|^2 S\).

For a compactly supported tensor-spinor \(v\), expand the square of
\(D^{T^*}\) in a normal frame. The Clifford anti-commutator supplies
the connection Laplacian. The commutator supplies the spin curvature
contraction \(s_g/4\) and the twist curvature contraction. Thus
\[
 (D^{T^*})^2v=\nabla^*\nabla v+\tfrac14s_gv+
      \tfrac12\sum_{i,j}(c(e_i)c(e_j)\otimes R^{T^*}_{ij})v ,
\]
where the formula displays the spin factor first. The last term is
bounded by \(C|\mathrm{Rm}|\,|v|\) pointwise, and
\(|s_g|\le C|\mathrm{Rm}|\). The integrated formula gives
\[
 \|\nabla v\|_2^2\le\|D^{T^*}v\|_2^2+C\int_U|\mathrm{Rm}|\,|v|^2\,dV.
\]
For smooth real compactly supported \(f\), use this for \(v=fq_a\).
The product rules \(D^{T^*}(fq_a)=fD^{T^*}q_a+c(df)q_a\) and
\(f\nabla q_a=\nabla(fq_a)-df\otimes q_a\), followed by summation, give
\[
 \int_U f^2\sum_a|\nabla q_a|^2\,dV
 \le C\int_U\left(f^2|\mathrm{Ric}|^2S+f^2|\mathrm{Rm}|Q
                            +|df|^2Q\right)\,dV .               \tag{3}
\]
All sums are squared Hilbert norms in the direct sum of the bundles.
Clifford norms and Cauchy–Schwarz in that sum are independent of \(N\).

For \(\epsilon>0\), put \(f_\epsilon=\chi(S+\epsilon)^{-1/2}\) and
\(u_\epsilon^2=Q/(S+\epsilon)\). Pointwise \(|dS|^2\le4SQ\), so
\[
 \begin{aligned}
 |df_\epsilon|^2Q
 &\le 2|d\chi|^2\frac{Q}{S+\epsilon}+
       2\chi^2\frac{SQ^2}{(S+\epsilon)^3}\\
 &\le 2|d\chi|^2u_\epsilon^2+2\chi^2u_\epsilon^4 .
 \end{aligned}                                                     \tag{4}
\]
For harmonic spinors the positive twistor operator is \(P\psi_a=q_a\).
The DIR chiral curl identity therefore gives
\[
 \tfrac12|W^+|_{\mathrm{HS}}^2 S
  = \sum_a|\Pi(d^\nabla q_a)^+|^2
  \le 2\sum_a|\nabla q_a|^2 .                                      \tag{5}
\]
The last factor uses the exterior norm in an orthonormal basis and
\(\sum_{i<j}|(\nabla_i q)_j-(\nabla_j q)_i|^2\le 2|\nabla q|^2\).
The projection is an orthogonal contraction. Combining (3)–(5) gives
\[
 \begin{aligned}
 \int_U \chi^2|W^+|_{\mathrm{HS}}^2\frac{S}{S+\epsilon}\,dV
 \le C\int_U \bigg(&\chi^2|\mathrm{Ric}|^2\frac{S}{S+\epsilon}
            +\chi^2|\mathrm{Rm}|u_\epsilon^2\\
            &+\chi^2u_\epsilon^4+|d\chi|^2u_\epsilon^2\bigg)\,dV .
 \end{aligned}
\]
With \(S>0\) almost everywhere on the support, take
\(\epsilon\downarrow0\) by monotone convergence. Equivalently, use Fatou
on the left and bound the regularized terms by their limiting values
almost everywhere. On a connected component a single nontrivial
harmonic member suffices for this measure-zero premise by Bär's nodal
set theorem, applied to the full spin bundle and the ordinary Dirac
operator. On a component with all members identically zero the
regularized left side gives no curvature information. Even a
measure-zero common zero set can lead to a divergent relative integral.
[Bär, *On Nodal Sets for Dirac and Laplace Operators*, Main Theorem](https://arxiv.org/pdf/dg-ga/9707008#page=5)

The proof uses just intrinsic curvature in the zero-order terms. The
constant requires neither a positive minimum of \(S\), a bound on the
length of a domain, nor a family size bound. Common constant
multiplication of the fields leaves \(u\) unchanged. Under a constant
scale change \(g\mapsto b^2g\) with the induced spin identification,
the harmonic equation is preserved and \(u^2,|d\chi|^2,|\mathrm{Rm}|\)
and \(|\mathrm{Ric}|\) each scale by \(b^{-2}\). Every integral in (1)
is invariant in dimension four. Nonconstant conformal changes require
the harmonic spin weight and change the Ricci and relative terms.

## Model checks and comparison to Witten-spinor curvature estimates

In a flat oriented Euclidean spin chart, constant nonzero positive
parallel spinors have \(Q=0\), and both sides of (1) vanish. In a
Ricci-flat gauge the commutator (2) is homogeneous and the pure Ricci
term drops. If a nonzero positive parallel spinor exists there,
(5) implies \(W^+=0\). For Einstein \(\mathrm{Ric}=\lambda g\) the
pure Ricci term is \(4\lambda^2\int_U\chi^2\,dV\).

The exact unit round product cylinder has \(W=0\) and
\(|\mathrm{Ric}|^2=12\). For one harmonic lowest mode
\(\psi=e^{-\mu t}\phi\) with \(A\phi=\mu\phi\),
\(|\mu|=3/2\), the intrinsic spherical twistor formula implies
\(\nabla_X^Y\phi=-(\mu/3)c_Y(X)\phi\). This follows by integrating
the dimension-three twistor identity, since its right side is
\(((2/3)\mu^2-6/4)\|\phi\|_2^2=0\).
The product derivative gives \(u^2=\mu^2+3/4=3\). In this gauge
the estimate therefore has a cost proportional to the \(\chi^2\)
volume despite the damping of the mode. In the flat cone gauge
\(e^{2t}h_0\), an appropriate transported mode is a constant spinor.
The gauges have the same Weyl energy, while their Ricci and relative
costs differ. [MATCH-E01, product conventions](E01_ROUND_INVERSE_20261125.md)

Bray and Finster estimate curvature through second derivatives of a
Witten spinor in §3. Their Corollary 3.4 bounds an integral weighted
by \(|\Psi|^2\) in the complete asymptotically flat Riemannian
three-dimensional, nonnegative-scalar-curvature setting. The bound
uses mass and a curvature-derivative term. Finster's higher-dimensional
Theorem 3.3 uses a family and level sets to bound full curvature on the
complement of an exceptional region under an asymptotically flat mass
and volume hypothesis. Equation (1) instead follows from the local
positive chiral curl and the covector-twisted Dirac square. Its costs
are the local Ricci and relative first derivative integrals above.
[Bray–Finster, *Curvature Estimates and the Positive Mass Theorem*, arXiv:math/9906047v3, §3 and Corollary 3.4](https://arxiv.org/pdf/math/9906047#page=9)
· [Finster, *A Level Set Analysis of the Witten Spinor with Applications to Curvature Estimates*, Theorem 3.3](https://arxiv.org/pdf/math/0701864#page=10)

## Sufficient conditions for a residual

Use the actual unaccounted region \(U_{i,R}\) in SEC §12.4, with fixed
component truncations first and the source index tending to infinity
before exhaustion. Cover a portion of that residual by
regions with actual harmonic fields and cutoff squares satisfying
\(\sum_j\chi_j^2\ge1\) there. Use oriented identifications and, if
needed, different conformal gauges for the local fields and curvatures.
Write, in the respective metrics on the supports,
\[
 \mathcal R_{i,R}=\sum_j\int\chi_j^2|\mathrm{Ric}_j|^2,\quad
 \mathcal K_{i,R}=\sum_j\int\chi_j^2|\mathrm{Rm}_j|^2,\quad
 \mathcal U_{i,R}=\sum_j\int\chi_j^2 u_j^4,\quad
 \mathcal C_{i,R}=\sum_j\int|d\chi_j|^2u_j^2 .
\]
The mixed term summed over the cover is at most
\((\mathcal K_{i,R}\mathcal U_{i,R})^{1/2}\) by Cauchy–Schwarz.
The Weyl energy density is conformally invariant, so the covered
positive chiral energy is bounded by
\[
 C\left(\mathcal R_{i,R}+\sqrt{\mathcal K_{i,R}\mathcal U_{i,R}}
               +\mathcal U_{i,R}+\mathcal C_{i,R}\right).           \tag{6}
\]
For a finite cover or a countable cover of finite cost, no-neck positive
chiral energy follows if the right side and uncovered chiral energy tend
to zero in that iterated order. In particular, it suffices that
\(\mathcal K_{i,R}\) stay bounded and \(\mathcal R_{i,R}\),
\(\mathcal U_{i,R}\) and \(\mathcal C_{i,R}\) vanish in that order.
Under constant-scale source comparisons with bounded overlap,
\(\mathcal K_{i,R}\) follows from a global source curvature budget.
Nonconstant local conformal gauges require their own full curvature
bound. A useful sufficient cutoff test follows from Hölder on a
transition set \(T_j\) containing the support of \(d\chi_j\):
\(\int|d\chi_j|^2u_j^2\le
 (\int|d\chi_j|^4)^{1/2}(\int_{T_j}u_j^4)^{1/2}\).
The quartic cutoff term is scale invariant. The sum in (6) is required
even when the number of compared strips grows.

The Ricci term concerns the full Ricci tensor in the chosen harmonic
gauge. For example, the SEC §11 budget on the complement of one smooth
embedded bubble exhaustion in the original volume-one Yamabe metric
gives full Ricci-square remainder \(D-d+y^2/4\), using the manuscript's
trace-free Ricci limits \(D,d\) and scalar limit \(y>0\).
That complement still contains the base comparison images, so this does
not give a lower bound after their removal. It does show that the bubble
budget alone cannot give small full Ricci on its exterior in that
representative. DIR §4.4 likewise checks that small normalized first
derivative and small scalar curvature can coexist with large Weyl
energy for actual Green fields. The pure Ricci and bounded full
curvature hypotheses of the residual criterion require separate
information. Matching supplies transmission, while normalized relative
derivative control and coverage still have to be proved on the actual
residual. [SEC §11 and §12.4](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3830)
· [DIR §4.4](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L780)
· [MATCH-E05](E05_NORMALIZATION_AND_RESIDUAL_20261125.md)
