# Propagating a lower stretch bound over both fixed marked bands

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected GPT-6.2 Astra/ultra lead with bounded GPT-6.2 Sol/ultra proofs and independent readings. Separate serving telemetry was unavailable. The [working input receipt](../../research-progress/handoffs/ED07_E53_WORKING_INPUTS.json) identifies the exact source generations. These estimates use the original planar harmonic map, not a comparison diffeomorphism. The physical metric is the oriented Riemannian long-cuff convex trial of width 1/16 on the marked minus Miller–Schupp filling. [Harmonic map and fixed physical coefficients](../../../../papers/master/notes/HARMONIC_MARKING_ENCLOSURE_20261127.md) · [Full framings and inverse](../../../../papers/investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md)

## Transverse derivative at the pause

The upper source hexagon contains the closed corridor
\[
 D=\{(x,y):|x|\le1/4,\quad y\ge0,\quad x^2+y^2\le16\}.
\]
Let \(n_i\) be the unit spacelike outward normal to the central gap of the target hexagon. The height \(u=-\langle U,n_i\rangle\) is nonnegative, vanishes on the bottom, and solves \(\Delta u=Eu\) in the Euclidean coordinates, with \(E=|dU|^2\). On the opposite outer cuff with normal \(m_{jk}\), the Lorentz product of the normals is \(3\sqrt{3/2}\). The orthogonal projection of \(n_i\) into the cuff plane is future timelike of square \(-25/2\). The Lorentzian Cauchy inequality gives \(u\ge5/\sqrt2>1\) along the entire cuff.

