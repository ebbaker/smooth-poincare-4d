# Which immersed constructions would recognize the smooth sphere?

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author selected GPT-6.2 Astra/ultra for research leadership and GPT-6.2 Sol/ultra for bounded execution. Independent serving telemetry is unavailable. The master sources below agree with commit 2689540e6dae1656b7f5ad4be52504db044995f2. The setup imports their analytical scope.

Let \(M\) be a closed connected oriented smooth homotopy four-sphere, with no smooth identification with the standard sphere assumed. For one global smooth immersion \(F:M\to\mathbb R^5\) use \(g=F^*\delta\), the normal compatible with the orientations, its shape operator \(A\), and \(U\subset M\) where \(A\) has two eigenvalues of each sign. All integrals count sheets on the domain, including at self-intersections. Write \(E_+(g;P)=\int_P |W^+_g|_{\rm HS}^2\,dV_g\) in the given orientation. The measure is conformally invariant. The shape and normal Gauss map in this argument belong to \(F\).

## A height on a folded map to four-space

A second construction starts with a smooth folded map $f:M^4\to\mathbb R^4$. Fix the fold locus $S$ on the actual $M$, for example the boundary of a coordinate ball. Verify the formal bundle isomorphism $T_SM\simeq f^*T\mathbb R^4$ for the tangent bundle twisted across $S$, and realize both halves of the *same* map with matching fold germ. The fold map restricts to an immersion of the parametrized three-dimensional fold, possibly with multiple sheets. Orient its unit normal $\nu$ away from the local image and take principal curvatures positive for the convex outward convention. [Eliashberg–Mishachev, §1.1 and Theorem 1.2.4](https://arxiv.org/pdf/1108.1270) · [Claude's construction, §5](../../../master/brainstorm/notes/claude/ENTRY_DIRECT_APPROACHES_20261126.md)

At a regular direction $u$, an index is $1+\#\{\kappa_i>0\}$ at $\nu=u$ and $\#\{\kappa_i<0\}$ at $\nu=-u$. Let $S_{(1,2)}$ have one positive and two negative curvatures and put $J_{\rm fold}=\int_{S_{(1,2)}}|\kappa_1\kappa_2\kappa_3|\,dA$, counted on the domain. The area formula gives $\int_{S^3}m_2(u)\,du=2J_{\rm fold}$ and mean $J_{\rm fold}/\pi^2$. A strict $J_{\rm fold}<2\pi^2$ produces a height with at most one middle handle, hence smooth recognition. The sufficient condition $\int_S |B^\circ_{\rm fold}|^3\,dA<3\sqrt6\,\pi^2$ also gives this exit. Already $J_{\rm fold}<3\pi^2$ supplies a height with at most two. On a hypothetical nonstandard source every Morse height has at least two, so the fraction with exactly two is at least $3-J_{\rm fold}/\pi^2$. Recover a regular direction and both framed attachments before invoking the two-handle child. These results apply for any Yamabe sign. [Assessed height argument](../../../master/reviews/DIRECT_ENTRY_AND_REDUCIBLE_CUT_PRIORITIES_20261126.md#which-other-proposals-merit-a-test) · [One-middle-handle recognition](../../../master/manuscript/immersion_entry.tex)

The pilot needs a quantitative bound or a newly usable marked height on a realized family beyond the round projection and product calibration. The formal fold theorem leaves both questions open. The pullback at the fold is singular. The following $\mathbb R^5$ results use a smooth induced metric and have their own energy thresholds.

## Smooth hypersurface immersions in five-space

### Three possible outputs from the same immersion

| Data produced on a stated class of smooth types | Consequence to send to the master |
| --- | --- |
| \(E_+(g)\le64\pi^2/9\), or \(\|A^\circ\|_4^2\le16\sqrt2\,\pi/3\), or \(J=\int_M(-\det A)_+\,dV_g<8\pi^2/3\) | Direct smooth recognition, with no sign hypothesis. The existence of an immersion on every smooth type is established. The estimates are extra inputs. |
| \(E_+(g)<8\pi^2\) on a putative nonstandard sphere | A set of directions of normalized spherical measure greater than \(3/4\) gives exactly two index-two points. Supply an actual regular direction, framed levels and a proved reduction for the resulting diagram. |
| \(E_+(g)<8\pi^2\) and \(Y([g])>0\) | Entry into the intrinsic fixed-type minimization in the master. Another sequence of conformal classes can minimize that infimum. Its immersibility requires its own evidence. |

[Master Theorem 3.1, indexed area and Weyl formulas](../../../master/manuscript/immersion_entry.tex) · [Two-handle count](../../../master/reviews/E33_INDEX_TWO_HANDLES.md) · [Open-set equality analysis](../../../master/reviews/E34_MIDDLE_WEYL_EQUALITY.md)

The [construction arm](../01_immersed_handle_constructions/research-overview/OVERVIEW.md) estimates a marked core, its transitions and the retained exterior. The [topology arm](../02_two_handle_recognition/research-overview/OVERVIEW.md) can start with the subcritical hypothesis while construction is open. The shared question is whether the geometric estimates refer to a height of the same closed immersion for which the topological argument controls the attaching maps. A local bridge can verify matching costs without restricting those maps. E32 gives an instructive example: its rotational bridge has zero Weyl energy but already carries \(8\pi^2/3\) of negative Gauss mass. [Marked bridge](../../../master/notes/E32_ROTATIONAL_TRANSITION.md)

For an arbitrary \(M\), report exactly which smooth handle presentations admit a constructed metric, what is quantified uniformly, and what remains of the exterior. Quantifying over all smooth types is a separate step from proving a theorem for each presentation in a restricted class. [Sole parent register](../research-progress/REGISTER.md) · [Master overview](../../../master/research-overview/OVERVIEW.md)
