# SP4-FOT-SEC-E50 · Yamabe budget and complete ALE ends · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The issued bounded helper configuration
was `gpt-6.2-sol` / `ultra`. The author-selected lead settings were
retained. Actual backend identities and reasoning efforts were unavailable
for independent verification.

All seven working SHA-256 pins in the
[issued request](SP4-FOT-SEC-E50_REQUEST_v1.md) matched at HEAD
`e76752648b69969b1234d0295530c87fce9fcdcb`. The request digest is
`3990c2c04365c39cef0b77fb30b3f96cd6c7bde9ece3a6d222341df160abc998`.
See the [proof and primary passages](../../notes/SEC_E50_20261124.md)
and [owning register](../REGISTER.md).

- One embedded full \(k\)-end core gives \(k\) complementary
  components, one per boundary link. Mayer–Vietoris and
  Poincaré–Lefschetz duality give \(b_1=b_2=0\) and \(b_3=k-1\)
  over \(\mathbb Q\), hence \(\chi(X)=2-k\) and \(\tau(X)=0\).
- Along any common subsequence \(E_i\to e\), \(Y_i\to y\) of the
  supplied smooth pointed limit, the closed identity and the
  scalar-flat ALE Chern–Gauss–Bonnet formula yield
  \[
  (8\pi^2-e)+\tfrac12(E_+^X+E_-^X)
      +4\pi^2\Bigl(k-2+\sum_j q_j^{-1}\Bigr)
      \le y^2/48\le 8\pi^2/q_{\max}.
  \]
  The upper bound comes from compactly supported annular tests
  escaping along each end, which give \(y\le Y(S^4)/\sqrt{q_j}\)
  with the sharp Euclidean quotient coefficient.
- For \(k\ge2\) the left side exceeds the last bound by at least
  \(\delta+4\pi^2(k-2)(1+q_{\max}^{-1})\). Thus every complete
  supplied limit of the stated kind has one end. Signature
  defect cancellation cannot affect this inequality.
- Four-dimensional Riemannian Schwarzschild has two Euclidean
  ends, \(\int|\operatorname{Ric}|^2=32\pi^2\), both Weyl energies
  zero and compact-support Yamabe constant \(Y(S^4)\). It
  calibrates the limit-side equality at the wall
  \(e=8\pi^2\). No realizing closed source sequence is supplied.
- The proof uses convergence on each fixed full truncation before
  removing it. It does not extract an ALE limit or rule out
  multiple distinct one-ended rescalings.
