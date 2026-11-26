# Marked handle reductions and physical collar comparisons

26 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex assistance. Exact serving model and reasoning effort for this planning revision are unavailable. The early selections use `65f06eaac3ff`. The current selection uses the inputs at `46b5bbb4d340`. [Source versions](../references/README.md) · [Research plan](../research-plan/PLAN.md) · [Parent register](../research-progress/REGISTER.md)

Let $M$ be a closed, connected, oriented smooth four-manifold homotopy equivalent to $S^4$. Metrics and embeddings are smooth and Riemannian. A finite Morse presentation supplies framed attaching maps and identifications of regular levels. A relative handle move must reassemble the same $M$. A metric cut must identify the capped smooth type using the original boundary marking. The two methods can be combined when a marked identification and geometric estimates put the handle level and the metric on the same physical source.

## Reduction on the entire stationary-filled level

A reducible single-attachment cut in either order of an integral rank-one pair with immediate rank-three free outlet forces joint localization. An immediate terminal closing with the original split lower zero permits a strict three-to-two cancellation even for an unknown local two-component closure. On the four-point cut, two opposite mixed returns cannot both survive the capped filling. Four alternating returns can have three surviving classes and arbitrarily high sharp bridge cost at sphere minimum four. [Proof and remaining irreducible cuts](../reviews/REDUCIBLE_CUTS_AND_RETURN_COST_20261126.md)

## Current selection

