# SP4-CME-E125 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E02A and E104 among the
frozen inputs and the earlier E01A compatibility audit.
See the [request][req], [B65 decision][b65] and [derivation][note].

## Exact compatible equation

Pass. For the native E36 head, use
\(\beta_{\rm h}=\zeta+[a\wedge a]/2=d_Aa\),
\(\phi=d_A^{*G}a=d_0^{*G}a\), and
\(u=-S_F^*d_A^{*g}\beta_{\rm h}\). The compatible
velocity is \(v_{\rm F}-d_A\phi+\iota_uF\).
The internal negative Killing change doubles the wedge
density from E04A/E04B and leaves \(Q\) unchanged.
The metric and clock both scale by \(2K\), leaving the derivative
coefficients in their live-metric form and replacing the determinant
reaction coefficient \(24K\) by \(12\).

The exact normalized equation is
\[
 q_\tau=\mathscr L_Q(\nabla^i\nabla_iq)
   -12\sqrt{\det Q}\,q+\mathcal N_Q(X,\Xi)
   +\nabla_u q+[\operatorname{ad}\phi,q],
 \qquad \mu_\tau=\mathcal L_u\mu .
\]
The note gives the four complete contractions in
\(\mathcal N_Q\), with \(X=\nabla Q\) and
\(\Xi_{ab,i}=4\langle\nabla_iF_a,F_b\rangle_g-2X_{ab,i}\).
The vertical sign follows from \(-d_A^2\phi=[\phi,F]\).
The horizontal sign follows from
\(d_A\iota_uF=\mathcal L_uF+[A(u),F]\) on the compatible
graph. The part of the wedge Gram velocity containing derivatives
of \(u\) is the common density Lie derivative times \(Q\),
and cancels in the normalized wedge quotient. It remains in the
adjusted volume equation. A compatible reference linearization
shows that \(\operatorname{div}_g u\) can be nonzero.

## Fixed pair derivative allocation

The exact second-defect-jet coefficient is \(g^{ij}\mathscr L_Q\)
on \((D_0^2q)_{ij}\). The fixed Hessian expansion contains
\(D_0a\) only in a commutator with \(q\), and first derivatives
of the live metric only in the Levi–Civita difference multiplying
\(X\). The curvature commutator, vertical exterior square and
horizontal quotient cancellation remove their respective
apparent higher jets. The E36 constraint and Bianchi completion
are zero on the actual compatible graph. The note allocates the
curvature second jets of the chain rule inside \(D_0^2q\).

Every remaining term after the constant reaction \(-12q\)
is a coefficient affine in \(D_0U\), with smooth pair-value
coefficients, multiplying \(D_0q\) or \(q\).
This allocation uses the relation \(q=Q(F_0+\zeta)-I\)
when treating one \(X\) in each quadratic product as a first-pair
coefficient. No second pair jet or quadratic first-pair coefficient
is required outside the principal Hessian. The remainder is bounded
by \(C(|U|+|D_0U|)(|D_0q|+|q|)\), and the principal defect
coefficient differs from \(4G^{ij}\mathrm{Id}\) by \(O(|U|)\).
The homogeneous equation preserves perfectness for supplied
smooth compatible paths. This result concerns structure alone,
with no endpoint norm or mixed product estimate asserted.
No new primary source was inspected. Only the two named
E125 artifacts were written.

## Verified file identities

| File | SHA-256 |
| --- | --- |
| E125 request | `01edfb12b18354a9d868f0922a26e38b5b27a5822e186d88a9002f61eed5fc4d` |
| B65 decision | `1a9372728c2dc316ac8d027d8da15aadeda10a79af188333255101f1c810bdb5` |
| E04A | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| E04B | `2f764d314f9d886ecdc62191e9109a00db50f4a1e4f557c0af11ff568d5d769a` |
| E04C | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| E36 | `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a` |
| E42 | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| E60 | `c34bf22a1f80092a1ba33b154e4c2b308db1907ad56727099675321865a0246d` |
| E102 | `783daa8875728a6265b0632829d57dae4f72522897bb8f052c79cdf841260c3b` |
| E104 | `d299a0221bbc097ae5fe991a70301de21ca5aa2b2b9a6c7e98c3f5fc79fc4981` |
| Observed E02 lead assessment | `ba9ac8cbeaf11cf8b47286fc384e72445fa97bfde10660f327fb5a8c1ac63279` |
| Observed E36 lead assessment | `025adc76f67336e875018c5dbd10420485c1450eec9c0b8750049daa2067ec07` |
| E125 derivation | `74480ee1c5700672acd651820f2b64df2e4159ccd0f08aa478abdaffe0340c11` |

[req]: SP4-CME-E125_REQUEST_v1.md
[b65]: ../../brainstorm/notes/B65_DEFECT_ONLY_ENDPOINT_ROUTE_20261122.md
[note]: ../../notes/125_ADJUSTED_DEFECT_EQUATION_20261122.md
