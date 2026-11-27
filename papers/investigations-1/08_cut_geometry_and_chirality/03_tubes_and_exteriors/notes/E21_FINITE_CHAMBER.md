# SP4-CUT-TUBE-E21 — a finite splice on the actual round chamber

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Sol 6.2/ultra requested. Actual model and effort unavailable to this worker. This is the single fixed trial of [E21_REQUEST_R1](../research-progress/handoffs/E21_REQUEST_R1.md) and [B06](../brainstorm/notes/B06_ROUND_CHAMBER.md), checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The marked input is [E18's matrix chamber](E18_QUATERNIONIC_PAIR.md), with [E07's curvature conventions](../reviews/E07_PROJECTIVE.md) and the [ledger marking](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md).

The finite splice extends an open part of the actual round \(\mathbb{RP}^2\) chamber to a smooth positive-scalar-curvature cap with an umbilic right-invariant Berger boundary of ratio \(t=\sqrt3\). The collapsing axis is the short axis \(i\). In the outward-first quaternion orientation, the unchanged middle of the interpolating segment has \(E_-\ge(2503/200)\pi^2>8\pi^2\). Any exterior of this cap would therefore miss the closed band.

## Round core and fixed interpolation

In the unit sphere of trace-free symmetric matrices put
\[
 A_i=\frac{\operatorname{diag}(2,-1,-1)}{\sqrt6},
 \qquad Z_i=\frac{\operatorname{diag}(0,-1,1)}{\sqrt2},
 \qquad D(s)=\cos s\,A_i+\sin s\,Z_i .
\]
The arclength \(s\) increases outwards from the projective-plane bolt. In the left quotient \(Y=Q_8\backslash SU(2)\) the orbit lengths of the right-frame axes \(i,j,k\) are
\[
 A(s)=\bigl(4\sin s,\,
       2\sqrt3\cos s-2\sin s,\,
       2\sqrt3\cos s+2\sin s\bigr).
\]
Indeed the squared length of a quaternion generator is eight times the squared gap of the other two eigenvalues. The formulas hold up to the first midpoint \(s=\pi/6\). The actual round core is used up to \(s_0=\arctan(7/24)<\pi/6\). It has zero energy in both chiralities and \(R=6\). Its smooth bolt and normal-circle marking come from the matrix embedding; the first length vanishes with derivative \(4\).

Set \(W=1/2\), \(B=11/5\), \(x=(s-s_0)/W\) and \(C=B(1,1,\sqrt3)\). On \(0\le x\le1\) take the common cubic Hermite profile
\[
 a_i(x)=A_i^{(0)}+(3x^2-2x^3)(C_i-A_i^{(0)})
                              +W V_i^{(0)}x(1-x)^2
 \qquad(i=1,2,3),
\]
where \(A^{(0)}=A(s_0)\), \(V^{(0)}=\partial_sA(s_0)\), and the index \(i=1\) denotes the quaternion axis \(i\). Thus the two data triples are exactly
\[
 A^{(0)}=\frac1{25}(28,\ 48\sqrt3-14,\ 48\sqrt3+14),
 \quad
 V^{(0)}=\frac1{25}(96,\ -14\sqrt3-48,\ -14\sqrt3+48).
\]
The initial length and outward normal derivative are \(A^{(0)},V^{(0)}\). The terminal length and derivative are \(C,0\). Add a collar of length \(1/100\) in which the orbit metric is constant with lengths \(C\). The endpoint on that collar is totally geodesic. Its two short axes are \(i,j\), while its elongated axis is \(k\). Use the identity in marked \(Y\) coordinates at both joins. On the core and cubic segment the metric is \(ds^2+\sum a_i^2\sigma_i^2\), with the round lengths on the core. The resulting reference profile is \(C^{1,1}\) at both joins and smooth on each closed piece.

## Exact computation for the finite segment

