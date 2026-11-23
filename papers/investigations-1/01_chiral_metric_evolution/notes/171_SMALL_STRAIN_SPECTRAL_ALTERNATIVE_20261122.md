# E171 — Small strain, the spectral alternative, and native Ricci positivity

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B86, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored the inherited E09 transport–curvature estimate and E159 native normalization and continuation calculation. I audited the static input E155 in E156 and the integration of the related limiting rank mechanism in E161. The projected-curvature argument below runs on one smooth slice.

## Statement and conventions

Let \(M\) be a fixed smooth closed connected simply connected oriented four-manifold with \(H^2(M;\mathbb R)=0\), and let \(A\) be a smooth definite connection on a smooth principal \(SO(3)\) bundle in the positive-plane, round-compatible component. Use the native reconstructed Riemannian metric \(g\) and the native negative Killing pairing on \(E=\operatorname{ad}P\). In oriented orthonormal internal labels the bracket is \([u,w]=u\times w/\sqrt2\). The chiral identification \(\sigma:E\to\Lambda^+_g\) is an oriented isometry, so a native orthonormal internal frame corresponds to an ordinary orthonormal self-dual two-form frame. Write \(Q>0\), \(\operatorname{tr} Q=3\), \(S=\sqrt Q\), and \(F_A=-S\sigma\) in internal column notation, equivalently \(\langle F_A,w\rangle=-\sigma(Sw)\) for \(w\in E\).

Write \(D^A\) for the metric derivative on internal sections and their endomorphisms. Its tensor extension \(\nabla^A\) uses the live Levi–Civita connection on each base slot. On endomorphisms use Frobenius norms unless an operator norm is marked, and sum all ordered base indices for a full covariant derivative. On ordinary two-forms, including endomorphism-valued ones, sum the squares over \(a<b\) in a base orthonormal frame. Set

\[
 T_X=\tfrac12(S^{-1}D^A_XQ\,S^{-1})_0,\qquad
 \mathcal G=|\nabla^A T|+|T|^2.                                      \tag{1}
\]

There is a universal \(\varepsilon>0\), given below, such that \(\sup_M\mathcal G\le\varepsilon\) implies

\[
                 |Q-I|\le72\mathcal G\quad\text{pointwise},\qquad
                 \operatorname{Ric}_g\ge\tfrac34 g.                  \tag{2}
\]

The hypotheses refer to the metric and strain of the one given slice. They contain no eigenvalue floor, diameter or Sobolev bound.

## From the relative identities to the commutator

Put \(P_X=S^{-1}D_X^AS\) and \(U_X=\operatorname{sym}P_X=T_X-\operatorname{tr}(QT_X)I/3\). The inverse strain identity is \(D_X^AQ=2S U_X S\). Since \(|Q-I|^2=\operatorname{tr}Q^2-3\le6\) and \(T_X\) is trace-free, \(|U_X|^2=|T_X|^2+\bigl[\operatorname{tr}((Q-I)T_X)\bigr]^2/3\le3|T_X|^2\). In a pointwise \(S\)-eigenframe \(P_{X,ij}=2s_j(U_X)_{ij}/(s_i+s_j)\) with \(s_i>0\). The skew part has off-diagonal multipliers \((s_j-s_i)/(s_i+s_j)\) times \((T_X)_{ij}\), all of magnitude at most one. The symmetric and skew parts are orthogonal. Thus \(|P|\le2|T|\) and \(|D^AS|\le2\sqrt3|T|\) using \(D_X^AS=SP_X\) and \(\|S\|_{\rm op}\le\sqrt3\). This is the relative Sylvester control at positive \(S\) with a bound independent of the least eigenvalue. [E09, relative identities][relative]

For completeness, the norm \(|D^AQ|\le6|T|\) follows by writing \(D^A_XQ/2=\mathcal S^{1/2}\Pi\mathcal S^{1/2}T_X\) on symmetric matrices, where \(\mathcal S(B)=SBS\) and \(\Pi\) is the orthogonal projection off \(\mathcal S^{1/2}I=S\), which has squared norm three. The operator norm is at most \(\lambda_{\max}(Q)\le3\). Differentiating the formula for \(U_X\) on its two tensor factors yields

