# Validated cuff lengths and conditional degree on the smooth fit

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E calculation under master B02. Actual serving model variant and reasoning effort were unavailable. Intake HEAD `48f36794f9b1`. The [frozen smooth comparator][data] has Git blob `52799ce89460`. The computation uses binary64 with outward rounding, Python's Decimal elementary functions and exact rational quadrature weights. It concerns the original \(L=2\operatorname{arcosh}5\) circular-pants marking of the width-\(1/16\) trial.

On the whole box \(p=p_*+[-2\cdot10^{-5},2\cdot10^{-5}]\times[-5\cdot10^{-5},5\cdot10^{-5}]\), both full cuff lengths of the smooth comparator with the exact Hopf basis are below \(4.6\). The lower bounds for the properly signed, preconditioned comparator length residual on paired faces are \(1.9988\cdot10^{-5}\) and \(4.9975\cdot10^{-5}\). If the exact scalar solutions satisfy \(\sup_{p,z}|u_p(z)-v_p(z)|\le126\cdot10^{-6}\), the true signed residuals exceed \(8.0391\cdot10^{-6}\) and \(1.8377\cdot10^{-5}\). At the looser gate \(193\cdot10^{-6}\) they still exceed \(1.6851\cdot10^{-6}\) and \(1.5746\cdot10^{-6}\). Therefore either uniform bound gives degree \(+1\) for the true two-length problem. The interior estimate supplying the height is a separate input. [Verifier][script] · [Scalar residual reduction][scalar]

## Quadrature and transfer to the parameter faces

The three quarter-circle pieces in the calculation use \(w=i^j(1+it)/(1-it)\), \(0\le t\le1\), and arclength \(2r\,dt/(1+t^2)\) on radius \(r\). One outer quadrant gives the full outer length by the two reflections. Two right-hole quadrants give the full right length by conjugation. On each piece evaluate the center length and its two parameter derivatives using the exact dyadic \(v_p=v_*+\sum_j(p-p_*)_jv_j\) and the approximate rational Hopf fields. The tangent coefficient used in the integrand is \(P=\operatorname{Re}(-w^2\Phi)\). The pointwise formulas are \(e^{v/2}+Pe^{-v/2}\) and
\[
 \tfrac12v_j(e^{v/2}-Pe^{-v/2})+P_j e^{-v/2}.
\]
The exact tangent coefficient is real. Its use in the cuff error estimate below accounts for the approximate field on both circles. [Frozen coefficients and response columns][data] · [Native scalar and length formulas][native]

The code uses 1,024 panels and degree-16 closed Newton–Cotes integration with exact rational weights. All evaluation nodes are dyadic. For a panel midpoint \(t_0\), the analytic comparison disk has radius \(1/128\). Both \(w\) and its conjugated-coefficient continuation change there by at most \(2/127\). The rational chart denominators remain nonzero. For each nonconstant radial Chebyshev argument, the bound on its shift \(d\) from the real interval gives \(|T_j|\le e^{j^2d}\) by the derivative Markov inequality and the finite Taylor series. On a chart's own cuff \(y\bar y=1\) exactly in the analytic extension. The logarithmic part is holomorphic in this disk using the branch continued from its real center. Each log argument \(z-1,z+1\) varies by a relative amount less than \(1/32\), and the entire base term has magnitude less than 6. The same pole-distance bounds give analytic upper bounds for both rational Hopf fields. These provide certified suprema \(M\) of all integrands on the midpoint disks. With \(q=(1/2048)/(1/128)=1/16\), Cauchy bounds the Taylor remainder by \(Mq^{17}/(1-q)\). The quadrature error over each unit interval is bounded by this remainder times \(1+\sum|w_i|\), where \(w_i\) are the normalized local quadrature weights. The sum of values and the remainder are accumulated outward. [Analytic and rounding implementation][script]

The analogous nearest-node Cauchy bound gives uniform bounds on \(v_*,v_j,P_*,P_j\) along the real arcs. For the affine shifts put \(x=|\delta v|/2\). The error after the first-order parameter expansion of the speed is bounded pointwise by
\[
 e^x\left\{\frac{x^2}{2}\big(e^{v_*/2}+|P_*|e^{-v_*/2}\big)
                       +|\delta P|\,x\,e^{-v_*/2}\right\}.
\]
Integrate this using the real arclength upper bound, then add the exact-basis correction. The 24-mode projected cuff residual extends harmonically in \(\zeta=4(z-1)\) to \(|\zeta|\le8/7\) with size bounded by \(10^{-21}(8/7)^{24}+(10/9)(2/7)^{25}/(1-2/7)\). Adding its lift to the signed harmonic error gives zero trace and permits odd inversion across the cuff. The radius-\(1/32\) disk derivative estimate gives the exact-basis error, which is below \(10^{-10}\) for \(\Phi\) uniformly on these cuffs and this box. The verifier replays these rational inequalities. [Cuff residual lift and bound on the approximate gradient][scalar] · [Multipole source][multipoles]

The resulting intervals for center lengths, their derivatives in order \(\alpha,\beta\), and uniform Taylor-plus-basis remainders are bounded by the widened displayed endpoints below.

| Cuff | Center interval | \(\partial_\alpha\) | \(\partial_\beta\) | Remainder bound |
| --- | --- | --- | --- | ---: |
| Outer | \([4.5848633424,4.5848633430]\) | \([-43.828158417,-43.828158405]\) | \([-7.403650991,-7.403650983]\) | \(2.56\cdot10^{-7}\) |
| Right | \([4.5848633336,4.5848633343]\) | \([-16.041716341,-16.041716336]\) | \([-15.238524124,-15.238524119]\) | \(2.01\cdot10^{-7}\) |

Apply \(D=\bigl(\begin{smallmatrix}-.02775&.01348\\.02921&-.07982\end{smallmatrix}\bigr)\) to the intervals for the center lengths minus \(L\) and to the length-Jacobian intervals. For each pair of faces, retain the diagonal linear contribution with its face sign, and subtract the maximum contributions from the center residual, the free parameter and both remainders. This gives the comparator edge bounds above without sampling the parameter faces. Both coefficients \(\alpha,\beta\) are negative throughout the box. Each exact field has purely imaginary tangential 1-form value on a cuff, so the squared-field combination on the tangent is nonnegative. A uniform scalar perturbation of size \(S\) therefore changes either exact-basis cuff length by at most \(4.6(e^{S/2}-1)\). For the two heights \(126\cdot10^{-6}\) and \(193\cdot10^{-6}\) the respective corrections are below \(0.000290\) and \(0.000444\). The interval evaluation after applying \(D\) gives the positive residual floors stated above. The exact two-length map is continuous in its parameters. The four strict outward signs give a straight homotopy on the boundary to the coordinate translation map without a boundary zero, hence degree \(+1\). The rational preconditioner has positive determinant, so the unpreconditioned map has the same degree. [Certifier][script] · [Quantitative sufficient interior hypothesis][scalar]

[data]: ../numerics/whole_pants_residual_d18.json
[script]: ../numerics/cuff_length_certificate.py
[scalar]: SCALAR_FIT_RESIDUAL_20261127.md
[native]: NATIVE_HARMONIC_DATA_20261127.md
[multipoles]: ../numerics/native_harmonic_measures.py
