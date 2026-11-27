# GEO-E09 · Independent replay of the orbit and height tests

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. [Replay request](../research-progress/handoffs/ISSUE_REPLAYS_20261127.md),
revision 1. GPT-6.2 Sol/ultra was requested. The actual serving model and
effort were unavailable to the reader. [Parent TeX](../../manuscript/cuts_of_subcritical_conformal_classes.tex)
and the two 04 manuscripts were checked against `bc2c1bb`. The working
inputs reviewed were [E02](../research-progress/handoffs/E02_MODEL.md)
(`94e34e1e9d20`), [E05](../research-progress/handoffs/E05_SECTIONS.md)
(`0db069f6655f`), and [E08](../notes/ORBIT_SWEEPOUT_20261127.md)
(`cdfebc60fb72`), identified by SHA-256 prefixes. The reader wrote none
of these three inputs. This is an internal calculation and source replay
in positive Riemannian signature with the parent curvature convention.

The orbit and height calculations check in their stated gauges. The
two qualifications are the crossing regularity of immersed closed
quotient geodesics and the limited symmetry of the Fuchsian exteriors
mentioned at the end of parent Section 6. The height calculation
identifies negative points on three actual regular levels of the marked
calibration, and locates the exact first loss of strict positivity for
the separate closed rotational immersion.

## Equality join and the one-sided problems

The spherical exterior of the equality example has trivial deck group.
A nontrivial deck transformation moves a lift of the center by at most
\(\pi\), which would give injectivity radius at most \(\pi/2\),
incompatible with the strict matching hypothesis. With trivial monodromy,
the compact faces are \(D^2\times S^2\) and \(S^1\times D^3\) with
their product gluing. This join is the rounded boundary of
\(D^2\times D^3\). At the common seam the induced metric is the unit
product, \(B=0\), and both metrics have matching first normal jets.
The raw exterior circle warp \(\cosh x\) gives normal Ricci trace
\(-1\), whereas the cap trace is \(1\). In the distinguished compact
representative the circle warp is constant and the sphere warp
\(\sin r\) supplies normal Ricci trace \(2\). Against the product
Laplacian spectrum \(m^2+j(j+1)\), subtracting the three traces gives
\((\mathrm{index},\mathrm{nullity})=(1,2),(0,0),(3,3)\).
The constant normal graph already gives different second derivatives on
the two sides. These are one-sided spectral counts at a \(C^{1,1}\)
join. The nonzero cap Weyl trace and the zero exterior trace persist
under finite positive smooth-on-each-side conformal factors, so such a
factor alone cannot produce a \(C^2\) exact join.

In a conformal product, the area of a two-sphere orbit over a base curve
weights the base length element by \(4\pi u^3\). Hence the invariant
minimal equation is the geodesic equation of the quotient with
\(d\eta=u^3 dx\) and radius \(b=u^3a\). For angular momentum
\(c\ge0\) at unit speed, the radial equation is
\(\dot\eta^2=1-c^2/b^2\). The Christoffel symbols are locally
Lipschitz at the seam, so the velocity determines the continuation.
In the raw model the radius increases from zero to infinity with
the sole positive stationary radius at the seam. A nonconstant
trajectory has at most one turning point. When \(c=1\), the
nonparallel trajectories stay outside and approach the seam only at
infinite quotient time. A raw meridian reaches the infinite end in
both directions.

