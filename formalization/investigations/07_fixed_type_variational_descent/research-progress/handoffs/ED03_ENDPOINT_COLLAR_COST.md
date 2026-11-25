# DESC-E02c · The necessary collar allowance at the endpoint

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E work. The actual serving variant and reasoning effort
are unavailable. The checkout was `b5de9758f16e14f22162b4a1e091166ea126c389`.
The SHA-256 prefixes were `80dfb1227ed8b95b` for the master manuscript,
`b877c61b76b7e07c` for the companion endpoint charge source,
`9579ec700d355528` for the E55s receipt, `366a3620d48bc89b` for the
geometric energy set, and `839111aae86b6935` for the Lake manifest.
[Lean module](../../../../SmoothPoincare/Variational/EndpointCollarCost.lean) ·
[Master collar-cost corollary](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L480) ·
[Endpoint charge](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/endpoint_charge.tex) ·
[E55s](../../../../../papers/master/research-progress/handoffs/E53_E55_ENDPOINT_CHARGE_20261125.md)

`SmoothPoincare.eventually_lt_endpointCollarAllowance` assumes a bounded-below
admissible energy set of real infimum $T>0$. The source energies tend to $T$
and the retained and collar charges tend to zero. At sufficiently late
indices a strict joined ceiling $e_i+2\sqrt{s_i}\eta_i+\eta_i^2<2T$
supplies a single admissible energy bounded by $(\sqrt{r_i}+\eta_i)^2$.
For each $\delta>0$ the theorem concludes
$\eta_i>\sqrt T-\delta$ at all sufficiently late indices.

For a fixed nonnegative $b=\sqrt T-\delta$, the joined ceiling with $b$ in
place of $\eta_i$ tends to $T+b^2<2T$. The retained bound at $b$ tends
to $b^2<T$. Each late index with $\eta_i\le b$ would therefore supply one
admissible energy strictly below $T$, contradicted by `csInf_le` using
that energy's membership. Nonnegativity of the allowance gives the result
directly when $b<0$.

`SmoothPoincare.geometricEventually_lt_endpointCollarAllowance` uses
$T=4\pi^2$ and the actual `geometricPositiveEnergies` on the original
oriented smooth type. It measures the whole complement of the union of
the supplied disks as $r_i$, the union of the marked collars as $s_i$,
and the intersection of the collars with the retained complement as
$s_{o,i}$. All three use the same physical positive chiral measure of
the source metric at index $i$. Finite additivity for the supplied
measurable almost-everywhere disjoint collars identifies the total
collar charge with the sum of the individual collar charges. At each
late index with strict ceiling the caller supplies an actual smooth
positive-Yamabe metric, its oriented frame, and integrability on the
same type. The accepted cost can be the full retained envelope or the
separate exterior estimate $r_i+2\sqrt{s_{o,i}}\eta_{o,i}+\eta_{o,i}^2$
with $0\le\eta_{o,i}\le\eta_i$. `endpointRetainedCost_le_envelope`
converts it using $s_{o,i}\le r_i$ from measure monotonicity.

The conclusion is the eventual form of the lower limit bound
$\liminf_i\eta_i\ge\sqrt T=2\pi$. The disk selection, construction of
the geometric collar charts, and production of the positive candidate
from a strict joined path are supplied by the application. The theorem
compares the one candidate at its own source index.

## Verification

`lake env lean SmoothPoincare/Variational/EndpointCollarCost.lean` and
`lake build SmoothPoincare.Variational.EndpointCollarCost` passed with
Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry
`788efe978944`. The targeted build completed 4,037 jobs. Fresh-import
checks confirmed all three statement types and reported only `propext`,
`Classical.choice` and `Quot.sound` for their proofs. Lean also checked
$\sqrt{4\pi^2}=2\pi$ and verified that $T=4$, $e=T$, $r=s=0$, and
$\eta=\sqrt T$ exhaust the strict joined ceiling. [Lake manifest](../../../../lake-manifest.json)
