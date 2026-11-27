# SP4-CUT-E02 · positive marked cuts and free-cut minimizers

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. This is the bounded E check in the [marked-cut request](E02_MARKED_REQUEST_20261127.md). GPT-6.2 Sol/ultra was requested. Actual serving model and effort were unavailable for independent verification. The [parent draft](../../manuscript/cuts_of_subcritical_conformal_classes.tex) was read at blob `91ca2d3f2dbb06dc3b391186c24c875e5c888aaf`. The companion inputs below were read at checkout `72068ce`. The four calculations and implications were replayed in the smooth Riemannian category. The four-dimensional implication of the 05 marked-recognition theorem retains its working-theorem status.

## Degree and bending on a product band

Give the compact band \(B\) its ambient orientation and orient each level toward the outgoing end by the normal-first convention. Let \(Y\) be a closed connected oriented native target and \(p:B\to Y\) a continuous map with \(\deg(p|_{Y_{\rm in}})=+1\), where the incoming level is oriented toward the band. If a closed oriented separator \(S=\bigsqcup_j S_j\) satisfies \(\sum_j [S_j]=[Y_{\rm in}]\) in \(H_3(B;\mathbb Z)\), then

\[
\sum_j\deg(p|_{S_j})=1.
\]

For example this homology relation holds if \(S\) together with \(Y_{\rm in}\) bounds a compact subband whose oriented boundary is \(S\sqcup(-Y_{\rm in})\). The degree assertion follows by pushing the fundamental classes forward to \(H_3(Y;\mathbb Z)\). A connected separator has degree \(+1\). For a disconnected separator the identity guarantees a component of nonzero degree. The component condition for PSC domination is that at least one nonzero-degree component carry a positive-scalar-curvature metric. Positivity of every component suffices. If a single component of degree \(+1\) is required, its degree needs an additional hypothesis beyond the degree sum. The product projection is one source of a map on the band with the prescribed incoming degree. [05, §3, definition of PSC domination][marked] · [Chodosh–Maximo–Mukherjee, arXiv:2407.05574v1, Propositions 2.2 and 2.4](https://arxiv.org/pdf/2407.05574v1#page=4)

On a smooth foliated native product band \(B=[a,b]\times Y_{\rm in}\) with \(a<b\), use lapse \(N=|\nabla t|_g^{-1}>0\), shift \(\beta\) defined by \(\partial_t=N\nu+\beta\), slice metric \(h_t\), and \(B_t(X,Y)=g(\nabla_X\nu,Y)\). Then \(\partial_t h_t-\mathcal L_\beta h_t=2N B_t\) and \(d\mu_g=N\,dt\,d\mu_{h_t}\). Taking the trace-free part with respect to \(h_t\) gives the exact mean

\[
\begin{aligned}
\frac{1}{b-a}\int_a^b\!\int_{\Sigma_t}|B_t^\circ|_{h_t}^3\,d\mu_{h_t}\,dt
&=\frac{1}{8(b-a)}\int_a^b\!\int_{\Sigma_t}
N^{-3}|(\partial_t h_t-\mathcal L_\beta h_t)^\circ|_{h_t}^3\,d\mu_{h_t}\,dt\\
&=\frac{1}{8(b-a)}\int_B
N^{-4}|(\partial_t h_t-\mathcal L_\beta h_t)^\circ|_{h_t}^3\,d\mu_g .
\end{aligned}
\]

Apply this if the ambient metric represents the fixed entering conformal class for which SEAM-E05 provides \(C(g_*,F)>0\), computed in one entering gauge \(g_*\) with its fixed isometric embedding \(F\). If the mean is **strictly less** than \(C(g_*,F)^{3/2}\), an interior slice has cubic bending strictly below that threshold. With several components the same bound on the total integral bounds every component. Each such component has positive Yamabe constant by SEAM-E05 and a smooth positive-scalar-curvature representative of its induced class. The degree statement then supplies a positive source for \(Y\). The conclusion is conditional on the specified band map and measured mean. [SEAM-E05][bending]

## The winding-one Mazur cut in the round class

For the unit round \(S^4\) and \(F:S^4\hookrightarrow\mathbb R^5\), the ambient \(R=12\) and \(\operatorname{Ric}(\nu,\nu)=3\) give \(p_g=6\). The trace of the Euclidean second fundamental form of \(F(S^4)\) over any tangent three-plane has norm \(K_F=3\). The cut has Euclidean codimension \(m=2\), with \(5\omega_5/(2\omega_2)=\omega_3=4\pi/3\). Thus \(b_2=3(4\pi/3)^{1/3}\) and the denominator in the SEAM-E05 constant is \(\max\{2,9/6\}=2\). The certified cubic threshold is

\[
C(g,F)^{3/2}=\frac{3^3(4\pi/3)}{2^{3/2}}=9\sqrt 2\,\pi.
\]

In Isoshima's Figure 37 with \(n=1\), the winding-one-first cut is the boundary of \(W^-(0,3)\), or \(\Sigma(2,5,7)\) up to orientation, with nontrivial fundamental group as recorded by Akbulut–Kirby and the witness. It bounds a compact smooth contractible four-manifold. A positive metric on this integral homology sphere would force a connected sum of signed Poincaré spheres or \(S^3\). The smooth contractible filling excludes all nonempty such sums, leaving \(S^3\), contrary to its group. Hence every smooth embedded copy \(S\) of this cut topology in the unit round sphere satisfies

\[
\int_S |B^\circ|_h^3\,d\mu_h\ge 9\sqrt 2\,\pi.
\]

This holds in particular throughout the actual marked isotopy class. For \(\widehat g=e^{2w}g\), the restriction satisfies \(\widehat B^\circ=e^w B^\circ\) as a covariant tensor and \(d\mu_{\widehat h}=e^{3w}d\mu_h\). The cubic density is unchanged. The same number therefore applies in every smooth metric conformal to round, including constant rescalings, and all smooth diffeomorphic pullbacks of that class by transporting the embedding. For a different entering conformal class E05 supplies its own constant. [Brendle, arXiv:1907.09446v4, Theorem 1 and Corollary 2](https://arxiv.org/pdf/1907.09446#page=1) · [Isoshima, arXiv:2403.17356v2, Theorem 3.3 and Figure 37](https://arxiv.org/pdf/2403.17356v2#page=35) · [Akbulut–Kirby, §1 and §5, Figure 22](https://math.berkeley.edu/~kirby/papers/Akbulut%20and%20Kirby%20-%20Mazur%20manifolds%20-%20MR0544597.pdf#page=24) · [Chodosh–Maximo–Mukherjee, Corollary 2.3](https://arxiv.org/pdf/2407.05574v1#page=5) · [Proposition 4.2](https://arxiv.org/pdf/2407.05574v1#page=10) · [05 mixed witness][witness]

## Maps from the actual upper regular level

In the reduced mixed presentation with normalized lower winding row \((1,0)\), write \(Z_a\) and \(Z_b\) for the native winding-one-first and winding-zero-first cuts and \(Y_+=S^1\times S^2\) for the regular upper boundary after both middle attachments. The ordinary surgery matrix in the order \((U,K_a,K_b)\), after converting the dot on \(U\) to a zero label for the boundary calculation, is

\[
\begin{pmatrix}0&1&0\\1&d&c\\0&c&q\end{pmatrix}.
\]

Its determinant is \(-q\), so \(q=0\) because \(b_1(Y_+)=1\). The \(Z_b\) minor is now zero, hence \(H_1(Z_b;\mathbb Z)=\mathbb Z^2\). The \(Z_a\) minor has determinant \(-1\), also giving \(H_1(Z_a;\mathbb Z)=0\). The lower trace for \(Z_a\) is contractible since the winding-one relation kills its cyclic group and gives the unit integral cellular boundary. [05, §3, Theorem “The two normalized mixed cuts”][marked]

- A degree-one map between closed connected oriented three-manifolds is surjective on fundamental group. Indeed it lifts to the cover corresponding to its image. An infinite-sheeted cover has vanishing top homology, and the degree of a finite-sheeted cover divides the original degree. A degree-one map \(Y_+\to Z_a\) therefore makes \(\pi_1(Z_a)\) cyclic and thus trivial by \(H_1(Z_a;\mathbb Z)=0\). Equivalently the positive product metric on \(Y_+\) and the contractible filling give \(Z_a\cong S^3\) by the PSC-domination implication, which in fact excludes every nonzero degree for a nonspherical \(Z_a\). Conversely, if \(Z_a\cong S^3\), collapse the complement of an oriented three-ball in \(Y_+\) and compose with an orientation-preserving diffeomorphism to \(Z_a\) to obtain degree \(+1\). In particular the winding-one Mazur example fails this test. [05, §3][marked] · [Chodosh–Maximo–Mukherjee, Proposition 2.2, Corollary 2.3 and Proposition 4.2](https://arxiv.org/pdf/2407.05574v1)
- For \(Y_+\to Z_b\), degree one would already force an impossible quotient \(\mathbb Z\twoheadrightarrow\mathbb Z^2\) on first homology. In fact any nonzero degree forces injectivity on rational cohomology by Poincaré duality and evaluation on the fundamental class, so the first Betti numbers preclude every nonzero degree. This applies even to the certified Mazur meridian-first cut \(Z_b\cong\#_2(S^1\times S^2)\), whose positive metric supplies a different source. [05 mixed witness][witness]

A retraction of the entire cobordism between \(Z_i\) and \(Y_+\) onto \(Z_i\) restricts to degree \(+1\) on \(Y_+\) with the common level orientation. It also gives split injectivity on \(\pi_1\) and \(H_1\) for the inclusion of \(Z_i\). In reverse this cobordism is \(Y_+\) with one dual 2-handle. If its winding is \(u\), the ordinary outgoing surgery matrix has the form \(\left(\begin{smallmatrix}0&u\\u&v\end{smallmatrix}\right)\). Its determinant forces \(|u|=1\) for \(Z_a\), and rank zero forces \(u=v=0\) for \(Z_b\). The cobordism thus has group \(1\) for \(Z_a\) and \(\mathbb Z\) for \(Z_b\). This makes a retraction impossible for a nonsimply connected \(Z_a\) and for every \(Z_b\). The full two-handle cobordism between the lower and upper regular levels has trivial group, since the forward winding-one relation kills the lower generator. Retraction of that full cobordism onto an embedded native cut gives the same obstructions. If \(Z_a\cong S^3\), the identity extends continuously over the upper elementary cobordism by extending across its relative 2-cell along a nullhomotopic attaching circle. For the full trace the lower elementary cobordism read backward has the same extension property, and the two maps agree on \(Z_a\). This restriction concerns a map on the entire indicated trace. A map on a native product subband is available by its own projection. [05, §3 and mixed witness][marked]

## Free-cut descent and continuation

Let \(g\) be a smooth metric on a connected closed oriented smooth homotopy four-sphere \(M\) attaining \(I^+(M)=\inf\{e(g'):Y([g'])>0\}\) over smooth metrics, with \(Y([g])>0\) and \(e(g)<8\pi^2\). Here \(E_\pm\) use the Hilbert–Schmidt norms of the two curvature-operator blocks and \(e(M)=E_+(M)=E_-(M)\). Suppose a smooth embedded free cut \(\Sigma\cong S^3\) has both strictly positive capped limiting Yamabe constants in the matched construction of Proposition 8.1. Set \(T=4\pi^2\) and write \(e_i=(E_+(V_i)+E_-(V_i))/2\) for the two closed sides \(V_i\), so \(e(g)=e_1+e_2\).

1. Choose a smooth conformal gauge prescribing the round boundary scale and the normal derivative that sets \(B=0\), using \(B^\circ=0\). Match the unit round hemisphere along the round boundary with the opposite outward normal. Each \(X_i\) obtained by capping a side is a smooth homotopy sphere by van Kampen and Mayer–Vietoris across \(S^3\). The original marking gives \(M\cong X_1\#X_2\), using extension of sphere boundary diffeomorphisms over \(D^4\). The matched metrics \(G_i\) are piecewise smooth \(C^{1,1}\), exact for the limiting piece integrals, since their caps contribute zero to both chiral energies. The \(C^1\cap W^{2,2}\) smoothings converge in chiral energy and in the Yamabe constant by SEAM-E04. Closed signature zero on each smooth capped type shows \(E_+(V_i)=E_-(V_i)=e_i\) in the limit. [SEAM-E04][robin] · [Hatcher, p. 553, extension by isotopy to an orthogonal map](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf#page=1)
2. Since \(e_1+e_2<2T\), at least one \(e_i<T\). Its smooth capped approximants are eventually positive and strictly below \(T\) by the two strict limiting inequalities. In the four-index norm of Chang–Gursky–Yang Theorem A, \(\int |W|^2=8e\) on a capped homotopy sphere, and \(16\pi^2\chi=32\pi^2\). Therefore \(X_i\cong S^4\), with the real projective case excluded by the homotopy type. It follows that the other capped type \(X_j\) is diffeomorphic to \(M\). Its smooth positive approximants transfer to \(M\) with energies tending to \(e_j\). Thus \(e(g)=I^+(M)\le e_j=e(g)-e_i\), so \(e_i=0\). By nonnegativity and smoothness both Weyl blocks vanish on the open interior of \(V_i\). Capped positivity was used on the first side for the sphere theorem and on the other side for the same-type comparison. [Chang–Gursky–Yang, Theorem A and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3) · [SEAM-E04][robin]
3. Positive Yamabe sign is open among smooth metrics in the \(C^2\) topology by coercivity of the scalar form at a positive metric. Thus the smooth attained minimizer is stationary for arbitrary smooth metric variations. On a fixed homotopy four-sphere the full four-index Weyl functional is \(8e\), so stationarity gives Bach-flatness of the original smooth \(g\) everywhere. In dimension four the ambient obstruction tensor is the Bach tensor in the cited normalization. Lassas–Liimatainen's full Weyl continuation applies since \(M\) is connected and without boundary, \(g\) is smooth, and \(W=0\) on a nonempty open set. It gives \(W=0\) everywhere, hence \(e(g)=0\). The developing map of the simply connected locally conformally flat \(M\) into \(S^4\) is a local diffeomorphism and, by compactness, a covering of \(S^4\). The target is simply connected, so the map is a diffeomorphism and \([g]\) is conformally round. Continuation is applied to the original smooth metric. The smoothing provides the positive competitors and the strict sphere theorem comparison. [Graham–Hirachi, Introduction and §2](https://arxiv.org/pdf/math/0405068#page=7) · [Lassas–Liimatainen, arXiv:1912.08030v2, Theorems 1.4 and 3.8](https://arxiv.org/pdf/1912.08030v2#page=27) · [Schoen–Yau, §1](https://math.jhu.edu/~js/Math646/schoen-yau.conformal.pdf#page=3) · [LED-E07][flat]

The strengthened §8 conclusion is that a smooth positive attained minimizer on a nonstandard type cannot have a free cut with both strictly positive capped limiting Yamabe constants. The existence of a suitable band or cut, the bending estimate for a proposed family of slices, and the signs of individual capped classes are separate premises for prospective applications.

[bending]: ../../02_seams_and_marked_cuts/notes/E05_UNIFORM_BENDING.md
[robin]: ../../02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md
[flat]: ../../01_chirality_ledger/notes/HALF_FLAT.md
[marked]: ../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex
[witness]: ../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/notes/MIXED_WITNESS.md
