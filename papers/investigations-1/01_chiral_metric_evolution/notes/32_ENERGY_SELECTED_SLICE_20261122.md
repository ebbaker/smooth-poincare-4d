# SP4-CME-E32 — A time slice selected by conditional strain decay

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This finite estimate follows [B26][decision] and the
[frozen request][request]. Input identities are in the [return][return].

Fix \(K>0\), \(t\geq0\), and a smooth actual unadjusted Fine
solution \(A_s\) on \(0\leq s\leq t+1/K\), on a smooth
closed oriented real four-manifold. Use the manuscript's
round-compatible self-dual sign, internal metric
\(\delta_{ij}=-2\operatorname{tr}_{SU(2)}(e_ie_j)\), and
ordinary two-form norm. Let \(g_s=\widehat g_{A_s}\),
\(Q=S^2>0\) with \(\operatorname{tr}Q=3\), \(q=Q-I\), and
\[
F=-KS\Sigma,\qquad dV_{g_s}=\mu/(2K^2),\qquad
T_X=\tfrac12\bigl(S^{-1}(\nabla_X^A Q)S^{-1}\bigr)_0 .
\]
All spatial norms at time \(s\) use \(g_s\), the specified
internal metric, and Frobenius norms on endomorphisms.
The connection \(\nabla^A\) includes the instantaneous
Levi–Civita derivative on all base slots.

Assume pointwise \(|q|\leq\epsilon_*=\min(\epsilon_0,\epsilon_1)\)
on this full interval, with \(\epsilon_0\) from E16B and
\(\epsilon_1\) from E19. Both are at most \(1/8\).
Assume one scalar Sobolev constant \(C_S>0\) works at every
time, in the convention
\[
\|u\|_{L^4(g_s)}^2\leq C_S\left(
\int_M |du|_{g_s}^2\,dV_{g_s}
+K\int_M |u|^2\,dV_{g_s}\right).
\]
Let \(C>0\) be a common upper bound for the nonlinear
coefficients in E16B and E19. Write
\[
E_2(s)=\|T(s)\|_2^2,\quad D_2(s)=\|\nabla^A T(s)\|_2^2,\quad
F_4(s)=\|T(s)\|_4^4,\quad Y(s)=F_4(s)^{1/2}=\|T(s)\|_4^2.
\]
Use \(E_{20}=E_2(0)\), \(Q_{20}=\|q(0)\|_2\), and
\(Y_0=Y(0)<(2CC_S)^{-1}\).
These premises include the full interval of smooth existence.

## Persistence of the initial \(L^4\) smallness on that interval

For the unadjusted equation in the fixed base identification,
\(\partial_s\mu=0\) pointwise by E02A. The fixed \(K\)
condition therefore also gives \(\partial_s dV_{g_s}=0\).
The time-dependent tensor norms still vary with \(g_s\).
The E16B and E19 inequalities used below already include
the derivatives of the tensor contractions.
[E02A pointwise volume identity][volume] ·
[E16B][strain2] · [E19][strain4].

