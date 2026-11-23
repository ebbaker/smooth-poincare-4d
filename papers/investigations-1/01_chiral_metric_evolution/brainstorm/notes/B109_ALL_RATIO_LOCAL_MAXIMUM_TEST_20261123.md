# B109 — Test the scalar ratio maximum mechanism at every threshold

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Conceptual B decision by the selected lead; actual model and effort unavailable and preserved. Fixed subsequent E work is routed to configured gpt-6.2-sol/ultra. [Sole register](../../research-progress/REGISTER.md).

## Reason and fixed family

The assessed local E215/E217 example tests ratio 9/4. The sharp stationary threshold 7/2 and the margin-weighted energy criterion make it useful to decide whether another constant ratio boundary could avoid the same local scalar maximum obstruction. The principal operator suggests one explicit one-parameter extension, not an unconstrained search.

For each r>1 set a=2/(1+r), b=2r/(1+r), Q_r=diag(a,1,b), q=Q_r-I, d=sqrt(det Q_r)=2sqrt(r)/(1+r). This spectrum is positive, simple and trace three, with ratio r. Let f(Q)=log(lambda_max/lambda_min), G its trace-free Frobenius gradient at Q_r, and T=diag(a,-2,b). Then the proposed elementary identities are df(T)=0, L_Q G=diag(-4,0,4), df(L_Q T)=8(r-1)/(r+1), and <G,L_Q G>=2(r+1)^2/r. Also df(q)=(r^2-1)/(2r).

Take B=-G+mu(r)T, with

    mu(r)=(r+1)/(32(r-1)) * [8(r+1)^2/r + 24(r-1)/sqrt(r) + 1].

At a realized jet with first covariant Q derivative zero and scalar Hessian of Q equal to delta_ab B, the scalar f Hessian is -|G|^2 delta_ab. The older K=1 original tangent formula from E215/E217 predicts

    df(4 L_Q B - 24 d q) = 1.

Thus one would have an actual strict local ratio maximum r with positive native direction derivative 1/2 at its center for every r>1. This is the proposed target, not yet assessed. It would show that the local scalar first-contact test fails at every nonround threshold in this chosen family. It would not itself exhibit an actual flow crossing, a closed datum, a global preservation failure, or a singularity.

## Actual local connection route

Use the same oriented Euclidean K=1 model, F_i^*=-sqrt((Q_r)_ii) Sigma_i, A0=one-half sum x^a contraction_a F*. Put U=B-dq/2 and constant covectors V_i^a=-sum_j U_ij J_j dx^a/sqrt((Q_r)_jj). Set A=A0+(1/6)sum_a(x^a)^3 V^a. The assessed affine curvature correction gives Hess Q=dq/2 times delta_ab; the cubic adds U, leaving B. The full covariant antisymmetric correction has zero scalar contraction and zero trace. E235 must verify every coefficient, first-jet vanishing, reconstructed metric normalization and the actual instantaneous original velocity calculation. The tangent is evaluated on A+sigma V_old(A), with no assumed local solution or global extension.

## Bounds, output and escalation

One symbolic r>1 family, no numerical search, new function, arbitrary jets or global gluing. Root owns the choice of mu and the conclusion's scope. E235 derives the formula and local realization; a separate independent audit follows. If the scalar identity, affine correction or finite-radius argument fails, return the precise obstruction to B109. Do not revise the target automatically. The radius and all derivative sizes may depend on r; no uniform r->1 statement is intended. The earlier specific 9/4 packet remains preserved.

Inputs: [E215/E217 assessment](../../reviews/E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md), [E215 derivation](../../notes/215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md), and [E217 direct audit](../../reviews/E217_SPECTRAL_RATIO_JET_AUDIT_20261123.md). No new external theorem is imported.
