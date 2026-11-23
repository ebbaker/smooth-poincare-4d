# E221 — Local spectral-ratio manuscript integration audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E integration audit, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored E217, the earlier independent audit of E215. This review checks the lead's distinct manuscript integration against the assessed local result.

## Disposition

Mathematical pass for the new proposition and proof at frozen TeX lines 9870–9968. The exact local maximum, strict native derivative bound and realization by an actual polynomial connection agree with E215/E217. The end of the block states the local scope correctly. The transition at line 9986 should name the separate concentration example directly. Two short proof precisions would make the conventions, affine Hessian and instantaneous evaluation self-contained at their points of use. No shared file was changed. [Frozen manuscript][tex] · [Lead assessment][assessment]

## Mathematical checks

The chosen \(Q_*=\operatorname{diag}(48,75,108)/77\) has trace three, eigenvalue gaps \(27/77\) and \(33/77\), and \(\rho(Q_*)=9/4\). The smoothness asserted for \(\log\rho\) is confined to its simple-spectrum neighborhood. The normalized eigenpair differential and the trace-free projection give \(G=(77/1296)\operatorname{diag}(-22,5,17)\). Substitution in the resolved principal-operator reference gives \(\mathscr L_{Q_*}G=\operatorname{diag}(-4,0,4)\). Orthogonal projection in the diagonal trace-free plane gives \(Y=(10/133)\operatorname{diag}(4,-13,9)\). This is perpendicular to \(G\) and its squared norm is \(200/133\). The self-adjointness used for the \(G,Y\) pairing is shown in the proof of Proposition prop:nonlinear-Q. The three scalar pairings at lines 9907–9909 are \(788557/279936\), \(1001/108\), and \(385/432\), respectively. [Assessed scalar algebra][e215] · [E217 reconstruction][e217]

With \(d=\sqrt{\det Q_*}\), the manuscript's cubic matrix is exactly \(U=-dq_*/2-G+10Y\) in old \(K=1\) calibration. The \(1/2\) in the affine connection gives exterior derivative \(F^*\), while the \(1/6\) in its cubic component contributes exactly one \(U\) to each ordinary diagonal Hessian slot through the displayed quotient differential. The fixed-volume wedge differential counts each ordinary two-form pair once. It gives \(\delta\mathcal M=\delta Q=U\) by symmetry, trace-freeness and orthonormality of the \(J_jdx^a\). The positive square roots occur in denominators, with no dependence on closeness to \(I\). The affine bracket gives the separately verified \(-dI\delta_{ab}/2\) before quotienting and \(dq_*\delta_{ab}/2\) after trace correction. These combine with \(U\) to give \((-G+10Y)\delta_{ab}\). The exact polynomial curvature enforces Bianchi. The vanishing first curvature derivative and smooth positive reconstruction give the stated zero first quotient and metric derivatives. The \(\frac12[\operatorname{ad}(F^*_{ab}),Q_*]\) term is the differentiated internal connection and contracts to zero on the tangent \(a,b\) slots. The scalar first derivative is zero and its Hessian is \(-|G|^2g_{\rm eucl}\). Taylor's theorem on a smaller ball inside the open positive, round-compatible, simple-spectrum neighborhood gives strict pinching away from the center. [Realization and baseline derivations][e215] · [E217 direct check][e217]

With all \(X_c=\nabla_c^AQ\) zero at the center, the cited full original flow equation retains \(-24dq_*\) and gains \(4\mathscr L_{Q_*}(-G+10Y)\) from the rough Laplacian. That reaction comes from the differentiated internal connection and is independent of the vanishing linear jets. The exact old scalar value is \(8000/133-1001/27-(385/18)d\). Since \(0<d^2=388800/456533<1\), its strict lower bound \(12119/7182\) holds. Doubling the internal metric multiplies native orthonormal curvature components by \(\sqrt2\), doubling both numerator and volume in \(Q\). The old volume and \(K=1\) give \(g=2\widehat g\). The two-to-one form adjoint then scales by \(1/2\), with the constant internal scaling cancelling in the adjoint relation. Thus \(\tau=2t\) and half the old derivative is the claimed native derivative greater than \(12119/14364\). The reference to the frozen arithmetic script describes its direct check accurately. No certificate replay was needed for this integration review. [Full reaction and clock check][e217] · [Lead assessment][assessment]

