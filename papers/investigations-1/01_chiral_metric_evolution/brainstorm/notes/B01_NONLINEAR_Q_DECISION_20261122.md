# SP4-CME-B01 — exact nonlinear Q equation before a pinching hypothesis

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model/effort unavailable, preserved. This is conceptual B work following the [assessed E01 audit](../../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md). It freezes E02 rather than assuming a nonlinear consequence of the round TT calculation.

Choose Q, not the reconstructed metric alone, as the first evolving variable. Retain the reconstructed metric in all covariant derivatives and adjoints. The equation is the manuscript's independent-connection negative gradient, with q=Q−I and H=q−|q|²I/6. Define C_a=∇^A_a H=∇^A_a Q−tr(Q∇^A_a Q)I/3. Bianchi and self-duality give v_ib=4(C^a)_ij F_jab. Differentiate F_i wedge F_j=Q_ij mu and substitute this v. This avoids an assumed Levi–Civita identification.

E02 must produce an exact covariant identity, a separated principal operator on Sym²_0 E and all gradient/curvature terms, then recover q_t=−4(L_E+6K)q at round. The provisional principal candidate to check is

\[
\mathscr L_Q(H)=2(QH+HQ)-\frac43\operatorname{tr}(QH)Q,
\qquad Q_t=\mathscr L_Q(\nabla^a_A\nabla^A_a Q)+\cdots .
\]

This candidate is not accepted before E02. Test its weighted pairing and whether it permits a scalar minimum-eigenvalue argument; a negative answer is a useful scoped disposition. No universal maximum principle is presumed.

For the coordinate program, phi(u)=S u/|S u|, S=Q^{1/2}, measures anisotropy only. Base and time derivatives solve S∇S+(∇S)S=∇Q and S S_t+S_t S=Q_t, respectively. Their constants must expose inverse eigenvalues. Compatibility is exactly d_A Sigma=−[S^{-1}(∇_A S)] wedge Sigma, with b recovered by the audited algebraic inverse. It involves horizontal derivatives, which a pointwise distortion bound does not control. Metric W^+ belongs to the Levi–Civita curvature; it is not identified with q or with the connection twistor Nijenhuis tensor. Scale remains dVhat=mu/(2K²), with locally variable density even at fixed total volume.

Domain: smooth oriented Riemannian four-manifold and smooth definite connection of round-compatible sign, K>0 fixed; identities local, integrated statements only on a closed base. Use a fixed internal frame in time, covariant spatial derivatives on E and the instantaneous reconstructed Levi–Civita connection on form indices. No DeTurck term is added: this packet concerns tensor identities of the unadjusted flow, not a new well-posedness theorem. No independent curvature, noncollapse, spin, integrability or lower eigenvalue hypothesis is silently included.

The two bounded execution parts are E02A (full identity and lower-order inventory) and E02B (principal operator and algebraic maximum-principle test). Their outputs will be critically compared by the lead. A successful formal equation is not a priori control. B02 will then specify the whole-fiber chart comparison, and B03 will select an estimate using the actual uncontrolled terms.


## B01 follow-up decision: volume identity and realizability (same date)

Preliminary E02A/B calculations both return the frozen principal operator.
E02A additionally finds tr Z=0, hence mu_t=0 pointwise for this specific
flow. The lead independently notes a second route: diffeomorphism invariance
forces the gradient to be L²-orthogonal to i_X F for arbitrary compactly
supported X, and self-duality converts this to sum_i v_i wedge F_i=0.
A separate finite E02C check will verify that identity and test whether
adverse minimum-eigenvalue principal jets can actually occur for definite
connections. This is the next dependency needed before interpreting the
matrix-field test. It does not change the flow or presume a singular
trajectory. E02C may return a scoped obstruction to the realization.
