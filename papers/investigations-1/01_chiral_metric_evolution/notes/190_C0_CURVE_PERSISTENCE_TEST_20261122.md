# E190 Compact fixed-point test for \(C^0\) curve persistence

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Fixed E proof test under B93, configured
gpt-6.2-sol/ultra. Independent runtime and lead-model attestation
unavailable. I authored the inherited E186 source audit. B93 supplies the
fixed strategy. This note verifies that strategy at the single-curve
boundary. No manuscript or canonical reference artifact was edited.

## Result

The B93 construction closes. Fix a smooth six-dimensional real manifold
\(Z\), a smooth almost complex structure \(J_0\), and a smooth embedded
regular \(J_0\)-holomorphic sphere \(u_0:(S^2,j)\to Z\).
Use the given compact neighborhood of its image and fixed smooth
auxiliary metrics and connection. Let \(E=u_0^*TZ\) and
\[
 D_0:W^{1,8}(E)\longrightarrow
       Y=L^8(\operatorname{Hom}_{\overline{\mathbb C}}(TS^2,E))
\]
be the supplied linearization, with bounded linear right inverse
\(Q_0\). The target anti-linearity uses \(j\) and \(J_0(u_0)\).
There are fixed \(r,\epsilon>0\) such that every smooth \(J'\)
with \(\|J'-J_0\|_{C^0}<\epsilon\) on the neighborhood admits a
smooth nonconstant \(J'\)-holomorphic map \(u_\xi\) from the same
sphere, homotopic to \(u_0\) and represented by a section \(\xi\)
of \(W^{1,8}\) norm at most \(r\). The choice of \(\epsilon\)
does not use derivatives of \(J'\). The proof supplies existence
and individual smoothness; it requires no regularity estimate
uniform over the perturbing structures.

## A fixed target with the exact linearization

For the auxiliary metric exponential and radial transport with
the fixed auxiliary connection, write
\[
 u_\xi(x)=\exp_{u_0(x)}\xi(x),\qquad
 L_\xi(x):E_x\longrightarrow T_{u_\xi(x)}Z .
\]
Use a common small smooth radial domain over the compact zero
section where each fiber exponential has a smooth inverse onto
its image and all paths stay in the interior of the chosen
neighborhood. Here and below \(\xi\) uses its continuous
representative given by \(W^{1,8}\) on the two-dimensional domain.
Smooth coefficients of the exponential and its partial
derivatives are bounded on the closed smaller radial domain.
These choices involve the background and \(u_0\).

For a complex structure \(K\) on \(E_x\), the real linear operator
on \(\operatorname{Hom}_{\mathbb R}(T_xS^2,E_x)\)
\[
 P_K a=\tfrac12(a+Ka j)
\]
is a projection onto \(K\)-anti-linear homomorphisms, since
\(a\mapsto Ka j\) is an involution. Put
\(K_{J,\xi}=L_\xi^{-1}J(u_\xi)L_\xi\) and \(K_0=J_0(u_0)\).
Then
\(\zeta_{J,\xi}=L_\xi^{-1}\bar\partial_J u_\xi\)
lies in \(\operatorname{ran}P_{K_{J,\xi}}\) almost everywhere.
Define the fixed-target residual
\[
 F_J(\xi)=P_{K_0}\zeta_{J,\xi}\in Y .
 \tag{1}
\]
The uniform comparison of projections is
\[
 \|P_{K_{J',\xi}}-P_{K_0}\|_\infty
   \le c\bigl(\|\xi\|_\infty+\|J'-J_0\|_{C^0}\bigr).
\]
Indeed the \(J_0\) contribution is a smooth function of the fiber
variable \(\xi\), and the perturbation contribution is conjugation
of \((J'-J_0)(u_\xi)\) by uniformly bounded transports. The
estimate also holds for \(J'=J_0\). Choose parameters below so
this difference has norm less than \(1/2\). If \(a\) lies in
\(\operatorname{ran}P_{K_{J',\xi}}\) and \(P_{K_0}a=0\), then
\(a=(P_{K_{J',\xi}}-P_{K_0})a\), hence \(a=0\). Therefore
\(F_{J'}(\xi)=0\) gives the full geometric Cauchy–Riemann
equation almost everywhere.

At \(\xi=0\) the unprojected pulled-back residual for \(J_0\)
vanishes, and \(L_0=\mathrm{id}\). Differentiating the transport
factor in the residual multiplies that zero. Differentiating
\(P_{K_{J_0,\xi}}\zeta_{J_0,\xi}=\zeta_{J_0,\xi}\) at zero
shows that its differential already lies in the fixed
anti-linear bundle. The differential of the geometric equation
at \(u_0\) is the supplied \(D_0\), because the differential
of the fiber exponential at the zero section is the identity.
Consequently \(DF_{J_0}(0)=D_0\). Equivalently this holds
first on smooth sections by differentiation and then on
\(W^{1,8}\) by the remainder estimate just below.

## The two remainder estimates

In local bundle coordinates the derivative of
\((x,e)\mapsto\exp_{u_0(x)}e\) gives \(du_\xi\) as a smooth
coefficient times \(\nabla\xi\), plus a smooth zeroth-order
term. Fixed bundle connection coefficients can be included
in the latter. In particular
\(\|du_\xi\|_8\le c(1+\|\xi\|_{W^{1,8}})\).
The residual has the affine-in-derivatives form
\[
 F_J(\xi)=a_J(x,\xi)\nabla\xi+b_J(x,\xi).
 \tag{2}
\]
The coefficients for \(J_0\) are smooth on the prescribed
small compact radial domain and \(b_{J_0}(x,0)=0\).
The coefficient of \(\nabla\xi\) in \(D_0\xi\) is
\(a_{J_0}(x,0)\), and its zeroth-order part is
\((\partial_e b_{J_0})(x,0)\xi\). Taylor's estimates give
pointwise bounds \(c|\xi|\) on the difference of the
leading coefficients and \(c|\xi|^2\) on the zeroth-order
remainder. Taking \(L^8\) norms in finitely many smooth
fixed trivializations gives
\[
 \|F_{J_0}(\xi)-D_0\xi\|_8
      \le C\|\xi\|_{C^0}\|\xi\|_{W^{1,8}} .
 \tag{3}
\]
The exact perturbation is
\[
 F_{J'}(\xi)-F_{J_0}(\xi)
   =\tfrac12 P_{K_0}L_\xi^{-1}
                  (J'-J_0)(u_\xi)\,du_\xi j .
\]
Thus the same fixed choices give
\[
 \|F_{J'}(\xi)-F_{J_0}(\xi)\|_8
   \le C\|J'-J_0\|_{C^0}(1+\|\xi\|_{W^{1,8}}) .
 \tag{4}
\]
These are the B93 estimates; neither differentiates \(J'\).
The form of the difference agrees with Fine's (3)–(4)
after the fixed projection. Fine's (5) instead estimates
the derivative of that difference for an implicit-function
argument, and uses the derivative of the perturbation.
[Fine v2, Proposition 7, (3)–(5) and Remark 5](https://arxiv.org/html/1602.03829v2).

## Compact \(C^0\) self-map and fixed point

The bounded operator \(Q_0D_0\) on \(W^{1,8}(E)\) is a
projection with range \(X=\operatorname{ran}Q_0\) and
kernel \(\ker D_0\), by \(D_0Q_0=I_Y\). Thus \(X\) is a
closed linear complement and weakly closed. Set
\[
 \mathcal B_r=\{\xi\in X:\|\xi\|_{W^{1,8}}\le r\}
                  \subset C^0(E).
\]
For a finite smooth trivializing cover of \(S^2\), the
local \(W^{1,8}\) Morrey estimate gives a bounded
\(C^{0,3/4}\) norm on smaller disks. Arzelà–Ascoli gives
relative compactness in \(C^0(E)\). To check closedness
in this ambient space, suppose \(\xi_n\in\mathcal B_r\)
converges uniformly to \(\xi\). Reflexivity gives a
subsequence weakly convergent in \(W^{1,8}\).
Its weak limit is \(\xi\) by uniform convergence and
distribution testing. The weakly closed range and
weak lower semicontinuity of the norm give
\(\xi\in\mathcal B_r\). Thus the ball is a nonempty,
compact and convex subset of the Banach space \(C^0(E)\).
There is no use of a projection from \(C^0(E)\) onto \(X\).
[Laugesen, Theorem 3.22](https://publish.illinois.edu/rlaugesen/files/2023/07/554-Lectures.pdf).

For fixed \(J'\) define
\[
 \mathcal T(\xi)=-Q_0(F_{J'}(\xi)-D_0\xi).
\]
Let \(M_8\) be the \(W^{1,8}\to C^0\) norm. First take
\(r>0\) so small that \(M_8r\) fits the radial margin,
\(cM_8r<1/4\) in the fixed target projection bound, and
\(\|Q_0\| C M_8r\le1/4\). Also take \(M_8r<d_0/4\),
where \(d_0>0\) is the auxiliary diameter of the
image of \(u_0\). Then take \(\epsilon>0\) with
\(c\epsilon<1/4\) and
\(\|Q_0\| C\epsilon(1+r)\le r/4\).
Equations (3)–(4) give
\(\|\mathcal T(\xi)\|_{W^{1,8}}\le r/2\) on \(\mathcal B_r\),
and the range lies in \(X\).

Suppose \(\xi_n\to\xi\) in \(C^0\) within the ball.
The complete sequence converges weakly in \(W^{1,8}\):
every subsequence has a weakly convergent subsubsequence,
whose only possible limit is \(\xi\). For this fixed
smooth \(J'\), all coefficients \(a_{J'},b_{J'}\) in (2)
converge uniformly upon replacing \(\xi_n\) by \(\xi\).
The same holds on finite charts with the fixed connection
included in (2). For an \(L^{8/7}\) test section, multiplication
by the leading coefficient difference tends to zero in
\(L^{8/7}\). The uniform \(L^8\) gradient bound and weak
gradient convergence therefore give
\(F_{J'}(\xi_n)\rightharpoonup F_{J'}(\xi)\) in \(L^8\).
The linear term \(D_0\xi_n\) also converges weakly.
Bounded linear \(Q_0\) gives weak \(W^{1,8}\) convergence
of the images, and compact embedding then gives uniform
convergence of the images to \(\mathcal T(\xi)\).
Indeed each subsequence has a uniformly convergent
subsubsequence whose uniform limit is that same weak
limit. This proves continuity in the metric of \(C^0(E)\).
It uses uniform continuity of the coefficients for each fixed
\(J'\), with no common modulus across \(J'\) required.

The image of \(\mathcal T\) lies in the compact ball just
proved. Thus it is a compact continuous self-map in the
sense of Laugesen §1.5. All premises of Theorem 1.17 apply.
Schauder gives a fixed point. Applying \(D_0\) to its
identity and using \(D_0Q_0=I_Y\) gives \(F_{J'}(\xi)=0\).
The injectivity check for (1) then gives the full weak
equation. [Laugesen, §§1.5 and 1.7](https://publish.illinois.edu/rlaugesen/files/2023/07/554-Lectures.pdf).

## Individual regularity from the full weak equation

Work on a domain coordinate disk with \(j\partial_x=\partial_y\),
shrunk so the continuous map \(u=u_\xi\) takes values in one
target chart. Viewing it as a real vector-valued \(W^{1,8}\)
map, the full equation is \(u_y=a u_x\), with
\(a(x,y)=J'(u(x,y))\), \(a^2=-I\).
Here \(a\) is continuous and in \(W^{1,8}\) by smooth
composition and the first weak chain rule. Local bounds
may depend on this individual \(J'\).

The constant coefficient estimate needed below is the following:
for a constant matrix \(a_*\) with \(a_*^2=-I\), and
compactly supported \(w\in W^{1,4}(\mathbb R^2)\),
\[
 \|\nabla w\|_4\le c_*\|(\partial_y-a_*\partial_x)w\|_4 .
 \tag{5}
\]
The multiplier verification is supplied below. Choose an
interior point, take \(a_*\) to be \(a\) there, and shrink
a disk so \(\|a-a_*\|_\infty<1/(2c_*)\) there.
Choose a cutoff \(\eta\) supported strictly inside that disk
and equal to one on a smaller disk. For \(|h|\) below the
margin, let \(w_h=\delta_hu\) in either coordinate
direction \(e\). Subtracting the equations at the shifted
and unshifted points gives, almost everywhere,
\[
 (\partial_y-a_h\partial_x)w_h=(\delta_h a)u_x,\qquad
 a_h(x)=a(x+he).
\]
Testing the fixed coefficient operator on the compactly
supported \(\eta w_h\) gives
\[
 (\partial_y-a_*\partial_x)(\eta w_h)
   =(a_h-a_*)\partial_x(\eta w_h)
     +\eta(\delta_h a)u_x
     +(\partial_y\eta-a_h\partial_x\eta)w_h .
 \tag{6}
\]
This identity needs only first weak derivatives for each
fixed nonzero \(h\). The local difference quotient bounds
\(\|\delta_h a\|_8\le\|\nabla a\|_{8,\mathrm{larger}}\)
and \(\|w_h\|_4\le\|\nabla u\|_{4,\mathrm{larger}}\) follow
by integration along segments or cutoff and the Sobolev
difference quotient estimate. The second term in (6) is
bounded in \(L^4\) by Hölder with exponents \(8,8\).
The last term is also bounded in \(L^4\).
Apply (5) and absorb the first term to obtain a bound
on \(\nabla(\eta w_h)\) in \(L^4\) independent of \(h\).
In the smaller disk this bounds both difference quotients
of each first derivative of \(u\) in \(L^4\). Weak compactness
as \(h\to0\) and testing against smooth compact supports
identify their limits as the second distribution derivatives.
Therefore \(u\in W^{2,4}_{\mathrm{loc}}\).
[Laugesen, Proposition 5.7(i)–(ii)](https://publish.illinois.edu/rlaugesen/files/2023/07/554-Lectures.pdf).

At this regularity one can differentiate \(u_y=a u_x\)
and \(u_x=-a u_y\). The product rule and cancellation of
mixed derivatives give
\[
 \Delta u=(\partial_y a)u_x-(\partial_x a)u_y .
 \tag{7}
\]
Both product rules are justified in the weak Sobolev
spaces. In two dimensions \(W^{1,4}\) embeds in
\(L^\infty\) locally. If \(u\in W^{m,4}_{\mathrm{loc}}\) for
\(m\ge2\), smooth composition gives \(a\in W^{m,4}_{\mathrm{loc}}\)
and the right side of (7) belongs to
\(W^{m-1,4}_{\mathrm{loc}}\). To see the needed product
bounds, every derivative of order at most \(m-2\) of
\(Da\) and \(Du\) is locally bounded by Morrey. In the
highest derivative product at most one factor carries
\(m-1\) derivatives and that factor is in \(L^4\).
The composition rule follows in the same way by the chain
rule, with at most one top derivative of \(u\) in \(L^4\).

Cut off \(u\) in a larger disk, use the Laplacian product
rule, and apply the elementary \(L^4\) second-derivative
estimate below to each derivative of the cutoff map up
to order \(m-1\). Its Laplacian is in \(L^4\) by (7);
the cutoff terms involve at most \(Du\) and fixed smooth
factors. Approximation by mollification gives the same
estimate for the compactly supported weak derivatives.
This gains one Sobolev order on every smaller disk.
Iteration and Morrey embedding make \(u\) smooth there,
hence on \(S^2\), and the equation now holds everywhere.
All regularity disk sizes and constants can depend on the
individual \(J'\) without affecting \(r,\epsilon\).

### Constant coefficient \(L^4\) estimates

Here is a direct verification of (5) and the Laplacian
estimate used in the bootstrap. Let \(H\) on the real line
have multiplier \(-i\operatorname{sgn}\xi\).
For real Schwartz \(f\), \(Hf\) belongs to \(L^2\cap L^\infty\)
by Plancherel and the \(L^1\) Fourier transform bound.
The function \(f+iHf\) has nonnegative Fourier support,
as does its square by convolution, and the square is
in \(L^2\). Therefore the imaginary part of the square
is \(H\) of its real part. In other words
\(2fHf=H(f^2-(Hf)^2)\). Apply \(H\) and use \(H^2=-I\)
and its \(L^2\) isometry to obtain
\[
 \|Hf\|_4^2
  =\|f^2+2H(fHf)\|_2
  \le\|f\|_4^2+2\|f\|_4\|Hf\|_4 .
\]
Thus \(H\) is \(L^4\)-bounded by density. The same bound
holds for directional Hilbert transforms \(H_\omega\)
on \(\mathbb R^2\) by slicing and the rotation covariance.
Averaging \(\omega_j H_\omega\) over the unit circle
with coefficient \(1/4\) gives the Riesz transform \(R_j\)
with multiplier \(-i\xi_j/|\xi|\). In fact
\(\int_{S^1}\omega\operatorname{sgn}(\omega\cdot\xi)\,d\omega
=4\xi/|\xi|\), by rotation and the integral of the
absolute cosine. This average is bounded in \(L^4\) by
the directional bounds. It can be taken in \(L^4\)
because rotations act strongly continuously there and
conjugate a fixed bounded directional transform.
The multiplier identity follows first in \(L^2\) and
then agrees on dense inputs with the \(L^4\) operator.

In two dimensions
\((\partial_y+a_*\partial_x)(\partial_y-a_*\partial_x)=\Delta\).
For smooth compactly supported \(w\), Fourier transformation
therefore gives
\[
 \partial_j w=-R_jR_yD_*w-a_*R_jR_x D_*w,\qquad
 \partial_j\partial_k w=-R_jR_k\Delta w,\qquad
 D_*=\partial_y-a_*\partial_x .
\]
The matrix is fixed, so these componentwise bounds prove
(5) and \(\|D^2 w\|_4\le c\|\Delta w\|_4\).
The first extends to compactly supported \(W^{1,4}\)
by mollification. For the second, if a compactly supported
\(W^{1,4}\) function has distribution Laplacian in \(L^4\),
mollifying bounds its second derivatives in \(L^4\) uniformly.
Weak passage identifies the second derivatives of the
original function. These arguments supply the precise
regularity input for (6)–(7) without importing a variable
coefficient regularity theorem.

## Homotopy, nonconstancy, and source boundary

The path \(u_{t\xi}\), \(0\le t\le1\), stays in the same
radial domain and is a homotopy to \(u_0\). For two points
whose images under \(u_0\) attain the positive diameter
\(d_0\), the auxiliary distances from \(u_\xi\) to their
unperturbed images are at most \(M_8r<d_0/4\), by the
auxiliary path lengths. Thus their images under \(u_\xi\)
are separated by more than \(d_0/2\), proving nonconstancy.

On 22 November 2026 I reopened Fine arXiv:1602.03829v2,
posted 15 November 2016, Remark 5 and Proposition 7
(3)–(5), printed pp. 4 and 7–8 in the previously checked
preprint. These locate Fine's \(C^1\) hypothesis. The
\(C^0\) compact-map construction and individual regularity
above are this branch derivation.
[Fine v2 HTML](https://arxiv.org/html/1602.03829v2).

I verified Richard S. Laugesen's author-hosted
*Linear Analysis and Partial Differential Equations*
lecture notes, title-page date 22 December 2020. The
checked inputs are §1.5's compact-map definition,
printed p. 18 / PDF index 17, §1.7 Theorem 1.17 and proof,
printed pp. 23–24 / indices 22–23, Theorem 3.22's
\(W^{1,p}\to C^{0,1-N/p}\) estimate for \(p>N\) on
smooth bounded chart disks, printed p. 71 / index 70,
and Proposition 5.7's difference quotient bounds and
weak derivative implication for \(1<p<\infty\),
printed pp. 110–111 / indices 109–110. These are selected
passages, with the nonlinear \(L^4\) absorption and bootstrap
given above. The inherited Taylor PDF was probed for a direct
\(L^4\) estimate but no Taylor result was imported. No source
copy was retained.
[Laugesen author PDF](https://publish.illinois.edu/rlaugesen/files/2023/07/554-Lectures.pdf).
[Canonical R39](../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r39--laugesen-schauder-fixed-point-input).

This completes the single-curve proof test, awaiting
independent audit and lead assessment. It does not assert
uniqueness, smooth dependence, uniform higher estimates,
prelimit metric taming, or a bubble exclusion theorem.

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E190 request v1](../research-progress/handoffs/SP4-CME-E190_REQUEST_v1.md) | 66e5c48eb1f5e8645d0a23c7600eacb0c3ba97f26393864a2f83a86d236f5701 |
| [B93](../brainstorm/notes/B93_WEAK_COMPACT_CURVE_PERSISTENCE_20261122.md) | 4199ff5376d7d4cfb5c6555246089616f4e622ec28adb42ba07855d60e8f3c5b |
| [E186 assessment](../reviews/E186_TWISTOR_COMPARISON_ASSESSMENT_20261122.md) | aabd5b851a0373d8d2331a5ace9035a634eb2933d7f731632255780d08901f65 |
| [E186 source audit](../reviews/E186_TWISTOR_LIMIT_SOURCE_AUDIT_20261122.md) | 31ead6b42eff300f3afb0633e802ba3ba75f15e69a431cc5fc656003bc4f4c6e |
