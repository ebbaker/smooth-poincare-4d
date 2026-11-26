# E49 · The transverse-traceless test on the round attained minimum

26 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. This bounded E calculation uses the Edition 06 Route 07 Einstein test. Actual serving model and reasoning effort were unavailable. The working tree was based on `9c80575988ad8915ad39515c64400e3d8590cf46`. The inspected SHA-256 prefixes for the Edition 06 plan, master E05 stability note, polarized-Hessian source and scientific 06 attainment manuscript were `d86d59c000b9`, `c80e502aca58`, `b4b879bde3a8` and `719bbea527c6`. [Edition 06 plan](../../research-plan/06_PLAN.md) · [Master E05](../../../../papers/master/notes/E05_CLOSED_STABILITY.md) · [Cotton variation](../../../../papers/master/01_fixed_type_variational_descent/manuscript/cotton_variation.tex) · [Scientific 06](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

## Actual metric and normalization

Use the standard smooth, closed, oriented \(S^4\) with the actual round metric \(g_{\kappa}\) of sectional curvature \(\kappa>0\). For either orientation the Weyl blocks vanish, \(E_\pm=I^+(S^4)=0\), and \(\operatorname{Ric}=3\kappa g_\kappa\) gives \(D=0\), the least possible trace-free Ricci integral on the minimizing stratum. The round metric realizes the Yamabe quotient of its class. For the unit-radius metric \(\operatorname{Vol}=8\pi^2/3\) and \(s=12\). The volume-one representative is \(g_{\kappa}=g_1/\kappa\) with \(\kappa=\sqrt{8\pi^2/3}\) and \(s=12\kappa=8\sqrt6\,\pi\). The new Lean declarations use the unit-radius metric itself. [Round attained path theorem](../../../SmoothPoincare/Variational/BourAttainedVariation.lean) · [Signed charges and volume](../../../SmoothPoincare/Variational/BourTrajectoryBudget.lean) · [Spherical Yamabe equality, Lee–Parker Theorem 3.2](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## The signed Hessian on a physical TT mode

For a smooth, closed, oriented Einstein Riemannian four-manifold, use the convention of Gursky–Viaclovsky (2.4),
\[
 (\Delta_L h)_{ij}=\nabla^p\nabla_p h_{ij}+2R_{ipjq}h^{pq}
                    -\operatorname{Ric}_i{}^p h_{pj}-\operatorname{Ric}_j{}^p h_{ip}.
\]
Here \(h\) is a smooth symmetric covariant two-tensor, transverse means \(\nabla^ih_{ij}=0\), and traceless means \(\operatorname{tr}_g h=0\). Gauss–Bonnet and the fixed signature give
\[
 E_\pm=4\pi^2\chi\pm 6\pi^2\tau+\tfrac14\mathcal F_{-1/3},\qquad
 \mathcal F_{-1/3}=\int_M(|\operatorname{Ric}|^2-s^2/3)\,dV.
\]
The ordered four-index Weyl squared norm is four times the curvature-operator squared norm. In dimension four the volume factor in \(\widetilde{\mathcal F}_{-1/3}\) is one. Theorem 3.10, (3.41), therefore gives the Hessian of each signed energy as
\[
 D^2 E_\pm(h,h)=\tfrac18\big\langle h,(-\Delta_L-s/2)(-\Delta_L-s/3)h\big\rangle_{L^2(g)} .
\]
For a nonzero TT eigentensor with \(-\Delta_Lh=\lambda h\), its value is \((\lambda-s/2)(\lambda-s/3)\|h\|_2^2/8\). If \(s>0\), it is strictly negative exactly for \(s/3<\lambda<s/2\) and zero at either endpoint. The affine family \(g+th\) remains positive definite and has positive scalar curvature for sufficiently small \(|t|\), by compactness and smooth dependence of scalar curvature on the positive metric and its first two derivatives. The first variation vanishes at Einstein, so a negative value gives a strict decrease in both signs for every sufficiently small nonzero \(t\). This supplies an admissible path on the same oriented carrier if the mode exists. [Gursky–Viaclovsky author preprint, (2.4), (3.41) and §4, inspected 26 November 2026](https://arxiv.org/html/1105.4648v2) · [Canonical preprint record](https://arxiv.org/abs/1105.4648v2) · [Yamabe positivity from positive scalar curvature](../../../SmoothPoincare/Variational/PositiveScalarYamabeFour.lean)

## Lower bound and an actual first mode

The algebraic curvature action on trace-free \(h\) is \(R_{ipjq}h^{pq}=\kappa(g_{ij}\operatorname{tr}h-h_{ij})=-\kappa h_{ij}\). Thus \(-\Delta_L=\nabla^*\nabla+8\kappa\) on TT tensors. The window \((4\kappa,6\kappa)\) is already excluded by Green's identity. The sharper lower bound follows by integrating by parts and commuting derivatives. For TT \(h\), the constant-curvature commutator is
\[
 \sum_i [\nabla_i,\nabla_j]h_{ik}=4\kappa h_{jk},\qquad
 \int \nabla_i h_{jk}\nabla_j h_{ik}\,dV=-4\kappa\|h\|_2^2.
\]
Indeed the first curvature action contributes \(3\kappa h_{jk}\) and the second \(\kappa(h_{jk}-g_{jk}\operatorname{tr}h)\). Expanding the squared norm of \(\nabla_i h_{jk}+\nabla_j h_{ki}+\nabla_k h_{ij}\) gives \(3\|\nabla h\|_2^2-24\kappa\|h\|_2^2\ge0\). Any nonzero TT mode consequently has \(\lambda\ge16\kappa\). More generally write \(A=\nabla^*\nabla\). The Hessian equals
\[
 \tfrac18\left(\|Ah\|_2^2+6\kappa\langle h,Ah\rangle_{L^2(g)}
                         +8\kappa^2\|h\|_2^2\right).
\]
The integrated TT bound is \(\langle h,Ah\rangle\ge8\kappa\|h\|_2^2\), hence \(\|Ah\|_2\ge8\kappa\|h\|_2\) by Cauchy–Schwarz. Thus \(D^2E_\pm(h,h)\ge15\kappa^2\|h\|_2^2\) for every smooth TT tensor. [Gursky–Viaclovsky, §7.1, (7.1)–(7.2)](https://arxiv.org/html/1105.4648v2)

For a direct equality witness, take the constant algebraic curvature tensor \(C\) on \(\mathbb R^5\) diagonal on the coordinate two-forms, with \(C_{1212}=C_{3434}=1\), \(C_{1313}=C_{2424}=-1\), and other diagonal entries zero. The curvature symmetries and diagonal form give the first Bianchi identity. Each coordinate row has signed sum zero, so every Ricci contraction vanishes. On the unit sphere set \(h_x(u,v)=C(u,x,v,x)\) for \(u,v\perp x\). This tensor is symmetric and \(h_{e_2}(e_1,e_1)=1\). Tracing over \(T_xS^4\) agrees with tracing over the ambient space because the additional radial summand vanishes. For parallel \(u,v\) along a spherical geodesic with initial velocity \(a\), differentiation gives \((\nabla_a h)(u,v)=C(u,a,v,x)+C(u,x,v,a)\). Summing with \(a=u\) over an orthonormal tangent frame gives zero divergence by skew symmetry and the vanishing ambient Ricci trace.

At the initial point of a unit geodesic the ambient derivatives are \(x'=a,\ x''=-x,\ u'=-\langle u,a\rangle x,\ u''=-\langle u,a\rangle a\), with the same relations for \(v\). Thus the second derivative in the parallel frame is
\[
 -2h(u,v)+\langle u,a\rangle h(a,v)+\langle v,a\rangle h(u,a)+2C(u,a,v,a).
\]
Summing over the four directions gives \(-8h+2h-2h=-8h\), where the last term uses the zero ambient trace and subtracts the radial term \(2h\). Hence this actual TT mode has \(\lambda=16\) for \(g_1\). Constant rescaling preserves the TT equations and scales the eigenvalue by \(\kappa\). This independently checks equality in the lower bound and the Hessian normalization.

## Scope of the return

The round control has a strictly positive TT Hessian on each nonzero mode. Its Ricci-generated directions \(Z\) and \(((Z^\sharp)^2)_0^\flat\) both vanish. The BFA working theorem supplies an attained Bach-flat class conditional on entry for a specified type. The inspected working tree supplies no actual least-\(D\) Einstein metric on an unrecognized type for testing. The missing Einstein input is an identified smooth positive attained Einstein metric on such a carrier, together with a nonzero TT mode in \((s/3,s/2)\) or a geometric recognition argument on that carrier. A non-Einstein test instead needs an actual selected metric, independent variations modulo gauge and a verified signed polarized Hessian. [Scientific 06 post-attainment routing](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/continuation-notes/POST_ATTAINMENT_20261126.md) · [Route 07 register](../research-progress/REGISTER.md)

The Lean file proves the round curvature slot contraction, scalar value and spectral floor \(8\) by the physical closed Green identity. This floor excludes both endpoints and gives coefficient at least \(1\) on unit-radius modes. The sharper \(16\) bound and explicit equality mode above are analytical checks. The general path theorem takes the physical Hessian formula on the supplied path as input and returns simultaneous strict descent in both chiralities. [Lean declarations](../../../SmoothPoincare/Variational/AttainedEinsteinSpectrum.lean)

The pinned Lean toolchain accepted the module. A separate elaboration checked the downstream exclusion of the closed interval \([4,6]\). The axiom audit for the five substantive geometric and descent declarations reported only `propext`, `Classical.choice`, `Quot.sound`.