Look first for one actual terminal pair with both native cuts independently certified irreducible, the split lower zero, both original framed tubes and the genuine immediate upper closing. The earlier packets do not supply an untreated diagram with all these data. From its upper co-cores and belts, test one embedded framed band and one target belt for a single geometric intersection. Recover the induced closing and its inverse on any rank-two successor. If the input is unavailable, test a genuine unresolved $S^3$ link with $Y_2$ surgery and its carried closing. Both residual irreducible cuts have $b_1=2$, precluding PSC domination there. The seam test precludes an umbilic realization of either level in an entering class. [Current plan](../research-plan/PLAN.md#the-next-terminal-pair) · [Reverse-test proposal](../brainstorm/notes/AFTER_REDUCIBLE_CUTS_RESEARCH_PRIORITIES_20261126.md) · [Source versions](../../../master/research-progress/handoffs/DIRECT_ENTRY_OWNERSHIP_20261126.md)

## Earlier geometric tests

The following four examples record the scope of earlier decisions. Their proposed successors belong to those stages.

### A geometric obstruction on the whole lower face

A marked nonlocal example of minimum four has a unique lower compressing slope and no lower bridge, even with free endpoints and wall windings. An upper Whitehead return and its second, two-point successor each require two opposite passages through the stationary core. These two disks restore the Figure 5 pair and yield three terminal cancellations. An independent finite triangulation distinguishes a failed prescribed chord from a successful free chord on the same exterior. [Assessment and scope](../reviews/WHITEHEAD_MIXED_RETURNS_20261126.md)

### What the four-point case decides

For one return on each face and two through arcs, the integral free outlet forces a compression. A return bridge, when present, determines the unique compressible slope on the four-holed face. This turns the search for an arbitrary face chord into a finite decision on a specified triangulation. The worked example has sharp intersection counts 4, 2 and 0 in succession. Changing both prescribed chords can obstruct both bridge disks even when their boundary classes vanish in integral homology. General existence of a usable bridge or a different reducing system is the remaining selection problem. [Four-point assessment](../reviews/FOUR_POINT_RETURNS_20261126.md)

### What the two-point case decides

The integral rank jump from \(Y_1\) to \(Y_3\) forces a longitude bridge disk when a supplied nonseparating sphere avoids one tube and meets the other twice. On the stated terminal assembly this excludes a least-three presentation. The knotted opposite completion supplies a worked case in which all three handles cancel. The next selection must reach an exterior or a residual local closure still outside this result. [Assessed theorem and limitations](../reviews/TWO_POINT_LOCALIZATION_20261126.md)

### Exterior at the original selection

The assessed product-port family recovers a reducing band from paired strands and a stationary marked longitude. Its disjoint monotone lanes work at arbitrary winding in the specified representatives, and the opposite return has a verified unknotted completion. This gives a relative two-attachment move and net cancellations in the stated terminal cases. The mixed rank-three example also has a measured PSC band on its original penultimate level. Its constructed filling already lies above the strict energy wall in both signs. [Latest assessment](../reviews/EXTERIOR_RECOVERY_AND_CORE_RETENTION_20261126.md)

The selection at that stage concerned nonstationary returns or a knotted completion. The examples remain controls for transporting tubes and upper gluing at their native levels. [Marked surgery manuscript](../02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex)

## When a physical comparison has leverage

For $U\subset M$ write $E_\sigma(g;U)=\int_U |W_g^\sigma|_{\mathrm{HS}}^2\,dV_g$ for $\sigma=+,-$, using the Weyl operators on real two-forms. The closed totals agree by the signature formula. Set $T=4\pi^2$ and $I^+(M)=\inf_{Y([g])>0}E_+(g;M)$, with the empty infimum $+\infty$. An actual positive class with $E_+\le T$ recognizes $M$. The fixed-type minimizing comparison requires its own positive entry $E_+<2T$. At a finite minimizing index with energy $e_i$, a positive same-type competitor must save strictly more than $d_i=e_i-I^+(M)$ to contradict the infimum. Equality permits attainment. A joined path used to infer positivity by the scalar-flat wall needs a peak strictly below $2T$. The marked-cut theorem allows the inclusive total $2T$ once each capped class is independently positive. [Recognition and charged disks](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Finite cut criterion](../../../master/manuscript/marked_cut.tex)

A charged disk occurs even on the constant sequence of an attained minimizer. The current constructions straighten a physical face, move charge into the full exterior, and quantify the peak required to retain charge. On a matched path with a positive equal-energy exterior cap, retaining both original core amounts $q_i^\sigma$ throughout requires a peak at least $I^+(M)+\max_\sigma q_i^\sigma$. Numerical retention, recovering the original metric on charged subballs at the endpoint, and fixing the entire original core metric throughout impose different geometric and energetic requirements. The existing positive capped exteriors cost at least $I^+(M)$. A new analytic packet needs a specified candidate and a mechanism forcing a full same-type saving beyond $d_i$, or a specified stability contradiction for an attained candidate. [Physical core and cap assessment](../reviews/EXTERIOR_RECOVERY_AND_CORE_RETENTION_20261126.md) · [External review, F3](../../../master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f3-the-charged-disk-theorem-and-the-local-comparisons-are-structure-theorems)

The [06 working theorem](../../06_bour_flow_and_fixed_type_attainment/reviews/FIXED_TYPE_ATTAINMENT_20261126.md) gives smooth attainment after strict positive entry, subject to its stated specialist checks. An uncovered extraction case needs an identified original sequence. [07](../../07_positive_subcritical_entry/README.md) owns construction of the first entering metric, which requires its closed sign and budget. [Master B06](../../../master/research-plan/PLAN.md#r--rigidity-of-an-attained-minimum) owns rigidity after attainment.

## Ownership and scope

The [marked surgery child](../02_handle_isolation_and_marked_surgery/research-progress/REGISTER.md) owns the exterior, framed moves and reassembly. The [deformation child](../01_collar_deformation_and_adapted_coordinates/research-progress/REGISTER.md) owns the physical cap, jet, positivity and energy estimates when a candidate meets the analytic threshold. The [parent register](../research-progress/REGISTER.md) owns joint comparisons and the scope of returns to the [master](../../../master/README.md). A finite result applies to its identified exterior or metric class. General selection on all least-count presentations, positive entry on remaining smooth types, and rigidity of attained minimizers remain open. [Parent manuscript](../manuscript/marked_collars_and_smooth_recognition.tex)
