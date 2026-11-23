# External review: "Chiral curvature and metric evolution near the round four-sphere"

| | |
| --- | --- |
| Date | 23 November 2026, America/New_York |
| Prepared for | Edward B. Baker III, author of the manuscript, at his request |
| Prepared by | Claude (Anthropic), model Claude Fable 5.2 (`claude-fable-5-2`), reasoning effort reported in-session as the maximum setting, in one Cowork session without subagents. No human has edited or checked this text. |
| Manuscript | [manuscript/chiral_curvature_and_metric_evolution.tex](../manuscript/chiral_curvature_and_metric_evolution.tex) |
| Reviewed version | commit `df5b7b1a38cce286f5fbc20cedcacdcb929528a1` (2026-11-23 02:28:59 -0500), file SHA-256 `9f0352529530329f7776aef985d58cda6aa283996fe23bf2ef3301254b3ffd13`, 14,003 lines, 159 pages in my `pdflatex` build. This was the repository head when the review was filed. |
| Evidence | [EXTERNAL_MANUSCRIPT_REVIEW_20261123_checks/](EXTERNAL_MANUSCRIPT_REVIEW_20261123_checks/README.md): thirteen scripts, 183 checks passed and none failed ([log](EXTERNAL_MANUSCRIPT_REVIEW_20261123_checks/output.txt)) |
| Independence | Limited; stated precisely in Section 1 |
| Repository files changed | None. This file and its checks folder were added. The manuscript, `REGISTER.md`, `DRAFT_HISTORY.md` and the README indexes were not edited. |

Theorem and equation numbers are those of my build of the reviewed version. LaTeX labels are given where a number is likely to move.

## 1. Scope, independence and depth

**Versions.** The manuscript changed three times while the review was in progress.

| Commit | Commit time (-0500) | SHA-256 of the `.tex` file | Lines | Pages | Role |
| --- | --- | --- | --- | --- | --- |
| `ea004a9` | 2026-11-21 23:53 | `2a56f665b74a476535cf0913b8a57d1fd2e9dfc937e59f10a05582f7784c5558` | 2,910 | 39 | read completely; every result re-derived |
| `2c73984` | 2026-11-23 01:05 | `e36066e1d6a28166445738a2a87c5722aee3d3a535b8726ec5dd84f51bcd7ffd` | 13,119 | 150 | compared section by section with the previous one; about 10,400 new lines read |
| `04ef8d7` | 2026-11-23 01:52 | `c323258c99562d4594810b527a4787628164bd67a26eb990bfac061518747573` | 13,688 | 155 | diff (+600/-31 lines) read in full; new statements tested |
| `df5b7b1` | 2026-11-23 02:29 | `9f0352529530329f7776aef985d58cda6aa283996fe23bf2ef3301254b3ffd13` | 14,003 | 159 | reviewed version; diff (+325/-10 lines) read in full; both new propositions tested |

Sections 3, 4.1-4.4, 5 and 7-11 are the same in all four versions apart from single-line edits. The second pull changed Section 6.3, the three corollaries that use it, the abstract and introduction, the proof of Proposition 12.4 and one sentence of Section 12.3; it renumbered Section 6, so that former 6.5-6.6 are now 6.6-6.7, former 6.7-6.32 are now 6.11-6.36, and former 6.33-6.50 are now 6.38-6.55. The third pull added Propositions 12.5 and 12.6, moved former 12.5-12.8 to 12.7-12.10, and made small edits to the abstract, Section 6.3 and Corollary 6.37.

**What was read.** The manuscript, and for conventions `AGENTS.md`, the two reviews READMEs, the paper README, `PLAN.md`, `REGISTER.md`, `OVERVIEW.md` and `DRAFT_HISTORY.md`. Of the 239 files in this folder I read only the README and the two files of 21 November, for format; I read none of the E-series audits and assessments. I opened parts of four research notes (02, 218, 220 and 227), the last three only after finishing my own computation on the same point. I did not read or run any script in `numerics/`.

**Independence.** The review is independent in one concrete sense: every check was written from the definitions printed in the manuscript, in an implementation of my own (a fully nonlinear model with automatic differentiation), without reading the scripts or audits of the drafting pipeline. It is not independent in other senses. The manuscript is my only source for the definitions, a single AI system produced the whole review in one session, and no specialist took part. The reviewer model comes from a different vendor than the drafting assistant, but as the repository conventions say, that fact alone establishes nothing. What can be relied on is the evidence in the checks folder, which anyone can rerun.

The session was long enough for its working context to be condensed once. Numbers quoted from the manuscript and from the logs were re-read after that point; hand derivations made earlier are reported from the session's notes.

**Depth.** I use three levels.

| Level | Meaning | Where |
| --- | --- | --- |
| A | re-derived by hand, or confirmed through the independent implementation, or both | Sections 3-5; the exact identities and finite-dimensional statements of Sections 6.1-6.3; Proposition 6.26; Sections 7-11; Propositions 12.1, 12.2, 12.4, 12.5 and the examples of Section 12.2; Section 14.2 |
| B | proof read for logic with spot checks; no independent derivation | Section 2; the integration arguments of Theorem 6.6 and Propositions 6.7-6.9; Corollary 6.37 and the occupation-time inequality of Corollary 6.36, given their inputs; Proposition 6.20; Lemma 6.22; the static construction of Proposition 12.6; Theorem 14.1 and Corollary 14.3; Lemma 15.1 and Theorem 15.2 |
| C | read for statement, hypotheses and architecture only | Sections 6.4-6.21 apart from the items above; Sections 12.3-12.9, 13 and 14.3; Corollary 15.3 and Theorem 15.4 |

Level C covers roughly 80 of the 159 pages.

## 2. Summary assessment

