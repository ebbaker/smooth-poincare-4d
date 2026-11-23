# E175 Small-strain manuscript integration audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Fixed E integration audit under B86, configured
gpt-6.2-sol/ultra. Independent runtime and lead-model attestation
unavailable. I audited E171 in E173 and audited the related E165
extraction in E167. I did not author E171, E172 or the manuscript
compression. This audit checks the frozen TeX against the accepted
single-slice result and the five requested repairs to the earlier
compactness integration. Line numbers refer to the frozen TeX.

## Disposition

The new proposition and its proof pass. The hypothesis, pointwise
constant \(72\), native Ricci lower bound \(\tfrac34g\), and sufficient
real density threshold match the assessed E171/E173 result. The
five E172 repairs are present and correct. Three recommended local
wording edits below make the inherited conventions, use of pointwise
identities and paragraph scope apparent. No mathematical premise
was dropped and no new one is needed.
[Assessed E171/E173 result](E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md).

## New proposition and proof

**Category and local identities, lines 4477–4539.** The statement
retains a smooth closed connected simply connected oriented
four-manifold with \(H^2(M;\mathbb R)=0\) and a smooth definite
positive-plane, round-compatible connection. The surrounding
native construction is on a smooth principal \(SO(3)\) bundle
with the negative Killing pairing. The proof uses all ordered base
indices for full derivatives, and the ordinary two-form norm for
alternating tensors. The relative identities bound the symmetric
and skew parts of \(P_X=S^{-1}D_X^AS\) by
\(\sqrt3|T_X|\) and \(|T_X|\), respectively. Trace three and
the inverse strain identity give the floor-free bound
\(|D^AQ|\le6|T|\) already derived in the metric-pair proof.
The derivative of \(U_X\) differentiates the existing base slot
and both factors in \(\operatorname{tr}(QT_X)\). In the
Hessian estimate the two outer product terms contribute
\(24\sqrt3|T|^2\), and the middle term contributes
\(6\sqrt3|\nabla^AT|+12\sqrt3|T|^2\). Their sum is the
audited ordered Hessian bound. Exterior alternation contributes a
factor at most \(\sqrt2\). Since \(Q\) is an internal endomorphism
without base slots, the curvature term is
\(\mathcal C=[\operatorname{ad}(F_A),Q]=d_Ad_AQ\), with
\(|\mathcal C|\le36\sqrt6\,\mathcal G\).

**Spectral alternative, lines 4542–4582.** In an oriented internal
orthonormal eigenframe the native cross-product bracket is divided
by \(\sqrt2\). The two complementary off-diagonal entries of each
commutator therefore give a squared Frobenius contribution of
\((\lambda_j-\lambda_k)^2\). Orthonormality of the ordinary
self-dual forms and the coefficients \(-\sqrt{\lambda_i}\) in
curvature give the polynomial
\(\sum_{\rm cyc}\lambda_i(\lambda_j-\lambda_k)^2=3s_2-9s_3\).
The round point and three vertices are its only nonnegative
trace-three zeros. The compact complement of disjoint \(U_R,U_L\)
has minimum \(p_*>0\). With the written
\(\varepsilon_{\rm sep}=\sqrt{p_*}/(72\sqrt6)\),
the polynomial is at most \(p_*/4\), so connectedness makes one
open preimage the entire base. On \(U_L\) the spectral gap is
greater than two. The unit-eigenline cover is trivial by simple
connectivity, and projection of the differentiated eigenvector
equation gives \(|D^Av|\le3|T|\).

