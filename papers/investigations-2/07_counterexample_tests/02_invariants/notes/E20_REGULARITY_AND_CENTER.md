# WIN-E20 · Regularity of the weak limit and the centered converse

28 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The [frozen request][request] specifies GPT-6.2 Sol / ultra.
Actual serving variant and reasoning effort were unavailable. Inputs
are checkout `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7` and the [spectral
bound][spectral] and [centered extrema][extrema] at SHA-256 prefixes
`8dff6f0d` and `5ca81169`, verified against the frozen request.

A nonconstant extrinsic \(W^{1,4}\) map of a connected closed smooth
oriented Riemannian four-manifold to the unit round sphere is a smooth
conformal diffeomorphism if its differential is almost everywhere zero
or a similarity of one fixed orientation sign. Conversely, on every
fixed conformally round representative there is a volume-centered
generating pencil of zero angular residue. Orthonormal generators can
be imposed for that same representative. These are the regularity and
construction ingredients of [WIN-B07][request].

## Extrinsic continuity and the signed differential

Let \((M,g)\) be the source as above and let
\(f\in W^{1,4}(M,\mathbb R^5)\) satisfy \(|f|=1\) a.e. The Sobolev chain
rule applied to the squared norm gives \(f\cdot df=0\) a.e., so the
weak derivative has image tangent to the round sphere at \(f(x)\).
Use the round metric \(g_0\), the outward target orientation and the
intrinsic signed Jacobian \(J_f=f^*dV_{g_0}/dV_g\), defined using this
weak tangent differential. For a fixed \(\sigma\in\{+1,-1\}\), at a.e.
point with \(df\ne0\) suppose \(df\) is a similarity of dilation
\(\lambda>0\) with \(\sigma J_f=\lambda^4\). The other points have
\(df=0\) and \(J_f=0\). In the centered limit the mean
\(\int_M f\,dV_g=0\) guarantees nonconstancy, since any a.e. constant
value is a unit vector and has a nonzero mean at positive volume.

For \(\sigma=-1\), compose \(f\) with any linear orthogonal reflection
of \(\mathbb R^5\) restricted to \(S^4\). This preserves the round metric
and reverses its orientation, so the new map has positive Jacobian
where its differential is nonzero. For \(\sigma=+1\) use the identity.
Write \(F\) for the resulting map, which is still nonconstant. The same
extrinsic \(W^{1,4}\) space and round target apply to \(F\).

