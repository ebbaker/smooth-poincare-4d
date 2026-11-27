# Numerical fit of the two native Hopf cuff lengths

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance for master B02. The requested dispatch was GPT-6.2 Sol/ultra. Actual serving model and effort were unavailable. Intake HEAD `48f36794f9b1`. This diagnostic uses the [specified long-cuff geometry][trial], the [native scalar equation][native] at blob `e11efd64a951` and the [unnormalized Hopf basis][basis] at note blob `93a53a41156b` and executable blob `2f2a755b2751`. It concerns the unchanged width-\(1/16\) oriented Riemannian minus Miller–Schupp trial. The solver was replayed in Python 3.10 with NumPy 1.25.1.

The finest of three floating-point meshes gives \(\alpha\approx-0.00113017\), \(\beta\approx-0.11988074\) in \(\Phi=\alpha P_+^2+\beta P_-^2\). Its quarter-domain lengths are approximately \(1.146215834781\) and \(2.292431669561\), with discrete length residual below \(2\times10^{-14}\). These finite-element parameters are diagnostics. The independent continuum enclosure below uses the smooth comparator and its three regional residual certificates. A separate chiral lower bound excludes strict entry for this metric. [Native band integration][budget]

## Geometry and discretization

Use the quarter \(F_+=F\cap\{x\ge0,y\ge0\}\), parameterized by \(z=1+r e^{i\theta}\), \(0\le\theta\le\pi\), \(1/4\le r\le R(\theta)\). The outer radial endpoint is \(-\cos\theta+\sqrt{15+\cos^2\theta}\) up to \(\theta_*=\arg(-1+4i)\) and \(-1/\cos\theta\) after that angle. The mesh splits at \(\theta_*\) and uses a logarithmic radial parameter. It places a node at \(z=2\) by also splitting the radial parameter at \(\log 4/\log 12\). First-degree triangular finite elements use the actual planar positions of these nodes and straighten the intervening edges. The stiffness matrix uses planar area, and the nonlinear source has lumped nodal masses \(m_i\). The straight triangles approximate the domain only. The flux uses the literal circular arc lengths with equal endpoint weights for each arc. The two axes have homogeneous Neumann data by reflection. With the outer flux \(-1/2\) and right-hole flux \(+8\), the total quarter-domain flux is \(-\pi+2\pi=\pi\).

For each sampled coefficient pair \(p=(\alpha,\beta)\), solve the discrete system
\[
 K u+2\operatorname{diag}(m_i)\big(e^u-|\Phi|^2e^{-u}\big)-g=0.
\]
The matrix \(K\) is the stiffness matrix and \(g\) the Neumann load. Newton iteration uses the positive diagonal reaction \(2m_i(e^{u_i}+|\Phi_i|^2e^{-u_i})\), backtracking, and Jacobi-preconditioned conjugate gradients. The differentiated length system uses the same linear matrix for the two derivatives \(\partial_p u\), with right sides \(4m_i e^{-u_i}\operatorname{Re}(\bar\Phi_i\partial_p\Phi_i)\). The two-length root is then fitted by a second Newton iteration, keeping both parameters inside the certified initial rectangle. The basis uses the returned parity-specific multipoles as supplied, without changing their means or normalization.

The cut arc on the outer cuff has target length \(L/4\). The cut arc on the right cuff has target length \(L/2\). The computation applies four-point Gauss–Legendre quadrature on each literal circular arc segment with linear interpolation of \(u\) in its angle. If \(t\) is the planar complex unit tangent, its length integrand is \(|e^{u/2}+\Phi t^2 e^{-u/2}|\), the positive square root of \(q_L(t,t)\).

## Results

The number of cells is given in angular by radial order. The weak residual below is the maximum absolute residual of the discrete scalar equation divided by its nodal mass, evaluated after the fit.

| Cells | \(\alpha\) | \(\beta\) | Max. length residual | Max. scaled weak residual | Min. nodal \(J\) |
| --- | ---: | ---: | ---: | ---: | ---: |
| \(28\times24\) | \(-0.000910398866\) | \(-0.120434464461\) | \(8.9\times10^{-16}\) | \(4.1\times10^{-12}\) | \(0.019939\) |
| \(64\times56\) | \(-0.001096828599\) | \(-0.119965690645\) | \(1.6\times10^{-13}\) | \(3.4\times10^{-11}\) | \(0.020669\) |
| \(128\times112\) | \(-0.001130166400\) | \(-0.119880744447\) | \(1.4\times10^{-14}\) | \(1.1\times10^{-10}\) | \(0.021034\) |