The manuscript studies Fine's gradient flow of definite \(SO(3)\) connections on four-manifolds through the Riemannian metric reconstructed from the curvature, with the smooth four-dimensional Poincaré conjecture as motivation. Its first layer, essentially the 39-page version, is an explicit calculation at the round sphere: the reconstruction map \(\widehat h=(L+4K)h/(2K)\), the linearised flow \(a_t=\mathcal H[-4(L+2K)h]\) on transverse-traceless data, the defect equation \(q_t=-4(L_E+6K)q\), a chiral Bianchi lemma, and the fourth-order Hessian \((L+2K)(L+4K)\) of the pulled-back metric energy with its cubic discrepancy. The second layer consists of exact nonlinear statements: the full evolution equation for \(Q\), pointwise conservation of the curvature volume form, the strain \(T\) and its control of the Levi-Civita mismatch and chiral curvature, a stationary spectral theorem whose range is now sharp at eigenvalue ratio \(7/2\), and explicit local and global examples showing that spectral caps are not preserved. The third layer, about 60 per cent of the text, is an analytic and global programme: rough-data local theory, continuation criteria, compactness on homotopy four-spheres, round stability, entry and recognition theorems, critical-space budgets with counterexamples, and a twistor compactness result.

In the part I could test I found no mathematical error. All 183 checks agree with the manuscript, most of them at relative error between \(10^{-13}\) and \(10^{-16}\), including the complete nonlinear \(Q\) equation at a finite distance from the round connection, the Bianchi lemma at a non-round metric, the Hessian factorisation computed from first principles, the sharp-ratio lemma on a 3,721-point grid, and the explicit local connections of Section 12.2 and Propositions 12.4-12.5 run through the actual flow vector field. The one error I had found in the 39-page version, the conversion to Fine's normalisation, was already corrected in the 150-page version to \(g^{\rm F}_A=2K\widehat g_A\) and \(t_{\rm F}=2Kt\), which agrees with my derivation from Fine's Killing-form convention.

I cannot vouch for the third layer. It is coherent, its hypotheses are stated with unusual care, its claims are consistently hedged, and the steps I traced (Proposition 6.20, Lemma 6.22, Lemma 15.1, Theorem 15.2, the static part of Proposition 12.6, the Myers-type diameter bound in Corollary 6.32, the equivalence (6.46)) hold up. But it is about ninety pages of hard analysis, written within two days with AI assistance and audited by the same pipeline, and it leans on deep external theorems (Koch-Lamm, Anderson, Bando-Kasue-Nakajima, Wright, Chang-Gursky-Yang, Hamilton's Nash-Moser theory, Fine's twistor results). Until specialists have checked it, it should be treated as unverified. Section 7 lists the steps on which it rests.

On significance, the manuscript is candid that its recognition theorems are conditional on definite connections that nobody knows how to produce on an arbitrary homotopy four-sphere. Two things should be added. First, that existence question has a name in the literature: Fine's Conjecture 1.7, restated as Conjecture 4.8 of Fine-Krasnov-Panov, says that a compact four-manifold with a positive definite connection is \(S^4\) or \(\overline{\mathbb{CP}}^2\). Every homotopy-sphere theorem in the manuscript is a conditional case of that conjecture, and the conjecture is not cited. Second, the conclusions select their own hypotheses: each recognition theorem ends with "\(M\) is diffeomorphic to standard \(S^4\)", so data satisfying its hypotheses exist only on the standard sphere. These are gap and stability theorems for the Fine-Panov conjecture. They are not steps toward constructing data.

My main recommendations are these. Correct the sentence in the introduction that excludes computation from all proofs (C1). Cite the Fine-Panov conjecture and state the programme's position relative to it (C6, Section 8). State the effective static recognition criterion that the manuscript already proves but does not draw (N4). Consider the observations on the stationary form, which suggest that the constants in Propositions 6.7-6.9 can be improved by many orders of magnitude and that no absorption is needed below ratio 3 (N3). Bring Proposition 12.6 into the abstract and introduction, since it answers a question the text elsewhere still describes as open (N5). Split the manuscript, with the linear theory as a first paper that can be checked completely (Section 9).

## 3. Verified steps (Level A)

"Confirmed" means agreement between the manuscript's formula and the independent implementation; "by hand" means I re-derived the statement. Scripts are in the checks folder.

