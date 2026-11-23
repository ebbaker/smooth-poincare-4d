# E108 — Audit of global strain energies in the round value basin

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I did not author E104 or its seven frozen derivations.
I authored E41 and E47, upstream inputs of the adjusted and stability
theorems, and previously audited E42 in E44, E49/E50 in E52, and E63
in E67. I also authored the separate E17 and E21 benchmarks. This
audit checks E104's new implication with the assessed inputs. No new
external source was inspected.
[Frozen request][req] · [E104][e104] · [Packet return][ret].

## Disposition

Pass on the specified smooth, compact, closed, oriented round
Riemannian \(S^4\) with the positive perfect chiral \(\mathrm{SO}(3)\)
reference. One fixed initial connection-and-curvature value threshold
gives the already assessed global original flow and gives the
geometric interval hypotheses of the strain-energy estimates uniformly
after recovery. A separate initial live \(L^4\) strain threshold gives
the global absorptions and exponential estimates. No slice conditions
are needed. The estimates concern integrated energies and weighted
spatial gradient integrals on this smooth value basin.
[B59][b59] · [E104 request][req104].

## Fixed splice and arbitrary adjusted tube

Fix the E42 construction at the round reference \(A_0\) using the
native metric and negative Killing pairing. Its common time is
\(\mathcal T>0\), with initial trace in the fixed pair sup norm. For
the actual smooth datum let
\[
 U_{\rm in}=(A_{\rm in}-A_0,F_{A_{\rm in}}-F_0),\qquad
 v=\|A_{\rm in}-A_0\|_\infty+\|F_{A_{\rm in}}-F_0\|_\infty .
\]
Thus \(\|U_{\rm in}\|_\infty\le v\le2\|U_{\rm in}\|_\infty\).
At the round zero datum the nonlinear adjusted terms and the Bianchi
constraint vanish, and \(d_{A_0}^*F_0=0\) by self-duality and Bianchi.
The compatible stationary zero pair is in the E42 uniqueness ball.
E42 (3), (7) applied against that pair therefore bound the value sum
on the adjusted head by \(C_{\rm h}v\). Its curvature component is
the actual curvature of its connection throughout by the compatible
passage. For smooth data the individual comparison in E50 makes the
head smooth through time zero. The length of this comparison may use
higher smooth norms of the datum. The common \(\mathcal T\) and
value estimate do not.
[E42, (3), (7) and compatible passage][e42] ·
[E41–E44 assessment][a42] · [E50, fixed smoothing time][e50].

Fix \(\sigma=\mathcal T/2\) and
\(I=[\mathcal T/4,3\mathcal T/4]\) before setting the input threshold.
E63 at order six on this strip gives a fixed \(C_6\) and datum radius
with \(\|B_0-A_0\|_{H^6}\le C_6v\) for \(B_0=\mathcal A(\sigma)\)
on the adjusted head. This uses finite-order spatial estimates at a
strictly positive time and fixed-reference volume. E50's continuity
at the stationary zero datum in the same fixed-splice \(H^6\) norm
would suffice if no linear bound were wanted. The curvature radius
on the head keeps \(B_0\) in the definite component, and \(B_0\) is
smooth. Thus \(C_6v<\eta_6\) meets E49's strict entry condition
at \(m=6\). The adjusted tail \(B(u)\) then obeys
\(\|B(u)-A_0\|_{H^6}\le C_{\rm st}C_6 e^{-\alpha u}v\)
for all \(u\ge0\). On the fixed compact four-dimensional reference
\(H^6\) embeds into \(C^1\). For \(b=B-A_0\) the affine curvature
identity \(F_B-F_0=d_{A_0}b+\frac12[b\wedge b]\) gives
\[
 \mathcal V(B(u))
 \le C_{\rm v}\big(C_{\rm st}C_6v+(C_{\rm st}C_6v)^2\big),
 \quad \mathcal V(C)=\|C-A_0\|_\infty+\|F_C-F_0\|_\infty .
\]
The decay factor can be retained but is unnecessary for the
uniform tube. Given any prescribed admissible \(\rho>0\), shrink
a single \(\delta(\rho)>0\) inside the E42, E50 and E63 datum radii
so that \(C_6\delta(\rho)<\eta_6\), \(C_{\rm h}\delta(\rho)<\rho\)
and the displayed tail bound at \(v=\delta(\rho)\) is \(<\rho\).
All right sides are fixed functions of \(v\) vanishing at zero.
This puts both adjusted pieces in the chosen tube with the same
strict \(\sigma\) and independent of initial strain, derivative
bounds and time horizon. This verifies E104's value threshold
quantifiers.
[E63, (1) and fixed-time Sobolev consequence][e63] ·
[E62–E67 assessment, E63 only][a63] ·
[E49, (1)–(2)][e49] · [E49–E52 assessment][a49].

