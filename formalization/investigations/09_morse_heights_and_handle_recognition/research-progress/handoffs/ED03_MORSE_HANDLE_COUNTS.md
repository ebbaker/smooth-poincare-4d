# HT-E04g · Euler characteristic and the Morse count balance

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The author selected GPT-6.2 Sol/ultra for bounded proof work. Independent serving model and effort telemetry for this execution were unavailable.

Inputs were the checkout `bfdf0660e4f7d574cf507333af8e5e6781fa7915` with the working sources. The master immersion section, marked-heights section and E33 audit had Git blob prefixes `d78b51cf9cf7`, `7b22f483ebbf` and `6f4776d0f31f`, respectively. The manifest SHA-256 was `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. The package pins are Lean `4.35.0-rc3`, mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. [Master immersion section](../../../../../papers/master/manuscript/immersion_entry.tex) · [Marked heights, end reductions](../../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex) · [E33 audit](../../../../../papers/master/reviews/E33_INDEX_TWO_HANDLES.md)

`morseCriticalCount I f j` is the cardinality of the set of actual critical points on the source with native Morse index `j`. The source is a compact Hausdorff smooth boundaryless manifold modeled on Euclidean four-space. `alternating_morseCriticalCounts_eq_two` takes a topological homotopy equivalence from this manifold to the unit sphere in Euclidean five-space and a smooth Morse function with distinct critical values. Compactness and nondegeneracy give a finite critical set. The native finite Morse Euler theorem over $\mathbb Q$ gives its signed sum. Homotopy invariance and the sphere calculation identify that sum with $2$. Grouping by the negative inertia in the native chart Hessians gives

$$
n_0-n_1+n_2-n_3+n_4=2.
$$

`morseCriticalCount_oddBalance` rearranges this identity over $\mathbb Z$ as

$$
(n_1-n_0+1)+(n_3-n_4+1)=n_2.
$$

`morseCriticalCount_reducedOddCases` takes the end-tree inequalities $n_0\le n_1+1$ and $n_4\le n_3+1$ as inputs. Under these inequalities both summands are nonnegative. When $n_2=0$ they are both zero, and when $n_2=1$ their ordered pair is either $(0,1)$ or $(1,0)$. Existence of the geometric end-tree reductions and transport of the actual boundary and attaching maps require separate arguments. `morseCriticalCount_congr` transfers the counts to an original function whenever an auxiliary function preserves the actual critical points and their indices.
