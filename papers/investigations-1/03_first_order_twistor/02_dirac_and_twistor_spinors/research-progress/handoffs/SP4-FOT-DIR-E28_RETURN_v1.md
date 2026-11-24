# SP4-FOT-DIR-E28 · Zero boundary flux and the parallelism criterion · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing: gpt-6.2-sol / ultra. Actual helper
and selected lead model identifiers and reasoning efforts were unavailable.
[Request v1](SP4-FOT-DIR-E28_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Derivation](../../notes/DIR_E28_20261124.md).

**Completed.** HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc` and
all six frozen working-tree hashes matched.

1. The outward-boundary identity is
   $\int_{\Omega_R}(|\nabla^h\Psi|^2+s_h|\Psi|^2/4)
   =\int_{S_R}\operatorname{Re}\langle\nabla^h_{\partial_R}\Psi,\Psi\rangle$.
   The given decay bounds the flux by $O(R^{-1})$. On the exact flat
   end the harmonic components of $u=\Psi-\Psi_\infty$ have zero total
   normal flux. Annular integration then gives the spinor flux as
   $-\int_{\{|y|>R\}}|\nabla^h u|^2=O(R^{-4})$, of nonpositive sign.
2. The derivative and scalar contributions are integrable.
   The unit boundary amplitude gives infinite ordinary $L^2$ mass
   of $\Psi$ on the Euclidean end, while the geometric ADM mass
   is zero by exact flatness there.
3. The weighted scalar integral
   $\mathcal S=\int_N s_h|\Psi|^2\,dV_h$ equals
   $-4\|\nabla^h\Psi\|_2^2$. Its independently imposed nonnegativity
   is equivalent to parallelism. Nonnegative scalar curvature is
   one sufficient input. Parallelism forces a unit norm and
   $s_h=0$. An interior zero instead implies $\mathcal S<0$.
4. A parallel positive-chiral field transports by the twistor weight
   to the supplied smooth compact spinor. The positive spin curvature
   block gives $W_g^+=0$ and the SH-E01 exact recognition applies
   on a smooth homotopy four-sphere.

The primary comparison is Ammann–Humbert's corrected proof of Theorem 2.2
through (2.3), with the twistor kernel weight checked in Friedrich §1.
The remaining premise for B15 is an independent lower sign or
vanishing condition for $\mathcal S$ for the constructed data.
