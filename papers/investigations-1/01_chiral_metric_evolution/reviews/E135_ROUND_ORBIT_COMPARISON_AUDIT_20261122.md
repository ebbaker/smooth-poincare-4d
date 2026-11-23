# SP4-CME-E135 — Quantitative joint round-orbit comparison audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E14, E76 and E131
among the frozen inputs, audited E84 in E86, and audited E90's
geometry in E92. I did not author E133. This is a check of E133's
new implication at its stated scope, using the inherited results.
The head was assessed at dispatch. The E131/E134 lead assessment
arrived during this audit and discharges the stated endpoint
premises. The original conditional text remains frozen. All eleven
input hashes matched. No new primary text was inspected.
[Request][req] · [E133][e133] · [Tail assessment][a131] · [Return][ret].

## Disposition and the separate strain integral

Pass under E133 (1), on a fixed small smooth connection-and-curvature
value basin at the positive perfect chiral \(\mathrm{SO}(3)\)
reference on the standard closed oriented round Riemannian \(S^4\).
Denote its native round metric by \(G\), of curvature \(1/2\).
The no-threshold statement in \(\ell\) is the implication from that
premise, with one fixed \(v\) threshold common to the premise and
the existing global smooth limit theorem. No promotion of the
historical head/tail premise is needed.
[B69][b69] · [Head assessment][a129] · [E131][e131].

On each adjusted piece write \(q=Q-I\) and \(a=A_{\rm adj}-A_0\).
The fixed positive value tube bounds the norm of \(Q^{-1/2}\)
and compares the live and reference metrics. With
\(\nabla^{A_{\rm adj}}Q=D_0q+[\operatorname{ad}(a),q]\),
the strain supremum is bounded by
\(C(\|D_0q\|_\infty+\|q\|_\infty)\).
For the head let \(d_{\alpha j}=2^{j/2}\|\Delta_j q_\alpha\|_8\)
on the supported partition pieces. Bernstein in four dimensions
gives the factor \(2^{kj}\) on \(d_{\alpha j}\) for \(k=0,1\).
The fixed reconstruction contributes these or lower factors,
including the low block. Since \(2^{kj}\le2^{2j}\), their time
integrals are bounded by the \(H_h\) summand in \(E_h(q)\).
Thus the head integral of the strain supremum is bounded by
\(C_h\ell\). On the stable adjusted tail the \(H^5\subset C^2\)
embedding and the same formula give \(C\ell e^{-\kappa s}\)
for \(s=\tau-h\). This integrates to \(C\ell/\kappa\).
Exact slice pullbacks preserve the live supremum at each native
time by E84 (3)–(5). Hence the extra estimate is
\(\int_0^\infty\|T\|_{\infty,\mathrm{live}}\,d\tau\le C_T\ell\).
It uses the head and tail norms individually. An \(L^2\)-in-time
bound of the strain supremum alone would give no such infinite
time integral.
[E129, critical path and strain][e129] · [E131 (14)][e131] ·
[E84, pullback slots][e84].

## Physical velocity constants and clock

Let \(c=2K\), \(g=c\widehat g\) and \(\tau=ct\).
For the manuscript's bracket-orthonormal basis the adjoint trace
matrix satisfies
\(-\operatorname{tr}(\operatorname{ad} e_i\operatorname{ad} e_j)
=2\delta_{ij}\). Thus adjoint-valued components gain \(\sqrt2\)
in a native orthonormal internal frame. Endomorphism Hilbert–Schmidt
norms are unchanged by the uniform internal rescaling. The
normalized \(Q\) is unchanged since both wedge Gram and its trace
density scale by two. Constant metric scaling leaves the spatial
connections unchanged. For the unchanged strain tensor and its
derivative the base degrees give
\[
 |T|_g=c^{-1/2}|T|_{\widehat g},\qquad
 |\nabla^AT|_g=c^{-1}|\nabla^AT|_{\widehat g}.
\]
For an adjoint-valued \(k\)-form velocity the inverse clock adds
\(c^{-1}\), on top of the \(c^{-k/2}\) from its base slots.
Consequently the factors for connection and curvature velocities
are \(\sqrt2 c^{-3/2}\) and \(\sqrt2 c^{-2}\).
This uses ordinary form norms, with each increasing multi-index
counted once. Both summands of \(J\) gain \(c^{-1}\) while
\(d\tau=c\,dt\), so \(J\) is invariant. For the initial Lorentz
norm the distribution changes by
\(m_g(\lambda)=c^2m_{\widehat g}(\sqrt c\,\lambda)\).
Its \(1/4\) power gains \(c^{1/2}\) and the layer variable
change cancels that factor. [E14, norms and relative forms][e14] ·
[E84, native comparison][e84].

