# E237 — All-ratio local jet and final manuscript precision audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E audit configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I authored the prior E217 direct velocity audit of the separate \(9/4\) example, its E221 integration audit, and E234's margin integration audit. I did not author E235, E236 or the lead's TeX integration. The shared inputs are the assessed old velocity, nonlinear quotient equation, curvature reconstruction and native conversion. I checked their generic applicability to the new scalar and actual connection family. All line numbers refer to the frozen TeX. [Request][request] · [Frozen manuscript][tex]

## Disposition

Mathematical pass, with one located attribution repair. For each finite \(r>1\), the new construction gives an actual smooth positive definite, round-compatible connection with a strict local ratio maximum \(r\) and instantaneous native derivatives \(1/2\) for \(\log\rho\) and \(r/2\) for \(\rho\) at the center. The compressed velocity calculation is valid. Lines 10628–10629 should identify the exact local quotient identity used by the preceding manuscript proof, in place of referring to a direct calculation as if it were displayed in that proof. The earlier \(9/4\) family remains separate. [E235/E236 lead assessment][assessment]

## Scalar data and coefficient

At lines 10555–10600, \(Q_r=\operatorname{diag}(a,1,b)\), \(a=2/(1+r)\), \(b=2r/(1+r)\). For every fixed finite \(r>1\), \(0<a<1<b\), \(a+b=2\), \(b/a=r\), and \(d=\sqrt{ab}=2\sqrt r/(r+1)>0\). Simple eigenvalues are differentiable in a neighborhood and normalized eigenpair differentiation at the diagonal point gives \((d\lambda_i)[X]=X_{ii}\). Thus on trace-free symmetric perturbations \(df[X]=-X_{11}/a+X_{33}/b\) for \(f=\log\rho\). Writing \(D_f=\operatorname{diag}(-1/a,0,1/b)\) and \(m=\operatorname{tr}(D_f)/3\), its Frobenius gradient is \(G=D_f-mI=(r+1)\operatorname{diag}(-2r-1,r-1,r+2)/(6r)\). In particular \(|G|^2=(r+1)^2(r^2+r+1)/(6r^2)>0\).

The direction \(T=\operatorname{diag}(a,-2,b)\) is trace-free and \(df[T]=-1+1=0\). For the trace-corrected linear map \(P_Q(X)=X-\operatorname{tr}(QX)I/3\) one has \(P_{Q_r}(G)=D_f\). Indeed \(\operatorname{tr}(Q_rD_f)=0\) and \(\operatorname{tr}(Q_r G)=-3m\). The principal map \(\mathscr L_QX=2(QP_Q(X)+P_Q(X)Q)\) is self-adjoint on the trace-free symmetric space because its second term after expansion is the symmetric rank-one trace contraction. This gives \(\mathscr L_{Q_r}G=\operatorname{diag}(-4,0,4)\). The three manuscript pairings follow:
\[
 df[\mathscr L_{Q_r}T]=4(b-a)=\frac{8(r-1)}{r+1},\qquad
 \langle G,\mathscr L_{Q_r}G\rangle=4(1/a+1/b)=\frac{2(r+1)^2}{r},
 \qquad df[q]=1/a-1/b=\frac{r^2-1}{2r}.
\]
The factor \(4\,df[\mathscr L_{Q_r}T]=32(r-1)/(r+1)\) is positive at every allowed \(r\). Since \(24d\,df[q]=24(r-1)/\sqrt r\), the chosen coefficient is exactly
\[
 \mu_r=\frac{r+1}{32(r-1)}
 \left(\frac{8(r+1)^2}{r}+\frac{24(r-1)}{\sqrt r}+1\right).
\]
Hence \(B=-G+\mu_rT\) has \(df[B]=-|G|^2\), and \(U=B-dq/2\) remains trace-free symmetric. All denominators are positive and finite at each fixed \(r>1\). No uniformity as \(r\downarrow1\) or \(r\to\infty\) enters. [E235 derivation][e235] · [E236 audit][e236]

## Curvature realization and reuse of the preceding proof

