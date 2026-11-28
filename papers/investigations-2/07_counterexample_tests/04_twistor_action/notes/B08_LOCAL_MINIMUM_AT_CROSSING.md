# Strict local minimality with a degenerate Dirichlet Hessian

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex, author-selected GPT-6.2 Astra/ultra. Independent backend metadata unavailable. Baseline `280376dd7a18`. Fixed flat unit periodic spin cylinder, positive chirality, exact full Dirichlet traces \(e^{\pm b}\sigma\). The proof below gives the analytic implication from the [E23 reduced quartic](E23_NULLSPACE_QUARTIC.md) and the [E14 real Dirichlet Hessian](E14_FIRST_NEGATIVE_MODE.md). It uses a \(C^1\) neighborhood in the smooth fixed-trace class.

Put \(\mathcal S(v)=J_g^4(e^{bt}(\sigma+v))\), \(v|_{\partial M}=0\). For small \(C^1\) norm this is the integral of a smooth function of the first jet with uniformly bounded derivatives of every fixed order. At \(0<|b|<b_{\rm H}\) the Hessian \(H=D^2\mathcal S(0)\) controls \(\|v\|_{H^1}^2\) by E14 and interval Poincaré. The integrated Taylor remainder after the quadratic term is bounded by \(C_b\|v\|_{C^1}\|v\|_{H^1}^2\). Thus each such radial field is a strict local minimizer.

Fix \(b=b_{\rm H}=51\pi/16\), let \(N=\ker H\) in the zero-trace space, and write \(v=k+y\) with \(k\in N\) its real \(L^2\)-orthogonal projection. This projection is bounded into every smooth norm since the six modes are smooth. On the orthogonal complement there is a constant \(c>0\) such that \(H(y,y)\ge c\|y\|_{H^1}^2\). Indeed the transverse Dirichlet eigenvalue ratio relative to \(|\xi|^2+\omega_n^2\) tends uniformly to a positive constant off every sufficiently large finite set, and all nonresonant low ratios are positive. The scalar/longitudinal block already controls its full gradient. Time Poincaré controls its \(L^2\) norm.

Write \(|k|=\|k\|_{L^2}\) and \(D^j=D^j\mathcal S(0)\). The cubic term \(D^3[k,k,k]\) vanishes: a translation by half a period in all three torus coordinates simultaneously takes \(k\) to \(-k\) and preserves \(\mathcal S\). For \(z\) of zero trace put
\[
 F(k,z)=\tfrac12H(z,z)+\tfrac12D^3[k,k,z]+\tfrac1{24}D^4[k,k,k,k].
\]
This is the fourth-order coefficient on \(v=\epsilon k+\epsilon^2 z\). Components of \(z\) in \(N\) do not affect \(F\), by the same half-translation (or polarization on \(N\)). The linear term in \(z\) is continuous on \(H^1\) with norm \(\le C|k|^2\). The quadratic form on the orthogonal complement is an inner product equivalent to the \(H^1\) norm there. By Hilbert-space representation there is a unique minimizer \(z_k\) in this complement, with \(\|z_k\|_{H^1}\le C|k|^2\), homogeneous quadratic in \(k\). Completing the square gives
\[
 F(k,y)=q(k)+\tfrac12 H(y-z_k,y-z_k),\qquad q(k)=F(k,z_k).
\]
The required E23 estimate is \(q(k)\ge c_0 |k|^4\) for one \(c_0>0\) for all \(k\in N\). Under it, \(F(k,y)\ge c_1(|k|^4+\|y\|_{H^1}^2)\), since \(\|y\|_{H^1}^2\le2\|y-z_k\|_{H^1}^2+2C^2|k|^4\).

Here is the remainder estimate needed to use this comparison in infinite dimension. For \(\|v\|_{C^1}<\delta\), the finite rank projection gives \(|k|+\|y\|_{C^1}\le C\delta\). Taylor-expand first in \(y\) around \(k\), then in \(k\) at zero. The variation in the quadratic coefficient of \(y\) along \(k+s y\) costs at most \(C\delta\|y\|_{H^1}^2\) by the pointwise first-jet formula. The linear coefficient at \(k\) equals \(\tfrac12 D^3[k,k,y]+O(|k|^3\|y\|_{H^1})\), since \(D\mathcal S(0)=0\) and \(H(k,y)=0\). The purely \(k\) term equals \(\mathcal S(0)+D^4[k,k,k,k]/24+O(|k|^5)\). In particular the total error relative to \(F(k,y)\) is bounded by \(C'\delta(|k|^4+\|y\|_{H^1}^2)\). Taking \(\delta\) small absorbs it. This proves strict local minimality at the crossing provided the stated reduced-quartic bound holds. The same statement holds for the opposite crossing by time-space inversion. The zero slope has global uniqueness from zero action independent of any Hessian argument.

This comparison uses the first-jet neighborhood of each radial field. It makes no assertion about arbitrary fields far from that neighborhood. The earlier implicit-function theorem for perturbed full traces at \(b=1/200\) retains its original neighborhoods and quantifiers.
