# SP4-CME-E117 return v1 — annular Lorentz audit and endpoint comparison

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper launch configured gpt-6.2-sol/ultra.
Independent runtime attestation and selected lead settings were
unavailable. I authored E22, E47 and E114 and did not author E116
or E112. My related E15 commutator work is disclosed in the audit.
This checks the applicability of the assessed E22 result and
does not independently re-audit all of E22. [Request][req] · [Audit][audit].

## Disposition

Pass. In E116, the actual lower subannulus has volume at least
\(vr_k^4\) and strain size at least \(L\delta_N/r_k\), once
the fixed scale is shrunk to absorb the \(O(r_k)\) error of
the reference covariant derivative. The annular collars,
disjoint support, choice order, strict superlevel sandwich
and highest and lowest level bands all check. Right continuity
and the generalized inverse give the exact layer factor four.
The \(q=4\) convention gives the usual \(L^4\) norm and the weak
norm is \(\sup_{\lambda>0}\lambda\mu_N(\lambda)^{1/4}\).
The resulting norm orders are \(\delta_N N^{1/q}\) at finite \(q\)
and \(\delta_N\) at \(q=\infty\). The ratio of the E112 derivative
integral to those norms grows at least at \(N^{1-1/q}\) for fixed
finite \(q>1\) and \(N\) for \(q=\infty\).
[E116][e116] · [E112][e112] · [E112/E114 assessment][a112].

For the attained \(T_N=D_0q_N/2\), the normalized time equation is
\[
 (\partial_t T_N)_c=4(\Delta_{\mathcal V}T_N)_c-36K(T_N)_c
                  +8[\operatorname{ad}(F_{0,ca}),(T_N)^a] .
\]
The covector Ricci term adds \(-12K T_N\) to the defect reaction
\(-24K T_N\); the two internal curvature terms agree, and
\(D_0F_0=0\). This is E22's full rank-twenty operator with its
parallel reaction eigenvalues \(-52K,-12K\), so uniqueness gives
the E22 semigroup path. At \(G=2K\widehat g\), \(\tau=2Kt\), the
native covariant derivative norm and squared strain norm each
gain the inverse time factor, and the initial \(L^{4,1}\)
norm is invariant by the layer formula. E22's separate linear
derivative estimate proves
\(I_N\le C\|T_N(0)\|_{(4,1);G}\le C'\sqrt N\), giving exact
two-sided order with E112 and E116. The squared-strain integral
has E22's separate quadratic upper bound and this audit gives no
matching order for the full \(J_{\rm lin}\). E116's layer argument
alone yields no upper budget estimate. The assessed fixed-round
linear upper estimate already holds. No nonlinear claim or new
source inspection was made. [E22][e22] · [E22 assessment][a22].

## File identities

| Input or output | SHA-256 |
| --- | --- |
| [E117 request][req] | 9f2253323961b82a6a339d7cdfa77e81bbed7ba875bc25ef0824440049a5aee7 |
| [E116 request][req116] | ac0995740e6634fd59e958c30a36c82a8323284389e19d910af68877eab085e8 |
| [E116 return][ret116] | b7b7a48422fc4e116dedddf18d31620e750a6431fffdcf15e97ad1bdb10c93a6 |
| [B62][b62] | 2fc388067ee0a45b8da327547fb9e6ff1033a97299a80df4c3e37d247c8841e5 |
| [E116][e116] | bba74ee73fc53fd7707d4489d6b9f1dbe67957fb9517f972bfba584522a1327c |
| [E112][e112] | f3d34f89645c81128a8d16544eb1248f1839249ed7c3c6bdbd0e51e2fa43c856 |
| [E22][e22] | 6d25f4b39c2f75a407f73b2fd7a913cebbe46576cc39a00832b2d0cbf828a22b |
| [E112/E114 assessment][a112] | 3955a28ce41c134a66216c7cbce2083ca2dcc3c633b8a73a0ed08be0b165b58c |
| [E22 assessment][a22] | 5968a5cca8afbb4a00bd342e768526b0ffa5f7afebfaa01dd8bcddcad0de7e93 |
| [E117 audit][audit] | 60f42944e9fb00cbb7ff33cb007ab97fcb60b9f93b32867d7f4462f1684d348b |

[req]: SP4-CME-E117_REQUEST_v1.md
[req116]: SP4-CME-E116_REQUEST_v1.md
[ret116]: SP4-CME-E116_RETURN_v1.md
[b62]: ../../brainstorm/notes/B62_LINEARIZATION_TEST_AND_LORENTZ_THRESHOLD_20261122.md
[e116]: ../../notes/116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md
[e112]: ../../notes/112_ROUND_LINEARIZED_MULTISCALE_BUDGET_20261122.md
[e22]: ../../notes/22_ROUND_LORENTZ_HEAT_20261122.md
[a112]: ../../reviews/E112_E114_ROUND_MULTISCALE_ASSESSMENT_20261122.md
[a22]: ../../reviews/E22_E25_TRANSFER_ASSESSMENT_20261122.md
[audit]: ../../reviews/E117_ROUND_LORENTZ_NORMS_AUDIT_20261122.md
