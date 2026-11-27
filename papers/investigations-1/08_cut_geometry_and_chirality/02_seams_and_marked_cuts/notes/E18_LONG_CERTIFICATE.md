# SP4-CUT-SEAM-E18 — Validated enclosure of the fixed long short-axis trial

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI assistance. Requested GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. Working HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. [Frozen request r1](../research-progress/handoffs/E18_REQUEST_R1.md), SHA-256 `78d9f97c963ab4ad96bcedeb3974ff80aa28166bd9f2071f87df999d234d2b00`. The [E13 source](../numerics/seam_relaxation.py) has SHA-256 `05380722ed46cbbf364251443c3644833e4837da9b9fbfc0ee8a2491355cabcc`, and the [certificate](../numerics/certify_long_short_axis.cpp) has SHA-256 `9000879186a22b01d012677ef3fa40a99b7a5328aa59086d1cd1221a22dc0a3f`. The region is the actual short-\(i\) projective-plane disk bundle. The calculation uses the outward-first E19 orientation and chiral real curvature-operator Hilbert–Schmidt norms. The prescribed \(j\)-switch between short axes is unchanged. [E12 signed block calculation](E12_AXIAL_MOMENT.md) · [E19 formula and bolt check](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md)

## Result

The fixed cap is smooth, has the prescribed totally geodesic face, and has a strictly positive whole-side Robin form. The following enclosures use outward decimal rounding of the final interval endpoints.

| Quantity | Lower | Upper |
| --- | ---: | ---: |
| \(E_+/\pi^2\) | 3.94998204913 | 3.96665499611 |
| \(E_-/\pi^2\) | 8.94998204913 | 8.96665499611 |
| \((E_++E_-)/(2\pi^2)\) | 6.44998204913 | 6.46665499611 |
| \(E_+/\pi^2\) on \(x\in[13/16,1]\) | 2.80146872743 | 2.80368558883 |
| \(E_+/\pi^2\) on \(x\in[7/8,1]\) | 1.87399003247 | 1.87508148000 |
| \(\min_W(L_g\phi/\phi)\) | 2.69985401916 | 2.72266723737 |

The fixed trial has \(E_+<4\pi^2\). Its half-sum exceeds \(4\pi^2\), and the actual marked paired target \(E_+<3\pi^2/2\) fails. Its larger block alone exceeds the \(8\pi^2\) budget of any homotopy-sphere closing retaining this cap. The two derived whole-side energy rows use \(E_--E_+=5\pi^2\) with the fixed orientation and boundary jets. The \(x\ge7/8\) subtotal shows that any oriented core replacement on this marked disk retaining that terminal annulus, even up to smooth conformal rescaling there, fails the single-cap \(E_+<3\pi^2/2\) test. The argument uses nonnegativity of the remaining local chiral energy. It allows changes of the terminal annulus as a different competitor and leaves the unrestricted filling problem open.

## Profile and exact jets

Each of the 45 literals in the E13 `REPLAY_PROFILE` is the **exact displayed decimal**. Use its seed 3, namely `STARTS[2]`, with length bounds \(19/20,7/4\) and anisotropy parameter \(3/20\). The basis has 22 functions, centres \(i/21\) for \(0\le i\le21\), width \(5/84\), \(S=1/250\), and logarithmic normalization \(\log251\). All these are the stated mathematical constants. The certificate reads the literal coefficients from the source as decimal rationals. It evaluates no optimizer.

Put \(x=s/L,\ q=x^2,\ A=3^{-1/4},\ B=(\log3)/4\). Write \(a=4Lx\,e^{w(q)}\), \(u=xr(q)\), with horizontal orbit lengths \(e^{-u},e^u\). For \(C=(4L/A)^2\) the fixed axial background is
\[
 -\tfrac12\log(1+Cq)+w_Bq(2-q)+w_Dq(q-1),
 \qquad w_B=\tfrac12\log(1+1/C),\quad w_D=-\frac1{2(1+C)}.
\]
The correction is \((1-q)^2q/(q+S)\) times the displayed axial Gaussian sum. The transverse background is \(B/\sqrt{q+3/20}+r_B+r_D(q-1)\), where \(r_B=B-B/\sqrt{1+3/20}\) and \(r_D=-B/2+B/[2(1+3/20)^{3/2}]\). Its Gaussian correction is \((1-q)^2\) times the displayed transverse sum. The value and derivative of each correction vanish at \(q=1\). Substitution gives \(w(1)=-\tfrac12\log C\), \(w_q(1)=-1/2\), \(r(1)=B\), \(r_q(1)=-B/2\). Thus \(a=A,\ u=B,\ a_s=u_s=0\) at the face, with metric of lengths \((A,A,\sqrt3 A)\). At the bolt \(w(0)=0\), \(a=4s+O(s^3)\) is smooth and odd in \(s\), and \(u\) is smooth odd. The same equivariant normal-slice argument as in E19 applies to these analytic profiles: the order-four collapse gives angle \(4\alpha\), and the horizontal anisotropic tensor has the same weight and reflection type. The polar term \(a/4=s+O(s^3)\) and the anisotropy term \(\sinh(2u)/s\) have the smooth radial parity required for the marked bundle. The orbit scale is positive on the open principal part because \(a=4Lx e^w\). These are exact endpoint and smoothness checks.

## Enclosed integrands and whole-side positivity

