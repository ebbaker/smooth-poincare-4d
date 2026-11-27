# SP4-CUT-TUBE-E32 · Readback of the gradient cutoff and through-running puncture

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable. [Frozen E32
request](../research-progress/handoffs/E32_REQUEST_R1.md), checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, with the lead's bounded
extension to all \(0\le\chi,\eta\le1\) cutoffs on the embedded
ratio-two shells used in the return.
Inputs are the [E30 computation](../notes/E30_GRADIENT_PUNCTURE.md),
SHA-256 beginning 1c95fd69ad193bb3,
the [marked prism and bending geometry](../notes/MARKED_PRISM_17.md),
the [length formula](../notes/E26_LENGTH_TEST.md), and the
[radial transvection test](E29_MOVING_PUNCTURE.md). All calculations
below are analytic in the parent's real Hilbert–Schmidt chiral
normalization.

The corrected gradient velocity has magnetic infimum of order
\(\rho^3\) for the fixed radial shell ratio two. The axial electric
estimate excludes the specified linear-interior cutoff at
\(\rho=1/100\) for every base length. The bounded-cutoff extension
also replays for all \(0\le\chi,\eta\le1\) of the same steady
gradient form on any embedded ratio-two shell on this arc.
On the specified prism, constant
nonzero speed has smooth endpoint matching and is covered by
both inequalities.

## Gradient velocity and sharp magnetic infimum

