# B112 — Test an exact global ratio cap with a prescribed radial cutoff

23 November2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Conceptual B decision by selected lead; settings preserved/unavailable. Fixed E work configured gpt-6.2-sol/ultra, independent runtime attestation unavailable.

## Reason and fixed stronger target

E240 returns small fixed C1/curvature values but leaves the cutoff annulus ratio at1+O(epsilon). To distinguish local growing maxima from actual failure of a globally prescribed ratio cap, test a more specific radial cutoff in the same near-round family. This is a new proposed statement, not a reinterpretation of E240/E241. Keep R=epsilon^2, r=1+epsilon and the same E235 germ; change only the fixed cutoff.

Choose chi(x)=c(|x|), 0<=c<=1, c=1 for s<=1/2, c=0 for s>=1, c nonincreasing and |c'|<=5/2. Such a fixed smooth c is obtained by integrating the nonnegative density (5/2)(1_[11/20,19/20]*eta)(s), with eta a smooth nonnegative integral-one mollifier supported in (-1/20,1/20). The density has integral1, support inside (1/2,1), and supremum<=5/2. At a point set u=c(s), v=s c'(s), h=u+v/4. Then 0<=u<=1, -5/2<=v<=0 and -5/8<=h<=1; h=1 only when u=1,v=0.

## Lead's proposed proof route

Let D=diag(-1/2,0,1/2). The local curvature F* has normalized quotient I+epsilon D+O(epsilon^2). The affine perturbation is one-half contraction_x(F*-F_rd(0)). Its cutoff derivative has self-dual projection v(F*-F_rd(0))/4, because (n-flat wedge contraction_n Sigma_i)^+=Sigma_i/2. Thus the pointwise normalized quotient of the cutoff connection should have

    Q(u,v,x,epsilon)=I+epsilon h D+O(epsilon^2),
    partial_u Q=epsilon D+O(epsilon^2),
    partial_v Q=epsilon D/4+O(epsilon^2),

uniformly for |x|<=R in the annulus and the fixed rectangle of u,v, with the curvature computed from A_rd+u(A_loc-A_rd) and the radial derivative v at that point. The cubic term contributes O(R^2/epsilon)=O(epsilon^3); the weak radial round remainder contributes O(R)=O(epsilon^2). The error bounds must be proved uniformly, including the u,v derivatives. Derivatives here are parameters of the algebraic pointwise curvature formula, not new connection fields.

First strengthen the local Taylor bound uniformly to the full |x|<=R ball. A_loc is an odd polynomial, so its curvature and Q are even. Its second quotient derivative is B delta, of size O(epsilon^-1). With the simple spectral gap comparable to epsilon, a target scalar remainder is

    log rho(Q_loc(x))=log r-(|G|^2/2)|x|^2+O(epsilon^-3 |x|^4).

At R=epsilon^2 this would give strict decrease for all nonzero x in the ball when epsilon is small. Derive this bound from the actual polynomial and normalized wedge map; do not assume a uniform radius from E235.

For h>=1/2, compare (u,v) to (1,0) along the straight parameter segment. Its h stays >=1/2, so the ordered eigenvalue gaps stay comparable to epsilon. Perturbation of the eigenspaces in the expansion above should give partial_u log rho=epsilon+O(epsilon^2) and partial_v log rho=epsilon/4+O(epsilon^2), uniformly on that segment. Since u-1<=0 and v<=0, integration gives a nonpositive change, strictly negative if h<1, bounded above by -c epsilon[(1-u)+|v|/4]. The local datum already has strict decrease away from the center. For h<=1/2, |h|<=5/8 and a uniform eigenvalue perturbation bound yields rho<=1+(3/4)epsilon<r for small epsilon. This region may have repeated eigenvalues; use only Lipschitz eigenvalue bounds there.

If these estimates close, the actual global connection has sup rho=r with its unique maximum at p, and remains C1-small and positive by the same E240 argument. Combining after separate audit with E241 would exhibit actual original flows leaving each cap r=1+epsilon for every sufficiently small epsilon>0, despite eventual round attraction modulo the assessed automorphisms. It would be a near-round family, not all r>1 and not a singularity. No global cap or preservation failure is accepted until the quantitative cutoff proof and independent audit succeed.

## Execution bounds and failure handling

E243 tests this one fixed cutoff and the displayed asymptotic estimates, with explicit powers, uniform parameter ranges and constants sufficient to choose epsilon0. No numerical search, alternative radius/cutoff, general gluing theorem or unrelated scalar is authorized inside that packet. A failed coefficient or uniform estimate returns its location to the lead. E240/E241 and their E242 audit remain separate. Root integrates only after review.

Inputs: [E235](../../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md), [E235/E236 assessment](../../reviews/E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md), [E240 returned cutoff](../../notes/240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md), [B111](B111_CLOSED_REALIZATION_OF_LOCAL_RATIO_GERMS_20261123.md). No new external source is imported.
