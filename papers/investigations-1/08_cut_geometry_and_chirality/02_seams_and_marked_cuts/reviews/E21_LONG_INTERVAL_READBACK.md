# Independent interval replay of the long short-axis cap

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded [SP4-CUT-SEAM-E21 r1](../research-progress/handoffs/E21_REQUEST_R1.md), selected GPT-6.2 Sol/ultra, actual serving details unavailable. HEAD bc2c1bbccc1d. Request SHA-256 a56377db06d5e4dab4042e30e8432da6610167d050e7d96332948ac12b591b6c. Rebuilt the final [E18 C++ source](../numerics/certify_long_short_axis.cpp), SHA-256 9000879186a22b01d012677ef3fa40a99b7a5328aa59086d1cd1221a22dc0a3f, with [E13 profile source](../numerics/seam_relaxation.py) SHA-256 05380722ed46cbbf364251443c3644833e4837da9b9fbfc0ee8a2491355cabcc. Also reproduced the initial C++ version, SHA-256 8bbb3ca8177a897472d13585e38d98b661b380c69123aa3c3861dbd958f46a7b. It has the same whole and Robin enclosures. This review adopts the final source and did not optimize or change the profile.

**Result.** The fixed smooth cap has strictly positive whole-side Robin form and \(3/2<E_+/\pi^2<4\). The final eighth of its original normalized radial coordinate alone exceeds \(3/2\). The cap improves the marked one-side upper bound to \(6.4667\pi^2\) and its larger chirality already exceeds the entire closed \(8\pi^2\) wall. All four exact comparisons in the final executable passed.

## Independent build and coverage

From the repository root, with a temporary executable path, the rebuild was

    seam_dir=papers/investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts
    e21_tmp=$(mktemp -d /tmp/sp4-e21-audit.XXXXXX)
    clang++ -std=c++20 -O3 -fno-fast-math -ffp-contract=off \
      "$seam_dir/numerics/certify_long_short_axis.cpp" -o "$e21_tmp/certify"
    "$e21_tmp/certify" "$seam_dir/numerics/seam_relaxation.py" 262144

Apple Clang 15.0.0, target arm64-apple-darwin27.0.0. A separate tiny program built with the same options reported FPCR zero, FLT_EVAL_METHOD zero, round-to-nearest and working subnormal addition. The certificate checks round-to-nearest and subnormal addition. Ordinary binary64 arithmetic without contraction or reassociation is part of its proof. The dyadic endpoints \(i/2^{18}\) are exactly representable on this build. They cover \([0,1]\), including both endpoints. Both terminal windows start on mesh endpoints, so their exact contributing cells are selected. Every computed enclosure bounds the field on the entire closed cell. The accumulated integral is an outward interval sum times the exact cell width, using rectangles for enclosure and no assumed quadrature error rate. For the minimum of the Robin quotient, the smallest cell lower endpoint is a lower bound on the global minimum, and the smallest cell upper endpoint is an upper bound on that same minimum.

The raw replay output is below. These are 17-digit displays of internal binary endpoints. The exact comparisons use the internal endpoints, and the subsequent table rounds the displays outward to shorter decimal rationals.

    cells 262144
    L [1.7499999099709342, 1.7499999099709378]
    E_plus/pi^2 [3.9499820491357513, 3.9666549961089843]
    E_plus/pi^2 on x in [13/16, 1] [2.8014687274380434, 2.8036855888222147]
    E_plus/pi^2 on x in [7/8, 1] [1.8739900324742882, 1.8750814799994462]
    min(L_phi/phi) [2.6998540191646283, 2.7226672373612733], worst lower cell 162784
    exact comparisons: E_plus > 3/2 1, E_plus < 4 1, Robin lower > 0 1, final-eighth E_plus > 3/2 1

| Quantity | Outward rational interval |
| --- | --- |
| \(L\) | \([1.74999990,1.74999992]\) |
| Whole \(E_+/\pi^2\) | \([3.9499,3.9667]\) |
| \(E_+/\pi^2\) on \(x\in[13/16,1]\) | \([2.8014,2.8037]\) |
| \(E_+/\pi^2\) on \(x\in[7/8,1]\) | \([1.8739,1.8751]\) |
| \(\min (L_g\phi/\phi)\) | \([2.6998,2.7227]\) |

## Arithmetic and analytic functions

The predecessor/successor bit operations move one unit in the correct order on finite IEEE binary64 numbers, including the separate signed-denormal values at zero. Addition uses monotonicity of the endpoints, multiplication uses all four endpoint products, and division combines multiplication with monotone reciprocals on any permitted nonzero interval. Squares use the exact lower bound zero across sign changes. Each primitive floating operation used for a bound is moved outward. The square-root routine checks candidate endpoints by outward squares, so the enclosing relation follows from those checks rather than from an assumed library error tolerance. The decisions about signs or nonzero denominators are made on interval endpoints. The build flags disable fusion and fast-math transformations.

