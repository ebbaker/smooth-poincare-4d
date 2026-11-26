# Interior variation and the budget of a disjoint round-seam path

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution DEF-E03b from the [frozen B02 decision](../../research-progress/handoffs/PREFIX_AND_INTERIOR_20261126.md), at `e2968b2898b5aab00b307f6b6580454d0f325bb4`. The request records GPT-6.2 Sol/ultra for the helper. Actual serving model and effort are unavailable. The [master core variation](../../../../master/01_fixed_type_variational_descent/manuscript/core_variation.tex) (`65c76bc676af0725`) already proves the uniform Bach and Hessian estimates. The return below specializes the finite trial to the original disk and derives the peak and capped costs of an independent, disjoint preparation. Inputs also include the [E61 selection](../../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) (`8063d76ad6875e80`), [balanced enlargement](../../../../master/manuscript/balanced_disk.tex) (`044c5e0c1ea3f5e4`), [positivity wall and marked stretching](../../../../master/manuscript/variational_comparison.tex) (`d52c8d2ad83e21d0`) and [full-side budget](../../02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md) (`aca743d7c46704ce`).

## The trial in the physical metric

Let \(M\) be the fixed closed oriented smooth homotopy four-sphere and \(g=g_i\) a smooth volume-one positive Yamabe metric in the selected subsequence. Write \(T=4\pi^2\), \(I=I^+(M)<2T\), \(e=E_\pm(g;M)<2T\) and \(d=e-I\). The energy uses real Weyl operators with Hilbert–Schmidt norms. The E61 disk \(D_i\), its actual bicollar and the comparison ball containing them are kept with their original markings. For open \(U\Subset\operatorname{int}D_i\) and a smooth \(g\)-self-adjoint trace-free endomorphism \(A_0\in C_c^\infty(U)\), measure

\[
N_g(A_0)=\|A_0\|_{\infty}+\|\nabla A_0\|_4+\|\nabla^2A_0\|_2,
\qquad K=\|\operatorname{Rm}_g\|_{L^2(U),\mathrm{tens}}.
\]

If \(N_g(A_0)>0\), set \(A=A_0/N_g(A_0)\) and \(g_t=g(e^{tA}\,\cdot,\cdot)\). The physical parameter in the unnormalized direction is \(t/N_g(A_0)\). The path is smooth, preserves \(dV_g\), and agrees with \(g\) on the entire complement of \(U\). Its two local chiral increments are equal by closed signature. All support, including its cutoff layers, is counted in the local increment.

In the convention of Bahuaud, Guenther, Isenberg and Mazzeo, the gradient of the full tensor Weyl energy is \(-4B_g\). Its closed integral here equals \(8E_+(g;M)\), so, for either \(f(t)=E_\sigma(g_t;M)\),

\[
f'(0)=-\tfrac12\int_U\langle B_g,gA\rangle_g\,dV_g .
\]