**Projected curvature, lines 4582–4612.** The positive plane
generator sends \(e_1\) to \(e_2\) in the oriented triple
\((v,e_1,e_2)\). The displayed derivatives give the ambient
curvature entry \(d\theta+\beta_1\wedge\beta_2\), equal to
\(\langle F_A,v\rangle/\sqrt2\) by the native bracket.
The scalar curvature of the metric projected plane connection
is therefore
\(\Omega=d\theta=\langle F_A,v\rangle/\sqrt2-\beta_1\wedge\beta_2\).
It is global from the global plane generator and closed by the
local expression. The self-dual leading form has norm at least
\(\sqrt5/2\); the error is at most \(9\mathcal G/2\). Under
\(\sup\mathcal G\le\sqrt5/36\), the error is at most one
quarter of the leading norm. The self-dual and anti-self-dual
norms are respectively at least three quarters and at most
one quarter of that norm, giving the square density at least
\(5/8\). Exactness by \(H^2(M;\mathbb R)=0\) and Stokes on the
closed base contradict this. The compression preserves both
the second fundamental term and its sign.

**Pointwise pinching and Ricci, lines 4614–4640.** The round
branch gives \(\mathcal P\ge3|Q-I|^2/2\). The constant in the
commutator bound then gives \(|Q-I|\le72\mathcal G\) at the
same point. Global smallness is used in selecting and excluding
branches. Substitution in the native local chiral inequality
with scalar target \(6\) gives \(Z=(78+8\sqrt3)\mathcal G\).
The block gives \(|\operatorname{Ric}_0|\le2Z\) and
\(|s-6|\le4\sqrt3Z\). On unit vectors the scalar contribution is
\(s/4\), so the lower bound is \(3/2-(2+\sqrt3)Z\).
The three arguments of the displayed minimum for \(\varepsilon_0\)
match E171 (14). The real density threshold is the rearrangement
of the local lower comparison in the earlier complete-fiber
corollary, with \(k^2=4\pi/5\) and \(C_0=4\sqrt3\).
The new result assumes no eigenvalue floor, diameter, Sobolev
bound, or metric compactness. Its statement claims pointwise
rigidity estimates for one supplied slice. It gives no diameter,
flow or initialization conclusion.
[E171 derivation](../notes/171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md).
[E173 audit](E173_SMALL_STRAIN_SPECTRAL_AUDIT_20261122.md).

## E172 repair verification

| E172 item | Applied in frozen TeX |
| --- | --- |
| 1. Orientation and limit overlaps | Lines 4166–4171 choose positive rescaled charts, allowing reflection without changing harmonicity or radius bounds. Lines 4204–4212 pass the transition equation by interior \(W^{2,p}\) and uniform convergence, then use smooth coefficients before the differentiated difference equation. Smooth inverse transitions and convergence of Jacobians preserve the sign. Lines 4340–4345 choose positive unscaled charts. |
| 2. Packing and finite coverage | Lines 4146–4149 quantify packing for every fixed small radius, within the fixed-radius form of the volume bound. Lines 4340–4345 approximate a finite \(\rho/(16\sqrt m)\)-net and use metric errors and the strict chart margin to cover each sufficiently late approximant by inner \(B_\rho\) charts. |
| 3. Ball comparison and distance spheres | Lines 4248–4263 quantify \(0<\varepsilon<t\), give the inner inclusion by \(P_i\) and uniqueness, and give the outer via the limiting minimizing geodesic and converging pulled-back lengths. The fixed gap \(\varepsilon\) absorbs the uniform metric error in the inner inclusion. Lines 4272–4274 put the distance sphere inside the exponential image of the tangent sphere. |
| 4. ALE and Wright precision | Lines 3998–4005 specify an oriented smooth candidate and \(\partial^\ell(h-\delta)=O(r^{-\nu-\ell})\) for all \(\ell\ge0\). Lines 4035–4046 give Table 1, Remark 3, the finite-CW Euler characteristic justification, and the one-monopole flat case in §8's proof of Corollary B. The count is \(k\) actual monopoles. Lines 11039–11045 identify arXiv v2 and expanded passage locators. |
| 5. Anderson locator | Line 4115 cites Definition 2.1/(2.1)–(2.2), p. 4, and proof of Theorem 2.2, pp. 5–6. Lines 11035–11037 identify the undated author text with Definition 2.1. Lines 3957–3963 retain the earlier fixed-base Theorem 2.2 application with its injectivity hypothesis. |

