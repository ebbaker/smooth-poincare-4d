# SP4-CME-E13 — A static transport criterion for the known smooth sphere theorem

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. The helper was configured as gpt-6.2-sol /
ultra. Independent runtime settings and lead model/effort were
unavailable. This finite check follows the [B12 decision][decision]
and [frozen request][request]. The [return][return] records input
identities and the primary passage checked.

Let \(M\) be a smooth closed oriented real four-manifold homotopy
equivalent to \(S^4\). Assume a smooth definite \(\mathrm{SO}(3)\)
connection \(A\) on an oriented Euclidean rank-three bundle \(E\)
with the manuscript's round-positive sign. In the adjoint
identification use the bracket \([e_i,e_j]=\epsilon_{ijk}e_k\)
and internal metric \(\delta_{ij}=-2\operatorname{tr}_{SU(2)}(e_ie_j)\).
Fix \(K>0\), let \(S=Q^{1/2}\), \(q=Q-I\), and use
\[
F=-KS\Sigma,\qquad
\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g},\qquad
\mu=\tfrac13\sum_i F_i\wedge F_i,\qquad
F_i\wedge F_j=Q_{ij}\mu,\qquad
dV_{\widehat g}=\mu/(2K^2).
\]
The reconstruction is smooth positive Riemannian, with
\(\Sigma/\sqrt2\) identifying \(E\) isometrically with the
self-dual forms of \(\widehat g\). Put
\[
T_X=\tfrac12\bigl(S^{-1}(\nabla_X^A Q)S^{-1}\bigr)_0,\qquad
\mathfrak R_K=K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2 .
\]
The subscript \(0\) means trace-free part. Use Frobenius
endomorphism norms, the given internal metric and \(\widehat g\)
on all base slots, and the Levi–Civita connection of
\(\widehat g\) on the base slots of \(\nabla^A T\).

**Static implication.** If \(\mathfrak R_K\leq K\) everywhere
on \(M\), then \(M\) is diffeomorphic to the standard smooth \(S^4\).
This is an application of the known Chang–Gursky–Yang sphere
theorem to the reconstructed metric.

## Scalar curvature and the Yamabe hypothesis

Write \(g=\widehat g\), with scalar curvature \(s\), and use
the Hilbert–Schmidt norm on the chiral Weyl endomorphisms
of \(\Lambda^\pm_g\). The [E09 bound][curvature] gives
\[
\left(|W^+|_{\mathrm{HS}}^2+\tfrac14|\operatorname{Ric}_0|^2+
\tfrac1{48}(s-12K)^2\right)^{1/2}\leq\mathfrak R_K .
\]
It follows that \(|W^+|_{\mathrm{HS}}\leq K\) and
\[
s\geq(12-4\sqrt3)K>0 .
\]
In the convention of Theorem A, \(Y(M,g)\) is the
Yamabe constant of the particular conformal class \([g]\).
For smooth \(u>0\) in dimension four the normalized total
scalar curvature of \(u^2g\) is
\[
\frac{\int_M(6|\nabla u|^2+s\,u^2)dV_g}
     {(\int_M u^4dV_g)^{1/2}} .
\]
Indeed \(s_{u^2g}=u^{-3}(-6\Delta_gu+s u)\), and integration
by parts uses closedness. A compact Sobolev inequality
\(\|u\|_4^2\leq C_g(\|\nabla u\|_2^2+\|u\|_2^2)\) shows
that the quotient is bounded below by
\(\min(6,(12-4\sqrt3)K)/C_g>0\). Thus the class
Yamabe constant required in Theorem A is positive.
[Chang–Gursky–Yang, Theorem A and Remark 1, p. 107][cgy].

## Characteristic number and reconstructed volume

The smooth homotopy sphere has
\(\chi(M)=2\), \(\tau(M)=0\), and \(\pi_1(M)=0\).
The curvature span or the smooth isometry from \(\Sigma/\sqrt2\)
gives \(E\cong\Lambda_g^+\). The characteristic class identity
is \(p_1(\Lambda_g^+)=p_1(TM)+2e(TM)\) for the chosen base
orientation. To see the sign, formally split the oriented tangent
bundle into two oriented real planes with Euler roots \(x,y\).
The self-dual representation has a fixed line and a real plane
of rotation weight \(x+y\), so \(p_1(\Lambda_g^+)=(x+y)^2\).
The tangent Pontryagin root expression is \(x^2+y^2\) and the
Euler class is \(xy\). Pairing the identity and using the
signature theorem gives
\[
\langle p_1(E),[M]\rangle=3\tau(M)+2\chi(M)=4 .
\]
This agrees with the characteristic number in Fine–Panov
for the curvature-induced base orientation. [Fine–Panov, §2.3][fp] ·
[E01C signature and Chern–Weil check][signature].

