# GEO-E05 · Intrinsic curvature of the physical height sections

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
The [bounded E request](ISSUE_20261127.md) specified GPT-6.2 Sol/ultra. Actual
serving model and effort were unavailable. Inputs at bc2c1bb are the
[marked-height manuscript, § A calibration on a single embedded sphere](../../../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)
(SHA-256 9681e2deb71434b7e6036ce8d3db9b6a10e4f6d530406948e30bc8b74b1a15d9),
the [immersion manuscript, sharpness example for \(J\) and § A rotational test for global gluing budgets](../../../../04_hypersurface_immersions/manuscript/chiral_energy_of_hypersurface_immersions.tex)
(SHA-256 13ea5742d3fa0d01ff14e77da000959db4c364c9e0b816f6ea580dd767338ac0),
and the [cut manuscript, §7.1](../../../manuscript/cuts_of_subcritical_conformal_classes.tex)
(SHA-256 ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0).
The results below are analytic checks on smooth Riemannian metrics.
Section metrics are induced by physical Euclidean hyperplanes. The scalar
convention gives a round three-sphere of radius \(R\) scalar curvature \(6/R^2\).
The second fundamental form has trace equal to the divergence of its unit normal.
Reversing the section normal reverses the principal curvatures together.

## 1. Both sides of the index-two heights

Let \(F:M^4\to\mathbb R^5\) be a smooth immersion, \(u\) an ambient unit vector,
and \(h=\langle F,u\rangle\). At a regular point of the height, write \(N\) for
the unit normal to \(F\) and \(D=|\nabla h|^2=1-\langle N,u\rangle^2\). The section
normal in the hyperplane is \((N-\langle N,u\rangle u)/\sqrt D\). Ambient
derivatives along the section have zero \(u\)-component, so the section's
second fundamental form is \(A|_{\ker dh}/\sqrt D\) in the same choice of sign.
The Euclidean Gauss equation gives \(R_\Sigma=2\sigma_2(A|_{\ker dh})/D\).

At an index-two critical point \(p\), use the actual induced metric to regard
the Hessian \(Q\) of \(h\) as an endomorphism. Choose a negative eigenline of
eigenvalue \(-\beta\) and a positive eigenline of eigenvalue \(\alpha\), and
form a unit vector \(n_0\) in their plane with squared components
\(\beta/(\alpha+\beta)\) and \(\alpha/(\alpha+\beta)\). Then
\(\langle Q^{-1}n_0,n_0\rangle=0\). The line in their plane orthogonal to
\(n_0\) has zero restricted Hessian. The other two eigenlines have opposite
signs, so \(\sigma_2(Q|_{n_0^\perp})<0\). Perturb \(n_0\) within this plane to
\(n_\pm\) with values of \(\langle Q^{-1}n_\pm,n_\pm\rangle\) of opposite sign.
The strict restricted sign persists. Along \(x=tQ^{-1}n_\pm\) in normal
coordinates, with \(t>0\) small, the height difference is
\(\frac12t^2\langle Q^{-1}n_\pm,n_\pm\rangle+O(t^3)\), monotone on each ray,
and the normal tends to \(n_\pm\). The Riemannian Gauss formula has a bounded
ambient term and leading term \(2t^{-2}\sigma_2(Q|_{n_\pm^\perp})\).
Thus every sufficiently close regular level on either side has a point of
negative scalar curvature, with witnesses tending to \(-\infty\) in scalar
curvature as the critical level is approached. This argument also applies to
any smooth Riemannian ambient metric on \(M\) and uses the actual Hessian
eigenvectors for that metric.

In the calibration, read the physical vertical height \(h_*+r^2\ell\) upward.
The normalized critical values in the modified boxes, in order, are
\(-2a_2^3,-2a_1^3,2a_1^3,2a_2^3\), with indices \(2,2,3,3\). Therefore the
topmost index-two value is \(-2a_1^3\). The two-sided finding applies at both
index-two values for every angular chart allowed by the manuscript.

