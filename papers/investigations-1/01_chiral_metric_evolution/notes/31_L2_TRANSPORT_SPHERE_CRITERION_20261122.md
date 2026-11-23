# SP4-CME-E31 an \(L^2\) transport criterion for the smooth sphere theorem

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. This fixed
[E31 request](../research-progress/handoffs/SP4-CME-E31_REQUEST_v1.md)
under the [B26 decision](../brainstorm/notes/B26_GOOD_SLICE_SPHERE_ROUTE_20261122.md)
applies the known Chang–Gursky–Yang sphere theorem.
The [return](../research-progress/handoffs/SP4-CME-E31_RETURN_v1.md)
records the checked input versions.

## Static hypotheses and conclusion

Let \(M\) be a smooth closed oriented real four-manifold homotopy
equivalent to \(S^4\). Suppose it has a supplied smooth definite
\(SO(3)\) connection \(A\) on an oriented Euclidean rank-three
bundle, with positive curvature plane and round-compatible sign.
Use the manuscript internal pairing
\(\delta_{ij}=-2\operatorname{tr}_{\mathbb C^2}(T_iT_j)\),
the bracket \([e_i,e_j]=\epsilon_{ijk}e_k\), and fixed \(K>0\).
In the positive Riemannian reconstruction \(g=\widehat g_A\), put
\[
 S=Q^{1/2},\quad Q>0,\quad \operatorname{tr}Q=3,\quad q=Q-I,
 \quad F=-KS\Sigma,\quad
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_g,\quad \mu=2K^2dV_g .
\]
Set \(T_c=\tfrac12(S^{-1}\nabla^A_cQ\,S^{-1})_0\) and
\[
 R_K=K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2 .
\]
All base slots are measured using \(g\), with its Levi–Civita
connection used on base slots of \(\nabla^A T\). Internal
endomorphism norms are Frobenius. The two-form norm counts each
unordered base index pair once. In what follows \(\|\cdot\|_p\)
uses \(dV_g\), and \(|W^\pm|_{\mathrm{op,HS}}\) denotes the
Hilbert–Schmidt norm of the chiral Weyl block as an endomorphism
on two-forms.

Assume a constant \(C_S>0\) with the scalar Sobolev inequality
\[
 \|u\|_4^2\le C_S\left(\int_M|du|^2\,dV_g
                            +K\int_Mu^2\,dV_g\right)
 \tag{1}
\]
for every smooth real \(u\). If
\[
 \boxed{\ \|R_K\|_2<
                \min\!\left\{2\pi,\frac{\sqrt3}{2C_S}\right\},\ }
 \tag{2}
\]
then \(M\) is diffeomorphic to the standard smooth \(S^4\).

## Positive Yamabe constant

The E09 chiral curvature estimate gives
\[
 |s-12K|\le4\sqrt3\,R_K,\qquad
 |W^+|_{\mathrm{op,HS}}\le R_K ,
\]
where \(s\) is the scalar curvature of \(g\). The first coefficient
is \(\sqrt{48}\) from the scalar block. [E09 chiral block
and normalization](11_TRANSPORT_CURVATURE_COMPARISON_20261122.md).

In dimension four, for a smooth positive \(u\), the conformal metric
\(u^2g\) has scalar curvature \(u^{-3}(-6\Delta_g u+su)\) and
volume form \(u^4dV_g\). Here \(\Delta_g=\nabla^a\nabla_a\).
Integrating by parts on closed \(M\), the Yamabe quotient in the
conformal class \([g]\) is
\[
 \frac{\int_M(6|du|^2+su^2)\,dV_g}{\|u\|_4^2}.
\]
The E09 scalar bound and Hölder give
\[
 \begin{aligned}
 \int_M(6|du|^2+su^2)\,dV_g
 &\ge 6\int_M|du|^2\,dV_g+12K\int_Mu^2\,dV_g
                     -4\sqrt3\|R_K\|_2\|u\|_4^2\\
 &\ge \bigl(6/C_S-4\sqrt3\|R_K\|_2\bigr)\|u\|_4^2 .
 \end{aligned}
\]
The last step uses \(12K\ge6K\) and (1). Taking the infimum
over positive \(u\) gives the strictly positive bound
\(Y(M,[g])\ge6/C_S-4\sqrt3\|R_K\|_2>0\) under (2).
This is positivity of the required conformal class.
The primary theorem's notation \(Y(M,g)\) has exactly this
meaning. [Chang–Gursky–Yang, Theorem A and Remark 1,
printed p. 107](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3).

## Weyl norm and application of Theorem A

Write \(E_\pm=\int_M|W^\pm|_{\mathrm{op,HS}}^2\,dV_g\).
The oriented signature formula in these Hilbert–Schmidt
norms is \(12\pi^2\tau(M)=E_+-E_-\).
Since the homotopy sphere has \(\tau=0\), \(E_-=E_+\).
The ordinary curvature-operator convention
\((W\omega)_{ij}=\tfrac12W_{ij}{}^{kl}\omega_{kl}\)
gives its squared Hilbert–Schmidt norm by the sum over
\(i<j,k<l\). The full four-index sum counts each of those
terms four times. The two chiral blocks are orthogonal.
Thus in the exact convention of CGY Remark 2,
\[
 \int_M|W|_{\rm full}^2dV_g
 =4(E_++E_-)=8E_+
 \le8\|R_K\|_2^2<32\pi^2=16\pi^2\chi(M)
 \tag{4}
\]
under the first threshold in (2), using \(\chi(M)=2\).
Only the integral equality of the two chiral contributions
is needed. [E13 signature and Weyl normalization](15_STATIC_TRANSPORT_SPHERE_CRITERION_20261122.md).

Theorem A, equation (0.3), on printed p. 107 of the primary
CGY paper concerns a smooth closed four-manifold with positive
Yamabe constant in the given metric's conformal class and the
strict full-tensor Weyl bound in (4). Its conclusion is
diffeomorphism to \(S^4\) or \(\mathbb{RP}^4\).
The reconstructed metric and the two estimates above meet
those hypotheses. Since \(M\) is simply connected, the
real-projective alternative is excluded. The strict
inequalities are used as stated. [Chang–Gursky–Yang,
Theorem A, equation (0.3) and Remarks 1–2, printed p. 107](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3).

## Scale and scope

At fixed connection, let \(K'=\lambda K\) with \(\lambda>0\).
Then \(\mu,Q,S\) are fixed and
\(g'=\lambda^{-1}g,\ dV_{g'}=\lambda^{-2}dV_g\).
Constant scaling preserves the Levi–Civita connection, so
\(T,\nabla^AT\) are unchanged as tensors. The one-form
squared norm of \(T\) and the two-covariant-slot norm of
\(\nabla^AT\) each multiply by \(\lambda\). Therefore
\(R_{K'}=\lambda R_K\) and its \(L^2\) norm is unchanged.
Both \(\|u\|_4^2\) and the right-side terms
\(\int|du|^2dV_g,\ K\int u^2dV_g\) in (1) multiply by
\(\lambda^{-1}\). The same dimensionless \(C_S\) applies.
This checks the scale normalization of both thresholds.

The result is a static recognition criterion for a supplied
smooth connection and a supplied Sobolev bound. It does
not supply a time slice, preservation of the criterion,
or initial definite connections on arbitrary homotopy
spheres. The primary PDF text was re-opened at the exact
printed page and theorem above.