\[
 (\nabla^A_Y U)_X=(\nabla^A_Y T)_X
 -\tfrac13\{\operatorname{tr}(Q(\nabla^A_Y T)_X)
                  +\operatorname{tr}((D_Y^A Q)T_X)\}I .             \tag{3}
\]

For \(H=(\nabla_Y^A T)_X\), the contribution \(H-\operatorname{tr}(QH)I/3\) has norm at most \(\sqrt3|H|\) by the same trace-free estimate as for \(U_X\). Summing the remaining trace term gives at most \(|D^AQ||T|/\sqrt3\). Hence \(|\nabla^AU|\le\sqrt3|\nabla^AT|+2\sqrt3|T|^2\). [E09][relative] · [E155, (6)][static]

Differentiate \(D_X^AQ=2SU_XS\) as a tensor using \(\nabla^A\). At a point one can take \(X,Y\) parallel there. In all ordered base slots,

\[
 \begin{aligned}
 (\nabla^{2,A}Q)_{Y,X}
   &= 2(D_Y^A S)U_XS+2S(\nabla^A_Y U)_XS+2SU_X(D_Y^A S),\\
 |\nabla^{2,A}Q|
   &\le 4\|S\|_{\rm op}|D^A S|\,|U|
            +2\|S\|_{\rm op}^2|\nabla^A U|\\
   &\le 6\sqrt3|\nabla^AT|+36\sqrt3|T|^2 .
 \end{aligned}                                                     \tag{4}
\]

The exterior alternation is separate. Since the base connection is torsion-free, the difference of the two ordered slots is \(d_A d_A Q\), and the induced curvature on endomorphisms is \(\mathcal C=[\operatorname{ad}(F_A),Q]\). Denote the ordinary two-form norm of \(\mathcal C\) by \(|\mathcal C|\). For a tensor \(H\), \(\sum_{a<b}|H_{ab}-H_{ba}|^2\le2\sum_{a,b}|H_{ab}|^2\), so

\[
 |\mathcal C|\le6\sqrt6|\nabla^AT|+36\sqrt6|T|^2
          \le C_{\mathcal C}\mathcal G,\qquad C_{\mathcal C}=36\sqrt6.     \tag{5}
\]

The commutator in (5) acts in the internal fiber. Equation (4) involves the full spatial covariant derivative of the strain rather than its exterior derivative.

## Exact polynomial and connected spectral alternative

At the chosen point take a positive internal orthonormal eigenframe for \(Q\) with eigenvalues \(\lambda_1,\lambda_2,\lambda_3\). Set \(J_iw=(e_i\times w)/\sqrt2\). In the complement of index \(i\), the commutator \([J_i,Q]\) has just two off-diagonal entries of magnitude \(|\lambda_j-\lambda_k|/\sqrt2\); its Frobenius norm squared is \((\lambda_j-\lambda_k)^2\). Since the three \(\sigma_i\) are ordinary orthonormal two-forms and the coefficient of \(J_i\sigma_i\) in \(\operatorname{ad}F_A\) is \(-\sqrt{\lambda_i}\), the exact identity is

\[
 |\mathcal C|^2=\mathcal P(\lambda)
       :=\sum_{\rm cyc}\lambda_i(\lambda_j-\lambda_k)^2
       =3s_2-9s_3,                                                  \tag{6}
\]

where \(s_2=\sum_{i<j}\lambda_i\lambda_j\) and \(s_3=\lambda_1\lambda_2\lambda_3\). The coefficient check is that the expansion gives \(\sum_{i\ne j}\lambda_i^2\lambda_j-6s_3\), while \((\sum_i\lambda_i)s_2=\sum_{i\ne j}\lambda_i^2\lambda_j+3s_3\).

On the compact simplex \(\Delta=\{\lambda_i\ge0,\ \sum_i\lambda_i=3\}\), the terms of the cyclic expression are nonnegative. At rank three their vanishing forces all eigenvalues to coincide, giving \((1,1,1)\). At rank two the value is \(\lambda_i\lambda_j(\lambda_i+\lambda_j)=3\lambda_i\lambda_j>0\) for the two positive eigenvalues. At rank one the value is zero, giving precisely the three vertices. Trace three excludes rank zero.

Use the disjoint relatively open neighborhoods

\[
 U_R=\{\lambda\in\Delta:|\lambda-(1,1,1)|_2<1/2\},\qquad
 U_L=\{\lambda\in\Delta:\lambda_{\max}>5/2\}.
\]

