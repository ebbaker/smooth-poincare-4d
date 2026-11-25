# E62a · A uniform gap in the isotropic spectral quantity

25 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Bounded derivation MASTER-E62a v1. Actual serving model and reasoning effort are unavailable. Frozen baseline `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`. The [endpoint charge](../manuscript/endpoint_charge.tex) and [critical smoothing](../manuscript/endpoint_smoothing.tex) inputs at that commit have SHA-256 prefixes `d31fd9c9e65a` and `7cce530242f8`. The [independently checked E61 spectral-window derivation](../reviews/E61_SPECTRAL_WINDOWS.md) used the same modified Yamabe gauge. The E62 proof uses that gauge without the E61 comparison distances or disk selection. [Independent E57 flow and isotropic transport check](../reviews/E57_CRITICAL_SMOOTHING.md)

## Result and normalizations

Let \(M\) be a closed oriented smooth homotopy four-sphere, \([g]\) a smooth Riemannian conformal class with positive Yamabe constant \(Y\), and \(g\) its volume-one Yamabe representative. Set \(T=4\pi^2\), \(e=E_+(g)=E_-(g)\), \(Z=\operatorname{Ric}^0\), and \(D=\int_M|Z_g|^2dV_g\). For the real chiral Weyl endomorphisms with Hilbert–Schmidt norm, use

\[
z_\pm=\lambda_{\max}(W^\pm),\qquad L=\max(z_+,z_-),\qquad
\sigma=\int_M L^2dV_g,\qquad P([g])=4e+3\sigma.
\]

There is a universal \(\kappa>0\) such that every such class on a nonstandard smooth type has

\[
 P([g])-8T=D+\tfrac1{12}(36\sigma-Y^2)\ge\kappa. \tag{1}
\]

Consequently, for any fixed \(0<\varepsilon<\kappa\), an infimum of \(P\) over the positive classes at most \(8T+\varepsilon\) recognizes the standard smooth sphere, including an unattained infimum. The empty infimum is infinite. The constant is non-effective. In the E56–E58 notation \(B=4e/3-\sigma\), (1) gives \(8(e-T)\ge3B+\kappa\) on a nonstandard type and recovers the uniform energy gap because \(P\le8e\).

For the algebra, Gauss–Bonnet reads \(D=4e+Y^2/12-8T\). Chen–Zhu's strict and equality classifications give \(36\sigma-Y^2>0\) on a nonstandard type. A trace-free symmetric operator on a real three-space with largest eigenvalue \(z\) has Hilbert–Schmidt norm squared between \(3z^2/2\) and \(6z^2\). The other two eigenvalues sum to \(-z\) and each is at most \(z\), giving the upper bound with extreme spectrum \((-2z,z,z)\). Apply these inequalities to both blocks and use signature to obtain

\[
 \frac e6\le\sigma\le\frac{4e}{3},\qquad \frac92e\le P([g])\le8e . \tag{2}
\]

If (1) failed, there would be a sequence of positive classes, on possibly varying nonstandard types, with \(P_i\to8T\). Both defects in (1) would vanish. By (2), \(\limsup e_i\le16T/9<2T\), so such a sequence automatically enters a fixed strict band \(e_i\le 2T-\delta\). It suffices to exclude vanishing of both defects in that band. [Chen–Zhu, published Theorems 1.4 and 1.6](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)

## Initial (L^2\) tail with no Weyl energy convergence assumption

Take any sequence of nonstandard source types in a fixed strict band with \(D_i\to0\) and \(36\sigma_i-Y_i^2\to0\). Gauss–Bonnet, the sharp round Yamabe upper bound and the band give \(\sqrt{48\delta}\le Y_i\le8\sqrt6\pi\). Pass to a subsequence with \(Y_i\to y>0\). Then \(6\sqrt{\sigma_i}\to y\).

The volume-one modified Yamabe representative \(q_i\) has a positive \(C^{2,\alpha}\) conformal factor and

\[
 R_{q_i}-6L_{q_i}=c_i\le0,qquad
 Y_i\le c_i+6\int_M L_{q_i}dV_{q_i}\le c_i+6\sqrt{\sigma_i} .
\]

