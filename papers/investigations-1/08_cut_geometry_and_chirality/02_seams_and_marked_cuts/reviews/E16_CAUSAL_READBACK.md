# Causal Weyl-energy bound for the marked short-axis cap

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Independent analytical replay of [SP4-CUT-SEAM-E16 r1](../research-progress/handoffs/E16_REQUEST_R1.md). Requested GPT-6.2 Sol/ultra, actual serving model and effort unavailable. HEAD bc2c1bbccc1d. The current SHA-256 prefixes match all six frozen inputs: [B04](../notes/B04_PAIRED_FILLING.md) 90dddbd55bcc, [E08C](E08C_REALIZATION.md) 243574e5c143, [E11A](E11A_INTEGRATION.md) 440b47fd2ec5, [closing note](../continuation-notes/CLOSING_20261127.md) 926db2d6c534, [TUBE return](../../03_tubes_and_exteriors/research-progress/handoffs/TO_SEAM_SHORT_AXIS_RESULT_20261127.md) 1f0b0b3d5aff and [E19](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) 5333dc4d1816.

**Result.** The causal obstruction holds for the designated pointwise ceiling \(y\le 1/\sqrt3\) and extends to \(y\le 3/5\), with smaller chiral energy \(E_+/\pi^2\ge 867/575>3/2\) under the latter ceiling. The original, smaller ceiling gives the stronger long-cap bound \((69/64-1/\sqrt3)^2/(621/4096)\). With no ceiling, a strict-budget competitor must satisfy one of two necessary conditions. If its normalized length is at least \(v_0=\tfrac12\log(8/5)\), then \(y(v_0)>3/5\). If it is shorter, its \(v\)-average of \(y\) exceeds \(99/52\). These are estimates on the specified triaxial metric family and the short collapsing axis, with no use of Robin positivity or aligned-axis bounds.

## Metric and endpoints

Use the oriented projective-plane disk bundle \(W\) of the round matrix sphere and its fixed left-quotient orbit \(Q_8\backslash S^3\), with collapsing \(i\). The prescribed boundary conformal class has right-invariant lengths \((1,1,\sqrt3)\) in \(i,j,k\) order. Its marked switch exchanges \(i,j\) and negates \(k\). This preserves the boundary metric and is the actual marking in B04 and E11A. It keeps the meridian short on both sides. Changing the cap profile below does not change this marking.

For a smooth diagonal triaxial invariant metric in proper radial distance \(\tilde s\), write the principal orbit lengths \((\tilde a,\tilde b,\tilde c)\). Multiply the metric by \((\tilde b\tilde c)^{-1}\), and put \(ds=(\tilde b\tilde c)^{-1/2}d\tilde s\) increasing from the bolt. Its lengths are
\[
 (a,a_2,a_3)=(a,e^{-u},e^u),\qquad
 a=\frac{\tilde a}{\sqrt{\tilde b\tilde c}},\qquad
 u=\tfrac12\log(\tilde c/\tilde b).
\]
The product \(\tilde b\tilde c\) is smooth and positive across the bolt. In a local normal disk the horizontal metric is an isotropic part plus a trace-free part transforming with the normal polar angle. Its horizontal determinant is a smooth positive rotation-invariant function. Smoothness at the bolt gives the angle rate four for the collapsing circle, and horizontal equality there. More explicitly the principal stabilizer cuts the collapsing-circle period to \(\pi/2\), so its length as a circle must be \(2\pi s+O(s^3)\), giving \(a(s)=4s+O(s^3)\). The trace-free horizontal part is odd along a signed radius, since a rotation through \(\pi\) in the normal plane negates that part. Thus \(u(s)=O(s)\) is smooth odd near the bolt. The conformal normalization preserves these properties.