In the fixed unadjusted identification the native physical
velocity from E84 (7) reduces to \(-4d_A^{*g}(HF)\),
\(H=q-|q|^2I/6\). Indeed the matrix coefficient is \(2I+4H\)
and \(d_A^{*g}F=0\) by Bianchi and self-duality.
The ordinary two-form convention gives
\((A_\tau)_b=4C^aF_{ab}\) with
\(C_a=\nabla^A_aQ-\operatorname{tr}(Q\nabla^A_aQ)I/3\).
The plus sign is from the negative trace in the adjoint.
With \(S=Q^{1/2}\), put \(N_a=S^{-1}C_aS\).
E14's exact polynomial is
\[
 N_a=2T_a Q-\tfrac23\operatorname{tr}(QT_a)Q
       -\tfrac23\operatorname{tr}(Q^2T_a)I
       +\tfrac29\operatorname{tr}(QT_a)\operatorname{tr}(Q^2)I .
\]
Trace three and positivity give \(|Q|,\|Q\|_{\mathrm{op}}\le3\),
\(|Q^2|,\operatorname{tr}(Q^2)\le9\), and \(|I|\le2\).
The four norm costs are \(6,6,12,12\) times \(|T_a|\).
Thus \(|N|\le36|T|\), unchanged as a covector bound in
the native convention. This polynomial calculation uses
positive \(S\) but no prescribed lower eigenvalue.

For the native direct contraction write
\(\omega_j=(S^{-1}F)_j\). Its wedge Gram is the identity
times \(dV_g\), so this is an orthonormal self-dual triple
in ordinary two-form norms. For a unit self-dual form \(\omega\)
and unit \(X\), split \(\omega\) into the terms containing \(X^\flat\)
and their Hodge stars. The two are orthogonal with equal norm.
Thus \(|\iota_X\omega|^2=1/2\).
For each output internal row the contraction is
\(L(n)_b=\sum_{a,j}n_{aj}\omega_{j,ab}\).
Its adjoint applied to \(Y\) has squared norm
\(\sum_j|\iota_Y\omega_j|^2=3|Y|^2/2\).
This gives the exact \(\sqrt{3/2}\) operator constant,
also after summing the output internal rows. Since
\(C^aF_{ab}=S N^a(S^{-1}F)_{ab}\) and
\(\|S\|_{\rm op}\le\sqrt3\), the resulting bound is
\[
 |A_\tau|_g\le4\sqrt3\sqrt{3/2}\,36|T|_g
                =216\sqrt2\,|T|_g .
\]
There is no further \(\sqrt2\) from the endomorphism factor.
[E14 (2)][e14] · [E84 (7)][e84] · [E133 (4)–(5)][e133].

I also checked the arithmetic in the inherited E14
curvature estimate. Its differentiated polynomial costs
\(36|\nabla T|+26|\nabla Q||T|\), the \(26\) coming
from \(2+4+8+12\). Inverting the strain gives
\(|\nabla Q|\le6|T|\), so the non-derivative contribution
is \(156|T|^2\). With \(P_a=S^{-1}\nabla_a S\),
E14 has \(|P|\le2|T|\) by its symmetric/antisymmetric
decomposition and \(|\operatorname{ad}(A-\Gamma^+)|\le5|T|\)
by its compatibility estimate. The commutator in the relative
curvature formula then costs \(2\cdot2\cdot36|T|^2\),
giving \(300|T|^2\) in the differentiated coefficient.
The remaining matrix product with \(N\) costs at most
\(36(2+5)|T|^2=252|T|^2\).
Antisymmetrizing the first contraction into an ordinary
two-form costs \(\sqrt6\), and the normalized manuscript
self-dual triple in the other contraction costs \(\sqrt2\).
With the overall factor \(4\) the upper coefficients are
\(4(5/2)36=360\) and
\(4((5/2)300+(3/2)252)=4512\).
This checks conversion of the inherited bound while retaining
its relative curvature identity as an assessed input.

