# GEO-E06 · Index-one minimal collar germs

27 November 2026, for Edward B. Baker III, with OpenAI Codex assistance.
Bounded E packet, [revision 1](ISSUE_SECOND_20261127.md). Requested helper
settings GPT-6.2 Sol/ultra. Actual serving model and effort unavailable to the
worker. Input baseline `bc2c1bb`, parent
[TeX](../../../manuscript/cuts_of_subcritical_conformal_classes.tex), §§2 and
7.3, SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`.
Evidence is an exact local calculation on a collar of a compact slice.

An index-one, two-sided minimal three-sphere can have strictly negative
first conformal-Laplacian eigenvalue in a smooth collar satisfying
\(R_g>0\) and \(\sigma_2(A_g)>0\) everywhere. The ambient Ricci tensor
is a positive multiple of the metric along the entire central slice.
The flat three-torus gives the zero eigenvalue with the same strict ambient
inequalities. Both examples have Jacobi nullity zero.

## Normal jets and the entering inequalities

Work in positive Riemannian signature with curvature positive on the unit
round sphere. Orient the collar by \(ds\wedge dV_h\), with
\(\nu=\partial_s\) pointing toward increasing \(s\).
Chirality is unused. Write \(g=ds^2+h_s\),
\(S_s=\tfrac12h_s^{-1}h_s'\), \(B_s=h_s(S_s\cdot,\cdot)\), and
\(H_s=\operatorname{tr}S_s\). The normal-coordinate curvature identities
with this choice of \(B_s\) are

\[
\begin{aligned}
\operatorname{Ric}_g(\nu,\nu)&=-H_s'-\operatorname{tr}S_s^2,\\
\operatorname{Ric}_g(\nu,\cdot)&=\operatorname{div}_{h_s}B_s-dH_s,\\
\bigl(\operatorname{Ric}_g|_{T\Sigma_s}\bigr)^{\sharp_{h_s}}
  &=\operatorname{Ric}_{h_s}^{\sharp_{h_s}}-S_s'-H_sS_s .
\end{aligned}
\]

Let \(h=h_0\) be one of the homogeneous metrics below, with global
orthonormal coframe \(e^i\), constant diagonal Ricci eigenvalues \(r_i\)
and scalar \(R_h=\sum_i r_i\le 0\). Take constants \(c>0\) and
\(b_i\) with \(\sum_i b_i=0\), \(\sum_i b_i^2=2c-R_h\).
In both models \(B_0=\sum_i b_i e^i\otimes e^i\) is divergence-free.
On \((-\varepsilon,\varepsilon)\times\Sigma\), use the smooth metric

\[
h_s=\sum_{i=1}^3\exp\!\bigl(2b_i s+(r_i-c)s^2\bigr)\,e^i\otimes e^i .
\]

This realizes \(S_0=\operatorname{diag}(b_i)\) and
\(S_0'=\operatorname{diag}(r_i-c)\). In particular \(H_0=0\),
\(H'_0=R_h-3c\), and the tangential and normal Ricci equations yield,
respectively, \(c h\) and \(3c-R_h-|B_0|^2=c\). The mixed
Ricci tensor vanishes by the divergence condition. The Gauss scalar
constraint is \(R_h=4c-2c-|B_0|^2\); the Codazzi momentum constraint
is the mixed Ricci equation. Thus the specified Einstein Ricci value is
realized on the slice by an actual smooth metric germ.

On the slice \(R_g=4c\), \(Z_g=0\),
\(A_g=(c/6)g\), and \(\sigma_2(A_g)=c^2/6\) in the parent
normalization. Compactness of the slice and smoothness give a uniform
\(\varepsilon>0\) on which \(R_g>0\) and
\(R_g^2/12-|Z_g|^2>0\). These are the local entering inequalities.
The statement about \(\operatorname{Ric}_g=cg\) is on the slice.

Set \(q=3c-R_h\). The Jacobi operator with index counted by its
negative spectrum is \(J=-\Delta_h-q\), where \(\Delta_h\) is the
divergence Laplacian. The constant functions give its sole negative
eigenspace, with zero nullity, if \(0<q<\lambda_1(-\Delta_h)\);
here \(\lambda_1(-\Delta_h)\) is the first positive eigenvalue.
The translates have \(H_s=-qs\) and
\(dV_{h_s}=\exp(-qs^2/2)dV_h\), so the central slice is a strict
area maximum along this explicit local normal family.

## Two central metrics

**Flat torus.** Take \(\Sigma=(\mathbb R/2\pi\mathbb Z)^3\) with
\(e^i=dx^i\), \(r_i=0\) and \(\lambda_1(-\Delta_h)=1\) by the
Fourier series. For \(c=1/16\), use \((b_1,b_2,b_3)=(1/4,-1/4,0)\).
The Codazzi condition follows from parallelness, \(|B_0|^2=1/8\),
and \(q=3/16<1\). The conformal Laplacian \(L=-8\Delta_h\) has
simple zero with positive spectrum on mean-zero functions.

**Berger three-sphere.** Identify \(S^3\) with \(SU(2)\). Choose
unit round left-invariant fields \(X_i\) with
\([X_i,X_j]=2X_k\) for cyclic \((i,j,k)\), and stretch the Hopf
direction \(X_3\) by length factor \(t\). The orthonormal frame is
\((e_1,e_2,e_3)=(X_1,X_2,X_3/t)\), and the three cyclic structure
constants are \(2t,2/t,2/t\). Koszul gives
\(\nabla_{e_i}e_i=0\) and the nonzero mixed coefficients

\[
\begin{array}{lll}
\nabla_1 e_2=t e_3, & \nabla_2 e_3=t e_1, &
\nabla_3 e_1=(2/t-t)e_2,\\
\nabla_1 e_3=-t e_2, & \nabla_2 e_1=-t e_3, &
\nabla_3 e_2=-(2/t-t)e_1 .
\end{array}
\]

The curvature of each coordinate two-plane is
\(K_{12}=4-3t^2\), \(K_{13}=K_{23}=t^2\); the same connection
coefficients give \(\mathrm{Rm}(e_i,e_j)e_k=0\) for three distinct
indices. Thus \(r_1=r_2=4-2t^2\), \(r_3=2t^2\), and
\(R_h=8-2t^2\). This scalar formula also agrees with
Torralbo–Urbano in the normalization \((\kappa,\tau)=(4,t)\).
For any constant diagonal \(B_0\) in this frame,
\((\operatorname{div}B_0)(e_j)=-\sum_i b_i
\langle e_i,\nabla_{e_i}e_j\rangle=0\), since \(\nabla_{e_i}e_i=0\).
The horizontal entries of \(B_0\) may differ even though those of
\(\operatorname{Ric}_h\) agree. The construction keeps the left
\(SU(2)\) action on every leaf.

For \(t\ge 1\) the volume form is \(t\,dV_{\rm round}\) and the
pointwise inverse-metric bound for covectors is
\(h^{-1}\ge t^{-2}h_{\rm round}^{-1}\). The mean-zero spaces agree,
so the Rayleigh quotient gives \(\lambda_1(-\Delta_h)\ge 3/t^2\).
Here the round bound follows by integrating Bochner for a round
eigenfunction, using \(|\nabla^2 u|^2\ge(\Delta u)^2/3\) and
\(\operatorname{Ric}_{\rm round}=2h_{\rm round}\).

Take any \(2<t\le\sqrt{65}/4\) and keep \(c=1/16\).
Set \(b_1=-b_2=\sqrt{c-R_h/2}\), \(b_3=0\).
Then \(-1/8\le R_h<0\) and
\(0<q\le5/16<48/65\le\lambda_1(-\Delta_h)\).
At the explicit endpoint \(t=\sqrt{65}/4\), the scalar is \(-1/8\),
\(|B_0|^2=1/4\), and \(q=5/16\). For every chosen \(t\), the
conformal Laplacian \(L=-8\Delta_h+R_h\) has simple negative
ground eigenvalue \(R_h\) and strictly positive spectrum on mean-zero
functions, bounded below there by \(8(48/65)-1/8>0\). For both
models, conformal covariance also gives the obstruction directly:
if \(u^4h\) had positive scalar for \(u>0\), then
\(L u=R_{u^4h}u^5>0\), whereas integrating gives
\(\int L u=R_h\int u\le 0\). This concerns the induced conformal
class, which on the Berger sphere has a negative Yamabe quotient on
constant functions.

## Schur complement and scope

For a closed connected, two-sided minimal hypersurface of index one,
let \(\phi\) be the positive normalized Jacobi ground state and
\(P_\perp\) the \(L^2(h)\) projection to \(\phi^\perp\).
Gauss gives the exact form identity

\[
L=2J-6\Delta_h+R_g+|B|^2 .
\]

For \(R_g>0\), the compressed operator \(C\) of the \(L\) form on
\(H^1\cap\phi^\perp\) is strictly positive, bounded below in
\(L^2\) there by \(\min_\Sigma(R_g+|B|^2)>0\), because \(J\) is
nonnegative on that subspace. Set \(a=\langle\phi,L\phi\rangle\)
and \(w=P_\perp L\phi\). Writing \(J\phi=\mu_0\phi\) and
\(q=\operatorname{Ric}_g(\nu,\nu)+|B|^2\) gives
\(w=P_\perp\big[(R_g+|B|^2+6(q+\mu_0))\phi\big]\).
For \(v\perp\phi\), completion of the square gives

\[
Q_L(x\phi+v)=Q_C(v+x C^{-1}w)
   +x^2\bigl(a-\langle w,C^{-1}w\rangle\bigr).
\]

The negative, zero or positive sign of this scalar Schur complement
decides the sign of the first eigenvalue. In the two germs \(\phi\)
is constant, \(w=0\), and the Schur complement is \(a=R_h\).
On the flat model \(C\ge 8I\); on the Berger family
\(C\ge (8(48/65)-1/8)I\). Thus even vanishing mixed coupling
allows the sign to be zero or negative under the strict local
entering inequalities and nondegenerate index one.

This rules out a sign proof using only the slice's local entering
inequalities and Jacobi index. Deciding the fundamental-class
first-width question still requires global information about the cut,
including whether such a collar admits a closed entering extension
on a homotopy four-sphere with a width-realizing central slice.

## Source checks

- Parent manuscript, §§2 and 7.3, for the normalizations and the form
  comparison in Proposition 7.5. The local construction and spectral
  estimate above are derived explicitly.
- Francisco Torralbo and Francisco Urbano, *Compact stable constant mean
  curvature surfaces in homogeneous 3-manifolds*, Indiana Univ. Math. J.
  **61** (2012), 1129–1156. Checked author-hosted PDF §2.1, definition
  of \(g_{\kappa,\tau}\) and item (4), on 27 November 2026 for the
  scalar-curvature normalization. [Author PDF](https://www.ugr.es/~furbano/papers/StableBerger.pdf)
  · [Journal record](https://iumj.org/article/5606/).
- Xin Zhou, [arXiv:1210.2112v2](https://arxiv.org/abs/1210.2112v2),
  Theorem 1.1 and Remark 1.2, checked on 27 November 2026 for the
  closed ambient and fundamental-class hypotheses. The full proof check
  belongs to GEO-E04.