## Located integration precisions

1. **Lines 9912–9937, conventions and affine Hessian.** The earlier paragraph at 9723–9725 introduces the constant self-dual forms and defines \(J_i\), but does not display their exact order or quaternion sign. At 9912 identify the normalized triple explicitly, or point to the \(\eta\) convention in the proof of Proposition rec:compatibility at lines 1334–1353. The E215 ordered triple is \((dx^{14}+dx^{23},dx^{24}+dx^{31},dx^{34}+dx^{12})\); it gives \(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\) and \(\Sigma_i^*\wedge\Sigma_j^*=2\delta_{ij}dV_{\rm eucl}\). State \(\widehat g(0)=g_{\rm eucl}\) from the center plane and volume. At 9933 one contraction would display the affine baseline without asking the reader to supply a near-round extension. For \(\alpha_a=\iota_{\partial_a}F^*/2\), the symmetrized pairing of \([\alpha_a\wedge\alpha_b]_i\) with \(\Sigma_j^*\) is
   \[
    \tfrac14\sum_{r,t}\epsilon_{irt}\epsilon_{jrt}s_rs_t\,\delta_{ab}
      =\tfrac{d}{2s_i}\delta_{ij}\delta_{ab}.
   \]
   The ordinary wedge quotient differential immediately gives the displayed Hessians. These are proof receipts for the correct formulas already in the draft.
2. **Lines 9952–9957, time direction.** State explicitly that the instantaneous identity is evaluated at \(\sigma=0\) on \(A+\sigma V_{\rm old}(A)\), whose curvature derivative is \(d_A V_{\rm old}(A)\). The referenced equation uses only this tangent and spatial identities at the slice. The proposition and its closing paragraph already give the correct directional scope. This short bridge keeps the proof's \(Q_t\) notation tied to the same scope.
3. **Line 9986, scope at the next subsection.** Replace “The preceding pointwise distinction has a separate global static example” with “The following global static example concerns concentration of the defect and strain.” In its current position, the backward reference can be read as a global counterpart of the immediately preceding ratio boundary jet. The actual construction at 9987–10017 instead compares small energy and integrated speed with pointwise defect and spatial strain cost on a family of static round-bundle connections.

## References, protected section and separation of claims

The label prop:spectral-ratio-local-maximum is unique. Its principal-operator and original-equation references resolve to lines 1958 and 1973, and the surrounding Fine/Fine–Yao roles stay with their existing functionals and flows. The source scan found 379 unique labels, 512 resolved reference occurrences and 40 citation keys in exact bibliography first-use order. This addition uses the assessed branch calculation, with the frozen verifier named as a check. The protected round section from its literal heading through before the next section is 4501 bytes, SHA-256 c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab, matching the recorded baseline.

The proposition uses one fixed \(9/4\) simple-spectrum local datum and claims a directional derivative, with no closed extension or evolved example. The stationary and gradient theorems remain in their assessed \(9/4\) class. The separate existing axial sentence qualifies its larger sign range by repeated eigenvalues. No general \(7/2\) theorem, forward-invariance conclusion or revised stationary hypothesis enters here. This was a source integration review only. The frozen input is released for lead integration.

## Verified identities

| Input | SHA-256 |
| --- | --- |
| [E221 request][request] | b889b0e0f48c9e803bf490a7eac57286acc6e643f8aa9e484d6d7438db42456e |
| [Frozen TeX][tex] | e36066e1d6a28166445738a2a87c5722aee3d3a535b8726ec5dd84f51bcd7ffd |
| [E215][e215] | 21812494994f845b5b20c05f52a1be3e630417ece04431b01dd255e76f9057e1 |
| [E217][e217] | 3803d58e487706afce63bf4ae6062b8a3c5bef79c7ced3917da2b838e6e3721d |
| [E215/E217 lead assessment][assessment] | 26c877a82aa97c12fc85e95d58524301b2c1dbe2b58a1c8a3e6d5d2973679c4a |

[request]: ../research-progress/handoffs/SP4-CME-E221_REQUEST_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e215]: ../notes/215_SPECTRAL_RATIO_LOCAL_MAXIMUM_TEST_20261123.md
[e217]: E217_SPECTRAL_RATIO_JET_AUDIT_20261123.md
[assessment]: E215_E217_SPECTRAL_RATIO_ASSESSMENT_20261123.md