In the compact quotient, the cap radius is \(\sin s\), and on the
exterior \(b=\sin^2r\), \(d\eta=\sin^2r\,dr\). For
\(0<c<1\) the one-way cap advance is \(\pi/2\) by great-circle
geometry. On the exterior use
\(-\cos r=\sqrt{1-c}\sin\alpha\) in
\(\int c\,dr/\sqrt{\sin^4r-c^2}\). This gives
\[
  \int_0^{\pi/2}
  \frac{d\alpha}{\sqrt{[1+(c^{-1}-1)\cos^2\alpha]
                              [2+(c^{-1}-1)\cos^2\alpha]}}.
\]
The integral increases strictly from \(0\) to \(\pi/(2\sqrt2)\).
A closed nonparallel orbit has rotation number strictly between
\(1/2\) and \((1+1/\sqrt2)/2\). If that number is \(p/q\) in
lowest terms, the curve winds \(p\) times about the punctured base.
An embedded loop of this orientation would have \(p=1\), impossible
in the open interval. At the exterior fixed circle, the only
three-dimensional invariant tangent space is the normal
\(\mathbb R^3\). A compact embedded lift meeting it must therefore
be meridional. Its two ends are three-balls joined across the two
cap halves, giving a three-sphere fixed by reflection. This
recovers the embedded list in E02.

