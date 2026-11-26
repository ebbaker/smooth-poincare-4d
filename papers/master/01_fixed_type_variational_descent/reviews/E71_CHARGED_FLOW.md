# E71r v1 · Curvature on the pointed flow from a modified charged ball

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded independent execution review at working baseline `5706ef811adc3691fd85e75507a0a399cb81d18d`. Actual serving model and reasoning effort are unavailable. Proof inputs include the working charged-ball section, SHA-256 prefix `5564db2031645b07`, the E69r review, `c0316f4c6e8079c36`, the inherited modified Ricci section, `8cf098e31a6c4038`, and the published Lee–Lee Theorem 1.1 and Lemma 3.2. [Charged-ball proof](../manuscript/modified_ball_charge.tex) · [E69r](E69_LOCAL_SMOOTHING.md) · [Modified Ricci estimates](../manuscript/ricci_concentration.tex) · [Lee–Lee](https://doi.org/10.1017/S0010437X26103595)

**Assessment.** In the fixed strict band at vanishing modified spectral deficit, add the uniform small-ball upper volume ratios of E69. There is a choice of shrinking scale and basepoint for which smooth approximations of the rescaled modified metrics admit a complete, noncompact, nonflat smooth pointed Ricci-flow limit at positive times. Both isotropic pair sums are nonnegative. Energy dissipation gives an integrable bound for the transport of a local Euler pairing, which detects a definite amount of curvature on uniformly bounded balls at all sufficiently small positive times. The scope is forward smoothing with smooth convergence on positive-time intervals. The initial rescaled metrics still need a separate convergence and marking argument.

## First charge radius and uniform evolving form bound

Use volume-one smooth conformal approximations $h_i$ to the modified metrics $q_i$ as in E69. The approximation preserves the uniform Sobolev bound, scalar lower bound $-1$, initial vanishing negative isotropic parts, bounded total squared full curvature, and upper volume ratios through $r_0/2$. The approximation and physical conformal class also preserve the uniform integrability conclusions for the scalar and Weyl pieces in the modified gauge.

Fix $\epsilon>0$ below the E69 charge threshold and the later absorption thresholds, all uniform in the source. For $\rho\ge0$, the maximum of $\|\operatorname{Rm}_{h_i}\|_{L^2(B_{h_i}(x,\rho))}$ is continuous in $\rho$ and attained in $x$. For each smooth compact source the geodesic sphere at fixed radius lies in the exponential image of the tangent sphere, so it is volume-null. This gives joint continuity for center and radius by dominated convergence and then continuity of the maximum by compactness. The value at zero is zero. E69 implies that for every fixed sufficiently small positive radius the maximum exceeds $\epsilon$ at all late indices. Choose the first crossing $a_i$ and an attaining center $x_i$. Then $a_i\to0$. The rescaled metrics $k_i(0)=a_i^{-2}h_i$ have unit-ball curvature $L^2$ norm at most $\epsilon$ at every center and exactly $\epsilon$ at $x_i$. Selecting the radius on $h_i$ gives the exact smoothing premise on the smooth input. The distances and curvature measures transfer the initial charge to $q_i$ upon a $1+o(1)$ enlargement in radius. [E69 quantifiers and smoothing](E69_LOCAL_SMOOTHING.md#initial-metrics-and-source-hypotheses)

Apply the compact-source form of Lee–Lee, Theorem 1.1, by taking the domain parameter greater than the diameter of each rescaled source. With $t_*\le\min(1,\hat T,\epsilon^2)$ the evolving curvature $L^2$ norm on each half-unit ball is at most $2\Lambda_1\epsilon$. The global scalar-weighted Sobolev bound follows from the initial inhomogeneous Sobolev bound by the E69 argument, uniformly in $a_i$ because the scaled zero-order coefficient is $a_i^2$. Absorb the positive scalar term on half-unit ball tests by Hölder. The resulting local ordinary Sobolev inequality gives a uniform lower volume bound $b s^4$ for every $s\le1/4$, including $s=1/16$. The scalar minimum satisfies $R_i(t)\ge -a_i^2\ge-1$ by the smooth maximum principle, hence $dV_{k_i(t)}\le e^t dV_{k_i(0)}$ pointwise.

Here the cover needs overlap controlled uniformly as $a_i\to0$. By the tensor curvature estimate in Lee–Lee (1), choose a uniform $A$ with $\operatorname{Ric}_{k_i(t)}\le 3A/t$. Apply the shrinking-balls inclusion of their Lemma 3.2 to get
\[
 B_{k_i(t)}(z,5/16)\subset B_{k_i(0)}(z,1)
\]
on a shorter fixed horizon with $\beta\sqrt{A t_*}\le 11/16$. The volume density comparison and the initial unit-ball upper volume bound give a uniform upper volume bound for the left side. At a given slice, take a maximal $1/8$-separated net, with disjoint radius-$1/16$ balls, and cutoffs on its radius-$1/4$ balls. The centers whose cutoffs meet a point have their disjoint small balls inside the indicated radius-$5/16$ ball about that point. The lower and upper volume bounds give uniformly bounded overlap. Normalize the cutoffs by the square root of the sum of their squares. Then $\sum_j\chi_j^2=1$ and $\sum_j|d\chi_j|^2\le C$, independent of the index and time. The spatial square partition identity of E69 now gives
\[
 \int U f^2\,dV_t
 \le C\epsilon\int |df|^2\,dV_t+C\epsilon\int f^2\,dV_t,
 \qquad U=|\operatorname{Rm}|_{\rm tens}.
\]
The time horizon, overlap and $\epsilon$ can be chosen with uniform bounds from the initial volume-ratio and Sobolev constants. The proof uses slice-wise cutoffs in an inequality for a fixed time. [Lee–Lee, Theorem 1.1(1) and (3) and Lemma 3.2](https://arxiv.org/html/2510.12673v2) · [E69r square partition](E69_LOCAL_SMOOTHING.md#scalar-weighted-sobolev-and-transport-down-to-zero)

Apply the form bound with $f=U$ in the integrated tensor evolution of $|\operatorname{Rm}|^2$. Its gradient term is $-2|\nabla\operatorname{Rm}|^2$ and its reaction is at most $C U^3$. The volume variation contributes at most $\|U\|_2^2$ by the scalar lower bound. Kato's inequality lets the spatial form gradient coefficient absorb into the tensor gradient term. Choose $\epsilon$ sufficiently small to obtain
\[
 \sup_{t\le t_*}\|U\|_2^2+\int_0^{t_*}\|\nabla\operatorname{Rm}\|_2^2\,dt\le C .
\]
The total initial squared norm is scale invariant and uniformly bounded. For the weak subsolutions $w_\pm=(-F_\pm)_+$ of E69, testing by $2w_\pm$ and applying the same form bound gives $\sup_{t\le t_*}\|w_\pm\|_2^2=o_i(1)$, since the initial squared norms vanish. Each smooth individual flow starts at zero time, and the integrated estimates have constants uniform up to that time. [Chiral reaction review](../notes/E62_ISOTROPIC_FLOW.md#integrated-isotropic-defect-transport) · [Full curvature reaction and energy estimate](../manuscript/endpoint_smoothing.tex)

## A fixed terminal cutoff retains the Euler charge

For every fixed sufficiently small $\tau>0$, the charged initial unit ball lies inside a terminal ball $B_{k_i(\tau)}(x_i,R_*)$ of uniformly bounded radius. The two-point distance estimate in Lee–Lee Theorem 1.1 is stated within radius $r_1$ of its chosen initial center. Reapply that theorem with arbitrary center and with the domain parameter exceeding the diameter. Compact smooth Ricci-flow uniqueness identifies each such flow with $k_i(t)$. Divide a minimizing initial segment of length at most one into at most $\lceil 2/r_1\rceil+1$ pieces of initial length less than $r_1$. The same local two-point bound now gives a common terminal upper bound for each piece and hence for the total distance. Choose $\epsilon$ below the threshold ensuring that the lower inequality's exponent $1/(1-6\Lambda_1\epsilon)$ is positive. Conversely the shrinking-balls inclusion places $B_{k_i(\tau)}(x_i,R_*+2)$ inside an initial ball of fixed radius $R_*+2+\beta\sqrt{At_*}$, with an additional fixed buffer if needed. These radius bounds are independent of $\tau$ and $i$. The initial upper volume through the corresponding fixed rescaled radii holds for all sufficiently large indices because $a_i\to0$. [Lee–Lee, Theorem 1.1 two-point bounds and Lemma 3.2](https://doi.org/10.1017/S0010437X26103595)

Pick a terminal distance cutoff $\chi_i\in[0,1]$ equal to one on $B_{k_i(\tau)}(x_i,R_*)$, supported in the closed radius-$(R_*+1)$ ball, and with terminal Lipschitz constant one. Keep this function fixed on the underlying source for the whole interval $[0,\tau]$. In the Hilbert–Schmidt chiral normalization and the full four-index tensor norm, let $\mathcal E(t)$ denote the Euler form times $8\pi^2$. Then
\[
 \mathcal E(t)=
 \bigl( 2(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)+R^2/12-U^2/4\bigr)\,dV_t.
\]
At zero time the cutoff is one on the initial charged ball. Its support is contained in a fixed initial rescaled ball. In the original $h_i$ metric this latter ball has volume $O(a_i^4)$ by the assumed upper ratio. Scale invariance of squared curvature integrals and the uniform integrability of the scalar and Weyl squares therefore give
\[
 \int \chi_i\mathcal E(0)\le -\epsilon^2/4+o_i(1).
\]

Identify the oriented orthonormal bundles by evolving frames with $\partial_t e_a=\operatorname{Ric}^{\sharp}(e_a)$. This ODE maintains orthonormality. On a fixed Euclidean bundle the derivative of the pulled-back connection is bounded by $C|\nabla\operatorname{Ric}|$. In the variation of the Levi-Civita connection, the term $-(\nabla_X\operatorname{Ric})^\sharp$ cancels the derivative contributed by the frame transport, leaving the antisymmetrization of the other two derivative terms. Differentiating the invariant Pfaffian and using covariant Bianchi gives $\partial_t\mathcal E=d\mathcal C_t$, with $|\mathcal C_t|\le C|\nabla\operatorname{Ric}|\,U$. Stokes applies to the Lipschitz cutoff by approximation on each smooth compact source. The curvature estimate gives a pointwise bound $|\operatorname{Ric}|_{\rm op}\le b/t$ with $b\le C\Lambda_1\epsilon$ on the chosen time horizon. Integrating the evolution of the squared norm of a fixed covector yields $|d\chi_i|_{k_i(s)}\le(\tau/s)^b |d\chi_i|_{k_i(\tau)}$. Choose $b\le1/4$. The signed pairing error is then bounded by
\[
 \begin{aligned}
 \left|\int \chi_i(\mathcal E(\tau)-\mathcal E(0))\right|
 &\le C\int_0^\tau(\tau/s)^b\|\nabla\operatorname{Ric}\|_2\|U\|_2\,ds\\
 &\le C\sqrt{\tau/(1-2b)} .
 \end{aligned}
\]
The last estimate uses the global tensor-gradient dissipation and $\int_0^\tau(\tau/s)^{2b}ds=\tau/(1-2b)$. It is uniform in the source. Fix $\tau_0\in(0,t_*)$ with $C\sqrt{\tau_0/(1-2b)}<\epsilon^2/16$. For each fixed $0<\tau\le\tau_0$, the signed terminal pairing is at most $-\epsilon^2/8$ at late indices. [Chern–Simons, §3, (3.3)–(3.4) and Proposition 3.8](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf#page=6) · [Working Euler normalization](../manuscript/ricci_concentration.tex)

## What survives on the pointed limit

The curvature and injectivity bounds of Lee–Lee and derivative estimates on interior positive-time windows give smooth pointed Ricci-flow compactness on the complete sources. Exhaust the windows away from zero and use a diagonal subsequence. The limit is complete and has $F_\pm\ge0$ by the vanishing $L^2$ negative parts. At a fixed $0<\tau\le\tau_0$, smooth convergence on a buffered pointed ball covers the terminal cutoff supports for sufficiently large indices. This uses completeness and the strict distance margin. A minimizing curve exiting the realized buffered ball must first meet its boundary. Since $|\mathcal E|\le C U^2\,dV_\tau$, the supported negative pairing gives a fixed lower bound on full curvature energy on a bounded ball in the limit. In particular the limit is nonflat. This holds at every such fixed positive time of the same pointed limit. [Lee–Lee, Theorem 1.1(1)–(3)](https://doi.org/10.1017/S0010437X26103595) · [Hamilton smooth compactness](https://doi.org/10.2307/2375080)

The uniform global squared curvature norm and the integrated tensor derivative bound pass to the complete limit by compact exhaustion. On the original rescaled flows with total volume $V_i(t)$,
\[
 |V_i'(t)|\le \|R_i(t)\|_2\sqrt{V_i(t)}\le C\sqrt{V_i(t)}.
\]
Thus $\sqrt{V_i(t)}\ge a_i^{-2}-Ct$. A compact pointed limit would embed as an entire compact four-manifold in each sufficiently late source. Its image would be open and closed, hence the whole connected source, where smooth convergence would bound the volumes. This contradiction makes the pointed limit noncompact. The scalar curvature there is nonnegative and in fact positive at interior positive times. A zero at an interior time would force vanishing at earlier positive times by the scalar strong minimum principle. The scalar equation would then force $\operatorname{Ric}=0$, and $F_\pm\ge0$ with $R=0$ would force $W^\pm=0$. That would contradict the charge at earlier positive slices.

The transport supplies a complete positive-time flow with an actual curvature signal. An identification of its time-zero metric with a smooth marked shrinking comparison, or a classification of these complete noncompact positive-time flows, requires another argument. The upper volume ratios concern the modified metric throughout.
