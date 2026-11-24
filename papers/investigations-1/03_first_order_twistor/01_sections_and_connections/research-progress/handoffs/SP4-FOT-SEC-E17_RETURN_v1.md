# SP4-FOT-SEC-E17 · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The [issued request][request] records
`gpt-6.2-sol` / `ultra` as the requested helper configuration. Actual
backend model identifier and reasoning effort were unavailable for
independent verification.

**Result.** On the oriented flat \(I\times T^3\), let
\(z=ds+i\,d\theta_1\), \(u=d\theta_2+i\,d\theta_3\) and
\(\xi=z\wedge u\). For \(k\ge1\) the complex endomorphisms
\(Z_k=e^{ks+ik\theta_1}\xi\otimes\xi\) are self-dual and trace-free.
In four-index form they have zero Ricci contraction. The
curvature-operator Hilbert–Schmidt adjoint is
\((D^*Z_k)_{jq}=-\tfrac12\partial_i\partial_p T^k_{ij\,p q}\)
with the sectional curvature convention in E13. The first
divergence vanishes by \(z_i\xi_{ij}=0\) with summation, so the
adjoint vanishes. The same holds for \(\overline{Z_k}\), including
when the adjoint is defined with the Hermitian pairing.

The real \(L^2\) pairings \(\ell_k\) with \(\operatorname{Re}Z_k\)
annihilate \(Dh\) for every smooth real four-dimensional trace-free
variation \(h\) compactly supported in the interior. The compactly
supported real target
\(F_m=\chi(s)\cos(m\theta_1)\operatorname{Re}(\xi\otimes\xi)\),
with \(\chi\ge0\) a nonzero bump, has \(\ell_k(F_m)=0\) for \(k\ne m\)
and \(\ell_m(F_m)>0\). The tests are independent on the target.
For a fixed correction space of dimension \(d\), at least one
nonzero linear combination of the first \(d+1\) tests annihilates
both the range of \(D\) and that space. Every test directly
annihilates torus-invariant profiles, including the ten profiles
prescribed for the invariant E15 problem. [Derivation][proof]

**Inputs.** Observed HEAD was
`e76752648b69969b1234d0295530c87fce9fcdcb`. The seven [crosswalk][crosswalk]
pins and all four request pins for SH-B01, SH-E01, E02 and E13
matched. The request SHA-256 was
`571d7a2a4262e4f55678ebd887dd2dcbf17e7d3221d6b5089b47168b0dc07b75`,
and the [B13 decision][b13] hash was
`fe2e414c4db64039c127fe56898f13e4d9e8946a865aa24c7b8ddfa6b864addc`.
The proof records the B01/B06 hash and the 24 November checks of
published Gover–Gursky §1.1, pp. 295–296, and Chang–Gursky–Yang,
p. 107, Remark 2, for the adjoint structure and Weyl norm convention.

**Disposition.** The flat supported linear range has infinite
algebraic codimension, so universal linear correction by finitely
many fixed interior profiles fails in this class. Exterior matching
and nonlinear correction are separate geometric problems. The lead
owns assessment and integration in the [SEC register][register].

[request]: SP4-FOT-SEC-E17_REQUEST_v1.md
[proof]: ../../notes/SEC_E17_20261124.md
[register]: ../REGISTER.md
[b13]: ../../brainstorm/notes/SEC_B13_UNRESTRICTED_COLLAR_RANGE_20261124.md
[crosswalk]: ../../../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md