| Cells | \(q_{xx}(0),q_{yy}(0)\) | \(q_{xx}(2),q_{yy}(2)\) | \(\partial_x q_{xx}(2),\partial_x q_{yy}(2)\) |
| --- | --- | --- | --- |
| \(28\times24\) | \(0.131415,\ 1.922177\) | \(0.079310,\ 0.367999\) | \(-0.131323,\ -0.762030\) |
| \(64\times56\) | \(0.134450,\ 1.918242\) | \(0.079133,\ 0.368139\) | \(-0.121216,\ -0.751896\) |
| \(128\times112\) | \(0.135112,\ 1.917641\) | \(0.079085,\ 0.368145\) | \(-0.117469,\ -0.748139\) |

Here \(0,2\) mean the real planar points. Their off-diagonal entries vanish by conjugation. At 0 every first derivative of the exact metric vanishes by half-turn symmetry. The derivative values at 2 use the finite-element derivative with the evaluator's choice of adjacent triangle. The parameter changes between the two finer meshes are \(3.34\times10^{-5}\) and \(8.49\times10^{-5}\), respectively. They substantially exceed the discrete length residual. The gradient has jumps across the triangle edges. The changes between meshes, the discrete residuals and the positive nodal Jacobians give numerical diagnostics. A continuum certificate still needs discretization error control and a verified length root. The Neumann sign, original closed sign and exact chiral cost have no new certification from this fit.

## Replay and evaluation

Run the [NumPy solver][solver] from the repository root, with the mesh data written to a temporary file:

```sh
OPENBLAS_NUM_THREADS=1 python3 papers/master/numerics/hopf_cuff_fit.py \
    --angular 28 --radial 24 --output /tmp/hopf_fit_28.npz
OPENBLAS_NUM_THREADS=1 python3 papers/master/numerics/hopf_cuff_fit.py \
    --angular 64 --radial 56 --initial -.0009104 -.12043446 \
    --output /tmp/hopf_fit_64.npz
OPENBLAS_NUM_THREADS=1 python3 papers/master/numerics/hopf_cuff_fit.py \
    --angular 128 --radial 112 --initial -.001096828599 -.119965690645 \
    --output /tmp/hopf_fit_128.npz
```

The evaluator `evaluate_metric(path,x,y)` returns broadcastable \(q_{ij}\) and \(\partial_a q_{ij}\) with trailing shapes \((2,2)\) and \((2,2,2)\) in the original planar coordinate. It interpolates \(u\) on the quarter mesh, reads its piecewise constant gradient, and reflects both to the native point. It evaluates the rational Hopf basis and its derivative directly there. Centered finite differences with step \(10^{-6}\) at \(0.234+0.331i\), \(1.334+0.957i\) and \(-1.436-0.938i\) agreed within \(2\times10^{-8}\). A sample of \(100{,}000\) projected footprint points gave finite outputs and a minimum sampled metric eigenvalue of \(0.0718\) on the \(64\times56\) fit. For that check use `default_rng(420)` and draw all angles uniformly in \([0,2\pi]\), then all radial offsets uniformly in \([-9/128,9/128]\), then all centers equally from \(\{-1,1\}\). A sampling check does not bound a continuum error.

## Exact boundary flux of the smooth comparator

An independent exact check uses the [frozen smooth degree-18 comparator][frozen] at blob `52799ce89460` and both of its coefficient-response columns. Let \(v_*\) be that comparator, including its logarithmic base, and \(h_\alpha,h_\beta\) its two response fields. For the affine family
\[
v_p=v_*+(p_\alpha-p_{\alpha,*})h_\alpha
       +(p_\beta-p_{\beta,*})h_\beta
\]
the outward flux of \(v_*\) is compared with \(-1/2\) on the outer circle and \(8\) on the holes. The outward flux of each response is compared with zero. All bounds below are supremum bounds on the entire indicated circles.

