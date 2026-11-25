# EXTRACT-E12 · Detecting physical volume at comparison faces

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E proof check at `7db310a2`.
The [frozen request](../research-progress/handoffs/E12_THIRD_REQUEST_20261125.md)
specifies GPT-6.2 Sol/ultra for the helper. Actual serving model and
reasoning effort are unavailable. Inputs at that checkout are EXTRACT-E08,
E09 and E11 (SHA-256 prefixes `7f130651`, `8ee48159`, `ea035f56`) and
NECK-E19 and E20 (`22101101`, `3f09e64b`).

## A test on the actual source

Use the [joint source](../../../reviews/SECOND_COLLAR_ASSESSMENT_20261125.md),
a fixed smooth closed oriented homotopy four-sphere \(M\) with smooth
unit-volume positive Yamabe minimizers \(g_i\), scalar curvature
\(s_i=Y_i\ge Y_0>0\), and the fixed subcritical Hilbert–Schmidt chiral
band. The volume estimates use only the positive Yamabe bound. For an
\(H^1\) cutoff \(0\le\chi\le1\), write \(a=\int_M\chi^4dV_{g_i}\),
\(D=\int_M |d\chi|^2_{g_i}dV_{g_i}\), and let \(t\) be the physical
volume of a region containing \(\{0<\chi<1\}\). Yamabe minimality and
\(\chi^2(1-\chi^2)\le1/4\) give
\[
 \sqrt a-a\le 6D/Y_i+t/4 .                                      \tag{1}
\]
If \(\chi=1\) on a region of volume \(m\) and its nonzero set has
volume at most \(s\le1\), Hölder gives
\[
 Y_0(1-\sqrt{s})\sqrt m\le 6D.                                  \tag{2}
\]
Indeed \(\int \chi^2\le \sqrt{s}\sqrt a\) and \(a\ge m\).
If \(d\chi\) is supported on a compared collar \(T\) of physical
volume \(v\), Hölder also gives
\[
 D\le A\sqrt v,\qquad A=\left(\int_T |d\chi|^4_{g_i}dV_{g_i}\right)^{1/2}.
                                                                    \tag{3}
\]
The integral defining \(A\) is conformally invariant in dimension four.
Thus a fixed cutoff in a uniformly bilipschitz comparison collar has
uniform \(A\), even with an unbounded comparison-to-physical conformal
factor. On a supplied length-\(L\) cylinder uniformly comparable to
the unit product, a cutoff with derivative \(O(L^{-1})\) on the
buffer has \(A=O(L^{-3/2})\). The volumes in (1)–(3) use \(g_i\).

## Finite faces and a positive compact witness

At a fixed comparison stage let \(K_i\) be the image of a whole compact
truncation with finitely many buffered faces. Let \(U_{ij}\), \(1\le j\le J\),
be its actual complementary pieces, with volumes \(m_{ij}\). Assume
there are cutoffs equal to one on each \(U_{ij}\), zero on all other
pieces, with transitions in fixed compared collars within \(K_i\).
If a piece meets several faces, use one cutoff on the piece and its
buffers. Write \(k_i=\operatorname{Vol}_{g_i}K_i\). The volume \(s_{ij}\)
of the nonzero set of the \(j\)-th cutoff is at most \(m_{ij}+k_i\).
Take one finite uniform bound \(A>0\) in (3) for these cutoffs and let
\(\ell\) bound the overlap multiplicity of the transition collars.
Disjoint face buffers give \(\ell=1\).

- If two pieces each have volume at least \(\eta>0\), then
  \(s_{ij}\le1-\eta\) for either of their cutoffs. Its compared transition
  collar has physical volume at least
  \[
   \left[\frac{Y_0(1-\sqrt{1-\eta})\sqrt\eta}{6A}\right]^2.
  \]
- If every \(m_{ij}\le1-\eta\) for some \(0<\eta<1\) and \(J\ge1\), then
  \[
   k_i\ge\min\left\{\frac{\eta}{2},
     \frac{\mu_\eta}{36 A^2\ell+\mu_\eta}\right\},\qquad
   \mu_\eta=Y_0^2(1-\sqrt{1-\eta/2})^2.                             \tag{4}
  \]
  If \(k_i<\eta/2\), each \(s_{ij}\le1-\eta/2\). Squaring (2) and
  applying (3), then summing, gives \(\mu_\eta(1-k_i)\le36A^2\ell k_i\).
  If \(J=0\), the compared compact already carries unit volume.