| Location | Statement | How tested | Outcome |
| --- | --- | --- | --- |
| Section 3 | eta-symbol and \(\Sigma^\pm\) algebra (3.2)-(3.10); explicit round connection (3.13) with \(F=-K\Sigma^+\); patching, Proposition 3.2 and (3.15); \(\mu=2K^2dV\), \(Q=I\) (3.20) | exact evaluation, `check_01`, `check_02` | confirmed |
| Lemmas 4.1, 4.2 | graph map \(\beta\), norms (4.6)-(4.7), closed tanh form, cubic expansion (4.8) | `check_01`; truncation error falls by 32 per halving, as an \(O(H^5)\) remainder should | confirmed |
| Proposition 4.3 | velocity decomposition (4.13)-(4.18) of metric, \(Q\) and \(\mu\) | nonlinear, at a finite perturbation, `check_04` | confirmed |
| Proposition 4.4 | compatibility operator with \(\mathscr C^2+\mathscr C-2=0\), spectrum \(1\) (eight times) and \(-2\) (four times); recovery of the mismatch \(b\) | `check_01`; the recovered \(b\) reproduces the Levi-Civita curvature in `check_10` and the \(Q\) equation in `check_08` | confirmed |
| Proposition 4.5 | strain (4.24), fibre moments (4.25), bounds (4.26) | all constants by hand; \(\nabla Q=2STS-\tfrac23\operatorname{tr}(QT)Q\) and both inequalities in `check_08` | confirmed |
| Proposition 4.6 | curvature controlled by strain, (4.27)-(4.29) | constants \(6\), \(36+8\sqrt3\), \(42+8\sqrt3\) by hand; (4.29) against the Riemann tensor of \(\widehat g\) at a finite perturbation, `check_10` | confirmed |
| Section 5 | Lemma 5.1 with (5.2)-(5.4); Proposition 5.2 with (5.5), (5.6), (5.9), (5.11); Proposition 5.3 with (5.17) | `check_01`-`check_04`, `check_06`, for TT tensors, arbitrary metric variations, conformal and Lie-derivative variations | confirmed |
| Proposition 6.1 | gradient (6.2) and pointwise first variation (6.5) | gradient computed from first principles as the \(L^2(\widehat g)\) gradient at a finite perturbation, `check_05`; Fine's normalisation by hand | confirmed |
| Proposition 6.2 | velocity, \(\sum_i v_i\wedge F_i=0\), pointwise \(\partial_t\mu_A=0\) (6.8), full nonlinear equation (6.7) | at eigenvalues \((0.89,1.01,1.09)\) of \(Q\), all terms, `check_08` | confirmed, \(4\times10^{-15}\) |
| (6.10), (6.11) | divergence form and energy identity | pointwise identity with the tensorial \(\Xi\), `check_08` | confirmed, \(6\times10^{-14}\) |
| Proposition 6.3 | pinched decay with constant \(36K\) | by hand | agrees |
| Lemma 6.4 | rank 8, kernel 12, coercivity (6.14) on the zero-speed space for ratio at most \(9/4\) | 351-point grid; my directly computed form equals the manuscript's kernel parametrisation (6.15) and block identity (6.16) to \(10^{-15}\), `check_09` | consistent; exact certificate not re-run |
| Lemma 6.5 | sharp ratio \(7/2\): positivity off the corner, inertia \((8,4,0)\) at \((1,\sqrt{7/2})\), the stated radical, the sharpness identity \(k^TGk=v^2(7-2v^2)\) also beyond \(7/2\) | 3,721-point grid, `check_11`. A bisection of my own had located the threshold at 3.5000 before this lemma entered the manuscript ([earlier log](EXTERNAL_MANUSCRIPT_REVIEW_20261123_checks/output_pre_04ef8d7_20261123T0639Z.txt)) | consistent; exact certificate not re-run |
| Proposition 6.8 | ingredients of (6.23): the bound \(L_0=120\), the right-inverse bound, \(c^2\ge3/8\), \(\det Q\ge27/512\), \(\kappa(1)=4\); arithmetic of the constants | grid in `check_11`; arithmetic by hand | agrees |
| Proposition 6.9 | \(k_*\) in (6.24), \(H_*\) in (6.26); the inequalities taken from the certificate | exact rational arithmetic; \(\det M\ge1-a^{37}(1-b)^{23}\), \(L\le27648\), \(\lambda_{\max}(G)\le880\), \(\lvert X\rvert^2\le11\lvert Z\rvert^2\) on the grid, `check_11` | agrees |
| Proposition 6.10 | pairings (6.29), endpoint identities, bounds (6.27)-(6.28), local realisation | `check_11` to \(10^{-14}\); the realising connection run through the flow in `check_12` | confirmed |
| Proposition 6.26 | \(\lvert\mathcal C\rvert^2=3s_2-9s_3\), constants \(36\sqrt6\) and \(72\), exclusion of the rank-one alternative, \(\varepsilon_0\) | by hand; \(p_*\approx0.597\) computed numerically | agrees |
| Proposition 7.1 | \(q_t=-4(L_E+6K)q\) (7.5) and vanishing volume velocity | arbitrary connection variation, `check_03` | confirmed |
| Lemma 8.1 | chiral Bianchi identity (8.3) | fully nonlinear, at a metric far from round, `check_04` | confirmed |
| Propositions 8.2, 8.3 | (8.10), (8.15), \(\mathcal H^*\mathcal H=\tfrac14(L+4K)\) (8.16) | generic local TT tensors and arbitrary \(h\), `check_02`, `check_03` | confirmed |
| Section 9 | exact energy (9.4), discrepancy (9.5), second-order \(Q\) (9.8) | `check_01`, `check_04`; (9.9) and (9.11) read as expansions of these, not tested separately | confirmed |
| Theorem 10.1, Lemma 10.2 | \(\operatorname{Hess}\mathcal P_{\rm met}=(L+2K)(L+4K)\); \(L\ge8K\) on TT tensors, sharp | Hessian from first principles on \(k=2\) harmonics, equal to \(120K^2h\); Schur averages \(7.5K^2\) and \(3K\) over the 35-dimensional mode space, `check_05`; an independent derivation by hand through Gauss-Bonnet | confirmed |
| Proposition 11.1 | non-preservation of the conformal class, (11.3)-(11.5) | end to end; \(\varepsilon^2\) coefficient \(\operatorname{diag}(0,\tfrac13,-\tfrac16,-\tfrac16)/K\), `check_05` | confirmed |
| Propositions 12.1, 12.2 | eigenvalue bound; boundary example with density \(4K^2z^4/(3-2z^2)\) | `check_01` at \(z=0.3,0.9,0.999\) | confirmed |
| Section 12.2, Proposition 12.4 | the three local examples and the spectral-ratio maximum at \(9/4\): jets, Hessians, time derivatives | each polynomial connection run through the actual flow, `check_12`; rational identities in exact arithmetic | confirmed, \(10^{-14}\) |
| Proposition 12.5 | for every \(r>1\) a strict local maximum \(r\) of the ratio whose native time derivative of \(\log\rho\) is exactly \(1/2\) | end to end at \(r=1.05,\,2.25,\,3.5,\,6\): algebraic identities, jets, Hessian \(-\lvert G\rvert^2I\), \(Q_t=4\mathscr L_QB-24dq\), rate, `check_13` | confirmed, \(10^{-13}\) |
| (14.3), (14.4) | scalar divergence identity and strain-Yamabe bound | by hand | agrees |

For Proposition 12.4 the computed rate of \(\log\rho\) is \(3.3378\) in the old clock, that is \(1.6689\) in the native one, against the stated lower bound \(12119/14364\approx0.8437\).

## 4. Proposed corrections

