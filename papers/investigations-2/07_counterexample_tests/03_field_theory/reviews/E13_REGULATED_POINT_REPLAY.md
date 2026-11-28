# FTI-E13 · Independent replay of the regulated point value

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance by a reader independent of the authorship of B05,
E11, E12 and the lead calculation. The frozen E dispatch specifies GPT-6.2 Sol
at ultra effort. Actual serving variant and effort are unavailable.
Checkout \(\texttt{7c6bbab9a0a6}\) and the pinned working inputs below.

**Accepted at the frozen scope.** The normalized finite functional
annihilates all \(Q\)-exact polynomials on the specified quotient and
takes \(\phi(p_0)^2\) to \(1/t\) for every allowed cutoff and \(t>0\).
In particular it takes the value \(1/4\) on both standard fillings at
\(t=4\). The scalar moment has an exact fixed-\(t\) cutoff limit and
diverges when the scalar damping is removed. The earlier signed
orientation-cover values agree with the replay.

## Closed quotient and transverse rank

Work on the smooth closed connected oriented homotopy four-sphere \(X\)
with a smooth positive Riemannian metric \(g\), the indicated orientation
and self-dual chirality. In a unitary trivialization of the charge-one
line write the connection as \(d+iA\), \(A\) real. A smooth gauge
\(v:X\to U(1)\) lifts through the exponential, \(v=e^{i\alpha}\), since
\(X\) is simply connected. Acting on a unit-charge section by \(v\)
gives \(A\mapsto A-d\alpha\). The lift is determined up to
\(2\pi\mathbb Z\) in the constants. Since
\(\langle d_g^*A,1\rangle=0\), the equation
\(d_g^*d\alpha=d_g^*A\) has a unique smooth mean-zero solution, by
inversion of the scalar Laplacian on the orthogonal complement of its
constant kernel and elliptic regularity. An exact co-closed one-form
has zero squared norm by adjointness. Thus the co-closed representative
is unique. There is no winding lattice in the reassembled quotient.
The constant \(U(1)\) is the stabilizer, acts trivially on the five
fields of B03 and has prescribed Haar mass one.
[B03](../brainstorm/notes/B03_OFF_SHELL_CHOICE.md) · [E12](../research-progress/handoffs/RETURN_FTI_E12.md)

For retained co-closed modes \(u_i\) and real mean-zero scalar basis
\(f_j\), the prequotient connection is
\(\sum_i x_i u_i+d\sum_j a_jf_j\) and its neutral odd partner is
\(\sum_i\theta_i u_i+d\sum_j\zeta_j f_j\). Two retained connections in
the same gauge orbit have equal \(x_i\), because their difference is
exact and the co-closed part of that difference vanishes. Translation
of the \(a_j\) realizes the orbit intersection. The \(a_j\) disappear
on the quotient while the odd coefficients \(\zeta_j\) survive.
The scalar is \(\phi=c+\sum_j b_jf_j\) with \(c\) its actual constant
part. Before quotienting \(Q a_j=\zeta_j\) and \(Q^2a_j=-b_j\), the
infinitesimal translation by the gauge parameter \(\phi\). The
quotient derivation is therefore square zero, with
\[
 Qx=\theta,\qquad Q\chi=H,\qquad Q\zeta=-b,\qquad
 Q\theta=QH=Qb=Qc=0 .
\]

On real self-dual two-forms, \(W_g^+\) is self-adjoint, so
\(\langle K_g v,v\rangle=|v|^2+\ell^4|W_g^+v|^2\) for
\(K_g=1+\ell^4(W_g^+)^2\). If \(K_gd^+\alpha=0\) for a smooth
co-closed \(\alpha\), then \(d\alpha\) is anti-self-dual. On the
reassembled closed \(X\),
\[
 -\|d\alpha\|_{L^2_g}^2=\int_X d\alpha\wedge d\alpha
 =\int_X d(\alpha\wedge d\alpha)=0 .
\]
As \(H^1(X;\mathbb R)=0\), the resulting closed one-form is exact
and co-closure forces \(\alpha=0\). Hence the matrix \(M\) of
\(K_gd^+|_U\) between a real orthonormal frame of \(U\) and an
orthonormal frame of its image with the transported orientation lies
in \(GL^+(N,\mathbb R)\), \(N=\dim U\). For the actual cut the proof
takes place after smooth reassembly across the tube seam and the cap.
The wedge pairing on the self-dual block is the
\(L^2\) pairing. Exact modes vanish after \(d\), so the finite gauge
fermion is \(\chi^T(Mx-H/2)\). The graded Leibniz rule gives the frozen
\(S=H^TMx-H^TH/2-\chi^TM\theta\).