In the native curvature estimate the coefficient combines
as \(\sqrt2 c^{-2}K c=1/\sqrt2\), since
\(|\nabla T|\) and \(|T|^2\) each have old-to-native
ratio \(c\). Multiplying the relative \(S^{-1}F_\tau\)
bound by \(S\) uses just the upper bound \(\sqrt3\). Thus
\[
 |F_\tau|_g\le \sqrt{3/2}
        (360|\nabla^AT|_g+4512|T|_g^2).
\]
Neither physical velocity uses an assumed eigenvalue floor.
E14's metric and \(Q\) relative velocities have no base-degree
norm factor as endomorphism norms under constant scaling.
Their time derivative supplies \(c^{-1}\), matching the live
integrand factor. The relative exponent thus keeps
\(C_*=4512\sqrt2\) in the native formulation.
[E14 (1), (3)–(5)][e14] · [E133 (6)–(7)][e133].

## Fixed reference and one limiting pullback

Let \(\mathfrak d=C_*J(\infty)\le C_*C_J\ell\).
The relative velocity bounds integrate on a fixed nonzero
tangent vector \(X\) via \(\log g_\tau(X,X)\),
and on a fixed nonzero internal vector \(w\) via
\(\log\langle Q(A(\tau))w,w\rangle\).
For the latter quotient the test vector for the relative
endomorphism is \(S w\). These estimates give the bilateral
form bounds of E133 (7) in a fixed original identification.
The initial curvature-value tube alone gives
\(g_{\rm in}\le C_0G\) for a fixed \(C_0\). Therefore
\(g_\tau\le C_0 e^{\mathfrak d}G\) and
\(G^{-1}\le C_0e^{\mathfrak d}g_\tau^{-1}\).
In a \(g_\tau\)-orthonormal coframe diagonalizing
the dual comparison, an ordinary \(k\)-form component
gains at most \((C_0e^{\mathfrak d})^k\) in its squared
norm. The square root is
\(C_0^{k/2}e^{k\mathfrak d/2}\). There is no volume factor
in the fixed spatial suprema. Thus the absolute conversion
costs \(Ce^{\mathfrak d/2}\) for \(A_\tau\) and
\(Ce^{\mathfrak d}\) for \(F_\tau\).

Integrating the connection velocity uses the extra strain
integral. For the curvature use
\[
 360|\nabla^AT|_g+4512|T|_g^2
         \le4512(|\nabla^AT|_g+|T|_g^2)
\]
and the given \(J\) with a spatial supremum of the sum.
Both velocities are therefore integrable in the original fixed
\(C^0(G)\) identification, with bounds \(Ce^{\mathfrak d/2}\ell\)
and \(Ce^{\mathfrak d}\ell\).
The connection difference is a one-form in the fixed affine
space, so its integral is unambiguous.

The original smooth solution used by E76 may be taken at its
older fixed splice. At an earlier splice \(h\) the recovered head
extends past \(h\). It agrees at \(h\) with the recovered tail
using \(g_{\rm loc}(h)g_{\rm st}(s)\) in the left action.
Both solve the same physical equation there. Smooth uniqueness
at their common definite datum gives the right overlap.
Original smooth uniqueness from the common initial connection
then identifies the two global physical solutions, irrespective
of their adjusted paths and recovery maps.
E76 supplies a smooth equivariant \(j_\infty\) with smooth
inverse. At its own splice, its recovery limit has order
\(j_{\rm st,\infty}g_{\rm loc}(\tau_s)^{-1}\).
Its same-time pullback of the stable pair yields the joint
limit \((A_\infty,F_\infty)=j_\infty^*(A_0,F_0)\).
The curvature entry also follows directly from naturality of
curvature on the connection entry and smooth convergence.
The base diffeomorphisms of the finite recoveries preserve
orientation, and a smooth diffeomorphism limit with nonsingular
Jacobian retains that sign. This uses no quantitative assertion
on the recovery maps.
[E76 (15)–(16)][e76] · [E131, earlier splice][e131] ·
[E84, curvature pullback][e84].

Integrate to finite time and pass to that given smooth limit.
The resulting bound is exactly
\[
 \|A_{\rm in}-j_\infty^*A_0\|_{C^0,G}
  +\|F_{A_{\rm in}}-j_\infty^*F_0\|_{C^0,G}
        \le C e^{C\ell}\ell .
\]
The constants come from the fixed value basin and premise,
and the exponential factor needs no additional threshold.
Linear dependence on a fixed bounded interval of \(\ell\)
follows by bounding the exponential there. For \(\ell=0\),
both nonnegative velocity integrals vanish. Smoothness gives
stationarity in the original identification and equality with
the one joint limit. The relative comparisons then have
\(\mathfrak d=0\).
[E133 (2), (7)–(9)][e133].

