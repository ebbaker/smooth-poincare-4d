# Smooth native scalar fit and a local cuff-length certificate

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E for master B02 at checkout `48f36794f9b1`. Actual serving model and reasoning effort were unavailable. Uses the [native reconstruction](NATIVE_HARMONIC_DATA_20261127.md), [multipole certificate](HARMONIC_MEASURE_CERTIFICATE_20261127.md) `93a53a41156b`, [FEM diagnostic](../numerics/hopf_cuff_fit.py) `0df43494de5a`, and [original geometry](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md) `e999229fcdf9`. The domain is the actual planar pants of the smooth oriented long-cuff trial, with the literal Euclidean cuff normal and both fixed band markings.

The weighted scalar defect for the frozen comparison is below \(1/8000\) on all 460 tiles of the original pants, for every parameter in the prescribed box. This gives the actual cuff-length root and physical first-jet estimates. The local criteria and sampled diagnostics below record the construction. [Whole-domain certificate](NATIVE_MARKED_JET_CERTIFICATE_20261127.md)

## Comparison using the reaction at the smooth trial

Use \(F_p(v)=2(e^v-|\Phi_p|^2e^{-v})\), \(g=(-1/2,8,8)\) on the outer, right and left cuffs, and \(u_p\) for the actual scalar solution. Let \(v_p\) be any smooth trial and bound its physical cuff flux error by \(b\). Define
\[
 B=\frac32+\frac{|z|^2}{6}-\frac12\log|z^2-1|,\qquad
 \eta=\sup_F\frac{|\Delta v_p-F_p(v_p)|+(2/3)b}{F'_p(v_p)},\qquad
 F'_p(v_p)=2(e^{v_p}+|\Phi_p|^2e^{-v_p}).
\]
Uniform bounds over a parameter box can be used in these formulas. Here \(0<B<5\) and \(\Delta B=2/3\). These bounds follow from \(7/16\le|z^2-1|\le17\) and \(|z|\le4\). At the outer circle the sum of the outward logarithmic distance derivatives is at most \(8/15\), by the formula in the [ellipticity proof](NATIVE_ELLIPTICITY_20261127.md). Thus \(\partial_\nu B\ge 4/3-4/15>1\). At either hole, the logarithmic self term contributes \(2\), the other hole contributes at worst \(-2/7\), and the radial term at worst \(-5/12\), again giving \(\partial_\nu B>1\).

If \(\eta<1\), put \(h=-\log(1-\eta)+bB\). For any \(h\ge0\), both \(F_p(v_p+h)-F_p(v_p)\) and \(F_p(v_p)-F_p(v_p-h)\) are at least \((1-e^{-h})F'_p(v_p)\), by expanding the two exponentials. This lower bound is at least \(\eta F'_p(v_p)\). The trial \(v_p+h\) then has nonpositive scalar defect and outward flux at least \(g\), and \(v_p-h\) has the reverse inequalities. Monotonicity of \(F_p\) and integration against the positive part of the comparison difference give
\[
 |u_p-v_p|\le S=-\log(1-\eta)+5b.
\]
The coefficient uses the reaction at the chosen trial and requires no lower bound for the exact scalar field. On an interior disk of radius \(r\), take \(A\) to bound \(F'_p\) between \(v_p-S\) and \(v_p+S\) on that disk and \(s\) to bound the scalar defect there. The disk Poisson and Green kernels then give \(|\nabla(u_p-v_p)|\le 4S/(\pi r)+(2r/3)(s+AS)\) at its center. This is a first-jet bound on the physical band footprints. [Earlier Green-kernel comparison](HARMONIC_MEASURE_CERTIFICATE_20261127.md)

An explicit boundary lift can be used if exact flux matching is preferable. In a disjoint width-\(1/8\) cuff collar set \(\rho\) to inward Euclidean distance and \(E(\theta)=\partial_\nu v_p-g\) on that cuff. Add \(\xi(\rho)E(\theta)\), with \(\xi=\rho(1-8\rho)^3\) in the collar and zero outside. Its derivative at the cuff is \(-E\) in the outward direction. The field is \(C^2\), sufficient for the comparison, and the correction vanishes at the cuff and on both band footprints. In the collar the absolute Laplacian cost is at most \(52\|E\|_\infty+2\|E''\|_\infty\), since \(|\xi'|\le1\), \(|\xi''|\le48\), and the cuff-centered radius is at least \(1/4\). A smooth cutoff with the same derivative at zero also gives exact flux matching. The comparison with \(B\) allows the analytic fitted field to be used directly.

## Multipole error on the full pants and actual cuffs

Let \(e=v_\epsilon-v_\epsilon^{\rm app}\) be the harmonic-potential error per parity of the 24-mode certificate, so \(|e|<2\cdot10^{-15}\) on the pants. At the right cuff the residual \(v_\epsilon^{\rm app}-A_\epsilon\) has real Fourier coefficients \(r_n\) in \(\zeta=4(z-1)\), with zero constant. Its regular harmonic extension \(b_\epsilon(\zeta)=\operatorname{Re}\sum_{n\ge1}r_n\zeta^n\) is defined near the cuff. For \(1\le n\le24\), \(\sum |r_n|<10^{-21}\). For larger \(n\), the holomorphic continuation bound is \(|r_n|\le (10/9)4^{-n}\). Indeed the majorant at radius four in the earlier estimate is at most \(1+(1/3)(1/28+1/4+1/32)<10/9\) using the rational mode coefficient sum. Thus on \(|\zeta|\le8/7\) the extension has supremum at most
\[
 10^{-21}(8/7)^{24}+\frac{10}{9}\frac{(2/7)^{25}}{1-2/7}<3.9\cdot10^{-14}.
\]
The harmonic function \(e+b_\epsilon\) has zero cuff trace and extends by odd circle inversion. For any center on the cuff, the radius-\(1/32\) disk and the inverted part stay within \(|\zeta|\le8/7\), away from the other cuffs. The bound for the derivative of a harmonic real function on a radius-\(r\) disk is twice its supremum divided by \(r\). Apply this separately to \(e+b_\epsilon\) and \(b_\epsilon\). It gives \(|P_\epsilon-P_\epsilon^{\rm app}|<5.2\cdot10^{-12}\) on the right cuff. On the left use parity, and on the outer circle the original zero error extends without a lift. On all of \(F\) the same argument with disks of radius \(1/64\) gives \(|P_\epsilon-P_\epsilon^{\rm app}|<1.1\cdot10^{-11}\). In fact, interior centers farther than \(1/64\) from the cuffs need no reflection. The remaining disks near a hole and their inverted parts have \(|\zeta|\le8/7\), since the largest direct radius is \(1+2(1/64)/(1/4)=9/8\), and the innermost possible radius in this normalization is \(15/16\).

Each approximate field satisfies \(|P_\epsilon^{\rm app}|<73\) on \(F\). For one pole, the logarithm has derivative bound \(4+1/12\), the direct multipole derivative has bound \(4\cdot24/3\), and the image multipole derivative bound is \(24/(3\cdot36)\). Here the rational coefficient sum is less than \(1/3\), the two multipole arguments have magnitude at most one, and their derivatives have respective bounds four and \(1/36\). Add both poles. Consequently, for \(|\alpha|+|\beta|<.122\), the two-square Hopf combination has error \(<10^{-10}\) on the actual cuffs and \(<2\cdot10^{-10}\) globally. These uniform errors concern the given unnormalized basis and do not use a scalar discretization. [Exact Fourier residual replay](../numerics/native_harmonic_measures.py)

## Smooth comparator and numerical checks

The [replay](../numerics/whole_pants_residual.py) builds \(v_p\) from \(|z|^2/64-\tfrac32\log|z^2-1|\) and smooth rational-polynomial modes on the whole native domain. For \(y_0=z/4\), \(y_+=1/(4(z-1))\), and \(y_-=1/(4(z+1))\), use
\[
 f_{kj}(y)=\operatorname{Re}(y^k)T_j(2|y|^2-1),\qquad
 f_{kj}(y_0),\qquad f_{kj}(y_+)+(-1)^k f_{kj}(y_-).
\]
The outer modes have even \(k\) through 20, and the paired hole modes have every \(k\) through 20. For each \(k\), use \(0\le j\le18\) in increasing order, outer basis first. These functions preserve both source symmetries and are real analytic on a neighborhood of the closed pants. Writing \(s=|y|^2\) and \(P(s)=T_j(2s-1)\), the exact Laplacian is \(4|y'(z)|^2\operatorname{Re}(y^k)[sP''+(k+1)P']\). The physical boundary derivatives are calculated by direct chain rule with the actual three circle normals.

Weighted nonlinear collocation starts from the \(128\)-angular-cell FEM parameters and an initial constant. It then solves for two smooth first-response columns with homogeneous flux in the linearized equation. A numerical two-length Newton step is taken with these columns. The [frozen exact dyadics](../numerics/whole_pants_residual_d18.json) at `52799ce89460` specify a single affine trial family \(v_p=v_{p_*}+\sum_j(p-p_*)_j v_j\) with \(p_*=(-.0011414936248075422,-.11985172081876369)\) to the shown decimals. The exact center is the pair of hexadecimal values stored in the file. The smooth fit uses the FEM as an initializer, and no P1 gradient enters its residual. A `float.hex` entry may be interpreted as an exact dyadic rational for interval evaluation.

At the center the numerical full outer and right length residuals are \((3.57\cdot10^{-9},-5.18\cdot10^{-9})\). On a separate validation grid the maximum sampled scalar defect is \(4.528\cdot10^{-4}\), sampled flux error is \(1.641\cdot10^{-9}\), and sampled relative residual is \(7.866\cdot10^{-5}\). The sampled range of \(e^{v_{p_*}}\) is \([.0212887,4.66617]\). The edge figures below use nine sample points per edge. These figures only evaluate the deterministic smooth trial, and the first-jet and root conclusions require range enclosures.

The independent [exact cuff-flux check](../numerics/cuff_flux_certificate.py) bounds the normal defect by \(1.803\cdot10^{-9}\) uniformly on all three physical cuffs and throughout the parameter box. It uses the same frozen dyadics and the affine responses. Its boundary conclusion is stronger than the \(10^{-7}\) flux tolerance used below.

## Concrete sufficient four-edge bounds

Take the box of radii \((2\cdot10^{-5},5\cdot10^{-5})\) about \(p_*\) and the exact rational preconditioner
\[
 D=\begin{pmatrix}-.02775&.01348\\.02921&-.07982\end{pmatrix}.
\]
For a cuff unit Euclidean tangent \(\tau\), the real coefficient \(P=\Phi_p\tau^2\) is nonnegative in this box. Each exact harmonic-measure gradient pairs in a purely imaginary value with \(\tau\), and both parameters are negative. Thus the actual speed and the speed from \(v_p\) at the same exact \(\Phi_p\) are \(e^{w/2}+P e^{-w/2}\), with \(w=u_p\) and \(w=v_p\), respectively. Each term changes by a factor in \([e^{-S/2},e^{S/2}]\). Denote the trial lengths using the exact Hopf basis by \(\tilde\ell\). If on the whole box
\[
 \eta\le1/8000,\qquad b\le10^{-7},\qquad
 \tilde\ell_{\rm outer},\tilde\ell_{\rm right}<4.6,
\]
then \(S<126\cdot10^{-6}\). The error in either full cuff length is at most \((e^{S/2}-1)\tilde\ell_j<.000290\). The two errors after applying \(D\) are respectively below \(1.196\cdot10^{-5}\) and \(3.162\cdot10^{-5}\). Therefore it suffices to certify the following strict signed trial margins, where the lower-face sign is reversed.

| Fixed coordinate | Sufficient trial margin for \(D(\tilde\ell-L)\) | Observed minimum over sampled faces |
| --- | ---: | ---: |
| \(\alpha\) | \(1.5\cdot10^{-5}\) | \(1.9997\cdot10^{-5}\) |
| \(\beta\) | \(4.0\cdot10^{-5}\) | \(4.9997\cdot10^{-5}\) |

The maximum sampled relative residual on those faces was \(7.874\cdot10^{-5}\). For the ranges above, the global absolute Hopf truncation error can be included in the nonlinear residual, and the sharper cuff error \(<10^{-10}\) can be included in length quadrature. The four signed margins, if proved over entire faces, imply an interior length root by the degree argument of the [multipole certificate](HARMONIC_MEASURE_CERTIFICATE_20261127.md#turning-a-trial-scalar-field-and-four-parameter-edges-into-a-certificate). Marked uniqueness then identifies the physical parameters. The regional calculations meet this all-domain criterion. The signed quadrature on the original closed geometry is still open.

## Reducing the interior certificate to planar enclosures at the center

The affine scalar and Hopf responses eliminate any need to subdivide the two parameter dimensions together with the pants. Write \(v_t=v_*+th\), \(\Phi_t=\Phi_*+t\psi\), \(0\le t\le1\) along a box segment from the center. Let \(A_t=F'_t(v_t)\), \(R_t=\Delta v_t-F_t(v_t)\). Suppose \(H\) uniformly bounds \(|h|\) and \(Q\) bounds \(e^{-v_t}|\psi|\). Differentiating the actual reaction gives \(|\partial_t\log A_t|\le H+Q\), using \(2a/(1+a^2)\le1\) for \(a=|\Phi_t|e^{-v_t}\). A second differentiation of \(F_t(v_t)\) gives
\[
 \frac{|\partial_t^2 R_t|}{A_t}\le H^2+2HQ+2Q^2.
\]
For the first derivatives at the center, write \(P_j=P_+^2,P_-^2\) in order and use the stored response fields \(v_j\). The two normalized quantities needed are
\[
 E_j=\sup_F \frac{|\Delta v_j-A_*v_j+4e^{-v_*}\operatorname{Re}(\bar\Phi_*P_j)|}{A_*}.
\]
All quantities here can be bounded on the planar domain alone. For example \(H\le\sup_F\sum_j\delta_j|v_j|\) and \(Q\le e^H\sup_F e^{-v_*}\sum_j\delta_j|P_j|\), with the specified coordinate radii \(\delta_j\). If \(\eta_*\) bounds \((|R_*|+(2/3)b)/A_*\), Taylor's formula then gives the all-box bound
\[
 \eta\le e^{H+Q}\left[\eta_*+\sum_j\delta_j E_j+\tfrac12e^{H+Q}(H^2+2HQ+2Q^2)\right].
\]
One sufficient set of exact planar targets is \(H\le1/4000\), \(Q\le1/2000\), both \(E_j\le1/50\), and \(\eta_*\le3/25000\). The resulting right side is less than \(1/8000\), by \(e^{H+Q}\le1/(1-H-Q)\) and rational substitution. The sampled values for the first four quantities were about \(2.008\cdot10^{-4},3.662\cdot10^{-4},.002240,.001519\), and the sampled center relative defect was \(7.866\cdot10^{-5}\). This gives a two-dimensional validation target with componentwise slack, while preserving the four-edge requirement for the actual length root.

## Interval verification in the two hole annuli

The [polar replay](../numerics/hole_residual_certificate.py) certifies a relative scalar residual below \(1/8000\) over the full affine parameter box on both closed annuli of radii \([1/4,119/128]\) about the two hole centers. All 256 right half-annulus panels passed. The maximum certified bound was \(0.000122912918\), on panel 246 of the enlarged strip. The first 64 panels \(r\in[1/4,.31]\) had maximum \(0.000113474402\). Conjugation and the half-turn supply all other points of the two annuli.

Write \(z=1+r e^{i\theta}\), \(0\le\theta\le\pi\), and use \(s=(4r)^{-2}\). On the first quadrant use \(t=\tan(\theta/2)\in[0,1]\), so \((\cos\theta,\sin\theta)=((1-t^2)/(1+t^2),2t/(1+t^2))\). Negating the cosine produces the second quadrant. Four \(s\)-strips correspond to \(r\in[1/4,.31], [.31,1/2], [1/2,3/4], [3/4,119/128]\). Within each quadrant, each strip has four equal \(s\)-intervals and eight equal \(t\)-intervals. The physical upper strip is contained in the native pants, with \(\operatorname{Re}z\ge9/128\) and \(|z|<2\).

Each affine rectangular patch is complexified in two Bernstein ellipses of parameter two. With \(E(t)=(1+it)/(1-it)\), the complex variables \(z,w\) are \(1+rE,1+r/E\) in the first quadrant and \(1-r/E,1-rE\) in the second. They replace \(z,\bar z\) in the real expressions. One has \(|\operatorname{Im}t|\le3/64\) and \(|E|,|E^{-1}|\le67/61\). The right chart product \(y_+(z)y_+(w)\) equals \(s\) throughout the ellipses. Group the frozen Chebyshev polynomials first by angular mode and take their exact rational Taylor coefficients at the \(s\)-panel center. Bounding those regrouped coefficients controls the right chart at the cuff. The replay uses the ellipse parameter \(5/3\) for the other chart Chebyshev arguments and a contained \(s\)-chart disk of radius \(1/40\) for their first two derivatives with the larger ellipse of parameter two.

On the first strip one can use \(.248<|r|<.314\) and \(|z|,|w|<1.35\). Here \(|y_0|<.34\) and \(|y_-|<.152\). For the enlarged strips, the rational panel endpoints give \(.248<|r|<.95\) and \(|\operatorname{Im}r|<.05\). The latter follows by integrating the derivative of \(1/(4\sqrt{s})\) in the imaginary direction. Writing \(C=(1-t^2)/(1+t^2)\), the \(t\)-ellipses give \(-.03<\operatorname{Re}C<1.01\) and \(|\operatorname{Im}C|<.095\) from \(C=2/(1+t^2)-1\). In the outer chart, \(zw=(1-r)^2+2r(1\pm C)\). In the opposite hole chart, \((z+1)(w+1)=(2-r)^2+4r(1\pm C)\). These identities give \(|y_0|<.512\), \(|y_-|<.263\), and put both Chebyshev arguments in the ellipse of parameter \(5/3\). The real part of the second product exceeds \(1.04\), so the inverse product has positive real part and modulus at most \(1/1.04\). For the outer chart, \(\operatorname{Re}(zw)>-.0311\) and \(|\operatorname{Im}(zw)|<.377\). The resulting absolute bounds \(1.01\) and \(.13\) for the real and imaginary parts of the Chebyshev arguments fit in the corresponding ellipse. In the double product \((z-1)(w-1)(z+1)(w+1)\), the factors \((z-1)(w-1)=r^2\) and \((z+1)(w+1)\) have positive real parts, allowing the analytic branch that gives the real \(e^v\). The replay checks the corresponding exact coefficient majorants, including the Laplacian and the actual image-pole sums. It uses \(M=20000\) in the first strip and \(M=200000\) in the enlarged strips for the approximate scalar residual, the approximate half-reaction, and the stretch. The latter two may be centered at their nodal-range midpoints with the same \(M\).

At the real tensor cosine nodes the outward interval operations evaluate the center residual and both first-response residuals. An explicit Taylor remainder in the two parameter shifts bounds the entire box at every node. For shifts \(h\) in the scalar and \(\psi\) in the Hopf field, an upper bound for the absolute second-order contribution is
\[
 e^{|h|}\left[(H+K^2/H)|h|^2+(2|\psi|^2+4K|\psi||h|)/H\right],
 \qquad H=e^{v_*},\quad K=|\Phi_*|+|\psi|.
\]
It follows from direct second differentiation on the parameter segment and also applies to the rational approximate multipoles. For a tensor Chebyshev cutoff \(d=43\), the sup tail is at most \(32M/2^{d+1}\) by the analytic coefficient bound on a product of ellipses of parameter two. For \(N+1\) cosine nodes, a trigonometric polynomial of degree \(d\) has \(\|p''\|_\infty\le d^2\|p\|_\infty\) by applying the Bernstein inequality twice. Integrating from a point of maximum absolute value to the nearest angular grid node loses at most \(d^2(\pi/(2N))^2/2\) times the supremum. Applying this on both coordinates gives the norming factor \((1-(22d/(14N))^2/2)^{-2}\). The replay takes \(N=64\) first and refines to \(N=128\) where the bound requires it. [Kroó, Bernstein–Markov type inequalities and discretization of norms, §2.1, equation (4), with the uniform norm limit](https://www.maths.tcd.ie/EMIS/journals/DRNA/pdf/kroo%CC%81_mb_2021.pdf)

The two certified lower bounds on the approximate half-reaction and \(H\) permit the true Hopf correction. On the complex patches the approximate field has \(|\Phi_{\rm app}|<6\). Put \(e_\Phi=2\cdot10^{-10}\). Then \(\big||\Phi|^2-|\Phi_{\rm app}|^2\big|/H\le (12+e_\Phi)e_\Phi/H_{\rm low}\) on the real patch. Add twice this term to the scalar defect and subtract it from the half-reaction lower bound. The flux allowance is \(2\cdot10^{-9}\), verified at the actual cuffs above. The resulting bound is on the exact scalar comparison ratio, including all parameter values and the exact harmonic Hopf fields. It applies to the two displayed annuli. Coverage outside both annuli is addressed in the [central-region check](CENTRAL_RESIDUAL_CERTIFICATE_20261127.md) and [outer-region check](OUTER_RESIDUAL_20261127.md).
