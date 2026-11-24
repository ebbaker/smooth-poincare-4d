# SP4-FOT-SEC-E33 return v1 · Compact radial lifts and center moments

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured helper route was
`gpt-6.2-sol` / `ultra`. Actual backend model and effort were unavailable
for independent verification. Actual settings of the author-selected
lead were unavailable. [Frozen request v1](SP4-FOT-SEC-E33_REQUEST_v1.md)

The [derivation][note] resolves the fixed signed radial class
\(f=\chi(|x|)Z\) in the oriented Euclidean unit ball and gives its
global adjoint pairing on a supplied round patch. It uses real
trace-free metric variations and the curvature-operator
Hilbert–Schmidt norm. Lead assessment is pending.

| Test | Result |
| --- | --- |
| Compact linear lift | The adjoint kills the constant field \(Z\) and the quadratic field \(|x|^2Z\), whose differentiated term is the vanishing Ricci contraction of the Weyl tensor. Thus \(m_0=m_2=0\) is necessary. The lift \(16D_+^*((G*\chi)Z)\), with \(G=-\log|x|/(8\pi^2)\), is smooth and compact under the same condition, since the exterior potential consists of just the two moment terms. |
| Global adjoint center data | A smooth global cokernel field \(A\), written in the induced round frame, flattens to \(z=\Omega^2A\) on the marked ball. Its flat adjoint equation gives \(\Delta^2z=0\). The pairing with the round source is \(\langle Z,m_0z(0)+(m_2/8)\Delta z(0)\rangle_{\rm HS}\), so at most ten real center entries enter for all radial polarizations, or two scalar pairings for fixed \(Z\). |
| Exterior signal | Nonzero exterior transmission is equivalent to nonzero moments for this class and obstructs a compact lift. The closed round sphere has trivial global cokernel and exhibits this nonzero transmission for a positive radial bump. On an arbitrary supplied background the global obstruction is the actual center-data image of \(\ker L_g^*\). |

The one B20, three B18, sixteen B16, and seven crosswalk input digests
matched at HEAD `e76752648b69969b1234d0295530c87fce9fcdcb`.
The [note][note] SHA-256 is
`d6a25e0c00effcf8d436cf061802293a58d56e6a212da9f0db0d36a0e4620600`.
The source check used Gover–Gursky p. 293 and §1.1, pp. 295–296,
alongside the accepted E03 and E21–E23 calculations.

The optional finite-amplitude observation changes the compact source
by an \(O(t^2)\) term. The packet proves the linear compact criterion and
global pairing while leaving the arbitrary exterior cokernel to the
supplied metric. The lead owns integration in the [sole register](../REGISTER.md).

[note]: ../../notes/SEC_E33_20261124.md
