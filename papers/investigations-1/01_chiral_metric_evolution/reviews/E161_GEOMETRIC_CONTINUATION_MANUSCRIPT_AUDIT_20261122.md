# E161 — Geometric continuation manuscript integration audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E integration audit, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable.

I authored E159 and the inherited E09 estimate, and previously audited E137, E148, E152 and E155 in E139/E141, E150, E153 and E156 respectively. E159 agreement is an integration check with disclosed author overlap. The static and topological arguments and determinant specialization have other authors. This audit covers the frozen integration, its specified inputs and its immediate abstract, introduction and reference uses.

## Disposition and local repairs

The geometric criterion, including the topological removal of the distortion hypothesis, and the determinant specialization agree with the separately assessed inputs. Four local repairs make the manuscript's formulas and regularity statements unambiguous. Line numbers refer to frozen TeX.

1. At 3771–3772 write the fixed-frame coefficient formula as `\partial_a Q'_n=\nabla^{A'_n}_aQ'_n-[\gamma_{n,a}+\operatorname{ad}(b'_{n,a}),Q'_n]`, where `\gamma_{n,a}` is the local adjoint connection matrix of `\Gamma'_n`. This identifies the matrix arguments to the commutator. The base Christoffel term in the preceding paragraph concerns the covector slot of `b'_n`.
2. At 3952 state that the modified normalizers preserve orientation and **their pulled-back metrics** converge. For the original maps \(\psi_n\) of one negative orientation sign, use \(\varphi_n=\psi_n\circ\psi_{n_0}^{-1}\). Then \(\varphi_n^*g_n=(\psi_{n_0}^{-1})^*\psi_n^*g_n\). The fixed pullback preserves the specified convergence.
3. At 7838 and 7876 identify \(-dq/2-G+LY\) as the **total** cubic Hessian coefficient, replacing the entire earlier \(LH\) at 7781–7782 (equivalently, substitute this matrix in the cubic with prefactor \(1/6\)). This keeps the single factor of \(L\) in the derivative calculation.
4. At 7879–7881 set \(w=f\circ Q\) and write \(dw(o)=0\), \(\nabla^2w(o)=-|G|^2g_{\rm eucl}\). The affine matrix differential at \(Q(o)\) is represented by \(G\ne0\). For direct use of the earlier jet range it is enough to take a fixed \(0<\varepsilon\le1/8\), \(q=Q(o)-I\), and finite \(L>0\).

For nearby notation, defining \(g_n=g_{A_n}\) and \(F_n^\sharp(v)=\langle F_n,v\rangle_E\) where first used would make the map direction explicit. In the sequence statement, the complete-fiber distortion is the supremum over same directions of the transport condition number, \(D=\sqrt{\lambda_{\max}(Q)/\lambda_{\min}(Q)}\). Giving that identity beside the earlier real-transport cross-reference at 3901 makes the floor step at 3958 immediate.

## Static extraction over the supplied positive metric limit

The maps in `prop:metric-pair-compactness` point in the required directions. The native wedge identity identifies the oriented chiral isometry \(\sigma_n=-F_n^\sharp S_n^{-1}:E\to\Lambda^+_{g_n}\). For \(L_n=g_b^{-1}g'_n\), \(C_n=L_n^{-1/2}:(TM,g_b)\to(TM,g'_n)\) is an orientation-preserving isometry and \(J_n=(C_n^{-1})^*\) is the forward isometry of self-dual covectors. The pulled curvature isometry \(\widetilde\sigma_n\) has domain \(\varphi_n^*E\). Thus \(U_n=\widetilde\sigma_n^{-1}J_n\sigma_b\) is a smooth oriented isometry from \(E_x\) to \(E_{\varphi_n(x)}\). The adjoint homomorphism identifies \(P\) with \(\operatorname{Fr}^+(E)\), whose induced equivariant frame action gives the lift. This uses termwise definiteness. The later uniform eigenvalue floor is unnecessary for constructing the lifts.

In pullback coordinates \(\sigma'_n=J_n\sigma_b\), so \(D^{\Gamma'_n}=(J_n\sigma_b)^{-1}D^{+,g'_n}(J_n\sigma_b)\) includes the derivatives of the identification and cancels the varying curvature frames exactly. Only first derivatives of \(g'_n\) enter. Matrix functional calculus on its common positive range gives \(J_n\to J_\infty\) in \(C^1\), and the connection coefficients converge in \(C^0\).

