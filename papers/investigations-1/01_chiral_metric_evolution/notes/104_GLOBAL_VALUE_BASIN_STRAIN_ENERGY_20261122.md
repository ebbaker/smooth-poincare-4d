# SP4-CME-E104 — Global intrinsic strain energies in the round value basin

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Fixed E work with helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. The [request][req], [B59 decision][b59]
and [return][ret] identify the frozen inputs. I authored E50 and E63,
the E16A round reaction used upstream of E16B, and the related E14
temporal criterion. I previously audited E84 in E86. This is a new
implication from the assessed results, with that overlap in its inputs.

## Statement

Work on the smooth compact closed oriented standard \(S^4\), with
positive perfect round chiral \(\mathrm{SO}(3)\) connection \(A_0\)
and \(F_0=F_{A_0}\). Fix Fine's native negative Killing pairing and
native round reference metric \(G_0\), of sectional curvature \(1/2\).
Use those fixed norms in
\[
 \mathcal V(C)=\|C-A_0\|_{C^0}+\|F_C-F_0\|_{C^0}.
\]
For a compatible definite connection \(C\), write \(G_C\) for the native
Riemannian metric, \(\widehat g_C=G_C/(2K)\) for the metric in the
manuscript convention with fixed \(K>0\), and \(Q_C\) for the
trace-three curvature Gram endomorphism. Set \(S=Q^{1/2}\),
\(q=Q-I\) and \(T=\tfrac12(S^{-1}\nabla^C Q S^{-1})_0\), a
trace-free symmetric internal endomorphism valued one-form. In
\(\nabla^CT\) the base connection is the live Levi–Civita connection.
All measures in the energies are Riemannian volume measures.
[E16B][e16b] · [E19][e19] · [E84, native conventions][e84].

There are fixed \(\delta>0\) and \(\eta_*>0\) such that every smooth
\(A_{\rm in}\) with
\[
 \mathcal V(A_{\rm in})<\delta,\qquad
 \|T(A_{\rm in})\|_{L^4(G_{A_{\rm in}})}^2<\eta_*
 \tag{1}
\]
has the assessed global smooth actual Fine flow \(A(\tau)\)
from \(A_{\rm in}\). Its intrinsic native energies, with all norms,
connections and volume forms taken at the current time, are
\[
 \begin{split}
 E_2^{\mathrm F}&=\int |T|^2\,dV_G,\qquad
 D_2^{\mathrm F}=\int |\nabla^AT|^2\,dV_G,\\
 F_4^{\mathrm F}&=\int |T|^4\,dV_G,\qquad
 G_4^{\mathrm F}=\int |T|^2|\nabla^AT|^2\,dV_G .
 \end{split}
\]
They satisfy, for all native times \(\tau\ge0\),
\[
 \frac{dE_2^{\mathrm F}}{d\tau}+\tfrac12D_2^{\mathrm F}
       +\tfrac14 E_2^{\mathrm F}\le0,\qquad
 \frac{dF_4^{\mathrm F}}{d\tau}+4G_4^{\mathrm F}
       +\tfrac14 F_4^{\mathrm F}\le0.                            \tag{2}
\]
The corresponding normalized quantities use \(\widehat g\) and
\(\tau=2Kt\). In that convention the coefficients \(\tfrac14\) become
\(\tfrac K2\). The threshold \(\delta\) is chosen from fixed-round data,
the fixed head and stability constants and the geometric pinching
constants. The separate threshold \(\eta_*\) is chosen from the
absorptions in E16B and E19 and one fixed scalar Sobolev constant.
Neither threshold depends on any higher smooth norms of \(A_{\rm in}\).
The first condition in (1) alone supplies the flow and its interval
pinching and Sobolev estimates after \(\delta\) is fixed.
[E49–E52 assessment][assess49].

## A common adjusted value tube

Fix the E42 round problem, its comparison norms and common native time
\(\mathcal T>0\). For every prescribed radius \(\rho>0\) of a
reference-centered compatible value tube there is a single value
threshold \(\delta(\rho)>0\) placing both the adjusted head
and all of the adjusted tail in
\(\mathcal V<\rho\). To see this, fix
\(\sigma=\mathcal T/2\) and \(I=[\mathcal T/4,3\mathcal T/4]\).
Let \(U_0=(A_{\rm in}-A_0,F_{A_{\rm in}}-F_0)\). The fixed pair
sup norm is bounded by \(\mathcal V(A_{\rm in})\), and that sum
of sup norms is bounded by twice the fixed pair sup norm.
At zero datum the pair is stationary. E42 (3), (7) therefore gives,
for a fixed \(C_{\rm h}\),
\[
 \sup_{0\le\tau\le\sigma}\mathcal V(\mathcal A(\tau))
 \le C_{\rm h}\mathcal V(A_{\rm in}),
\]
where \(\mathcal A\) is the E42 adjusted connection and the pair
is curvature-compatible at every slice. The actual adjusted head is
smooth through zero for each smooth datum by the individual
comparison in E50. Its individual comparison time can depend on
the datum's smooth norms. The common \(\mathcal T\), \(\sigma\)
and displayed sup bound are fixed across the small value ball.
[E42, compatible passage][e42] · [E50, recovery at zero][e50].