The parser accumulates an integer numerator and denominator with explicit pre-overflow checks. Enclosing each integer conversion by adjacent binary64 values and dividing encloses the exact decimal rational. This covers even coefficients whose digit integers are too large to convert exactly. The saved 45 displayed decimals, the three seed-3 rational parameters \(19/20,7/4,3/20\), the exact width \(5/84\), rational centers \(i/21\) and scale \(1/250\) define a specific exact analytic realization of E13's formulas. This interpretation does not rely on the Python evaluator reproducing the same transcendental rounding. The length uses \(19/20+(4/5)/(1+\exp(-p_0^{\rm param}))\). The base endpoint \(A=3^{-1/4}\) is enclosed by two square roots and reciprocal, and \(B=\log(3)/4\) by the checked logarithm.

I checked all five series remainders by rational inequalities.

| Function | Audited enclosure |
| --- | --- |
| Exponential | Exact dyadic reduction to \(|t|\le1/4\), degree 14 Taylor, and subsequent interval squaring. The absolute remainder is at most \(2(1/4)^{15}/15!<2^{-64}\), by comparing successive terms with ratio at most \(1/2\). The monotonicity of the exact exponential justifies evaluating both input endpoints. |
| Logarithm | Exact binary mantissa extraction by frexp and \(\log m=2\sum y^{2j+1}/(2j+1)\) with \(y=(m-1)/(m+1)\). The finite sum ends at exponent \(39\). The program ensures \(Y=y^2<1/8\). Bounding the omitted tail by \(2(1/8)^{20}(1/2)/(41(1-1/8))<2^{-64}\) validates its quoted radius with a rational margin. The binary exponent contribution uses the same enclosure of \(\log 2\). |
| Log-relative | For \(0\le t\le1/4\) the degree 20 polynomial for \(\log(1+t)/t\) has a nonpositive error of magnitude at most \((1/4)^{21}/22<2^{-46}\) by alternation. Outside this range it uses the ordinary enclosed log. Its monotonic decrease follows from \(\int_0^1(1+ty)^{-1}dy\). The endpoint \(t=0\) has the exact value one. |
| Exponential-relative | For \(|t|\le1/4\), degree 14 with remainder at most \(2(1/4)^{15}/16!<2^{-64}\). Outside it uses the separately enclosed exponential and division. Monotonic increase follows from \(\int_0^1e^{ty}dy\). |
| Sinh tail | The degree 12 polynomial in \(Y=t^2\) for \((\sinh t-t)/t^3\) ends at \(Y^{12}/27!\). For the checked \(Y\le16\), the remaining nonnegative tail is at most \(2Y^{13}/29!\) by the geometric ratio \(16/(30\cdot31)<1/2\). This analytic extension includes \(t=0\). |

The degree limits, parity, sign of the alternating error and every endpoint selection agree with the implementation. The log-relative clamp to nonnegative on the first cell is justified by its exact argument, a product of \(q=x^2\) and \((4L/A)^2>0\).

## Geometric fields, the bolt, and the two energy integrations

Set \(q=x^2\), \(x=s/L\), \(p=4L e^{w(q)}\), \(a=xp\), \(u=xr(q)\) as in [E13](../notes/E13_VARIATIONAL_TRIAL.md). The Gaussian coordinate has first derivative \((\log251)(q+1/250)\) to the power \(-1\). Dividing by the width gives the offset derivative. Its second derivative divides this again by \(-(q+1/250)\). The rate and rate derivative in the code therefore give the corrected Gaussian's first two exact jets. The clamped axial and transverse envelopes in the code are the smooth factors \(q/(q+1/250)\) and \((1-q)^2\) of E13. The axial correction \( \tfrac12\log(1+1/C)\), \(C=(4L/A)^2\), is algebraically the E13 sum \(\log(A/(4L))+\tfrac12\log(1+C)\).

The exact endpoints have \(w(0)=0\), \(w(1)=\log(A/(4L))\), \(w_q(1)=-1/2\), \(r(1)=B\), \(r_q(1)=-B/2\). Thus \(a(L)=A,\ u(L)=B\) and both first normal slopes vanish. The dependence on \(q\) is smooth at zero. It gives \(a=4s+O(s^3)\) smooth odd and \(u=O(s)\) smooth odd. The collapsed \(i\) circle has period \(\pi/2\), so \(a/4\) is the smooth metric radius on the local normal disk. The horizontal trace-free coefficient divided by \(s\) is smooth and even, and connects with the normal slice by the weight-four action of the actual marked bolt. These are the differentiability conditions of the smooth short-axis disk, with no assumption based on sampling near zero. [E19 bolt data](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) · [E16 independent gauge and sign check](E16_CAUSAL_READBACK.md)