The native defect factors are \(2\sqrt6\) for \(|b|\) versus \(|T|\), and \(\sqrt2\bigl(6|\nabla^AT|+(36+8\sqrt3)|T|^2\bigr)\) for \(|\nabla^\Gamma b|\). The internal basis rescaling gives \(\sqrt2\). Scaling the one covector slot of \(b\) and \(T\), and the two slots of their full derivatives, cancels the constant base conversion. The trace-three inverse formula is \(\nabla_Y^AQ=2S(T_Y-\operatorname{tr}(QT_Y)I/3)S\). On symmetric matrices write \(\mathcal S(H)=SHS\). Then \(\nabla_Y^AQ/2=\mathcal S^{1/2}\Pi\mathcal S^{1/2} T_Y\), with \(\Pi\) projecting off \(\mathcal S^{1/2}I\) of squared norm \(3\). The operator has norm at most \(\lambda_{\max}(Q)\le3\), giving the manuscript's full derivative bound \(6|T|\) without a quantitative floor.

Uniform metric equivalence and bounded first metric derivatives convert the two tensor estimates to coordinate first-derivative bounds on finite nested chart compacta. For \(b'\) the coordinate derivative subtracts the internal connection action and adds the Christoffel action on its covector index. For \(Q'\) it is the corrected formula above. Arzelà–Ascoli yields uniform limits in a fixed background. In the internal-column notation \(F'_n=-\sqrt{Q'_n}\sigma'_n\), equivalently \(F_n^{\prime\sharp}=-\sigma'_n\sqrt{Q'_n}\). The square root is uniformly continuous on the compact semidefinite range. Fixed-frame weak curvature and Bianchi identities pass by uniform convergence of coefficient and bracket terms. The trace wedge density passes as well. A positive limiting \(Q_\infty\) reconstructs precisely \(g_\infty\) with the same curvature-map sign. This establishes a continuous compatible limiting pair, in the distributional curvature sense required by the continuation criterion, from the supplied \(C^1\) metric convergence.

## Kernel transport and the topology case

The inverse formula yields \(|\langle (\nabla_Y^AQ)v,v\rangle|\le4|Y||T|\langle Qv,v\rangle\), since \(|\operatorname{tr}(QT_Y)|/3\le|T_Y|\). Along each fixed piecewise \(C^1\) curve, use smooth termwise parallel transports and the two-sided Gronwall bounds. Uniform convergence of connection matrices in finitely many curve charts gives convergence of the linear transport ODEs. The positive uniform metric limit gives convergence of lengths. Both inequalities pass along the pair subsequence already chosen, for every fixed curve. The resulting invertible isometry maps the two endpoint kernels onto one another. Connectedness gives constant rank.

The kernel projector \(\Pi\) is continuous by constant rank. Along coordinate lines the parallel-transport identity gives \(\partial_i\Pi=-[\mathcal A_i,\Pi]\) with continuous local adjoint matrices \(\mathcal A_i\), so \(\Pi\) is \(C^1\). Alternating the derivatives produces

\[
-[\partial_i\mathcal A_j-\partial_j\mathcal A_i,\Pi]
-[\mathcal A_j,\partial_i\Pi]+[\mathcal A_i,\partial_j\Pi]
=-[\operatorname{ad}(F_{\infty,ij}),\Pi]=0.
\]

This only needs the continuous exterior derivative of \(\mathcal A\) obtained from weak curvature. Local convolution of \(\mathcal A\) and its exterior derivative converges uniformly on smaller charts, making the alternating rule against the \(C^1\) projector valid in distributions. The final commutator vanishes pointwise by continuity.

Rank two would give a parallel kernel line \(L\). Each skew curvature endomorphism annihilates \(L\), so native \(so(3)\) brackets place each curvature value in \(L\), while the chiral factorization has internal image \(L^\perp\). Rank one gives a parallel image line. Its unit double cover splits on the simply connected base. The resulting unit section \(v\) is \(C^1\), as seen by locally normalizing the projected frame section and choosing the locally constant sign. Metricity and parallelness then give \(D^{A_\infty}v=0\). Trace three yields \(Q_\infty=3v\otimes v\) and \(F_\infty=v\omega\) with \(\omega=-\sqrt3\sigma_\infty(v)\). The form is \(C^1\) and self-dual with ordinary two-form norm squared \(3\). The weak Bianchi identity and the \(C^1\) product rule yield \(d\omega=0\).

For the smooth approximation take compositions \(\Phi_s\) of flows of finitely many smooth spanning vector fields and average \(\Phi_s^*\omega\) against a smooth compact parameter kernel supported near zero. At zero the parameter differential is onto, uniformly in a sufficiently small neighborhood by compactness. A finite localization and change of four parameters to the target point gives smooth localized integral kernels after integrating the remaining parameters. Each average is closed, and uniform convergence follows from \(\Phi_s\to\mathrm{id}\) in \(C^1\). By \(H^2(M;\mathbb R)=0\), these smooth averages are exact, so Stokes makes their wedge squares integrate to zero. Uniform convergence contradicts \(\int_M\omega^2=3\operatorname{Vol}_{g_\infty}>0\). Trace excludes rank zero and compactness gives the uniform positive floor at rank three. Thus the assessed topology test supplies positivity under the asserted metric and strain assumptions. The topology argument by itself supplies neither the metric limit nor the selected geometric bounds.

## Selected times and native curvature constants

The corollary uses one sequence \(\tau_n\to\tau_*\) with simultaneous bounds, where \(0<\tau_*<\infty\) and the smooth definite original solution is supplied. The complete-fiber estimate uses \(k^2=4\pi/5\) and gives \(\mathcal G=|\nabla^AT|+|T|^2\le B=(1+4\sqrt3)P_0/k^2\). Consequently \(|T|+|\nabla^AT|\le\sqrt B+B\). There is no hidden eigenvalue floor in this step.

With \(c=2K\), native internal components gain \(\sqrt2\) and the ordinary two-form norm contributes \(c^{-1}\). The older chiral block, when divided by \(c\), is \(\tfrac12|F_\Gamma+\sigma|_{\rm native}\), and the scalar target rescales from \(12K\) to \(6\). This gives the exact right side \(\tfrac12|Q-I|+6|\nabla^AT|+(42+8\sqrt3)|T|^2\) in 3925–3932. Positivity and trace three give \(|Q-I|^2=\operatorname{tr}Q^2-3\le6\), so the stated \(Z_0=\sqrt6/2+(42+8\sqrt3)B\) bounds the chiral block. Its summands give \(|\mathrm{Ric}_0|\le2Z_0\) and \(|s-6|\le4\sqrt3 Z_0\). Using \(|g|_g=2\) in \(\mathrm{Ric}=\mathrm{Ric}_0+sg/4\) gives the displayed absolute Hilbert–Schmidt Ricci bound. There is no opposite-chiral curvature input here.

The R29 invocation supplies a positive strong \(C^{1,\alpha}\) metric limit on the fixed smooth closed base after smooth diffeomorphisms, from absolute Ricci, injectivity floor and diameter ceiling. Applying the theorem for one fixed \(0<\alpha<1\) suffices. After the orientation repair, the static proposition applies either by \(\lambda_{\min}\ge D_0^{-2}\) since \(\lambda_{\max}\ge1\), or by the topology case. It supplies the smooth-lifted positive \(C^0\) pair accumulation sequence in the same bundle. The earlier sequential criterion then extends the original solution smoothly and definitely in its old identification. No time dependence or convergence of the selected normalizers is involved. At finite maximal time this excludes the simultaneous bounds on any late sequence. It does not assert individual divergence of each quantity or any estimates between the selected times.

## Determinant-one trace paragraph

On the affine trace-three slice, \(d p[X]=-(p/3)\operatorname{tr}(UX)\) and \(dU[Y]=-UYU\). Thus \(\det(pQ)=1\), \(f=3p-3\), \(G=p(mI-U)\) and the displayed Hessian acts as the identity at \(I\). The self-adjoint principal operator from the earlier equation gives \(\mathscr L_QG=4p(Q-I)\). For \(r=1-\varepsilon^2\), \(D\perp N\), \(|D|^2=2\), \(|N|^2=2/3\), the gradient is \(p\varepsilon(D-\varepsilon N)/r\). Orthogonal projection gives \(Y=4p\varepsilon^2(\varepsilon D+3N)/(3+\varepsilon^2)\) and \(|Y|^2=32p^2\varepsilon^4/(3+\varepsilon^2)\). Both agree with E152/E153.

The assessed compatible polynomial jets contribute a baseline \(dq/2\) to each pure second spatial derivative of \(Q\), with skew commutator traces zero. Using the total cubic coefficient specified above gives diagonal pure trace-relevant derivative \(-G+LY\) in each direction and \(\Delta Q=4(-G+LY)\). First derivatives vanish. Hence \(w=f(Q)\) has fixed value and full spatial Hessian \(-|G|^2 g_{\rm eucl}\). The first-jet terms in the flow vanish and the reaction is \(-24dq\). Using \(\langle G,q\rangle=2p\varepsilon^2/r\) and \(\langle G,\mathscr L_QG\rangle=8p^2\varepsilon^2/r\), the old-clock derivative is indeed

\[
-32p^2\varepsilon^2/r-48dp\varepsilon^2/r
     +128Lp^2\varepsilon^4/(3+\varepsilon^2).
\]

For this construction \(K=1\), so the native time derivative at \(\tau=2Kt\) is half this expression, as follows from the manuscript's general clock conversion. The covariant Hessian is the same tensor under constant base rescaling. Each finite \(L\) gives a definite local connection on an individual neighborhood. The fixed strict local scalar maximum and unbounded positive initial derivative exclude the stated smooth scalar principal mechanism. They give no global maximum or counterexample to a closed-base flow. The opening phrase at 7849 could refer to the determinant-one Gram normalization familiar from hypersymplectic flow, making clear that E152 constructs the present scalar on the trace-three slice.

## Front matter and primary-source integration

- The abstract at 63 accurately highlights the homotopy-sphere version within the supplied definite-flow setting. An additional clause naming the distortion hypothesis on general bases would expose the other half of the theorem. The introduction at 291–295 accurately describes the implication and could link the sequence corollary directly. The retained qualifications preserve the distinction from initialization, global a priori control and long-time convergence.
- R29 is the undated author-hosted Michael T. Anderson text *Cheeger–Gromov theory and applications to general relativity*, inspected at Definition 1.1 (printed p. 2) and Theorem 2.2, condition (2.3) and proof (printed pp. 4–6). The author index's 2004 Birkhäuser metadata is distinct from the exact inspected copy. The R28 1990 journal text supplies no theorem in this argument. The manuscript uses the inspected R29 source for precisely the fixed-closed-manifold compactness conclusion, in bibliography position 28. [E154 source assessment](E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md)
- R26 is Fine–Yao arXiv:2001.11755v2, 6 February 2020, Proposition 3.2, displayed trace inequality (3.10), and Theorem 4.7, in bibliography position 31. The inspected source concerns a globally defined triple of individually closed two-forms under hypersymplectic flow. The theorem uses its own additional torsion hypothesis. Covariant Bianchi for the present curvature triple is a different equation, and the manuscript accurately restricts the conclusion to the determinant-normalization transfer. [E152/E153 assessment](E152_E153_DETERMINANT_TRACE_ASSESSMENT_20261122.md)
- Static TeX checks found 321 unique labels, 186 distinct reference targets with definitions and 35 cited keys, all present in the canonical bibliography and listed in first-use order. The new spans have balanced environments. The protected earlier closed-round defect section matches its recorded 4,501-byte hash `c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab`. The root separately owns compilation and visual verification. No primary work was newly inspected for this integration audit.

## Frozen evidence

| Input | SHA-256 |
| --- | --- |
| [E161 request](../research-progress/handoffs/SP4-CME-E161_REQUEST_v1.md) | `b5e9522e652d92d5ddf44cb763abb1c6cf47cc2f4f737ef333b531ef51a6a651` |
| [Manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex) | `e80a252fcbe9e0907842ba8d11f8a54aa8809a7217e7fd49fbebb2657e28d43e` |
| [E157–E159 assessment](E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md) | `b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52` |
| [E155/E156 assessment](E155_E156_STATIC_PAIR_COMPACTNESS_ASSESSMENT_20261122.md) | `3fae61f8eb3c3dd391dd98595ceeddf0cac173296a3ce53867830f538d4bbc70` |
| [E154 assessment](E154_METRIC_COMPACTNESS_SOURCE_ASSESSMENT_20261122.md) | `ea4b36e70a665ade7fa143e97be1f3f2238db7657591f729b22b27802e4594ec` |
| [E152/E153 assessment](E152_E153_DETERMINANT_TRACE_ASSESSMENT_20261122.md) | `3f9d176349ec78f9d7a083769695cc50ce139b6ba0fbe0fa7b89fba7e30b81d1` |
| [E152 note](../notes/152_DETERMINANT_NORMALIZED_TRACE_TEST_20261122.md) | `d860eb8260834bd65283e727a3574c8580a4b7890bfc1b9d87075fd82672e5d4` |
| [E157 note](../notes/157_SEMIDEFINITE_LIMIT_RANK_TEST_20261122.md) | `50e48a665f370b3c24b642f3e172e32f53ffbdc0775e3ae198dedb19fbabdde9` |
| [E159 note](../notes/159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md) | `eb5a66fc93fcf8e04e41870caa426e09399944be2a302b008befffb513851156` |

Frozen geometric subsection and trailing blank lines at 3670–3979, 12,254 bytes, SHA-256 `40a88024ba9291ecc6054adbf372bce5ea1c236583cdab1ac73eafbc7441f7ff`. Frozen determinant paragraph and trailing blank lines at 7848–7912, 2,575 bytes, SHA-256 `3c9640ba009ed74cfa4f9187810eee1502c12b99f7f584592a4c5c0f575ea760`. The audit also checked the immediately preceding scalar mechanism and the front-matter statements at 63 and 282–315.
