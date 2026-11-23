# E192 Independent audit of compact \(C^0\) curve persistence

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B93, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings are
unavailable. I authored related metric compactness inputs E162 and E165.
I did not author B93, E186, or E190. The check below independently
reconstructs E190's fixed-point and local regularity arguments.

## Disposition

**Mathematical pass, with a source-locator correction.** For the
supplied \(D_0:W^{1,8}\to L^8\) and bounded right inverse, the
fixed-point construction and individual smoothness both close.
The threshold depends on the fixed data and the \(C^0\) norm of
the perturbation. Regularity of each solution uses the smoothness
of its own \(J'\). Laugesen's compact-map definition is Definition
1.11 in **§1.6**, printed p. 18 / PDF index 17. Read §1.6 wherever
E190 and the E192 request designate §1.5 for that definition. The
fixed-point theorem remains §1.7, Theorem 1.17. This is the sole
correction. No extra analytic premise is needed under the stated
single-sphere hypotheses.

## Fixed target and exact estimates

Write \(B=W^{1,8}(S^2,E)\), where \(E=u_0^*TZ\). The closed
subspace \(Y\) of \(L^8\) is the bundle of anti-linear maps for
\(j,K_0=J_0(u_0)\). Let \(H(x,e)=\exp_{u_0(x)}e\) and let
\(L(x,e)\) be the fixed radial parallel transport. On a uniform
closed disk subbundle of small radius, these maps and the needed
derivatives of the fixed data are bounded. The image of the disk
stays in the interior of the compact neighborhood. In local
coordinates \(du_\xi=H_x(x,\xi)+H_e(x,\xi)\,d\xi\). For weak
sections this follows by smooth approximation in \(W^{1,8}\),
which converges uniformly by Morrey. Uniform convergence of the
coefficients and strong convergence of \(d\xi\) give the same
formula in \(L^8\).

If \(K^2=-I\), then \((a\mapsto K a j)^2=I\), and its \(+1\)
eigenspace consists of \(aj=-Ka\). Thus \(P_K=(I+K(\cdot)j)/2\)
projects onto the anti-linear space. The pulled-back residual
\(\zeta_{J,\xi}=L_\xi^{-1}\bar\partial_Ju_\xi\) lies in
\(\operatorname{ran}P_{K_{J,\xi}}\) for
\(K_{J,\xi}=L_\xi^{-1}J(u_\xi)L_\xi\). Smoothness of
\((x,e)\mapsto L(x,e)^{-1}J_0(H(x,e))L(x,e)\) and boundedness of
both transport factors give
\[
 \|P_{K_{J',\xi}}-P_{K_0}\|_\infty
 \le c\bigl(\|\xi\|_\infty+\|J'-J_0\|_{C^0}\bigr).
\]
If this norm is less than one, \(z=P_{K_{J',\xi}}z\) and
\(P_{K_0}z=0\) imply
\(\|z\|\le\|P_{K_{J',\xi}}-P_{K_0}\|\,\|z\|\) pointwise. Hence
the fixed-target equation \(F_{J'}=P_{K_0}\zeta_{J',\xi}=0\)
implies the entire almost-complex equation almost everywhere.

At zero the background residual vanishes because \(u_0\) is
\(J_0\)-holomorphic. The differential of transport times that
residual vanishes, and the differential of the exponential in
the fiber direction is the identity. Differentiation of
\(P_{K_{J_0,\xi}}\zeta_{J_0,\xi}=\zeta_{J_0,\xi}\) at zero puts
the differential in \(\operatorname{ran}P_{K_0}\). Thus the
projected differential is the given geometric linearization
\(D_0\) with the stated \(\frac12\) convention for
\(\bar\partial_J\).

For \(F_J=a_J(x,\xi)\nabla\xi+b_J(x,\xi)\), the coordinate
connection term is zeroth order. At \(J=J_0\), the leading
coefficient differs from its value at zero by \(O(|\xi|)\),
and \(b_{J_0}(x,\xi)-(\partial_e b_{J_0})(x,0)\xi=O(|\xi|^2)\).
The two \(L^8\) bounds are therefore
\[
 \|F_{J_0}(\xi)-D_0\xi\|_8\le C\|\xi\|_\infty\|\xi\|_B,\qquad
 \|F_{J'}(\xi)-F_{J_0}(\xi)\|_8
 \le C\|J'-J_0\|_{C^0}(1+\|\xi\|_B).
\]
The first follows by estimating one factor of each remainder
uniformly and the other in \(L^8\). For the second, the residual
difference is exactly
\(\frac12 P_{K_0}L_\xi^{-1}(J'-J_0)(u_\xi)\,du_\xi j\).
The chain formula above bounds \(du_\xi\) in \(L^8\) by
\(C(1+\|\xi\|_B)\). The first estimate also proves the claimed
Fréchet differential on \(B\), using \(\|\xi\|_\infty\le M_8\|\xi\|_B\).

## Compact self-map in ambient \(C^0\)

From \(D_0Q_0=I_Y\), \(Q_0D_0\) is a bounded projection on \(B\)
with range \(X=\operatorname{ran}Q_0\) and kernel \(\ker D_0\).
Write \(\mathcal B_r=\{\xi\in X:\|\xi\|_B\le r\}\).
Morrey on finitely many smooth smaller coordinate disks gives
the \(3/4\)-Hölder bounds for \(p=8\) in dimension two.
Arzelà–Ascoli on the finite cover gives relative compactness in
\(C^0(E)\). If a sequence in the ball has a uniform limit,
reflexivity of \(B\) gives a weakly convergent subsequence.
Distribution testing identifies its weak limit with the uniform
limit, the bounded projection preserves the weak range condition,
and weak lower semicontinuity preserves the radius. Thus
\(\mathcal B_r\) is closed, compact, bounded, convex and nonempty
in the Banach space \(C^0(E)\).

Take \(r\) first. Require \(M_8r\) within the radial domain,
\(cM_8r<1/4\), \(\|Q_0\|CM_8r\le1/4\), and
\(M_8r<\operatorname{diam}(u_0(S^2))/4\). Then require
\(c\epsilon<1/4\) and \(\|Q_0\|C\epsilon(1+r)\le r/4\).
The projection comparison holds throughout the ball and
\(\mathcal T=-Q_0(F_{J'}-D_0)\) maps it into \(X\) with \(B\) norm
at most \(r/2\). The coefficient constants in these selections
come from the fixed data.

For \(\xi_n\to\xi\) in the ambient topology within the ball, each
subsequence has a weakly convergent \(B\) subsubsequence with the
same limit \(\xi\), so \(\xi_n\rightharpoonup\xi\) in \(B\).
For each fixed \(J'\), coefficient continuity on the compact
radial domain gives \(a_n\to a\) and \(b_n\to b\) uniformly.
For any \(L^{8/7}\) test function \(\phi\), pair
\(a_n\nabla\xi_n-a\nabla\xi\) using the sum of
\((a_n-a)\nabla\xi_n\) and \(a(\nabla\xi_n-\nabla\xi)\).
The first pairing tends to zero by the uniform coefficient
limit and the \(L^8\) bound, and the second by weak convergence
against \(a^*\phi\). The same conclusion holds for the sum with
the zeroth-order term after patching the finite atlas.
Consequently \(F_{J'}(\xi_n)-D_0\xi_n\) converges weakly in
\(Y\), and bounded \(Q_0\) gives weak convergence of the images
in \(B\). Compact embedding upgrades this to \(C^0\) convergence
by the unique-limit subsequence argument. This continuity does
not require a common coefficient modulus over perturbations.

The continuous self-map of \(\mathcal B_r\) has relatively
compact image and satisfies Schauder's hypotheses as stated in
Laugesen. The fixed-point identity also holds in \(B\) since
continuous representatives determine the Sobolev section.
Applying \(D_0\) gives \(D_0\xi=-F_{J'}(\xi)+D_0\xi\).
Projection injectivity then gives the full weak equation. The
radial homotopy stays in the neighborhood. Choose two domain
points attaining the diameter \(d_0\) of \(u_0(S^2)\). Each
moves auxiliary distance at most \(M_8r\),
so their final separation is at least \(d_0-2M_8r>d_0/2\).
This proves nonconstancy of the parametrized map.

## Local regularity

On a complex coordinate disk with \(j\partial_x=\partial_y\),
restrict further so the continuous image has compact closure
in a target chart. The equation gives \(u_y=a u_x\) with
\(a=J'(u)\) and \(a^2=-I\). The first weak chain rule yields
\(a\in C^0\cap W^{1,8}\). For a constant \(a_*=a(z_0)\) write
\(D_*=\partial_y-a_*\partial_x\). The estimates below give
\(\|\nabla v\|_4\le C_*\|D_*v\|_4\) for compactly supported
\(W^{1,4}\) functions. Use continuity of \(a\) to choose a disk
about \(z_0\) with \(\|a-a_*\|_\infty<1/(2C_*)\). Choose a cutoff
\(\eta\) with positive distance from the disk boundary.

For a coordinate unit vector \(e\), set
\(w_h=\delta_hu=(u(\cdot+he)-u)/h\) and \(a_h=a(\cdot+he)\).
Subtracting the shifted and unshifted equations gives
\(\delta_h(a u_x)=a_h(w_h)_x+(\delta_h a)u_x\). Hence
\[
 D_*(\eta w_h)=(a_h-a_*)\partial_x(\eta w_h)
     +\eta(\delta_h a)u_x+(\eta_y-a_h\eta_x)w_h .
\]
Take \(|h|\) below the cutoff margin so the coefficient
smallness holds on every shifted support. For each fixed
\(h\ne0\) the cutoff product extended by zero is \(W^{1,4}\).
The interior segment formula
\(\delta_h f=\int_0^1\partial_e f(\cdot+\theta he)\,d\theta\),
by smooth approximation, bounds the \(L^8\) quotient of \(a\)
and \(L^4\) quotient of \(u\) by their gradients on the larger
disk. Thus the second term is uniformly in \(L^4\) by
\(1/4=1/8+1/8\). The last term is uniformly in \(L^4\) by the
cutoff and the fixed coefficient bound. The first term uses
at most half the left side. Absorbing gives a uniform \(L^4\)
bound for \(\delta_h\partial_j u\) on the disk where \(\eta=1\)
for both \(j\) and both shift directions. For a test \(\phi\)
strictly inside this disk,
\(\int(\delta_h\partial_j u)\phi=-\int(\partial_j u)\delta_{-h}\phi\).
The right side tends to \(-\int(\partial_j u)\partial_e\phi\).
Weak \(L^4\) limits along \(h\to0\) identify the second distribution
derivatives there. These local applications use only shifts
with a positive margin. The full-space compact support conditions
of Laugesen's Proposition 5.7 are consistent with the localized
argument, and its weak-limit identification is given directly.

### Verification of the \(L^4\) inputs

For real Schwartz \(f\), the multiplier
\(\widehat{Hf}=-i\,\operatorname{sgn}\xi\,\widehat f\) gives
a real \(Hf\) in \(L^2\cap L^\infty\). In fact the multiplier
output is in Fourier \(L^1\cap L^2\); thus the square of
\(f+iHf\) has Fourier transform given by convolution and is
in \(L^2\). Since \(\widehat{f+iHf}\) vanishes at negative
frequency, the square still has nonnegative support. For an
\(L^2\) function \(g+i k\) with real \(g,k\) and such support,
conjugate symmetry gives \(\widehat{k}=-i\,\operatorname{sgn}\xi
\,\widehat{g}\). Applied to the square this yields
\(2fHf=H(f^2-(Hf)^2)\). Then \(H^2=-I\) in \(L^2\) gives
\[
 \|Hf\|_4^2
 \le\|f\|_4^2+2\|f\|_4\|Hf\|_4
\]
by the \(L^2\) isometry and Hölder. Solving the scalar inequality
and using density gives an \(L^4\) bound. Real and imaginary
parts give the corresponding bound on complex inputs.

Directional \(H_\omega\) has the same uniform bound by slicing
in each direction and Fubini. Rotating and conjugating one
bounded operator gives a strongly continuous family on
\(L^4\) for each input, so the circle average exists in \(L^4\).
With arclength \(d\omega\), the integral of
\(\omega\,\operatorname{sgn}(\omega\cdot\xi)\) is
\(4\xi/|\xi|\). In coordinates with \(\xi\) along the first axis,
the first component integrates \(|\cos\theta|\) and the second
vanishes by reflection. Therefore \(\frac14\int_{S^1}
\omega_j H_\omega\,d\omega\) has the multiplier
\(-i\xi_j/|\xi|\), first by the \(L^2\) identity and then by
agreement on dense smooth inputs. The origin is immaterial for
that multiplier. This proves the required \(L^4\) boundedness
of \(R_j\).

The constant operator factorization is
\((\partial_y+a_*\partial_x)D_*=\Delta\) because \(a_*^2=-I\)
and the cross terms cancel. The symbol of
\(-R_j(R_y+a_*R_x)D_*\) is
\(i\xi_j(\xi_y+a_*\xi_x)(\xi_y-a_*\xi_x)/|\xi|^2=i\xi_j\).
Likewise the symbol of \(-R_jR_k\Delta\) is
\(-\xi_j\xi_k\). For smooth compactly supported \(v\), these
identities give the first-order estimate and
\(\|D^2v\|_4\le C\|\Delta v\|_4\). Mollification extends the
first to compactly supported \(W^{1,4}\). For the second,
compact support and a distribution Laplacian in \(L^4\) give a
uniform \(L^4\) Hessian bound after mollification, since
\(\Delta v_\delta=(\Delta v)*\rho_\delta\). Weak passage and
distribution testing identify the Hessian. These Euclidean
estimates apply componentwise and require no variable-coefficient
regularity theorem.

### Bootstrap

Now \(u\in W^{2,4}_{\mathrm{loc}}\), and \(u_x=-a u_y\).
Differentiate the latter in \(x\) and \(u_y=a u_x\) in \(y\).
Adding and commuting mixed derivatives gives
\(\Delta u=a_y u_x-a_x u_y\). The products are justified by
local \(W^{1,4}\to L^\infty\). More generally if
\(u\in W^{m,4}_{\mathrm{loc}}\), \(m\ge2\), derivatives of
\(u\) through order \(m-1\) are locally bounded by Morrey.
For each order up to \(m\) in the smooth composition \(J'(u)\),
the chain rule contains derivatives of \(J'\) on a compact
target set and products of derivatives of \(u\) whose orders
sum to the output order. At most one factor has order \(m\),
which is controlled in \(L^4\). Smooth approximation on a
slightly larger disk makes all lower-order factors converge
uniformly and the top derivatives converge in \(L^4\), proving
the weak composition rule. Thus \(a\in W^{m,4}_{\mathrm{loc}}\).
For products of \(Da\) and \(Du\), orders through \(m-2\)
are locally bounded, and in Leibniz terms of order at most
\(m-1\) at most one factor carries order \(m-1\). This gives
\(\Delta u\in W^{m-1,4}_{\mathrm{loc}}\) with the product rule
justified by the same approximation.

If \(v=\chi u\) for an interior cutoff, then
\(\Delta v=\chi\Delta u+2\nabla\chi\cdot\nabla u+u\Delta\chi
\in W^{m-1,4}(\mathbb R^2)\). For each \(|\alpha|\le m-1\),
\(\partial^\alpha v\) is compactly supported in \(W^{1,4}\)
and has Laplacian in \(L^4\). The weak Poisson estimate puts it
in \(W^{2,4}\), giving \(u\in W^{m+1,4}\) where \(\chi=1\).
Because every interior disk admits a slightly larger one, this
proves order-by-order local regularity. Morrey for each
derivative gives a smooth solution. The disks and estimates
in this regularity proof can depend on derivatives of the
fixed \(J'\), while \(r,\epsilon\) are already fixed above.

## Primary passages

- Joel Fine, *Limits of Riemannian 4-manifolds and the symplectic
  geometry of their twistor spaces*, arXiv:1602.03829v2, posted
  15 November 2016. The indexed 12-page PDF separately displays
  4 April 2018. On 22 November 2026 I inspected the v2 HTML and
  indexed PDF. Remark 5 starts on printed p. 4 / index 3, with
  its closing line on p. 5. Proposition 7 and proof are on pp.
  7–8 / indices 6–7, with (3)–(5) on p. 8. The proposition
  assumes a regular curve and \(C^1\) closeness. Equation (3)
  is the exact transported difference and (4) bounds it using
  \(C^0\) on a fixed \(W^{1,p}\) ball, \(p>2\). Equation (5)
  differentiates the perturbation through the curve and uses a
  \(C^1\) bound. Remark 5 identifies exactly that shortfall when
  metric convergence is \(C^{1,\alpha}\). Fine is a source
  comparison for this audit. The proof above uses its own fixed
  target, compact map and regularity derivation. No published
  text or retained local copy was inspected in this audit.
  [arXiv v2 HTML](https://arxiv.org/html/1602.03829v2) ·
  [arXiv v2 PDF](https://arxiv.org/pdf/1602.03829v2).
- Richard S. Laugesen, *Linear Analysis and Partial Differential
  Equations*, University of Illinois lecture notes, title-page
  date 22 December 2020. On 22 November 2026 I inspected the
  same 158-page author-hosted PDF. §1.6 Definition 1.11, p. 18 /
  index 17, includes compact continuous maps defined on subsets,
  with relatively compact images of bounded sets. §1.7
  Theorem 1.17 and its proof, pp. 23–24 / indices 22–23, give
  Schauder for a compact self-map of a nonempty closed bounded
  convex subset of a Banach space. Theorem 3.22, p. 71 / index
  70, gives the \(W^{1,p}\) continuous representative and exponent
  \(1-N/p\) for \(p>N\) on domains with \(C^1\) boundary. This is
  used on smooth disks with \(N=2,p=8,4\). Proposition 5.7(i)–(ii)
  and proof, pp. 110–111 / indices 109–110, give the full-space
  \(W^{1,p}_0\) quotient bound and compactly supported weak
  derivative criterion for \(1<p<\infty\). The local segment
  and test arguments above check its application. The inspected
  §1.5 is the Volterra application. Inspection was limited to
  these passages, with no retained copy or additional theorem
  imported. [Author PDF](https://publish.illinois.edu/rlaugesen/files/2023/07/554-Lectures.pdf).

The finding concerns existence of a smooth nonconstant map
homotopic to the given regular sphere in the fixed neighborhood.
It does not assert that the perturbed map is embedded, or
provide uniqueness, smooth dependence, uniform higher estimates,
metric taming, a bubble exclusion result, or a novelty claim.
E190 remains frozen pending lead assessment.

## Verified inputs

| Artifact | SHA-256 |
| --- | --- |
| [E192 request](../research-progress/handoffs/SP4-CME-E192_REQUEST_v1.md) | 2cc33eaccd6d7be7883132c34ec30d573f52cf29ce2532eb92d25fefe766f889 |
| [B93](../brainstorm/notes/B93_WEAK_COMPACT_CURVE_PERSISTENCE_20261122.md) | 4199ff5376d7d4cfb5c6555246089616f4e622ec28adb42ba07855d60e8f3c5b |
| [E190 request](../research-progress/handoffs/SP4-CME-E190_REQUEST_v1.md) | 66e5c48eb1f5e8645d0a23c7600eacb0c3ba97f26393864a2f83a86d236f5701 |
| [E190 proof](../notes/190_C0_CURVE_PERSISTENCE_TEST_20261122.md) | c928a60dfe4fe6fbafe4428261f7b77164648a88382c20ca5ff06b8f9302a2ea |
| [E190 return](../research-progress/handoffs/SP4-CME-E190_RETURN_v1.md) | bbb14248d7d5b5850ba5d325592fa8f6ac593116ee38415a93887e05c3fe0137 |
| [E186 assessment](E186_TWISTOR_COMPARISON_ASSESSMENT_20261122.md) | aabd5b851a0373d8d2331a5ace9035a634eb2933d7f731632255780d08901f65 |
| [Nested E186 source audit](E186_TWISTOR_LIMIT_SOURCE_AUDIT_20261122.md) | 31ead6b42eff300f3afb0633e802ba3ba75f15e69a431cc5fc656003bc4f4c6e |