E63 on \(I\) at order six gives a fixed constant \(C_6\) and a fixed
positive datum radius such that
\[
 \|B_0-A_0\|_{H^6}\le C_6\mathcal V(A_{\rm in}),
 \qquad B_0=\mathcal A(\sigma).
\]
The connection is smooth at \(\sigma\). Choose the value threshold so
that \(C_6\delta(\rho)<\eta_6\), the fixed \(H^6\) entry threshold of
E49. That theorem supplies a smooth stable tail \(B(u)\), \(u\ge0\),
with \(B(0)=B_0\) and
\[
 \|B(u)-A_0\|_{H^6}
 \le C_{\rm st} C_6 e^{-\alpha u}\mathcal V(A_{\rm in}).
\]
For \(b=B-A_0\) the exact curvature is
\(F_B-F_0=d_{A_0}b+\tfrac12[b\wedge b]\).
With the fixed \(H^6\subset C^1\) embedding in dimension four,
\[
 \mathcal V(B(u))\le C_{\rm v}
        \big(\|b(u)\|_{H^6}+\|b(u)\|_{H^6}^2\big).
\]
For example, take \(\delta(\rho)\) below the fixed E42/E63 datum
radii and the assessed E50 value-basin radius, below
\(\eta_6/C_6\), and small enough that both
\(C_{\rm h}\delta(\rho)<\rho\) and
\[
 C_{\rm v}\big(C_{\rm st}C_6\delta(\rho)
                      +(C_{\rm st}C_6\delta(\rho))^2\big)<\rho .
\]
All these requirements are simultaneous with fixed \(\sigma\).
Only positive-time smoothing and the stable tail control are used
for this \(H^6\) step. Continuity of the fixed-splice map at zero
from E42 would also suffice in place of the linear E63 estimate.
[E63, fixed-time Sobolev consequence][e63] · [E49, (2)][e49].

## Scalar Sobolev inequality on the original time slices

Use \(g_{\rm rd}=G_0/(2K)\), the round metric of curvature \(K\).
Fix a comparison factor \(\Lambda>1\) and let \(\epsilon_0,\epsilon_1\)
be the pointwise pinching thresholds in E16B and E19. Curvature
determines a positive self-dual plane, its specified volume and the
trace-normalized \(Q\) by smooth pointwise maps on the definite
component. In a local trivialization the plane is the span of an
independent triple. The conformal class of a positive plane and the
scale given by its positive volume depend smoothly on those data.
At \(F_0\) the endomorphism is \(I\) and the normalized metric is
\(g_{\rm rd}\). By compactness of the fixed sphere, choose \(\rho>0\)
small enough that both adjusted pieces with \(\mathcal V<\rho\)
have the reference curvature-map sign and, uniformly in space and
time,
\[
 |q|\le\min\{\epsilon_0,\epsilon_1\},\qquad
 \Lambda^{-1}g_{\rm rd}\le \widehat g\le\Lambda g_{\rm rd}.
 \tag{3}
\]
Set \(\delta=\delta(\rho)\). The estimates in (3) involve only the
adjusted pair values. [E84, curvature plane and volume][e84].

The fixed round scalar Sobolev inequality has a finite constant
\(C_{S,\rm rd}\) in the form \(\|z\|_{L^4(g_{\rm rd})}^2
\le C_{S,\rm rd}\big(\int|dz|_{g_{\rm rd}}^2\,dV_{\rm rd}
+K\int z^2\,dV_{\rm rd}\big)\). This is the usual compact
four-dimensional \(H^1\subset L^4\) inequality, with the fixed
positive mass \(K\) absorbed in its constant. In dimension four,
(3) bounds the volume ratio between \(\Lambda^{-2}\) and \(\Lambda^2\).
It gives \(\|z\|_{L^4(\widehat g)}^2
\le\Lambda\|z\|_{L^4(g_{\rm rd})}^2\). In the opposite measure
conversion, \(dV_{\rm rd}\le\Lambda^2 dV_{\widehat g}\) and
\(|dz|_{g_{\rm rd}}^2\le\Lambda |dz|_{\widehat g}^2\).
Consequently
\[
 \|z\|_{L^4(\widehat g)}^2\le
 C_{S,\rm rd}\left(\Lambda^4\int|dz|_{\widehat g}^2\,dV_{\widehat g}
                 + K\Lambda^3\int z^2\,dV_{\widehat g}\right)
 \le C_S\left(\int|dz|_{\widehat g}^2\,dV_{\widehat g}
                 +K\int z^2\,dV_{\widehat g}\right),
 \quad C_S=\Lambda^4 C_{S,\rm rd}.                              \tag{4}
\]

