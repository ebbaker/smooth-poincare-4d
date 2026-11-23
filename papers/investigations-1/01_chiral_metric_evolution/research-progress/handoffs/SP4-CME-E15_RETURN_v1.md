# SP4-CME-E15 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
The [derivation][note] completes the [frozen request][request].

- Exact time chain rule verified in fixed base coordinates and a
  time-independent internal frame. With \(U=S^{-1}\) and
  \(X_c=\nabla_c^A Q\),
  \[
  \partial_t T_c=
  G_Q(\nabla^A_c Q_t+[\operatorname{ad}(v_c),Q])
  -\tfrac12(U S_t U X_c U+U X_c U S_t U)_0,\qquad
  SS_t+S_t S=Q_t .
  \]
  The full spatial product expansion uses the exact Fine flow.
  The metric time derivative enters norm contractions, and a
  moving frame requires its frame derivative.
- The principal coefficient is \(G_Q\mathscr L_Q M_Q\) on each
  base covector component. It equals \(\mathscr L_Q\) since
  \(M_Q\) and \(\mathscr L_Q\) commute on the diagonal trace-free
  and off-diagonal subspaces. Both ordinary Frobenius and
  \(M_Q^*M_Q\) give positive symmetrizers. For \(m\geq m_0>0\)
  the diffusion coefficient has bounds \(4m_0\) and \(12\),
  times \(|\xi|_{\widehat g}^2\). At round it is \(4I\).
  The coefficient commutation also passed exact rational checks
  on a full basis at one round and one anisotropic matrix.
- With \(\Delta_A=\nabla^a\nabla_a\), the first commutator is
  \[
  \nabla_c^A\Delta_A Q-(\Delta_A X)_c
  =-\operatorname{Ric}_c{}^aX_a+
  2[\operatorname{ad}(F_{ca}),X^a]
  +[\operatorname{ad}(\nabla^aF_{ca}),Q] .
  \]
  The last term vanishes by self-duality and Bianchi.
  E09 supplies the Ricci terms through the chiral curvature
  of \(\Gamma^+\), without pointwise \(W^-\). The differentiated
  round reaction combines with the Ricci term to give
  \(-36K T^{(1)}\), with the remaining internal curvature
  action stated in the note.

This is the frozen strain symbol on data linked by the
connection and metric reconstruction. Fine's primary
connection-one-form symbol and gauge adjustment are different
objects. The calculation supplies no coupled-system parabolicity
theorem or bound for the time integral in E14. [Fine v2,
Propositions 4.2 and 4.5 and §4.2][fine].

## Input and evidence hashes

All frozen inputs matched when read.

| File | SHA-256 |
| --- | --- |
| `B14_STRAIN_EVOLUTION_SYMBOL_20261122.md` | `ea4093e891a9ce06aae77d2aec8eaf83bc33aef818ba80ac5837de3f662bb244` |
| `04A_NONLINEAR_Q_20261122.md` | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| `05A_REAL_TWISTOR_COMPARISON_20261122.md` | `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2` |
| `11_TRANSPORT_CURVATURE_COMPARISON_20261122.md` | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| `16_TEMPORAL_STRAIN_CRITERION_20261122.md` | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| `SP4-CME-E15_REQUEST_v1.md` | `9bd4c50c7b5a7cd03acd815249a3685cbc011d7806e6facf9831e7bffc9e45d4` |
| `17_STRAIN_EVOLUTION_STRUCTURE_20261122.md` | `d8caa4e811178ba1357552526f311e5d283ec5e04ffd18851c7e378bfcfd5ec3` |

[note]: ../../notes/17_STRAIN_EVOLUTION_STRUCTURE_20261122.md
[request]: SP4-CME-E15_REQUEST_v1.md
[fine]: https://arxiv.org/html/1111.5005v2#S4
