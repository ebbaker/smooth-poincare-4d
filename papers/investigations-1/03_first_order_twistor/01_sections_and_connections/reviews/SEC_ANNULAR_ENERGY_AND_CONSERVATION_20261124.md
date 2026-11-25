# Annular energy, the linearized Bach equation at the cone, and the conservation law

24 November 2026, America/New_York. Research assessment prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as the session's configuration records it. The author asked this session to continue the research, and it acted as lead for B34, B35 and E59–E61. The recommended Astra/ultra lead and gpt-6.2-sol/ultra helpers were not available. The lead froze each request and then executed the packet itself, so the returns are not independent of the decisions, and no second reader has checked the proofs. The [preceding assessment](SEC_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) and its [handoff](../continuation-notes/04_AFTER_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) give the baseline. The [manuscript](../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) was not edited; it develops the results through E58.

## The question

The preceding assessment studied sequences on a homotopy four-sphere with positive Yamabe constant, \(4\pi^2\le E_+\le8\pi^2-\delta\), and conformally invariant total Bach norm \(\mathfrak B=\int|B|\,dV\) tending to zero. It excluded several kinds of concentration and left outside its tests a long neck that carries energy. Its handoff proposed one finite test: on a long annulus, in one Euclidean chart, pair the first variation of the Weyl functional with the difference between the metric and the flat one, and see whether the resulting energy bound depends on the length.

## What is proved

Norms: \(|W|^2\) is the full four-index norm, equal to \(4(|W^+|^2+|W^-|^2)\) in the Hilbert–Schmidt norms of the manuscript, and the gradient of \(\int|W|^2dV\) is \(-4B\).

### One chart on a long annulus

Let \(g=\delta+v\) on \(A^*=\{r/2<|x|<2R\}\), \(A=\{r\le|x|\le R\}\), with \(\varepsilon=\sup|v|\), \(K=\|D^2v\|_{L^2(A^*)}\) and \(\mathfrak B=\int_{A^*}|B_g|dV_g\). [E59](../notes/SEC_E59_20261124.md) proves, with universal \(\varepsilon_0\) and \(C\) and no dependence on \(R/r\):

1. If \(\varepsilon\le\varepsilon_0\), then \(\int_A|W_g|^2dV_g\le C\varepsilon[\mathfrak B+(K+\varepsilon)(1+\varepsilon K)]\). No bound on \(\|Dv\|_{L^4}\), no smallness of \(\mathfrak B\) and no condition on the end shells is needed. This answers the test of the handoff positively, and under its hypotheses the energy tends to zero already when \(\mathfrak B\) is bounded.
2. If \(v\) is divergence free and trace free, \(\int_A|W_g|^2dV_g\le C(\varepsilon\mathfrak B+\varepsilon^2)\), with no hypothesis on \(K\).
3. For a second metric \(\bar g\) uniformly within \(\varepsilon\) of \(g\), \(\int\eta^4|W_g|^2\le\int\eta^4|W_{\bar g}|^2+4\varepsilon\,\mathfrak B(g)+C(1+M)^4\varepsilon^{1/2}\), where \(M\) bounds second derivatives in \(L^2\) and first derivatives in \(L^4\) of both metrics.
4. The product \(\varepsilon\mathfrak B\) is attained up to constants by a high-frequency plane wave and by cones of every length, and \(\varepsilon^2\) by a field with constant Weyl tensor.

