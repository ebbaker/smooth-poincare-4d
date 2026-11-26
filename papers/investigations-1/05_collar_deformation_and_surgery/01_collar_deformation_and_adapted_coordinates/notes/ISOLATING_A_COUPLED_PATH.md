# Isolating the two sides of a coupled comparison

26 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Lead B02 derivation, selected GPT-6.2 Astra/ultra. Independent serving metadata unavailable. Inputs at 5ddaabd76595: deformation manuscript 734c4860811c, surgery e53bc30bb034, original and enlarged disk and physical variation as in the preceding assessment. Scope is a necessary finite-index test on an actual candidate path. No such path on an unrecognized type is supplied.

Let g be the smooth volume-one positive Yamabe representative on an oriented smooth homotopy four-sphere M, with joined energy e<2T, fixed-type positive infimum I and d=e−I. Use a fixed parametrized disk D with V its complete exterior. Let h_t be any smooth path of smooth metrics from g to a matched round-product-up-to-conformal endpoint on its actual face, with whole joined peak H<2T. Write e_t for its common closed signed energy. All energies here are physical integrals of the squared real chiral Weyl operator. The positive capped complete exterior has endpoint energy at least I by the marked stretch-and-cap lemma. Let mσ=Eσ(g;D).

Use any closed inward transition layer A of positive native width w in the marked collar. Its two ends may be strictly inward of the original face. Select a fixed smooth cutoff χ which increases from zero on its inner end to one on its outer end and is locally constant off its interior. Extend χ by one throughout V and the outer part of D, and by zero on the inner part. Define closed metric paths p_t=g+(1−χ)(h_t−g), q_t=g+χ(h_t−g). The convex combinations are positive definite. The interpolation covers the original whole region between A and V. If A stops short of the face, p_t then equals g there. Use the **outer closed region U up to the face** between A and V in the endpoint comparison, or equivalently take A to include the entire disk-side collar out to the face (χ=1 on this outer subregion). In all formulas below A denotes this full collar up to the face. A collar adjacent to the face suffices. On the deep disk p_t=h_t, q_t=g. On the full exterior p_t=g, q_t=h_t. Every connector of h_t remains in the region that physically contains it, including the full exterior collar at its own width.

For each sign define Jσ(t)=Eσ(p_t;A)+Eσ(q_t;A)−Eσ(h_t;A)−Eσ(g;A) and Rσ(t)=Eσ(p_t;A)−Eσ(h_t;A). Locality gives exactly
```
Eσ(p_t;M)+Eσ(q_t;M)=e+e_t+Jσ(t),
Eσ(p_t;M)=e−mσ+Eσ(h_t;D)+Rσ(t).
```
The first identity and signature give J+(t)=J−(t) even when none of the four separate collar integrals agrees across signs. At the matched endpoint Eσ(h_1;D)≤e_1−I. If p_1 is positive, the second identity implies
```
Rσ(1) ≥ mσ+I−e_1−d,     Eσ(h_1;V)−Eσ(g;V) ≥ mσ−d.
```
More generally either this pair of endpoint inequalities holds in both signs, or at the earliest time s either isolated path reaches 2T, its complement has energy ≥I by positivity up to this time and continuity. Positivity before s follows from the scalar-flat first-eigenvalue wall; e<2T initially. Simultaneous crossings are allowed. Consequently
```
J+(s)=J−(s) ≥ 2T+I−e−e_s ≥ 2T−d−H.
```
If neither isolated path reaches the wall, both remain positive, which proves the alternative. The exterior increment in fact holds without either isolation test. The first inequality uses e_1, which can be substantially smaller than H. With disjoint modifications and an unchanged intermediate layer J=R=0 and the earlier disjoint test is recovered.

For the enlarged disk insert the full mσ=(1−2^(−k))e+2^(−k)qσ−rσ in this formula, where qσ is the protected core mass. If the core stays physically or conformally fixed through the endpoint then e_1≥I+max qσ. For fixed I>T, k sufficiently large and d→0 the endpoint bound for Rσ has strictly positive lower limit even when H approaches 2T. If H≤2T−ε on a tail then the crossing alternative costs at least ε−d in each sign. Thus a coupled matched path with a uniform headroom and negligible energies of both isolated connectors on A is excluded there. A merely strict peak depending on the index does not give uniform headroom. At the original E61 disk one must insert its actual mσ; the selected one-sign floor need not make the endpoint lower bound positive.

These are testable collar energies in the given gauge. For instance put B_t=h_t−g, assume Λ⁻¹g≤h_t≤Λg on A, and use ∇=∇g. Both cutoff metrics have curvature norm (compared in g) bounded there by a dimensional C(Λ) times
```
|Rm(g)|+|∇²B_t|+|∇B_t|²+|dχ||∇B_t|
       +|∇²χ||B_t|+|dχ|²|B_t|² .
```
Indeed curvature is Rm(g) plus the first derivative and square of the connection difference; expand ∇²(χB_t) and |∇(χB_t)|², using the same bounds for 1−χ. The displayed terms also handle the lowering of an index by a uniformly comparable metric. Integrating its square against dV_g bounds each isolated signed collar energy up to another C(Λ). In the native signed length coordinate ρ one uses |dχ|≤C|dρ|/w, |∇²χ|≤C(|dρ|²/w²+|∇²ρ|/w). The original and joined energies subtracted in J and R remain in the exact formulas. Incoming small Weyl mass does not bound this curvature integral or either interpolated connector. Smooth compactness of the marking and positive subcritical entry remain independent questions.