Define
\[
 y=a^2,\qquad v=\int_0^s a(\xi)\,d\xi,\qquad D=d/dv,\qquad
 c=\cosh(2u),\qquad d=2\sinh(2u).
\]
The quantities \(y=\tilde a^2/(\tilde b\tilde c)\) and \(dv=\tilde a\,d\tilde s/(\tilde b\tilde c)\) are unchanged by invariant conformal rescalings. The four-dimensional chiral energies are conformally invariant. The conformal Robin sign is also invariant, though it is unnecessary for the obstruction. At an umbilic principal face, all three logarithmic normal derivatives of the orbit lengths agree. The normalization removes their common value. In particular the face is totally geodesic in this gauge. If \(V\) is the terminal value of \(v\) and \(m=1/\sqrt3\), the two endpoint data are
\[
 \begin{array}{c|ccc}
 &y&y_v&c\\ \hline
 0&0&8&1\\
 V&m&0&2m
 \end{array}
 \qquad
 u(V)=\tfrac14\log3,\quad u_s(V)=u_v(V)=c_v(V)=0 .
\]
Indeed \(y_v=2a_s\), \(y_{vv}=2a_{ss}/a\), and \(v=2s^2+O(s^4)\) at the bolt. The two ratios \(d^2/y\) and \(y u_v^2=u_s^2\), and the derivative \(c_v=d u_v\), all extend as bounded functions as \(v\downarrow0\). Thus the equations below can be integrated from the bolt. The endpoint for \(u_v\) is part of the totally geodesic face check. The direct integral of \(c_v\) uses its two endpoint *values* of \(c\), and does not require the extra fact \(c_v(V)=0\). [E19 smooth disk data](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) · [Whole-side Robin covariance](../notes/E04_ROBIN_DESCENT.md)

## Chiral function and orientation

