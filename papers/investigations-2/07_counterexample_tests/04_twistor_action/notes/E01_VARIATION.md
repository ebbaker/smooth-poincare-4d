# Variation and conformal scales · SP4-TWA-E01

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request v1](../research-progress/handoffs/E01_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and the individually
configured GPT-6.2 Sol/ultra helper. Actual backend serving variant and
reasoning effort were unavailable. HEAD was
`280376dd7a1820fa2878d0ab0ee2e639facb2eeb`, and all six frozen working-tree
input digests matched. This is a variational derivation for the packet's
smooth, compact, zero-free class.

## Projection and first variation

Let \((M,g)\) be a smooth compact oriented Riemannian spin four-manifold
with smooth boundary if present. Keep the metric and spin data fixed, and
use smooth commuting sections of \(S_g^+\), the chirality on which real
self-dual two-forms act. Work with \(\psi\) such that
\(\inf_M|\psi|_g>0\), including at the boundary. Write \((\,,\,)\) for the
real part of the fiber Hermitian pairing, with the tensor pairing induced
by \(g\). Clifford multiplication satisfies \(X\cdot X=-|X|_g^2\) and is
skew-adjoint on the full spin bundle.

In a \(g\)-orthonormal frame define the Clifford trace
\(cA=\sum_i e_i\cdot A(e_i)\) from \(T^*M\otimes S_g^+\) to \(S_g^-\).
Then \((c^*\chi)(X)=-X\cdot\chi\) and \(cc^*=4I\). The orthogonal
projection onto \(\ker c\) and the resulting chiral operator are

\[
\Pi=I-\tfrac14 c^*c,\qquad
(P_g\psi)(X)=(\Pi\nabla^g\psi)(X)
 =\nabla_X^g\psi+\tfrac14X\cdot D_g\psi,\qquad D_g\psi=c\nabla^g\psi.
\]

The plus sign and coefficient agree with Friedrich's §1, equation (1.1)
on p. 59, for \(n=4\). The full-spin projection there restricts to the
indicated chiral domain and codomain since Clifford multiplication
interchanges chirality. [Published copy, §1](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

Set \(q=P_g\psi\), \(\sigma=|\psi|_g\) and
\(W_g=\sigma^{-4}|q|_g^2q\). For a smooth variation \(\psi+t\eta\), small
real \(t\) keeps the norm uniformly positive. Differentiating numerator
and denominator in \(S_g[\psi]=\int_M\sigma^{-4}|q|_g^4\,dV_g=J_g(\psi)^4\)
gives

\[
DS_g(\psi)[\eta]=4\int_M
 \big((W_g,P_g\eta)-\sigma^{-6}|q|_g^4(\psi,\eta)\big)\,dV_g.
\]

Since \(cW_g=0\), self-adjointness of \(\Pi\) gives
\((W_g,P_g\eta)=(W_g,\nabla^g\eta)\) pointwise. The divergence of the
vector metrically dual to the one-form \(X\mapsto(W_g(X),\eta)\) is
\((\operatorname{tr}_g\nabla^g W_g,\eta)+(W_g,\nabla^g\eta)\). Thus for
this tensor \(P_g^*W_g=-\operatorname{tr}_g\nabla^g W_g\) as a formal
interior adjoint, and with outward unit normal \(\nu_g\),

\[
\begin{aligned}
\mathcal E_g(\psi)&=P_g^*W_g-\sigma^{-6}|q|_g^4\psi,\\
p_g&=4W_g(\nu_g),\\
DS_g(\psi)[\eta]&=4\int_M(\mathcal E_g(\psi),\eta)\,dV_g
 +\int_{\partial M}(p_g,\eta|_{\partial M})\,dA_g.
\end{aligned}
\]

For fixed trace, smooth stationarity is equivalent to
\(\mathcal E_g(\psi)=0\) in the interior by compactly supported tests and
the formula above. The momentum is represented by \(p_g\) using the
surface measure, or by the spinor-valued density \(p_g\,dA_g\) in the real
duality. The two bulk terms and the outward boundary term reproduce the
factor-four conversion of the [inherited action](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md).

## Off-shell conformal transport

Take \(f>0\) smooth on \(M\), \(h=f^2g\), \(u=\log f\) and
\(U=\operatorname{grad}_g u\). Let \(\beta\) be the unitary spin identification
induced by pairing \(e_i\) and \(f^{-1}e_i\). It preserves chirality and
\(X\cdot_h\beta\chi=f\beta(X\cdot_g\chi)\). Friedrich's §1 conformal
paragraph spanning pp. 59–60 uses the kernel weight \(\lambda^{1/4}\) for
\(\bar g=\lambda g\), which is \(f^{1/2}\) here. The transport below applies
to every smooth field. [Published copy, §1](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

The Levi–Civita conformal change and the rescaling of the frame give
\(\omega^h_{ij}(X)-\omega^g_{ij}(X)=e_i(u)g(X,e_j)-g(X,e_i)e_j(u)\),
where \(\omega^g_{ij}(X)=g(\nabla_X^g e_i,e_j)\). Its spin lift is
\(\tfrac14(U\cdot_g X\cdot_g-X\cdot_g U\cdot_g)
=-\tfrac12 X\cdot_g U\cdot_g-\tfrac12 X(u)I\), using the Clifford
anticommutator. For \(\psi_h=f^{1/2}\beta\psi\) the weighted derivative
cancels the scalar term. Taking the Clifford trace in the \(h\)-frame
and then applying the projection gives

\[
\begin{aligned}
\nabla_X^h\psi_h&=f^{1/2}\beta
  (\nabla_X^g\psi-\tfrac12 X\cdot_g U\cdot_g\psi),\\
D_h\psi_h&=f^{-1/2}\beta(D_g\psi+2U\cdot_g\psi),\\
(P_h\psi_h)(X)&=f^{1/2}\beta((P_g\psi)(X)).
\end{aligned}
\]

The last equality is for a fixed tangent vector \(X\). In orthonormal
components it gives \(|P_h\psi_h|_h=f^{-1/2}|P_g\psi|_g\), while
\(|\psi_h|_h=f^{1/2}|\psi|_g\). The fourth power of their quotient has
weight \(-4\) and \(dV_h=f^4dV_g\), so \(S_h[\psi_h]=S_g[\psi]\).
The quotient is also invariant under constant nonzero complex field
rescaling at fixed metric. [Inherited off-shell calculation](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md)

As a fixed covector, \(W_h=f^{-5/2}\beta W_g\), with \(\beta\) acting on
its spinor component. Since \(\nu_h=f^{-1}\nu_g\) and
\(dA_h=f^3dA_g\), the induced boundary weights are

\[
p_h=f^{-7/2}\beta p_g,\qquad
p_h\,dA_h=f^{-1/2}\beta(p_g)\,dA_g,\qquad
(p_h,\eta_h)_h\,dA_h=(p_g,\eta)_g\,dA_g
\quad (\eta_h=f^{1/2}\beta\eta).
\]

For fixed \(f\), differentiating the action equality and testing on
compactly supported \(\eta\) gives
\(\mathcal E_h(\psi_h)=f^{-9/2}\beta\mathcal E_g(\psi)\): the transported
test spinor and volume have joint weight \(+9/2\), and arbitrary tests
determine the smooth bulk expression. The denominator term
\(|P\psi|^4|\psi|^{-6}\psi\) separately has weight \(-9/2\), so the formal
adjoint term on \(W\) has the same weight. This computation uses the
metric-dependent smooth boundary pairing; selection of a trace space
and its dual belongs to TWA-B01.

## Spinor-induced unit scale

With \(\sigma=|\psi|_g\), let \(f=\sigma^{-2}\). Then
\(h=\sigma^{-4}g\), \(\phi=\sigma^{-1}\beta\psi\), and

\[
|\phi|_h=1,\qquad |P_h\phi|_h=\sigma|P_g\psi|_g,\qquad
dV_h=\sigma^{-8}dV_g,\qquad
S_g[\psi]=\int_M|P_h\phi|_h^4\,dV_h.
\]

Along a variation at fixed \(g\), this change of variables induces the
metric variation \(\dot h=-4\sigma^{-2}(\psi,\eta)h\). Thus the unit-spinor
representation couples variation of the unit field to variation of its
metric. [Inherited scale calculation](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E10_20261124.md)

## Polarized Hessian and fourth-order expansion

The action is smooth as a real-valued function of \(C^1\) sections on the
open set with positive minimum norm. Indeed, the integrand as a function
of the field and its covariant derivative is smooth where the field is
nonzero, and on a sufficiently small \(C^1\) neighborhood around any such
section the derivatives of each fixed order are uniformly bounded for
integration on compact \(M\). For \(a=P_g\eta\), \(b=P_g\zeta\), the full
real bilinear Hessian is

\[
\begin{aligned}
D^2S_g(\psi)[\eta,\zeta]=\int_M\big[{}&
 \sigma^{-4}\big(8(q,a)(q,b)+4|q|^2(a,b)\big)\\
 &-16\sigma^{-6}|q|^2\big((q,a)(\psi,\zeta)+(q,b)(\psi,\eta)\big)\\
 &+|q|^4\big(24\sigma^{-8}(\psi,\eta)(\psi,\zeta)
                    -4\sigma^{-6}(\eta,\zeta)\big)\big]\,dV_g.
\end{aligned}
\]

These are the product-rule terms from \((q,q)^2\) and \((\psi,\psi)^{-2}\),
respectively. Every term vanishes at a zero-free twistor field \(\psi_0\),
for all real directions \(\eta,\zeta\), including fixed-trace ones.

More precisely, let \(m=\inf_M|\psi_0|>0\) and write \(\sigma_0=|\psi_0|\).
For \(\|v\|_{C^0}\le m/2\), the segment from \(\psi_0\) to \(\psi_0+v\)
has norm at least \(m/2\). Since \(P_g\psi_0=0\), one has

\[
\left|S_g[\psi_0+v]-\int_M\sigma_0^{-4}|P_g v|_g^4\,dV_g\right|
\le 4(m/2)^{-5}\|v\|_{C^0}\int_M |P_g v|_g^4\,dV_g.
\]

The bound follows by applying the derivative bound for \(s^{-4}\) to
the two norms and using the reverse triangle inequality. With the
\(C^1\) norm defined by \(g\) and its spin connection,
\(\|P_gv\|_{C^0}\le\|\nabla^gv\|_{C^0}\). The remainder is consequently
\(O(\|v\|_{C^1}^5)\) at fixed \(g\), with a bound depending only on
\(m\) and \(\operatorname{Vol}_g(M)\). For \(v=t\eta\), the fourth-order
coefficient is \(\int_M\sigma_0^{-4}|P_g\eta|_g^4\,dV_g\), uniformly over
\(C^1\)-bounded directions and twistor backgrounds with the same lower
bound \(m\). The first three derivatives vanish. For \(a_i=P_g\eta_i\),
polarizing the quartic term gives

\[
D^4S_g(\psi_0)[\eta_1,\eta_2,\eta_3,\eta_4]
=8\int_M\sigma_0^{-4}\big((a_1,a_2)(a_3,a_4)
 +(a_1,a_3)(a_2,a_4)+(a_1,a_4)(a_2,a_3)\big)\,dV_g.
\]

Along a direction in \(\ker P_g\) the action stays zero for the admissible
affine variation.

## Source and scope

Checked the digitized published copy of Thomas Friedrich, *On the conformal
relation between twistors and Killing spinors*, Rendiconti del Circolo
Matematico di Palermo, Serie II, Supplemento 22 (1990), 59–75, on
28 November 2026. The checked passages are §1 equation (1.1), the preceding
projection and the kernel conformal weight across pp. 59–60, for a
Riemannian spin manifold of dimension \(n\ge3\). The off-shell formula,
boundary law and variational derivatives above follow from the displayed
calculations. The inherited DIR-E06 supplies the zero-class antecedent.
This packet treats the uniformly nonvanishing class and supplies the
first-variation tensor for E03's fixed-jet extension.
[Publication record](https://dml.cz/handle/10338.dmlcz/701462) ·
[Canonical reference record](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#first-order-twistor-discussion--23-november-2026) ·
[DIR-E06](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md)
