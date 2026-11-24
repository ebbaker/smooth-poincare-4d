# SP4-FOT-SEC-E02 return v1 · Round operator comparison

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper routing was configured as
`gpt-6.2-sol` / `ultra`. Actual backend model and effort were unavailable
for independent verification. The actual author-selected lead settings
were unavailable. [Frozen request v1](SP4-FOT-SEC-E02_REQUEST_v1.md)

The analytical packet is complete at the supplied smooth, oriented,
real Riemannian round sphere of curvature one. The fixed volume and
symmetric frame chart uses ASD chirality \(W^+=0\) and the curvature-operator
Hilbert–Schmidt convention. The [derivation and source record][note]
give the equations and normalizations. Lead assessment is pending.

| Test | Checked result |
| --- | --- |
| Mixed linearization | In independent \(a=\dot A\) variables it is \((d_\Gamma S(h)+\mathcal B a,-\mathcal P d_\Gamma a)\). With \(\beta=\dot b=a-\dot\Gamma^+(h)\) it is \((\mathcal B\beta,Dh-\mathcal P d_\Gamma\beta)\). Pointwise elimination shifts the Weyl source by \(\mathcal P d_\Gamma\mathcal B^{-1}u\) for compatibility source \(u\). The resulting mixed symbol is an isomorphism on the TT symbol slice. |
| Section symbol | For each constant \(J_i\) in a stereographic patch the vertical symbol is injective at every nonzero real covector. Taking its quotient gives one complex Weyl-quartic evaluation. Three directions distinct modulo sign give an injective real-rank-five evaluation of the Weyl target. The combined section symbol is injective of real rank 11 into dimension 12 on the TT slice, and the unreduced metric projection of its kernel is \(\ker\sigma(D)\). |
| Smooth linearized germs | The exact graph equation has the form \(\mathcal F_{J_i}=M_{J_i}(h)-\bar\partial_{J_i}v_i\). The \(\bar\partial_{J_i}\) of its source is fixed by the Weyl-quartic evaluation on the local flat representative. For a given smooth \(h\), the three homogeneous lifts exist as germs exactly when \(Dh=0\). Each lift is determined up to a holomorphic function. Forced lifts for a given \(h\) require the corresponding differentiated source equalities. |
| Closed sphere calibration | The TT symbol of \(D\) is \(-|\xi|^2 h|_{\xi^\perp}/4\) in the frame used in the note. The inherited \(D^*D\) factorization controls the global TT kernel. Gover–Gursky §1.1 supplies the separate trivial Weyl cokernel, giving \(D^*(DD^*)^{-1}\) and a closed linear mixed inverse at the stated Sobolev orders. The 15-dimensional conformal stabilizer affects vector potentials used in the gauge. The local holomorphic vertical kernels belong to the section equations. |

The seven setup-crosswalk digests and the SH-B01 and SH-E01 request
digests matched at HEAD `e76752648b69969b1234d0295530c87fce9fcdcb`.
The [note][note] has SHA-256
`2547888e365032037b86dd8352f1be28c49f0679f6235a99f8438162d632416c`.
Primary passage checks used Gover–Gursky §1.1, especially published
pp. 295–296, (1.2)–(1.3), Proposition 1.2 and the round example,
and Gover–Hill–Nurowski arXiv v3 Remark 5.2 and Proposition 5.3, (19).
The assessed SH-E00 AHS orientation translation is inherited.

B01's chart choices suffice for the tested linearization. B02 needs
actual admissible data and a specified correction map. A section map
must address the differentiated range condition, local holomorphic
freedom and prescribed overlap, support or boundary data. A mixed path
still needs noncircular initialization and applicable estimates away
from this supplied round background. This packet contains neither a
boundary estimate nor nonlinear solvability. The lead owns integration
in the [sole register](../REGISTER.md).

[note]: ../../notes/SEC_E02_20261124.md