## Exact volume and relative geometry

Let \(g=g_{\rm in}\) and \(h=f_\infty^*G\).
In manuscript normalization
the wedge density is \(2K^2dV_{\widehat g}\).
The internal pairing change doubles it, giving exactly
\(4K^2dV_{\widehat g}=dV_g\) in the native metric.
The original E14 flow has the pointwise unadjusted volume
identity. Taking the smooth limit preserves this tensor
identity, so \(dV_g=dV_h=f_\infty^*dV_G\).
This does not use a pointwise volume assertion in an adjusted
gauge. By naturality the limiting \(Q\) is \(I\).
Taking limits in the original two-sided form bounds and
rearranging gives
\[
 e^{-\mathfrak d}h\le g\le e^{\mathfrak d}h,\qquad
 e^{-\mathfrak d}I\le Q_{\rm in}\le e^{\mathfrak d}I .
\]
For all pairs of base points, integrate the square-root form
comparison along each piecewise smooth curve and take its
infimum over curves with those endpoints. This gives the
distance factors \(e^{\pm\mathfrak d/2}\).
Taking suprema gives the same factors for diameters.
The comparison metric is isometric to \(G\) and has diameter
\(\pi\sqrt2\) at native curvature \(1/2\).

For the scalar spectrum, both \(H^1\) form domains are the
same since the metrics are smooth and uniformly comparable.
Inverse quadratic forms give \(e^{\pm\mathfrak d}\) in the
energy comparison, integrated in the common volume.
The denominator in each Rayleigh quotient is identical.
Applying these estimates on each \((j+1)\)-dimensional
subspace in min–max proves the two scalar eigenvalue
bounds simultaneously for all \(j\ge0\), counting multiplicity
and the shared zero mode. Pullback by the isometry identifies
the comparison spectrum exactly with that for \(G\), giving
\(e^{-\mathfrak d}\lambda_j(G)\le\lambda_j(g)\le
e^{\mathfrak d}\lambda_j(G)\).
Native eigenvalues have the factor \(c^{-1}\) from normalized
ones and native lengths the factor \(\sqrt c\), with the same
dimensionless distortion exponents.

The transported round scalar Sobolev inequality has the
same \(L^4\) and \(L^2\) function norms because the volume
is equal as a form. The gradient energy in \(h\) is at most
\(e^{\mathfrak d}\) times that in \(g\). Thus only the
gradient coefficient gains \(e^{\mathfrak d}\), yielding
\(\|u\|_{4,g}^2\le e^{\mathfrak d}C_\nabla
\int|du|_g^2dV_g+C_2\|u\|_{2,g}^2\).
For the normalization change, squared \(L^4\) and Dirichlet
energy each scale by \(c\) in four dimensions, while squared
\(L^2\) scales by \(c^2\). The round gradient coefficient
can stay the same and the round mass coefficient divides by
\(c\), as E133 states.
[E90, form, distance, spectral and Sobolev comparisons][e90] ·
[E133 (10)–(11) and consequences][e133].

The geometry is relative to one round pullback. The joint
pair estimate is an absolute \(C^0(G)\) estimate relative to
that same pullback, in the original identification. It yields
no bound on the recovering automorphism's distance to the
identity and no simultaneous finite slice theorem. No
mathematical correction to the frozen E133 implication was
needed. Only the assigned audit and return were written.

[req]: ../research-progress/handoffs/SP4-CME-E135_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E135_RETURN_v1.md
[b69]: ../brainstorm/notes/B69_QUANTITATIVE_ORBIT_COMPARISON_20261122.md
[e133]: ../notes/133_CONDITIONAL_ROUND_ORBIT_VALUE_COMPARISON_20261122.md
[e14]: ../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e76]: ../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e90]: ../notes/90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
[e129]: ../notes/129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md
[a129]: E129_E132_INTRINSIC_HEAD_ASSESSMENT_20261122.md
[e131]: ../notes/131_CONDITIONAL_DEFECT_SENSITIVE_TAIL_20261122.md
[a131]: E131_E134_WHOLE_TIME_ENDPOINT_ASSESSMENT_20261122.md