The complement \(K_*=\Delta\setminus(U_R\cup U_L)\) is compact and nonempty and contains no zero of \(\mathcal P\). Define \(p_* =\min_{K_*}\mathcal P>0\) and \(\varepsilon_{\rm sep}=\sqrt{p_*}/(2C_{\mathcal C})\). If \(\sup_M\mathcal G\le\varepsilon_{\rm sep}\), then (5) gives \(\mathcal P\le p_*/4\) everywhere. Thus every point lies in one of the two neighborhoods. The corresponding open sets on \(M\) are given by continuous \(|Q-I|\) and \(\lambda_{\max}(Q)\). They are disjoint and cover \(M\), so connectedness makes one of them all of \(M\).

## The induced plane curvature excludes the rank-one neighborhood

Suppose the whole slice is in \(U_L\). Write \(\lambda=\lambda_{\max}(Q)>5/2\). The other two eigenvalues sum to less than \(1/2\), so the top gap is greater than two. The one-dimensional spectral subbundle \(L\) is smooth by the simple eigenvalue. Its unit-vector bundle is a two-sheeted cover, and simple connectivity gives a global smooth unit eigenvector \(v\) by choosing one sheet. Smoothness follows from the smooth local sections and locally constant signs. Differentiate \(Qv=\lambda v\) and project onto \(L^\perp\):

\[
 (\lambda I-Q)|_{L^\perp}D_X^Av=\operatorname{pr}_{L^\perp}(D_X^A Q)v,
 \qquad |D^A v|\le\tfrac12|D^AQ|\le3|T| .                         \tag{7}
\]

Here \(D^A v\) lies in \(L^\perp\) by metricity. The inverse in (7) uses the gap alone. [E157, related limiting mechanism][rank]

Give \(L^\perp\) the orientation with positive frame \((v,e_1,e_2)\), and put \(D^\perp=\operatorname{pr}_{L^\perp}D^A\). The positive unit rotation on this plane is \(J_v w=v\times w\), so \(J_v e_1=e_2\). Write locally \(\beta_i=\langle D^A v,e_i\rangle\) and \(\theta=\langle D^A e_1,e_2\rangle\). The exact decompositions are

\[
 D^A v=\beta_1 e_1+\beta_2 e_2,\qquad
 D^A e_1=\theta e_2-\beta_1 v,\qquad
 D^A e_2=-\theta e_1-\beta_2 v .
\]

Use the curvature convention \(R^A(X,Y)=[D_X^A,D_Y^A]-D_{[X,Y]}^A\). Alternating the last decompositions gives \(\langle R^A e_1,e_2\rangle=d\theta+\beta_1\wedge\beta_2\). On the other hand \(R^A=\operatorname{ad}(F_A)\) gives \(\langle R^A e_1,e_2\rangle=\langle F_A,v\rangle/\sqrt2\). Therefore the scalar curvature two-form of \(D^\perp\), defined by \(R^\perp=\Omega J_v\), is

\[
 \Omega=d\theta=\tfrac1{\sqrt2}\langle F_A,v\rangle
                         -\beta_1\wedge\beta_2 .                   \tag{8}
\]

This form is global, since the oriented generator \(J_v\) is independent of the oriented local plane frame. The quadratic term is also global, as the pulled-back oriented plane area by \(D^Av\). The local expression \(d\theta\) proves closedness. This is the projected connection's curvature and includes the second fundamental term even when the ambient \(F_A\) is self-dual.

The first term of (8) is \(\omega_0=-\sqrt{\lambda/2}\,\sigma(v)\). It is self-dual with \(|\omega_0|\ge\sqrt5/2\). The error \(E_\Omega=-\beta_1\wedge\beta_2\) satisfies

\[
 |E_\Omega|\le|\beta_1||\beta_2|\le\tfrac12|D^Av|^2
            \le\tfrac92|T|^2\le\tfrac92\mathcal G .                \tag{9}
\]

Set \(\varepsilon_{\rm pl}=\sqrt5/36\). Under \(\sup_M\mathcal G\le\varepsilon_{\rm pl}\), (9) gives \(|E_\Omega|\le\sqrt5/8\le|\omega_0|/4\). Consequently \(|\Omega^+|\ge3|\omega_0|/4\) and \(|\Omega^-|\le|\omega_0|/4\), so