## Exact recovery and intrinsic comparison

Use the E50 action \(g\cdot C=(g^{-1})^*C\), with products
composed from right to left. For an adjusted generator \(\xi\),
the inverse recovery \(j=g^{-1}\) solves
\(\dot j=-\xi(C)\circ j\), so \(\dot g\circ g^{-1}
=\operatorname{Ad}_g\xi(C)\). This cancels the adjustment
\(-R(\xi,C)\) when differentiating the action. The local recovery
extends past \(\sigma\) inside the E42 smooth interval. With
\(\gamma=g_{\rm loc}(\sigma)\), the recovered tail is
\((\gamma g_{\rm st}(u))\cdot B(u)\), where \(u=\tau-\sigma\)
and \(g_{\rm st}(0)=\mathrm{id}\). Both recoveries start at
\(\gamma\cdot B_0\) on their right overlap at \(\sigma\);
the constant left factor preserves the physical equation.
Original smooth uniqueness at that definite connection
identifies the paths there. The resulting actual unadjusted
flow is smooth through \(\sigma\), and the intrinsic energies
and their differential inequalities have no splice jump.
The pullback \(A=h^*C\) on the tail uses
\(h=g_{\rm st}(u)^{-1}\gamma^{-1}\), not the reverse order.
No invariance under an arbitrary time-dependent action was used
to establish the trajectory equation here.
[E50, (5)–(12)][e50] · [E49–E52 assessment][a49].

Pointwise near \(F_0\), the positive curvature plane is the
graph of \(F_-F_+^{-1}\) in the fixed Hodge splitting, and
\(F_+\) stays invertible by value closeness. The wedge Gram
components and their trace normalization and volume are smooth
in \(F\) there. The reconstructed conformal class and its
specified volume therefore determine a smoothly varying metric.
On the fixed compact reference, choose the prescribed \(\rho\)
small enough that both adjusted pieces have the reference
curvature-map sign,
\[
 |Q-I|\le\min(\epsilon_0,\epsilon_1),\qquad
 \Lambda^{-1}g_{\rm rd}\le\widehat g_C\le\Lambda g_{\rm rd},
\]
for one fixed \(\Lambda>1\). Here \(g_{\rm rd}=G_0/(2K)\)
and the pinching thresholds refer to E16B and E19.
The volume determinant in dimension four bounds the density
ratio \(dV_{\widehat g_C}/dV_{\rm rd}\) between
\(\Lambda^{-2}\) and \(\Lambda^2\). The first conversion,
on the left of the fixed round Sobolev inequality, gives
\(\|z\|_{L^4(\widehat g_C)}^2\le\Lambda\|z\|_{L^4(g_{\rm rd})}^2\).
On its right, the reverse density comparison costs \(\Lambda^2\),
and the gradient covector inequality
\(g_{\rm rd}^{-1}\le\Lambda\,\widehat g_C^{-1}\) costs one more
factor for the squared gradient. Consequently
\[
 \|z\|_{L^4(\widehat g_C)}^2
 \le C_{S,\rm rd}\left(
       \Lambda^4\int|dz|_{\widehat g_C}^2\,dV_{\widehat g_C}
       +K\Lambda^3\int z^2\,dV_{\widehat g_C}\right).
\]
The common \(C_S=\Lambda^4 C_{S,\rm rd}\) works and uses neither
metric derivatives nor the strain budget. The round scalar
Sobolev constant has the mass \(K>0\) included on the fixed
round metric.