The proof has two ingredients. The test tensor \(v\) sees the whole Weyl tensor, because the curvature is affine in the second derivatives of the metric and the top-order terms of \(W'_g[v]\) and \(W_g\) cancel. The quadratic term in \(Dv\) is bounded by the amplitude through \(\int\eta^4|Dv|^4=-\int v\cdot\partial(\eta^4|Dv|^2Dv)\), which has no boundary term and therefore no logarithm.

Item 3 has a reading that is independent of charts. Since \(4\mathfrak B(g)=\sup\{D\mathcal W_g[h]:|h|_g\le1\}\), the total Bach norm is the slope of the Weyl functional for the uniform distance between metrics, and the second variation contributes the nonnegative term \(2|W'[k]|^2\). A metric with small total Bach norm almost minimizes the Weyl energy among uniformly close metrics with bounded second-derivative energy. With a fixed smooth \(\bar g\) this gives the strong-convergence mechanism of E57 locally, with second derivatives in \(L^2\) and bounded \(\mathfrak B\).

### The linearized equation at the flat cone

[E60](../notes/SEC_E60_20261124.md) works at the flat metric of \(\mathbb R^4\), with \(W'\), \(B'\) the linearized Weyl and Bach operators.

1. A field on \(\mathbb R^4\setminus0\), homogeneous of degree \(\mu\) with \(-2<\operatorname{Re}\mu<2\) up to powers of \(\log|x|\), that solves \(B'(h)=0\) has \(W'(h)=0\). The first exponents with \(W'\ne0\) are \(\mu=\pm2\), with the explicit ten-dimensional families \(\mathsf W_{ikjl}x_kx_l\) and \(\mathsf W_{ikjl}x_kx_l|x|^{-4}\). There is no free slowly varying mode.
2. The field \(H\log|x|\) is not a solution. It is the cone \(\delta-c\,s_H\), \(s_H=(x\otimes Hx+Hx\otimes x)/(2|x|^2)\), in a sheared chart. Per unit of \(\log|x|\) its Weyl energy is \(\tfrac{20\pi^2}9|H|^2c^2\) and its \(L^1\) Bach norm is about \(43\,|H|\,c\).
3. For compactly supported \(h\): \(\|h^{TT}\|_\infty\le(2\pi^2)^{-1}\|B'(h)\|_{L^1}\) and \(\int|W'(h)|^2\le\pi^{-2}\|B'(h)\|_{L^1}^2\). The proof is an explicit identity that trades the logarithmic kernel for a bounded one, using that \(B'(h)\) is divergence free. The energy inequality holds for linearized fields on the round \(S^4\), so along every ray through the round metric \(\mathfrak B^2/E_+\ge8\pi^2\) in the limit.

### The conservation law

[E61](../notes/SEC_E61_20261124.md) holds for every smooth metric on a four-manifold.

1. \(D(|W|^2dV)[h]=(-4\langle B,h\rangle+\operatorname{div}\mathfrak b(W;h))dV\) with \(\mathfrak b(W;h)^m=4W^{imkl}\nabla_kh_{il}-4(\nabla_jW^{ijml})h_{il}\).
2. For every vector field \(X\), \(P_X=|W|^2X+8B(X)^\sharp-\mathfrak b(W;L_Xg)\) is divergence free and has zero flux through every compact two-sided hypersurface: \(\oint|W|^2g(X,\nu)=-8\oint B(X,\nu)+\oint g(\mathfrak b(W;L_Xg),\nu)\). There is no term at a far boundary.
3. If \(X\) is conformal Killing the last term vanishes. A Bach-flat metric with a transverse conformal Killing field has \(W=0\) there. Bach-flat cones over closed three-manifolds, in the wide sense of a transverse homothetic field, are conformally flat, with no smallness assumption.
4. On a neck with a function \(\tau\) and a field \(X\), \(X(\tau)=1\): \(\int\varphi(\tau)|W|^2\le8\Lambda\int|B|+4\|W\|_{L^2}\mathfrak d\), where \(\Lambda=\sup|X||\nabla\tau|\) and \(\mathfrak d\) is a weighted norm of the trace-free part of \(L_Xg\). The statement is intrinsic and covers quotient necks, which E59 does not.

## How the results fit together

- A region that is uniformly \(\varepsilon\)-close to flat in one chart pays a total Bach norm of at least a multiple of \(E/\varepsilon\) to carry Weyl energy \(E\), apart from end effects that do not grow with the length. Cones attain this. A long, nearly flat neck is therefore not a cheap reservoir of energy: its energy and its Bach cost are both proportional to its length, in the ratio \(\varepsilon\).
- A neck that is nearly conical in the sense of a nearly conformal Killing field carries at most \(8\Lambda\mathfrak B\) plus a term proportional to the defect, whatever its cross-section. Exact Bach-flat cones carry none.
- At the linear level nothing is hidden in the middle of a neck. Unforced solutions have no exponent between \(-2\) and \(2\), and forced ones are controlled by the total forcing.
- For a sequence with \(\mathfrak B_i\to0\), the energy of a neck tends to zero under either of two hypotheses: a chart with \(\varepsilon_i\to0\) and \(K_i\) bounded, or a field with \(\Lambda\) bounded and \(\mathfrak d_i\to0\). In a divergence-free trace-free chart with \(\varepsilon_i\) merely small, what can remain is at most \(C\varepsilon_i^2\), an end effect.

## Evidence boundary

- Neither the chart nor the vector field is derived from the fixed-margin hypotheses. With the Bach tensor controlled only in \(L^1\) there is no pointwise regularity theory to supply them. This is the open step. E60 names the two terms that stop the linear argument: the quasilinear top-order part of \(B_g-B'(v)\), which needs \(D^2v\) in the Lorentz space \(L^{2,1}\), and the failure of the flat divergence-free condition for \(B_g\).
- The statement in E59 that the \(\ell^1\) sum of dyadic curvature norms would produce the chart is a statement of dependence. It is not proved.
- The decay of unforced solutions away from the ends of an annulus needs completeness of the homogeneous solutions modulo the kernel of \(W'\). That is not proved. The table of kernel dimensions covers a finite range and is evidence only.
- The comparison inequality is proved for a smooth second metric. E57's limit is a \(W^{2,q}\) metric.
- Whether the flux identity or the statement on cones is in the literature was not checked. The product case is elementary. No novelty is claimed.
- External sources were read at the level of abstracts and stated theorems, through text extraction. None is used in a proof. The deduction of an \(L^{2,1}\) estimate from the theorem of Hernandez–Spector is a lead and was not checked against the paper.
- The numerical work checks identities and constants: 37 assertions for the linear model, mostly in exact rational arithmetic, pointwise checks of the first variation and of the conservation law by truncated Taylor arithmetic, and the flux identity by quadrature with residuals down to \(10^{-9}\) or better. It is not evidence for any inequality.
- One check was added at assessment and is not cited in the E59 note: on the nonlinear cones \(\delta+c\,s_H\) with \(c=0.05\) and \(0.30\), the energy identity of the proof of Theorem 1, taken per unit of \(\log|x|\), holds to \(10^{-16}\) and \(4\times10^{-7}\) at the highest quadrature order. The Bach pairing is \(1.0007\) and \(1.053\) times twice the energy, and the energy is \(0.71\) and \(0.73\) times \(\sup|v|\) times the Bach density. The energy density computed this way, from the flux of the Bach tensor in E61, and at leading order from E60 are \(0.1524251997\), \(0.1524251997\) and \(0.15243056\) for \(c=0.05\). [Record](../numerics/E59_CONE_IDENTITY_CHECK.txt)
- The same model wrote the decisions, the requests and the returns in one session.

## A correction made during the session

An intermediate working statement, that the logarithm \(H\log|x|\) disappears in divergence-free trace-free gauge, was wrong. In that gauge the cone \(\delta-c\,s_H\) appears with \(\tfrac59cH\log|x|\); the logarithm disappears only in the cone's own chart. E60 states the corrected form with an exact check, and the mean value \(\oint b_H\nu\otimes\nu=\tfrac59\cdot2\pi^2H\) reproduces the coefficient from the integral identity. Two consequences: the divergence-free trace-free gauge is a poor gauge on long conical necks, and the linear amplitude bound is attained there up to a factor about four. The scalar model in the B34 note was also corrected before the request was frozen: the Hessian energy of \(c\log|x|\) is \(8\pi^2c^2\) per unit of \(\log|x|\).

## Calibration against Einstein metrics on the four-sphere

This remark uses an external theorem at the level of its quoted statement ([source record](../../../../../references/SOURCE_NOTES_SEC_ANNULAR_20261124.md), R115–R118, and R96).

Let \(g\) be a positive Einstein metric on \(S^4\) that is not round. It is Bach-flat, it is a Yamabe minimizer of its class by Obata's theorem, and the Gauss–Bonnet identity (1) of the preceding assessment with \(\operatorname{Ric}_0=0\) gives \(E_+=8\pi^2-Y^2/48\). Gursky's gap theorem, as quoted by Akutagawa–Endo–Seshadri, says \(Y<Y_{\rm rd}/\sqrt3\) for such a metric. With \(Y_{\rm rd}^2=384\pi^2\),
\[
 \tfrac{16}3\pi^2<E_+<8\pi^2 .
\]
So a non-round positive Einstein metric on \(S^4\), if one exists, is a closed positive-Yamabe Bach-flat class strictly inside the band for small \(\delta\). By E53 it would produce regular marked sequences with vanishing Bach ratio. Consequently a proof that the ratio \(\mathfrak B/E_+\) has a positive infimum on the band for every \(\delta\) would contain the statement that the round metric is the only positive Einstein metric on \(S^4\). Gursky and Malchiodi (2025) call uniqueness of the Einstein metric on \(S^4\) a long open question.

This does not affect any result of the branch. It locates the difficulty of the unconditional lower bound, and it shows that Einstein classes can enter the set of closed critical energies of E58 only above \(\tfrac{16}3\pi^2\). No obstruction of this kind is known for energies between \(4\pi^2\) and \(\tfrac{16}3\pi^2\), where the open question concerns Bach-flat classes that contain no Einstein metric.

## Proposed manuscript changes

None was made. If the author wants E59–E61 in the manuscript, the natural form is one new section after the fixed-margin results, with three subsections:

1. the annular theorem and its divergence-free trace-free corollary, with the interpolation lemma, the comparison inequality as a proposition, and the cone and plane-wave examples;
2. the linear model: the logarithmic field and its three representatives, the theorem on homogeneous solutions, the integral identity with the two inequalities, and the corollary on the round sphere;
3. the conservation law: the divergence term, the flux identity, conformal Killing fields with cones and products, and the neck estimate.

The closing section, which states the long-annulus problem, would then be replaced by a statement of the open step above and of the Einstein calibration. The bibliography would gain the entries added to the shared file for R109–R118. The numerical records would be cited as checks.

## Next decision

SEC-B36 is ready. It has to choose how to obtain, from an \(L^1\) bound on the Bach tensor, the control that E59 or E61 needs. The [handoff](../continuation-notes/05_AFTER_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md) lists the candidates and proposes a first bounded test for SEC-E62.

## Working-note versions

Repository baseline `fa6ea89938d32c4dd96cfac90846b1201e244b25`. The files below are new in this session and are not in that commit. SHA-256 on 24 November 2026:

| File | SHA-256 |
| --- | --- |
| [B34](../brainstorm/notes/SEC_B34_ANNULAR_ENERGY_TEST_20261124.md) | `b487b1dfeea2d6ed7035b277664955850e340e15ff4cef4b5cd9110ddb7761be` |
| [B35](../brainstorm/notes/SEC_B35_INVARIANCES_ON_THE_NECK_20261124.md) | `6d411de7981e967ebe7fb00d38f58e610d8f3de4e0ebe53799df827cef2917fa` |
| [E59](../notes/SEC_E59_20261124.md) | `759a56659800006c7b4536daab7c0f4fa7a94e6d9ec586683ae7ecf3475410e4` |
| [E60](../notes/SEC_E60_20261124.md) | `2a8fc5d4f15f63a1d9f354302f4c679dd472dfc554035d8c7f18e258755da545` |
| [E61](../notes/SEC_E61_20261124.md) | `c9ee1bc1a58cb1086c0dbbe37269699b3a5a649921c05614e1d53cb95a037197` |
| [E59 request](../research-progress/handoffs/SP4-FOT-SEC-E59_REQUEST_v1.md) | `920ea73e76ce4e768c3680d3432ca3fd7b5296f596462f36f0de48f2f5348c7c` |
| [E59 return](../research-progress/handoffs/SP4-FOT-SEC-E59_RETURN_v1.md) | `cc2a9cc6c3d0ac92a9f2370e08b56567740c24b14a163d62e09075a423e2e4b9` |
| [E60 request](../research-progress/handoffs/SP4-FOT-SEC-E60_REQUEST_v1.md) | `e7d27488d5ec5d6c9cd28ca0a90bca581981ec4df0f39109a729e9b1cfff1471` |
| [E60 return](../research-progress/handoffs/SP4-FOT-SEC-E60_RETURN_v1.md) | `9e2a3b3f09fbd10d992a0811778575222f56cb22921af6143c59d8de82d4826c` |
| [E61 request](../research-progress/handoffs/SP4-FOT-SEC-E61_REQUEST_v1.md) | `df320eb55182133e9e7c5ddf24b067746f5ada83dc21e391017d806bab91b99b` |
| [E61 return](../research-progress/handoffs/SP4-FOT-SEC-E61_RETURN_v1.md) | `7afe028d514ec89f73c5637f99f2b75d9ca6001b34e8affb0a12514c6ce84285` |