If all fixed compared compacts evacuate, then at each fixed stage
\(k_i\to0\) and each transition cost tends to zero by (3). Along any
convergent subsequence of the finite volume vector, (1) gives
\(\sqrt{m_j}\le m_j\) for every limiting exterior volume \(m_j\).
Since the volumes sum to one, exactly one exterior carries volume one.
If successive cuts preserve the same labels and the intervening regions
are compared compacts, the differences of the exterior volumes tend
to zero. The same label therefore carries the volume along this nested
exhaustion after passage to a subsequence for the countable stages.
This is the volume part of [EXTRACT-E11](E11_VANISHING_FACTOR_GREEN_LIMIT_20261125.md#the-physical-volume-exit-is-the-only-green-pole)
with the physical cutoff costs controlled directly by (3).

A source condition on balls suffices when it controls these actual
exits. For example, suppose \(\sup_x\operatorname{Vol}_{g_i}B_{g_i}(x,r)\le1-\eta\)
at fixed \(r>0\) and every exterior at a fixed stage is contained in
such a ball up to \(o(1)\) physical volume. Then (4) yields a witness
with margin \(\eta/2\) for large \(i\). Small boundary diameter and
small capacity alone give no such containment. The diameter estimate
of [NECK-E19](../../01_neck_geometry/notes/E19_ROUND_BASE_SINGLE_PUNCTURE_20261125.md#one-survivor-and-concentration-at-one-physical-puncture)
uses an already small exterior volume.

## Exhaustion without a smooth closed base

Let \(X\) be a smooth open comparison manifold with coherent maps
\(F_i\) on neighborhoods of exhausting compact domains \(K_b\). Take
\(\chi_b\in C_c^\infty(X;[0,1])\) equal to one on \(K_b\), and require
\[
 \sup_b\limsup_i\left(\int |d\chi_b|^4_{F_i^*g_i}\,dV_{F_i^*g_i}\right)^{1/2}
 <\infty.                                                        \tag{5}
\]
The source index tends to infinity first on each fixed compact.
Extract a locally vague limit \(\nu\) of the pulled-back physical
measures, so \(0\le\nu(X)\le1\). Extend each transported cutoff by
zero on the source. The compact derivative supports \(T_b\subset X\)
leave every compact, so \(\limsup_i\operatorname{Vol}_{g_i}F_i(T_b)
\le\nu(T_b)\to0\). Equations (3) and (5) make the Dirichlet term
vanish in the iterated limit. The Yamabe test divided by \(Y_i\),
followed by bounded convergence for \(\nu\), gives
\[
 \sqrt{\nu(X)}\le\nu(X),\qquad \nu(X)\in\{0,1\}.
\]
A fixed compact with positive lower physical volume therefore gives
saturation for every extracted local measure. A positive limsup gives
saturation along a witnessing subsequence. The proof also works
with direct cutoffs whose iterated physical Dirichlet cost vanishes,
or with bounds \(A_b\) at the separate stages satisfying
\(A_b^2\nu(T_b)\to0\) along the extracted measure.
Condition (5) holds for ordinary finite-puncture cutoffs under smooth
closed conformal comparison. The volume dichotomy itself uses only
the cutoffs and the local measure comparison.

If \(F_i^*g_i=u_i^2h_i\) and \(h_i\to h\) smoothly only on compact
subsets of a connected \(X\), the local argument of
[EXTRACT-E09](E09_CONFORMAL_BASE_VOLUME_DICHOTOMY_20261125.md#equation-and-weak-limit)
gives \(u\ge0\) in \(H^1_{\rm loc}\cap L^4(X,h)\) with mass at most one
and \(L_hu=yu^3\), where \(L_h=-6\operatorname{div}_h\nabla+R_h\) and
\(Y_i\to y\). Compactly supported tests give the Yamabe inequality
with constant \(y\) on \(X\) by conformal transport. Write
\(Q_h(f)=\int_X (6|df|^2_h+R_h f^2)dV_h\). Testing the weak equation
with \(\chi_b^2u\) yields
\[
 y\|\chi_bu\|_{4,h}^2\le Q_h(\chi_bu)
 =y\int_X\chi_b^2u^4dV_h+6\int_Xu^2|d\chi_b|_h^2dV_h .
\]
By (5), conformal invariance and local convergence, the last term
tends to zero since \(u\in L^4\) and the transition supports leave
every compact. Thus a nonzero \(u\) has mass one. In this case
\(\nu\ge u^4dV_h\) gives equality, and E09's local \(L^4\) absorption
and elliptic regularity give smooth physical convergence on fixed
compacts. If \(y<Y_{\rm rd}\), E09's local sharp Sobolev test in small
charts excludes all fixed-compact mass when \(u=0\). Hence a witness
in the strict subround case gives both saturation and local smooth
physical convergence under these local conditions. At the round
threshold the volume statement allows a measure supported at a
point. Smooth extension, the topology of a compactification and
the closed energy conclusions of [EXTRACT-E08](E08_PHYSICAL_BASE_ALTERNATIVE_20261125.md)
and [NECK-E20](../../01_neck_geometry/notes/E20_GREEN_LIMIT_RICCI_BUDGET_20261125.md)
have additional premises. [Lee–Parker, Theorems 2.2–2.6 and 3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## Evacuation on the supplied source class

On any supplied sequence in the band, take oriented source normal
charts \(F_i(x)=\exp_{q_i}^{g_i}(\lambda_i x)\) on Euclidean balls of
radii \(R_i\to\infty\). For each \(i\) choose \(\lambda_i>0\) so
small that the entire image has volume at most \(i^{-1}\) and
\(\lambda_i^{-2}F_i^*g_i\) is within \(i^{-1}\) of Euclidean in
\(C^i(B(0,R_i))\). Normal-coordinate smoothness at each individual
source point permits both requirements. Identify this domain with
growing subsets of the stereographic chart of \(S^4\setminus\{p\}\).
Multiplying the scaled comparison by \(\omega^2\), where
\(\omega=2/(1+|x|^2)\), gives the round conformal limit and physical
factor \(\lambda_i/\omega\). One may also omit additional fixed
ordinary marks and use all their faces in the full truncation. All
fixed compact volumes vanish. The exterior at \(p\) carries unit
volume in the limit, and its fixed compared face has vanishing
physical diameter and cutoff Dirichlet cost.

The construction preserves every source-only bound satisfied by the
given metrics, including any ball nonconcentration bound. A fixed
round source illustrates both uniform ball nonconcentration and
evacuation and lies outside the positive-energy band. The in-band
construction is conditional on a supplied source and concerns round
comparison charts. The nonround closed comparison under near-minimality
in NECK-E20 has a separate curvature obstruction to evacuation.

The missing implication for B05 is a source-to-comparison estimate
that excludes a single actual exterior from carrying almost all
physical volume, or otherwise locates a positive fixed compact
witness. A source-only ball bound requires a geometric relation to
the actual exterior to provide that estimate.