In E50's left action \(g\cdot C=(g^{-1})^*C\), the original head is
\(g_{\rm loc}(\tau)\cdot\mathcal A(\tau)\) and the original tail is
\((\gamma g_{\rm st}(\tau-\sigma))\cdot B(\tau-\sigma)\), where
\(\gamma=g_{\rm loc}(\sigma)\). Both equal \(\gamma\cdot B_0\) at
\(\sigma\). The head recovery persists a little past \(\sigma\), and
both recoveries solve the actual equation. Smooth uniqueness
identifies them on a right neighborhood of \(\sigma\). Thus these
formulas give one smooth original flow through the splice and at zero.
[E50, (10)–(12)][e50] · [E49–E52 assessment][assess49].

For each slice write \(A=h^*C\) with the exact inverse of the
appropriate recovery map above and the adjusted connection \(C\).
The inverse covers an orientation-preserving diffeomorphism \(f\).
With \(U_x\) its internal fiber isometry, native and normalized
metrics pull back by \(f\), and
\(q_A(x)=U_x^{-1}q_C(f(x))U_x\). In particular
\(\|q_A\|_{C^0}=\|q_C\|_{C^0}\). For every smooth scalar \(z\)
on the original slice apply (4) to \(z\circ f^{-1}\) on the
adjusted slice. Change of variables for volume and the pullback
norm of the differential identify all three integrals, so (4)
holds with the same \(C_S\) on the original slice. No estimate
of the original metric relative to the fixed round coordinates
is needed. In the native metric all three terms of (4) acquire the
factor \(\kappa=2K\), using the native mass coefficient \(1/2=K/\kappa\).
The same \(C_S\) therefore works in that convention. The spatial
pullback on all base and internal slots identifies the live strain
energies at corresponding slices. This
uses E84's naturality identities, without its extra hypotheses
on representatives. Smoothness of the actual flow through
\(\sigma\) gives smooth intrinsic energies there, with no jump.
[E84, (1)–(5)][e84].

## Distinct absorptions and weighted estimates

