# SP4-TWA-E14 · Return on the first Dirichlet crossing

28 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [frozen request](E14_REQUEST_v1.md)
records GPT-6.2 Astra/ultra as the author-selected lead and
GPT-6.2 Sol/ultra as the configured helper. Actual backend model and
reasoning effort were unavailable. HEAD and all seven frozen digests
matched the request.

**Complete at the frozen scope.** The [proof](../../notes/E14_FIRST_NEGATIVE_MODE.md)
derives the real conjugated Dirichlet Hessian
\[
 \tfrac94 b^2\|\nabla(u+w)\|_2^2+
 \tfrac12 b^2\|3u_t-\operatorname{div}_x w\|_2^2+
 \tfrac32 b^3\int_M w\cdot\operatorname{curl}_x w.
\]
Here \(u\) is real and \(w\) is the imaginary quaternion perturbation
in the positive chiral frame \(c(e_0)c(e_i)=I_i\), using the oriented
spatial curl. Positive \(b\) destabilizes the negative helicity, and
negative \(b\) destabilizes the positive helicity.

Only the transverse block can cross for \(b\ne0\). Its mode coefficient
is \((3b^2/4)[3(\lambda^2+(n\pi/2)^2)+2bh\lambda]\), where
\(h=\pm1,\ \lambda=2\pi|j|,\ j\in\mathbb Z^3\setminus\{0\},\ n\ge1\).
The first threshold is \(|b|=51\pi/16\) at unit lattice radius, first
time mode and \(h=-\operatorname{sgn}(b)\). At this threshold there
are six real null directions. The full Hessian vanishes at \(b=0\).
The proof lists all other nonzero-slope resonances and gives an
explicit smooth zero-free cheaper field for every \(|b|>51\pi/16\).

Friedrich's primary twistor convention and the seven frozen inputs
were checked. The first threshold matches the proposed value. This
returns the spectral and cheaper-field results to B08. The global
transition and the nonlinear behavior at equality have separate
tests.
