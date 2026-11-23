# E252 — Conditional crossing of a prescribed strict ratio cap

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E work under B114, configured
gpt-6.2-sol/ultra. Selected-lead settings and independent runtime
attestation are unavailable. I authored the inherited E235, E245
and E250 implications. This packet supplies the new continuity
argument under the frozen family hypothesis.

## Hypothesis and result

Fix \(r_0>1\). Work on the supplied smooth closed oriented real
standard \(S^4\), with its positive round-compatible chiral
\(SO(3)\) bundle. Let \(E\) be the oriented Euclidean rank-three
bundle and \(P\) its frame bundle. Use Fine's native internal
pairing, reconstructed Riemannian metric \(g_A\), and native
time \(\tau\). The curvature quotient \(Q_A\) is positive
symmetric of trace three and
\(\rho_A=\lambda_{\max}(Q_A)/\lambda_{\min}(Q_A)\).

Assume \(H_{\rm family}\). On a compact interval \(I\) containing
\(r_0\) in its interior, the smooth positive definite
round-compatible initial connections \(A_r\) form a \(C^\infty\)
family with uniform spatial derivative bounds. Each has
\(\sup_{S^4}\rho_{A_r}=r\) uniquely at the same \(x_0\), and its
native original log-ratio directional derivative there is \(1/2\).
This premise remains pending E251 in this packet. The distinct
fixed-ratio assessment provides individual data and their
closed-cap crossings. [B114](../brainstorm/notes/B114_PRESCRIBED_STRICT_CAPS_20261123.md)
· [E248–E250 assessment](../reviews/E248_E250_FIXED_RATIO_CAP_ASSESSMENT_20261123.md).

Under this hypothesis there are an interval \(J\subset I\) about
\(r_0\) and a \(T>0\) on which the unique smooth original solution
\(B_r(\tau)\) through \(A_r\) exists for each \(r\in J\), smoothly
up to time zero. The original curvatures are continuous in \(r\)
in \(C([0,T],C^0)\) with respect to a fixed bundle background.
For some \(\tau_*\in(0,T)\), every \(r<r_0\) sufficiently close
to \(r_0\) has
\[
 \sup_{S^4}\rho_{B_r(0)}=r<r_0
   <\rho_{B_r(\tau_*)}(x_0)
   \leq \sup_{S^4}\rho_{B_r(\tau_*)}.
 \tag{1}
\]
In particular the strict cap at the prescribed \(r_0\) fails to be
forward invariant. The result applies at each \(r_0\) where
\(H_{\rm family}\) holds.

## One fixed cutoff and a common time

Use \(\bar A=A_{r_0}\), \(\bar g=g_{\bar A}\) and the E29 corrected
adjusted equation for \(a_r=\widehat B_r-\bar A\).
Fix the compatible reference covariant derivative \(D\) on
\(\mathcal W=T^*S^4\otimes\mathfrak{so}(E)\), and take all norms
for differences, including \(L^2\), from these fixed smooth
backgrounds. Write
\[
 \Lambda=(I+D^*D)^{1/2},\qquad
 j^1a=(a,Da),\qquad
 \|a\|_{s,\Lambda}=\|\Lambda^s a\|_2 .
\]
The physical gradient and horizontal adjustment still use the
live reconstructed metric in their adjoints. Only the base metric
in the vertical adjustment is frozen, as in E28 and E29.
[E28, (1)](28_FIXED_GAUGE_CORRESPONDENCE_20261122.md)
· [E29, (1)–(2)](29_LOCAL_PARABOLIC_INPUT_20261122.md).

At the single reference zero jet the E29 symbol estimate gives
a strict positive lower bound for the negative Hermitian part of
the Fourier symbol on the compact unit cosphere and unit
amplitude bundle. Smooth coefficients and compactness give
a uniform first-jet neighborhood with this bound weakened by
at most a fixed factor and with positive definiteness and the
same sign. Choose the E29 jet cutoff supported there and equal
to one on \(|j^1a|_{\bar g}\leq\eta\) for some \(\eta>0\).
The cutoff extends the principal coefficient by interpolation
to \(\bar g^{ij}I\), keeping uniform parabolicity. Denote the
extended equation by
\[
 \partial_\tau a
   = L^{ij}(x,j^1a)D_iD_j a + c(x,j^1a).
 \tag{2}
\]
All choices in (2) are fixed at \(r_0\). [E29, reference symbol
and compact-bundle proof](29_LOCAL_PARABOLIC_INPUT_20261122.md).

