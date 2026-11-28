# Research overview — Zero circles

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. An investigation of the [second series](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Objective

Where do pole forms vanish? In particular, does every positive conformal class on $S^4$ with chiral energy below $8\pi^2$ have a zero-free pole form at some point, and what is the structure of the set on which the pole triple degenerates?

Build and validate a computation of pole forms for classes on $S^4$, run the experiment that decides gate 1, and develop the structure theory of the degeneracy set far enough to say what must happen on an exotic sphere.

## Setting

The conventions are those of the [second master's overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions). This investigation adds the following.

- *Classes on the standard sphere.* On $\mathbb R^4=S^4\setminus p$ with the flat class $c_0$, a class $c$ is a bundle map $\mu:\Lambda^+_0\to\Lambda^-_0$ with $|\mu|<1$ whose graph is $\Lambda^+_c$. When $\mu$ has compact support, $c$ is flat near $p$.
- *The flat transform.* $T_0$ is a Fourier multiplier of degree zero on $L^2(\Lambda^-_0)$. For a constant self-dual $\omega^0$ and compactly supported $\mu$, the pole form with that leading term should be $\omega=\omega^0+(I+T_0)\psi$ with $\psi=(I-\mu T_0)^{-1}(\mu\,\omega^0)$, where the inverse is a Neumann series in $L^2$ because $T_0$ is an isometry. *Written out at setup from the equation $d^-_0A=\mu\,d^+_0A$; unchecked; the first item of ZERO-E01.*
- *The bridge question.* For a class $c$ on $S^4$ with $Y(c)>0$ and $e(c)<8\pi^2$: is there a point $p$ and a direction $u$ for which $\omega_u$ has no zero on $S^4\setminus p$?
- *Detection.* A computed form is called zero-free on a grid only with a bound that controls the form between grid points. What counts as evidence, and what would count as a counterexample given that the question quantifies over every $p$, is decided by ZERO-B01.

## Inherited at setup, with the original evidence level

- **The calibration family $c_\varepsilon$.** Closed-form pole forms at the fixed point of a $U(2)$-invariant family, with energies from $0.17\,T$ to $1172\,T$ in the sampled range, all with a definite triple. `check_06` of the [checks](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md). Checked case. It is the validation target of ZERO-E01.
- **Zeros can be created.** Setup attributed single-circle creation from a symplectic ball to Perutz, from abstracts and excerpts. **Import, corrected after primary inspection:** use Taubes Prop. 2.1 from an initially symplectic form; Perutz Thm. 1.4 performs a saddle on existing circles. The [source reading](../notes/E03_LOCAL_SOURCES.md) gives the precise distinction and boundary conditions.
- **Generic zero sets are circles.** Proved for harmonic self-dual forms on closed manifolds (Honda; LeBrun). Import; unread. Not proved for pole forms.
- **A1 and the leading term.** Statement of [investigation 01](../../01_chiral_transfer_and_pole_forms/README.md); a proof sketch. This investigation uses the statement.

## Inputs that need a global extension

A fast Fourier transform computes on a torus, while the transform acts on $\mathbb R^4$ with a kernel that decays like $r^{-4}$; the periodization error must be measured against the exact family. Certifying that a form has no zero needs a Lipschitz bound, and certifying $Y(c)>0$ and $e(c)<8\pi^2$ for a computed class needs its own argument. With compactly supported $\mu$ the pole point lies in the flat region; other pole points need a Möbius change of chart, after which $\mu$ no longer has compact support. A numerical result at sampled points says nothing about all points. The structure of the degeneracy set $H$ and of the kernel map $\kappa$ described in the proposing note is a generic expectation without proof.

## Place in the route to the conjecture

This investigation owns the experiment of [gate 1](../../../master-2/research-overview/OVERVIEW.md#the-route-and-its-gates). A positive class below $8\pi^2$ on $S^4$ with no zero-free pole form would show that the frame cannot serve the recognition statement of the first master. If none is found, the statement that an entered class has a zero-free pole form becomes a candidate form of that recognition statement, and the regularity of an attained Bach-flat minimizer is the natural setting for it. The structure theory feeds gate 2.

## Unresolved decisions

The families and the standard of evidence for the gate experiment (ZERO-B01). Which invariant of the pair $(H,\kappa)$ to study first (ZERO-B02). Whether a quantitative relation between energy and zeros should be sought at all (ZERO-B03, reserved until the experiment returns).

## Ownership

Owns the computation of pole forms on $S^4$, the gate experiment and the structure theory of $H$ and $\kappa$. It does not own A1 and A2 ([01](../../01_chiral_transfer_and_pole_forms/README.md)), the curves and fibrations of [03](../../03_lines_and_broken_fibrations/README.md), or the gate decision, which belongs to the [second master](../../../master-2/research-plan/PLAN.md).

## Deductions and checks on activation, 27 November 2026

**Project theorem.** The flat transfer equation for a compact graph and the sufficient Fourier integral norm criterion give a continuum test for the whole marked triple. A compactly supported pullback of the round class shows that chiral energy cannot control this sufficient norm in fixed coordinates. [Derivation](../notes/E01_FLAT.md) · [Criterion](../brainstorm/notes/B01_GATE_SCOPE.md) · [Coordinate dependence](../brainstorm/notes/B03_ENERGY_AND_REMAINING_CORE.md)

**Certificate / heuristic.** The exact geometry enclosures certify positivity and subcritical energy at all frozen parameter rows. Twelve of the thirteen profile/parameter rows have a positive continuum minimum bound at the marked pole, counting the common round control in both profiles. The other row has a positive grid minimum and an unresolved compact core. [Gate handoff](../research-progress/handoffs/TO_MASTER2_GATE1_20261127.md)

**Import / project theorem.** The primary local and parity readings and their application with a marked end appear in [E03](../notes/E03_LOCAL_SOURCES.md). The compact incidence space keeps all kernel directions at lower-rank points. Closedness excludes a rank-one spatial derivative at any zero, and at direction-boundary zeros on the simple determinant locus the spatial rank equals two. [Incidence argument](../brainstorm/notes/B02_INCIDENCE.md)