\[
 \Omega\wedge\Omega=(|\Omega^+|^2-|\Omega^-|^2)dV_g
              \ge\tfrac12|\omega_0|^2dV_g\ge\tfrac58dV_g .        \tag{10}
\]

By \(H^2(M;\mathbb R)=0\), the smooth closed real two-form is exact, say \(\Omega=d\alpha\). Its square is \(d(\alpha\wedge\Omega)\), with integral zero on closed \(M\) by Stokes. Equation (10) has strictly positive integral. This contradicts the entire \(U_L\) branch. The topology enters through the line orientation and this exactness, with no geometric scale constraint on \(M\).

## Pointwise pinching and native Ricci lower bound

In \(U_R\) each eigenvalue is at least \(1/2\). Using trace three,

\[
 \mathcal P(\lambda)\ge\tfrac12\sum_{j<k}(\lambda_j-\lambda_k)^2
             =\tfrac32\sum_i(\lambda_i-1)^2 .                      \tag{11}
\]

Thus \(|Q-I|\le\sqrt{2/3}|\mathcal C|\le72\mathcal G\) by (5), with the \(\mathcal G\) on the right evaluated at that same point. Global smallness was used to select the branch. The pointwise formula needs no integration or uniformizing chart.

Use the assessed native chiral bound of E159, with the native scalar target \(6\) and \(W^+\) measured as a Hilbert–Schmidt block on ordinary self-dual two-forms. Its right side now satisfies

\[
 \begin{aligned}
 \left(|W^+|_{\mathrm{op,HS}}^2+\tfrac14|\operatorname{Ric}_0|^2
                    +\tfrac1{48}(s-6)^2\right)^{1/2}
 &\le\tfrac12|Q-I|+6|\nabla^A T|+(42+8\sqrt3)|T|^2\\
 &\le (78+8\sqrt3)\mathcal G=:Z.
 \end{aligned}                                                     \tag{12}
\]

In particular, for any live unit tangent vector \(X\),

\[
 \operatorname{Ric}(X,X)\ge s/4-|\operatorname{Ric}_0|
             \ge\tfrac32-(2+\sqrt3)Z .                            \tag{13}
\]

Taking

\[
 \varepsilon=\min\left\{\varepsilon_{\rm sep},\varepsilon_{\rm pl},
                \frac{3}{4(2+\sqrt3)(78+8\sqrt3)}\right\}           \tag{14}
\]

gives (2). The pointwise comparison uses only the positive-chiral curvature and the Ricci block. In the terminology of E145, \(\Psi\ge k^2\mathcal G/(1+4\sqrt3)\) for \(k^2=4\pi/5\). A sufficient supplied smallness condition in that density is \(\sup_M\Psi\le k^2\varepsilon/(1+4\sqrt3)\). [E145, (6)][real] · [E159, (3)][geom] · [Native bound assessment][assessment]

## Evidence scope and frozen inputs

The result is static for an existing smooth definite connection. It supplies the pointwise linear estimate for \(Q-I\) and the Ricci lower bound from the two terms of (1). Diameter, round-basin membership and dynamical consequences are outside this packet. The proof uses the frozen relative identities and the assessed native chiral estimate. The algebra and the oriented plane curvature were derived above. No new primary work or numerical test was used.

| Input | SHA-256 |
| --- | --- |
| [E171 request][req] | `db6b989be1b1efeb5d6045788b2d3eaf03540484de3a8c70b4a7ca28a75bdf9a` |
| [B86][b86] | `7162b240aed4478c8007a11f2a1f8f520c2601d7689da7b8cd804059c4a2825c` |
| [E09 relative estimates][relative] | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| [E145][real] | `544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4` |
| [E155][static] | `e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6` |
| [E157][rank] | `50e48a665f370b3c24b642f3e172e32f53ffbdc0775e3ae198dedb19fbabdde9` |
| [E159][geom] | `eb5a66fc93fcf8e04e41870caa426e09399944be2a302b008befffb513851156` |
| [E157–E159 assessment][assessment] | `b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52` |

[req]: ../research-progress/handoffs/SP4-CME-E171_REQUEST_v1.md
[b86]: ../brainstorm/notes/B86_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md
[relative]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[real]: 145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md
[static]: 155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[rank]: 157_SEMIDEFINITE_LIMIT_RANK_TEST_20261122.md
[geom]: 159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md
[assessment]: ../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