In the chosen internal norm, the real defining representation
has \(\operatorname{tr}_{\mathbb R^3}
(\operatorname{ad}(e_i)\operatorname{ad}(e_j))=-2\delta_{ij}\).
For \(F_{\mathrm{ad}}=\sum_i F_i\operatorname{ad}(e_i)\)
the Chern–Weil representative is therefore
\[
p_1(A)=-\tfrac1{8\pi^2}
 \operatorname{tr}_{\mathbb R^3}(F_{\mathrm{ad}}\wedge F_{\mathrm{ad}})
=\tfrac1{4\pi^2}\sum_iF_i\wedge F_i,\qquad
\mu=\tfrac{4\pi^2}{3}p_1(A).
\]
Integrate with the fixed volume prescription to get
\[
\operatorname{Vol}(M,g)
=\tfrac1{2K^2}\tfrac{4\pi^2}{3}\cdot4
=\frac{8\pi^2}{3K^2}.
\]
The coefficient here uses the manuscript's metric \(\delta\).
[E01A normalization and Pontryagin trace][normalization].

## Weyl norm and the strict sphere inequality

Set \(E_\pm=\int_M|W^\pm|_{\mathrm{HS}}^2\,dV_g\).
The pointwise Weyl bound and the volume yield
\[
E_+\leq K^2\,\operatorname{Vol}(M,g)=\frac{8\pi^2}{3}.
\]
The signature identity in these chiral endomorphism norms is
\(\tau(M)=(E_+-E_-)/(12\pi^2)\), hence \(E_-=E_+\).
Here equality is integral and requires no pointwise estimate
on \(W^-\). [E01C derivation of the chiral signature identity][signature].

Theorem A on printed p. 107, eq. (0.3), uses the
four-index Weyl norm
\(|W|_{\mathrm{tensor}}^2=\sum_{i,j,k,l}W_{ijkl}^2\).
In the convention \(W(\omega)_{ij}=\tfrac12 W_{ij}{}^{kl}\omega_{kl}\),
the endomorphism norm is
\(\sum_{i<j,\ k<l}W_{ijkl}^2\).
Each term is counted four times in the four-index sum,
and the self-dual and anti-self-dual Weyl blocks are orthogonal.
This gives the source's Remark 2 conversion
\[
\int_M|W|_{\mathrm{tensor}}^2\,dV_g
=4(E_++E_-)=8E_+
\leq\frac{64\pi^2}{3}
<32\pi^2=16\pi^2\chi(M).
\]
In the chiral Hilbert–Schmidt convention the required strict
inequality here is equivalent to \(E_+<4\pi^2\).
The reconstructed metric is smooth on closed \(M\),
its class has positive Yamabe constant, and the four-index
integral is strictly below the published bound. Theorem A
therefore gives a diffeomorphism to \(S^4\) or
\(\mathbb{RP}^4\). The simple connectivity of \(M\) excludes
\(\mathbb{RP}^4\), so the conclusion is the smooth standard
sphere. [Chang–Gursky–Yang, Theorem A, eq. (0.3), and Remark 2,
p. 107][cgy].

## Constant rescaling and conditional scope

For a fixed \(A\), replacing \(K\) by \(K'>0\) rescales the
metric to \(g'=(K/K')g\). Indeed the conformal class, \(\mu\),
\(Q\) and \(q\) are unchanged, and the volume form is
multiplied by \((K/K')^2\).
\(\Sigma_{K'}=(K/K')\Sigma_K\), and a constant rescaling
preserves the base Levi–Civita connection. Thus \(T\)
and \(\nabla^A T\) are unchanged as tensors. Their norms obey
\[
|T|_{g'}^2=(K'/K)|T|_g^2,\qquad
|\nabla^A T|_{g'}=(K'/K)|\nabla^A T|_g .
\]
Consequently \(\mathfrak R_{K'}=(K'/K)\mathfrak R_K\), so
the condition \(\mathfrak R_K/K\leq1\) is independent
of this scale choice. The Weyl integrals are correspondingly
invariant because the squared Weyl norm and volume scale by
reciprocal factors.

This implication requires a given definite connection satisfying
the bound at every point. It gives the diffeomorphism type,
with no assertion that the given metric or connection is round.
Existence of suitable data on arbitrary homotopy spheres,
preservation of the threshold, and convergence toward it remain
separate problems.

[decision]: ../brainstorm/notes/B12_STATIC_SPHERE_CALIBRATION_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E13_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E13_RETURN_v1.md
[curvature]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[signature]: ../reviews/E01C_AUDIT_20261122.md
[normalization]: ../reviews/E01A_AUDIT_20261122.md
[fp]: https://arxiv.org/html/0802.3648v2#S2.SS3
[cgy]: https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3