In unit round polar coordinates set \(s=\sin r\), \(c=\cos r\),
\(f(y)=\langle y,u\rangle\) for the unit direction of motion \(u\),
and use the unit profile
\[
 V^\flat=d(\chi sc f)+2\eta s^2 f\,dr,\qquad Z^\flat=f\,dr+sc\,df .
\]
Both cutoffs are one at the inner face with constant jets, and
zero with constant jets at the outer face. The formula is
exactly \(Z^\flat\) in the inner region since
\((sc)'+2s^2=1\). In the shell
\(dV^\flat=-2\eta s^2\,dr\wedge df\), so the round vector curl
is \(-2\eta Y\), where \(Y^\flat_{S^2}=*_{S^2}df\). The
identity in [E29](E29_MOVING_PUNCTURE.md) for the symmetric
curl of \(\operatorname{sym}\nabla V\) then gives, at speed
\(v(t)\),
\[
 \int_P|M|^2\,dV_{h_t}
   =\frac{4\pi}{3}v(t)^2\int_\rho^R(\eta')^2\sin^4r\,dr .
\]
The gradient cutoff \(\chi\) has no magnetic contribution. The
jump in \(\eta\) gives the Cauchy–Schwarz lower bound
\[
 \inf\int_\rho^R(\eta')^2\sin^4r\,dr
 =\left(\int_\rho^R\csc^4r\,dr\right)^{-1}
 =\left[\cot\rho-\cot R+\tfrac13(\cot^3\rho-\cot^3R)\right]^{-1}.
\]
For equality with Dirichlet values the derivative is a negative
constant times \(\csc^4r\). Flattening the derivative on shrinking
endpoint intervals and renormalizing its integral gives smooth
monotone cutoffs with cost approaching this infimum. At fixed shell
width the constant-jet condition precludes attainment by the
Dirichlet minimizer. For \(R=2\rho\),
\(\int_\rho^{2\rho}\csc^4r\,dr
 =\tfrac7{24}\rho^{-3}(1+O(\rho^2))\).
The magnetic infimum is therefore
\((32\pi/7)\rho^3(1+O(\rho^2))\int v^2dt\),
which explains the failure of the E29 magnetic argument by itself
for gradient profiles. With just the original cylindrical bound
\(A\ge2\pi/(3a)\), the sharp magnetic lower bound at \(d=\pi/6\)
would reach \(2\sqrt{AB}\ge8\pi^2/3\) if \(a\le1/(72J_4)\),
where \(J_4=\int_\rho^{2\rho}\csc^4r\,dr\). This is asymptotic
to the condition \(a\le\rho^3/21\), substantially stronger than the
initial \(a<\rho/4\).

## Electric tensor and nonresting endpoint matching

Write \(k=\operatorname{sym}\nabla V\) for the spatial unit-speed
deformation on the round shell. In the co-moving chart, differentiating
the pullback \(K=v F_t^*k_t\) gives the time transport by \(V\) and
the opposite derivative from the chart transvection \(Z\). Here
\(k_t\) denotes the transported tensor, and the shape trace has the
factor \(v\). Thus the pullback of the E26 tensor \(U\), expressed
in the co-moving frame, is
\[
 U=-v'k^\circ+v^2J,\qquad
 J=\bigl(-\mathcal L_{V-Z}k+(\operatorname{tr}k)k\bigr)^\circ.
\]
Angular inversion \((r,y)\mapsto(r,-y)\) is an isometry. It negates
\(V,Z,k\) and preserves \(J\). Therefore the spatial integral of
\(\langle k^\circ,J\rangle\) vanishes on the shell at each time.
The full half-exterior coefficient therefore satisfies
\[
 C\ge\frac14\int_0^1 v^4\,dt\int_{\text{shell}}|J|^2\,dV_h
 \ge\frac{d^4}{4}\int_{\text{shell}}|J|^2\,dV_h,\qquad d=\pi/6 .
\]
The last step uses Hölder and \(\int_0^1 |v|\ge d\). This proof
does not require any acceleration at the endpoints. The intrinsic
support separation of E29 continues to give \(B=\int|M|^2\ge0\).
A meridional angular reflection fixes \(f\) and the electric
tensors and reverses the magnetic tensor. Thus both signed
mixed integrals on the half vanish, one also by support
separation, and \(E_\pm(X)=e_X\) in this family. If
\(H_0=\operatorname{tr}k\), differentiating the scalar trace by
the same transport gives the E26 correction
\(Q=2v'H_0+v^2(2(V-Z)H_0+H_0^2+|k|^2)\) in the co-moving chart.

For the actual nonresting path, choose the lift \(p\) such that
\(p^{-1}a_0p=\exp(j\pi/3)\). The prism isometry
\(\Phi(x)=a_0xj^{-1}\) preserves the real plane
\(\operatorname{span}(p,pj)\) and its orthogonal complement.
Its action in the first plane is rotation through \(-\pi/6\),
which commutes with the planar transvection. The continuation of
the constant-speed arc has \(p_{t+1}=\Phi p_t\) and the oriented
motion direction is pushed forward by \(\Phi\). The radial
coefficients and the function \(f\) transform with this motion,
so \(V_{t+1}=\Phi_*V_t\) and
\(\widetilde h_{t+1}=\Phi_*\widetilde h_t\) on the quotient,
including the fixed-radius bent part and zero exterior vector
region. By uniqueness of the global flow,
\(F_{t+1}=\Phi F_t\Phi^{-1}F_1\). Therefore
\[
 h_{t+1}=(\Phi^{-1}F_1)^*h_t
\]
as a smooth identity on the extended time interval. This proves
all jet matching without a resting plateau. The product face
doubles smoothly, and reversing the base gives the inverse
marking with the same mean energy.

The injectivity radius along this particular arc is \(\pi/34\).
The central pair \((-1,z^8)\), with \(z=e^{2\pi i/17}\), moves
every point by \(\pi/17\), minimal among the nontrivial central
pairs. For noncentral \(q\in Q_8\), the real part of
\(p_t^{-1}q p_t z^{-m}\) has magnitude at most \(\sqrt{2/3}\).
Indeed \(p_t i p_t^{-1}\) is orthogonal to
\(p_t j p_t^{-1}=(i+j+k)/\sqrt3\), and the projection of each
coordinate axis to that perpendicular plane has length
\(\sqrt{2/3}\). Every noncentral displacement consequently
exceeds \(\pi/17\). This verifies both the specified shell
and the wider geometric range \(2\rho<\pi/34\). The estimates
only use the weaker bound \(R\le\pi/17<1/5\).

## Axial and angular estimates

Put \(b=\chi sc\), \(a=b'+2\eta s^2\), so
\(V^\flat=af\,dr+b\,df\), and \(\tau=ac/s-b/s^2\).
At either pole of \(f\), \(V-Z=(a-1)f\,\partial_r\).
In a frame parallel in \(r\), \(k\) is diagonal there with values
\((a'f,\tau f,\tau f)\). The skew derivative of \(V-Z\) vanishes
there because its curl is proportional to \(Y\), which vanishes
at the pole. Hence the derivative terms in
\(\mathcal L_{V-Z}k\) at the pole are the radial transport
and \(2k^2\). Subtracting an angular entry from the radial
entry cancels the scalar term of the trace-free projection and gives
\[
 D(r):=J_{rr}-J_{\theta\theta}\big|_{\rm pole}
 =-(a-1)(a''-\tau')-2\big((a')^2-\tau^2\big)
       +(a'+2\tau)(a'-\tau)
 =-\big[(a-1)(a'-\tau)\big]' .
\]

At each \(r\), \(J_{rr}\) is quadratic in the unit direction \(u\)
and invariant under rotations stabilizing \(y\). Thus it is
\(A_r+B_r f^2\), including at the poles by smoothness.
For any such polynomial with pole value \(q=A_r+B_r\),
\[
 \int_{S^2}(A_r+B_r f^2)^2\,d\Omega\ge(2\pi/3)q^2 .
\]
Indeed the sphere averages of \(f^2,f^4\) are \(1/3,1/5\), and
minimizing on \(A_r+B_r=q\) gives \(A_r=-q/4,\ B_r=5q/4\).
Trace-freeness and axial symmetry at the pole give
\(q=2D(r)/3\). Keeping only the radial entry in the squared tensor
norm gives
\[
 \int_{S^2}|J|^2\,d\Omega\ge\frac{8\pi}{27}D(r)^2 .
\]

For the fixed linear segment \(4/3\le r/\rho\le5/3\) with
\(\chi=2-r/\rho,\ \eta=0\), the explicit formulas are
\[
 a=\chi\cos 2r-sc/\rho,\qquad
 \tau=-2\chi sc-c^2/\rho,\qquad
 a'=-2\cos2r/\rho-4\chi sc,\qquad
 q_1:=a'-\tau=(-1+3s^2)/\rho-2\chi sc .
\]
Also \(q_1'=8sc/\rho-2\chi\cos2r\).
At \(\rho=1/100\) and \(r\le2\rho\), elementary sine and cosine
bounds give \(a'\le-1.98/\rho,\ q_1\le-0.99/\rho\),
\(|a-1|\le4\), and \(|q_1'|\le18\).
Thus \(a' q_1+(a-1)q_1'>1/\rho^2\), so \(|D|>1/\rho^2\).
On this segment \(\sin r\ge\rho\), and its width is \(\rho/3\).
Using the radial volume weight \(\sin^2r\) gives
\[
 \int_{\text{shell}}|J|^2\,dV_h\ge\frac{8\pi}{81\rho},\qquad
 C\ge\frac{2\pi d^4}{81\rho}>\frac{25}{54}.
\]
The threshold uses \(\pi>3\), \(d>1/2\) and \(\rho=1/100\).
The estimate only uses this prescribed interior segment and is
valid for a smooth extension with the required cutoff jets.

## Uniform bounded gradients on embedded ratio-two shells

Let \(R=2\rho\le\pi/17<1/5\), and let
\(0\le\chi,\eta\le1\) be any smooth fixed cutoffs of the displayed
gradient form. Set
\[
 w=(\chi-1)c,\qquad \xi=2(\eta-1)s^2,\qquad
 A_0=a-1=sw'+cw+\xi .
\]
Then \(\tau=cw'-sw+(c/s)\xi\). Both \(w\) and \(\xi\) are
nonpositive. Expanding and integrating \(A_0\tau\), the term
\(\cos2r\,ww'\) gives the boundary
\(\tfrac12\cos2R\,c(R)^2\) and the term \(2scw^2\).
With the existing \(-scw^2\) another nonnegative term remains.
The term \((\cos2r/s)\xi w\) is nonnegative on this shell.
The remaining square satisfies
\[
 sc(w'+\xi/s)^2\ge\tfrac12sc(w')^2-(c/s)\xi^2
                       \ge\tfrac12sc(w')^2-4cs^3 .
\]
It follows that
\[
 \int_\rho^R A_0\tau\,dr
 \ge \tfrac12\cos2R\,c(R)^2+\tfrac12\int_\rho^R sc(w')^2\,dr
              -4\int_\rho^R cs^3\,dr .
\]
The jump of \(w\) is \(-c(R)\), so the derivative integral is
at least \(c(R)^2/\int_\rho^R(sc)^{-1}dr\). For \(R<1/5\),
\(\cos2R>0.92,\ c(R)^2>0.9604\) and \(sc\ge(9/10)r\)
by the elementary cosine and sine Taylor bounds. With
\(\ln2<3/4\), this gives
\(\int_\rho^R(sc)^{-1}dr<1\). Also \(c(R)^2,\cos2R\ge9/10\),
and \(4\int cs^3dr\le32\rho^4<0.0032\). The lower
bound on \(\int A_0\tau\,dr\) is therefore strictly larger
than \(0.405+0.45-0.0032>5/6\).

Set \(\Omega=(a-1)(a'-\tau)\). Endpoint matching gives
\(\Omega(\rho)=\Omega(R)=0\) and \((a-1)(\rho)=0,\ (a-1)(R)=-1\).
Consequently \(\int_\rho^R\Omega\,dr=1/2-\int_\rho^R A_0\tau\,dr<-1/3\).
Integrating against the centred linear function and noting
\(D=-\Omega'\) yields
\[
 \int_\rho^R D^2\,dr\ge\frac{4}{3\rho^3}
\]
by Cauchy–Schwarz and the squared norm \(\rho^3/12\) of that
linear function. The angular estimate and
\(\sin r\ge(9/10)\rho\) yield
\[
 \int_{\text{shell}}|J|^2\,dV_h\ge\frac{8\pi}{25\rho},
 \qquad C\ge\frac{2\pi d^4}{25\rho}.
\]
This uses the range of each cutoff and the steady spatial
gradient form. It covers nonresting matching by the same
time estimate.

## All-length comparison and scope

The E29 positive radial bend gives
\(A\ge\pi(1-a_{\rm bend}^2)^2/(2a_{\rm bend})>149\)
since \(a_{\rm bend}\le\sin\rho\le1/100\), and \(B\ge0\).
For \(L\ge1/5\) one has \(AL>149/5>27\).
For \(0<L<1/5\) the weaker single-cutoff bound suffices,
\(C/L^3>125(25/54)>27\).
Thus either checked electric estimate gives
\(e_X(L)>27>8\pi^2/3\) at the frozen radius for every base length.
For every allowed ratio-two shell in the wider family,
\(a_{\rm bend}\le\sin^3\rho<1/1000\) and the same E29
bound give \(A>1000\). Since \(\rho<1/10,\ \pi>3,\ d>1/2\),
the uniform bound has \(C>3/20\).
For \(L\ge1/16\), \(AL>1000/16>27\), and for
\(0<L<1/16\), \(C/L^3>(3/20)16^3>27\). Hence the
wider result also excludes every base length independently of
the fourth-dimensional Yamabe sign.

The separate E31 estimate uses resting endpoints and allows
arbitrary fixed localized spatial velocity extensions. The proof
here uses angular parity and the steady gradient shape on
embedded ratio-two shells. It leaves open other nonresting velocity
shapes, time-varying cutoffs, and different metric constructions
on this marked exterior.
