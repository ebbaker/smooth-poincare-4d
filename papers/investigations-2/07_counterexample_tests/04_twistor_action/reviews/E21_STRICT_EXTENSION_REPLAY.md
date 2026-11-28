# SP4-TWA-E21 · Replay of the strict global extension

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request records the author-selected GPT-6.2 Astra/ultra lead and the configured GPT-6.2 Sol/ultra independent reader. Actual backend model and effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all ten frozen SHA-256 digests matched at execution start. [Frozen request v1](../research-progress/handoffs/E21_REQUEST_v1.md) · [Lead proof](../notes/B08_STRICT_GLOBAL_EXTENSION.md)

**PASS.** With \(B=17\pi/8\), the unrestricted radial threshold satisfies \(b_{\rm G}>B\). Here the admissible class is the full E17 class on the oriented flat Riemannian cylinder \([-1,1]\times(\mathbb R/\mathbb Z)^3\), with volume 2, the periodic spin lift and a parallel unit positive spinor \(\sigma\). The fields are smooth positive half-spinors with exact end traces \(e^{\pm b}\sigma\), allowing finitely many transverse compatible zeros. Use the positive chirality carrying self-dual forms, the real part of the Hermitian pairing, Clifford multiplication \(c_i c_j+c_j c_i=-2\delta_{ij}\), and the normalization \(S=J_g^4\). [E17 class and identity](../notes/E17_POLAR_LOWER_BOUND.md)

## Hypothetical cheaper sequence and moving zeros · PASS

Assume \(b_{\rm G}=B\). The threshold statement gives for every \(b_n=B+1/n\) a smooth admissible \(\psi_n\) with \(S[\psi_n]<9b_n^4/8\). One can also start the contradiction directly from a sequence of strict competitors with \(b_n\downarrow B\). Off the zeros write \(\psi_n=e^{b_nt+u_n}g_n\), \(|g_n|=1\), and put \(w_n=g_n-\sigma\). For each individual field the polar functions satisfy \(u_n,w_n\in H^1_0\), where zero trace refers to the two end faces and the spatial variables are periodic. At a transverse zero of distance \(r\), the bounds are \(u_n=\log r+O(1)\), \(|du_n|+|dg_n|=O(r^{-1})\) and \(|g_n|=1\). The square-integrable weak derivatives follow by excision with boundary terms of size \(O(r^3(1+|\log r|))\) for \(u_n\) and \(O(r^3)\) for \(g_n\). Compatible first jets make the quotient bounded locally for each field. These are per-field estimates. The subsequent sequence bounds use \(|g_n|=1\) almost everywhere and global Sobolev norms, so the number and locations of the zeros may vary.

Set \(Q_n=|P\psi_n|^2/|\psi_n|^2\). The nonnegative quantity \(\int Q_n\) satisfies \(\int Q_n\le \sqrt{2 S[\psi_n]}<3b_n^2/2\). This is the constant radial value of \(\int Q\) with volume 2. In the E17 identity, \(d_n=\|dg_n\|_2=0\) would imply \(g_n=\sigma\) by its trace, \(K_n=0\) for the angular current, and \(\int Q_n\ge3b_n^2/2\). Thus \(d_n>0\). Define

\[
 v_n=\frac{w_n}{d_n},\qquad \|dv_n\|_2=1,\qquad
 H_n=\int_M(v_n,Tv_n),\qquad
 T=\sum_{j=1}^3 c_0c_j\partial_j.
\]

The normalized mixed-current square inequality is

\[
 0>\frac34\left\|\frac{du_n+K_n/3}{d_n}\right\|_2^2
        +\frac12+\frac{b_n}{2}H_n,\qquad H_n\ge-1/B .
\]

Indeed, the algebraic bound \(|K_n|^2\le3|dg_n|^2\) leaves angular coefficient \(3/4-3/12=1/2\) after the completion of the square. Periodicity gives \(\int_M (K_n)_0=d_n^2 H_n\). Hence \(-1/B\le H_n<-1/b_n\), and \(\|(du_n+K_n/3)/d_n\|_2^2<(2/3)(b_n/B-1)\). It follows that \(H_n\to-1/B\) and \(\|du_n/d_n\|_2\) is bounded. [Common-competitor threshold](../notes/B08_GLOBAL_TRANSITION.md)

## Normalized angular compactness and zero-mode rigidity · PASS

Time Poincaré bounds \(v_n\) in \(H^1_0\). The Fourier sine basis in time and torus Fourier basis in space show that the squared \(L^2\) mass past Laplacian eigenvalue \(R\) is at most \(1/R\), using \(\|dv_n\|_2=1\). The low part is finite dimensional. Thus along a subsequence \(v_n\rightharpoonup v\) in \(H^1_0\) and \(v_n\to v\) in \(L^2\). The bounded map \(T:H^1_0\to L^2\) gives \(Tv_n\rightharpoonup Tv\), so \(\int(v,Tv)=-1/B\).