Here the modified quotient minimum gives the scalar equation, and a positive minimum on any source would contradict Chen–Zhu's classification of positive generalized Yamabe invariant. It follows that \(c_i\to0\) and \(\sqrt{\sigma_i}-\int L_{q_i}\to0\). The two ensuing estimates are

\[
\begin{split}
 \|L_{q_i}-\sqrt{\sigma_i}\|_{2,q_i}^{2}
 &=2\sqrt{\sigma_i}\left(\sqrt{\sigma_i}-\int L_{q_i}dV_{q_i}\right)\longrightarrow0,\\
 \|R_{q_i}-y\|_{2,q_i}&\longrightarrow0 .
\end{split}
\]

The same Gauss–Bonnet relation, now in the modified gauge, gives \(\|Z_{q_i}\|_2^2=D_i+(\int R_{q_i}^2dV_{q_i}-Y_i^2)/12\to0\). These identities hold by smooth \(C^2\) approximation on each source. Choose and volume-normalize the approximating metrics \(h_i\) sufficiently closely that these norms and the uniform bound \(R_{h_i}-6L_{h_i}=o(1)\) persist. In particular \(R_{h_i}\ge-1\) eventually. [Chen–Zhu, Lemma 2.1, Theorem 1.7, and proof of Theorem 1.4](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)

For \(U_i=|\operatorname{Rm}_{h_i}|_{\mathrm{tens}}\) the full ordered tensor norm gives

\[
 U_i^2=4(|W^+|_{\mathrm{HS}}^2+|W^-|_{\mathrm{HS}}^2)+2|Z_{h_i}|^2+R_{h_i}^2/6,
 \qquad
 U_i\le\sqrt{48} L_{h_i}+\sqrt2|Z_{h_i}|+|R_{h_i}|/\sqrt6. \tag{3}
\]

Take a fixed \(K_0>(\sqrt{48}/6+1/\sqrt6)8\sqrt6\pi\). Inequality (3) shows \(\|(U_i-K_0)_+\|_{2,h_i}\to0\), using only convergence of \(L_{h_i},R_{h_i}\) to their constant limits in the auxiliary \(L^2\) norms, and the vanishing Ricci defect. The ordinary Yamabe inequality gives

\[
  (Y_i-\|R_{h_i}-Y_i\|_2)\|f\|_4^2
  \le 6\|df\|_2^2+Y_i\|f\|_2^2,
\]

so there is a uniform inhomogeneous Sobolev constant. The initial Einstein comparison also holds here since \(\|\operatorname{Ric}_{h_i}-(y/4)h_i\|_2\to0\). [Critical tail smoothing and Einstein transport](../manuscript/endpoint_smoothing.tex)

## Integrated isotropic defect transport

In the moving orthonormal bundle for unnormalized Ricci flow take the diagonal chiral curvature-operator blocks \(A_\pm=W^\pm+(R/12)\operatorname{Id}\). Let \(a\le b\le d\) be the eigenvalues of either block and \(F_\pm=a+b=R/6-z_\pm\). Nonnegative isotropic curvature is precisely \(F_+,F_-\ge0\). Each oriented four-frame tests one chiral block through the trace on an orthogonal two-plane, and frame reversals test the other. Initially \(w_\pm=(-F_\pm)_+=o(1)\) uniformly by the scalar equation. [Chen–Zhu, Section 3, equations (3.1)–(3.2)](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=13)

Hamilton's block equation is \((D_t-\Delta)A=2(A^2+2\operatorname{adj}A+BB^*)\) with the sectional-curvature operator normalization and the appropriate off-diagonal block or transpose \(B\). The minimizing two-plane trace has supersolution inequality \((\partial_t-\Delta)F_\pm\ge2(a^2+b^2)+4dF_\pm\) after dropping the nonnegative off-diagonal term. Thus \((\partial_t-\Delta)w_\pm\le C U w_\pm\). This works at eigenvalue crossings. For example, \(w_\pm\) is the convex maximum of zero and the negative two-plane traces. Each active trace has the asserted reaction bound, including at zero. Smooth this convex function in the endomorphism fibers by an orthogonally invariant mollifier and use its nonnegative Hessian in the heat operator. The quadratic reaction evaluated at the mollifier scale differs by \(O(\epsilon(U+\epsilon))\) from its value at the original tensor. Passing to the limit for each individual smooth flow gives the weak inequality. [Hamilton, 1986, Section 2, pp. 157–158](https://doi.org/10.4310/jdg/1214440433) · [Hamilton, 1997, Theorem 1.2](https://doi.org/10.4310/CAG.1997.v5.n1.a1)