In dimension four there is a fixed constant \(C_{\rm emb}\)
such that \(\|j^1a\|_\infty+\|a\|_{C^2}
\le C_{\rm emb}\|a\|_{6,\Lambda}\). Choose \(b_*>0\) so
\(C_{\rm emb} b_*<\eta\). Since \(A_r-\bar A\to0\) in \(H^6\),
shrink to a compact interval \(J\) with \(r_0\) in its interior and
\(\|A_r-\bar A\|_{6,\Lambda}\le b_*/2\) on \(J\). In particular
all nearby initial jets are in the same uncut parabolic
neighborhood. For the fixed spectral projection \(J_N\) used
in E29, contractivity in graph norms gives the same bound
for \(a_{r,N}(0)=J_N(A_r-\bar A)\).

Put \(Y_{r,N}=\|a_{r,N}\|_{6,\Lambda}^2\) for the projected solution.
On the bootstrap region \(Y_{r,N}\le b_*^2\), the E29 energy
estimate (3) gives
\[
 Y_{r,N}'\le K_6(1+Y_{r,N})
\]
with finite \(K_6\) independent of \(r,N\). The uniform \(C^2\)
bound controls the spatial \(C^1\) coefficients and the tame
constants in that estimate. For example take
\[
 T_0=\min\left\{1,\frac{b_*^2}
 {4\max(1,K_6)(1+b_*^2)}\right\}.
\]
Integrating the upper bound \(K_6(1+b_*^2)\) up to a potential
first exit gives \(Y_{r,N}\le b_*^2/2\) up to \(T_0\).
Continuation of the finite-dimensional ODE on its bounded
ball precludes a shorter projected lifespan. This proves the
bootstrap uniformly.

For every even \(s\ge6\), the same estimate with \(s\) gives
\[
 \sup_{0\le\tau\le T_0}\|a_{r,N}(\tau)\|_{s,\Lambda}^2
  +\int_0^{T_0}\|a_{r,N}(\tau)\|_{H^{s+1}}^2\,d\tau
 \le C_s
 \tag{3}
\]
uniform in \(r,N\), because the coefficient constants depend on
the common \(C^2\) bound and the smooth family bounds the initial
\(H^s\) norms. From (2) with the projection applied, the chain
and product bounds on these smooth bounded jets also give
uniform \(\|\partial_\tau a_{r,N}\|_{L^\infty H^{s-2}}\).
Compactness as in E29 yields, for each \(r\), convergence of a
subsequence in \(C([0,T_0],H^{s-1})\) for every even \(s\), on
this one interval. E29 passes (2) and the strong smooth trace
to the resulting solution. Its time regularity through zero
follows from (2) and the continuous traces in each spatial
Sobolev space. In particular the graph \(H^6\) bound passes
using the strong limit with \(s=8\). Thus all solution jets stay
where the cutoff is one, by \(C_{\rm emb}b_*<\eta\). This
removes the cutoff on the common interval and retains definite
round-compatible reconstructed geometry. Each parameter may
use its own Galerkin subsequence. The adjusted uniqueness
and quantitative difference estimate apply to the resulting
solutions. [E29, (3) and compactness](29_LOCAL_PARABOLIC_INPUT_20261122.md)
· [Local flow assessment](../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md).

## Adjusted continuity from differences

