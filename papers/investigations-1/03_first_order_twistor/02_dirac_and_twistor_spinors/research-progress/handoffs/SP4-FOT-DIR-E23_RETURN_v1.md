# SP4-FOT-DIR-E23 · Metric variation of the degree comparison at an eigenmap · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing was `gpt-6.2-sol` / `ultra`.
Actual helper and selected lead model identifiers and reasoning efforts
were unavailable. [Request v1](SP4-FOT-DIR-E23_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Technical note](../../notes/DIR_E23_20261124.md).

**Completed.** HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc`
and all eight frozen working-tree digests matched. Both
$H=F^*h-(\lambda/4)g$ and $T=\operatorname{Ric}-3F^*h$ are
transverse-traceless. Differentiation of the simple constant ground
state and the scalar curvature formula gives the derivative of the
lowest eigenvalue as $-\int_M\langle T,K\rangle\,dV_g$ in direction $K$.
In direction $H$, the [E21 identity](../../notes/DIR_E21_20261124.md)
gives the pointwise potential derivative $|\nabla dF|^2+4|H|^2$.
Its integral vanishes exactly for homothetic diffeomorphisms. Otherwise
small positive steps raise the lowest eigenvalue above zero with $F$
fixed. The path can be normalized to volume one with the same tangent.

A finite family independent of the limiting map is
$K_{ab}=(d\phi_a\odot d\phi_b)_0$ for an orthonormal real basis of the
first scalar eigenspace. If the moments of
$\operatorname{Ric}_0-3(f_j^*h)_0$ against all these tensors tend to zero,
strong ambient $W^{1,2}$ convergence makes the pullback tensors converge
in $L^1$. The limiting stress pairs to zero with $H$, which lies in the
fixed span. The variation then gives a homothetic diffeomorphism and
zero limiting stress against all smooth test tensors. This uses
convergence of tensor moments without differentiating eigenvalues along
the sequence.

Derivation of those moments for optimizing degree-one maps remains an
additional premise for [B13](../../brainstorm/notes/DIR_B13_FULL_TARGET_STRESS_20261124.md).
The return establishes no variational existence or stationarity of a
near-zero sequence.