The rational nonparallel solutions are immersed stationary lifts
with \(C^{2,1}\) crossings in the exact compact model. To see the
loss of \(C^3\) in the smooth topology, let \(y\) denote signed
arclength across the seam and use \(\psi\) as curve parameter.
For the crossing with \(dy/d\psi>0\), write
\(dy/d\psi=F(y)\). The cap gives
\(F=b\sqrt{b^2-c^2}/c\) with \(b=\cos y\), and the
exterior gives \(F=\sqrt{b^2-c^2}/c\) with
\(b=\cos^2 y\). At \(y=0\), both sides have
\(F=\sqrt{1-c^2}/c\) and \(F'=0\), but the exterior-minus-cap
jump in \(F''\) is \(-c/\sqrt{1-c^2}\). The corresponding
jump in \(d^3y/d\psi^3\) is \(-\sqrt{1-c^2}/c\).
This regularity qualification leaves the embedded stationary
classification intact.

The three principal flow laws follow by differentiating \(\cos s\),
\(\sinh x\), and \(\cos\rho\), respectively. The cap reaches
the two-sphere in finite time with radius
\(s\sim\sqrt{2(T-t)}\) and section scalar \(2\).
The raw exterior approaches the seam forward in time.
The compact exterior reaches the circle with
\(\rho\sim2\sqrt{T-t}\) and section scalar
\(2/\sin^2\rho\). These give the shrinking circles and
two-spheres with Euclidean factors in E02. The minimal seam is
stationary. The arrival-time deficit on the cap begins with
\(s^2/2\); the normal Hessian has rank two and is definite on
the normal bundle. An isolated index-two point appears after adding
a small Morse function on the core, from its maximum when the
normal signs are positive or its minimum when they are negative.
The unperturbed positive regular scalars are consistent with this
Morse–Bott behavior. With exterior conformal factor \(u=e^w\)
the same seam has \(H=u^{-1}(3w'+\tanh x)\) and normal Ricci
trace \(-1-3w''(0)\). Therefore the raw and compact exact
counts do not pass to an unspecified smooth entering representative.

## Round and smooth untwisted sweepouts

For the round join \(a=\sin r\), \(b=\cos r\),
\(H=\cot r-2\tan r\). The equation for
\(y=\sin^2 r\) under ordinary mean curvature flow is
\(\dot y=6y-2\). The unique minimal orbit has \(y=1/3\)
and has three principal curvatures \(\sqrt2,-1/\sqrt2,-1/\sqrt2\).
Thus \(J=-\Delta-6\). The spectrum of \(-\Delta\) on this
orbit is \(3m^2+3j(j+1)/2\). The strictly unstable sectors are
\((|m|,j)=(0,0),(1,0),(0,1)\), of total dimension six.
The kernel is solely \((1,1)\), also of dimension six.
The principal-invariant index counts only the constants. Its area is
\(16\pi^2/(3\sqrt3)>2\pi^2\), the sweepout maximum of the
round latitudes through a great meridian. This strict width upper
bound rules out the principal orbit as a first-width carrier
independently of any index assertion. The two principal branches
still collapse in finite time onto the specified different strata.

For a smooth invariant metric of the standard untwisted join type,
choose a normal geodesic section and write the two warp factors as
\(a,b\). On a principal orbit the sphere tangent representation
admits no cross term with the angular circle. Near the two-sphere
\(a/r\) and \(b\) are smooth even radial functions, with
\(a/r\to1\). At the other end the same holds for \(b/(L-r)\)
and \(a\), with \(b/(L-r)\to1\). The orbit equations are
\[
  H'=-|B|^2-\operatorname{Ric}_{rr},\qquad
  (b^2 a')'=-ab^2\operatorname{Ric}_{\psi\psi}^{\rm unit}.
\]
If \(\operatorname{Ric}>0\), the positivity of \(b^2a'\)
inside follows by integrating toward the zero boundary limit at
\(L\). The interval thus has \(a'>0\) as well as strictly
decreasing mean curvature, with the limits \(+\infty\) and
\(-\infty\). The principal flows have travel to the ends in
finite time, by the leading terms \(1/r\) and \(-2/(L-r)\).

The angular height \(f=a(r)\cos(\psi-\psi_0)\) is smooth
at the two-sphere as a Cartesian normal coordinate times
\(a/r\), and its differential there is nonzero. In the
interior \(a'>0\) excludes simultaneous vanishing of its two
derivatives. At \(L\), the Ricci equation gives
\(\operatorname{Ric}_{\psi\psi}^{\rm unit}(L)
=-3a''(L)/a_L\). The two critical points are on this circle.
At the maximum, the unit tangent Hessian entry is
\(-1/a_L\), and the three normal entries are \(a''(L)<0\).
The minimum has the opposite entries. The zero level is a
reflection fixed three-sphere and is totally geodesic. The
entering inequality gives \(R_\Sigma=R-2\operatorname{Ric}(\nu,\nu)>0\)
there. All regular scalar curvatures have a uniform lower bound.
At either extremum the definite Hessian and linear vanishing of
\(|\nabla f|\) give a positive divergence of the two-fold symmetric
sum of the level curvatures, and regular compact regions supply
the remaining bound. The proof gives pointwise positive scalar
curvature at the central and sufficiently near-extremal levels and a
lower bound on all levels. Its flow on the smooth family is the
normalized gradient flow. Zhou's sweepout comparison bounds the first
width by the meridian area \(2|S^2|\int_0^L b^2,dr\).

## Smoothing, averaging and the other cap inputs

For the compact equality join, the scalar formula is
\[
R=-2a''/a-4b''/b-4a'b'/(ab)+2(1-b'^2)/b^2.
\]
Convolving the two warps near the seam keeps their second derivatives
bounded and their first jets uniformly close. The two coefficients of
the second derivatives converge uniformly and change by \(o(1)\)
over a convolution interval. Consequently the smoothed scalar is
the convolution of the piecewise scalar up to \(o(1)\), uniformly
near the seam. Away from that interval a cutoff can be used in regions
of smooth convergence. The cap and compact exterior scalar values
are \(4\) and \(6\), so the interpolation has positive scalar
for sufficiently small widths. Bounded curvature and agreement in the
limit off the seam give convergence of the chiral energies. The cap has
volume \(8\pi^2\) and Weyl eigenvalues \(2/3,-1/3,-1/3\) in
each chirality, so the common limit is \(16\pi^2/3\), strictly
below \(8\pi^2\). The compact exterior is conformally flat.

For the invariant-gauge step, apply Chang–Gursky–Yang to the smooth
entering class. In the parent normalization, the Schouten tensor of
\(v^{-2}h\) multiplied by \(v\) is
\(K(v)=vA_h+\nabla^2 v-|dv|^2h/(2v)\).
For isometric pullbacks the cone \(\operatorname{tr}K>|K|\)
is invariant and convex. Its trace-minus-norm deficit at the average
is at least the average of the positive deficits. Weighted
Cauchy–Schwarz gives
\(|d\bar v|^2/\bar v\le\overline{|dv|^2/v}\).
Thus the tensor at the averaged factor adds a nonnegative multiple of
\(h\) to the average tensor, preserving the strict deficit.
This yields a smooth invariant entering representative of the
smoothed class. Both steps use the strict energy gap and the compact
smooth reference representative.

For every smooth twisted or untwisted cap of the stated form, the slice
metric has determinant density \(a\sin\vartheta\) and locally
untwists at fixed radius \(s\). Hence \(H=a'/a\) and
\(R_\Sigma=2\). The regular core gives \(a=s+O(s^3)\) and an
inward finite-time collapse from small \(s\). For
\(\theta=\pi/3,\pi/4,\pi/5\) the specified derivative at the
attached end is negative, so a first radial stationary slice exists
when the full cap profile is smooth. The flat trial exterior has
\(ds=dr/r\), \(a=\ell/(2\pi r)\), and therefore
\(a'=-a\) in its near-face gauge. The same cap argument covers
the listed two-twist trefoil and figure-eight and the listed
three-, four-, and five-twist trefoil framings, with the smoothness
condition explicit. The global angular construction needs the
untwisted join action. The Fuchsian exteriors named at the very end
of Section 6 likewise supply the local hemisphere-cap test, while
sphere-factor rotations alone give no global second collapsed orbit
or angular sweepout. The tabulated trial energies are floating-point
values, and no closed entering claim for these numerical profiles is
needed here.

## Physical height levels and markings

The physical section in a hyperplane with normal \(u\) has second
form equal to the immersion's second form restricted to the level
tangent space and divided by the length of the projection of the
immersion normal to the hyperplane. The squared length is
\(D=|\nabla h|^2\). For the two-sided local sign at an index-two
critical point, choose one positive and one negative eigenline for the
metric Hessian \(Q\). A suitable mixed normal \(n\) satisfies
\(\langle Q^{-1}n,n\rangle=0\); its perpendicular line in
that plane has zero Hessian and the other two restricted eigenvalues
have opposite signs. Hence \(\sigma_2\) is strictly negative.
Normals close to \(n\) give either sign of the quadratic height
difference on rays in the directions \(Q^{-1}n\). The negative
coefficient persists and the regular section scalar tends to
\(-\infty\) on both sides. This uses the actual induced Hessian
endomorphism, whose inertia agrees with the coordinate Hessian.

The marked calibration has critical values
\(-2a_2^3<-2a_1^3<2a_1^3<2a_2^3\) with indices
\(2,2,3,3\). For the supplied explicit angular charts let
\(\Lambda=\lambda/(1+b|w|^2)\) and
\(X=rL(T)\Theta(w)\) on a level, where
\(T=\ell+6a^2v\). At \(w=0,v=a\) the true angular
and radial Hessian scales are \(r^2L^2\lambda^2\) and
\(r^2L_v^2\). At \(w=se_i,v=a\) the calculation can
be checked by implicit differentiation of \(Q+C_a=\ell\).
The first derivatives of \(w_i\) vanish and its transverse
pure second derivatives are \(-q_j/(q_i s)\) and
\(-3a/(q_i s)\), using \(q=(-1,-1,1)\).
Projecting the derivatives of \(X\) onto the unit angular
normal adds the angular Christoffel term
\(2bs/(1+bs^2)\) and leaves the mixed terms zero. Dividing
by the true metric coefficients yields the E05 scalar values
\[
  \frac{R_{\rm incoming}}{2K^2}=\mu^2-1+2m\mu,
  \qquad
  \frac{R_{\rm outgoing}}{2K^2}
      =(1+\mu)(1+\mu-2m),
\]
with its stated positive \(K\), \(0\le\mu<1/2\),
and \(m=L^4\Lambda^2/(12a^3(h_*+r^2T)^2)\).
For the incoming witnesses the bound follows from
\(s^2\le 2a^3\) and \(2m\mu\le1/12\).
For the outgoing ones \(m\ge R_0^2/(768a^3)>1\).
The witnesses lie in the polynomial core. In particular each of
\(-d_0,0,d_0\) is an actual regular level that has strict
negative points. The first loss in this calibration may occur
earlier in the cutoff among \((-T_0,-d_0]\).

The marked diagram uses exact level data. At \(-d_0\), for
each birth parameter, \(C_a(v)+d_0\) has a simple zero in
\((-3a,-2a)\), stays positive up to \(v=a\), and gives
the spanning disk with boundary the attaching circle.
The \(y\)-direction is tangent to the level and normal to that
disk along the boundary; it is one of the stated handle framing
directions. Thus the two disjoint disks in the two boxes verify
the split zero-framed unlink in the actual incoming three-sphere.
At \(0\) the indicated belt and attaching sphere meet only at
the common origin in each box, with tangent \(y\)-line and
\(x\)-plane. The equations \(v'=3(a^2-v^2)\) for the
descending flow on the belt and its negative for the ascending flow
on the attaching sphere give the correct endpoint critical points.
The disjoint boxes keep the two pairs separate. These markings
support the stated level identification.

For the sharpness rotational immersion of 04, the tangent meridional
and angular derivatives of the height \(r(t)\theta_4\) have
squared lengths \(M^2=d^2\cos^2t\) and \(W^2=1-d^2\), where
\(d=\ell/r(t)\). The immersion curvatures are
\(p=1/\rho\) and \(q=\sin t/r(t)\) with \(q\) of
multiplicity three. The restriction has two eigenvalues \(q\)
and one \((pW^2+qM^2)/(W^2+M^2)\). This verifies
\[
R_\Sigma=\frac{2q}{(W^2+M^2)^2}
          \big[(q+2p)W^2+3qM^2\big].
\]
It is strictly positive when \(C<|\ell|<C+1\),
nonnegative with zeros at \(|\ell|=C\), and strictly
negative somewhere for \(|\ell|<C\). In the last case take
\(t\downarrow\pi\) from above, where \(q\to0^-\),
\(p=1\), and \(W^2\to1-\ell^2/C^2>0\). Thus the
first loss of strict positivity occurs at the regular levels
\(\ell=\pm C\). The intermediate singular heights
\(|\ell|=C-1\) still admit this witness on their regular parts.
The axial height has only round spheres as regular components.
For the ideal bridge, \(p=-q/3\), \(q>0\) gives strict section
positivity for every direction. On a flattened arm the transverse
central section has scalar \(2(ra^2)'/r^2\), negative
somewhere by the two endpoint values of \(ra^2\).

## Source passages and disposition

- Chang, Gursky and Yang, *An equation of Monge-Ampère type in conformal
  geometry, and four-manifolds of positive Ricci curvature*,
  [arXiv:math/0409583v1](https://arxiv.org/abs/math/0409583v1), Theorem
  A and its introduction, checked for compactness, positive Yamabe
  constant, positive Schouten integral, and the factor of two in
  their Schouten convention. The averaging argument is independent.
- Zhou, *Min-max minimal hypersurface in positive Ricci curvature*,
  [arXiv:1210.2112v2](https://arxiv.org/abs/1210.2112v2), Theorem 1.1,
  Remark 1.2 and the width comparison in the proof, checked for the
  closed connected orientable ambient manifold, dimensions \(2\le n\le6\),
  positive Ricci and the integral fundamental class. In the extension
  [arXiv:1504.00966](https://arxiv.org/abs/1504.00966), checked
  Proposition 6.1 and (6.2)–(6.3) for the weighted
  area comparison. These passages supply the meridian upper bound.
- Parent §§2, 6.2 and 7.1 and the named 04 calibration and rotational
  passages were read directly. The replay checks the geometric
  consequences of the supplied cap metrics and height charts. It
  does not constitute an audit of the parent cap-energy functional
  or the numerical optimizations.

Carry forward the angular sweepout for the specified smooth untwisted
entering metrics and the separate negative physical section examples.
The result for principal-orbit flows applies to that family of flows.
The general entering-gauge first-width positivity and global sweepout
questions remain open.