## 2. Named regular levels in an explicit calibration

The manuscript leaves the angular maps and cutoff free. For an explicit
permitted specialization fix \(d=1/10\), \(T_0=1\), \(R_0^2=6\),
\(\lambda=1/(2R_0)\), and \(0<r\le 1/(8R_0)\). Use
\(\Theta_1(w)=(\lambda w,1-b|w|^2)/(1+b|w|^2)\) and \(\Theta_2=-\Theta_1\),
where \(b=\lambda^2/4\), on the angular coordinate cubes
\(w\in(-3d,3d)^3\). Their images are disjoint and their spherical metric is
\(\Lambda(w)^2dw^2\) with \(\Lambda(w)=\lambda/(1+b|w|^2)\). One explicit
cutoff is

\[
 \chi(w,v)=\frac{\eta(4d^2-j)}{\eta(4d^2-j)+\eta(j-d^2)},\qquad
 j=|w|^2+v^2,\qquad
 \eta(s)=\begin{cases}e^{-1/s},&s>0,\\0,&s\le 0.\end{cases}
\]

Take \(a_2=1.1a_1\le d/10\), with \(a_1>0\) small enough that
\((9+12d\|D\chi\|_\infty)a_2^2<m_d/2\), where \(m_d\) is the positive minimum
of \(|D(Q(w)+v^3)|\) on \(d\le\sqrt j\le2d\), and \(Q(w)=-|x|^2+y^2\) here
denotes the manuscript's coordinate polynomial. This bound excludes
critical points on the transition annulus during the insertion. On the
support, both \(T\) and the normalized modified height obey
\(|T|,|U|\le4d^2+8d^3+6da_2^2<1\). The source construction therefore gives a
smooth embedding with the specified positive heights and unchanged polar
caps.

The induced class is entering for all sufficiently small \(r\) with the
other parameters fixed. The round and modified graph slopes are \(O(r)\),
so the physical induced metric differs from the round metric by \(O(r^2)\)
in \(C^0\). The source's bounded second derivatives and Gauss equation give
uniformly bounded scalar curvature on the changed set of volume \(O(r^4)\).
The Dirichlet part of the conformal Laplacian form thus changes by at most
\(O(r^2)\) times the round Dirichlet part. The scalar part changes by at
most \(O(r^2)\|f\|_{L^4(g_{\rm rd})}^2\), by Hölder on the changed set.
The round Sobolev inequality bounds this by \(O(r^2)\) times the round
conformal Laplacian form. The modified form therefore has positive Yamabe
sign for small \(r\), and the source's \(O(r^4)\) chiral energies give the
strict energy inequality. For this fixed Morse height the two-sided local
obstruction applies in any smooth entering gauge in the induced class.

In either box write \(a=a_j\). On the polynomial core, the normalized
physical height is \(\ell=Q(w)+C_a(v)\) with \(C_a(v)=v^3-3a^2v\). The
physical section in the horizontal hyperplane is
\[
 X=r L(T)\Theta_j(w),\qquad
 L(T)^2=R_0^2-2h_*T-r^2T^2,\qquad T=\ell+6a^2v,\qquad
 h_*=\sqrt{1-R_0^2r^2}.
\]
Its metric uses the actual radial speed \(r|L_v|\) and actual angular scale
\(rL\Lambda\). For example, at \(w=0,v=a\) the graph metric is block diagonal
with angular coefficient \(r^2L^2\lambda^2\) and radial coefficient
\(r^2L_v^2\), because \(dU=0\). For the physical height the four metric
Hessian eigenvalues there are
\[
 -\frac{2}{L^2\lambda^2},\quad -\frac{2}{L^2\lambda^2},\quad
 \frac{2}{L^2\lambda^2},\quad \frac{6a}{L_v^2},\qquad
 L_v=-\frac{6a^2(h_*+r^2T)}{L}.
\]
The diagonal entries of the coordinate Hessian are covariant components.
In particular the small normalized radial coefficient \(6a\) becomes a
large positive metric eigenvalue as \(a\to0\) with the other bounds fixed.