In normalized time \(t\) and metric \(\widehat g\), define
\((E_2,D_2,F_4,G_4)\) by the same integrals as above. Let \(C_2\)
be the quartic-error coefficient \(C\) in E16B (A), \(C_4\)
the sixth-power-error coefficient \(C\) in E19 (1), and \(c=8\)
the quartic diffusion coefficient. Define the separate thresholds
\[
 Y_2=(2C_2 C_S)^{-1},\qquad
 Y_4=(C_4 C_S)^{-1}\min\{c/8,1/2\}=(2C_4 C_S)^{-1},
 \qquad\eta_*=\min\{Y_2,Y_4\}.                                   \tag{5}
\]
The initial live \(L^4\) norm is the same in both conventions
as checked below. Let \(Y(t)=F_4(t)^{1/2}\). By (3)–(4) on
the original slices, E19 applies on each compact time interval
starting at zero. Indeed, with \(w=|T|^2\), \(|dw|\le
2|T||\nabla^AT|\) and Hölder give
\[
 \int |T|^6\,dV_{\widehat g}
 \le Y\|T\|_{L^8(\widehat g)}^4
 \le C_S Y(4G_4+K F_4).
\]
While \(Y\le Y_4\) this gives \(F_4'+4G_4+(K/2)F_4\le0\).
At a first time \(t_*>0\) with \(Y(t_*)=Y_4\), integration
through \(t_*\) would give \(Y(t_*)\le e^{-Kt_*/4}Y(0)<Y_4\).
Continuity follows from the smooth original trajectory, including
the splice. Thus the quartic inequality holds for all \(t\ge0\),
and \(Y(t)\le e^{-Kt/4}Y(0)\). In particular \(Y(t)<Y_2\)
by (1), (5). The E16B Kato and Sobolev estimate now yields
\(E_2'+D_2/2+(K/2)E_2\le0\) on every such interval. Neither
step is used to derive (3) or (4). [E19, first exit][e19] ·
[E16B, conditional Sobolev consequence][e16b].

For all normalized \(t\ge0\) the two integrating factors give
\[
 \begin{split}
 e^{Kt/2}E_2(t)+\tfrac12\int_0^t e^{Ks/2}D_2(s)\,ds&\le E_2(0),\\
 e^{Kt/2}F_4(t)+4\int_0^t e^{Ks/2}G_4(s)\,ds&\le F_4(0).
 \end{split}                                                      \tag{6}
\]
Thus both energies decay with rate \(K/2\), the \(L^2\) strain
norm with rate \(K/4\), and the \(L^4\) strain norm with rate \(K/8\).
Both weighted integrals have finite limits by monotone convergence,
bounded respectively by \(2E_2(0)\) and \(F_4(0)/4\).

Write \(\kappa=2K\). Across the constant normalization
\(G=\kappa\widehat g\) and \(\tau=\kappa t\), the Gram endomorphism
and strain tensor agree. Constant internal rescaling preserves
endomorphism Hilbert–Schmidt norms and constant base rescaling
preserves the Levi–Civita connection. The one covariant base slot
of \(T\) gives \(|T|_G^2=\kappa^{-1}|T|_{\widehat g}^2\), the
two of \(\nabla^AT\) give \(|\nabla^AT|_G^2
=\kappa^{-2}|\nabla^AT|_{\widehat g}^2\), and
\(dV_G=\kappa^2 dV_{\widehat g}\). Thus at corresponding times
\[
 E_2^{\mathrm F}(\kappa t)=\kappa E_2(t),\quad
 D_2^{\mathrm F}(\kappa t)=D_2(t),\quad
 F_4^{\mathrm F}(\kappa t)=F_4(t),\quad
 G_4^{\mathrm F}(\kappa t)=\kappa^{-1}G_4(t).
 \tag{7}
\]
The derivative of \(E_2^{\mathrm F}\) in \(\tau\) is \(E_2'\)
in \(t\), and that of \(F_4^{\mathrm F}\) is \(\kappa^{-1}F_4'\).
This gives (2), with \(K/(2\kappa)=1/4\).
Equivalently (6) converts to
\[
 \begin{split}
 e^{\tau/4}E_2^{\mathrm F}(\tau)+
       \tfrac12\int_0^\tau e^{r/4} D_2^{\mathrm F}(r)\,dr
      &\le E_2^{\mathrm F}(0),\\
 e^{\tau/4}F_4^{\mathrm F}(\tau)+
      4\int_0^\tau e^{r/4}G_4^{\mathrm F}(r)\,dr
      &\le F_4^{\mathrm F}(0).
 \end{split}                                                      \tag{8}
\]
In native time the \(L^2\) and \(L^4\) norm rates are \(1/8\)
and \(1/16\). The respective full native weighted gradient
integrals are bounded by \(2E_2^{\mathrm F}(0)\) and
\(F_4^{\mathrm F}(0)/4\). [E84, normalization][e84].

## Initial Lorentz sufficiency and scope

For \(u=|T(A_{\rm in})|\) and its distribution function \(m_u\)
in the initial live volume, the E84 convention is
\(\|u\|_{4,1}=4\int_0^\infty m_u(\lambda)^{1/4}\,d\lambda\).
The layer representation and Minkowski in \(L^4\) give
\(\|u\|_4\le \int_0^\infty m_u(\lambda)^{1/4}\,d\lambda
=\tfrac14\|u\|_{4,1}\). Hence a sufficient condition for the
second part of (1) is \(\|T(A_{\rm in})\|_{4,1}<4\sqrt{\eta_*}\).
This uses the initial live metric and volume. [E84, (6)][e84].

The estimates concern spatial integrals along the existing global
smooth flow in the small round reference value basin. They supply
neither propagation of \(L^{4,1}\) nor the time integral of the
spatial supremum of \(|\nabla^AT|+|T|^2\). Their proof requires
neither that temporal budget nor any slice placement, fixed-coordinate
control of the original metric, or uniform bound for the derivatives
of recovery maps. It uses no new source theorem, no enlargement of
the round basin, and no construction on an arbitrary homotopy sphere.
[E16–E17 assessment][assess16] · [E19–E21 assessment][assess19].

[req]: ../research-progress/handoffs/SP4-CME-E104_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E104_RETURN_v1.md
[b59]: ../brainstorm/notes/B59_GLOBAL_STRAIN_ENERGY_IN_VALUE_BASIN_20261122.md
[e16b]: 18B_STRAIN_ENERGY_ESTIMATE_20261122.md
[e19]: 20_CRITICAL_STRAIN_ENERGY_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e49]: 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: 50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e63]: 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e84]: 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[assess16]: ../reviews/E16_E17_STRAIN_ASSESSMENT_20261122.md
[assess19]: ../reviews/E19_E21_ENDPOINT_ASSESSMENT_20261122.md
[assess49]: ../reviews/E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
