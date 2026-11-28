# A genus bound from the four based seam paths

27 November 2026, America/New_York. For Edward B. Baker III with OpenAI Codex assistance. Lead decision WIT-B05 and working project theorem. Selected lead serving variant and effort unavailable. Base e171829 with [the marked puncture and seam formulas](../01_examples/notes/E02_PUNCTURE_INPUT.md), [the original words and framing](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md), and [the two-belt leaf argument](TWO_BELT_LEAF.md). The argument concerns smooth oriented surfaces with four full cap sections. Its obstruction already appears after projection to a surface.

## What the paths record

Let Q be the connected exterior part of a proposed proper surface in the minus puncture, after cutting off two oppositely oriented section disks in each original cap at a product seam. It has one outgoing knot in the marked coordinate sphere and four seam circles. Capping the four seam circles leaves the genus unchanged. The projection of the rounded exterior to the original planar surface F (a disk with two holes) sends the knot into a contractible coordinate disk. With original generators x,y the two positively traversed seam circles project to the words

    r = x⁻¹ y² x y⁻³,       s = x⁻¹ y x² y⁻¹ x⁻².

Indeed each projected section is a small displacement of the original word loop, with the straight homotopy remaining in F by the marked tube clearance. For fixed transverse seam parameter this also identifies its basepoint at t=0 by a short path in the central disk. Identify the projected knot basepoint with the origin inside the same disk. Signs below refer to the boundary orientation of Q, the opposite of the deleted disk's boundary orientation at their common seam.

Fix a geometric cut system on Q rooted at the knot boundary. Its four disjoint-interior paths lead to the four seam basepoints in the order of a surface polygon relation. Include the short basepoint identifications above. Denote by h_j in the free group on x,y the resulting projected path words. Prescribe the ordered list of oriented seam words t_j, two opposite copies each of r and s. The based boundary product is

    W = (h₁ t₁ h₁⁻¹)(h₂ t₂ h₂⁻¹)(h₃ t₃ h₃⁻¹)(h₄ t₄ h₄⁻¹).

For any such marked connector of genus g, cl(W) ≤ g, where cl denotes commutator length in the free group and cl(1)=0. To see this, cut Q to its usual polygon along the paths and g pairs of handle curves. Its single attaching word is a product of g commutators and the five based boundary loops, with the knot boundary projecting trivially. Reversing or inverting a product of g commutators still gives a product of g commutators (in particular [a,b]⁻¹=[b,a]); equivalently use W⁻¹ from the polygon relation. This proves the bound. Conversely, at the level of **maps to F**, a factorization of W⁻¹ into g commutators specifies the images of the handle loops. Map the seam circles, outer boundary and rooted cuts by their prescribed paths. The attaching word is null in F and the polygon thus extends across its disk. This proves sharpness of the bound for that two-dimensional mapping problem. Embeddedness in the four-dimensional exterior is a further requirement.

## Opposite pairs with two independent windings

Consider ordered seams (r,r⁻¹,s,s⁻¹) and marked projected basings (1,xᵐ,1,yⁿ) for integers m,n. This is a specified family of routes; retaining only the four unbased seam curves discards these data. With [a,b]=aba⁻¹b⁻¹ its word is W=[r,xᵐ][s,yⁿ].

In the integral Heisenberg group take x=I+E₁₂, y=I+E₂₃. A commutator has central coordinate equal to the determinant of the two abelianized columns, since multiplying matrices adds the upper-right cross term. The columns of r,s are (0,−1),(−1,0). The projected product has central coordinate m−n. Thus a planar connector would require m=n.

In fact **a planar connector in this entire family requires m=n=0**. If m and n are nonzero, [r,xᵐ] and [s,yⁿ]⁻¹ have different first letters in freely reduced form. The first begins with x⁻¹: the first three blocks r, xᵐ, r⁻¹ have no cancellation at their joins, and adjoining x⁻ᵐ at the end can only combine with the final x of r⁻¹. The next letter toward the interior is a y-letter. The second word is yⁿ s y⁻ⁿ s⁻¹ and begins with a y-letter. Its three joins have no cancellation because s begins and ends with x-letters. The same calculations show each commutator is nontrivial if only its own winding is nonzero. For (0,0) the product is the identity and a planar map to F exists for the prescribed boundary and path data. It supplies no new embedded disk.

The result gives a direct test beyond the signed intersection counts and the removable-leaf test. At (1,1), even the Heisenberg test returns zero; the free-word test still forces positive genus. A different marking can conjugate the individual factors and change their order. One must carry the actual cut paths (or the corresponding surface relation change) when testing a proposed embedded connector. Neither this exclusion nor a nonzero word for an arbitrary guessed basing rules out a disk with other projected paths. A nontrivial signed knot, its homology-ball eligibility and a geometric comparison on that same knot remain necessary for a genus-saving witness.