For \(r,s\in J\), subtract (2) for the actual solutions and
write \(w=a_r-a_s\). The terms from changing \(L\) factor as
the first-jet difference times \(D^2a_s\). The terms from
changing \(c\) factor in the same first-jet difference. The
mean value formula gives an equation
\[
 \partial_\tau w=L_r^{ij}D_iD_jw+B_{rs}^iD_iw+C_{rs}w,\qquad
 L_r^{ij}=L^{ij}(x,j^1a_r).
\]
The \(L_r^{ij}\) have uniform \(C^1\) bounds and a uniform
Hermitian margin. The \(B_{rs}^i,C_{rs}\) have uniform \(L^\infty\)
bounds from the bounded \(C^2\) norms and the fixed smooth
coefficient derivatives on the first-jet balls. The E29
localized \(L^2\) Gårding estimate therefore has uniform
constants. Pairing with \(w\) and absorbing a small multiple
of \(\|Dw\|_2^2\) from the first-order terms gives
\[
 \frac{d}{d\tau}\|w\|_2^2+c_1\|Dw\|_2^2\le C\|w\|_2^2 ,
 \qquad
 \sup_{0\le \tau\le T_0}\|w(\tau)\|_2
 \le e^{CT_0/2}\|A_r-A_s\|_2 .
 \tag{4}
\]
For any fixed integer \(k\ge0\) take an even \(m>\max(k,5)\).
The fixed Sobolev interpolation inequality and (3) imply
\[
 \sup_{0\le\tau\le T_0}\|w(\tau)\|_{H^k}
 \le C_{k,m}\|A_r-A_s\|_2^{\,1-k/m}.
 \tag{5}
\]
Consequently the adjusted family is continuous in
\(C([0,T_0],H^k)\) for every fixed \(k\), and hence in
\(C([0,T_0],C^q)\) for every fixed integer \(q\). Equation (2)
also bounds the first time derivatives uniformly in each
spatial \(C^q\) norm and makes their differences tend to zero
there, using the \(C^{q+2}\) convergence and fixed higher bounds.
In particular the needed spatial continuity holds uniformly
down to time zero.

## Original continuity through recovery

On the compact frame bundle \(P\), write
\(\mathsf S_B(u)=\iota_uF_B\) and
\(\chi_B(u)\) for the \(B\)-horizontal lift. The generator kept
at the same reference \(\bar A\) is
\[
 \xi(B)=-d_B^{*\bar g}(B-\bar A)
 -\chi_B\!\left(\mathsf S_B^* d_B^{*g_B}d_B(B-\bar A)\right).
 \tag{6}
\]
It is a smooth expression of spatial order at most two on
the fixed admissible tube. The curvature, reconstructed metric
and \(d_B(B-\bar A)\) depend on at most the first jet. In the
horizontal term one derivative falls on the first-jet form or
a live metric coefficient. The contraction, its adjoint and
the horizontal lift are algebraic in these jets. The vertical
term differentiates \(B-\bar A\) once in the fixed base
metric. Using any fixed auxiliary smooth metric on \(P\),
the vector fields \(X_r(\tau)=-\xi(\widehat B_r(\tau))\) are
smooth through zero, uniformly bounded in \(C^2(P)\), and
\[
 \lim_{r\to s}\sup_{0\le\tau\le T_0}
     \|X_r(\tau)-X_s(\tau)\|_{C^1(P)}=0
\]
by the adjusted \(C^3\) convergence and uniform \(C^4\) bound.
These are background norms on \(P\).

Let \(j_r\) solve
\(\partial_\tau j_r=X_r\circ j_r\), \(j_r(0)=\mathrm{id}_P\).
The vector fields are right \(SO(3)\)-invariant and smooth on
the compact bundle. Flow uniqueness gives equivariance and
each \(j_r\) is a bundle automorphism covering a base
diffeomorphism isotopic to the identity. Compactness supplies
existence on the
prescribed short interval. For the \(C^1\) comparison, take
nested coordinate balls with the smaller balls covering \(P\).
A common shortening to \(0<T\le T_0\), using the uniform speed
bound and the finite chart margins, keeps the trajectories
from each small ball in its larger coordinate ball for
\(0\le\tau\le T\). In these coordinates the difference of
trajectories from the same point bounds as
\[
 |\partial_\tau(j_r-j_s)|\le
     \|X_r-X_s\|_{C^0}+C|j_r-j_s|.
\]
For the initial-point derivative \(U_r=Dj_r\),
\(\partial_\tau U_r=(DX_r)(\tau,j_r)U_r\) and \(U_r(0)=I\).
The uniform \(C^1\) field bound controls \(U_r\) uniformly.
Subtracting the derivative equations and using the uniform
\(C^2\) bound gives
\[
 |\partial_\tau(U_r-U_s)|\le
 C|U_r-U_s|+C\bigl(\|X_r-X_s\|_{C^1}+|j_r-j_s|\bigr).
\]
Gronwall for both inequalities in the finite charts proves
\(j_r\to j_s\) in \(C([0,T],C^1(P))\).

