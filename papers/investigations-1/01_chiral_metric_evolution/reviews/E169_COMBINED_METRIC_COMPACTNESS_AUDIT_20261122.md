# E169 — Independent audit of the combined metric compactness criterion

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B85, configured
`gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers
are unavailable. I authored E165 and E162. The E168 vanishing-radius
step consumes those inherited results. My independence pertains to
E168's new global unscaled construction and its combination. Related
upstream overlap includes the E154 source review, the volume calculation
in E02C, E137 and E140, and the E147 and E158 audits. I did not author
E168. The [request][req] and seven frozen inputs matched their hashes.

## Disposition

**Pass, conditional as written.** The vanishing-radius contradiction
uses exactly the frozen \(H_{\rm pre}\) and the supplied ALE source
check and core assessment. The unscaled construction gives a positive
strong \(C^{1,1/4}\) metric limit on the actual smooth base modulo
smooth orientation-preserving self-diffeomorphisms, with a weak
\(W^{2,8}\) subsequence there. The conditional late-sequence Fine-flow
application uses the E159 constants, exact native total volume and
the assessed static pair and sequential continuation criteria. No
mathematical defect or repair was identified. The historical wording
of \(H_{\rm pre}\) in E168 is preserved. Discharge is a separate lead
assessment. [E168][e168] · [B85][b85].

## Radius convention and vanishing-minimum case

The definition uses geodesic balls, coordinate Lebesgue measure,
\(m=2\), \(p=8\) and \(\eta=1\). The derivative condition is
\(r^{1/2}\|Dh\|_8+r^{3/2}\|D^2h\|_8\le1\), with
\(\tfrac12 I\le h\le2I\). Both powers are positive, permitting
restriction from an admissible radius larger than the desired one.
The theorem for any fixed \(p>4,m>1,\eta>0\) in E165 therefore gives
the exact premise specialized here. Under \(\bar g_i=r_i^{-2}g_i\)
the norm factors on Ricci and Weyl curvature are \(r_i^2\). The
four-dimensional full \(L^2\) curvature integral is invariant. The
Weyl component measured as a \((0,4)\) tensor has twice the norm of
its endomorphism Hilbert–Schmidt norm on \(\Lambda^+\): summing each
antisymmetric pair over ordered indices contributes a factor two
to the squared norm. Hence the endomorphism bound in E168 has the
same applicability to E165, even in the full tensor convention.
The chosen orientation identifies the same \(W^+\) block after
constant rescaling and positive comparison maps. [E165][e165].

If the common harmonic-radius floor fails, the positive per-metric
infima have a subsequence tending to zero. Choose centers with
radius at most \(1+i^{-1}\) times the infimum on that subsequence.
\(H_{\rm pre}\) gives a connected smooth complete nonflat
Ricci-flat ASD four-dimensional limit, Euclidean volume growth
at each center for all radii, finite full \(L^2\) curvature, and
smooth comparison embeddings near any fixed compact subset.
These give precisely the fixed-center growth and integral
hypotheses of BKN Theorem (1.5), as checked in E164. In dimension
four the result gives one smooth ALE end of order four.
Remark (1.8)(1) supplies all derivative orders. The end group acts
freely on \(S^3\) and preserves the lifted orientation, so is in
\(SO(4)\). Neither the end theorem nor the end coordinates are
being used to assert a comparison embedding. [E164][e164].

Choose one full radial truncation in this chart. Its exterior
has the complete product collar on that end section, as required
by E162. The already supplied comparison map restricts to an
orientation-preserving smooth embedding of that core into the
same underlying smooth \(M\). The homotopy sphere is an integral
homology four-sphere, so this contradicts the assessed core
obstruction. The argument works on any vanishing-infimum
subsequence, proving a common floor for the sequence.
[E162 assessment][e162a].

## Unscaled metric and coordinate limits

### Finite charts and overlap domains

Let \(r_*>0\) denote the sequence's radius floor, \(a_0=r_*/2\)
and \(16\sqrt m\,\rho<a_0\). At every chosen center the admissible
\(a_0\)-ball chart has pullback matrix bounds and a uniform
\(W^{2,8}\) bound, and can be reflected to make it positive.
A radial Euclidean segment of length below \(a_0/\sqrt m\)
has inverse image of length below \(a_0\). At a hypothetical
first failure to lift, completeness gives a limit still inside
the intrinsic chart ball, allowing continuation. Thus the
coordinate image contains that full Euclidean ball.

On \(B_{4\rho}\) a straight Euclidean segment gives the upper
distance bound \(\sqrt m\,|u-v|\). A minimizing ambient geodesic
has length at most \(8\sqrt m\,\rho\) and starts within
\(4\sqrt m\,\rho\) of center. It stays in the \(a_0\)-ball and
its coordinate displacement is at most \(\sqrt m\) times its
length. For \(|u|\le b<B\le4\rho\), a path from the chart point
of ambient length less than \((B-b)/(2\sqrt m)\) likewise stays
inside the \(a_0\)-ball when minimizing, and its coordinate
displacement is below \((B-b)/2\). This gives the needed
interior margin. The center version includes the ambient
radius-\(\rho/(2\sqrt m)\) ball in the inner \(B_\rho\) chart.

For \(D'>D\), \(\kappa=K/3\), volume comparison gives
\[
 \operatorname{Vol}_{g_i}(M)\le\mathcal V_{-\kappa}(D'),\qquad
 \operatorname{Vol}_{g_i}B(x,s)\ge
 v\,\mathcal V_{-\kappa}(s)/\mathcal V_{-\kappa}(D')
 \quad(0<s\le D').
\]
Here the ball of radius \(D'\) is the full base. Packing
the separated net by disjoint smaller balls gives a finite
uniform cardinal bound for every fixed mesh. Pad the lists
and take a diagonal limit of their distance matrices. For
each mesh the finite minimum of the distances to that list
passes to the limit, making its limiting list a net for all
labels and then for the completion. The completion \(Y\)
is compact. Matching nearest list points gives metric
approximations \(e_i\) with uniform distortion and
image-density errors tending to zero as the mesh is sent
slowly to zero. These are only metric maps.

Choose a \(\rho/(16\sqrt m)\)-net in \(Y\) and approximating
centers \(q_{ia}\) for its finitely many points. For any
point \(x\in M\), choose a net point near \(e_i(x)\).
The sum of the net mesh, distortion error and center error
is below \(\rho/(2\sqrt m)\) for large \(i\). This makes
the inner \(B_\rho\) charts a cover of the whole approximant.
The ambient bi-Lipschitz bounds give uniform convergence
on compact coordinate subballs after extracting the images
of a countable dense set of coordinate points. Additive
distortion errors tend to zero, which suffices even when
\(e_i\) is discontinuous. The limits \(\phi_a\) are
bi-Lipschitz. The interior margin passes by approximating
each nearby point of \(Y\), putting its representatives
in one strictly larger closed coordinate subball and taking
a coordinate subsequence. This gives open images and a
cover by the inner images. On a compact overlap patch the
limiting \(b\)-coordinates lie in a compact interior subset,
so the positive margin accommodates all sufficiently large
approximants. The lower bi-Lipschitz bound then makes
\(\theta_{i,ab}=\phi_{ib}^{-1}\phi_{ia}\) converge uniformly
there to the limit transition. Compactness is used throughout
on strict chart interiors.

### Transition derivatives

For \(\alpha_0=5/12\), Sobolev compact embedding gives
local \(C^{1,\alpha_0}\) convergence of the positive
metric matrices because \(1-4/8=1/2>\alpha_0\).
\(a_i=h_{ia}^{-1}\) is uniformly elliptic with bounded
\(C^{1,\alpha_0}\) norm. The coordinate functions of
chart \(b\) are harmonic in chart \(a\), so
\[
 a_i^{jk}\partial_{jk}\theta_i=0,\qquad
 a_i^{jk}\partial_{jk}\partial_\ell\theta_i
       =-(\partial_\ell a_i^{jk})\partial_{jk}\theta_i .
\]
Interior Schauder on the first equation gives uniform
\(C^{2,\alpha_0}\), using the uniform \(C^0\) bound on
the overlap. On a smaller patch the right side of the
second equation is uniformly \(C^{0,\alpha_0}\), giving
\(C^{3,\alpha_0}\) bounds on a further interior patch.
Compact Hölder embedding and the identified \(C^0\)
limit give the actual \(C^{3,\alpha_1}\) convergence for
\(\alpha_1=1/3<\alpha_0\). One derivative of \(a_i\) is
enough. Neither smoothness nor an Einstein equation for
the limit is required by these estimates.

## Cutoff embeddings and the reference projection

### Separation and uniform tubular radius

The scalar and vector blocks \((\zeta_a,\zeta_a u_a)\)
are smooth on the whole approximant by extension by zero.
An inner chart has scalar one and vector \(u_a\).
That vector gives immersion locally. If images of two
points agree, the same scalar block is positive for both
and division recovers the same coordinate, giving global
injectivity. Compactness makes the immersion a smooth
embedding. On \(\overline B_{7\rho/4}\), the local
embeddings \(F_{ia}=I_i\phi_{ia}\) converge in
\(C^{3,\alpha_1}\). For a given block \(b\) at a point
in the limiting cutoff support, the support is compactly
contained in the \(b\)-chart, so a compact overlap
neighborhood persists and the transition estimate applies.
At other points the limiting support has positive local
distance, so uniform coordinate convergence makes the
block eventually zero there. A finite subcover combines
these two estimates. The local uniform derivative bounds
\(\|DF_{ia}\|,\|D^2F_{ia}\|\le L\) can be taken in
Euclidean operator and bilinear norms. The own vector
block is the identity on this ball, giving
\((DF_{ia})^TDF_{ia}\ge I\).

If \(x=\phi_{ia}(u)\), \(|u|\le3\rho/2\), and the
Euclidean image distance to \(y\) is \(\epsilon<1/2\),
the scalar block of \(y\) has \(s\ge1-\epsilon\), so
\(y=\phi_{ia}(v)\). The vector block gives
\[
 |v-u|\le \frac{|sv-u|+|1-s|\,|u|}{s}
          \le 2(1+2\rho)\epsilon=C_b\epsilon .
\]
For a point \(w\) at distance at most \(r\) from
\(I_i(M)\) choose a nearest point \(F_{ia}(u)\) in
an inner chart. A second nearest point has image distance
at most \(2r\), hence coordinate distance at most
\(2C_b r\) for \(r<1/4\). For \(r<\rho/(4C_b)\)
the whole segment lies in \(B_{3\rho/2}\), strictly
inside the derivative-bound region \(B_{7\rho/4}\).
At a point \(z\) on the segment,
\[
 |F_{ia}(z)-w|\le r+2LC_b r,\qquad
 D^2\bigl(\tfrac12|F_{ia}-w|^2\bigr)
       \ge \bigl(1-Lr(1+2LC_b)\bigr) I .
\]
The chosen \(r_{\rm tub}< [2L(1+2LC_b)]^{-1}\)
therefore excludes two distinct critical points on
the segment, in particular two nearest points. The
Hessian at the unique minimizer is positive. Minimizers
are continuous on this tube by uniqueness and compactness,
so the smooth implicit solution near the minimizer is
the nearest projection there. All constants used to
obtain \(r_{\rm tub}\) are uniform before a reference
member is selected.

### \(Dq\), global inverses and convergence on the smooth base

Choose \(\delta\) as in E168 and then one smooth index
\(i_0\) with all local \(F_{ia}\) within \(\delta\) of
\(F_{0a}=F_{i_0a}\) in \(C^1\) for large \(i\).
The uniform tube and inner chart cover make \(P_i\)
defined on all of the source. For \(|u|<3\rho/2\),
the projection residual is at most \(\delta\) by
comparison with \(F_{0a}(u)\). The foot is within
\(2\delta\) of that reference point, hence within
\(2C_b\delta\) in reference coordinates by separation.
In particular \(q\) and the segment from \(u\) to \(q\)
are in \(B_{7\rho/4}\). Differentiating
\(DF_{0a}(q)^T(F_{0a}(q)-F_{ia}(u))=0\) gives
\[
 H Dq=DF_{0a}(q)^T DF_{ia}(u),\qquad
 H=DF_{0a}(q)^T DF_{0a}(q)
       +\langle F_{0a}(q)-F_{ia}(u),D^2F_{0a}(q)\rangle .
\]
Here \(H\ge I/2\), and \(DF_{ia}(u)-DF_{0a}(q)\)
has norm at most \(\delta+2LC_b\delta\). Subtraction
of \(H\) from the right side gives the precise estimate
\[
 \|Dq-I\|\le 2\bigl[L(\delta+2LC_b\delta)+L\delta\bigr]
               =4L(1+LC_b)\delta .
\]
This is below \(1/2\). The straight path of matrices
from \(I\) to \(Dq\) is invertible throughout, so
\(\det Dq>0\). Local diffeomorphism and orientation
preservation follow in the positive charts. If \(P_i(x)=P_i(y)\),
the image distance is at most \(2\delta\), since each
residual is at most \(\delta\). Choose an inner chart for
\(x\). Separation puts \(y\) at coordinate distance
at most \(2C_b\delta<\rho/8\), so both are in the
convex \(B_{3\rho/2}\) region. The derivative bound
gives \(|q(u)-q(v)|\ge |u-v|/2\) by integrating
\(Dq-I\) along the segment. Thus \(x=y\). The image is
open by the local diffeomorphism property and closed by
compactness. The reference is connected and so the map
is onto. The inverse \(f_i\) is a smooth positive
self-diffeomorphism of the fixed \(M\).

With the smooth reference fixed, \(q_{ia}\) converges
in \(C^{3,\alpha_1}\) on smaller coordinate balls by
fixed smooth composition. The projection and reference
coordinates are smooth on fixed neighborhoods of all
the image sets with the stated margins. To invert
at \(|u|\le5\rho/4\), the map
\(v\mapsto u-(q_{ia}(v)-v)\) is a contraction on
the radius-\(\rho/8\) closed ball about \(u\).
This ball is contained strictly in \(B_{3\rho/2}\).
The displacement bound makes the ball invariant.
The same holds for the limit. The derivative lower
bound and uniform convergence yield inverse convergence
in \(C^0\), then derivatives of the inverse identity
give \(C^2\) convergence and uniform third derivatives
on the fixed smaller coordinate balls. Interpolation
gives \(C^{2,\alpha}\) convergence for \(\alpha=1/4\).
These statements concern inverse maps in the stated
local charts.

In the fixed reference charts the metric is
\((Dv_i)^T h_{ia}(v_i)Dv_i\). The equation for the
first derivative and the uniform convergence of the
first derivatives of \(h_{ia}\) and first two
derivatives of \(v_i\) give strong \(C^1\). The spare
Hölder exponent yields strong \(C^{1,\alpha}\):
the first derivatives are bounded in \(C^{0,\alpha_0}\)
on smaller balls using the uniform bound on third
derivatives of \(v_i\), and this interpolates with
their uniform convergence. Positivity follows from
the metric lower bound and limiting inverse Jacobian.
At order two the only \(D^2h_{ia}\) factors are
evaluated at \(v_i\) and multiplied by uniformly bounded
first derivatives of \(v_i\). A change of variables
using the uniformly bounded reciprocal Jacobian
preserves their \(L^8\) bounds. Remaining terms contain
at most \(Dh_{ia}\) and at most three derivatives of
\(v_i\), and are uniformly bounded on compact chart
balls. The finite smooth reference cover gives a
global \(W^{2,8}\) bound and weak subsequence with the
same positive \(C^{1,\alpha}\) limit. This step yields
the regularity stated in E168. It imports no stronger
metric regularity or fixed-background derivative
estimate on the normalizers.

## Conditional native flow implication

In a native orthonormal internal frame the wedge Gram
is \(F_i\wedge F_j=Q_{ij}dV_g\), so trace three gives
\(3dV_g=\langle F_A\wedge F_A\rangle\). For a smooth
path in the fixed bundle, \(\dot F_A=d_A\dot A\).
Since the two curvature factors have degree two, swapping
them contributes sign \(+1\). Metricity and Bianchi give
\[
 \partial_\tau dV_g
    =\tfrac23\langle d_A\dot A\wedge F_A\rangle
    =\tfrac23\,d\langle\dot A\wedge F_A\rangle .
\]
Stokes on the closed base gives the fixed positive volume
\(v=\operatorname{Vol}_{g_{A(0)}}(M)\). The proof
needs only this total volume since the selected metrics
are compared at one sequence of native times.

Write \(x=|\nabla^AT|\), \(y=|T|^2\),
\(z=|\nabla^\Gamma T|\) with the live full base norm.
E159 gives \(\Psi=kz+k^2 y\), \(k^2=4\pi/5\),
and \(x\le z+4\sqrt3\,y\). Since \(k<1+4\sqrt3\),
\[
 x+y\le z+(1+4\sqrt3)y
       \le (1+4\sqrt3)\Psi/k^2 .
\]
On the selected slices this gives
\(B=(1+4\sqrt3)P_0/k^2\) and
\(|T|+|\nabla^AT|\le\sqrt B+B\).
The native metric scale \(g=2K_{\rm old}\widehat g\)
takes the scalar target \(12K_{\rm old}\) to \(6\).
The scalar part of the chiral operator's squared
defect is \(3((s_g-6)/12)^2=(s_g-6)^2/48\).
The mixed block of the curvature operator has squared
Hilbert–Schmidt norm \(|\operatorname{Ric}_0|^2/4\):
for trace-free Ricci eigenvalues \(\lambda_i\), the
three block entries may be taken as
\((\lambda_1+\lambda_j)/2\), \(2\le j\le4\), and
\(\sum_{j=2}^4(\lambda_1+\lambda_j)^2=\sum_{i=1}^4\lambda_i^2\).
The remaining positive block is \(W^+\) in the
endomorphism norm. Positivity and \(\operatorname{tr}Q=3\)
give \(|Q-I|^2=\operatorname{tr}(Q^2)-3\le6\).
Thus E159's chiral coefficient bound gives exactly
\[
 Z_0=\sqrt6/2+(42+8\sqrt3)B,\qquad
 |W^+|_{\rm op,HS}\le Z_0,\quad
 |\operatorname{Ric}_0|\le2Z_0,\quad |s_g-6|\le4\sqrt3 Z_0 .
\]
Using \(|g|_g=2\) in four dimensions, the trace
term of \(\operatorname{Ric}_0+(s_g/4)g\) is bounded
by \(3+2\sqrt3 Z_0\), giving \(K_{\rm Ric}=3+
(2+2\sqrt3)Z_0\). This is the absolute Ricci tensor
bound. Neither \(W^-\) nor a uniform floor for \(Q\)
enters it. [E159][e159] · [E157–E159 assessment][geoma].

These curvature and volume bounds, and the supplied
diameter bound, hold on the same slices \(\tau_i\to\tau_*\).
The conditional static theorem supplies smooth
orientation-preserving normalizers with positive strong
\(C^1\) metric convergence. A homotopy four-sphere is
simply connected and has \(H^2(M;\mathbb R)=0\),
exactly the assessed E157 topology. Each individual
connection is definite with the required sign, so its
signed polar curvature map is a smooth oriented
isometry \(E\to\Lambda^+_{g_i}\). The pullback
identification by a positive base normalizer and the
positive metric square-root isometry connect this to a
fixed such identification from one reference slice.
Thus the lifting in E155 acts on the given \(SO(3)\)
bundle. The E157 enhancement and the bound
\(\sqrt B+B\) supply a positive continuous compatible
limit of the pulled-back pairs on that bundle, with
the same curvature sign. This checks precisely the inputs
to the sequential criterion. On a sufficiently late member
of the same subsequence its smooth datum starts a solution
whose common existence interval passes the old endpoint.
Undo that one's smooth bundle automorphism and use
original-flow uniqueness on the overlap. This produces
an extension in the old identification and is a purely
late-sequence consequence. The derivation asserts no
estimates between these times. [Static and topology assessment][geoma] ·
[Sequential assessment][seq].

Only the supplied source and assessment records were used
for the inherited theorem applications. No source search
or primary reinspection entered this independent E168 audit.
[Return and hashes][ret].

[req]: ../research-progress/handoffs/SP4-CME-E169_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E169_RETURN_v1.md
[b85]: ../brainstorm/notes/B85_METRIC_COMPACTNESS_COMBINATION_20261122.md
[e168]: ../notes/168_CONDITIONAL_METRIC_COMPACTNESS_CRITERION_20261122.md
[e165]: ../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md
[e164]: E164_RICCI_FLAT_ALE_SOURCE_CHECK_20261122.md
[e162a]: E162_ALE_CORE_TOPOLOGY_ASSESSMENT_20261122.md
[e159]: ../notes/159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md
[geoma]: E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md
[seq]: E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md