Lines 10602–10625 correctly use the fixed Euclidean orientation, normalized positive self-dual triple and \(\epsilon_{ijk}\) bracket of the preceding proof. With \(s_i=\sqrt{(Q_r)_{ii}}>0\), \(F_i^*=-s_i\Sigma_i\) has the round-compatible sign, spans the positive chiral plane, and has old curvature volume \(2dV_{\rm eucl}\) because \(\sum_i s_i^2=3\). These fix \(\widehat g(0)=g_{\rm eucl}\) at old \(K=1\).

The first term in the polynomial connection is \(A^0=\sum_jx^j\alpha_j\) with \(\alpha_j=\iota_{\partial_j}F^*/2\). Its exterior derivative is \(F^*\), and \(\partial_j A_k(0)=F_{jk}^*/2\). The derivative of the cubic contribution to \(A\) is \(\frac12\sum_j(x^j)^2dx^j\wedge V^j\). The affine bracket contributes \([A^0\wedge A^0]/2\), and brackets involving a cubic term start at order four. Therefore \(A(0)=0,\ F(0)=F^*\) and \(\partial F(0)=0\), and the exact curvature satisfies Bianchi. Reconstruction is smooth locally, so the first quotient and metric derivatives vanish as well.

The source formulas at lines 10478–10503 genuinely apply beyond the earlier numbers \(48,75,108\). Here \(\mathcal M_{ij}=F_i\wedge F_j/(2dV_{\rm eucl})\), and at \(F^*\), \(\mathcal M=Q_r\) has trace three. Its first differential is
\[
 \delta\mathcal M_{ij}=-\tfrac12\bigl(s_j\langle\delta F_i,\Sigma_j\rangle+
                            s_i\langle\delta F_j,\Sigma_i\rangle\bigr),
 \qquad
 \delta Q=\delta\mathcal M-\tfrac13\operatorname{tr}(\delta\mathcal M)Q_r .
\]
The basis \((J_kdx^j)_k\) is orthonormal for fixed \(j\) by the normalized quaternion products. The chosen \(V_i^j=-\sum_k(U_{ik}/s_k)J_kdx^j\) gives \(\langle dx^j\wedge V_i^j,\Sigma_k\rangle=-U_{ik}/s_k\). The fixed-volume quotient therefore inserts \(U\) into the corresponding ordinary Hessian slot. No first-curvature terms enter the second derivative of the quotient because \(\partial F(0)=0\).

For the affine term, \(\partial_j\partial_k([A^0\wedge A^0]/2)=[\alpha_j\wedge\alpha_k]\). Its \(i\)-th component contracted with \(\Sigma_p\) has symmetric Hessian \(\frac14\sum_{\ell,m}\epsilon_{i\ell m}\epsilon_{p\ell m}s_\ell s_m\delta_{jk}\). In the product \(J_pJ_\ell\), the identity term pairs antisymmetrically in \(j,k\). The chiral term uses \(\operatorname{sym}_{jk}\langle J_n dx^j,J_m dx^k\rangle=\delta_{nm}\delta_{jk}\). Only the two ordered complementary pairs survive when \(i=p\), giving \(d\,\delta_{ip}\delta_{jk}/(2s_i)\). Thus the affine \(\mathcal M\)-Hessian is \(-dI\delta_{jk}/2\), and the quotient correction is \(dq\delta_{jk}/2\). Adding the cubic gives \((dq/2+U)\delta_{jk}=B\delta_{jk}\). This calculation uses the normalized triple, the fixed bracket, positive \(s_i\) and trace three, and uses the symmetry and vanishing trace of \(U\) for the cubic contribution. No special spectral values enter. [Earlier \(9/4\) assessment][a215] · [Generic realization check][e236]

At the center the covariant Hessian has extra term \([\operatorname{ad}(F^*_{jk}),Q_r]/2\), from \(\partial_j A_k(0)\). The Christoffel symbol contribution has a zero first quotient derivative. The internal term is skew in \(j,k\), so its metric trace vanishes and \(\Delta_AQ(0)=4B\). Its scalar pairing with \(G\) vanishes because \([Q_r,G]=0\). Thus the ordinary and covariant scalar Hessians agree at the critical center and equal \(-|G|^2g_{\rm eucl}\). Positivity, sign and simple spectrum are open near the center. Restricting to a sufficiently small closed ball inside that neighborhood, one may ensure the scalar Hessian is at most \(-|G|^2g_{\rm eucl}/2\) along each radial coordinate segment. Twice integrating then gives \(\log\rho(Q(x))\le\log r-|G|^2|x|^2/4\), including at the boundary of the ball. No common radius is needed.