Take \(e^0=ds\), \(e^i=a_i\sigma_i\), \(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclic, oriented by \(e^{0123}\) with the outward radial direction first. Put \(k_i=(a_i)_s/a_i\), \(\mu_i=2a_i/(a_j a_k)\), and \(f_i=(\mu_j+\mu_k-\mu_i)/2\). Cartan's first equation gives \(\omega_{i0}=k_i e^i\) and \(\omega_{jk}=f_i e^i\). The \(01\) and \(23\) curvature entries from the second equation are
\[
 A_1=-a_{ss}/a,\qquad T_1=f_1\mu_1-f_2f_3-k_2k_3,\qquad
 M_1=-\mu_1k_1+f_3k_2+f_2k_3.
\]
For example the \(\Omega_{01}\) tangential term is the \(d\omega_{01}\) term \(-\mu_1k_1 e^{23}\) plus the two matrix-product terms \(f_3k_2 e^{23}\) and \(f_2k_3 e^{23}\). In this orientation \(*e^{01}=e^{23}\). The axial \(W^+\) entry is therefore \(\lambda_1=(A_1+T_1)/2-R/12+M_1\). The traceless Ricci block exchanges the chiralities. The block decomposition is in Atiyah–Hitchin–Singer \(\S1\), equation (1.1), printed p. 427, checked on local PDF p. 4, SHA-256 beginning a4d55168994f0581. [Primary article](https://doi.org/10.1098/rspa.1978.0143) · [Local facsimile](../../../../../references/Atiyah.pdf)

Putting \(a_2=e^{-u}\) and \(a_3=e^u\) gives \(f_1=2c/a-a,\ f_2=a+d/a,\ f_3=a-d/a\). In the scalar trace \(R/2=\sum_i(A_i+T_i)\), the three radial terms sum to \(-a_{ss}/a-2u_s^2\). The orbit terms sum to \(4c-y-d^2/y+u_s^2\). In particular
\[
 \frac R2=-a_{ss}/a+4c-y-d^2/y-u_s^2,\quad
 T_1=4c-3y+d^2/y+u_s^2,\quad
 M_1=-2a_s+2(d/a)u_s=-y_v+2c_v.
\]
Consequently the recomputed exact evolution is
\[
 Q:=6\lambda_1=-(D+2)(D+4)(y-1)
      +8(c-1)+4d^2/y+4y u_v^2+12c_v .                     \tag{1}
\]
If \(a(s)=4s+a_3^{\rm bolt}s^3+O(s^5)\) and \(w=u_s(0)\), its bolt limit is \(Q(0)=-3a_3^{\rm bolt}-40+20w^2\). Here \(y_{vv}(0)=3a_3^{\rm bolt}\) and \(d^2/y,\ y u_v^2,\ c_v\) each tend to \(w^2\). At the face \(d(V)=2m\), so the vanishing slopes and the prescribed values give \(Q(V)=-y_{vv}(V)+24m\). The orbit volume is \((\pi^2/4)a\), since the round sphere has volume \(2\pi^2\) and its left quotient has order eight. A traceless self-adjoint \(3\times 3\) matrix with first diagonal entry \(\lambda_1\) has Hilbert–Schmidt square at least \(3\lambda_1^2/2\), by the sum of the other two diagonal entries. Thus, with \(B_+=E_+/\pi^2\),
\[
                       B_+\ \ge\ \frac1{96}\int_0^V Q^2\,dv.       \tag{2}
\]

The smaller-sign assignment can be checked analytically for every profile, independently of the E19 numerical enclosure. On the regular cylinder, let \(p_i=-(a_i)_s\) and \(q_i=f_i a_i\). The connection entries are \(\omega_{0i}=p_i\sigma_i\) and \(\omega_{jk}=q_i\sigma_i\) cyclic. The lift frames descend up to the constant sign matrices from \(Q_8\), so the trace Chern–Simons form calculated with these frames is well defined on the regular quotient. On an orbit it equals
\[
 \operatorname{tr}(\omega\wedge d\omega+\tfrac23\omega^3)
 =4H\,\sigma_{123},\qquad
 H=-\sum_i(p_i^2+q_i^2)+\sum_{\rm cyc}p_i p_j q_k+q_1q_2q_3.
\]
In fact the quadratic trace is \(-4\sum_i(p_i^2+q_i^2)\sigma_{123}\) using the structure equations. In the cubic trace each unordered triple of indices contributes six equal ordered terms, giving the last two terms with coefficient four after multiplication by \(2/3\). Its exterior derivative is \(\operatorname{tr}(\Omega\wedge\Omega)=-2(|W^+|_{\rm HS}^2-|W^-|_{\rm HS}^2)dV_g\). The chiral trace of the squared curvature operator gives this identity directly, because the squared scalar parts cancel, the Weyl blocks are trace-free, and the off-block parts contribute equal traces.

At the bolt, if \(u_s(0)=w\), the orbit limits are \(p=(-4,w,-w)\) and \(q=(2,w,-w)\), giving \(H(0)=-20\), independently of \(w\). At the prescribed totally geodesic face \(p=0\) and \(q=(\sqrt3,\sqrt3,-1)\), giving \(H(V)=-10\). Integrate first on a truncated regular cylinder and then let its inner orbit tend to the bolt. The original smooth curvature is integrable there and the explicit trace has the stated limit. With \(\int\sigma_{123}=\pi^2/4\) and the outer orientation positive, the result is
\[
                  E_+-E_-=-\tfrac12\pi^2\bigl(H(V)-H(0)\bigr)
                          =-5\pi^2.                              \tag{3}
\]
Thus \(E_+\) is the smaller integral in the chosen radial orientation. Reversing orientation exchanges the labels. The half-sum on the marked side is \(\pi^2(B_++5/2)\). The budget \(e_W<T\) is therefore \(B_+<3/2\) in this gauge.

## Causal test at a fixed observation time

Let \(y_0(v)=1+2e^{-2v}-3e^{-4v}\). It solves \((D+2)(D+4)(y_0-1)=0\) with \(y_0(0)=0\) and \(y'_0(0)=8\). The causal inverse on zero initial data has kernel
\[
 K(t)=\tfrac12(e^{-2t}-e^{-4t}),\qquad K(0)=0,\qquad K'(0)=1.
\]
Therefore (1) expresses \(y(v)-y_0(v)\) as the convolution of \(K\) with \(8(c-1)+4d^2/y+4y u_v^2+12c_v-Q\). The first three terms are pointwise nonnegative and \(K\ge0\) for nonnegative elapsed time. For any \(v\le\tfrac12\log2\), integration by parts gives
\[
 \int_0^v K(v-t)c_t(t)\,dt
     =\int_0^v K'(v-t)(c(t)-1)\,dt\ge0 .
\]
The boundary terms vanish because \(K(0)=0\) and \(c(0)=1\). Here \(K'(t)=-e^{-2t}+2e^{-4t}\ge0\) on the indicated interval. This uses no monotonicity of the anisotropy profile. It follows that whenever \(0<v\le\min(V,\tfrac12\log2)\),
\[
 y(v)\ge y_0(v)-\left(96 B_+\int_0^v K(t)^2\,dt\right)^{1/2}.     \tag{4}
\]
In fact \(\int_0^v K(v-t)Q(t)dt\ge y_0(v)-y(v)\), and Cauchy–Schwarz and (2) give (4).

At \(v_0=\tfrac12\log(8/5)\), put \(r=e^{-2v_0}=5/8\). Then \(y_0(v_0)=69/64\) and
\[
 I_0=\int_0^{v_0}K(t)^2\,dt=\frac14\left(
    \frac{1-r^2}{4}-\frac{1-r^3}{3}+\frac{1-r^4}{8}\right)
      =\frac{207}{131072},\qquad 96I_0=\frac{621}{4096}.
\]
For \(V\ge v_0\), the ceiling \(y(v_0)\le m\) gives
\[
 B_+\ge\frac{(69/64-m)^2}{621/4096}>\frac{1024}{621}>\frac32,
\]
using \(m<37/64\). A broader ceiling \(y(v_0)\le3/5\) yields
\[
 B_+\ge\frac{(153/320)^2}{621/4096}=\frac{867}{575}
      =\frac32+\frac9{1150}.
\]
For a strict-budget competitor with \(V\ge v_0\), the exact necessary condition at that single time is \(y(v_0)>69/64-12\sqrt{I_0}>3/5\), because \((69/64-3/5)^2-144I_0=243/204800>0\). It holds without imposing a cap on \(y\) elsewhere.

## Short lengths and scope

Write \(\bar y=V^{-1}\int_0^V y\,dv\). Integrating (1) with the endpoint values and \(y_v(V)=0\) gives
\[
 \int_0^V Q\,dv\ \ge\ (18m-4)+8V(1-\bar y).
\]
The three nonnegative anisotropy terms were discarded here. Keeping the two square terms strengthens the estimate, since
\[
 4d^2/y+4y u_v^2\ge 8|d u_v|=8|c_v|,\qquad
 \int_0^V|c_v|\,dv\ge c(V)-c(0)=2m-1 .
\]
Consequently
\[
                \int_0^V Q\,dv\ \ge\ (34m-12)+8V(1-\bar y).       \tag{5}
\]
For \(V<v_0\) and \(y\le3/5\) the right-hand side is positive and at least \(34m-12\). Cauchy–Schwarz and (2) give \(B_+\ge(34m-12)^2/(96V)>27225/10816>867/575\), since \(m>15/26\) and \(v_0<6/25\). The rational time comparison follows from \(e^{12/25}>1+12/25+(12/25)^2/2+(12/25)^3/6>8/5\).

With no height ceiling, if a short competitor had \(B_+<3/2\), then \(\int Q<12\sqrt V\) by (2). Equation (5) forces
\[
 \bar y>1+\frac{34m-12-12\sqrt V}{8V}
       >1+\frac{99/13-147/25}{48/25}=\frac{99}{52},
\]
where \(V<v_0<6/25<(49/100)^2\) gives the last comparison. In particular this short competitor must overshoot even \(y=1\) on its interior. This conclusion is independent of the height at any specified observation time.

Combining the two length ranges under \(y\le3/5\) gives \(e_W/\pi^2\ge 4+9/1150\) by (3). Under \(y\le m\) the preceding stronger long-time bound applies and the short-time lower bound is larger still. The proof uses the actual bolt angle, the prescribed totally geodesic triaxial face with collapsing short \(i\), finite smooth profiles, and the E19 orientation. A profile with a larger collapsing-length excursion or a smooth filling outside the invariant triaxial ansatz remains a separate competitor. The strict whole-filling Robin inequality remains a separate requirement for any such candidate. [Paired-filling criterion and exact switch](../notes/B04_PAIRED_FILLING.md)