For the helicity bound, the matrices \(c_0c_j\) are skew-adjoint unit Clifford products. The Hermitian symbol of \(T\) on spatial mode \(k\) has norm \(|k|\). The corresponding gradient energy bounds \((|k|^2+\lambda_1)\|v_k\|_2^2\) with \(\lambda_1=(\pi/2)^2\). On nonzero modes the minimum of \((|k|^2+\lambda_1)/|k|\) is \(B\), attained at \(|k|=2\pi\). The zero mode has zero helicity and retains its positive time Dirichlet energy. Therefore

\[
 1=B\left|\int(v,Tv)\right|
 \le \|dv\|_2^2-\lambda_1\|v_0\|_2^2
 \le \|dv\|_2^2\le1 ,
\]

where \(v_0(t)=\int_Y v(t,x)\,dx\). This proves \(v_0=0\) and \(\|dv\|_2=1\), so weak convergence and convergence of the norms yield strong \(H^1\) convergence. The equality requirements also put the limit on the first spatial and time shells and in the negative eigenspace of \(T\), since every dropped modal deficit is nonnegative. Only the zero-mode conclusion and nonvanishing of \(v\) are needed for the contradiction.

The lead proof infers \(d_n\to0\) by taking a subsequence of bounded \(d_n\) and applying the unit-length identity to its angular limit. The identity also gives this directly. From \(|\sigma+d_n v_n|=1\) almost everywhere,

\[
 d_n\|v_n\|_2^2=-2\int_{-1}^1(\sigma,(v_n)_0(t))\,dt .
\]

The right side tends to zero by \(v_n\to v\) in \(L^2\) and \(v_0=0\). The squared norm on the left tends to \(\|v\|_2^2>0\). Thus \(d_n\to0\) on the selected subsequence and \(g_n=\sigma+d_n v_n\to\sigma\) in \(L^2\), also almost everywhere along a further subsequence.

## Normalized currents and the limiting sign · PASS

Write \(\mathcal K(a,dv)_i=\sum_{j\ne i}(a,c_i c_j\partial_jv)\). The E17 pointwise estimate applies by homogeneity as \(|\mathcal K(a,dv)|\le\sqrt3\,|a||dv|\). The current decomposes as

\[
 K_n/d_n-\mathcal K(\sigma,dv)
 =\mathcal K(g_n,dv_n-dv)+\mathcal K(g_n-\sigma,dv).
\]

The first summand tends to zero in \(L^2\) by strong convergence of \(dv_n\) and the unit-length bound. The second tends to zero in \(L^2\) by almost-everywhere convergence and domination by \(2\sqrt3\,|dv|\). Thus \(K_n/d_n\to \mathcal K(\sigma,dv)\) strongly in \(L^2\). Each individual zero set has measure zero. Neither the limit of the current nor its pairing needs a uniform excision radius around the moving zeros.

The limit current \(K_\infty=\mathcal K(\sigma,dv)\) has distributional divergence zero. In the sum after differentiation the two terms \((i,j)\) and \((j,i)\) cancel by Clifford anticommutation and equality of mixed distributional derivatives. This gives \(\int d\eta\cdot K_\infty=0\) for smooth tests supported away from the time faces, periodic in space. Such tests are dense in the zero-trace scalar \(H^1_0\) space, so the same pairing vanishes for every gradient \(d\eta\) tested in that space. With the bound on \(du_n/d_n\) and the strong current limit, the normalized mixed term tends to zero.

Use the exact E17 identity before completing the square:

\[
 \frac{\int Q_n-3b_n^2/2}{d_n^2}
 =\frac34\|du_n/d_n\|_2^2+\frac34
   +\frac12\int (du_n/d_n)\cdot(K_n/d_n)+\frac{b_n}{2}H_n .
\]

Its lower limit is at least \(\frac34+\frac B2(-1/B)=\frac14\), contradicting the strict negativity for every \(n\). This verifies the limiting sign with the full integrated angular coefficient and the vanishing mixed term.

## Quantifier and evidence · PASS

The contradiction excludes a sequence of strict improvements approaching \(B\) from above. Together with the closed interval and its interior uniqueness assertion this implies \(B<b_{\rm G}\). Equivalently, there exists \(\delta>0\) such that for every \(|b|\le B+\delta\) the radial field is the unique global minimizer over the full E17 class, for example by choosing \(B+\delta<b_{\rm G}\). The margin is existential. The compactness is that of the normalized angular directions in the hypothetical sequence at \(B\), and the compactness question at the true endpoint remains open.

All ten frozen inputs were inspected, with E17 used for the integrated identity and the threshold note used for the interval quantifier. The Fourier truncation, normalized limits and limiting sign were replayed above. The compactness step follows directly from Fourier truncation. The twistor convention follows the frozen branch inputs and Friedrich §1 equation (1.1), previously checked in the published copy on 28 November 2026. No change of hypotheses or correction of the lead claim is needed. [Primary convention](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) · [E17 polar comparison](../notes/E17_POLAR_LOWER_BOUND.md)