| Cuff | Base flux error | \(\lvert\partial_\nu h_\alpha\rvert\) | \(\lvert\partial_\nu h_\beta\rvert\) |
| --- | ---: | ---: | ---: |
| Outer | \(9.0\times10^{-10}\) | \(1.8\times10^{-8}\) | \(1.7\times10^{-8}\) |
| Each hole | \(1.8\times10^{-9}\) | \(3.3\times10^{-8}\) | \(3.1\times10^{-8}\) |

Consequently the full boundary flux error is at most \(1.80221\times10^{-9}\) throughout the box of radii \(2\times10^{-5},5\times10^{-5}\) about the frozen parameter pair. The dyadic numbers in the comparator and response columns are used exactly.

Write \(z=c+r e^{i\vartheta}\), \(t=\cos\vartheta\), and \(D=(c-a)^2+r^2+2(c-a)rt\) for a real pole \(a\). For \(S_k=\operatorname{Re}((z-a)^k)\), use \(S_0=1\), \(S_1=c-a+rt\) and \(S_{k+1}=2S_1S_k-DS_{k-1}\). For a hole mode \(y=(1/4)/(z-a)\), the angular factor is \(4^{-k}S_k/D^k\) and the argument of its radial Chebyshev factor is \((1/8-D)/D\). Differentiate both recurrences in \(r\) before setting the radius to the physical cuff value. The outer derivative has sign \(+\) and each hole derivative has sign \(-\). The logarithmic base contributes the derivative of \(|z|^2/64-(3/4)\log(D_+D_-)\), where \(D_\pm\) use poles \(\pm1\). Clearing denominators gives a rational function \(P(t)/Q(t)\), with \(Q>0\) on \([-1,1]\). The half-turn identifies the two hole checks.

For each displayed bound \(b\), the [exact replay][flux] converts \(bQ\pm P\) to Bernstein coefficients and proves nonnegativity on \([-1,1]\). Each certificate used either the original interval or one dyadic split into halves. The polynomial degrees used are \(98\) on the outer circle and \(78\) on a hole. This checks the continuous Neumann boundary residual. The interior scalar equation and cuff-length root require their own enclosures.

## Independent reading of the central interior residual

The [central certificate][central] was independently read and replayed with executable blob `f6e0b1e76d07`. It gives \(|R|<0.000142596\) and \(H>0.76118\) on \(|x|,|y|\le9/128\), uniformly for the same affine parameter box as the cuff calculation. Including the independent cuff allowance, the weighted scalar comparison quantity is less than \(0.000093669\) on that square.

The ellipse with parameter three in each real coordinate satisfies \(|z|,|w|\le15/64\). The multipole approximation bounds the true basis on \(|z|\le1/4\) using the harmonic error bound and the first Fourier coefficient on circles of radii approaching \(1/2\). The possible tangency with a source cuff occurs only at the limiting radius. The real symmetry of the true basis gives the analytic continuation \(\Phi(z)\Phi(w)\) of \(|\Phi|^2\). The Chebyshev bounds on the larger disks leave room for two Cauchy derivatives and the stated complex supremum. Two contour coefficient bounds give the tensor tail. The norming argument uses that the derivative of the trigonometric polynomial vanishes at the point of its absolute maximum, also at an endpoint, and applies the second-derivative bound of degree \(24\) in each variable separately.

The grid uses exact dyadic inputs or binary64 outward intervals. The checked square-root brackets and the exponential series give the needed enclosures without relying on transcendental library rounding. The latter series on \([-1/2,1/2]\) has tail at most \(2(1/2)^{23}/23!<2^{-90}\) before the four squarings. In the parameter step, the affine part of \(\Delta v\) contributes no second derivative. The Taylor remainder for the reaction includes both mixed \(w\psi\) and squared \(\psi\) terms, where \(w=\delta v\) and \(\psi=\delta\Phi\), and the reported bounds are uniform for both signed parameter directions and their combinations.

The square covers the projected pause disks. Applying the global scalar comparison would additionally require the residual bound on the rest of the pants. The local replay leaves the continuum cuff-length root and the Neumann sign unresolved.

## Independent reading of the cuff-length edge bounds

