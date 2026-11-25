# CUT-B01/E25g · Normal cut and cap marking

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving runtime does not independently expose its model variant and reasoning effort. This bounded packet checks the Euclidean and topological chart geometry of the marked cut. [Route activation](ACTIVATION_20261125.md)

## Verified geometry

`normalCapMark s J` sends $v$ to $sJv$ in Euclidean four-space. `normalCutPolar s J t` sends a point of the unit sphere to $s e^{-t}J\omega$. For every $s>0$ and real linear isometry equivalence $J$, its norm is $s e^{-t}$ and the signed parameter is recovered by $-\log(\|P_s\|/s)$. Each fixed-time slice ranges over the full sphere of this radius. At $t=0$ the parametrization equals the cap marking. The three radius tests put $t>0$ in the open ball, $t=0$ on its sphere and $t<0$ outside its closed ball. `normalCutPolarHomeomorph` is an actual homeomorphism from the whole cylinder onto punctured Euclidean four-space, with the specified forward map. [Lean source](../../../../FirstOrderTwistor/NormalCutMark.lean)

For a supplied normal chart in the direction from coordinates to the manifold, `exists_normalCutRadius_for_buffer` places any fixed finite buffer and the entire closed cap in that chart for some positive radius below any prescribed positive upper bound. `chartedNormalCap` identifies the closed unit ball with the actual chart image of the closed ball of radius $s$. The range and restriction theorems identify its boundary map with the charted $t=0$ slice, and the charted side equivalences follow from the chart's injectivity on its source. [E03 smooth cap marking](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md#the-cylinder-with-a-prescribed-smooth-cap-marking)

## Orientation and scope

For the E03 marking, the outward-normal-first frame $(\omega,w_1,w_2,w_3)$ transports to the ordered image $(-rJ\omega,rJw_1,rJw_2,rJw_3)$ under the cylinder map with $r=s e^{-t}>0$. The radial-first product orientation therefore picks up the sign of $-\det J$. An orthogonal reflection gives the orientation-preserving cylinder in the chosen oriented normal chart, and the cap uses the orientation inherited from its image. This frame computation is for geometric review. The Lean verification here covers the Euclidean identities and homeomorphisms. Smooth chart naturality and the manifold orientations of these particular maps remain proof obligations. [Local-to-global orientation theorem](ORIENTED_GLUE_RETURN.md)

## Inputs and checks

Verification ran at `0c3399d831d71a1a17c29ffcba14ee0593315cbe` with Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. E03 SHA-256 prefix `6ecef368cfe3b840` matches the input at `7db310a2a9219c537b440d7c2fb39e602a32b729`. [Route input versions](../../research-overview/OVERVIEW.md#inputs-at-setup)

`lake env lean FirstOrderTwistor/NormalCutMark.lean` and `lake build FirstOrderTwistor.NormalCutMark` passed. An import test on the first coordinate unit vector verified that reflection across its orthogonal hyperplane gives $-4\omega$ at $s=2$, $t=-\log 2$, outside the closed cap. With the nonidentity chart $v\mapsto 3v$, it also verified that the cap boundary gives $-6\omega$. `#check` elaborated the polar homeomorphism, marked boundary and fixed-buffer radius declarations. `#print axioms` returned `propext`, `Classical.choice` and `Quot.sound` for the norm and radius recovery, polar homeomorphism and formula, charted cap, boundary, middle range, sides and buffer selection.