Define \(B_r=j_r^*\widehat B_r\), with the time variable
unchanged. In the E28 sign convention the adjusted equation is
\(\partial_\tau\widehat B_r=v(\widehat B_r)
-R(\xi(\widehat B_r),\widehat B_r)\) and
\(\mathcal L_{-\xi(B)}B=R(\xi(B),B)\) by covariant Cartan.
Thus the derivative of \(j_r^*\widehat B_r\) cancels the
adjustment and gives \(v(B_r)\), with \(B_r(0)=A_r\) and
smoothness through zero. Original uniqueness is the assessed
E28/E29 uniqueness with each individual initial datum as
reference for the reverse comparison. [E28, (7)–(8)](28_FIXED_GAUGE_CORRESPONDENCE_20261122.md)
· [E28/E29 assessment](../reviews/E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md).

The curvature forms on \(P\) satisfy
\(F_{B_r}=j_r^*F_{\widehat B_r}\).
The adjusted curvatures converge uniformly by \(C^1\)
convergence of the adjusted connections. The \(C^1\) convergence
of \(j_r\), uniform derivative bounds, and uniform continuity
of \(F_{\widehat B_s}\) on \([0,T]\times P\) then give uniform
convergence of the pulled-back forms, by the chain rule for
pullback. Restricting with fixed local sections of \(P\) gives
uniform convergence of the original base curvatures in the same
fixed background. The quotient is smooth on definite curvature
values. The limit for each \(s\) stays definite on the compact
space-time interval, so its eigenvalue floor is positive.
Min–max continuity of the extremal eigenvalues then gives
uniform continuity of \(\rho_{B_r}\) in the parameter at \(s\).

## Crossing at the prescribed threshold

At the boundary parameter \(r_0\), \(B_{r_0}\) has original
native initial derivative \(v(A_{r_0})\). The directional
derivative in \(H_{\rm family}\) therefore gives
\[
 \log\rho_{B_{r_0}(\tau)}(x_0)
    =\log r_0+\tau/2+o(\tau)
 \qquad(\tau\downarrow0).
 \tag{7}
\]
In detail the smooth original path is
\(A_{r_0}+\tau v(A_{r_0})+o_{C^1}(\tau)\). The curvature
map is smooth in the first jet and \(\log\rho\) is locally
Lipschitz in a positive quotient by min–max and its
positive eigenvalue floor. Thus the scalar log ratios of
this path and the affine tangent path differ by \(o(\tau)\).
This also justifies (7) directly if the stated derivative is
interpreted along the affine tangent. The clock here is
native, so the coefficient \(1/2\) is used without rescaling.
[E250, native recovery and derivative](250_CONDITIONAL_FIXED_CAP_LOCAL_FLOW_20261123.md).

Choose a fixed \(0<\tau_*<T\) small enough that
\(\rho_{B_{r_0}(\tau_*)}(x_0)>r_0\). By continuity of the
original curvature and quotient at this time, all \(r\in J\)
sufficiently close to \(r_0\) preserve the strict inequality
at the same original point. Since \(r_0\) is interior to \(J\),
there are parameters \(r<r_0\) in that neighborhood. Each
such datum starts with global supremum exactly \(r\), proving
(1). The flow comparison takes place at this one time
\(\tau_*\) and uses no derivative with respect to the parameter.
The constants and the interval may depend on \(r_0\) and the
supplied family.

The proof is conditional on \(H_{\rm family}\) and short-time
on the supplied standard sphere. The Fine v2 dependencies
are Proposition 4.2 and the action, gauge and recovery of
§4.2. The parabolic input remains Taylor's undated repaginated
author-hosted 1991 text, §7.3, printed pp. 147–149,
Propositions 7.3.A–B, through the assessed E29 compact-bundle
derivation. The Fine-cited Taylor 2011 Proposition 8.1
remains unverified. No new source retrieval was used.
[Canonical Fine and Taylor scope](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#fixed-ratio-cap-consumers--e248-through-e250).