The [cuff-length executable][length] at blob `4bcf689ae647` was replayed for the frozen family and the same two parameter radii. The certified positive lower margins on the preconditioned true cuff-length components are \(8.03919\times10^{-6}\) on the two signed \(\alpha\) edges and \(1.83774\times10^{-5}\) on the two signed \(\beta\) edges, **conditional on** \(\sup_{\partial F}|u_p-v_p|\le126\times10^{-6}\) for every parameter in the box. The opposite faces use opposite signs.

The replay uses \(t=\tan(\vartheta/2)\) on each physical quadrant, so \(d\ell=2r\,dt/(1+t^2)\). On each complex \(t\)-disk of radius \(1/128\), the denominator has modulus at least \((127/128)^2\). The normalized closed Newton–Cotes rule integrates degree \(16\) exactly. The remaining analytic Taylor terms are bounded by the Cauchy geometric tail with ratio \(64/\text{panels}\) and multiplied by one plus the sum of absolute quadrature weights. The rational-to-binary enclosures, decimal neighbors of correctly rounded logarithms and exponentials, and outward binary steps preserve the intervals. An exact rational square comparison checked the bracket of \(\sqrt{24}\) used in the target length. The rational preconditioner has determinant \(9106271/5000000000>0\). [Python decimal elementary functions][decimal]

The true rim potentials are constant on each cuff. For its planar unit tangent \(\tau\), both \(P_\epsilon\tau\) are purely imaginary. Both Hopf parameters are negative throughout the chosen box, hence the true \(\Phi_p\tau^2\) is real and nonnegative. Changing the scalar field from \(v_p\) to \(u_p\) therefore changes the literal length by at most the certified comparator length times \(\exp(\sup|u_p-v_p|/2)-1\). The inherited \(10^{-10}\) cuff error of the Hopf coefficient enters the comparator integral separately. The whole-pants comparison used for the degree argument follows below.

## Independent reading of the whole-pants comparison and native anchors

The three regional calculations were read against the same exact coefficient and response file. Reflect to \(x,y\ge0\). The [outer replay][outer] covers \(2\le |z|\le4\). Within \(|z|\le2\), the [Cartesian core][central] covers \(|z-1|\ge119/128\). The rest of the pants in this quarter has \(1/4\le|z-1|\le119/128\). The [hole replay][holes] covers precisely this range, using \(s=(4|z-1|)^{-2}\in[(32/119)^2,1]\) and the two closed signs of angular cosine. These ranges share their endpoints. The intermediate rectangle and footprint rectangles are additional checks outside this three-region coverage argument. The owner replays gave the following upper bounds, each rounded upward.

| Region | Checked tiles | Weighted residual upper bound | Executable blob at reading |
| --- | ---: | ---: | --- |
| Outer annulus | 64 | \(0.00008914\) | `4c0f5e640150` |
| Core | 140 | \(0.000122376376\) | `3db13c747e27` |
| Hole strips | 256 | \(0.000122912919\) | `aa3473b14fbf` |

