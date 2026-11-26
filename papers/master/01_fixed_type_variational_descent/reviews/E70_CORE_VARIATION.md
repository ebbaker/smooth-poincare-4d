# E70a · Independent check of the localized core variations

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
Codex assistance. MASTER-E70a, bounded reader. Actual serving model
and effort are unavailable. Checked
[E68a manuscript](../manuscript/core_variation.tex) `5da749da59e18f57`,
[E68a derivation](../notes/E68_CORE_VARIATION.md) `4749560d26b015fb`,
[E65 balanced exterior](../manuscript/balanced_exterior.tex)
`96ec25cd36bf5d31` and the
[E63–E67 assessment](../../research-progress/handoffs/E63_E67_BALANCED_DISKS_20261125.md).
The input smooth type is the fixed oriented homotopy four-sphere,
and all estimates use the actual physical metric and the
Hilbert–Schmidt norms of the chiral curvature operators.

## Variation and finite step

For \(g_t(X,Y)=g(e^{tA}X,Y)\), the determinant relative to \(g\)
is \(\exp(t\operatorname{tr} A)=1\), and \(e^{-tA/2}\) identifies
the oriented orthonormal frames. A common fixed volume form
and the closed signature formula make the two local chiral
increments equal, since the metric is fixed on the exterior of
the supported variation. In the connection-difference formula
\(\nabla g_t\) is a smooth coefficient of \((t,A)\) applied to
\(\nabla A\). Its covariant derivative gives only
\(\nabla^2 A\) and \((\nabla A)^2\). The curvature
\(R^{g_t}=R^g+d^\nabla S_t+S_t\wedge S_t\) then has the
three displayed types after conversion to the common frames.
The coefficients and their first four \(t\)-derivatives are
uniformly bounded for \(|t|,\|A\|_\infty\le1\). Thus the
\(L^2\) bound for each Weyl derivative through order four
is controlled by \(C(K+\|\nabla^2A\|_2+\|\nabla A\|_4^2)\).
The product rule for the squared norm gives
\(\sup |f^{(j)}|\le D=C(1+K)^2\), \(1\le j\le4\).
The critical norms scale correctly in real dimension four.

The allowed step \(|t|\le t_*\) keeps
\(f(t)\le e+D|t|\le e+(2T-e)/2<2T\). A zero of the
least conformal Laplacian eigenvalue would produce a smooth
scalar-flat metric on the same \(M\), with
\(E_+=2T+\tfrac14\|\operatorname{Ric}\|_2^2\) by
Gauss–Bonnet and \(\tau(M)=0\). The entire tested path
therefore has positive Yamabe sign and \(f(t)\ge I\).

