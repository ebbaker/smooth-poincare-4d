# E20 · Short-axis cap and paired gluing readback

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and effort are unavailable. This is the bounded
[E20 request R1](../research-progress/handoffs/E20_REQUEST_R1.md) at
\(\texttt{bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0}\). The checked working
blobs are [E17](../notes/E17_DIRECT_TRIAXIAL.md)
\(\texttt{f0d44a4e51af}\), [E18](../notes/E18_QUATERNIONIC_PAIR.md)
\(\texttt{0d02cce6f4b6}\), [E19](../notes/E19_TRIAXIAL_CERTIFICATE.md)
\(\texttt{116b5f1cfd5e}\), the [certificate script](../numerics/triaxial_certificate.py)
\(\texttt{996fe8c58316}\), and the
[T3 impasse](../brainstorm/notes/NONSYMMETRIC_IMPASSE.md)
\(\texttt{7f2b71e063c0}\). The topology is smooth and oriented and the
metric calculations are Riemannian. The real chiral operator norm
is Hilbert–Schmidt and \(T=4\pi^2\).

## Gluing and orientation

The [LED round orbit](../../01_chirality_ledger/notes/ROUND_ORBIT_MARKING.md)
and [SEAM marked pair](../../02_seams_and_marked_cuts/notes/B04_PAIRED_FILLING.md)
agree with the explicit smooth group diagram. The \(SO(3)\) action
on the unit sphere in \(\operatorname{Sym}_0(3,\mathbb R)\) is
conjugation. Its regular stabilizer is the group of determinant-one
diagonal sign matrices, lifting to \(Q_8\). At a singular point with
simple eigenaxis \(i\), the stabilizer lifts to
\(H_i=C_i\cup j C_i\), where \(C_i=\{\exp(\alpha i)\}\). The normal
slice is the traceless symmetric forms on the repeated eigenspace.
A physical rotation acts on that plane with twice its angle, so
\(\rho(\exp(\alpha i))\) rotates the slice by \(4\alpha\), and
\(\rho(j)\) is complex conjugation in a suitable slice basis.
At a real unit slice vector the stabilizer is \(Q_8\). The orbit of
that vector under \(C_i\) has angular period \(\pi/2\) in \(\alpha\).
Consequently the attaching quotient of the boundary is
\[
Q_8=\pi_1(Y)\ \xrightarrow{\ q_i\ }\ H_i/C_i=C_2=\pi_1(W_i),
\qquad \ker q_i=\langle i\rangle .
\]
This also follows by lifting the ordinary circle fiber, whose
lift ends at \(i\).

Use the left quotient \(Y=Q_8\backslash SU(2)\). Its map onto the
regular orbit sends \([g]\) to \(g^{-1}Dg\), with
\(D=\operatorname{diag}(1,-1,0)/\sqrt2\) at the midpoint. The two
regular chambers end at singular orbits with simple axes \(i,j\).
Write \(P=\operatorname{Ad}_{(i+j)/\sqrt2}\), which swaps \(i,j\)
and negates \(k\). The map \(J(A)=-PAP^{-1}\) is a smooth involution
of the round matrix sphere. It fixes \(D\), exchanges its two
chambers, and sends \(g^{-1}Dg\) to
\((PgP^{-1})^{-1}D(PgP^{-1})\). Its ambient orientation sign is
negative, since \(-I\) on the enclosing real five-space has
determinant \(-1\) and conjugation by \(SO(3)\) has determinant \(+1\)
by connectedness. The reference \(Y\) map \(\phi\) is
orientation preserving, as it is quaternion conjugation. As a
map of the two induced boundary orientations it reverses
orientation. Identifying the second chamber with \(-W_i\) by \(J\)
expresses the ambient identity gluing as \(\phi\), since
\(\phi^{-1}=\phi\). Hence this exact switch realizes the two
round disk chambers in smooth \(S^4\). It preserves lengths
\((1,1,t)\) with \(k\) long because the two short axes are
exchanged. The round orbit's own ratio is \(t=2\), with nonzero
bending.

