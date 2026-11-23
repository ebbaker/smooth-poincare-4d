# SP4-CME-E02B return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configuration gpt-6.2-sol /
ultra. Independent runtime settings and lead model/effort were
unavailable. This bounded E execution completed [request v1][request].

- The [derivation][note] verifies
  \(\mathscr L_Q(H)=2(QH+HQ)-\tfrac43\operatorname{tr}(QH)Q\)
  as the coefficient of \(\nabla^a\nabla_a Q\) from the wedge quotient
  and Bianchi-rewritten velocity. It is self-adjoint in the specified
  \(Q^{-1}\)-weighted pairing and the ordinary Hilbert–Schmidt pairing.
  The derivation records all five exact eigenvalues. With
  \(m=\lambda_{\min}Q\) and \(M=\lambda_{\max}Q\), the spectral bounds
  are \(4m\) and \(\min(4M,6)\); the smallest eigenvalue is also at most
  \(8m\) and thus necessarily degenerates as \(m\) tends to zero.
- A strict spatial minimum of the simple smallest eigenvalue with zero
  scalar Hessian is compatible with the matrix-field jet
  \(Q_0=\operatorname{diag}(m,1,2-m)\),
  \(H=\operatorname{diag}(0,-1,1)\), \(0<m<1\). Its principal velocity
  in the smallest eigendirection is \(-\tfrac43m(1-m)<0\).
  This excludes a principal-term sign argument on general SPD
  matrix-field jets. Connection realizability is assigned separately.
  The sign alone supplies no finite-time degeneration statement.
- The linear round test gives \(q_t=-4(L_E+6K)q\). A
  [standalone exact check][code] passed on three \(Q\) values for
  the wedge contraction and two \(Q\) values for the adverse jet,
  five total. The [output][output] records the test and exact
  adverse entries. There was no numerical campaign.

Read Fine v2 §4.1–4.2, Proposition 4.2 eq. (4.1) for the connection
velocity and Proposition 4.5 for the distinction between the
connection symbol and the present \(Q\) coefficient. The calculation
uses the manuscript's clock, as converted in E01.
[Fine, arXiv:1111.5005v2][fine].

The exact \(W\) expression leaves the first-derivative, mixed
curvature derivative, and internal curvature commutator terms for
E02A. The lead's B01 follow-up reports the independent pointwise
volume identity. Pointwise conservation of \(\mu\) alone gives no
positive lower bound on the eigenvalues of \(Q\). Estimates involving
the remaining terms belong to B03.

## Frozen inputs and checked outputs

All frozen inputs matched when work began. Afterward, the lead
appended a B01 follow-up. The bytes preceding its heading, through
the original final newline, still match the frozen B01 hash.

| File | SHA-256 |
| --- | --- |
| Manuscript `chiral_curvature_and_metric_evolution.tex` | `4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0` |
| `E01_FOUNDATION_ASSESSMENT_20261122.md` | `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6` |
| `B01_NONLINEAR_Q_DECISION_20261122.md` at launch | `7f8ee74718d73baa1230f3757c4135ad23219b26dbf8c849519f6d3f0773d2df` |
| B01 with the lead's follow-up observed before return | `a9a8d2640a50437278079b49fd69e54a6e2d1ab13d339222912468391a1e1d54` |
| `02_riemannian_s4_metric_evolution_20261121.md` | `fca4cad10ee49b497628932e7ee1b150bfe4e701a3422b6e3b1f2e764cd16347` |
| `SP4-CME-E02B_REQUEST_v1.md` | `377179ba5b45214b39366584b515adf873d42e4f997cb399ddc6f15f827557cd` |
| `04B_NONLINEAR_Q_20261122.md` | `2f764d314f9d886ecdc62191e9109a00db50f4a1e4f557c0af11ff568d5d769a` |
| `e02b_principal_checks.py` | `951c5efbb013a4713ba047eadb26b151c3a559ac302a6d87da1a0e2e2976d1a0` |
| `E02B_CHECKS_20261122.txt` | `694f6c7b283154704e1b144ec61b9ca7d0bc9386c5d72d2907877817fc20fee0` |

[request]: SP4-CME-E02B_REQUEST_v1.md
[note]: ../../notes/04B_NONLINEAR_Q_20261122.md
[code]: ../../numerics/e02b_principal_checks.py
[output]: ../../numerics/E02B_CHECKS_20261122.txt
[fine]: https://arxiv.org/html/1111.5005v2