The linear test uses the sign with first-order term
\(-|f'(0)|t\) and a remainder \(Dt^2/2\). The quadratic
test takes the average at \(t\) and \(-t\), for which
both odd orders cancel and the absolute remainder is at
most \(Dt^4/24\). At least one endpoint lies at or below
that average. Either lower bound on energy saving exceeding
\(d=e-I\) contradicts the same-type infimum. On a tail with
uniform \(D\) and \(t_*>0\), for \(d>0\) small minimize
the two right-hand sides at
\[
 t=(2d/D)^{1/2}, \qquad t=(24d/D)^{1/4},
\]
respectively. The numerical bounds are
\(|f'(0)|\le\sqrt{2Dd}\) and
\([-f''(0)]_+\le\sqrt{2Dd/3}\). At \(d=0\) take
\(t\downarrow0\). At norm \(N>0\), scaling the direction
to \(A/N\) gives the factors \(N\) and \(N^2\), with
physical path parameter \(t/N\).

For the Bach normalization, the full tensor Weyl energy is
\(4(E_++E_-)=8E_+\) on a closed homotopy sphere.
Bahuaud–Guenther–Isenberg–Mazzeo give the gradient
\(-4B\) for that full tensor functional. The claimed chiral
first variation is therefore \(-\tfrac12\int\langle B,gA\rangle\).
The exponential path has acceleration \(gA^2\), so
\(f''(0)-D^2E_+(g)[gA,gA]=DE_+(g)[gA^2]\).
The trace of \(A^2\) makes no contribution. The remaining
trace-free part has critical norm at most \(C N^2\), by
Hölder and the two product rules. The affine lower bound is
therefore also \( -C N^2 \sqrt d\) on the late sources.
These estimates control the displayed dual norm of the Bach
functional. [Bahuaud–Guenther–Isenberg–Mazzeo v1, §1, preceding (1.1)](https://arxiv.org/html/2508.06633v1#S1)

## The physical cutoff and the E65 budget

In a transition layer the Hessian product terms are
\(2\nabla\chi\otimes\nabla A\) and \((\nabla^2\chi)A\)
in addition to \(\chi\nabla^2A\), with the first term
understood symmetrically. The cutoff factor
\(\chi=\chi_0(\rho/w)\) yields \(w^{-1}d\rho\)
and \(w^{-2}d\rho\otimes d\rho+w^{-1}\nabla^2\rho\)
times controlled derivatives of \(\chi_0\). Passing to
\(L^4\) and \(L^2\) gives the claimed bound. In a smooth
signed-distance layer the Hessian equals the parallel
second fundamental form on tangential directions and
is zero in the distance direction. Even at fixed smooth
geometry and a fixed positive-area face, reducing its
width \(w\) makes the factor
\(w^{-2}\operatorname{Vol}(C_0)^{1/2}\) grow like
\(w^{-3/2}\), while its integrated raw curvature tends
to zero. Thus the curvature and width quantities in the
test are genuinely different. The estimate is for the
actual profile and metric on the actual layer.

Write \(r=2^{-k}\) for E65. At a positive capped endpoint
meeting the marking, the unchanged original energy on the
disk is at least \((1-r)e_i+r\lambda_i^s(Q_i)-\tau_i\).
A subwall joined endpoint has inside energy strictly less
than \(2T-I+d_{\rm cap,i}\) if its actual capped energy is
at most the retained exterior charge plus \(d_{\rm cap,i}\).
Subtracting gives the claimed required signed disk saving.
A path remaining subwall and supported entirely inside this
disk can save at most \(d_i=e_i-I\), since that signed disk
increment is its whole increment. Thus a fixed positive
required E65 disk saving cannot be supplied by a standalone
subwall clamped change on a minimizing tail, even if no
derivative bounds are imposed on that path. A coupled path
can redistribute energy between disk and exterior and
requires its own joined and capped estimates. There is no
contradiction between the Taylor test and the E65 requirement.

## The product comparison and its precise scope

For the unit round product \(P=S^2\times S^2\), the
projected curvature block has eigenvalues \(1,0,0\),
and \(R/12=1/3\), so the chiral Weyl block is
\((2/3,-1/3,-1/3)\). Each squared norm is \(2/3\),
and the volume \(16\pi^2\) gives \(E_s=32\pi^2/3\).

For a nonzero harmonic self-dual form \(\omega\), let
\(v=|\omega|\) and \(\lambda=\lambda_{\max}(W^+)\).
The equation \(d\omega=0\) gives
\(\tfrac32|dv|^2\le|\nabla\omega|^2\) wherever \(v>0\),
by combining the two other self-dual-frame components
of \(\nabla\omega\) against the first one. With
\(x=v^2+\epsilon^2\), the derivative part in
\(\Delta x^{1/4}\) has lower bound
\(\tfrac34\epsilon^2x^{-7/4}|dv|^2\) where \(v>0\).
At a zero of \(v\) use \(d(v^2)=0\) and the
Weitzenböck inequality directly. This verifies the
regularized inequality, including the sign of
\(R_+\epsilon^2x^{-3/4}\) and the fact that no adverse
term arises from \(6\lambda\ge0\). After multiplication
by \(x^{1/4}\), the scalar error is bounded by
\(\epsilon\int R_+\). The positive Yamabe class then
has \(Y^2\le36\int\lambda^2\le24E_+\), since a
trace-free real symmetric three-by-three block satisfies
\(\lambda^2\le2|W^+|^2_{\rm HS}/3\).
Gauss–Bonnet with \(\chi(P)=4\) and \(\tau(P)=0\) gives
\(32\pi^2\le2E_++Y^2/24\le3E_+\). At zero Yamabe
sign it gives \(E_+\ge16\pi^2\). This is a direct
product-case proof of the relevant lower bound. The
Gursky citation supplies attribution, with publication
metadata checked through Annals. [Gursky, Ann. Math. 148 (1998), 315–337](https://annals.math.princeton.edu/articles/12993)

Transplanting a clamped path requires its support to lie
inside the common conformal product chart for all parameters.
Dividing by the same smooth source multiplier preserves the
chiral increments there, and the two exteriors remain fixed.
A strictly lower endpoint on \(P\) has negative Yamabe
sign, since both positive and zero signs obey the checked
lower bounds. At the intervening zero the source energy
is at least \(e+16\pi^2-32\pi^2/3=e+16\pi^2/3\).
This reaches \(2T\) inclusive at \(e=8\pi^2/3\) and
exceeds it for larger \(e\). The same argument is local in
the support and also survives a fixed conformal change.

For the illustration on standard \(S^4\), the product
normal chart can be pasted at scale \(r\) with bounded
curvature in a region of volume \(O(r^4)\). In the
disjoint warped box the three eigenvalues in either
chiral block are \(K/3,-K/6,-K/6\) for
\(K=-a''/a\). On the inner box at \(t=1\), the
term \(\epsilon^2N^4\cos^2(Nx_1)\) divided by uniformly
bounded factors gives divergent energy. The first
crossing of the requested \(e\in[T,2T)\) occurs before
the scalar-flat wall. Conformal Yamabe normalization
keeps the germ, and sufficiently small marked balls
have positive inside and outside charge with arbitrarily
small full curvature on a surrounding ball. This
illustration concerns smooth positive metrics on the
standard sphere and the clamped comparison. An actual
minimizing sequence on a nonstandard type with this
germ has not been exhibited.
