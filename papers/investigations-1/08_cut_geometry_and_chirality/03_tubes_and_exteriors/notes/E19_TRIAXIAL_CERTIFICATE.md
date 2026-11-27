# E19 — Certified direct triaxial short-axis cap

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. [Frozen E19 request](../research-progress/handoffs/E19_REQUEST_R1.md), baseline `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Sol 6.2/ultra requested. Actual model and effort are unavailable. Uses the fixed [E17 family](../research-progress/handoffs/E17_REQUEST_R1.md), the supplied [floating evaluator](../numerics/direct_triaxial.py) (SHA-256 prefix `4432647d5f1c4a31`), and the marked [E07 geometry and conventions](../reviews/E07_PROJECTIVE.md). The [certificate](../numerics/triaxial_certificate.py) uses the standard library and the seven specified exact decimal constants.

The fixed profile has \(p\ge0.7597\) and scalar curvature \(R\ge2.6306\) everywhere in the horizontal-area-one gauge. Its exact outward-rounded energy enclosures are

| Integral | Lower bound in units of \(\pi^2\) | Upper bound in units of \(\pi^2\) |
| --- | ---: | ---: |
| \(E_+\) | 5.0412 | 5.0586 |
| \(E_-\) | 10.0406 | 10.0592 |
| \((E_++E_-)/2\) | 7.5423 | 7.5575 |

This cap is smooth and has the marked totally geodesic short-axis Berger boundary. Its larger signed energy alone exceeds \(2T=8\pi^2\). Every orientation-compatible homotopy-sphere closing that retains this cap has closed energy at least \(10.0406\pi^2\), since the closed chiral integrals are equal and the exterior contribution in each is nonnegative. Reversing the orientation interchanges the signs. This result concerns the fixed direct profile.

## Profile, end data and regularity

Write \(x=s/L\), \(q=x^2\), \(a=xp(q)\), \(u=xr(q)\) and take orbit lengths \((a,e^{-u},e^u)\) in the right-invariant quaternion frame. Set \(A=3^{-1/4}\), \(B=\log(3)/4\). The family used is
\[
\begin{aligned}
 p(q)&=4L+\tfrac12(5A-16L)q+\tfrac12(8L-3A)q^2
       +q(1-q)^2(-0.235767+0.148703q-0.047647q^2),\\
 r(q)&=B(3-q)/2+(1-q)^2(-0.023612-0.020121q-0.006356q^2),
 \qquad L=0.391295 .
\end{aligned}
\]
The square envelope preserves the terminal value and first derivative. Thus \(a(L)=A,\ u(L)=B,\ a_s(L)=u_s(L)=0\), and the boundary lengths are \((A,A,\sqrt3 A)\) with the collapsing axis the first. The product-normalized jets give zero second fundamental form there.

At the bolt \(a(s)=4s+O(s^3)\) is smooth odd and \(u\) is smooth odd with \(u(0)=0\). The slice angle is \(4\alpha\) for the normalizer generator \(\exp(\alpha i)\), because the principal circle has period \(\pi/2\). The two-dimensional horizontal tangent rotates through \(2\alpha\), so its traceless symmetric tensor rotates through \(4\alpha\). The normalizer's reflection has the same reflection type on the normal plane and on this tensor plane. In a local normal two-disk, the anisotropic tensor with coefficient \(\sinh(2u)\) is therefore linear in the normal Cartesian coordinates times the smooth even scalar \(\sinh(2u)/s\). The term with \(\cosh(2u)\) is smooth and even. The polar normal metric extends because \(a(s)/4=s+O(s^3)\) is odd and smooth, and \(s^2d\gamma\) for the slice angle \(\gamma\) is the smooth form \(X\,dY-Y\,dX\) in those coordinates. These local expressions are equivariant under the normalizer and apply to the marked disk bundle. Strict scalar positivity at the bolt follows from the removable formulas below and smoothness.

## Independent curvature check

Use \(e^0=ds,\ e^i=a_i\sigma_i\), \(a_i=(a,e^{-u},e^u)\) and \(d\sigma_i=2\sigma_j\wedge\sigma_k\) in cyclic order. In the outward-first quaternion orientation let \(k_i=(a_i)_s/a_i\), \(\mu_i=2a_i/(a_ja_k)\) and \(f_i=(\mu_j+\mu_k-\mu_i)/2\). Cartan's first equation gives \(\omega_{i0}=k_ie^i\), \(\omega_{jk}=f_i e^i\). In the second equation the radial, tangential and mixed coefficients are
\[
 A_i=-a_{i,ss}/a_i,\qquad T_i=f_i\mu_i-f_jf_k-k_jk_k,\qquad
 M_i=-\mu_i k_i+f_k k_j+f_j k_k .
\]
For the mixed coefficient, differentiating \(\omega_{0i}\) gives \(-\mu_i k_i\) and its two product terms give \(f_k k_j+f_j k_k\). The chiral blocks are diagonal with entries \(\lambda_i^\pm=(A_i+T_i)/2-R/12\pm M_i\) and \(R=2\sum_i(A_i+T_i)\). This is the real two-form operator norm. If \(V_\pm=\lambda_1^\pm\) and \(W_\pm=\lambda_2^\pm-\lambda_3^\pm\), tracelessness gives \(|W^\pm|_{\rm HS}^2=(3 V_\pm^2+W_\pm^2)/2\).

For \(P=2\cosh(2u)\) and \(d=2\sinh(2u)\), the connection coefficients are \(f_1=P/a-a,\ f_2=a+d/a,\ f_3=a-d/a\). Substitution gives
\[
\begin{aligned}
 R/2&=-a_{ss}/a+2P-a^2-d^2/a^2-u_s^2,\\
 T_1&=2P-3a^2+d^2/a^2+u_s^2,\\
 T_2-T_3&=-4d+4Pd/a^2-2u_s a_s/a,\\
 M_1&=-2a_s+2(d/a)u_s,\qquad
 M_2-M_3=(4P/a-2a)u_s-2d\,a_s/a^2 .
\end{aligned}
\]
Also \(A_2-A_3=2u_{ss}\). These identities recover the axial and transverse differences used by the certificate. For the apparent singular terms, set \(H(y)=(\sinh y-y)/y^3\) extended at zero. The quotients \(d/a\), \((d-4u)/a^2\) and \((Pd-8u)/a^2\) become
\[
 \frac{4(r+4qr^3H(2u))}{p},\qquad
 \frac{16xr^3H(2u)}{p^2},\qquad
 \frac{128xr^3H(4u)}{p^2}.
\]
In \(T_2-T_3\) the leftover combination is \(2(16u/a^2-u_s a_s/a)\). Its numerator after multiplication by \(xL^2p^2\) is \((16L^2-p^2)r-2qp(r_qp+rp_q+2qr_qp_q)\). With \(p_0=4L\) and \(p-p_0=q p_{\rm tail}\), this cancels its pole exactly. In \(M_2-M_3\) the corresponding combination is \(8(u/a)_s\) plus \(4(P-2)u_s/a\), \(-2(d-4u)a_s/a^2\), and \(-2a u_s\). Use \(P-2=4\sinh^2 u\) and \(\sinh u=u(1+u^2 H(u))\) to remove those quotients. All resulting terms are continuous at \(x=0\), with denominators involving only \(p,L\). The orbit volume is \(\pi^2 a/4\), since the round volume is \(2\pi^2\), the principal group has order eight, and the horizontal lengths multiply to one. Accordingly the normalized integration weight in \(x\) is \(L a/4\).

## Reproducing the rational enclosure

Run `python3 papers/investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/numerics/triaxial_certificate.py` from the repository root. The certificate ran successfully with Python 3.10.0. Intervals have integer endpoints in units of \(2^{-96}\). Products, squares, reciprocals and square roots round outwards by integer division or integer square root. The positive reciprocal of two successive square-root enclosures of three bounds \(A\). For \(\log 3=2\operatorname{artanh}(1/2)\), the script uses the first 40 rational power series terms and bounds the positive remainder by \(4/3\) times the first omitted term. The series for \(\cosh y\) and \(H(y)\) in \(y^2\) use 12 terms. The code checks \(|y|\le2\) on each cell. The ratios in either omitted tail are then below \(1/2\), so twice the first omitted term with \(y^2\le4\) bounds that remainder. There is no transcendental floating evaluation in the certificate.

The 16,384 equal dyadic cells cover the full closed interval. On each cell the code encloses \(p\), \(R\), and each energy density using the removable expressions. Each rectangular integral enclosure is the cell width times the full range enclosure. In the mean, the opposite chiral cross terms cancel before evaluation. Summing and rounding the resulting bounds outwards to four decimal places gives the displayed numbers. A separate evaluation of the fixed profile in the supplied floating script gave mean \(7.5498999132\) and sampled minimum scalar curvature \(2.6695890172\). The bounds above follow from interval arithmetic over the entire disk. The comparison supplies no minimization claim for other parameter choices or more general triaxial caps.