For the exact regular witnesses let \(q_i\) be the coefficient of \(w_i^2\)
in \(Q(w)\), so \(q=(-1,-1,1)\). At \(v=a,w=s e_i\), \(s>0\), the level is
\(\ell=-2a^3+q_i s^2\). Solve the section equation locally for \(w_i\) in
terms of the other two \(w_j\) and \(v\). The first derivatives of \(w_i\)
vanish there, its pure second derivatives are \(-q_j/(q_i s)\) and
\(-3a/(q_i s)\), and its mixed derivatives vanish. Use the section normal in
the direction of decreasing \(w_i\). The round angular Christoffel term for
the Hessian of the parametrization in a direction \(j\ne i\) is
\(-\partial_i\log\Lambda=2bs/(1+bs^2)\). The radial acceleration of the
parameter sphere lies in the tangent radial direction. Division by the
actual angular and radial metric coefficients gives the three principal
curvatures
\[
 \kappa_j=K(\mu-q_j/q_i)\quad (j\ne i),\qquad
 \kappa_v=-Km/q_i,\qquad
 K=\frac{1}{rL\Lambda s},\quad \mu=\frac{2bs^2}{1+bs^2},\quad
 m=\frac{L^4\Lambda^2}{12a^3(h_*+r^2T)^2}.
\]
Hence the normalized scalar curvatures are

| Physical order from the \(a\)-box index-two value | Coordinate witness | \(R_\Sigma/(2K^2)\) |
| --- | --- | --- |
| Incoming, \(\ell=-2a^3-s^2\) | \(w=s e_{x_1},\ v=a\) | \(\mu^2-1+2m\mu\) |
| Outgoing, \(\ell=-2a^3+s^2\) | \(w=s e_y,\ v=a\) | \((1+\mu)(1+\mu-2m)\) |

Set \(d_0=3a_2^3\) as in the source. In each box the proposed witnesses for
\(-d_0\le\ell\le d_0\) lie in the polynomial core since \(s^2\le 5a_2^3\) and
\(v^2\le a_2^2\). For the incoming witnesses \(s^2\le2a^3\); the largest
coefficient of \(a^3\) is \(3(1.1)^3-2=1.993\). In the stated ranges
\(R_0^2/2\le L^2\le2R_0^2\), \(1/2\le(h_*+r^2T)^2\le1\),
\(\Lambda\ge\lambda/2\), and \(0\le\mu<1/2\). Thus on the incoming row
\(2m\mu\le(2/3)R_0^4\lambda^4(s^2/a^3)\le1/12\). On the outgoing row
\(m\ge R_0^2/(768a^3)>1\). Both rows have strictly negative sign throughout
their indicated portions of \([-d_0,d_0]\). In particular the manuscript's
actual incoming, middle and outgoing regular levels \(-d_0,0,d_0\) each
contain such points. The incoming level retains the manuscript's smooth
\(S^3\) type. The signs concern the induced section metric.

For the original family, locating the first loss of positivity from an
unchanged round latitude across all regular levels requires fixing the
angular maps, cutoff profile and parameters, then bounding scalar curvature
over whole sections, including the transition region. The specified
specialization proves failure throughout the stated regular interval. Its
nonempty regular lower latitudes with \(\ell\le -T_0\) are round, and there
are no critical values between \(-T_0\) and \(-d_0\). By smooth dependence
of the whole level in this band, the first loss from below lies strictly
between \(-T_0\) and \(-d_0\). The witness arguments leave its position
within that interval undetermined.

## 3. Exact first failure on the closed rotational immersion

