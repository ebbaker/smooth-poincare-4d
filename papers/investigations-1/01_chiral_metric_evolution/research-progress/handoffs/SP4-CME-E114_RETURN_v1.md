# SP4-CME-E114 return v1 — actual round multiscale audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit, helper configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were unavailable.
I authored E47, E22 and the E111 audit of the flat example. I did not
author E112 or E109. [Request][req] · [Audit][audit].

## Disposition

Pass at the frozen scope. At the actual positive perfect round
reference, the native tangent map is \(DQ_{A_0}=2\operatorname{tf}L_0d_0\),
and it annihilates both infinitesimal orbit directions. The exact
round composition with the linearized connection velocity, in the
native clock \(\tau=2Kt\) and metric \(G=2K\widehat g\), is
\(-(4D_0^*D_0+12)\). Integrating the connection velocity reconstructs
the actual linearized trajectory from the specified attained smooth
tangent and preserves \(DQ_{A_0}(a_N(\tau))=q_N(\tau)\).

The annular coefficient errors \(O(r_j^2)\) in value and \(O(r_j)\)
after one derivative give smooth actual-bundle data of size
\(O(N^{-1/2})\) in the stated value norms and \(O(N^{-1/4})\)
in initial \(L^4\) strain. The differentiated local kernel quotient
gives both the Gaussian Hessian bound and the rescaled ordered
Hessian limit with leading fiber identity. In each fixed heat window,
the own-scale term is positive. The coarse sum is exponentially
suppressed and the fine sum has a fourth-power geometric bound,
both using absolute estimates on the actual atoms.
Choose \(R\) before shrinking \(\sigma\), independently of \(N\).
The native-time windows are one fourth of the heat-time windows,
and \(e^{-12\tau}\) is bounded below on their union. Thus
\(\int_0^\infty\|D_0T_N\|_\infty\,d\tau\ge c\sqrt N\).
The fixed elliptic graph norm and positive mass make both budget
terms separately finite for each \(N\). The proof uses covariant
output derivatives of the kernel and no commutation of \(D_0\)
through heat. The derivative is the full ordered covariant Hessian
of \(q_N/2\). The nonlinear curvature claim concerns the initial
connection only, with no nonlinear trajectory bound.

## Primary reinspection

I directly opened the final publisher HTML of Matthias Ludewig,
*Strong short-time asymptotics and convolution approximation of the
heat kernel*, *Annals of Global Analysis and Geometry* 55(2) (2019),
371–394, DOI 10.1007/s10455-018-9630-4, on 22 November 2026,
America/New_York. The version of record is dated 22 September 2018,
and the issue 4 March 2019. I inspected §1, (1.1)–(1.3), Theorem 1.1
and its derivative convention, and §2's opening Laplace-type and
formal adjoint definition. In the indexed HTML these were lines
63–85 and 145–152, with metadata at 814–830. This was a reinspection
of existing canonical R18, bibliography key Ludewig2019. No PDF or
new reading copy was retained. [Publisher text][ludewig] ·
[Canonical R18][refs].

Theorem 1.1 covers a Laplace-type bundle operator over a compact
Riemannian manifold and compact pairs excluding the cut locus.
With expansion and time orders zero, the Gaussian quotient
remainder is \(O(s)\) after each of zero, one and two first-variable
covariant derivatives and no second-variable derivative.
This is the precise input used on the fixed rank-five metric
connection Laplacian. Neither a global Hessian estimate nor
any evolving-geometry uniformity is imported.

## File identities

| Input or output | SHA-256 |
| --- | --- |
| [E114 request][req] | 75b889bd528a3889ffe521e8bd4b77fd0b80ae5ee75a7a05a0bf4ade243e0768 |
| [E112 request][req112] | 78683618f35b8674881a72bafd2e443d124100c94a104c48181e639cccdc3e8e |
| [E112 return][ret112] | 8d8923e511d1a1000588a20fae62ec63938db53eae230f12aa212ebf8cd0ed2f |
| [B61][b61] | f5be86a830143259179ba74f7ffae9a59b51c4d4a8c8e7a0d2f6c6453287bc44 |
| [E112][e112] | f3d34f89645c81128a8d16544eb1248f1839249ed7c3c6bdbd0e51e2fa43c856 |
| [E109][e109] | 360544867c56de98eda76d45cd7cf33ebd02631d95820e839b19500d6bb5e2a6 |
| [E47][e47] | ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6 |
| [E22][e22] | 6d25f4b39c2f75a407f73b2fd7a913cebbe46576cc39a00832b2d0cbf828a22b |
| [E111][e111] | 920aaf851a4b8b33fab65f9db600e998a0fc527cc5e74e65225403d26645edb3 |
| Manuscript round-defect scientific block | c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab |
| [E114 audit][audit] | 585cc5c5bcadf2c61672a8be16116507bbc90b65a6688f8caa3e58f3ef572478 |

The manuscript identifier is for the 4501-byte scientific block
consumed by E112, now observed at lines 5587–5714. It agrees exactly
with the E112 block digest. Only the audit and this return were edited.

[req]: SP4-CME-E114_REQUEST_v1.md
[req112]: SP4-CME-E112_REQUEST_v1.md
[ret112]: SP4-CME-E112_RETURN_v1.md
[b61]: ../../brainstorm/notes/B61_ROUND_LINEARIZED_BUDGET_TRANSFER_20261122.md
[e112]: ../../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e109]: ../../notes/109_FROZEN_MULTISCALE_STRAIN_BUDGET_20261122.md
[e47]: ../../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e22]: ../../notes/22_ROUND_LORENTZ_HEAT_20261122.md
[e111]: ../../reviews/E111_FROZEN_MULTISCALE_BUDGET_AUDIT_20261122.md
[audit]: ../../reviews/E114_ROUND_MULTISCALE_BUDGET_AUDIT_20261122.md
[ludewig]: https://link.springer.com/article/10.1007/s10455-018-9630-4
[refs]: ../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
