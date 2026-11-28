# The unrestricted comparison persists beyond \(17\pi/8\)

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex, author-selected GPT-6.2 Astra/ultra. Actual independent backend telemetry unavailable. Baseline `280376dd7a18`. Inputs are the [E17 identity and angular spectrum](E17_POLAR_LOWER_BOUND.md) and the [common-competitor threshold](B08_GLOBAL_TRANSITION.md).

With the unchanged geometry, traces and complete smooth admissible class in E17, write \(B=17\pi/8\) and \(b_{\rm G}\) for the positive endpoint of global radial minimization. Then \(b_{\rm G}>B\). This is a strict lower bound, with no numerical size assigned to the improvement.

**Reduction to angular saturation.** If \(b_{\rm G}=B\), the threshold theorem supplies positive \(b_n\downarrow B\) and smooth fields with action strictly below \(9b_n^4/8\). Write these fields off their zeros as \(e^{b_nt+u_n}g_n\). E17 gives the globally defined \(H^1\) quantities \(u_n\) and \(w_n=g_n-\sigma\), both of zero end trace. Set \(d_n=\|dg_n\|_2\). When \(d_n=0\), the integrated polar identity already rules out the strict action inequality. Hence \(d_n>0\). Put \(v_n=w_n/d_n\) and \(H_n=\int_M(v_n,Tv_n)\). Since \(Q_n=|P\psi_n|^2/|\psi_n|^2\ge0\), a strict improvement in \(\int Q_n^2\) implies \(\int Q_n<3b_n^2/2\) by Cauchy–Schwarz. The E17 square completion after division by \(d_n^2\) gives
\[
 0>\tfrac34\|(du_n+K_n/3)/d_n\|_2^2
       +\tfrac12+\tfrac{b_n}{2} H_n .
\]
The helicity estimate yields \(H_n\ge-1/B\). Therefore \(H_n\to-1/B\), and \(\|du_n\|_2/d_n\) is bounded since \(|K_n|\le\sqrt3|dg_n|\).

**Compactness of the normalized angular part.** Each \(v_n\) has unit gradient norm. After passage to a subsequence it converges weakly in the zero-trace \(H^1\) space and strongly in \(L^2\) to \(v\). This compactness also follows directly by truncating the Dirichlet-time and torus Fourier expansion: the squared \(L^2\) tail past Laplacian eigenvalue \(R\) is bounded by \(1/R\), and the low part is finite dimensional. Since \(Tv_n\) converges weakly in \(L^2\), \(\int(v,Tv)=-1/B\). The helicity inequality now forces \(1\le\|dv\|_2^2\le1\). Equality of the norms upgrades convergence to strong \(H^1\). Equality in the Fourier estimate puts \(v\) on the first time and spatial shells, in the negative eigenspace of \(T\), with zero spatial mean at almost every \(t\). In particular \(v\ne0\). The bound \(\|w_n\|_2\le 2\sqrt{2}\) and \(\|v_n\|_2\to\|v\|_2>0\) bound \(d_n\). Take a further subsequence with \(d_n\to d\). The unit fields converge in \(L^2\) to \(\sigma+dv\), of norm one a.e. The torus average of this limit equals \(\sigma\). Integrating the squared unit-norm identity on each slice forces \(d^2\int_Y|v|^2=0\). Hence \(d=0\) and \(g_n\to\sigma\) in \(L^2\), with a.e. convergence along a subsequence.

**Cancellation of the only possible mixed loss.** Write \(\mathcal K(a,dv)_i=\sum_{j\ne i}(a,c_ic_j\partial_jv)\). Because \(g_n\) has unit length and \(dv_n\to dv\) strongly in \(L^2\),
\[
 K_n/d_n=\mathcal K(g_n,dv_n)\ \longrightarrow\
 \mathcal K(\sigma,dv)\quad\text{strongly in }L^2.
\]
For the term with fixed \(dv\) this follows by dominated convergence. The limit current has divergence zero, since \(c_i c_j=-c_j c_i\) for \(i\ne j\) and mixed distributional derivatives commute. It is orthogonal to every \(du_n\) by the end traces and tangential periodicity. The boundedness of \(\|du_n\|_2/d_n\) now yields \(\int (du_n/d_n)\cdot(K_n/d_n)\to0\).

In the exact integrated polar identity, divide the excess by \(d_n^2\) and use the nonnegativity of the pure \(du_n\) energy. Its lower limit is at least \(3/4+(B/2)(-1/B)=1/4\). Every excess in the sequence was strictly negative. This contradiction proves \(B<b_{\rm G}\). The compactness here is for the normalized unit-spinor directions of a hypothetical sequence at \(B\). No compactness theorem for arbitrary minimizing sequences at the actual transition has been assumed.
