# SP4-TWA-E09 · Return on the unequal-end gap

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. [Frozen request v1](E09_REQUEST_v1.md) records the selected lead GPT-6.2 Astra/ultra and the helper configuration GPT-6.2 Sol/ultra. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all eight frozen SHA-256 digests matched.

**Complete at the frozen scope.** On the oriented flat cylinder of length \(L\) and torus volume \(V\) with periodic spin structure, let \(a_i=e^{u_i}\) be the prescribed endpoint amplitudes on the unit parallel spinor \(\psi_0\). For their ordinary affine extension \(h\), put \(A=\|Ph\|_2\) and \(H=\|h\|_4\). The [proof](../../notes/E09_UNEQUAL_TRACE_GAP.md) gives \(A^2=3V(a_1-a_0)^2/(4L)\) and \(H^4=(VL/5)\sum_{k=0}^4 a_0^{4-k}a_1^k\). The flat Dirac Green identity gives \(\|Pz\|_2^2=(3/4)\|\nabla z\|_2^2\) for a smooth zero-trace correction \(z\). Orthogonality to \(Ph\), Sobolev and Hölder give

\[
0<\frac{A}{\sqrt{H^2+C^2A^2}}\le \inf_\psi J(\psi)
\le \frac{\sqrt3}{2}\,V^{1/4}L^{-3/4}|u_1-u_0|
\qquad (u_0\ne u_1).
\]

Here \(C=(2/\sqrt3)S_{\mathrm{Sob}}\sqrt{1+(L/\pi)^2}\) uses the ordinary \(H^1\)-to-\(L^4\) Sobolev constant on the same product. The upper bound comes from the zero-free affine logarithm, and the lower bound is over all admissible smooth fields with the prescribed traces, including finitely many transverse compatible interior zeros. Equal endpoints give the unique zero-action field \(a_0\psi_0\).

The [source record](../../notes/E09_UNEQUAL_TRACE_GAP.md#source-inspection) identifies the frozen inputs and Friedrich passages checked. The estimate is ready for integration as a positive full-infimum bound for this prescribed-trace cylinder. The value and attainment of the unequal-end infimum and full minimality of the radial field remain open. The packet requires no change to the B05 premises.