In the common short-time proof set \(v_i=(U_i-\phi)_+\), where \(\phi(0)=K_0\) and \(\phi'=a\phi^2\). Use the uniform propagated Sobolev inequality, \(R\ge-1\), and \(\sup_t\|v_i(t)\|_2\to0\). Testing the weak inequality by \(w_\pm\) gives

\[
 \frac d{dt}\|w_\pm\|_2^2+2\|dw_\pm\|_2^2
 \le C\|w_\pm\|_2^2+C\|v_i\|_2\|w_\pm\|_4^2.
\]

Absorb the last term with the uniform Sobolev constant for large \(i\) and apply Grönwall from time zero. Both \(\sup_t\|w_\pm(t)\|_2\) tend to zero. Consequently at fixed interior positive time the closed smooth limit supplied by E57 is positive Einstein and has nonnegative isotropic curvature. Recognition uses whole-manifold diffeomorphisms. There is no assumption of chiral-energy monotonicity. In fact the preserved scalar-square limit is \(y^2\) by the E57 volume law, and Gauss–Bonnet gives \(E_+(h_\infty)=2T-y^2/48=\lim_i e_i\) at that fixed time.

Positive Einstein metrics are Yamabe in their conformal classes. Thus \(R_{h_\infty}\ge6L_{h_\infty}\ge0\) gives \(Y([h_\infty])^2=\int R_{h_\infty}^2\ge36\int L_{h_\infty}^2\). At strict inequality Chen–Zhu's Theorem 1.4 gives a connected-sum classification, and simple connectivity excludes every nontrivial summand. At equality their Theorem 1.6 leaves the same collection, the Fubini–Study class on \(\mathbb{CP}^2\), or a universal cover conformal to a product of constant-curvature surfaces. The product would itself be compact and simply connected, so both surfaces would be spheres. Both extra possibilities have nonzero second homology. Therefore the limit and every late source in the subsequence are diffeomorphic to the standard sphere, giving (1). [Obata](https://doi.org/10.2969/jmsj/01430333) · [Chen–Zhu, Theorems 1.4 and 1.6](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)

## When the curvature tail is supplied directly

The initial Einstein defect is used for the Einstein limit and scalar-square limit. Common lifespan, smooth closed compactness, and weak isotropic-curvature transport only use the scalar lower bound, initial Sobolev inequality, fixed-cutoff curvature tail and vanishing initial isotropic defect. There is also smooth-type recognition from the resulting nonnegative-isotropic-curvature limit on a homotopy sphere, independently of the Einstein condition. The [E57 direct restart argument](../reviews/E57_CRITICAL_SMOOTHING.md#chiral-deficit-and-recognition-on-the-limit) applies as follows. Nonnegative isotropic curvature persists under short smooth restart. The scalar curvature is initially nonnegative and cannot be identically zero, since then \(L=0\) and Gauss–Bonnet contradicts \(\chi=2\). At positive times it is strictly positive. For either chirality a zero of \(F_\pm\) at positive interior time forces that trace to vanish at preceding positive times by the strong parabolic minimum principle. The nonnegative squares in its equation force \(a=b=0\). The chiral block now has rank one with positive remaining eigenvalue \(R/4\). Testing its equation on a local section \(\xi\) of its kernel gives \(0=2|B^*\xi|^2+2\langle A\nabla\xi,\nabla\xi\rangle\). Its orthogonal eigenline is therefore parallel, yielding a global nonzero parallel two-form by simple connectivity. This contradicts \(b_2=0\). Both isotropic inequalities are consequently strict at positive restart times, and the differentiable four-dimensional positive isotropic curvature classification gives the standard sphere. [Chen–Tang–Zhu, published Main Theorem and Corollary 1](https://doi.org/10.4310/jdg/1341498850)

This direct alternative can replace the Einstein step when an independent fixed-cutoff tail is available. In the proof of (1), the vanishing physical Ricci defect was used to establish the tail through (3). Small spectral deficit alone controls the Weyl and scalar pieces in this gauge and leaves the full Ricci tail as a separate requirement.