For the removable algebra put \(P=2\cosh(2u)\), \(d=2\sinh(2u)\) and \(S(t)=(\sinh t-t)/t^3\) by analytic extension. The checked hyperbolic quotients are
\[
 \frac d a=\frac{4(r+4q r^3S(2u))}{p},\qquad
 \frac{d-4u}{a^2}=\frac{16x r^3S(2u)}{p^2},\qquad
 \frac{Pd-8u}{a^2}=\frac{128x r^3S(4u)}{p^2}.
\]
Also \( (u/a)_s=2x(r_q-rw_q)/(Lp)\). In the remaining tangential expression use \(p_*=4L\) and \(p_{\rm tail}=(p-p_*)/q\) analytically extended. Direct expansion gives
\[
 \frac{16u}{a^2}-\frac{u_s a_s}{a}
 =\frac{x}{L^2}\left[-r(1+p_*/p)\frac{p_{\rm tail}}p
                     -2(r_q+rw_q+2q r_q w_q)\right].
\]
There is no division by \(x\) or \(q\) in this expression, including on the first cell. The code computes \(p_{\rm tail}=p_*(w/q)\operatorname{exprel}(w)\). The line for \(w/q\) divides its logarithmic term using log-relative and all remaining terms using their exact algebraic factors of \(q\). In the transverse magnetic difference, the part \(4(P-2)u_s/a\) is \(16x r^2(1+u^2 S(u))^2u_s/p\), and the leftover terms are \(8(u/a)_s-2(d-4u)a_s/a^2-2a u_s\). These reproduce E19's spin coefficients without dividing by vanishing quantities. \(a_{ss}/a=(6w_q+4q(w_q^2+w_{qq}))/L^2\) is likewise nonsingular. With the stated positive \(p,L\), the original smooth curvature limits agree with the extended expressions.

The ordinary Cartan axial and transverse \(W^+\) entries in the outward-first convention are \(\lambda_1=(-a_{ss}/a+T_1)/2-R/12+M_1\) and \(U=u_{ss}+(T_2-T_3)/2+(M_2-M_3)\). Since the printed code uses \(R/2\) for the scalar variable, its axial scalar subtraction by division by six is correct. The traceless-block norm is \((3\lambda_1^2+U^2)/2\). The quotient orbit volume is \(\pi^2 a/4\), and \(ds=L\,dx\). Thus the integrated density for \(E_+/\pi^2\) is exactly \(La(3\lambda_1^2+U^2)/8\). The whole interval and both terminal intervals use this same density. Restricting the range does not introduce any rescaling of the energy units.

## Robin sign and actual marked closing

The fixed radial test \(\phi=1+q^3(1-3q/4)\) is positive, smooth even at the bolt and has \(\phi_x(1)=0\). In this gauge the radial Laplacian is \(\phi_{ss}+(a_s/a)\phi_s\). Here \(a_x/a=1/x+2xw_q\), so the exact numerator before dividing by \(L^2\) is
\[
 \phi_{xx}+(x^{-1}+2xw_q)\phi_x
   =36q^2-48q^3+12q^3(1-q)w_q .
\]
This identity agrees with the C++ code and includes the removable value at \(x=0\). Since the face is totally geodesic, the Robin form is the Neumann form. For any smooth test \(f\), integration by parts and \(\partial_\nu\phi=0\) give its factorization
\[
 Q_g^{\rm Rob}(f)=
  6\int_W\phi^2|\nabla(f/\phi)|^2\,dV_g+
    \int_W (L_g\phi/\phi)f^2\,dV_g .
\]
The bolt is interior and smooth, so it contributes no boundary term. The certified quotient lower bound is valid for every orbit and controls the full form, including non-invariant test functions. A negative pocket of scalar curvature poses no problem for this argument. The boundary metric is the prescribed one up to a constant factor and can be rescaled to the exact representative. The positivity sign and chiral Weyl integral are unchanged by that rescaling.

The chiral difference for the marked fixed \(B=0\) face is \(E_+-E_-=-5\pi^2\), from the exact E16 transgression and the productization argument in E19. Thus the larger side integral satisfies \(E_-/\pi^2\in[8.9499,8.9667]\). The half-sum satisfies \(e_W/\pi^2\in[6.4499,6.4667]\), with the same strict Robin sign. This gives \(F_W(h_{\sqrt3})\le6.4667\pi^2\) for the exact fixed marking, while the entry threshold remains \(e_W<4\pi^2\). The actual switch exchanges the two short axes, retains the long axis up to sign, and gives the standard matrix-sphere splitting. One uses opposite orientations on the two copies. Productizing both collars before gluing is needed for an exact smooth closing in general. B04's shrinking productization preserves all strict signs and makes the limiting closed common energy \(2E_++5\pi^2\), in \([12.8998,12.9334]\pi^2\) for the certified raw cap. This interval is a limiting value under productization, not a claim about every finite smoothing. Any fixed sufficiently small smoothing still exceeds the budget. [Fixed boundary sign](E19_ANNULAR_DUAL.md#sign-and-marked-assembly) · [Exact switch](E11A_INTEGRATION.md) · [B04 smoothing](../notes/B04_PAIRED_FILLING.md#exact-reduction-for-each-surviving-marked-pair)

In fact retaining the original final-eighth annulus is enough to exclude a strict filling with the same boundary data, whatever smaller-block energy the core supplies, since that annulus has \(E_+>1.8739\pi^2\). This applies to the literal terminal geometry or an isometric copy with the same outward marking. It says nothing about modifications of that annulus or a different smooth positive filling on the disk. No arithmetic, analytic, or marking correction was required for the executable and the stated threshold comparisons. The decimal presentation distinction is recorded above.
