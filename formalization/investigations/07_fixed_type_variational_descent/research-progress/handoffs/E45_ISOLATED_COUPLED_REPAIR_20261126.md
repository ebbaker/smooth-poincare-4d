# Finite isolation of a coupled marked repair

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E45 execution from source revision `19c187ad8dbe936cf165017c753a94add775ebaf`. The assigned helper setting is Sol 6.2/ultra. Independently reported serving model and effort are unavailable.

[Scientific isolation](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/ISOLATING_A_COUPLED_PATH.md) · [Computed standard product strip](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/COUPLED_PRODUCT_STRIP.md) · [Physical boundary response](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/PHYSICAL_BOUNDARY_RESPONSE.md) · [Lean leaf](../../../../SmoothPoincare/Variational/IsolatedCoupledRepair.lean)

## Complete signed ledgers on the original source

Fix the original oriented closed smooth four-manifold, a positive signed source $g$, the parametrized closed disk $D$ and its complete exterior $V=M\setminus\operatorname{int}D$. Use $T=4\pi^2$, $I=I^+(M)$, $e=E_+(g;M)$ and $d=e-I$. The full connector $A$ occupies the part of $D$ from the inner end of the chosen native width $w>0$ up to the original face. With the supplied smooth defining function $\rho$ use $A=D\cap\{\rho\ge-w\}$ and $\chi=\mathrm{smoothTransition}(2+3\rho/w)$. The transition lies in the middle third of the slab. A protected core in $D\setminus A$ is outside both transitions. A physical interpretation of $w$ uses a defining function that is the actual signed Gaussian arclength on this slab, extended with $\rho\ge0$ on the complete exterior.

For the joined family $h_t$ the actual closed smooth Riemannian isolations are $p_t=\chi g+(1-\chi)h_t$ and $q_t=\chi h_t+(1-\chi)g$. The cutoff is locally constant on the entire exterior and on the deep disk. With the matched oriented frame choices on those regions, metric germ locality transfers the signed chiral measures in their own physical volumes. The marked face has zero physical volume on every such metric. The three pieces $D\setminus A$, $A$ and $V$ sum to the full energy in each sign. This gives
$$
E(p_t)+E(q_t)=e+E(h_t)+J_\sigma(t),\qquad
E(p_t)=e-m_\sigma+E_\sigma(h_t;D)+R_\sigma(t),
$$
with $m_\sigma=E_\sigma(g;D)$, $J_\sigma=E_\sigma(p_t;A)+E_\sigma(q_t;A)-E_\sigma(h_t;A)-E_\sigma(g;A)$ and $R_\sigma=E_\sigma(p_t;A)-E_\sigma(h_t;A)$. The four-term $J_\sigma$ is equal in the two signs by closed signature. All joined changes on $V$ remain in the exterior ledger.

Let $k$ be an actual same-oriented-type positive installed cap metric following the full joined exterior at $t=1$. Write $e_k=E(k)$ and $c_\sigma=E_\sigma(k;D)$. Thus $c_\sigma$ includes the complete replacement disk and every connector inside it. Its signature gives $c_+-c_-=E_+(h_1;D)-E_-(h_1;D)$. The endpoint identities give
$$
\begin{aligned}
E_\sigma(h_1;V)-E_\sigma(g;V)&\ge m_\sigma-d-c_\sigma,\\
R_\sigma(1)&=m_\sigma+e_k-E(h_1)-d-c_\sigma+(E(p_1)-I).
\end{aligned}
$$
The first conclusion uses cap positivity and holds across both branches below. If the protected core $K\subset D\setminus A$ keeps its signed masses, $E(h_1)\ge I+E_\sigma(g;K)-c_\sigma$. For a round fill these conclusions specialize with $c_\sigma=0$.

## The first wall event

The actual isolated energies and sign detectors are continuous on the parameter interval, start at $g$, and obey the scalar-flat wall $2T$ when the detector vanishes. When their maximum stays strictly below $2T$, both classes stay positive and $E(p_1)\ge I$. The exact remainder identity then gives the lower bound $m_\sigma+e_k-E(h_1)-d-c_\sigma$, which is at least its analogue with $I$ in place of $e_k$.

Otherwise compactness of the first wall-level set gives its least time $t_*\in(0,1]$. Both energies are strictly below the wall and both classes are positive before $t_*$. Continuity gives $\min\{E(p_{t_*}),E(q_{t_*})\}\ge I$ also at the wall. In both chiralities
$$
J_\sigma(t_*)=2T+\min\{E(p_{t_*}),E(q_{t_*})\}-e-E(h_{t_*})
\ \ge\ 2T-d-H,
$$
where $H$ bounds the entire joined path. The equality includes simultaneous crossings and retains the actual energies. Positivity can persist beyond the energy wall, as in the specified standard product-strip model. The noncrossing branch explicitly includes strict energy headroom at every time.

`excludesCheapIsolatedConnectors` uses upper allowances for both actual isolated strip charges in one measured sign. They must beat the joint and endpoint thresholds strictly after subtracting the incoming and joined connector energies. The installed cap's whole signed charge is already present. At equality the ledger can describe an attained endpoint or a first hit. Under a joined band $H<2T$, the uniform crossing lower bound is useful while $d$ is less than the headroom. The complete actual endpoint energy gives its separate lower bound without replacing it by the peak.

## Scope and inputs

The cut, its physical defining function, the joined family, matching frame choices on the unchanged regions and the wall premises concern one particular source and width. The packet constructs the smooth affine metrics and derives their signed regional agreements from the specified germs. Selection of an affordable repair and certification of the spectral path premises on the E61 original physical disk remain open. The computed standard control supplies an energy crossing with positive classes and fixed charged cores at its specified width. The particular boundary response and physical jet mismatch on the selected source need their own geometry.

| Input | SHA-256 |
| --- | --- |
| Coupled product strip | `65514406f9eb7e2ff45ddbd198c95831c8178d34e15a3e2d42a597f8fae3147a` |
| Isolating a coupled path | `c5ce2a1b550fe8f6b7141b5a664e18bdc7159952690ba0403b73928a581d55a9` |
| Physical boundary response | `d1b1dced54363b772a5c241ad93deee283c276c3b7ecb96d95e1dcbc286ab351` |
| Fixed-source marked caps | `f2fd7c784c6c1751bb31e0e7061d416579861bd4035ca20b26bcef5d23b263ae` |

## Verification

The direct leaf check and `lake build +SmoothPoincare.Variational.IsolatedCoupledRepair +SmoothPoincare.Variational.MarkedCoreTestTransplant` passed in Lean `4.35.0-rc3`, with 9,856 jobs in the targeted build. The coupled repair leaf SHA-256 is `d080909d2552e548ecd45b1724093d44390612885a560cf35fc719c9c1f46013`. The joint `#check @` and `#print axioms` transcript for 16 declarations has SHA-256 `ce487f66ab09dbf38e941a4e66a4be718df56891f10258b649a34b7bbb4ec02d`. Its axiom union is `propext`, `Classical.choice` and `Quot.sound`.

The [independent applications](E45_COUPLED_CAP_FIXTURES.lean) check simultaneous scalar crossings at time one half, a first hit exactly at the terminal time, and a nonzero compactly supported conformal test with value two at its chosen point and zero off the marked open patch. Its two full integrals are coupled to the same transport. Direct checking of this file passed. The file SHA-256 is `515059e1118fa7b9bd1860298d61c052093b13656ad688637fae956463383555`.