At every point of this corridor an open disk of radius \(1/2\) avoids both holes. Its horizontal projection lies inside the central gap. It meets at most the real gap or the outer cuff. In the latter case inversion sends the part outside to radii at least \(32/9\) in the upper half. In either case the lift lies in one hexagon and at most one adjacent copy. A vertex fixed by the reflecting face has distance at most \(\operatorname{arcosh}(29/4)<27/10\) on their union. The flat-domain Bochner inequality and the circular-mean inequality for squared distance in curvature \(-1\) give \(E\le 8(27/10)^2<59\). These are the local mean estimates used in the master, here on the corridor up to the outer edge. [Target coordinates, vertex distances and disk mean calculation](../../../../papers/master/notes/HARMONIC_MARKING_ENCLOSURE_20261127.md) · [Eells–Sampson, §3, (16)](https://math.jhu.edu/~js/Math646/eells-sampson.pdf)

On \(D\) use \(v=\cos(2\pi x)\sinh(10y)/\sinh40\). The bottom and vertical sides have value zero, \(v\le1\) on the outer cuff, and \(\Delta v=(100-4\pi^2)v\) with \(100-4\pi^2>59\). A positive maximum of \(v-u\) would be interior and have strictly positive Laplacian. Thus \(u\ge v\). Their zero bottom traces give
\[
 \partial_y u(x,0)\ge 10\cos(2\pi x)/\sinh40 .
\]
At \(0\) the two source reflections diagonalize the pullback metric in \(x,y\). On the central seam the spacelike unit vector \(n_i\) is tangent to the target hyperboloid, so \(q_{yy}\ge (\partial_yu)^2\). Combining with the master's horizontal lower bound gives
\[
 m=\min\{(21\beta)^2,(10/\sinh40)^2\}>0,\qquad q_L(0)\ge m I,
 \qquad \beta=[2\sqrt2\sinh(21(1-\sqrt5/12))]^{-1}.
\]
The transverse square is approximately \(7.22\cdot10^{-33}\). Lean checks the maximum argument, the one-sided derivative and the quadratic-form comparisons from the scalar marked PDE, energy ceiling and cuff values. Realization of the hyperboloid lift on the planar double uses the scientific input above. [Corridor proof](../../../SmoothPoincare/IntrinsicEntry/HarmonicSeamCorridor.lean)

## From a small central disk to the full footprints

Use the source's complex-linear and antilinear square stretches \(H,L\) in flat coordinates. The least squared singular value is \((\sqrt H-\sqrt L)^2\). Let \(J=H-L>0\), \(T=1-L/H\), and \(F=\log(59/H)\). In the \(R=1/8\) disks used below, \(0<H\le E\le59\). Indeed all disk centers lie in the footprint, and the additional open evaluation disks of radius \(1/2\) about their points avoid the cuffs since \(87/128-1/8>1/2\). Each such disk meets at most one real gap. The previous disk bound applies. The harmonic stretch identities in Euclidean coordinates give \(\Delta\log H=2J\) and \(\Delta T\le4HT\) across zeros of the antilinear stretch by smoothness. In particular
\[
 0<T\le 1,\quad \Delta T\le236T,\qquad F\ge0,\quad -236\le\Delta F\le0 .
\]
Here the two scalar PDEs are used on the same smooth map on the actual disk. [Wolf, §2, with the flat-coordinate conformal factor](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=5) · [Source normalization and extension through zeros](../../../../papers/master/notes/HARMONIC_MARKING_ENCLOSURE_20261127.md)

Take \(s_0=\min(1/32,m/16000)\). On the disk of that radius, contained in the pause footprint, \(\|\partial q_L\|<4000\) implies each coefficient differs by at most \(m/4\) from its value at the origin. Hence \(q_L\ge mI/2\) there, \(J\ge m/2\) and \(T\ge m/118\). If \(T\ge t\) on the disk of radius \(s\), compare it on \(s\le r\le R\) with
\[
             t s^2(r^{-2}-R^{-2}).
\]
The inner value is at most \(t\), the outer value is zero, and \(\Delta r^{-2}=4r^{-4}\) with \(4>236R^2\). The maximum principle gives the comparison. The first expansion supplies \(T\ge t_0=(m/118)15(s_0/R)^2\) on the disk of radius \(R/4\) about the origin. At \(s=R/4\), the bound on radius \(3R/4\) is \((7/144)t\). Thus one step of length at most \(R/2\) preserves an inner disk of radius \(R/4\) with that new floor. [Annular and overlapping disk proof](../../../SmoothPoincare/IntrinsicEntry/HarmonicDiskPropagation.lean)

On each disk let \(h\) be the harmonic extension of the boundary data \(F\). By comparison with zero and the quadratic \(59(R^2-r^2)\), \(0\le F-h\le59(R^2-r^2)\). For \(r\le R/2\) the disk Poisson kernel is at most three times its central value. Since the boundary data are nonnegative,
\(F(x)\le3F(\mathrm{center})+1\). The harmonic extension exists for the smooth boundary data by the disk Dirichlet formula. The formal comparison takes a harmonic extension with those boundary values and uses the kernel formula on that same disk. [Disk estimate](../../../SmoothPoincare/IntrinsicEntry/HarmonicStretchHarnack.lean) · [Harnack's inequality and the Poisson formula, Theorem on disks](https://webspace.maths.qmul.ac.uk/b.khoruzhenko/potential_th_notes%202.pdf)

Every planar point in either band is reached from zero by a shorter arc of one of the two literal unit circles followed by a displacement of length at most \(9/128\). Both segments stay in the footprints, including at different native longitudes. The harmonic metric is a single planar tensor, so sampling along these paths leaves the surgery marking intact. The total length is at most \(\pi+9/128<52/16\). Divide into at most 52 steps of length \(1/16\), repeating the endpoint if necessary. At zero \(H\ge m\). Consequently the following is an explicit **whole-footprint** floor:
\[
  q_L\ge q_* I,\qquad
  q_*=\frac{59}{4}\exp[-3^{52}(\log(59/m)+1)]
        \left[t_0(7/144)^{52}\right]^2>0 .
\]
Indeed \((\sqrt H-\sqrt L)^2\ge HT^2/4\). This encloses both eigenvalues at every actual planar point. The lower constant is extremely small. Even at the pause center the separate upper transverse ratio still precludes a ten-percent relative inverse comparison in the stated part of the switch. [Inverse comparison on the fixed switch](E53_FIXED_WIDTH.md)

## Upper enclosure for each complete signed integral

Take the auxiliary product metric \(g_0=ds^2+d\theta^2+\sigma\) on one full band, \(0\le s\le1/8\), and set \(b=\min(q_*,1/4)\), \(\Lambda=10^{10}/b\). All tensor estimates below use unit \(g_0\)-vectors. In the native map \(Y=(z_1,z_2,\phi,\theta)\), let \(h=d\theta(U)\), \(w=s'p+r v\) with \(v\in T_p S^2\) and \(r=1+s\). The first three entries of \(dY(U)\) are \(\delta w+(c_\theta h,0)\), \(\delta=1/16\). The fourth has coefficient \(\sin^2\phi\ge1/4\). Since \(|w|^2=(s')^2+r^2|v|^2\), the inverse operator bound follows from
\[
 |U|_0^2\le [1+512(1+2500^2)]\big(|\delta w+(c_\theta h,0)|^2+h^2\big).
\]
Thus the outer metric \(B\), the inner metric \(A\) and their convex interpolation have inverse operator norm at most \(\Lambda\) relative to \(g_0\).

For the specified timed letters and switch, write \(H_s(t)=j(t)/(j(t)+j(1-t))\) on \([0,1]\), with \(j=e^{-1/t}\) extended by zero. From \(e^x\ge x^n/n!\), \(|j'|\le2, |j''|\le36\). The denominator exceeds \(1/9\) since at least one term is at least \(e^{-2}\). Direct division gives \(|H_s'|\le342, |H_s''|\le31000\). Each of seven timed circle letters gives \(|c_\theta|\le2500, |c_{\theta\theta}|\le7\cdot10^6\), including the flat pauses. On the switch \(a=H_s(16s-1)\), \(|a'|\le6000, |a''|\le8\cdot10^6\). Differentiating \(Y\), using \(\nabla^2p=-\sigma p\) on the unit sphere, gives \(\|dY\|\le3000,\ \|\nabla^0 dY\|\le10^7\). In the coordinates of \(Y\) the target product has coefficient norm at most 60 and first derivative norm at most 5000 by the original marking enclosure. Hence
\[
 \|A\|,\|B\|,\|g\|\le K=10^9,\qquad
 \|\nabla^0A\|,\|\nabla^0B\|,\|\nabla^0g\|\le P=3\cdot10^{14}.
\]
For example \(\|\nabla^0 B\|\le5000(3000)^3+120(10^7)(3000)<2\cdot10^{14}\). The derivative of \(a\) times \(B-A\) is covered by the larger bound for \(g\). [Physical marks, weighting and complete metric](../../../../papers/master/notes/FIXED_WIDTH_BAND_TEST_20261127.md) · [First-jet cancellation and both end germs](../../../../papers/master/notes/FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md)

Use \(g_0\)-normal coordinates at the evaluation point. The two endpoint tensors on unit vectors have absolute entries at most \(4K^2\) by their signed product sectional curvatures. Each cutoff correction to a metric Hessian has size at most \(2K(8\cdot10^6)+4P(6000)\), so the lowered principal correction is below \(3\cdot10^{19}\). A Christoffel covector of the first kind on two unit vectors has norm at most \(3P/2\); the quadratic difference of the three curvature formulas is bounded by \(4\Lambda(3P/2)^2\). Conversion to the physical \(g\)-orthonormal frame costs at most \(16\Lambda^2\) in each four-slot component, using \(\ell^1\le2\ell^2\) for each four-dimensional vector. This gives the uniform physical bound \(|R_{ijkl}|\le10^{33}\Lambda^3\). The full band volume in \(g_0\) is \(\pi^2\), so in \(g\) it is at most \(K^2\pi^2<10^{19}\). Summation over 256 ordered entries and division by four in the chiral estimate yield, on the **actual physical volume**,
\[
                 0<c=E_+(U_i)=E_-(U_i)\le10^{88}\Lambda^6 .
\]
The exterior and original caps are Weyl-flat, and the band exchange gives the full closed costs \(E_+(M)=E_-(M)=2c\). The positive lower inequality is the source's single-relator and holonomy obstruction. The upper bound includes all signed curvature terms. The master’s later pause-strip estimate gives the lower endpoint \(c>169\pi^2/25\) on this same trial. The E53 continuum certificate retains the floor 133 and gives $c>17689\pi^2/2500$. Together the estimates bound the complete band from both sides and exclude strict entry. The closed first eigenvalue has a separate Rayleigh test. [Formal summation and integrated bounds](../../../SmoothPoincare/IntrinsicEntry/FixedBandCostEnclosure.lean) · [Independent form and metric checks](../../reviews/E53_METRIC_AND_SIGN_READBACK.md)

The geometric realization of the marked harmonic double, its reflected hexagon equations and Bochner bounds, its correspondence with the Lean disk data, and the displayed coordinate bounds on the physical band use the paper derivations. The Lean modules prove the barrier, Poisson and propagation inequalities, stretch-to-metric algebra and integration of the two physical charges with their stated component/volume inputs. Completing the Lean instance on the original four-manifold requires the marked surface and metric charts themselves. The pause-strip calculation resolves the strict cost test on the specified metric. Its pointwise curvature estimate uses correlated first-jet information on the restricted letter phases. [Original fixed-width lower bound](../../../../papers/master/reviews/NATIVE_TRIAL_INTEGRATION_20261127.md) · [Independent rational enclosure](../../../../papers/master/reviews/PAUSE_STRIP_INDEPENDENT_20261127.md)
