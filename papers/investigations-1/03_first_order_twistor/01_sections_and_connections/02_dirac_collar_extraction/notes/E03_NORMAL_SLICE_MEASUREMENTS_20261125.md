# Measuring the varying-slice criterion on a transferred ALE strip

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Exact serving model and reasoning effort unavailable.
Conditional fixed-width estimate on a supplied embedded strip.
[Frozen request and input versions](../research-progress/handoffs/E03_REQUEST_20261125.md)
· [Return](../research-progress/handoffs/E03_RETURN_20261125.md)

## Measurement

Fix \(L\ge2\). On \([-2,L+2]\times S^3\) let \(h_0=dt^2+\gamma\) with
\(\gamma\) the sectional-curvature-one round metric. Assume
\(\|h-h_0\|_{C^4(h_0)}\le\eta\) for a smooth positive definite metric \(h\).
The supplied oriented comparison embedding \(F\) into the Riemannian
spin source and positive conformal factor \(f\) satisfy
\(h=f^2F^*g^{\rm phys}\). The orientation down the ALE end and the
marking are those of the [embedded strip transfer](E02_ALE_SPIN_TRANSFER_20261125.md).

For small enough \(\eta\) depending on \(L\), there is an orientation-preserving
embedding \(\Psi:[-1,L+1]\times S^3\to[-2,L+2]\times S^3\) with
\(\Psi^*h=ds^2+g_s\). Its restriction to \([0,L]\times S^3\) gives the
new strip. In the unitary normal spin gauge take
\(H=L^2(S^3,S_\gamma)\) and \(X=H^1(S^3,S_\gamma)\) in the reference
round metric. The chiral operator after normal Clifford identification
is \(\partial_s+A_s\) with zero remainder. Denote the signed round
tangential operator by \(A_{\rm rd}\). Then
\[
 \sup_s\big(\|A_s-A_{\rm rd}\|_{X\to H}+\|\dot A_s\|_{X\to H}\big)
     \le C_L\eta .
 \tag{1}
\]
One may take the spectral gap \(\kappa=3/4\) and graph coefficient
\(C_g=2\) for small enough \(\eta\). Consequently
\(\theta\le (8/3)C_L\eta\) works in
[MATCH-E03 (1)](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E03_VARYING_INVERSE_20261125.md#hypotheses-and-conclusion).

## Normal coordinates and derivative loss

Use the seed \(\{t=-1\}\) and its forward normal
\(\nu_h=h^\sharp(dt)/|dt|_h\), with \(dt(\nu_h)>0\).
Let \(\Psi(s,\omega)\) be the unit-speed \(h\)-geodesic starting there
at \(s=-1\) with this velocity. In fixed angular charts the equation is
\[
 \dot x=v,\qquad \dot v^\mu=-\Gamma(h)^\mu_{\alpha\beta}(x)v^\alpha v^\beta .
\]
The initial velocities differ from \(\partial_t\) by \(O(\eta)\) in \(C^4\).
On fixed bounded-velocity sets the spray differs from the product spray
by \(O(\eta)\) in \(C^3\), since \(\Gamma(h)\) uses one derivative of \(h\).
The reference solution \(((s,\omega),\partial_t)\) stays a unit distance
from the ambient ends. In each of finitely many angular charts use a
smaller initial domain whose reference trajectories remain a fixed
positive distance from the larger chart boundary. The zeroth-order ODE
estimate by Grönwall then keeps perturbed trajectories in the larger
chart, away from the ambient ends and at bounded speed.
Smooth ODE continuation gives existence through \(s=L+1\).
Differentiating the flow equations through order three and applying
Grönwall to the variational equations gives
\[
 \|\Psi-\operatorname{id}\|_{C^3}\le C_L\eta
 \tag{2}
\]
in the fixed charts. In the highest coefficient difference compare the
two sprays in \(C^3\) at the perturbed point first, then move the smooth
reference spray to the reference point. Its fourth derivative is
bounded. The time derivatives in (2) follow from the flow equation
and its mixed derivatives.

Equation (2) gives an orientation-preserving immersion. Equal images
give points \(O_L(\eta)\) apart in the reference product distance.
For small enough \(\eta\) they lie in one of the fixed convex smaller
coordinate boxes with a common target chart. The line segment bound
for \(D\Psi-I\) gives \(|\Psi(x)-\Psi(y)|\ge(1-C_L\eta)|x-y|\) there.
This proves injectivity, and compactness gives an embedding. Unit speed
gives \((\Psi^*h)_{ss}=1\). The \(s\)-derivative of
\(\langle\partial_s,\partial_a\rangle\) equals
\(\tfrac12\partial_a\langle\partial_s,\partial_s\rangle=0\) by the
geodesic equation and commuting coordinate fields. Hence
\((\Psi^*h)_{sa}=0\), since the seed is orthogonal to the initial velocities.
Pullback uses one derivative of \(\Psi\), so the estimate available here is
\[
 \|\Psi^*h-(ds^2+\gamma)\|_{C^2}\le C_L\eta .
 \tag{3}
\]

## Spin gauge and mixed coefficients

Identify the spin structure by the oriented \(F\circ\Psi\) with the
product spin structure, making one choice of lift on the whole strip.
Uniqueness up to isomorphism follows from \(H^1([-1,L+1]\times S^3;\mathbb Z/2)=0\).
Choose a fixed oriented orthonormal round frame on \(S^3\) using unit
quaternions and its spin lift. On the seed slice take the \(g_{-1}\)-orthonormal
frame from the positive symmetric frame map. Parallel transport this
frame and its spin lift along \(+\partial_s\). The transported frame
vectors \(E_j(s)\) remain tangent because the normal is parallel, and
in the angular coordinates satisfy
\[
 \partial_s E_j=-\tfrac12 g_s^{-1}(\partial_s g_s)E_j .
 \tag{4}
\]
The frame starts \(O_L(\eta)\)-close in \(C^1\) to the round frame.
Equation (3) bounds the coefficient in (4) and its angular derivative
by \(C_L\eta\). Integrating (4) and its first angular derivative gives
the same bound on the frame difference and its angular derivative.
Equation (4) then bounds the first time derivative and the mixed first
time and angular derivative by \(C_L\eta\).

Let \(\widehat A_s\) be the signed slice Dirac in this normal parallel
frame. The intrinsic spin connection coefficients use \(g_s\), its
angular derivatives, the frame and its first angular derivatives.
Their time derivatives use the mixed bounds just established.
The hypersurface formula for \(c(+\partial_s)^{-1}D_{\Psi^*h}^+\)
in the parallel frame gives
\(\partial_s+\widehat A_s+\tfrac14\operatorname{tr}_{g_s}(\partial_sg_s)\).
The Weingarten map in the source convention is
\(-\tfrac12g_s^{-1}\partial_sg_s\). Multiplication by
\(\rho_s=(dV_{g_s}/dV_\gamma)^{1/2}\) identifies the slice \(L^2\) spaces
unitarily. The derivative of \(\log\rho_s\) is
\(\tfrac14\operatorname{tr}_{g_s}(\partial_sg_s)\), so the time derivative
under conjugation cancels that scalar term. Thus
\(A_s=\rho_s\widehat A_s\rho_s^{-1}\) and \(B=0\). The \(C^2\) bound
on \(g_s-\gamma\) controls the first angular and mixed derivatives of
\(\rho_s\) used after conjugation. The resulting first- and zeroth-order
coefficient differences from \(A_{\rm rd}\) and their first time derivatives
are \(O_L(\eta)\). This proves (1).
[Bär–Gauduchon–Moroianu, (3.6), (4.1) and §5](https://moroianu.perso.math.cnrs.fr/tex/2005mz.pdf)

The self-adjoint operator \(A_s\) is unitarily equivalent to signed
intrinsic Dirac on the closed slice and has domain \(X\). Its uniform
upper \(X\to H\) bound follows from (1). The round spectrum has gap
\(3/2\), and the round Lichnerowicz formula gives
\(\|w\|_X\le\|A_{\rm rd}w\|_H\) in the covariant \(X\) norm. Hence
\[
 \|A_sw\|_H\ge(1-C_L\eta)\|A_{\rm rd}w\|_H
     \ge\tfrac32(1-C_L\eta)\|w\|_H .
\]
For \(C_L\eta\le1/2\) this gives the claimed \(\kappa\) and \(C_g\).
With \(m=\sup_s\|\dot A_s\|_{X\to H}\le C_L\eta\), the sufficient form
bound \(mC_g/\kappa\) is at most \((8/3)C_L\eta\).
For small enough \(\eta\), MATCH-E03 gives the inverse with positive
trace prescribed at \(s=0\) and negative trace at \(s=L\) in this
normal convention.
[Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf)

## Physical placement and source limits

The new physical ends are \(F\circ\Psi(\{0\}\times S^3)\) and
\(F\circ\Psi(\{L\}\times S^3)\), ordered from the core down the end.
At \(s=0,L\) the projection of \(\Psi(s,\cdot)\) to \(S^3\) is \(C^1\)-close
to the identity and is a diffeomorphism by the same local injectivity
argument and compactness. Reparametrizing by this projection writes
the new cuts as graphs \(t=s+\delta_s(\omega)\),
\(\|\delta_s\|_{C^2}\le C_L\eta\). The new map is \(F\circ\Psi\) and
the exact conformal factor is \(\widetilde f=f\circ\Psi\).
The spinor and Dirac image weights from the physical metric are
\(\widetilde f^{-3/2}\) and \(\widetilde f^{-5/2}\), with the additional
density multiplier \(\rho_s\) for the gauge. The original radial
scale proportional to \(e^{\pm t}\) changes by a factor \(1+O_L(\eta)\).
Actual adjoining domains must be taken at the new cuts, or their traces
must be transported there by a further argument.

Starting the flow at an originally fixed cut can keep that end exact.
Two original cuts in general are not separated by one normal travel
time. For \(h=(1+\epsilon q(\omega))^2dt^2+\gamma\) with \(q\) smooth
nonconstant, \((1+\epsilon q)^2\,dt/ds\) is conserved along each normal
geodesic from \(t=0\). Its initial value is \(1+\epsilon q(\omega_0)\).
On fixed lengths the angular displacement is \(O_L(\epsilon)\) by the
ODE estimate. Therefore \(dt/ds=1-\epsilon q(\omega_0)+O_L(\epsilon^2)\)
and the time to \(t=L\) is \(L(1+\epsilon q(\omega_0))+O_L(\epsilon^2)\).

For the compactification-normal strip, the smooth compactified metric
\(\bar h=a^2h_{\rm ALE}\) differs in normal coordinates from Euclidean
by \(O(r^2)\) with first derivatives \(O(r)\) and bounded higher derivatives
locally. In \(r=\sigma e^{-t}\), division of the pulled-back metric by
\(r^2\) leaves smooth angular coefficients. By the chain rule each
normal-coordinate derivative of a metric coefficient occurs with its
corresponding power of \(r\), so the limit normalized metric differs
from product by \(C_L\sigma^2\) through four derivatives.
For fixed \(\sigma\) and width, smooth comparison on the whole compact
truncation gives \(o_i(1;\sigma,L)\) in \(C^4\) after the fixed chart and
scale changes. Thus \(\eta\le C_L\sigma^2+o_i(1;\sigma,L)\) by choosing
width first, remote center second and \(i\) last. The direct ALE
coordinate version gives \(C_LR^{-\alpha}+o_i(1;R,L)\) whenever the
differentiated ALE expansion is available through order four.
[SEC §§11.3–11.4](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4047)
· [Fixed-strip physical scale and conformal law](E02_ALE_SPIN_TRANSFER_20261125.md)

## Limitation of the weaker slab norm

On a geodesic warped strip with
\(g_s=r_\epsilon(s)^2\gamma\), take
\(r_\epsilon=1+\epsilon^{7/8}\beta((s-s_0)/\epsilon)\), with a smooth
nonconstant bump supported in the interior. The unitary normal gauge
has \(A_s=r_\epsilon^{-1}A_{\rm rd}\). The zeroth-order metric error
is \(O(\epsilon^{7/8})\) and the slabwise \(L^4\) derivative error is
\(O(\epsilon^{1/8})\). Yet \(\max_s|r_\epsilon'|\) is a positive constant
times \(\epsilon^{-1/8}\). On a lowest-magnitude round eigenspinor
the ratio \(|(w,\dot A_sw)_H|/\|A_sw\|_H^2\) equals
\((2/3)|r_\epsilon'|\). The weaker norm alone therefore does not
enforce the relative-form condition or (1), even with a uniform gap.
This obstructs the measurement of that criterion. The larger-amplitude
MATCH-E03 warped example satisfies the form condition directly with
order-one metric differences from the unit-round product in its gauge.
[Warped examples and criterion](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E03_VARYING_INVERSE_20261125.md#geometric-measurement-and-warped-example)

The imported spin hypersurface and round-spectrum passages are the
same checked 25 November 2026 author-hosted passages recorded in
[MATCH-E03](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E03_VARYING_INVERSE_20261125.md#scope-and-source-inspection).
The width-dependent ODE constants and movement of the cuts leave
long-neck coverage and prescribed physical end matching for
EXTRACT-B03/E04.