If an actual point of \(U\) has \(B_g\ne0\), choose a nonnegative physical bump \(\chi\) supported in the patch, positive there, and take \(A_0=\chi B_g^\sharp\). The trace vanishes and \(p=-f'(0)=\int_U\chi|B_g|^2\,dV_g/(2N_g(A_0))>0\). At such a point the metric variation changes relative lengths in different tangent directions. If \(B_g\) vanishes throughout the permitted patch, every compactly supported first variation there is zero. One can still test a trace-free direction for the second variation, for example a bump times the difference of two rank-one orthogonal projections in a smooth frame. The selected disk's Weyl charge is a zeroth-order curvature integral. The master [charged product germ](../../../../master/01_fixed_type_variational_descent/manuscript/core_variation.tex#L105) realizes local charge with zero Bach tensor and no subwall clamped saving on a standard source in the band. [Bach convention, arXiv:2508.06633v1, §1 and (1.1)](https://arxiv.org/html/2508.06633v1#S1)

For a transition with fixed profile \(\chi_0(\rho/w)\) on an actual layer \(L\) of width \(w>0\), the derivative factors in the normalization are bounded by

\[
\begin{aligned}
 \|d\chi\|_{4,L}&\le C_\chi w^{-1}\|d\rho\|_{4,L},\\
 \|\nabla^2\chi\|_{2,L}&\le C_\chi\big(w^{-2}\|d\rho\|_{4,L}^2+w^{-1}\|\nabla^2\rho\|_{2,L}\big).
\end{aligned}
\]

In addition to the uncut norm of the direction, the product rule requires \(\|d\chi\|_4(\|A_0\|_\infty+2\|\nabla A_0\|_4)+\|\nabla^2\chi\|_2\|A_0\|_\infty\), with \(A_0\) here denoting the direction before cutting. Sum these terms over the actual transition layers, including any cutoffs at connector and tip regions. For a smooth physical signed-distance chart \(\|d\rho\|_{4,L}=\operatorname{Vol}_g(L)^{1/4}\) and \(\nabla^2\rho\) is the second fundamental form of parallel faces with zero normal component. Separate strip widths \(w_D,w_V\) for a later seam enter its own interpolation and estimates. The raw curvature bound for the chosen bicollar does not bound the displayed width costs.

## A finite signed saving and its peak

To compute derivatives of \(f\) directly use the full Levi–Civita connections. With \(S_t=\nabla^{g_t}-\nabla^g\), Koszul gives \(2g_t(S_t(X,Y),Z)=(\nabla_Xg_t)(Y,Z)+(\nabla_Yg_t)(X,Z)-(\nabla_Zg_t)(X,Y)\). Its curvature is \(R_t=R_g+d^\nabla S_t+S_t\wedge S_t\). In a common oriented orthonormal frame via \(e^{-tA/2}\), let \(W_t^\sigma\) be the resulting Weyl block. The full curvature formula includes the variations of the trace and the chiral splitting through that frame identification. The common volume gives the exact price at second order:

\[
 f''(0)=2\int_U\left(|\dot W_0^\sigma|^2+\langle W_0^\sigma,\ddot W_0^\sigma\rangle\right)dV_g.
\]

The master proof bounds the \(L^2\) norms of these blocks and their first four parameter derivatives for \(|t|\le1\) by a dimension-only multiple of \(K+\|\nabla^2 A\|_2+\|\nabla A\|_4^2\). The terms arise from \(R_g,d^\nabla S_t,S_t\wedge S_t\) and the common frames. Thus \(D=C(1+K)^2>0\) bounds \(|f^{(j)}(t)|\) for \(1\le j\le4\). A verified smaller bound for one derivative can be used in its corresponding Taylor remainder. The E61 physical curvature ceiling gives \(K^2<\zeta\). The uniform tail margin \(2T-e_i>0\) and the same-type Yamabe wall make both signs admissible for \(|t|\le t_*:=\min(1,(2T-e)/(2D))\). A scalar-flat class would have \(E_+=2T+\tfrac14\int|\operatorname{Ric}|^2\) in its scalar-flat representative. [Prior estimate and continuous Yamabe sign](../../../../master/manuscript/variational_comparison.tex)

With \(p=|f'(0)|\) and \(q=[-f''(0)]_+\), the inherited bounds at any \(0<t\le t_*\) are

\[
p\le d/t+Dt/2,\qquad q\le 2d/t^2+Dt^2/12.
\]

For small \(d>0\) on the tail, the optimizers \((2d/D)^{1/2}\) and \((24d/D)^{1/4}\) lie in the allowed interval. They give \(p\le\sqrt{2Dd}\) and \(q\le\sqrt{2Dd/3}\). At \(d=0\) send \(t\downarrow0\). In particular the Bach functional tested on the critical unit ball is \(O(\sqrt d)\). The affine Hessian differs from the exponential one by the first variation in direction \(gA^2\). Its trace part has zero pairing, and \((A^2)^\circ\) has bounded critical norm by the product rule. Hence the affine quadratic lower bound is also \(-O(\sqrt d)\) on this unit ball. [Master estimates and independent check](../../../../master/01_fixed_type_variational_descent/reviews/E70_CORE_VARIATION.md)

For a usable first-order preparation choose the sign \(\epsilon\) with \(\epsilon f'(0)=-p<0\) and set \(a=\min(1,p/D)\). Along \(0\le t\le a\), the derivative of \(f(\epsilon t)\) is at most \(-p+Dt\le0\). The path therefore has joined peak exactly \(e\), and its actual saving \(S=e-f(\epsilon a)\) satisfies

\[
0<p a-Da^2/2\le S\le d.
\]

If \(q>0\), the symmetric Taylor test supplies an endpoint on one sign with saving at least \(q t^2/2-Dt^4/24\) at \(t=\min(t_*,\sqrt{6q/D})\). Its preparation peak is bounded by \(e+Dt\). For a monotone preparation use the sign \(\epsilon\) with \(\epsilon f'(0)\le0\) and take \(a=\min(1,q/D)\). The second derivative along the signed path is at most \(-q+Dt\le0\), and integration gives \(S\ge p a+qa^2/2-Da^3/6>0\) with peak \(e\) and \(S\le d\). All these savings are equal in both signs and come entirely from \(U\). The upper bound \(S\le d\) in fact holds for every independently positive clamped endpoint, even if reached by a longer path.

## What an independent round-seam path can use

Let \(D\) be the original disk or a balanced enlargement with its actual marking, \(V=M\setminus\operatorname{int}D\) the complete exterior, and \(m^\sigma=E_\sigma(g;D)\), \(v^\sigma=e-m^\sigma\). Suppose an independent smooth path \(k_\lambda\), \(0\le\lambda\le1\), starts at \(g\) and makes an exact round product germ in the marking at its endpoint, up to a smooth positive conformal factor. It changes the metric only in a marked strip \(C\) disjoint from the support of the interior preparation. Use the actual width on each side and include every connector and other changed region in \(C\) when verifying disjointness and costs. Define the signed full-side changes

\[
c_D^\sigma(\lambda)=E_\sigma(k_\lambda;D)-m^\sigma,
\quad c_V^\sigma(\lambda)=E_\sigma(k_\lambda;V)-v^\sigma,
\quad H_C=\max_\lambda\{e+c_D^\sigma(\lambda)+c_V^\sigma(\lambda)\}.
\]

Signature makes \(H_C\) independent of \(\sigma\). Locality makes the joint increments on disjoint supports exactly additive. After a monotone preparation with actual saving \(S\), follow \(k_\lambda\) while keeping the prepared metric on \(U\). The joined peak and signed disk saving at the endpoint are

\[
 H=\max\{e,H_C-S\},\qquad S_D^\sigma=S-c_D^\sigma(1).
\]

The same peak is optimal among continuous schedules of these two specified paths that end at the selected endpoints. Every schedule visits every \(\lambda\), can subtract at most \(S\) there, and starts at energy \(e\). A nonmonotone preparation of peak \(P\) followed by the independent path gives \(\max\{P,H_C-S\}\). In particular \(H_C\ge 2T+d\) precludes a strictly subwall joint peak from any independently subcritical preparation. A certified lower bound \(L\le S\) and upper bound \(\overline H_C\ge H_C\) suffice for the wall test if \(\overline H_C-L<2T\).

When \(H<2T\), the whole path is positive. Stretching and capping in the actual marking gives a positive capped exterior on the same smooth type and a standard capped disk, as in the [full-side comparison](../../02_handle_isolation_and_marked_surgery/notes/CHARGED_DISK_BUDGET.md#the-original-disk-and-its-exterior). The exterior cap has energy exactly \(v^\sigma+c_V^\sigma(1)\), independent of the interior preparation. In each chirality the necessary conditions are

\[
c_V^\sigma(1)\ge m^\sigma-d,\qquad
S_D^\sigma\ge m^\sigma+I-H,\qquad
c_V^+(1)-c_V^-(1)=m^+-m^-.
\]

The last identity uses signature of the entire capped exterior. A certified upper bound \(G^\sigma\ge c_V^\sigma(1)\) with \(m^\sigma-G^\sigma>d\), together with the strict joined wall test, would contradict the defining infimum at this index. The direct recognition test is \(e-m^\sigma+G^\sigma\le T\). The interior saving can enter the joined peak test. The exterior energy, including its entire changed strip, must pass its own test.

Write \(c^\sigma=E_\sigma(g;C\cap D)\). The collar path alone can remove at most \(c^\sigma\) from the complete disk side. Thus any subwall independently prepared matched path of this kind would have

\[
S_D^\sigma\le d+c^\sigma,\qquad H\ge I+m^\sigma-d-c^\sigma .
\]

On the original disk with the whole seam change inside the E61 raw bicollar, \(c^{s_*}\le\eta m^{s_*}\) in its supplied sign, so \(H\ge I+(1-\eta)m^{s_*}-d\). This excludes the path at that index if the right side reaches \(2T\). The source gives a positive lower bound for \(m^{s_*}\) at fixed \(\eta\), with no comparison of that lower bound to \(2T-I\). On the balanced enlargement, a fixed depth \(k\) as in the [balanced disk proposition](../../../../master/manuscript/balanced_disk.tex) makes \(m_i^\sigma+I-2T\) bounded below by a positive constant on the late subsequence. If the final strip raw disk-side energies tend to zero, then \(d_i+c_i^\sigma\to0\). The displayed inequality excludes a matched path with joined peak below \(2T\) after an independently subwall preparation on the original core at every sufficiently late index. This extends the strip-only exclusion to the disjoint prepared path without imposing any derivative bound on that preparation.

There is a restriction even for simultaneous disjoint changes without an independently admissible preparation. Given the actual time-dependent path, suppress one changed region at a time to form two isolated paths, each starting at \(g\). At the first time one isolated energy reaches \(2T\), the other isolated path has retained positive Yamabe sign on the prefix preceding that time. Its energy is at least \(I\) there and at the crossing by continuity. By additivity the combined energy at that time is at least \(2T-d\). In particular any simultaneous path with \(H<2T-d\) has both isolated paths subcritical and obeys the same bound \(S_D^\sigma\le d+c^\sigma\) at a matched endpoint. On the late balanced sequence with vanishing raw strip mass, a simultaneous disjoint path reaching a matched endpoint with its entire joined peak strictly below \(2T\) must have an isolated wall crossing and must attain a peak in \([2T-d_i,2T)\). The claim assumes actual independent restrictions supported in two fixed disjoint regions. A path changing the markings, moving the supports through each other or having a shared transition needs its own estimates.

## Evidence on the supplied sequence

The normalized direction, monotone parameter interval and energy bounds are defined on each genuine physical source. The inputs supply neither a measured nonzero \(B_g\) in an eligible patch nor a negative quadratic evaluation, and they supply no matched path with signed full costs on that source. Thus even a strictly positive local saving remains conditional on an evaluation. The disjoint budget is an obstruction on the selected sequence with the stated support and peak hypotheses. Testing a remaining coupled route requires a common marking with measured transition and exterior costs and a way to control the core on the same joined path. No new smooth type or endpoint has been produced.