## Actual velocity and located attribution repair

The tangent curve \(A+\sigma V_{\rm old}(A)\) at lines 10627–10644 has \(F'_0=d_AV_{\rm old}\). Positivity of the curvature in the chosen closed ball and smoothness of the local connection suffice to evaluate this curve for small \(\sigma\). No solution theorem is needed. The earlier quotient equation labeled `flow:nonlinear-Q` is derived from that same first curvature derivative and Bianchi at lines 1990–2040, including the pointwise zero volume variation. It is local and applies to a velocity tangent of a supplied datum. At this zero-first-derivative jet every displayed term quadratic in \(X_c=\nabla_cQ\) vanishes. With \(\Delta_AQ(0)=4B\) and old \(K=1\), it gives exactly \(Q'_0=4\mathscr L_{Q_r}B-24dq\).

The internal reaction can also be checked directly without using the numerical \(9/4\) datum. Put \(\mathcal H=q_A-|q_A|^2I/6\). In the old coordinates the actual velocity comes from \(4*((D^A\mathcal H)\wedge F)\) by self-duality and Bianchi. As \(D^A\mathcal H=0\) at the center, differentiation only keeps
\[
 \partial_j(D^A_k\mathcal H)
 =\delta_{jk}P_{Q_r}(B)+[\operatorname{ad}(F^*_{jk}/2),\mathcal H(0)].
\]
The ordinary part contributes \(8P_{Q_r}(B)F^*\) to \(d_AV\), hence \(4\mathscr L_{Q_r}B\) to the quotient. For the commutator use
\[
 \sum_p F_\ell^*(u,e_p)F_m^*(e_p,z)
      =s_\ell s_m\langle J_mJ_\ell u,z\rangle .
\]
When the internal bracket coefficient is nonzero, the two indices are complementary to \(i\), \(J_mJ_\ell=-\epsilon_{\ell mi}J_i\), and \(s_\ell s_m=d/s_i\). Differentiating the local velocity and then antisymmetrizing therefore gives \(12(d/s_i)(\lambda_i-1)\Sigma_i\) in the \(i\)-th curvature component. The eigenvalue difference sum in this calculation is \(\sum_{m\ne i}(\lambda_m-\lambda_i)=3-3\lambda_i\). Its normalized wedge derivative is \(-24d q\), already trace-free. This provides an independent check of the full reaction at all the specified spectra. [E235 calculation][e235] · [E236 independent audit][e236]

Required source precision at **10628–10629**. The preceding \(9/4\) proof at 10524–10528 invokes the exact nonlinear quotient identity. The direct reconstruction appears in the assessed notes and is credited to the script at 10547–10551, outside that proof. Replace “The direct differentiated velocity calculation in the preceding proof gives” with “Applying the exact identity `\eqref{flow:nonlinear-Q}` to this tangent, with \(\nabla^AQ(0)=0\) and \(\Delta_AQ(0)=4B\), gives”. The reference resolves and its proof covers the full generic calculation just checked. This repairs the attribution without changing the formula or scope. An optional precision at 10602–10603 is to name \(\sum_i s_i^2=3\) and symmetric trace-free \(U\) alongside \(s_i>0\) when invoking the preceding Hessian calculation.

The chosen \(\mu_r\) makes \(df[Q'_0]=-8(r+1)^2/r+32(r-1)\mu_r/(r+1)-24(r-1)/\sqrt r=1\). Native pairing \(2\delta\) doubles both the wedge numerator and normalizing volume. At old \(K=1\), \(g=2\widehat g\) and the adjoint from two-forms to one-forms gains \(1/2\). Thus the geometric velocity and \(df[Q'_0]\) are halved in native time \(\tau=2t\) at the same \(Q\). Since \(d\rho=\rho\,df\), the ratio derivative is \(r/2\). Lines 10647–10653 keep this strict contact result at the level of the original vector field on the local datum. It gives neither a closed-manifold connection nor an evolved counterexample to global preservation. At \(r=9/4\) the new family has spectrum \((8,13,18)/13\), distinct from \((48,75,108)/77\) in lines 10421–10552. The earlier \(12119/14364\) native lower bound remains part of that separate example.