**C1. Introduction, last paragraph before Section 1.1.** The sentence "No numerical computation is needed for any proposition" is no longer true of the manuscript. Lemma 6.4 rests on 1,740 Bernstein coefficients and Lemma 6.5 on 1,511, generated and verified by scripts in `numerics/`, and Proposition 6.9 on a further coefficient comparison; Theorem 6.6, Propositions 6.7-6.9 and Corollaries 6.35-6.37 inherit this. The certificates are exact, over \(\mathbb Q\) and \(\mathbb Q(\sqrt{14})\), so a correct statement is available: three statements rest on exact computer-algebra certificates reproduced by the named scripts, and no floating-point computation enters any proof. In the same paragraph "self-contained at the level of the differential-geometric calculations" is fair for Sections 3-5 and 7-11 but should not be read as covering Sections 6 and 13-15, which depend on the external theorems listed in Section 7 below.

**C2. Two different bases carry the name \(\Sigma_i^\pm\).** Section 3 defines \(\Sigma_i^\pm=\tfrac12\eta^\pm_{i,ab}e^a\wedge e^b\) in (3.3). Section 4 defines \(\Sigma_i^\pm\) afresh in (4.2). In terms of the first, the second self-dual triple is \((\Sigma_3,-\Sigma_2,\Sigma_1)\), a rotation, while the second anti-self-dual triple is \((\Sigma_3,-\Sigma_2,-\Sigma_1)\), which reverses orientation. The formulas of each section are correct in that section's basis (I tested Lemma 5.1 in both), so no result is affected, but the quaternion relations of the anti-self-dual triple differ in sign between the two sections and a reader who carries one into the other will get wrong signs. Either use one basis or rename the second and add a sentence.

**C3. Section 4, between (4.10) and (4.11): "Its curvature map reverses the internal orientation."** This is an artefact of the convention \(A_i=-\tfrac12\eta_{i,ab}\omega_{ab}\), which gives \(F_{0i}=-K\Sigma_{0i}^+\). In Fine's terminology the round connection is positive definite. A reader comparing with Fine's Definition 1.6 could take the sentence to mean the negative definite component. One clause relating the "round-compatible sign" to Fine's "positive definite" would remove the doubt.

**C4. Proposition 6.10, range and optimality.** The statement is correct, but the lower bound (6.27) is negative for \(3<s<3.42\), so on most of the stated range it says nothing, and the choice of 3 as left endpoint is unexplained. The numerics in N3 below give the reason: on the axial family the full form is nonnegative on all derivative arrays exactly up to \(s=3\), and the smallest admissible coefficient is, to about twelve digits, \((s-3)(s+1)/(8(7-2s))\). If the author can certify this it would replace (6.27), identify "the optimal full-space coefficient" that the proof says is not identified, and improve the limiting constant from \(99/4736\approx0.021\) to \(9/64\approx0.141\). If not, a sentence explaining the endpoint 3 would still help.

**C5. Theorem 6.33, "Both thresholds are non-effective."** True of the dynamical conclusions. The topological conclusion has an effective threshold already contained in the manuscript; see N4.

**C6. References and context that are missing.** In decreasing order of importance: Fine's Conjecture 1.7 and Fine-Krasnov-Panov's Conjectures 4.8 and 4.10 (Section 8); Fine-Panov's curvature inequality, Theorem 4.9 in Fine-Krasnov-Panov, of which the definiteness criterion (5.3) is the pointwise content; Verbitsky's theorem on taming forms on twistor spaces of anti-self-dual manifolds, quoted as Theorem 4.13 there, for Section 15; Plebański and Capovilla-Dell-Jacobson, whom Fine credits for the perfect-connection theorem, and Urbantke for the formula reconstructing a metric from a curvature triple; Kobayashi and Itoh for the second variation of the Weyl functional at Einstein metrics, in addition to Gursky-Viaclovsky; Hamilton's 1986 theorem on positive curvature operator (R4); and the Schouten flow (R2).

**C7. Title and abstract.** "Near the round four-sphere" describes the first layer only. Sections 6.9-6.13 concern arbitrary closed bases and homotopy spheres, and Section 15 does not involve the flow at all. Propositions 12.5 and 12.6 are not mentioned in the abstract or the introduction; see N5.

**C8. Two normalisations run through Section 6.** The older \(K\)-normalisation and the native one alternate, sometimes within a subsection: Section 6.16 is constructed in native time and its main result, Theorem 6.41, is stated in the older clock and metric. Each statement says which it uses, and I found no conversion error, but the burden on the reader is high. One normalisation in the statements, with a single conversion table, would be safer.

**C9. Statement hygiene.** Twenty-one of the 101 theorem-like statements have no title, among them Theorem 13.2 and Proposition 12.10, and several have no label. Proposition 2.1 is phrased informally ("a complexified correspondence-space chart") and reads as a remark.

## 5. Remarks on the linear core (Sections 3-5 and 7-11)