## Contour, orientation and Ward test

Let \(P\) be a polynomial observable with holomorphic dependence on
\(H\), and let \(\widetilde P\) denote the substitution \(H=Mx+iy\)
with \(x,y\) real. Use left odd derivatives. The identity
\(0=D(Mx+iy)=M\theta+iDy\) yields \(Dy=iM\theta\). More explicitly,
\[
 D=\sum_j\theta_j\left(\partial_{x_j}
                 +i\sum_a M_{aj}\partial_{y_a}\right)
   +\sum_a(Mx+iy)_a\partial_{\chi_a}
   -\sum_j b_j\partial_{\zeta_j}.
\]
This complex-coefficient tangent derivation intertwines \(Q\) with
pullback. The holomorphic transpose yields
\(H^TMx-H^TH/2=(|Mx|^2+|y|^2)/2\) on the contour. Define the weight
\[
 W=\exp\bigl(-(|Mx|^2+|y|^2)/2+\chi^TM\theta\bigr).
\]
The derivative of its even Gaussian exponent is
\(-(Mx+iy)^TM\theta\) and the derivative of its fermion exponent is
\((Mx+iy)^TM\theta\). Thus \(DW=0\).

Define the Berezin functional by
\(\mathcal B(\chi_1\theta_1\cdots\chi_N\theta_N)=1\), zero on lower
degree. For \(\eta=M\theta\), the exponential is
\(\prod_i(1+\chi_i\eta_i)\). Reordering the top product into all
\(\chi\)'s followed by all \(\eta\)'s gives the same sign as
reordering the original top monomial into all \(\chi\)'s followed by
all \(\theta\)'s. The exterior change of the \(\theta\)'s contributes
\(\det M\), so \(\mathcal B(e^{\chi^TM\theta})=\det M\).
Let \(R_0\) evaluate \(b=\zeta=0\) and let
\(d\gamma_t(c)=\sqrt{t/(2\pi)}e^{-tc^2/2}dc\). The pairing is
\[
 \mathcal L_{M,t}(P)
  =(2\pi)^{-N}\int_{\mathbb R}d\gamma_t(c)
       \int_{\mathbb R^{2N}} dx\,dy\,
          \mathcal B\bigl(R_0(\widetilde P W)\bigr).
\]
The contour uses the prescribed real \(dx\,dy\) measure.
Every coefficient after longitudinal evaluation is a polynomial times
the Gaussian in \(x,y,c\). Since \(M\) is invertible and \(t>0\), this
is absolutely integrable, including after the first derivatives used
below. The real substitution \(z=Mx\) gives the even factor
\(1/|\det M|\) after the factor \((2\pi)^{-N}\). The odd determinant
cancels it because the frames carry the transported orientation.
This applies to arbitrary invertible matrices in these oriented
frames. Reversing exactly one block orientation simultaneously
changes the determinant sign and the sign of the top Berezin
functional. The current, the
scalar probability and the stabilizer each have mass one. Thus
\(\mathcal L_{M,t}(1)=1\). If \(N=0\), the transverse factors and the
empty determinant are one.

