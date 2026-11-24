# The energy detected by local twistor sections

24 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort unavailable. The three assessed calculations used helpers configured as gpt-6.2-sol/ultra. This is a lead synthesis of analytical research notes, without external review. The inputs are the v1 [E01](../notes/SEC_E01_20261124.md), [E06](../notes/SEC_E06_20261124.md) and [E08](../notes/SEC_E08_20261124.md) returns at the recorded versions.

Fix any smooth closed oriented Riemannian four-manifold (M,g). On each set of a finite open cover choose three positive orthogonal almost complex structures whose axes in the unit sphere of Λ⁺ are pairwise perpendicular. Each J is orthogonal for the **same** metric g. For P=(1+iJ)/2, Q=1−P let F(X,Y)=Q[PX,PY]. Define I(g) as the infimum of the following quantity over the covers, triples and subordinate nonnegative partitions of unity:

\[
 \sum_{a,i}\int_M\rho_a\bigl(|\nabla F_{ai}|^2+|\nabla J_{ai}|^2|F_{ai}|^2\bigr)\,dV_g.
\]

Use exterior-pair norms on the last two skew inputs of F and ∇F, and the Hilbert–Schmidt norm of the Weyl operator. The three calculations give

\[
 \boxed{\tfrac{2}{9}E_+(g)\ \le I(g)\ \le 4E_+(g).}
\]

For the lower bound, the null Koszul and curvature identities control a unit null Weyl evaluation by (9/4) times the single-direction density in the squared estimate. Orthogonal axes give a reconstruction constant of 2. For the upper bound, at each center choose an auxiliary conformal representative with zero Schouten tensor and unchanged value and first derivative of the metric. Its radially parallel chiral frame has F=0 at the center, and the curvature of this frame there contains only W⁺. The first derivative of F transfers back to g. E08 obtains the upper constant 8 with *ordered* last two input slots. An alternating two-slot norm squared is twice the exterior-pair norm squared, including after applying ∇. Thus that estimate gives 4 in the convention of E01. Continuity allows a finite weighted cover realizing the upper bound within any prescribed error. No derivative of a partition weight occurs. The infimum need not be attained.

With the derivative term removed, the infimum of the weighted integral of Σ|F|⁴ is zero for every smooth g. Refining the patches around normal-frame centers can therefore erase an undifferentiated diagnostic even where W⁺ is nonzero. For separated triples that need not be perpendicular, write δ=min|n_i×n_j|. E06 gives |W⁺|²≤(128/3)δ⁻⁴Σ|q_i|², hence by E01 the density constant 96δ⁻⁴ is sufficient. The fourth power is sharp for the algebraic reconstruction from the null evaluations; the proof does not establish optimality for Frobenius jets.

For a supplied smooth homotopy-sphere metric, I(g)=0 is equivalent to W⁺=0. Under the separately verified hypothesis Y(M,[g])>0, I(g)<8π²/9 suffices for the strict sphere criterion. The [shared recognition theorem](../../notes/SH_E01_20261124.md) supplies the conclusion in each case. Optimizing the auxiliary sections on a fixed metric cannot reduce its Weyl energy. A new construction must change the conformal metric or use genuine coupling of data between patches.