Use \(ds\wedge\sigma_{123}\) with \(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclically. The E07 structure equations with derivatives in \(s\) give
\[
 \begin{aligned}
 H_i&=a_i'/a_i,\qquad n_i=2a_i^2/(a_1a_2a_3),
       \qquad U_i=(n_j+n_k-n_i)/2,\\
 K_{0i}&=-a_i''/a_i,\qquad K_{jk}=U_i n_i-U_jU_k-H_jH_k,
       \qquad m_i=-n_iH_i+U_kH_j+U_jH_k,\\
 R&=2\sum_i(K_{0i}+K_{jk}),\qquad
 \lambda_i^\pm=\tfrac12(K_{0i}+K_{jk})\pm m_i-R/12 .
 \end{aligned}
\]
The diagonal entries \(\lambda_i^\pm\) are the Weyl eigenvalues because the three paired two-form blocks are invariant. The orbit volume is \(\pi^2 a_1a_2a_3/4\), so \(E_\pm/\pi^2\) are the integrals of \((W a_1a_2a_3/4)\sum_i(\lambda_i^\pm)^2\) in \(x\).

The [checker](../numerics/finite_chamber_certificate.py) brackets \(\sqrt3\) by the consecutive \(10^{-15}\) multiples `1.732050807568877` and `1.732050807568878`, with the inequalities checked by squaring. It evaluates lengths and polynomial derivatives over 2,048 rational cells by Horner's rule, encloses the Cartan expressions on each cell, and sums enclosed rectangles for each signed energy. Rounding the densities outwards at \(10^{-8}\) and the totals at \(10^{-3}\) gives
\[
 \begin{gathered}
  \min_{x,i} a_i(x)\ge 28/25,\qquad
  R\ge 2379/500,\\
  E_+/\pi^2\in[567/50,463/40],\qquad
  E_-/\pi^2\in[16317/1000,16599/1000],\\
  E_-(1/8\le x\le7/8)/\pi^2\in[2503/200,509/40].
 \end{gathered}
\]
These bounds apply to the whole cubic interval, including both one-sided endpoint limits, with the restriction in the last bound indicated explicitly. Run `python3 papers/investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/numerics/finite_chamber_certificate.py` from the repository root. The checker reuses the exact Fraction interval primitives in [the E01 certificate](../numerics/trefoil_certificate.py). A floating Gauss calculation gave \(R_{\min}\approx4.7820\) on the cubic, \(E_+/\pi^2\approx11.45748\) and \(E_-/\pi^2\approx16.45748\). Those numbers served only as diagnostics.

The round core adds zero to each signed energy. On the terminal product the intrinsic scalar curvature is \(2/B^2=50/121\). In each chirality the long-axis Weyl eigenvalue is \(-8/(3B^2)\) and the squared Weyl norm is \(32/(3B^4)\). The length-\(1/100\) collar therefore adds exactly \(2\sqrt3\pi^2/165\) to each reference energy.

## Smooth cap, chirality and scope

The two first jets agree at each join. Smooth the length profiles in disjoint small radial neighborhoods of the joins, supported away from the retained round core, the Berger face, and the closed middle interval \(1/8\le x\le7/8\). In the smaller neighborhoods use convolution with a nonnegative smooth radial kernel of integral one. A fixed smooth cutoff to the original profiles can be made where the reference is already smooth. The profiles and their first derivatives converge uniformly and their second derivatives stay bounded. In the region of convolution, \(R\) is affine in the second derivatives with continuous coefficients depending smoothly on the positive lengths and their first derivatives. It is therefore the convolution of \(R\) plus a uniformly vanishing error. The cutoff transition converges in \(C^2\). The positive bounds on the core, cubic and terminal product guarantee \(R>0\) on the smoothed cap for small support. This argument uses neither a smoothing at the bolt nor a change of the outer product metric.

Away from the two joins the curvature converges pointwise and it is uniformly bounded around the joins. Both signed integrals converge to their respective reference values. For example, the smoothing support can be chosen so the smooth cap's energy in each chirality differs from the corresponding reference energy by less than \(\pi^2/100\). The unchanged middle interval gives the stronger direct obstruction for every such smoothing, since its contribution alone exceeds the wall. The smooth cap has signature zero and product boundary. The signed difference is \(E_+-E_-=12\pi^2(-5/12)=-5\pi^2\) by the ledger, consistent with the floating difference. [Signed calibration](../reviews/E07_PROJECTIVE.md) · [Berger eta on the fixed quotient](../../01_chirality_ledger/notes/QUATERNIONIC_MARKING.md)

For a smooth homotopy-sphere closing both closed chiral energies equal \(e\). Additivity over the cap and any exterior, with nonnegative exterior energy, rules out \(e<8\pi^2\) for the present cap in either orientation. The round core's vanishing energy isolates the obstruction in this full-width shear adjustment. The result covers this fixed profile and its local seam smoothings. Other interpolations from a round germ to the same Berger datum remain open.