For an arbitrary smooth boundary map, Bamler–Kleiner Theorem 1.3
applies to the full diffeomorphism group of this smooth spherical
space form. Its round isometry representative is connected to the
map in the \(C^\infty\) topology. Such a path gives a smooth
isotopy by subdividing into \(C^1\)-small increments and interpolating
via smooth exponential charts on maps. The isotopy extends
through a collar while fixing the zero section. A round isometry
lifts to \(S^3\). An orientation-preserving lift is
\(g\mapsto a g b^{-1}\), with \(a\in N_{SU(2)}(Q_8)\) and
\(b\in SU(2)\). A reversing lift includes inversion, which moves
the left deck action into the right deck action. Those factors
intersect only in the central multiplications, so there is no
reversing lift normalizing \(Q_8\). The component group is
\(N_{SU(2)}(Q_8)/Q_8=S_3\), since the adjoint group permutes the
three coordinate axes by signed orientation-preserving maps,
and the kernel of the permutation lifts to \(Q_8\). Right
translations are connected to the identity.
[Bamler–Kleiner, *Ricci flow and contractibility of spaces of metrics*, Theorem 1.3 and its proof](https://escholarship.org/content/qt5z36g6jt/qt5z36g6jt_noSplash_16f120402b68a07462cf3d7695ae7ba3.pdf)

The extendible classes are exactly the stabilizer of
\(\langle i\rangle\). Necessity follows from the inclusion
\(q_i\). For sufficiency, on the slice model with
\((g,z)\sim(hg,\rho(h)z)\), extend
\([g]\mapsto[ag b^{-1}]\) to \([g,z]\mapsto[ag b^{-1},Az]\).
Use \(A=1\) if \(a i a^{-1}=i\) and complex conjugation if
\(a i a^{-1}=-i\). Both fix the real unit slice vector. The
equivariance follows from
\(\rho(aha^{-1})=A\rho(h)A^{-1}\) on the two generators
\(\exp(\alpha i),j\). In the second check \(a j a^{-1}\) is
one of \(\pm j,\pm k\), all of which act as the same
reflection. These smooth extensions preserve the zero section.
Pre- and post-composition by the extendible \(S_2\) leave the
glued pair diffeomorphic. There are two double cosets in \(S_3\).

| Transported kernels | Pushout of the two maps \(Q_8\to C_2\) | Smooth assembly |
| --- | --- | --- |
| Same | The two images coincide and generate one \(C_2\). | The identity double \(W_i\cup_{\mathrm{id}}(-W_i)\). |
| Distinct | Each kernel has an element mapping nontrivially to the opposite \(C_2\), killing that copy in the pushout. | The smooth \(i,j\)-switch pair in the round matrix sphere. |

In the first case the fiberwise double is the smooth sphere
bundle \(S(E_i\oplus\mathbb R)\to\mathbb{RP}^2\), for the normal
plane bundle \(E_i\). Its universal cover is \(S^2\times S^2\).
Over the oriented double cover the circle bundle has total
space \(C_4\backslash S^3\), hence Euler number of magnitude
four, even. Stabilizing by a line sends the clutching degree
to zero in \(\pi_1 SO(3)=C_2\). Integral Mayer–Vietoris gives
\(H_2=C_2\) for equal kernels and \(H_2=0\) for distinct
kernels, since \(H_1(Y)\cong C_2^2\) maps with rank one or
two, respectively. This is a classification of pairs of
standard disk bundles with their zero sections, and it supplies
no diffeomorphism of a general complement to a disk bundle.

Price's Theorem 1 and Corollary 1 give the orientation-preserving
classes, his Theorem 2 uses the same peripheral kernel condition,
and Theorem 4 refers to homeomorphism types. I independently
checked the concern in E18 about the proposed orientation-reversing
map \(r\). On Price's mapping-cylinder boundary torus the actual
deck map of the displayed cover \(F\) is
\((\theta,(x,y))\mapsto(\theta+\pi,(-x,y))\). In longitudinal and
fiber-angle coordinates it acts as \(\operatorname{diag}(1,-1)\)
on \(H_1\). The disk attachment
\((\alpha,z)\mapsto(\alpha,\rho_{2\alpha}z)\) sends the solid-torus
meridian to slope \((1,2)\). The deck map sends it to \((1,-2)\),
which cannot extend across that solid torus. The smooth orientation
conclusion above rests on the round normalizer and smooth isotopy,
and uses no such extension.
[Price, *Homeomorphisms of Quaternion space and projective planes in four space*, pp. 113, 117–118, 122–124, 127](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C8290EA8E6D966A19FF658A7AAD11334/S1446788700017407a.pdf/homeomorphisms-of-quaternion-space-and-projective-planes-in-four-space.pdf)

## Fixed profile and independent curvature replay

In the actual \(i\)-collapse marking the profile has lengths
\((a,e^{-u},e^u)\), where \(a=xp(x^2)\), \(u=xr(x^2)\),
\(s=Lx\). The fixed \(L\) and polynomial coefficients match the
seven exact decimal inputs. At \(x=1\), the perturbations with
factor \((1-x^2)^2\) have zero value and derivative.
Writing \(A=3^{-1/4}\), \(B=\log(3)/4\), the base polynomials
give \(p(1)=A,\ p_q(1)=-A/2,\ r(1)=B,\ r_q(1)=-B/2\).
Thus \(a_s=u_s=0\) and the lengths are \((A,A,\sqrt3 A)\),
homothetic by a constant rescaling to the actual Berger metric.
At the core the two odd profiles give \(a_s(0)=4\). Its polar
angle has weight four. The horizontal metric trace is
\(\cosh(2u)\), even, and its traceless coefficient is
\(\sinh(2u)\), odd. The traceless plane rotates through \(4\alpha\)
under \(\exp(\alpha i)\), since the horizontal tangent rotates
through \(2\alpha\). The same reflection type occurs on both
planes under \(j\). Thus its anisotropic tensor is linear in
Cartesian normal coordinates times a smooth even function. In
the polar term \((a/4)^2(d\gamma+\mathcal A)^2\),
\((a/4)^2-s^2=O(s^4)\) with an even coefficient, which gives
smoothness through the normal zero section using
\(s^2d\gamma=X\,dY-Y\,dX\).

For the unregularized calculation use the outward-first
orthonormal coframe \(e^0=ds,\ e^i=l_i\sigma_i\) with
\(d\sigma_i=2\sigma_j\wedge\sigma_k\) cyclically.
Let \(k_i=l_i'/l_i\), \(\mu_i=2l_i/(l_jl_k)\), and
\(n_i=(\mu_j+\mu_k-\mu_i)/2\). The first structure equation
gives \(\omega_{i0}=k_i e^i\), because it supplies the
\(ds\wedge e^i\) term in \(de^i\), and
\(\omega_{jk}=n_i e^i\) because \(n_j+n_k=\mu_i\).
The second structure equation
\(d\omega+\omega\wedge\omega\) gives the radial, tangential
and radial-tangential entries
\[
A_i=-k_i'-k_i^2,\qquad
T_i=n_i\mu_i-n_jn_k-k_jk_k,\qquad
M_i=-\mu_i k_i+n_k k_j+n_j k_k .
\]
Here the tangential entry comes from \(\Omega_{jk}\)
on \(e_j,e_k\). In \(\Omega_{0i}\) the derivative
\(d(-k_i e^i)\) gives the first magnetic term and the
product connection terms supply the other two. Thus
\(R=2\sum_i(A_i+T_i)\) and the chiral eigenvalues are
\(A_i/2+T_i/2-R/12\pm M_i\). The orbit volume is
\(\pi^2 l_1l_2l_3/4=\pi^2a/4\), the unit \(S^3\) volume
divided by eight. These statements give the actual normalization
of the raw calculation.

For an independent check of the pole cancellation, substitute
\(P=2\cosh(2u), d=2\sinh(2u)\), obtaining
\((n_1,n_2,n_3)=(P/a-a,a+d/a,a-d/a)\).
Then \(T_1=2P-3a^2+(d/a)^2+u_s^2\),
\(R/2=-a_{ss}/a+2P-a^2-(d/a)^2-u_s^2\),
\(T_2-T_3=-4d+4Pd/a^2-2a_su_s/a\), and
\(M_1=-2a_s+2(d/a)u_s\). The last difference is
\(M_2-M_3=(4P/a-2a)u_s-2d a_s/a^2\).
These entries give the axial and transversal differences in
the certificate. In the first transverse difference the
pole splits into \(4(Pd-8u)/a^2\) and
\(2(16u/a^2-a_su_s/a)\). In the latter numerator multiply
by \(xL^2p^2\) and use \(p-4L=q p_{\rm tail}\) to extract
the factor \(q\). In the magnetic difference, separate
\(P-2=4\sinh^2u\), \(d-4u\), and \(8(u/a)_s\).
Every residual quotient now has denominator involving only
\(p,L\). Setting \(H(v)=(\sinh v-v)/v^3\) gives the
analytic tails used by the code. Tracelessness gives
\((3V^2+W^2)/2\) from the axial eigenvalue \(V\) and
transverse difference \(W\), as used in each signed density.

I evaluated the fixed input in floating point with the raw
coframe formulas, without calling the regularized evaluator.
Both 96- and 192-point Gauss rules gave
\((E_+,E_-,e)/\pi^2=(5.0498999132,10.0498999132,7.5498999132)\).
The sampled scalar minimum was \(2.6695890172\).
These are diagnostic values. The signed difference of \(-5\pi^2\)
also agrees with the independently fixed boundary eta and signature
zero. I did not rerun the E17 floating search.

The [integer interval certificate](../numerics/triaxial_certificate.py)
ran separately. The disk is partitioned into 16,384 closed dyadic
cells, with intermediate endpoints on the \(2^{-96}\) grid.
Integer product and reciprocal bounds round in the correct
directions. The square-root integer operations enclose \(A\);
the logarithm uses \(2\operatorname{artanh}(1/2)\), with tail at
most \(4/3\) of its first omitted positive term. For each hyperbolic
series the code checks \(v^2\le4\) and the omitted term ratios
are below \(1/2\), making the asserted tail majorant valid.
Summing cell ranges times their widths encloses the normalized
density integrals. The reproduced values were
\(p\ge0.7597\), \(R\ge2.6306\), and
\[
 E_+/\pi^2\in[5.0412,5.0586],\qquad
 E_-/\pi^2\in[10.0406,10.0592],\qquad
 e/\pi^2\in[7.5423,7.5575].
\]
The normal derivative jets give a totally geodesic boundary
and the strict scalar sign gives the positive Neumann conformal
Laplacian sign. The larger signed energy alone is above the
strict closed wall for this cap in either orientation.
It remains only a proved finite upper bound on
\(F_W(h_{\sqrt3})\). Together with the order-two cover's
lower bound the interval is \([8/3,7.5575]\pi^2\), with
the paired threshold at \(4\pi^2\). This interval does not
decide the infimum.

## Scope of T3 and another bounded route

The hypotheses for the routes in the T3 impasse are separate.
The Fuchsian free group calculation concerns a specific whole
exterior. The native nonabelian examples have actual peripheral
representations and recognized closings, while the geometric round
fiber connection germs are still absent. A positive exterior Weyl
budget under positive doubling leaves the marked closing question
and does not encompass general nonumbilic seams. The smooth
quaternionic gluing calculation applies when both sides really
are standard disk bundles. A knotted complement may have different
interior geometry or topology. On the quaternionic datum in
question the order-two cover doubles to a positive class on
\(S^2\times S^2\), with its signed energies \(4e_W\).
The positive-double inequality gives \(e_W\ge8\pi^2/3\).
Combining the difference \(5\pi^2\) with \(e_W<4\pi^2\)
gives the impasse's respective signed intervals
\([\pi^2/6,3\pi^2/2)\) and \([31\pi^2/6,13\pi^2/2)\).
The available hypotheses thus rule out a half-flat positive
double at this datum without ruling out a qualifying cap.

The round matrix chamber supplies a different input from the
polynomial search. Keep its conformally flat interior up to a
specified principal leaf and change the outer band to meet a
totally geodesic short-axis Berger face. The Berger ratio could
vary in its eta-admissible positive interval if testing the
full paired problem. An infinitesimal version in the
orbit-diagonal class fails under uniformly controlled metric
and shape. In the
round chamber with \(s\) arclength outward from the \(i\) bolt,
the distinct-eigenvalue differences give
\[
 l_i=4\sin s,\qquad l_j=4\sin(\pi/3-s),\qquad
 l_k=4\sin(\pi/3+s).
\]
Thus at the midpoint \(s=\pi/6\) the lengths are \((2,2,4)\)
and \(k^\circ=(\sqrt3,-\sqrt3,0)\). From the raw formula let
\(\mathcal E_i=(A_i+T_i)/2-R/12\) be the common electric
part of the chiral entries. Then
\(\mathcal E=-\tfrac12(k^\circ)'+G\), where
\(G=\tfrac12(T_i-k_i^2)^\circ\) in the diagonal frame.
If the lengths stay bounded above and away from zero and
the \(k_i\) stay bounded through a band of width \(\epsilon\),
then \(|G|\le C\) and \(l_1l_2l_3\ge v_{\min}>0\) with
uniform constants. The zero outer shape and Cauchy–Schwarz give
\[
\frac{e_{\rm band}}{\pi^2}
\ge \frac{v_{\min}}{4\epsilon}
  \bigl(|k^\circ_{\rm inner}|/2-C\epsilon\bigr)_+^2 .
\]
Indeed the mean of the two squared chiral norms is
\(|\mathcal E|^2+|M|^2\) and the integral of
\(-\tfrac12(k^\circ)'\) is \(k^\circ_{\rm inner}/2\).
The bound diverges as a controlled band shrinks to the
round midpoint. A finite-width profile with the exact inner
round germ is a concrete alternate test with available data.
It could address realization on the standard switched pair
and is distinct from finding a new marked complement.
No finite-width optimization is included in this replay.