These checks concern the five precision changes. The previously
audited compactness proof was not reassessed wholesale.
[E172 repair list](E172_ALE_COMPACTNESS_MANUSCRIPT_AUDIT_20261122.md).

## Exact local wording edits

1. **Make conventions local, lines 4479–4483 and 4542–4546.**
   State that the connection is on a smooth principal \(SO(3)\)
   bundle and use the native negative Killing pairing. Replace
   “in a positive internal orthonormal frame” with “in a positive
   internal orthonormal eigenframe” and explicitly identify
   \(\sigma(e_i)=\sigma_i\) for the chiral isometry. This makes
   the later \(\sigma(v)\) notation local to the proof.
2. **Refer to pointwise identities, lines 4512–4513 and
   4620–4627.** The \(|D^AQ|\) inequality is the pointwise
   trace-normalization estimate derived in the proof of
   Proposition `prop:metric-pair-compactness`, at
   lines 3764–3776, before pullback and compactness.
   The local native bound is the first inequality in the
   proof of the geometric-sequence corollary, at lines
   3936–3949, before selecting the numerical slice bound.
   Name them as those local identities rather than apparent
   applications of the enclosing compactness/continuation
   statements. At lines 4638–4639 a reference to
   `eq:real-temporal-equivalence` gives the exact
   sufficient density conversion.
3. **Keep flow scope adjacent, lines 4644–4649.** Move
   “The two bounds remain hypotheses on the supplied flow”
   and the attached compactness-scope paragraph to just after
   the proof of Corollary `cor:homotopy-two-bound-continuation`,
   before the new static proposition. Alternatively name that
   corollary and its \(\Psi\) and diameter bounds explicitly.
   The paragraph refers to that earlier corollary.

## Labels, references and protected section

I parsed the comment-stripped frozen TeX. It has 336 distinct labels
and 413 reference occurrences, with no duplicate label or undefined
reference. The four new labels for the proposition, commutator,
polynomial and plane curvature each occur once. There are 73 citation
commands and 75 key occurrences. The 37 distinct keys are in the
root catalog and match the 37 bibliography entries in first-use
order. Anderson, Wright and Bando–Kasue–Nakajima are entries 28–30.
The new static proof adds internal references and no new bibliography
entry. No build or new source search was performed.

From its section header to just before the next section header, the
protected old round defect section is 4501 bytes at lines 7324–7451.
Its SHA-256 is
c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab,
which matches the request. Frozen inputs were consumed before any
subsequent lead edits.

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E175 request v1](../research-progress/handoffs/SP4-CME-E175_REQUEST_v1.md) | 02e42b3962391eda4839a07010f6ff26043d50ba306ad8961131eca002c76c73 |
| [Manuscript TeX](../manuscript/chiral_curvature_and_metric_evolution.tex) | 6dcb0b51c5aeb6ee562bc7fd29106db7e20be3f11aef033e8965b5876b1c8f15 |
| [E171 derivation](../notes/171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md) | 4fc28853a3866f7094aa67471c4e1df40f56ac4a516146a752fd33df624f7e60 |
| [E171/E173 assessment](E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md) | f8a1e2e86f0fdcd0d7b29ad915e6a249d6caed13d753befd140920a22cd12a9d |
| [E173 proof audit](E173_SMALL_STRAIN_SPECTRAL_AUDIT_20261122.md) | bd2375c6a7d8b97d3c78551667caceb7d1635be5564c5a6c845f7b58dae7b981 |
| [E172 integration audit](E172_ALE_COMPACTNESS_MANUSCRIPT_AUDIT_20261122.md) | 7f7efa17f13b406ec81309660871f802273fc06e5dc315f2f3dfeef23ae73310 |
