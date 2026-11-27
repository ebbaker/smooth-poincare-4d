# SP4-CUT-TUBE-E27 — independent finite-length and half-flat endpoint check

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Sol 6.2/ultra requested. Actual model and effort unavailable to this reader. Independent analytical review under [E27_REQUEST_R1](../research-progress/handoffs/E27_REQUEST_R1.md), checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The inputs are [E26's frozen setup](../research-progress/handoffs/E26_REQUEST_R1.md), the [E05 conformal form](../notes/E05_TWISTED_EXTERIORS.md) and the [E15 half-flat germ](E15_QUATERNIONIC_COLLAR.md). The calculations below require no fitted coefficients.

## Curvature and the length coefficients

Let \(P\) be the punctured fibre and \(DP\) its double. The path \(h_t\), \(0\le t\le1\), has smooth mapping-torus jets and \(R_{h_t}\ge r_0>0\) on \(DP\). The fixed fibre reflection preserves every \(h_t\) and commutes with the doubled attaching map. Work in \(g_L=L^2dt^2+h_t\), with orientation given by the increasing \(t\)-direction followed by the fibre orientation. Set \(K=\tfrac12\partial_t h_t\) and \(H=\operatorname{tr}_{h_t}K\). All contractions below are with \(h_t\), and \(K^2\) denotes the contraction of one index from each factor. Primes on covariant tensors mean differentiation in the fixed fibre coordinates. The unit normal is \(e_0=L^{-1}\partial_t\).

The radial curvature tensor and the tangential Ricci contraction in an orthonormal frame at the point are
\[
 \begin{aligned}
  R_{0i0j}&=L^{-2}N_{ij},&N&=-K'+K^2,\\
  \sum_{k=1}^3R_{kikj}&=(\operatorname{Ric}_{h_t})_{ij}+L^{-2}J_{ij},
        &J&=K^2-HK.
 \end{aligned}
\]
The first identity follows by differentiating the covariant \(K\) in the normal direction and including the connection term \(K^2\). The second is the Gauss contraction of \(-K\owedge K/2\). Since \(\operatorname{tr}K'=H'+2|K|^2\), the scalar identity is
\[
 R_{g_L}=R_{h_t}+L^{-2}\operatorname{tr}(2N+J)
        =R_{h_t}-L^{-2}\bigl(2H'+H^2+|K|^2\bigr).
\]

In the Weyl electric block the trace-free part of \(R_{0i0j}-\operatorname{Ric}_{ij}/2\) is the whole block. Define spatial tensors
\[
  X=-\tfrac12\operatorname{Ric}_{h_t}^{\circ},
  \qquad Z=\tfrac12(-K'+HK)^\circ .
\]
Then the electric block is \(X+L^{-2}Z\). For the magnetic block use the convention \(R_{0i\,jk}=\langle R(e_j,e_k)e_i,e_0\rangle\). Codazzi gives \(R_{0i\,jk}=L^{-1}(\nabla_kK_{ij}-\nabla_jK_{ik})\). Set
\[
   M_{ij}=\operatorname{sym}_0\left(
          \tfrac12\varepsilon_j{}^{k\ell}
             (\nabla_\ell K_{ik}-\nabla_k K_{i\ell})\right)_{ij},
\]
where \(\operatorname{sym}_0\) means the symmetric trace-free part. The mixed Schouten correction under the Hodge star in the last pair is antisymmetric, so the magnetic block of Weyl equals \(L^{-1}M\). The first Bianchi identity makes the raw magnetic trace zero. Weyl commutes with the four-dimensional star, so in the two orthonormal triples \(e^0\wedge e^i\) and \(*_4(e^0\wedge e^i)\) its diagonal blocks both equal the electric block and its off-diagonal blocks both equal the magnetic block. Consequently in the normalized chiral triples the Weyl operators are
\[
     W^\pm=X+L^{-2}Z\pm L^{-1}M .
\]
There is no factor of two from passing to those normalized triples.

Define all norms and pairings in the next display using \(dt\,dV_{h_t}\) over \([0,1]\times P\). The mean of the two Hilbert–Schmidt energies of the exterior is
\[
 \begin{aligned}
 f(L)&=A L+B/L+C/L^3,\\
 A&=\|X\|_2^2,\qquad B=2\langle X,Z\rangle_2+\|M\|_2^2,\qquad C=\|Z\|_2^2,\\
 E_\pm(X_L)&=f(L)\pm 2\langle X,M\rangle_2
                    \pm 2L^{-2}\langle Z,M\rangle_2 .
 \end{aligned}
\]
The volume element contributes \(L\) here. Reflection is even for \(X,Z\) and odd for \(M\), so on the full mapping-torus double the two signed integrals agree and each equals \(2f(L)\). The signed cross terms need not vanish on a half without an additional boundary or symmetry argument. The general energy constraints from the formula include \(A,C\ge0\) and \(B\ge-2\sqrt{AC}\).

## Static normalization and exact length tests

For a stationary fibre \(K=0\), both signs reduce to \(L\int_P|\operatorname{Ric}_h^\circ|^2dV_h/4\) and \(R_{g_L}=R_h\). A stationary round fibre of sectional curvature \(k>0\) has \(\operatorname{Ric}_h^\circ=0\) and \(R_{g_L}=6k\). For a stationary product fibre with a line direction and two-sphere sectional curvature \(k>0\), its Ricci eigenvalues are \((0,k,k)\). Then the chiral eigenvalues are \((k/3,-k/6,-k/6)\), giving the norm \(k^2/6\) in each chirality and \(R_{g_L}=2k\). On any stationary region with sphere radius \(r\), the energy density is \(1/(6r^4)\) relative to \(L\,dt\,dV_h\). This comparison applies for a local product patch or the global non-Einstein product, and tests the normalization without a filling hypothesis.

Write \(D=2H'+H^2+|K|^2\). The pointwise scalar-positive sufficient cutoff is \(L^2>d_{\rm sc}:=\max(0,\sup D/R_h)\). Indeed it is also necessary for strict pointwise positivity on this fixed compact path when \(d_{\rm sc}>0\), by the attained maximum. The conformal form gives a potentially weaker and exact cutoff for Yamabe positivity. On the closed smooth double define
\[
 \begin{aligned}
 S[u]&=\int\bigl(6|\nabla^{h_t}u|^2+R_hu^2\bigr)\,d\mu,\\
 T[u]&=\int\bigl(6(u'+Hu/3)^2-|K^\circ|^2u^2\bigr)\,d\mu,\qquad
 d\mu=dt\,dV_h .
 \end{aligned}
\]
The integral is over the full doubled path with the mapping-torus identification imposed on \(u\). Integration by parts uses the matched jets to cancel the endpoint terms and \(\partial_t dV_h=H\,dV_h\). In the scalar term it replaces \(-2H' u^2\) by \(4Huu'+2H^2u^2\). On adding the remaining scalar and gradient terms, this yields the conformal numerator \(Q_L[u]=L S[u]+T[u]/L\), as in E05.

Let \(d_{\rm Y}=\sup_{u\ne0}(-T[u]/S[u])\) over smooth descending functions. Since \(S[u]\ge r_0\|u\|_{L^2(d\mu)}^2\) and \(T[u]\ge-\kappa\|u\|_{L^2(d\mu)}^2\) for \(\kappa=\sup|K^\circ|^2\), one has \(d_{\rm Y}\le\kappa/r_0\). Test with high spatial frequencies in a fixed local product chart and a fixed smooth time cutoff to see \(d_{\rm Y}\ge0\): \(|T|\) stays bounded whereas \(S\) grows quadratically in the spatial frequency. Then, for \(L>0\), the first conformal-Laplacian eigenvalue on \(DX_L\) is positive exactly if \(L^2>d_{\rm Y}\). The strict upper side follows from \(Q_L\ge(L-d_{\rm Y}/L)S\). On the lower side some \(u\) has \(Q_L[u]<0\). At positive equality the form is nonnegative. If the first eigenvalue were positive there, combine \(Q_L\ge\lambda_1 L\|u\|_{L^2(d\mu)}^2\) and \(Q_L\ge L S-\kappa\|u\|_{L^2(d\mu)}^2/L\) with a sufficiently small positive weight \(\alpha\) on the second inequality. It would give \(Q_L\ge\alpha L S\) and hence \(d_{\rm Y}\le(1-\alpha)L^2<L^2\), a contradiction. Thus the eigenvalue at positive equality is zero. Compactness and the Sobolev inequality give the same sign for the Yamabe constant. In particular \(d_{\rm Y}\le d_{\rm sc}\).

For either cutoff \(d=d_{\rm sc}\) or \(d_{\rm Y}\), test the open admissible range \(L>\sqrt d\). If \(A>0\) and \(C>0\) there is one positive stationary squared length,
\[
 y_*=\frac{B+\sqrt{B^2+12AC}}{2A}.
\]
This follows by multiplying \(f'(L)\) by \(L^4\) and putting \(y=L^2\). The function decreases before that length and increases after it. The same formula gives \(y_*=B/A\) when \(C=0\), since then \(Z=0\) and \(B\ge0\), with \(y_*=0\) meaning the infimum is at the lower endpoint. Thus the infimum is at \(\max(\sqrt d,\sqrt{y_*})\), interpreted as a one-sided limit when this is the cutoff. If \(A=0\), then \(X=0,\ B\ge0\), and \(f\) tends to zero as \(L\to\infty\).

For the exterior budget \(\mathcal E_*=(2/3)T_{\rm scale}=8\pi^2/3\) in the parent normalization \(T_{\rm scale}=4\pi^2\), the exact fixed-path test is to find \(L>\sqrt{d_{\rm Y}}\) with
\[
       A L^4-\mathcal E_* L^3+B L^2+C<0 .
\]
Alternatively the scalar cutoff suffices without measuring \(d_{\rm Y}\). A strict infimum below the budget gives a point in the open admissible range even if the infimum lies at its excluded endpoint. The energy on the double is \(2f(L)\). This criterion is conditional on an actual marked path and only concerns the exterior and its positive double. It does not construct a matching cap or recognize a smooth closing. Variable lapse, shift or a path varying with \(L\) falls outside the calculation.

After deriving the formulas above, I compared [the returned E26 note](../notes/E26_LENGTH_TEST.md), SHA-256 beginning `8345b550f604762d`. Its \(D_0,U\) are \(-2X,2Z\) in this review, and its \(M\) equals the magnetic block here by antisymmetry of \(\varepsilon\). Both derivations give the same signed terms, factor on the double, scalar cutoff and constrained minimum. E26's proof of the Yamabe endpoint using a maximizing sequence agrees with the coercivity proof above. For the positivity criterion, certified upper bounds on the three coefficients and on \(d_{\rm Y}\) suffice when evaluated at any strict passing length. A lower bound over an enlarged admissible range can exclude the fixed path.

## The explicit positive half-flat continuation

On the positive component containing the boundary, E15's solution has \(W^+=0\) in the increasing-\(s\) quaternion orientation, with
\[
 c^2=1+4x-2x^2,\qquad x=e^{-2v},\qquad ds=dv/c,\qquad
 R=6(1-4x+6x^2)\ge2.
\]
The scalar lower bound follows by completing the square. Towards \(v\to+\infty\), \(c\to1\) and \(ds/dv\to1\), so the round end is at infinite distance and no circle collapses. In the backward direction \(c^2\) first vanishes at \(x_*=1+\sqrt6/2\). This is a simple zero as a function of \(v\), so \(ds/dv\) is integrable there and the endpoint is at finite distance. The one-sided slope is
\[
     c_s=\tfrac12\,\frac{d(c^2)}{dv}
          =4x_*(x_*-1)=6+2\sqrt6 .
\]
The ordinary \(\pi/2\)-period collapsing quaternionic circle requires slope \(4\). The finite endpoint has the wrong cone angle even for an aligned filling. It also collapses the long boundary axis, which differs from the required short-axis marking. These are both ends of the explicit regular positive biaxial interval in the displayed gauge. This verifies the continuation statement for this solution and leaves open a deformation acquiring energy in the smaller chirality. [E15 germ](E15_QUATERNIONIC_COLLAR.md) · [nonsymmetric impasse](../brainstorm/notes/NONSYMMETRIC_IMPASSE.md)