For the Ward identity, \(R_0D=D_0R_0\), where \(D_0\) omits the
longitudinal term, since each \(b_j\partial_{\zeta_j}\) term has a
factor \(b_j\). Using \(DW=0\), the weighted integrand for \(QP\) is
\(D_0R_0(\widetilde P W)\). In the \(x,y\) derivatives the
coefficients are independent of those variables and the differentiated
products decay at each real end. Ordinary integration by parts in
each real direction therefore gives zero, also with the complex
coefficient of the \(y\) term. The \(\chi_a\) derivative gives zero
Berezin top coefficient because its even coefficient is independent
of \(\chi_a\). The scalar integral is untouched by \(D_0\).
Consequently \(\mathcal L_{M,t}(QP)=0\) for all polynomials, also at
\(N=0\). Witten's discussion of measure control and integration by
parts provides context for the need to specify the finite contour and
decay, both justified here directly.
[Witten, §3, pp. 364–365, especially notes 10–11](https://www.ias.edu/sites/default/files/sns/%5B109%5DCommMathPhys117-1988.pdf#page=13)

For a mixed test at positive rank take \(P=\chi_a(H+Mx)_b\). It is
holomorphic in \(H\) and
\[
 QP=H_a(H+Mx)_b-\chi_a(M\theta)_b.
\]
In normalized averages the first term is
\(\mathbf E[(z+iy)_a(2z+iy)_b]=(2-1)\delta_{ab}=\delta_{ab}\) for
independent standard real \(z,y\). Differentiating the Berezin
determinant in \(M_{aj}\) gives
\(\langle\chi_a\theta_j\rangle=(M^{-1})_{ja}\), and hence the odd
term before subtraction has average
\(\sum_j M_{bj}(M^{-1})_{ja}=\delta_{ab}\).
For \(a=b\) both contributions are nonzero, including the contribution
from the imaginary auxiliary displacement.

## The point class and the two limits

The odd contraction
\[
 h=\sum_i x_i\partial_{\theta_i}
   +\sum_a\chi_a\partial_{H_a}
   -\sum_j\zeta_j\partial_{b_j}
\]
satisfies \(Qh+hQ=E\), where \(E\) is the Euler derivation counting
all generators except \(c\). This holds on generators and extends
by the derivation property. Each \(Q\)-closed positive-count
homogeneous component \(P_m\) is \(Q(hP_m/m)\). Evaluation at all
generators except \(c\) equal to zero is a chain map, so the
cohomology is precisely \(\mathbb C[c]\). In particular, putting
\(B=\sum_j b_j f_j(p_0)\) and \(Z=\sum_j\zeta_j f_j(p_0)\) gives
\[
 I_{p_0}-c^2=(c+B)^2-c^2=Q[-Z(2c+B)].
\]
The same reduction holds even before applying \(R_0\).

For any normalized Ward functional whose real \(b\)-marginal is a
positive probability with finite second moments,
\(b_j^2=Q(-\zeta_j b_j)\) implies
\(\int b_j^2=0\). Positivity forces every \(b_j\) to vanish almost
surely. The necessity is a support statement for the real scalar
marginal. The odd restriction and the constant scalar law are
prescription data. The proof of the Ward identity allows any
probability law in \(c\) with all moments finite since \(Dc=0\).

For the prescribed Gaussian \(\mathcal L_{M,t}(I_{p_0})
=\int c^2\,d\gamma_t(c)=1/t\), by integration by parts using
\(\gamma'_t(c)=-tc\,\gamma_t(c)\) for its density. The same value holds for every
admissible transverse and longitudinal cutoff, including empty
blocks. Hence any exhaustion at fixed \(t>0\) gives the very same
scalar for this observable. The growth
\(\mathcal L_{M,t}(|Mx|^2)=N\) is an exact example of a
cutoff-dependent norm moment and supplies no general convergence of
the polynomial pairings. For any family of cutoffs with \(t\downarrow0\)
the normalized point value diverges to \(+\infty\), while the unit
value stays one. The cutoff conclusion concerns the fixed insertion.
The regulator-removal failure concerns the frozen scalar law.

## Actual crossing and the signed comparison

Write \(q=(\Re z,\Im z,\Re w,\Im w)\), \(a=\sqrt{\epsilon}\) and
\(r=a/10\). Gerig's retained circle is \((ae^{is},0)\), and the
actual tube is \(\tau(s,x)=((a-x_1)e^{is},x_2+ix_3)\), \(|x|\le r\).
It lies inside radius \(a+r<\sqrt 2a\), where the modified form is
a real nonzero multiple of the birth model. The truncation at
\(64a>32\sqrt 2a\) lies in the standard-form region.
[Gerig, arXiv:1905.10938v3, Example 1.7, p. 3](https://arxiv.org/pdf/1905.10938v3#page=3) · [B01](../brainstorm/notes/B01_ACTUAL_CUT.md)

At \(q_*=(a-r,0,0,0)=\tau(0,(r,0,0))\), take the indicated smooth
bump \(\rho_*\), equal to one near \(q_*\) with support radius
\(r/8\). Extend
\(\beta=(q^1-q_*^1)\rho_*\,dq^1\wedge dq^2\) by zero on the
reassembled \(X\). Its smooth codifferential \(u_{\rm raw}=d_g^*\beta\)
is co-closed since \((d_g^*)^2=0\). The connection terms vanish at
\(q_*\) because \(\beta(q_*)=0\), giving
\[
 u_{\rm raw}(q_*)=g^{12}(q_*)\,dq^1-g^{11}(q_*)\,dq^2 .
\]
The second coefficient is nonzero for every positive smooth \(g\).
By continuity \(u_{\rm raw}\) is nonzero on an open neighborhood of
\(q_*\). On the radial path \(q_*+(\lambda,0,0,0)\) its tube
coordinate is \(x_1=r-\lambda\) for small signed \(\lambda\).
The path crosses from exterior to tube at \(\lambda=0\), so the
normalized \(u=u_{\rm raw}/\|u_{\rm raw}\|_{L^2_g}\) gives a rank-one
mode nonzero on both sides. Its image \(K_gd^+u\) is nonzero by the
closed injectivity proof. A bump \(\rho_0\) equal to one near \(p_0=0\)
and supported within radius \(a/8\) gives the allowed mean-zero
\(f=\rho_0-\operatorname{mean}_g\rho_0\), with \(f(p_0)>0\) since
\(0<\operatorname{mean}_g\rho_0<1\).

For the inherited marking, the displayed birth form is
\[
 (|z|^2-|w|^2-a^2)\omega_{\rm std}
   -\operatorname{Im}((Rw-\bar z\bar w)\,dz\wedge dw).
\]
In the periodic oriented frame \((T,n_1,n_2,n_3)=(ie^{is},-e^{is},
1_w,i_w)\), contract the normal derivative with \(T\) and use the
Euclidean normal metric to identify the resulting covectors with
vectors. Before the inner multiplier \(\kappa\), the resulting map
sends \(n_1\) to \(-2a\,n_1\). Writing \(E_s=e^{is}\), the
\(23\)-components are
\((-\Re (E_s\,dB_1),\Im(E_s\,dB_1))\), where
\(dB_1=R(x_2+ix_3)-aE_s^{-1}(x_2-ix_3)\).
This gives the symmetric \(23\)-block with diagonal
\(a-R\cos s,a+R\cos s\) and off-diagonal \(R\sin s\).
With tangent \(-\operatorname{sgn}(\kappa)T\) the eigenvalues are
\(|\kappa|(2a,R-a,-(R+a))\). The positive ratio is
\((R-a)/(2a)>1\) for \(R>3a\), and the negative line is
\(R_1(-s/2)\mathbb R e_3\). Its continuous unit generator
\(\sin(s/2)n_2+\cos(s/2)n_3\) flips sign. The periodic ambient
frame winds once in the \(z\)-plane and its continuous spin lift
ends with sign minus. The line-adapted half-rotation has terminal
spin factors \(-\widetilde R_1(-\pi)=+\widetilde R_1(\pi)\) in the
increasing \(s\) convention, with
\(\widetilde R_1(\alpha)=\exp(\alpha e_2e_3/2)\),
\(e_2^2=e_3^2=-1\). The opposite half-angle chart has terminal
factor \(-\widetilde R_1(\pi)\) for the same ambient spin restriction.
Honda's flat twisted representative has positive ratio \(1\).
The earlier obstruction to identification of the jets is retained.
The crossing trial uses the actual smooth coordinates and metric.
[Gerig, Example 1.7](https://arxiv.org/pdf/1905.10938v3#page=3) · [Honda, Theorems 6(B) and 7, p. 6](https://www.math.ucla.edu/~honda/moser.pdf#page=6) · [E07](../research-progress/handoffs/RETURN_FTI_E07.md) · [E08](E08_JET_AND_SEAM.md)

Use the complex orientation on \(B^4_{64a}\) and outward-normal-first
boundary orientations, so the tube has boundary \(Y\), the exterior
has \(-Y\sqcup O\) and the standard cap has \(-O\), with
\(O=+S^3_{64a}\). The Gerig and zero-free standard forms use the same
compactification, pole at infinity and insertion at \(p_0=0\).
For inversion \(I(v)=v/|v|^2\) and
\(D_{\mathrm{ref}}=\operatorname{diag}(1,1,1,-1)\), the oriented
compact chart is \(y=D_{\mathrm{ref}} I(q)\). In the inverted
coordinates \(x=D_{\mathrm{ref}}q\) the common end form is
\(dx^1\wedge dx^2-dx^3\wedge dx^4\), self-dual in the inherited
orientation.
[Signed end record](../notes/FIELD_COMPARISON.md#an-exact-value-on-a-marked-filling)

For the earlier finite \(\mathbb Z/2\) calculation the disk and
sphere fibers give the same \(H^1(-;\mathbb F_2)\) pulled back from
the circle, and restriction \(H^1(T)\to H^1(Y)\) is an isomorphism.
Mayer–Vietoris for the ball gives \(H^1(E)=0\) for the exterior \(E\).
Thus the nontrivial orientation-cover class \(\lambda\) on \(Y\)
cannot extend over \(E\). With one or two fixed boundary
identifications, an extending class has relative cardinality
\(2^{m-1}\) for \(m\) connected boundaries, by dividing the \(2^m\)
identifications by the free simultaneous action of the two bulk
automorphisms. Incoming boundary classes each carry mass \(1/2\).
The tube state is consequently \(1\) on both classes, and the
exterior kernel is \(2\delta_{b,0}\) on the seam class \(b\).
It pairs to zero with the \(\lambda\)-projection and to one with
the plain state. The cap sends an outer unit state to \(1/2\).
The zero-free ball has the unit outer state with its empty insertion.
[Freed, Lecture 2, (18)–(24), pp. 15–18](https://ncatlab.org/nlab/files/Freed-TQFTLectures.pdf#page=16) · [E03](../research-progress/handoffs/RETURN_FTI_E03.md)

| Capped input | B05 point value at \(t=4\) | Earlier cover, outer then capped |
| --- | ---: | --- |
| Actual Gerig, retaining its Möbius line and projector | \(1/4\) | \(0,\ 0\) |
| Same ball, actual cut with plain gluing | \(1/4\) | \(1,\ 1/2\) |
| Zero-free standard form with the same end and cap | \(1/4\) | \(1,\ 1/2\) |
| Round and physical E33 metrics on standard \(S^4\) | \(1/4\) on each | No additional decorated cut evaluated |
| Parent's signed minus puncture reclosed with its coordinate cap | \(1/4\) for the closed calculation | With a supplied tube and line \(L\), \(\delta_{w_1(L),0},\ \delta_{w_1(L),0}/2\) |

For the parent the cover depends on the supplied marking and its
restriction across the cut. The B05 point value on the capped
homotopy sphere follows from the closed algebra and the same fixed
scalar law. The existing native disk and oriented affine standard
disk give genus zero for the same signed clockwise latitude probe.
The finite point value gives no additional genus bound or
separation of those fillings. A genus-saving comparison would still
need a surface and a strict standard lower bound for the same signed
knot.
[Common inputs](../notes/COMMON_INPUTS.md) · [E10](../research-progress/handoffs/RETURN_FTI_E10.md) · [Parent's signed replay](../../reviews/E05_NATIVE.md)

## Input versions and scope

| Input | SHA-256 prefix |
| --- | --- |
| [E13 request](../research-progress/handoffs/REQUEST_FTI_E13.md) | \(\texttt{151af7cad945d2dd}\) |
| [B05](../brainstorm/notes/B05_REGULATED_POINT.md) | \(\texttt{c86fa5918754ea79}\) |
| [E11](../research-progress/handoffs/RETURN_FTI_E11.md) | \(\texttt{fddca1c2c18124ce}\) |
| [E12](../research-progress/handoffs/RETURN_FTI_E12.md) | \(\texttt{733f50f3731eb33a}\) |
| [Lead calculation](../notes/B05_POINT_EVALUATION.md) | \(\texttt{c3c389a7f8febed5}\) |
| [First closing](../continuation-notes/CLOSING_20261128.md) | \(\texttt{a3310c2ceef3c55c}\) |
| [Common inputs](../notes/COMMON_INPUTS.md) | \(\texttt{92f54afaa36db652}\) |

Supporting working sources are B01 \(\texttt{bd923836031876e2}\),
B03 \(\texttt{15599fa6b4ce5327}\), E03 \(\texttt{06fc4ffbaa71b842}\),
E07 \(\texttt{6e5ce3af04441dc4}\), E08 \(\texttt{4622bdd5d93dd092}\),
E10 \(\texttt{bc6f2c1c921ca31a}\) and the end record
\(\texttt{b24f401ae4632832}\). This is an analytic non-author replay of
the finite regulator and the named signed controls, with the primary
source passages inspected at the stated points of dependence.