Use \(\ell_q=\log(1+Cq)/(Cq)\), extended by 1 at zero. The quotient \(w/q\) is evaluated as
\[
 -\tfrac C2\ell_q+w_B(2-q)+w_D(q-1)
 +\frac{(1-q)^2}{q+S}\sum_i A_i G_i(q)
\]
with the axial coefficients \(A_i\) and Gaussians \(G_i\). Put \(p=4Le^w\) and \(p_{\rm tail}=4L(w/q)\operatorname{exprel}(w)\), where \(\operatorname{exprel}(w)=(e^w-1)/w\) is extended by 1. Thus \(p_{\rm tail}=(p-4L)/q\) with its removable value. The code also evaluates the E19 hyperbolic tail \(H(y)=(\sinh y-y)/y^3\) by its even power series. For example, the singular-looking terms in the transverse curvature formulas are replaced by
\[
 \frac{d}{a}=\frac{4(r+4qr^3H(2u))}{p},\quad
 \frac{d-4u}{a^2}=\frac{16xr^3H(2u)}{p^2},\quad
 \frac{Pd-8u}{a^2}=\frac{128xr^3H(4u)}{p^2},
\]
where \(P=2\cosh(2u)\), \(d=2\sinh(2u)\). The remaining tangential difference is evaluated using
\[
 16u/a^2-u_s a_s/a
 =\frac{x}{L^2}
   \left[-r(1+4L/p)(p_{\rm tail}/p)
          -2(r_q+r w_q+2q r_q w_q)\right].
\]
This follows by factoring \((4L)^2-p^2=-q(p+4L)p_{\rm tail}\). The other terms use the E19 formulas directly. In particular the energy density with respect to \(dx\), divided by \(\pi^2\), is \(La(3V_+^2+W_+^2)/8\), from the \(Q_8\) orbit volume and the trace-free chiral diagonal. These replacements verify continuity on the entire closed input interval.

For \(\phi=1+x^6-3x^8/4\), \(\phi\ge1\), smooth at the bolt, and \(\phi_x(1)=0\). With \(L_g=-6\Delta_g+R_g\) and \(\Delta_g=\operatorname{div}\nabla\), the orbit volume density is proportional to \(a\), so \(\Delta_g\phi=\phi_{ss}+(a_s/a)\phi_s\). Since \(a=4Lx e^{w(x^2)}\),
\[
 \frac{L_g\phi}{\phi}
 = R_g-\frac{6[36q^2-48q^3+12q^3(1-q)w_q]}{L^2\phi}.
\]
The enclosed lower bound is pointwise over all cells, including the bolt. For arbitrary smooth real \(v\), integration by parts gives the Neumann form as
\[
 Q_g(v)=6\int_W\phi^2|\nabla(v/\phi)|^2\,dV_g
       +\int_W (L_g\phi/\phi)|v|^2\,dV_g .
\]
The boundary term vanishes by \(H=0\) and \(\partial_\nu\phi=0\). Density gives the same result on \(H^1(W)\). Thus the proof bounds the full first Robin eigenvalue below by \(2.69985401916\), including non-invariant functions. This is an analytical consequence of the validated pointwise inequality, independent of the floating Ritz estimate.

## Validation and replay

MPFR and Arb were unavailable on this host. The certificate instead uses C++ binary64 intervals with outward neighbor operations after each IEEE basic operation, default round-to-nearest arithmetic, and no fused contraction or reassociation. Decimal literals from the profile are converted using integer strings and enclosing rational division. The code guards the radix precision, rounding mode and subnormal arithmetic. Square-root endpoints are checked by interval squaring. Neither the platform logarithm nor exponential is used in a proof bound.

The exponential uses exact dyadic range reduction to \(|t|\le1/4\), 14 degree Taylor evaluation with a \(2^{-64}\) remainder bound, and interval squaring. The logarithm uses an exact binary mantissa, the atanh series through \(y^{39}\) for \(y=(m-1)/(m+1)\), then a \(2^{-64}\) allowance by \(|y|\le1/2,\ y^2\le1/8\). Small arguments of \(\log(1+t)/t\) use the alternating expansion through degree 20 with next term bounded by \(2^{-46}\). The analogous exponential quotient uses its entire Taylor series through degree 14 and a \(2^{-64}\) allowance for \(|t|\le1/4\). The even \(H\) expansion through \(y^{24}/27!\) encloses the remainder by twice the first omitted term on the checked region \(y^2\le16\). Thus each computed interval encloses all values of the desired function on a cell.

The integration enclosure is the common cell width times the sum of the pointwise energy intervals, with no quadrature truncation hypothesis. Both terminal subtotals are sums of exactly aligned cells. The global minimum is bounded below by the least cell lower bound and above by the least cell upper bound. At 4,096 and 32,768 cells the basic lower energy and Robin inequalities already held. The total upper energy bound fell below 4 at the third level, 262,144 cells. The final certificate was rerun at this same level with both subtotals. It completed in about 7.3 seconds on arm64 with Apple clang 15.0.0.

Run from the repository root:

```sh
seam_numerics=papers/investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/numerics
clang++ -std=c++20 -O3 -fno-fast-math -ffp-contract=off -Wall -Wextra -Wpedantic \
  "$seam_numerics/certify_long_short_axis.cpp" -o /tmp/sp4_seam_e18_certificate
/tmp/sp4_seam_e18_certificate "$seam_numerics/seam_relaxation.py" 262144
```

The exit status is zero when the exact binary endpoint comparisons for \(E_+>3\pi^2/2\), \(E_+<4\pi^2\), positive Robin lower bound, and terminal-eighth \(E_+>3\pi^2/2\) all hold. The certificate is for the one stated profile and its two terminal subregions.