Set \(G_4(s)=\int_M |T|^2|\nabla^A T|^2\,dV_{g_s}\).
E19 gives \(F_4'\leq-8G_4-KF_4+C\int_M|T|^6\,dV_{g_s}\)
on the assumed pinching interval. Applying the scalar Sobolev
bound to the smooth scalar \(|T|^2\), and using
\(|d(|T|^2)|\leq2|T||\nabla^A T|\), gives
\[
\|T\|_8^4\leq C_S(4G_4+KF_4),\qquad
C\int_M |T|^6\,dV_{g_s}\leq CC_SY(4G_4+KF_4).
\]
For the second inequality use Hölder with \(|T|^2\) and
\(|T|^4\). If \(Y\leq(2CC_S)^{-1}\), the nonlinear term
is bounded by \(2G_4+(K/2)F_4\). In particular,
\(F_4'\leq-(K/2)F_4\) on that portion of the interval.
By continuity, a first time of equality with the critical
size would have
\(Y(s)\leq Y_0 e^{-Ks/4}<(2CC_S)^{-1}\), a contradiction.
Thus the smallness persists and
\[
F_4(s)\leq F_4(0)e^{-Ks/2},\qquad
Y(s)\leq Y_0e^{-Ks/4}.
\]
The \(K/4\) rate is for the **squared** \(L^4\) norm.
For the \(L^4\) norm itself the rate is \(K/8\).
[E19 quartic energy and absorption][strain4].

## Decay of \(E_2\), \(q\) and the selected time

E16B supplies \(E_2'\leq-D_2-KE_2+C\int_M|T|^4\,dV_{g_s}\).
The pointwise Kato inequality for the metric connection and the
scalar Sobolev estimate, applied to \(|T|\) by a smooth
approximation at its zeros, give
\[
C\int_M |T|^4\,dV_{g_s}
\leq CC_SY(D_2+KE_2)\leq\tfrac12(D_2+KE_2).
\]
It follows that \(E_2'\leq-\tfrac12D_2-\tfrac K2 E_2\).
Differentiating \(e^{Ks/2}E_2(s)\) gives the first bound below.
Integrating the same differential inequality between \(t\)
and \(t+1/K\), and using nonnegativity of both \(E_2\)
and its integral, gives the second:
\[
E_2(s)\leq E_{20}e^{-Ks/2},\qquad
\int_t^{t+1/K} D_2(s)\,ds
\leq2E_2(t)\leq2E_{20}e^{-Kt/2}.
\]
[E16B quadratic energy and Sobolev absorption][strain2].

The common pinching premise implies \(|q|\leq1/8\), so the
E05 estimate \(\mathcal P'\leq-36K\mathcal P\) applies,
where \(\mathcal P(s)=\int_M|q(s)|^2\mu\).
The prescribed volume gives
\(\mathcal P(s)=2K^2\|q(s)\|_2^2\) at each time, with
\(\mu\) fixed pointwise on the interval.
Taking the square root yields
\[
\|q(s)\|_2\leq Q_{20}e^{-18Ks}.
\]
[E05 pinched defect energy estimate][defect].

The function \(D_2\) is continuous in time by smoothness
and compactness. On the closed interval \([t,t+1/K]\)
there is therefore some \(\tau\) where \(D_2(\tau)\)
is at most its average. This gives
\[
\|\nabla^A T(\tau)\|_2\leq \sqrt{2KE_{20}}\,e^{-Kt/4}.
\]
Only the selected time is used. A pointwise-in-time bound of
this size for the gradient does not follow from the integrated
estimate.

Write \(c_R=42+8\sqrt3\) and
\(R_K=K|q|+6|\nabla^A T|+c_R|T|^2\) as in E09.
The triangle inequality in \(L^2(g_\tau)\) and
\(\||T|^2\|_2=Y\) give the requested constants:
\[
\boxed{\|R_K(\tau)\|_2
\leq KQ_{20}e^{-18Kt}
 +\bigl(6\sqrt{2KE_{20}}+c_RY_0\bigr)e^{-Kt/4}.}
\]
[E09 curvature comparison](11_TRANSPORT_CURVATURE_COMPARISON_20261122.md).

## A sufficient waiting time for a supplied threshold

For a supplied threshold \(\theta>0\), put
\(A_*=KQ_{20}+6\sqrt{2KE_{20}}+c_RY_0\).
The bound above is at most \(A_*e^{-Kt/4}\).
If \(A_*=0\), take \(t=0\).
If \(A_*>0\), take any
\[
t\ \geq\ \frac4K\max\{0,\log(2A_*/\theta)\}.
\]
Then \(A_* e^{-Kt/4}\leq\theta/2<\theta\).
This gives a strict threshold even at equality in the
waiting-time inequality. In either case, the actual solution
and the assumed bounds must be supplied through \(t+1/K\).
The argument proves the existence of one time slice,
with no conclusion from the separate static recognition
packet and no global existence or convergence assertion.

[decision]: ../brainstorm/notes/B26_GOOD_SLICE_SPHERE_ROUTE_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E32_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E32_RETURN_v1.md
[volume]: 04A_NONLINEAR_Q_20261122.md
[defect]: 07_PINCHED_ENERGY_GAP_20261122.md
[strain2]: 18B_STRAIN_ENERGY_ESTIMATE_20261122.md
[strain4]: 20_CRITICAL_STRAIN_ENERGY_20261122.md