In 04's sharpness family for \(J\), let
\(F(t,\theta)=(z(t),r(t)\theta)\), \(0<t<(2k+1)\pi\), \(k\ge1\), with
\(r'=\rho\cos t\), \(z'=\rho\sin t\). Here \(r(t)=C+\sin t\) between the
end bumps, \(C>1\), and \(\sin t>0\) on the end arms outside this middle
interval. Choose the transverse height \(h=r(t)\theta_4\). Orientation
\(N=(-\cos t,\sin t\,\theta)\) gives meridional principal curvature
\(p=1/\rho\) and the three orbit curvatures are \(q=\sin t/r(t)\).
Curvature is evaluated on the individual immersed section sheet at each
point of the regular level on the source.

On height \(\ell\), write \(d=\ell/r(t)\), and let \(W^2=1-d^2\),
\(M^2=d^2\cos^2 t\). These are the squared angular and meridional components
of \(\nabla h\), so \(D=W^2+M^2\). The restriction of \(A\) to the section
has two eigenvalues \(q\) and one \((pW^2+qM^2)/D\). This also holds if
\(W=0,D>0\), when the tangent space consists of orbit directions. The
physical section scalar curvature is therefore exactly
\[
 R_\Sigma=\frac{2q}{D^2}\bigl[(q+2p)W^2+3qM^2\bigr].
\]

The height has range \([-(C+1),C+1]\). Away from the polar cap centers,
criticality requires \(|d|=1\) and \(\cos t=0\), giving precisely
\(|\ell|=C-1,C+1\), which may have multiple critical points at a single
value. At either polar cap center \(h\) is a horizontal coordinate in a
smooth round chart, so the height is regular there. For any nonempty
regular level the following hold.

| Levels | Curvature on the physical section |
| --- | --- |
| \(C<\lvert\ell\rvert<C+1\) | Strictly positive everywhere. Every point has \(q>0\), and \(p>0\). |
| \(\lvert\ell\rvert=C\) | Nonnegative everywhere. Zeros occur precisely at \(t=n\pi\) and \(\theta_4=\ell/C\). Here \(D=1\) and \(q=0\). |
| \(\lvert\ell\rvert<C\), \(\lvert\ell\rvert\ne C-1\) | Contains a negative point. Take \(t>\pi\) approaching \(\pi\) inside the middle interval. Then \(r\to C\), \(q\to0^-\), and the bracket tends to \(2(1-\ell^2/C^2)>0\). |

The same negative witness is a regular point on either singular interior
level \(|\ell|=C-1\). The exact first loss of strict positivity from the
bottom is the regular level \(\ell=-C\), and from the top it is
\(\ell=C\). For the axial direction every nonempty regular level is a union
of round three-spheres. This comparison holds on a standard smooth source
with zero Weyl tensor and positive Yamabe sign of the induced conformal
class, as described in 04. It concerns the physical section metrics of this
immersion.

For 04's other rotational example, normal \((\sin\phi\,\theta,-\cos\phi)\)
on the unflattened \(H_3=0\) bridge gives \(p=-q/3\) and \(q>0\). The same
restriction calculation applies to every height direction by taking \(W,M\)
as the corresponding angular and meridional gradient lengths. Since
\(q+2p=q/3>0\), all nonempty regular physical sections of the ideal bridge
are strictly positive. On a flattened arm use the source slope \(a(r)\) for
that arm. In the central transverse section \(h=r\theta_4=0\) one has
\(D=W^2=1\), \(M=0\), and the exact scalar curvature is
\(2(a/r)(a/r+2a')=2(ra^2)'/r^2\). It is negative somewhere in each flattening
annulus because \(ra^2\) decreases from its positive retained value to zero.
This is a section calculation on the truncated bridge with planar faces.

**Scope.** These are analytic results for the specified vertical and
transverse height choices on the supplied standard-sphere models, together
with a local two-sided test for any supplied index-two critical point. They
exclude positivity of every physical level for those heights. The existence
of a different positive sweepout remains open for the general problem.