At each time \(A=h^*C\), the base map \(f\) of \(h\) is
orientation-preserving. The wedge Gram and volume show
\(\widehat g_A=f^*\widehat g_C\) and
\(q_A(x)=U_x^{-1}q_C(f(x))U_x\), with \(U_x\) the internal
isometry of \(h\). The bound on \(|q|\) transfers by bijectivity.
To transfer the Sobolev inequality, apply the adjusted version
to \(z\circ f^{-1}\) and use change of variables and the pullback
identity for the differential of a scalar. The resulting
three integrals equal the corresponding original integrals
exactly. Also \(T\) is pulled back on its base slot and conjugated
internally, while \(\nabla^AT\) pulls back on both base slots
because the Levi-Civita connection and internal connection
are natural. This transfers all four strain integrals exactly
at each time. The original metrics in the fixed coordinates
are not asserted to obey the adjusted metric comparison.
The use of E84 is confined to its naturality calculations.
[E84, (1)–(5)][e84] · [E104, scalar Sobolev transfer][e104].

## Separate thresholds and the first exit

Let \(E_2,D_2,F_4,G_4\) be the four normalized integrals of
\(|T|^2,|\nabla^AT|^2,|T|^4,|T|^2|\nabla^AT|^2\).
On the already constructed original solution, the assessed
conditional differential inequalities apply on every finite
interval from zero:
\[
 E_2'\le-D_2-KE_2+C_2\int |T|^4,\qquad
 F_4'\le-cG_4-KF_4+C_4\int |T|^6,\qquad c=8 .
\]
All the integrals here use the normalized live measure.
The required normalized flow equation is checked below.
The interval pinching and scalar Sobolev constant were
supplied before using the initial strain condition.