**R1. The TT description appears to be complete.** At the round connection, Lie derivatives and conformal variations are invisible to the flow: \(\mathcal R'(\mathcal L_Xg_0)=\mathcal L_Xg_0\) with \(q=0\) and \(a_t=0\), and for conformal variations \(\mathcal H(2fg_0)=-K^{-1}\iota_{\nabla f}F_0\), a pure diffeomorphism direction with no gauge term (`check_06`). With Fine's infinitesimal rigidity and a count of \(SO(5)\)-types, which I did by hand and did not script, this indicates \(\Omega^1(E)=\mathcal H(\mathrm{TT})\oplus\{\text{gauge and diffeomorphism directions}\}\). If the author confirms the count, Propositions 7.1 and 8.2 are two descriptions of one complete linearised flow, related by the intertwining \(\mathcal D(L+2K)=(L_E+6K)\mathcal D\), and the manuscript can say so.

**R2. The linearised flow is the shadow of the Schouten flow, of which Ricci flow is the TT restriction.** For arbitrary \(h\), with \(P=\tfrac12(\operatorname{Ric}-\tfrac s6g)\) the Schouten tensor, the manuscript's formulas are equivalent to

\[
 \widehat h=\tfrac2K P'(h),\qquad
 d^*_{A_g}(W^+\Sigma^+)=-2\mathcal H_g(P_g),\qquad
 a_t=\mathcal H\bigl[-16\,(P-\tfrac K2g)'\bigr]=-8K\,\mathcal H(\widehat h-h).
\]

The first is (5.5), the second is Lemma 8.1 read as the Weyl-Cotton identity, and the third is (8.15); the first and third are confirmed for arbitrary \(h\) in `check_07`, and the second is a rewriting of the identity confirmed in `check_04`. So modulo gauge the flow linearises to \(\partial_\tau g=-2\operatorname{Ric}+\tfrac s3g+2Kg\) with \(\tau=4t\), the normalised Schouten flow, which is the critical Ricci-Bourguignon flow in dimension four. It coincides with normalised Ricci flow exactly on TT tensors, where \(s'=0\), which is the manuscript's statement. The Schouten form explains more: its symbol degenerates on conformal directions, and those are the diffeomorphism directions of R1; and the driving term \(\widehat h-h\) shows the flow relaxing a metric towards its own reconstruction. Catino and Mantegazza proved short-time existence for the Schouten flow in September 2026 through a coupled parabolic-hyperbolic system. That is the nonlinear metric flow to compare with, and its structure invites comparison with the coupled connection-curvature system of Section 6.9.

**R3. Velocity and mismatch.** For an arbitrary variation \(a\) of the round connection, \(a_t=8K\,b'(a)\), where \(b=A-\Gamma_A^+\) is the Levi-Civita mismatch of Proposition 4.4 (`check_07`). Decay occurs because the reconstructed metric overshoots: \(\widehat h\ge6h\) on TT tensors.

**R4. The conformally flat case and Hamilton's theorem.** When \(W=0\) the curvature operator has blocks \(\tfrac s{12}I\) on the diagonal and the trace-free Ricci block off it, so the definiteness criterion (5.3) with positive sign is the same as positivity of the curvature operator. In that class Hamilton's 1986 theorem already gives \(S^4\) or \(\mathbb{RP}^4\) by Ricci flow. The example of Proposition 12.2 sits on the boundary of that class. This locates the region where the connection flow could say something new: definite connections whose reconstructed metric does not have positive curvature operator.

**R5. Other backgrounds.** The derivations of Sections 7-8 use only \(W^+=0\), \(\operatorname{Ric}=3Kg\) and Lemma 8.1, so I expect (1.3) to hold on every anti-self-dual Einstein background with \(s=12K\), with \(L+2K\) replaced by \(\Delta_L-6K\). I did not test this beyond the round sphere. On \(\overline{\mathbb{CP}}^2\) it would make a useful contrast: the Fubini-Study metric is dynamically unstable under Ricci flow (Kröncke; Knopf-Šešum) while Fine's flow is locally stable at any perfect connection, so the correspondence with Ricci flow cannot extend beyond the TT linearisation.

## 6. Remarks on the exact nonlinear results

**N1. The \(Q\) equation and the volume form.** Proposition 6.2 is the most useful exact result in the manuscript, and it passed the strongest test I could give it: every term, at a finite distance from the round connection, to \(4\times10^{-15}\). The total mass of \(\mu_A\) is topological, \((4\pi^2/3)\,p_1(E)[M]\) in the older internal norm, which is why the volume hypothesis of Theorem 6.23 costs nothing in its applications; Proposition 6.2 strengthens this to pointwise conservation along the flow, with a trace-free metric velocity.

**N2. The spectral results at ratio \(7/2\).** My grid evaluation agrees with Lemma 6.5 in every particular, including the four-dimensional radical at the axial endpoint and four negative directions just beyond it, and my own bisection had located the threshold at 3.5000 before the lemma was in the manuscript. The logic of Theorem 6.6 from (6.11) and Lemma 6.5 is sound, including at the semidefinite endpoint, where the reaction term alone forces \(Q=I\). The arithmetic of Propositions 6.7-6.9 and the pairings of Proposition 6.10 are right. What I have not done is rerun the exact certificates.

**N3. Observations on the stationary form.** The following are floating-point observations on grids (`check_09`, `check_11`). They are not statements of the manuscript and they are not proofs; each would need a certificate of the kind the manuscript already uses.

First, the strict-region constant appears to be known exactly on most of its range. For every tested \(r\) between \(9/4\) and \(3.49\), the minimum over an 861-point grid of the class with ratio at most \(r\) is

\[
 \kappa(r)=\frac{12\,r\,(7-2r)}{(r+2)(r+4)},
\]

attained at the axial corner \((1,\sqrt r)\) in the direction of the manuscript's array \(N\). So the upper bound (6.28) is an equality there, and the test array is extremal. Below \(r\approx2.19\) the edge of two equal large eigenvalues overtakes the axial corner and the minimiser sits there: at \(r=2\) the value is \(2.854\) against \(3\). In particular \(\kappa(9/4)=216/85\approx2.54\) against the certified \(32768/2205225\approx0.0149\), and near the endpoint \(\kappa(r)\approx\tfrac{112}{55}(\tfrac72-r)\) against the certified slope \(k_*\approx2.6\times10^{-22}\).

Second, below ratio 3 the zero-speed constraint is not needed. The form \(\mathfrak R_Q\) is positive on all 20-dimensional derivative arrays on the whole triangle with ratio below 3, and loses positivity exactly at ratio 3 on the axial edge (3,321-point grid; minimum \(-1.3\times10^{-15}\) at the corner \((1,\sqrt3)\)). On the class with ratio at most \(9/4\) its minimum is \(1.4069\). Inserted directly into the energy identity used in the proof of Proposition 6.7, this would give \(\mathscr D\ge\tfrac{48}5\mathscr E+2.81\,\mathscr G\) with no decomposition along the kernel and no absorption, in place of \(\gamma\approx7.9\times10^{-6}\) and \(\beta\approx1.2\times10^{-8}\). It would also prove Theorem 6.6 for ratio below 3 without analysing the constraint at all, and it shows what the constraint contributes: the interval from 3 to \(7/2\).

Third, the optimal absorption constant on the axial family \(\operatorname{diag}(1,1,s)\) is, to about twelve digits on \(2.9\le s<7/2\),

\[
 C_{\rm opt}(s)=\frac{(s-3)(s+1)}{8\,(7-2s)},
\]

and on the part of the triangle with ratio between 3 and \(3.49\) the axial edge is the worst shape at a given ratio. This is the content of C4.

Fourth, the remaining constants are far from the values the same quantities take. On the closed triangle the largest eigenvalue of \(\mathfrak R_Q\) in absolute value is \(10.7\) where \(L_0=120\) is used; the least-norm speed preimage satisfies \(\lvert X_\perp\rvert^2\le0.4\lvert W\rvert^2\) where 3 is used; \(\lambda_{\max}(G)\le14.7\) where 880 is used. The resulting \(\gamma_*\approx2.2\times10^{-26}\) and \(\beta_*\approx1.2\times10^{-48}\) of (6.26) are correct, and the manuscript says they are not optimal. The manuscript's own argument run with the observed values would give coefficients of roughly \(0.6\,\epsilon\) and \(0.07\,\epsilon^2\) in (6.25), where \(\epsilon=\tfrac72-r\) is the margin, and a reader should be told that the gap is of that size.

Fifth, the ratio is not the natural variable. Positivity on the zero-speed space persists to ratio \(5.10\) along \(u=\sqrt v\) and to \(6.79\) when the two large eigenvalues coincide. The sharp hypothesis is membership of the spectrum in the region where the block \(G(u,v)\) is nonnegative, of which the ratio class is the largest inscribed ratio ball. The manuscript's remark on the axial classification points the same way.

**N4. An effective static recognition criterion.** Proposition 6.26 and Corollary 14.3 combine to a statement that the manuscript does not draw. On a homotopy four-sphere, in the native normalisation, suppose \(\sup_M\mathcal G\le\varepsilon_0\). Proposition 6.26 gives \(\lvert Q-I\rvert\le72\,\mathcal G\). Taking \(K=\tfrac12\) in Corollary 14.3, so that \(\widehat g\) is the native metric,

\[
 \mathfrak R_{1/2}=\tfrac12\lvert q\rvert+6\lvert\nabla^AT\rvert+(42+8\sqrt3)\lvert T\rvert^2
 \le(78+8\sqrt3)\,\mathcal G\le\frac{3}{4(2+\sqrt3)}\approx0.201<\tfrac12 ,
\]

so the corollary applies and \(M\) is diffeomorphic to \(S^4\). The threshold is explicit: the minimum defining \(\varepsilon_0\) is its third entry, \(\varepsilon_0=3/(4(2+\sqrt3)(78+8\sqrt3))\approx2.19\times10^{-3}\), since \(p_*\approx0.597\) makes the first entry about \(4.4\times10^{-3}\); in terms of the transport density, \(\sup_M\Psi\le6.9\times10^{-4}\) suffices. No flow, no compactness argument and no diameter bound is used. So in the small-strain regime the topological conclusion of Corollary 6.32 and Theorem 6.33 is static and effective, and only the dynamical conclusions are non-effective. This is worth a corollary of its own. It also sharpens the question of what the flow adds: its role must be to reach this regime from data outside it.

**N5. The local examples and the failure of cap preservation.** The examples of Section 12.2 and Propositions 12.4-12.5 are correct as computed, and they are the right kind of evidence that no scalar maximum principle is available. Proposition 12.6 turns the local germ into a closed example on the round sphere. I traced its static part by hand: the cutoff curvature formula (12.6), the expansion (12.7) with \(h=u+v/4\), and both cases \(h\ge\tfrac12\) and \(h\le\tfrac12\) are right. I also sampled the construction at \(\epsilon=0.05\) and \(0.025\) in a stereographic chart with the round connection in radial gauge (`check_13`): the ratio equals \(1+\epsilon\) at the centre and is smaller at all 38,192 sampled points of the ball, by the predicted margin \(\tfrac12\lvert G\rvert^2\ell^2\) near the centre; the distances to the round connection scale as stated (ratios 7.9, 2.0 and 2.0 on halving \(\epsilon\) for the \(C^0\) distance, the \(C^1\) distance and the curvature distance); and the time derivative of \(\log\rho\) at the centre of the glued datum is \(1/2\) in native time. The dynamical part, global existence and convergence, rests on Corollary 6.29 and is Level C.

Three suggestions follow. The proposition deserves a sentence in the abstract and the introduction, which do not mention it. The sentence after Proposition 12.4, that it supplies no closed-manifold datum or failure of global preservation, is true of that proposition but now needs a forward reference to Proposition 12.6. The corresponding question for \(\lvert Q-I\rvert^2\), raised by the first example of Section 12.2, is not settled by Proposition 12.6: in the germ of Proposition 12.5 one has \(\langle q,B\rangle=\tfrac{3(r-1)^2}{2(r+1)\sqrt r}+\tfrac{r-1}{16(r+1)}>0\), so the centre is a strict local minimum of \(\lvert Q-I\rvert^2\) (`check_13`). And the scope of the counterexample should be stated in terms of the strain: the glued datum is small in connection values and in energy (of order \(\epsilon^{10}\)), but \(Q\) changes by \(\epsilon\) across an annulus of width \(\epsilon^2\), so by scaling \(\sup\mathcal G\) is of order \(\epsilon^{-3}\). The family lies far outside the small-strain regime of N4, and it is nowhere near saturating Proposition 6.11, which bounds the pointwise rate of change of the spectrum by \(C_*\mathcal G\): here the rate is of order one while that bound is of order \(\epsilon^{-3}\). Read together, the examples and Proposition 6.11 say that spectral caps fail for data with large strain and hold over finite times to the extent that the strain budget \(J\) is controlled. The missing ingredient is an a priori bound on the strain, not on the spectrum, and the text around Proposition 12.6 could say so.

## 7. Unverified premises: the analytic and global programme

I noticed no inconsistency in what follows. The table records what I checked and, for each block, the steps on which the conclusions rest and which I recommend a specialist verify first.

| Block | Checked here | Load-bearing steps not checked |
| --- | --- | --- |
| Sections 6.4-6.7: temporal strain, Propositions 6.11-6.12 | the algebraic operator \(\mathcal A=\sum_iJ_i\otimes R_i\) with \(\mathcal A^2=\mathcal A+6\) and spectrum \(-2\) (twelve times), \(3\) (eight times), `check_10` | the constant \(C_*=4512\sqrt2\) of Proposition 6.11; the strain evolution (6.33)-(6.34) with all commutator terms; the constants of Proposition 6.12 as used in Corollary 14.4 |
| Sections 6.8-6.10: coupled system, Lemma 6.13, Theorem 6.14, Corollary 6.15 | symbol (6.42) and constraint (6.43) algebra, by hand | the Koch-Lamm scheme for a system coupled at first order on a closed manifold; propagation of \(F=F_A\) from a distributional identity for merely continuous data; the uniqueness class |
| Section 6.11: Proposition 6.16, Theorem 6.17, Corollaries 6.18-6.19 | the equivalence (6.46) with its constants, by hand from (4.25) and (4.26) | the return from the adjusted to the original flow at an endpoint with only continuous control; the claim that the two radii are independent of reference derivatives |
| Sections 6.12-6.13: Proposition 6.20, Lemma 6.22, Theorem 6.23, Corollaries 6.24-6.25 | logic of Proposition 6.20; the homology argument of Lemma 6.22; that the volume is topological and that Gauss-Bonnet with the signature formula bounds the \(L^2\) curvature | bubble extraction with only Ricci and \(W^+\) bounded: that each deepest bubble is a smooth Ricci-flat anti-self-dual ALE manifold with the stated decay; Wright's classification in the non-simply-connected case with the right orientation; the harmonic-radius bound once bubbles are excluded |
| Section 6.14: Lemma 6.27, Theorems 6.28 and 6.30, Corollary 6.29 | the TT part of the linearisation, which is Level A | coercivity of (6.58) on gauge directions; the weighted scheme; the passage from small pair values to \(H^6\)-smallness through smoothing |
| Section 6.15: Theorems 6.31, 6.33, 6.34, Corollaries 6.32, 6.35-6.37 | the diameter bound \(2\pi\) from \(\operatorname{Ric}\ge\tfrac34g\) in Corollary 6.32; the differential inequalities of Corollaries 6.36 and 6.37 | the contradiction arguments: identification of the limit as round, and transfer of the basin through bundle automorphisms that are not uniformly controlled |
| Proposition 12.6 | the static construction, by hand and by sampling (N5) | smoothness of the flow through \(t=0\) and the convergence statement, both through Corollary 6.29 |
| Sections 6.16-6.21, 12.3-12.9 and 13 | scaling consistency of the budgets and norms | everything else: the critical Besov and Lorentz estimates, the slice and Coulomb constructions, the multiscale counterexamples, Theorem 13.2 |
| Section 15 | Lemma 15.1: the Schauder argument on a \(W^{1,8}\) ball that is compact in \(C^0\), with weak continuity of the residual, is the right tool, since the perturbation is small but not Lipschitz-small; Theorem 15.2: \(C^0\) convergence of the twistor structures from first jets, regularity of the lifted sphere (index six, kernel the reparametrisations, which for the integrable sign matches the classical normal bundle \(\mathcal O(-1)\oplus\mathcal O(-1)\)), and the zero-area contradiction | Corollary 15.3 and Theorem 15.4: existence of an embedded holomorphic sphere in every nonflat bubble, and the finiteness statement |

The external theorems relied on, none of which I checked against its source, are Koch-Lamm (rough data), Anderson (harmonic radius), Bando-Kasue-Nakajima (ALE coordinates), Wright (classification of quotients of gravitational instantons), Hamilton (Nash-Moser inverse function theorem), Chang-Gursky-Yang (conformally invariant sphere theorem), Kuiper (conformally flat simply connected manifolds), Fine 2017 (tamed twistor spaces) and Lyu-Xu (rational curves in ALE spaces). Of the literature I consulted only Fine's 2011 paper, through his Section 4.2, and Section 4 of Fine-Krasnov-Panov, both through a web tool that returns extracts, and the abstracts of the other items listed under Sources.

## 8. Position relative to the literature and to the conjecture

Fine's Conjecture 1.7 states that a compact four-manifold admitting a positive definite connection admits an anti-self-dual Einstein metric of positive scalar curvature, hence by Hitchin's classification is \(S^4\) or \(\overline{\mathbb{CP}}^2\). Fine-Krasnov-Panov restate it as their Conjecture 4.8 and give a Riemannian form, Conjecture 4.10; Fine and Panov proved it for circle-invariant fat bundles. For homotopy four-spheres this gives the following picture. The smooth Poincaré conjecture implies that every homotopy four-sphere carries a positive definite connection, namely the round one. Conversely, existence of such a connection on every homotopy four-sphere, together with the Fine-Panov conjecture for homotopy spheres, implies the smooth Poincaré conjecture. The flow programme addresses only the second ingredient, "definite implies standard", and addresses it conditionally. The first ingredient, existence of initial data, is a consequence of the conjecture one is trying to prove and is approached by nothing in the manuscript, as the manuscript says.

Within the second ingredient, what is established is a neighbourhood statement in several topologies: small strain (N4, effective), small energy within a family of bounded transport density and diameter (Theorem 6.33, non-effective), and conditional late-time criteria (Theorem 6.34 with its corollaries). What a proof of the Fine-Panov conjecture by flow would need, and what is absent, is an a priori bound along the flow: control of the strain budget, or of \(\sup\Psi\) and the diameter along a sequence of times. The manuscript's own examples show that no pointwise spectral mechanism provides one (Proposition 6.10, Section 12.2, Propositions 12.4-12.5), and Proposition 12.6 shows on the round sphere itself that a spectral cap can be crossed. That is a fair account of the difficulty, and I would put it in the introduction in these terms.

## 9. Presentation and organisation

At 159 pages, with a Section 6 of 78 pages, 21 subsections and 55 numbered results, the manuscript cannot be refereed as one paper. A division that matches the levels of evidence would be: (i) the linear theory at the round sphere, Sections 3-5 and 7-11 with Propositions 12.1-12.2, about 35 pages, checkable completely and, with R1-R4 and the literature of C6, a paper in its own right; (ii) the exact nonlinear identities, the spectral theorem and the cap examples, Sections 4.5-4.6, 6.1-6.3, 12.2 and 14.1-14.2, with the certificates as an appendix; (iii) local theory, continuation and compactness, Sections 6.4-6.13; (iv) round stability, entry theorems and critical budgets, Sections 6.14-6.21, 12.3-12.9 and 13; (v) the \(C^0\) persistence lemma and tamed twistor compactness, Section 15, which is independent of the flow. Parts (iii)-(v) each need a specialist referee.

Within the present text, the abstract runs to five paragraphs and lists conclusions without separating the three layers, and the introduction describes results before the objects are defined. A one-page statement of main results with their hypotheses, followed by the "what is not proved" sentences that currently end the abstract, would serve readers better.

## 10. Reproducibility

The [checks folder](EXTERNAL_MANUSCRIPT_REVIEW_20261123_checks/README.md) contains two shared libraries, thirteen scripts, a runner and two logs. The method is a fully nonlinear implementation on the round sphere with \(K=0.8\), chosen different from 1 to expose normalisation slips: symmetric-gauge coframes, the spin connection, curvature, \(\mu_A\), \(Q\), the reconstructed metric by Urbantke's formula in place of the manuscript's graph map, and the flow vector field, with all first- and second-order statements obtained by automatic differentiation in double precision. Test fields are the \(k=2\) TT harmonics \(h(X,Y)=C(x,X,x,Y)\) with \(C\) a Weyl tensor on \(\mathbb R^5\), generic local TT tensors, and polynomial metric and connection variations. The stationary form of Section 6.3 is implemented separately from its definition and compared with the manuscript's parametrisation. The explicit examples of Section 12.2 are run with \(K=1\), as stated there. A full run takes about ten minutes on two cores.

## 11. Limits of this review

The checks are floating-point evaluations at sample points and on grids. They are strong evidence against algebraic and normalisation errors in local identities and finite-dimensional statements; they prove nothing, they do not rerun the exact certificates, and they are silent on every analytic theorem. Inequalities were sampled, not established. The observations in N3 are numerical and may fail off the grids. Proposition 12.6 is asymptotic in \(\epsilon\), and sampling it at two values is a plausibility check of the construction. Level B means that I followed an argument, and I can have followed it into an error. Level C means that I have no opinion on correctness. I did not check the bibliography entry by entry, the cross-references, or the typesetting. The manuscript changed three times during the review and may change again; anything committed after `df5b7b1` is outside this review. An AI reviewer can share blind spots with an AI drafting pipeline even across vendors, which is one more reason to put the Level C material before human specialists.

## Sources

Consulted on the web during the review:

- J. Fine, [A gauge theoretic approach to the anti-self-dual Einstein equations](https://arxiv.org/abs/1111.5005), arXiv:1111.5005v2
- J. Fine, K. Krasnov and D. Panov, [A gauge theoretic approach to Einstein 4-manifolds](https://arxiv.org/abs/1312.2831), arXiv:1312.2831
- J. Fine and D. Panov, [Symplectic Calabi-Yau manifolds, minimal surfaces and the hyperbolic geometry of the conifold](https://arxiv.org/abs/0802.3648), arXiv:0802.3648
- J. Fine and D. Panov, [Circle-invariant fat bundles and symplectic Fano 6-manifolds](https://arxiv.org/abs/1407.0840), arXiv:1407.0840
- M. Gursky and J. Viaclovsky, [Rigidity and stability of Einstein metrics for quadratic curvature functionals](https://arxiv.org/abs/1105.4648), arXiv:1105.4648
- J. Viaclovsky, [Critical metrics for Riemannian curvature functionals](https://arxiv.org/abs/1405.6080), arXiv:1405.6080, for the Kobayashi-Itoh form of the Hessian
- G. Catino, L. Cremaschi, Z. Djadli, C. Mantegazza and L. Mazzieri, [The Ricci-Bourguignon flow](https://arxiv.org/abs/1507.00324), arXiv:1507.00324
- G. Catino and C. Mantegazza, [Short-time existence for the Schouten flow](https://arxiv.org/abs/2609.06503), arXiv:2609.06503
- K. Kröncke, [Stability of Einstein metrics under Ricci flow](https://arxiv.org/abs/1312.2224), arXiv:1312.2224
- D. Knopf and N. Šešum, [Dynamic instability of \(\mathbb{CP}^N\) under Ricci flow](https://arxiv.org/abs/1709.01005), arXiv:1709.01005

Cited from memory and not consulted: R. Hamilton, Four-manifolds with positive curvature operator, J. Differential Geom. 24 (1986); N. Hitchin, Kählerian twistor spaces, Proc. London Math. Soc. 43 (1981); J. Plebański, J. Math. Phys. 18 (1977); R. Capovilla, J. Dell and T. Jacobson, Phys. Rev. Lett. 63 (1989); H. Urbantke, J. Math. Phys. 25 (1984); O. Kobayashi, J. Math. Soc. Japan 37 (1985); M. Itoh, The Weitzenböck formula for the Bach operator, Nagoya Math. J. 137 (1995). These details should be checked before use.