Goldstein–Hajłasz–Pakzad define \(W^{1,n}(M,N)\) using an isometric
embedding of the target. Their finite-distortion hypothesis is the
a.e. alternative \(J_F>0\) or \(dF=0\). Both branches hold in exactly
the needed sense here, including on a possible positive-measure set
of zero derivative. Their Theorem 4 gives a continuous representative
for smooth oriented Riemannian manifolds of equal dimension without
boundary with compact target. The standard embedding
\(S^4\subset\mathbb R^5\) is isometric, so the stated extrinsic input
meets their Sobolev hypotheses. We use Theorem 4 on finite distortion.
[Goldstein–Hajłasz–Pakzad, published pp. 4372–4373, Theorem 4][ghp-doi] ·
[Authors' arXiv v1, pp. 2–3][ghp-arxiv]

The continuous representative still takes values in \(S^4\)
everywhere, by closedness of the sphere and full support of the
smooth source volume. For each source point choose a target chart
around its value, then shrink the source neighborhood so its image
lies in a compact subset of this chart. Each coordinate function
of the target chart extends smoothly from that compact subset to
the ambient space using a cutoff in the chart and the tubular
projection to \(S^4\). Such extensions may be taken with bounded
first derivatives. The Sobolev chain rule gives \(W^{1,4}_{\rm loc}\)
in these target coordinates and agrees with the intrinsic weak
differential. This also proves the relative-compact-image
localizability condition of Liimatainen–Salo.

## One-quasiregularity and removal of degeneracy

Liimatainen–Salo, Definition 2 in §4, assume a localizable
\(W^{1,n}_{\rm loc}\) map between manifolds with continuous metrics and
test locally constant Jacobian sign and an invariant distortion
inequality. Their definition explicitly allows each coordinate
Jacobian to be nonnegative or nonpositive a.e. In oriented charts
the Jacobian here is nonnegative. Changes of chart can reverse its
sign everywhere on a connected chart overlap. Their norm
\(\|dF\|_g\) is the Hilbert–Schmidt differential norm divided by
\(\sqrt n\), and their \(\operatorname{Det}_g(dF)\) is the nonnegative
volume dilation, independent of the orientation convention.
At our similarity points, with \(n=4\),
\[
    \|dF\|_g^4=\lambda^4=\operatorname{Det}_g(dF).
\]
At zero derivative both sides are zero. Thus their distortion
condition holds with \(K=1\) on the entire almost-everywhere domain.
Definition 2 permits these zeros. Their subsequent Theorem 4.1(3)
gives nonvanishing Riemannian Jacobian a.e. for a nonconstant such
map. This justifies the a.e. positive conformal factor asserted in
the prose following their definition.
[Liimatainen–Salo, published pp. 352–353][ls-definition]

Theorem 4.4 applies to a nonconstant Riemannian 1-quasiregular map
in dimension \(n\ge3\) between \(C^r\) metrics, \(r>1\), and gives a local
\(C^{r+1}\) diffeomorphism taking the target metric back to a positive
multiple of the source metric. Smooth metrics meet each
noninteger \(r>1\), hence the map is smooth with invertible smooth
differential everywhere. The local conformal factor extends
smoothly and positively, being the normalized trace of the
smooth pulled-back metric. This removes the possible degeneracy
at every point. Undoing the initial target reflection restores
the original orientation sign of the conformal map.
[Liimatainen–Salo, Theorem 4.4, published pp. 355–356][ls-theorem]

The resulting \(f\) is a local diffeomorphism. It is proper since
\(M\) is compact, and its image is open and closed in connected
\(S^4\), so it is onto. For a target point, its fibre is discrete
and compact, hence finite. Disjoint inverse chart neighborhoods
at these preimages cover all preimages of a sufficiently small
target neighborhood, since the complement of their union is
compact and its image misses the target point. This gives a
covering. The target is simply connected and \(M\) connected, so
the covering has one sheet. The inverse is smooth and \(g\) is
conformally round. The argument takes the sign of the weak
differential as a hypothesis and requires no passage of degree
through weak convergence.

## A centered zero-residue pencil on the given representative

Suppose now that \((M,g)\) is conformally round, with
\(g=\theta^2 A^*g_{\mathrm{rd}}\) for a smooth diffeomorphism
\(A:M\to S^4_{\mathrm{rd}}\) and smooth \(\theta>0\). Choose \(A\)
orientation-preserving, using a target isometric reflection if
needed. This allows the positive half-spin bundles to be
identified by spin pullback, with the unique spin structures.
Use the round coefficient pencil of [E10][round] and its smooth
isometric kernel map \(k_{\mathrm{rd}}:S^4_{\mathrm{rd}}\to P\),
where \(P=\mathbb{HP}^1\) has the unit round metric and the Hopf
coordinates of [E16][balance]. The kernel orientation sign is
negative in the outward Hopf orientation.

Push the probability measure \(dV_g/V\), \(V=\operatorname{Vol}_g(M)\),
forward by \(k_{\mathrm{rd}}\circ A\). This is nonatomic because that
map is a diffeomorphism. The explicit conformal maps \(T_a\) and
no-retraction argument of [E16][balance] give an orientation-preserving
conformal transformation \(T:P\to P\) with
\[
    \int_M T\circ k_{\mathrm{rd}}\circ A\,dV_g=0 .
\]
Conjugate it to the spatial round sphere and set
\[
    \Phi=k_{\mathrm{rd}}^{-1}\circ T\circ k_{\mathrm{rd}},
    \qquad H=\Phi\circ A,\qquad h=H^*g_{\mathrm{rd}} .
\]
Then \(H\) is orientation-preserving and \(h\) is a smooth round
metric on \(M\). Conformality of \(\Phi\) gives
\(\Phi^*g_{\mathrm{rd}}=\rho^2g_{\mathrm{rd}}\) for smooth \(\rho>0\),
so \(g=u^2 h\) with \(u=\theta/(\rho\circ A)>0\).

Pull the two round twistor spinors back by the spin lift of the
oriented isometry \(H:(M,h)\to(S^4,g_{\mathrm{rd}})\). The spin
connection and Clifford action are natural under this lift, so
their pullbacks solve the positive twistor equation for \(h\).
Apply the conformal spin identification \(\beta:S_h^+\to S_g^+\)
and the common factor \(u^{1/2}\). Friedrich's \(\lambda^{1/4}\)
kernel weight for a conformal metric change of factor \(\lambda\)
gives this factor with \(\lambda=u^2\). The resulting two smooth
fields are exact twistor spinors for \(g\). Both transports are
invertible and quaternionic on fibres and preserve the coefficients
of the pencil. Thus the kernel map is
\(k_{\mathrm{rd}}\circ H=T\circ k_{\mathrm{rd}}\circ A\), centered for
the same volume \(dV_g\). Its angular residue in the definition of
[the incidence calculation][rigidity] is zero.
[Friedrich, equation (1.1) and conformal weight, pp. 59–60][friedrich] ·
[First-series spin identification][covariance]

For the quaternionic \(L^2(g)\) normalization let \(E_x\) be the
evaluation row of this pair and \(m(x)=\|E_x\|>0\) its sole positive
singular value. Multiply both fields by the smooth common
factor \(w=\sqrt{2/V}/m\). The normalized pointwise Gram operator is
\((2/V)(I-P_{\ker E_x})\). The traceless part of \(P_{\ker E_x}\) is
a linear encoding of the five Hopf coordinates. Centering gives
\(\int_M P_{\ker E_x}\,dV_g=(V/2)I\), so the integrated Gram matrix
is the identity. The common factor leaves the kernel at every
point unchanged. For a coefficient \(k\in\ker E_x\) held constant
when differentiating, the spinor \(s_k\) of the original pencil
vanishes at \(x\). The product formula
\[
 P_X^g(w s_k)
 =wP_X^g s_k+X(w)s_k+\tfrac14c_g(X)c_g(\operatorname{grad}_g w)s_k
\]
then gives zero at \(x\). This proves the normalized pair still
has zero residue. The spin isometry pullback and conformal
twistor transport supply the exact equations for the centered
pair, and the subsequent product argument supplies the
incidence vanishing for its orthonormal normalization.

## Evidence

On 28 November UTC, inspected the published Goldstein–Hajłasz–Pakzad
definition and Theorem 4, Int. Math. Res. Not. **2019**, no. 14,
4370–4391, pp. 4372–4373, with the same locators checked in arXiv
1705.05773v1, pp. 2–3. Inspected Liimatainen–Salo, *n-Harmonic
Coordinates and the Regularity of Conformal Mappings*, Math. Res.
Lett. **21** (2014), no. 2, 341–361, §4 Definition 2 and Theorem
4.1(3), pp. 352–353, and Theorem 4.4, pp. 355–356, with arXiv
1209.1285v2 as a cross-check. Inspected Friedrich's digitized
published version, Rend. Circ. Mat. Palermo (2), Suppl. **22**
(1990), 59–75, §1 pp. 59–60. These are checked primary passages.
The regularity application and the explicit centered construction
above have working status pending independent replay and Lean
verification. Weak lower semicontinuity of the deficit belongs to
the separate E19 packet.

[request]: ../research-progress/handoffs/REQUEST_FIXED_METRIC_GAP_R1.md
[spectral]: BALANCED_SPECTRAL_BOUND.md
[extrema]: CENTERED_EXTREMA.md
[round]: E10_ROUND_INSERTION.md
[balance]: E16_SPECTRAL_CONTROL.md
[rigidity]: PENCIL_RIGIDITY.md
[covariance]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md
[ghp-doi]: https://doi.org/10.1093/imrn/rnx251
[ghp-arxiv]: https://arxiv.org/pdf/1705.05773#page=3
[ls-definition]: https://intlpress.com/site/pub/files/_fulltext/journals/mrl/2014/0021/0002/MRL-2014-0021-0002-a011.pdf#page=12
[ls-theorem]: https://intlpress.com/site/pub/files/_fulltext/journals/mrl/2014/0021/0002/MRL-2014-0021-0002-a011.pdf#page=15
[friedrich]: https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2