Put \(Y=F_4^{1/2}=\|T\|_4^2\). Hölder bounds the sixth-power
term by \(Y\|T\|_8^4\). Applying the scalar inequality to
\(|T|^2\) gives
\(\|T\|_8^4\le C_S(4G_4+KF_4)\) since
\(\big|d(|T|^2)\big|\le2|T||\nabla^AT|\).
To absorb at most half the diffusion and half the
zeroth order damping requires
\(4C_4C_SY\le c/2\) and \(C_4C_SY\le1/2\). Thus the quartic
threshold is
\[
 Y_4=(C_4C_S)^{-1}\min(c/8,1/2)=(2C_4C_S)^{-1}.
\]
With \(Y(0)<Y_4\), a first time \(t_*\) of equality on a finite
interval would yield \(F_4(t_*)\le e^{-Kt_*/2}F_4(0)\) by the
inequality valid through that time. Continuity of \(Y\)
holds even when \(Y=0\) and at the splice. The conclusion
\(Y(t_*)\le e^{-Kt_*/4}Y(0)<Y_4\) is a contradiction.
Thus \(F_4'+4G_4+(K/2)F_4\le0\) globally.

For the quadratic energy, apply the scalar inequality to
\(|T|\), using Kato or smooth approximation of the norm at
its zeros. It gives
\(\int |T|^4=Y\|T\|_4^2\le C_S Y(D_2+KE_2)\).
The separate threshold is \(Y_2=(2C_2C_S)^{-1}\).
The initial choice \(Y(0)<\min(Y_2,Y_4)\), together with
the preceding monotonic bound on \(Y\), now gives
\(E_2'+\frac12D_2+(K/2)E_2\le0\) on every finite interval.
This sequence verifies the two thresholds even when
\(C_2\ne C_4\). Neither estimate was used to justify the
adjusted tube, existence, or the geometric interval conditions.
[E16B, (A) and conditional Sobolev consequence][e16] ·
[E16–E17 assessment][a16] · [E19, (1) and first exit][e19] ·
[E19–E21 assessment][a19].

## Clock, four scale factors and integrated estimates

Let \(\kappa=2K\). With \([e_i,e_j]=\epsilon_{ijk}e_k\)
in a manuscript-orthonormal basis, the native negative
Killing metric has components \(2\delta_{ij}\).
Native orthonormal curvature components are therefore
\(\sqrt{2}\) times the manuscript components. The native
four-form \(\frac13\sum_iF_i\wedge F_i\) doubles, giving
\(dV_G=4K^2dV_{\widehat g}\) from the manuscript
volume \(2K^2dV_{\widehat g}\). Thus \(G=\kappa\widehat g\)
and the round native curvature is \(K/\kappa=1/2\).
Both numerator and denominator of the normalized wedge
Gram matrix double, so \(Q\) is the same endomorphism
and \(T\) is the same tensor. Constant internal metric
scaling leaves the endomorphism Hilbert–Schmidt norm
unchanged. The constant base rescaling preserves the
Levi-Civita connection.

In native time the original equation is
\(\partial_\tau A=-d_A^{*G}[(4Q-\frac23\operatorname{tr}(Q^2)I)F_A]\).
The constant term of this matrix expanding \(Q=I+q\) is
\(2I\); it drops from the adjoint by self-duality and Bianchi.
The rest is \(4(q-|q|^2I/6)\). Since
\(d_A^{*G}=\kappa^{-1}d_A^{*\widehat g}\) on two-forms,
the change \(\tau=\kappa t\) gives the exact equation of E16B
and E19. One can check the adjoint factor by noting that the
integrated pairing on \(k\)-forms scales as \(\kappa^{2-k}\).
The normalized scalar Sobolev inequality likewise becomes
the native one with mass \(K/\kappa=1/2\) and the same \(C_S\):
each side and each term with the changed mass receives
the factor \(\kappa\).
[E84, (7) and native clock][e84] · [E16B, conventions][e16].

The squared moduli of \(T\) and \(\nabla^AT\) gain respectively
\(\kappa^{-1}\) and \(\kappa^{-2}\) because they have one
and two covariant base slots. The measure gains \(\kappa^2\).
Thus the factors for \(E_2,D_2,F_4,G_4\) are
\((\kappa,1,1,\kappa^{-1})\), evaluated at corresponding
times. In particular \(Y\) is normalization-invariant.
The derivative of \(E_2^{\mathrm F}\) in \(\tau\) equals
\(E_2'\) in \(t\), while the derivative of \(F_4^{\mathrm F}\)
equals \(\kappa^{-1}F_4'\). After substitution the gradient
coefficients remain \(1/2\) and \(4\), and both native
energy damping rates are \(K/(2\kappa)=1/4\).

Multiplying the normalized inequalities by \(e^{Kt/2}\)
and integrating gives, for all finite \(t\ge0\),
\[
 \begin{aligned}
 e^{Kt/2}E_2(t)+\tfrac12\int_0^t e^{Ks/2}D_2(s)\,ds&\le E_2(0),\\
 e^{Kt/2}F_4(t)+4\int_0^t e^{Ks/2}G_4(s)\,ds&\le F_4(0).
 \end{aligned}
\]
Exactly the native versions result by using \(e^{\tau/4}\).
In the first line the native whole inequality has the
factor \(\kappa\), including the integral from \(d\tau\).
In the second line the \(\kappa^{-1}\) in \(G_4^{\mathrm F}\)
cancels that time factor. Monotone convergence bounds the
full weighted integrals respectively by \(2E_2(0)\) and
\(F_4(0)/4\), with each initial quantity in its own
normalization. The \(L^2\) and \(L^4\) norm decay rates are
\(K/4\) and \(K/8\) in normalized time, \(1/8\) and \(1/16\)
in native time. All rate and integral factors match E104.

For the initial live Lorentz norm
\(\|u\|_{4,1}=4\int_0^\infty m_u(\lambda)^{1/4}\,d\lambda\),
the layer identity \(u=\int_0^\infty 1_{\{u>\lambda\}}\,d\lambda\)
and Minkowski give \(\|u\|_4\le\|u\|_{4,1}/4\) for
\(u=|T(A_{\rm in})|\). Thus
\(\|T(A_{\rm in})\|_{4,1}<4\sqrt{\min(Y_2,Y_4)}\)
suffices for the independent \(L^4\) hypothesis. Under
constant normalization the distribution is
\(m_G(\lambda)=\kappa^2m_{\widehat g}(\sqrt\kappa\,\lambda)\),
so this Lorentz condition is also clock-independent at
the initial slice. The estimates propagate \(L^4\) and
control integrated dissipation. They do not give propagation
of \(L^{4,1}\), the supremum-based integral \(J\), or
existence beyond the assessed basin.
[E104, equations (5)–(8)][e104] · [E84, (6)][e84].

## Consumed versions

The older E16B digest in E16–E17's assessment is historical.
The E16B return records the first typesetting change to
the version starting with 3f1854a9, and the correction
record identifies the next change to the frozen bytes below.
The current inequality (A) and its Sobolev threshold match
the earlier mathematical assessment.
[E16B return][ret16] · [Typesetting record][type] ·
[E16–E17 assessment][a16].

| Input | SHA-256 |
| --- | --- |
| [E108 request][req] | 92dc22ca9fa7a3eab52e6e9b321b997b4d138d07783fd803f039093376ca00e9 |
| [E104 request][req104] | 56977a7612e64ac5f79e203378950429d703965a6f494adb922ea435d29e2761 |
| [B59][b59] | 812edb3f3663fb7040f457d52cb7c1c84c1ab638078755653735e1918a635d5f |
| [E104][e104] | d299a0221bbc097ae5fe991a70301de21ca5aa2b2b9a6c7e98c3f5fc79fc4981 |
| [E16B][e16] | 713aa0bd1c9a3644d57208fa6ae30b4fdcd18df060197b03ef0b39afcb800437 |
| [E19][e19] | 5b7b6ec68d806188a6a54209a7cc513ce0a0a3a10b1582368ef073ae12585228 |
| [E42][e42] | 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77 |
| [E49][e49] | 45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16 |
| [E50][e50] | ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf |
| [E63][e63] | 427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb |
| [E84][e84] | fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9 |
| [E16–E17 assessment][a16] | 1d3ca51d6008c40c0cb2e1f433168ea1217320eeff5688e10d67da69d1787f21 |
| [E19–E21 assessment][a19] | 00eaa6ede5793cf3a5908fc60ff0e267cb03f43cd6da365e80e4c758ac2f83e5 |
| [E41–E44 assessment][a42] | cd4081efe286ebe299a911b4a79c3fe9904ec84601c9a1e6ddc0209c1fb6eb75 |
| [E49–E52 assessment][a49] | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |
| [E62–E67 assessment][a63] | 69d4009570d50e810533fd1f37eb4cba7907690b39ce830774f109ed9053e70f |
| [Typesetting record][type] | 2ae8b3a5ce147f84aa879580f01ae62b3ef122cc2ff73bde1ce5d4adea49d807 |

[req]: ../research-progress/handoffs/SP4-CME-E108_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E108_RETURN_v1.md
[req104]: ../research-progress/handoffs/SP4-CME-E104_REQUEST_v1.md
[b59]: ../brainstorm/notes/B59_GLOBAL_STRAIN_ENERGY_IN_VALUE_BASIN_20261122.md
[e104]: ../notes/104_GLOBAL_VALUE_BASIN_STRAIN_ENERGY_20261122.md
[e16]: ../notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md
[e19]: ../notes/20_CRITICAL_STRAIN_ENERGY_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e49]: ../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e63]: ../notes/63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[a16]: E16_E17_STRAIN_ASSESSMENT_20261122.md
[a19]: E19_E21_ENDPOINT_ASSESSMENT_20261122.md
[a42]: E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[a49]: E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md
[a63]: E62_E67_GLOBAL_CRITICAL_ASSESSMENT_20261122.md
[ret16]: ../research-progress/handoffs/SP4-CME-E16B_RETURN_v1.md
[type]: BROAD_RUN_TYPESETTING_CORRECTIONS_20261122.md