The analytic tile derivatives are computed in the native flat metric. For \(y=y(z)\) holomorphic and \(s=|y|^2\), the tested mode \(\operatorname{Re}(y^k)A(s)\) has Laplacian \(4|y'(z)|^2\operatorname{Re}(y^k)(sA''+(k+1)A')\). In the own-hole chart \(|y'|^2=16s^2\). The polar sampling variables only select where to evaluate this expression. The coefficient intervals and Taylor remainders bound both responses throughout each parameter box, with the Bernstein norming applied to the resulting full-box sample bounds. The outer and core samples enclose the actual harmonic basis directly. The holes instead use the bounded rational multipoles in the analytic continuation. With the independently bounded \(|\Phi-\Phi_{\rm app}|\le2\times10^{-10}\) and \(|\Phi_{\rm app}|<6\), the hole replay adds twice the error in \(|\Phi|^2/H\) to the residual numerator and subtracts that error from the lower half-reaction. The whole-pants residual bound consequently applies to the true basis.

Taking the weaker uniform tolerance \(\eta\le0.00019\) and \(b\le2\times10^{-9}\), the [Neumann comparison][scalar] yields \(S=\sup_F|u_p-v_p|\le-\log(1-\eta)+5b<0.000193\) uniformly in the box. This comparison uses the actual outward normal: its barrier has \(\Delta B=2/3\), \(\partial_\nu B>1\) on all three cuffs and \(0<B<5\). The positive-part integration proves the bound on the entire smooth pants. With \(x=0.000193/2\), the exact rational bound \(e^x-1\le x/(1-x)\) verifies the length transfer even at this weaker \(S\). Subtract \(4.6x/(1-x)\) times the respective preconditioner row norms \(0.04123,0.10903\) from the certified comparator face floors \(1.9988\times10^{-5},4.9975\times10^{-5}\). The true signed floors still exceed \(1.68423\times10^{-6},1.57191\times10^{-6}\). The boundary straight-line homotopy to coordinate translation now has degree \(+1\) and gives the exact length root in the interior of the box. The labeled right-angled hexagon comparison and harmonic uniqueness identify this root with \(q_L\) in the original marking.

On the radius-\(1/8\) disks centered on the physical footprints the actual reaction satisfies \(F'_p(u_p)<43\) by the target distance and energy estimate. The scalar difference therefore satisfies \(|\Delta(u_p-v_p)|\le43(S+\eta)/(1-S)\). The disk Poisson and Green derivative bounds give \(|\nabla(u_p-v_p)|<0.0034\) when using the weaker \(\eta\le0.00019\), \(S<0.000193\). The three regional replays in fact give \(\eta<1/8000\), so \(\eta/(1-\eta)+5b<0.000126\) and the same derivative calculation gives \(|\nabla(u_p-v_p)|<0.0022\). The [exact native-jet arithmetic][jets] was independently replayed over the full parameter box at both tolerances, with blobs `45046c193b92` and `6bd93e5f07ad` respectively.

| Quantity | Weaker bound at \(0\) | Stronger bound at \(0\) | Weaker bound at \(2\) | Stronger bound at \(2\) |
| --- | ---: | ---: | ---: | ---: |
| \(q_{xx}\) | \([0.13438,0.13633]\) | \([0.13444,0.13626]\) | \([0.07880,0.07934]\) | \([0.07881,0.07932]\) |
| \(q_{yy}\) | \([1.91647,1.91843]\) | \([1.91654,1.91836]\) | \([0.36787,0.36842]\) | \([0.36789,0.36840]\) |
| \(\partial_xq_{xx}\) | \(0\) | \(0\) | \([-0.11500,-0.11236]\) | \([-0.11477,-0.11259]\) |
| \(\partial_xq_{yy}\) | \(0\) | \(0\) | \([-0.74567,-0.74303]\) | \([-0.74544,-0.74326]\) |
| \(\partial_yq_{xy}\) | \(0\) | \(0\) | \([-0.31559,-0.31507]\) | \([-0.31559,-0.31507]\) |

At each anchor conjugation gives \(q_{xy}=\partial_xq_{xy}=\partial_yq_{xx}=\partial_yq_{yy}=0\). The half-turn gives every first derivative at zero. The nonzero off-diagonal derivative at \(2\) uses \(\partial_yq_{xy}=-2\Phi'(2)\) by holomorphicity. These measurements and the bandwise scalar comparison are on the actual marked metric. The regional residual certificates do not themselves evaluate the full Rayleigh numerator.

[central]: CENTRAL_RESIDUAL_CERTIFICATE_20261127.md
[length]: ../numerics/cuff_length_certificate.py
[decimal]: https://docs.python.org/3.10/library/decimal.html#decimal.Decimal.exp
[outer]: OUTER_RESIDUAL_20261127.md
[holes]: ../numerics/hole_residual_certificate.py
[scalar]: SCALAR_FIT_RESIDUAL_20261127.md
[jets]: ../numerics/native_jet_intervals.py
[frozen]: ../numerics/whole_pants_residual_d18.json
[flux]: ../numerics/cuff_flux_certificate.py
[trial]: ../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md
[native]: NATIVE_HARMONIC_DATA_20261127.md
[basis]: HARMONIC_MEASURE_CERTIFICATE_20261127.md
[budget]: ../reviews/NATIVE_TRIAL_INTEGRATION_20261127.md
[solver]: ../numerics/hopf_cuff_fit.py