## E234, abstract and E226 source edits

All four E234 optional precisions are present in the source. Line 2803 explicitly treats \(r=7/2\) as a zero lower bound. Lines 6947–6951 require one unshifted sequence to satisfy both geometric bounds, and lines 6958–6959 identify \(\delta(P_0,D_0)\) as the non-effective threshold of the uniform entry theorem. Lines 101–102 state the positive-part convention for the abstract's accumulated margin. The small-density paragraph at 82–92 still states small initial defect energy with bounded intrinsic transport density and diameter on a smooth homotopy four-sphere, independent sufficient small initial supremum of transport density, non-effective thresholds uniform over the stated bases and bundles, global smooth original flow and exponential convergence to one fixed round pullback. The removed sentence supplied the induced-plane-curvature proof method and rank-one exclusion. Its removal changes no hypothesis or claimed conclusion. The bounded late sequence, critical accumulation and zero-energy alternative also remain in the abstract. [E234 prior audit][e234]

The E226 certificate name repair is present at lines 2383–2386 as a separate centered typewriter line containing the entire canonical JSON filename. The generator and independent verifier names remain at 2381 and 2388. The preamble loads `needspace` at line 8, and line 2422 requests six baseline skips immediately before the stationary theorem opening. This is a source-level check of the prescribed typography changes. Rendering was outside this packet. [E226 source findings][e226]

## Static integrity and release

The frozen TeX is 579455 bytes, SHA-256 586fa9231979f1c8bdb18bf3c9eb5ebfccd8533662a596e3134b80502536e962. The protected round equation block at lines 9153–9280, from its section command to the byte before the next section command, is exactly 4501 bytes, SHA-256 c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab. The active source has 395 unique labels and 542 resolved reference calls, including 298 ordinary and 244 equation references. The two local proposition labels occur once each and their proof blocks have balanced math delimiters and environments. The 95 citation-key uses cover the same 40 canonical bibliography entries in first-use order. The new proposition adds no external citation. E235/E236's requested canonical follow-through is a lead-owned record of this additional consumer of the existing R15 Fine v2 Proposition 4.2/(4.1), p. 30. At inspection, the canonical special-case file lists the prior \(9/4\) consumer and the effective-margin extension, with no separate E235/E236 entry. Adding that entry needs no new source pass or citation key. [Canonical reference notes][canonical]

All five frozen input hashes matched. There was no manuscript edit, build, render, primary-source retrieval or certificate replay in the audit. Only this review and its return were written. The source is released to the lead for the located attribution repair.

| Input | SHA-256 |
| --- | --- |
| [E237 request][request] | bfb0fadee73d4ede55376ea200c655df8ec6981423c0ad19990c2f5aaa325d1f |
| [Frozen TeX][tex] | 586fa9231979f1c8bdb18bf3c9eb5ebfccd8533662a596e3134b80502536e962 |
| [E235/E236 assessment][assessment] | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E235 derivation][e235] | 4d056ffb196cc3847245d2753888d30deed5076bfbd12e3b6ff4eca17fc7833d |
| [E236 audit][e236] | 5a07d3caee02536a15b25dd4d130594b2aea6bfcc45e9d67fc43998d1a744b6a |
| [E234 integration audit][e234] | 753ff58a6bd52d934ae46f5563eb361bedc9c94861df8fd6aacca232652f99a6 |
| [Inherited \(9/4\) assessment][a215] | 26c877a82aa97c12fc85e95d58524301b2c1dbe2b58a1c8a3e6d5d2973679c4a |
| [Inherited E226 source locators][e226] | cce0a06b39a41271cd2849974945ec8d6a1717fc1a43db280e9df606b76b2039 |

[request]: ../research-progress/handoffs/SP4-CME-E237_REQUEST_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[assessment]: E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md
[e235]: ../notes/235_ALL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md
[e236]: E236_ALL_RATIO_LOCAL_MAXIMUM_AUDIT_20261123.md
[e234]: E234_MARGIN_MANUSCRIPT_AUDIT_20261123.md
[a215]: E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md
[e226]: E226_MARGIN_PDF_QA_20261123.md
[canonical]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
