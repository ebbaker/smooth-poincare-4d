# E233 Audit of the pointwise absorption manuscript integration

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E integration audit, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings
are unavailable. I authored E218 and E220, the E225 endpoint audit,
and the inherited local realization input E02C. E223 and E227 were
separately authored. This checks the manuscript's use of the
assessments and does not repeat the E225 computation. All line
numbers refer to the frozen TeX.

## Disposition

**Pass.** The new proposition uses the correct full old
\(K=1\) form, the endpoint and strict-interior absorption results,
and the assessed local realization. Its constants and scope agree
with the frozen inputs. All E224 edits are present, including
the optional precisions. No TeX repair is needed in this packet.

## Statement and algebraic interfaces

At 2725–2751 the proposition fixes the old \(K=1\) pointwise
conventions and the axial family \(Q_s=3\operatorname{diag}(1,1,s)/(s+2)\)
for \(3<s\le7/2\). It uses the preceding stationary lemma for
the algebraic conventions. The statement that those identities
extend to positive \(u,v\) is explicit at 2335–2342. The earlier
ratio \(9/4\) sign result has its own range.

The two arrays at 2753–2762 agree with the assessed constructions.
With \(t=\sqrt{s}\), \(\lambda=3/(s+2)\) and \(w=dx^1\), \(Y\)
is diagonal \((1,0,-1)w\). The prescribed \(N\) gives the actual
zero-speed edge vector \((-t/2,1,-1)w\) with vanishing ordinary
and weighted traces. The diagonal squared norm is \(s/2\)
and the twice-counted off-diagonal norm is \(s/2+4\), yielding
\(|N|^2=s+4\).

The four values in 2764–2771 match the frozen assessments.
On \(Y\), the trace-corrected diagonal in 2774–2775 is
\((2s+1,s-1,-3)w/(s+2)\). The actual old velocity square is
\(16\lambda\) times its respective \(1,1,s\)-weighted diagonal
square. The latter is \((5s+1)/(s+2)\), so
\(|V(Y)|^2=48(5s+1)/(s+2)^2=4\mathfrak R(Y)\).
Since \(Y\) commutes with \(Q_s\), its own skew term has
zero scalar contraction, giving the stated principal value
\(\mathfrak R(Y)=12(5s+1)/(s+2)^2\).
[E227 proof](../notes/227_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md) ·
[E228 audit](E228_STRICT_INTERIOR_ABSORPTION_AUDIT_20261123.md).

At 2778–2795 the full Bianchi mismatch solution on \(Y\) is
\((\eta_1,\eta_2,\eta_3)=(-1-s^{-1},1-s^{-1},1+s^{-1})/(4\lambda)\).
This is the unique solve for the full invertible operator at
2203–2211. The Sylvester skew contribution on \(Y\) vanishes
because its derivative is diagonal. Its Bianchi skew contribution
in the \(13,23\) entries produces the ordered contraction
\(4\lambda t(s-1)\). The \(12\) entry has zero weight from the equal
eigenvalues. In the opposite order the contraction with \(Y\) is
zero, so subtracting half the total skew contraction from
\(2\lambda t\) gives the symmetric pairing
\(B(N,Y)=2\lambda t(2-s)\). The stated axial contraction on
\(N\) is \(8\lambda(s-1)^2\) with both skew terms. Subtracting
it from \(12\lambda s+8\lambda\) yields
\(4\lambda s(7-2s)\), also obtained from the full block
identity at 2335–2337 and the axial evaluation at 2407–2414.
Both branches therefore use the full derivative form and
the actual trace-corrected speed.
[E223/E225 endpoint assessment](E223_E225_ENDPOINT_ABSORPTION_ASSESSMENT_20261123.md) ·
[E227/E228 strict-interior assessment](E227_E228_STRICT_INTERIOR_ASSESSMENT_20261123.md).

## Endpoint, strict interior and constants

At 2797–2803, substituting \(s=7/2\) in the pairings gives
\(\mathfrak R(N)=0\), \(B(N,Y)=-9\sqrt{14}/11\),
\(\mathfrak R(Y)=888/121\) and \(|V(Y)|^2=3552/121\).
The displayed slope in \(\sigma\) is \(2B(N,Y)\).
Since \(V(N)=0\), the speed stays fixed and
\(\mathfrak R(Y+\sigma N)\to-\infty\) as \(\sigma\to+\infty\).
The quantified exclusion of any finite speed-only coefficient
at the center spectrum follows. This is consistent with
nonnegativity on the stationary kernel.

At each strict \(3<s<7/2\) the quadratic coefficient
\(4\lambda s(7-2s)\) is positive. The value at
\(\sigma_*=-B(N,Y)/\mathfrak R(N)=(s-2)/(2t(7-2s))\)
is \(\mathfrak R(Y)-\lambda(s-2)^2/(7-2s)\). Dividing its
negative by \(|V(Y)|^2=4\mathfrak R(Y)>0\) yields the exact
lower-bound function in 2735–2739. Multiplying that function
by \(7/2-s\), using \((7/2-s)/(7-2s)=1/2\), gives the
limit \((11/2)(3/2)^2/[32(37/2)]=99/4736\).
Thus the liminf comparison at 2810–2813 applies to any
admissible choice of coefficient. The proof minimizes along
one line and states the limitation to a necessary bound.

For \(\kappa(r)\), the minimum at 2631–2638 is taken over
unit stationary tensors at spectral ratio at most \(r\).
The choice \(s=r\) and \(N/\sqrt{r+4}\) is in that set.
Its value is \(12r(7-2r)/[(r+2)(r+4)]\), giving the upper
bound in 2743–2745 with strict positivity inherited from the
interior sign. This proposition supplies an upper bound on
\(\kappa\). Its pointwise speed-only coefficients and numbers
are expressed in old \(K=1\) units. The surrounding native
gradient proposition uses separate quantities and its exact
normalization. The qualitative statement at 2845–2847
transfers under the fixed positive rescalings of the speed
and full-form norms. It supplies no numerical constant in
native units.
[E227/E228 assessment](E227_E228_STRICT_INTERIOR_ASSESSMENT_20261123.md) ·
[E228 scale audit](E228_STRICT_INTERIOR_ABSORPTION_AUDIT_20261123.md).

## Realization and distinction from integrated claims

At 2818–2838, the affine term has exterior derivative \(F^*\),
the added quadratic term gives the stated first curvature
derivative, and \(A(0)=0\) makes the curvature bracket
second order. The wedge matrix at the center is \(Q_s\) and
has trace three. The negative curvature columns select the
round-compatible sign, and the positive chiral plane and old
density \(2dV_{\rm eucl}\) fix the Euclidean old center metric.
For the given \(U_i^a\), the derivative of the wedge matrix is
the symmetric trace-free \(X_a\), since
\(\langle U_i^a,J_jdx^a\rangle=-(X_a)_{ij}/s_j\).
The trace correction in \(Q=3\mathcal M/\operatorname{tr}\mathcal M\)
therefore vanishes and \(A(0)=0\) identifies the covariant
first derivative with \(X_a\). Bianchi is automatic for this
actual curvature, as needed for its full form.

Openness supplies the positive-definite round-compatible
local class. For a strict \(s\), every \(r'\) with
\(s<r'<7/2\) bounds the ratio on a sufficiently small closed
ball by continuity. The theorem requires only a ball with
a strict bound below \(7/2\) and makes no common radius
claim. The endpoint ratio is asserted at the center.
The restrictions in 2841–2847 correctly keep the unbounded
coefficient result pointwise even for the strict local
examples, without inferring an integrated counterexample,
closed datum, singular trajectory or preservation law.
[E223/E225 endpoint assessment](E223_E225_ENDPOINT_ABSORPTION_ASSESSMENT_20261123.md) ·
[E227/E228 local quantifiers](E227_E228_STRICT_INTERIOR_ASSESSMENT_20261123.md).

## E224 repair follow-through

- **Model covector, 2329.** The radical now uses
  \(W\in(\mathbb R^4)^*\) in the fixed pointwise model.
- **Power contributions, 2366–2369.** A substituted
  monomial contributes the stated power coefficient and
  contributions to coincident powers are added.
- **Provenance, 2616, 2867–2868, 6715–6716, 6810–6817.**
  The stationary comment names E199/E201 for the axial
  result and E202–E204 for the earlier \(9/4\) range, with
  E218/E219 and E220/E222 for the sharp and closed applications.
  The late corollary names E205/E206 for trace, transport and
  fixed tail plus the assessed closed \(7/2\) input. The
  occupation text names E212/E213 and the E220/E222
  strict-range gradient estimate. The effective \(9/4\)
  constants retain their E209/E210 attribution.
- **Optional precisions, 102, 401, and 10300–10301.**
  The abstract and introduction both say ratio at most
  \(9/4\) for the effective constants. The local
  Hessian paragraph identifies the internal component \(i\)
  paired with \(\Sigma_j^*\).
- **Filename, 2380–2386.** The corrected v2 generator is
  still named and its canonical JSON now uses the separate
  path macro. The E219 verifier filename is intact. This
  check concerns the source text.
  [E224 audit](E224_SHARP_SPECTRAL_MANUSCRIPT_AUDIT_20261123.md).

## Static checks and release

The active TeX has 387 unique labels and 526 resolved
reference calls. The new proposition has one declaration,
and its three displayed equation labels are referenced
once each in its proof. Its inherited lemma and proposition
references resolve. The new block's displayed and inline
math delimiters and environments checked statically.
The 95 citation-key uses cover 40 unique bibliography
entries in first-use order. Every key appears in the
canonical bibliography. The historical Fine v2 §1.6 and
the Fine–Krasnov–Panov volume-action Theorem 4.14 retain
their scope and respective keys. The new block imports no
additional citation.

The protected round section at 8960–9087, from its section
command to the byte before the next section, is exactly
4,501 bytes, SHA-256
c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab.
Only this review and its return were written. The frozen
source is released to the lead. The audit used static source
inspection and the assessed records.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E233 request](../research-progress/handoffs/SP4-CME-E233_REQUEST_v1.md) | 9960b47907b3740ae34d281a44ad7eb08fa3afd8261a6fb5dc30157a6e31a48d |
| [Frozen TeX](../manuscript/chiral_curvature_and_metric_evolution.tex) | cfb5d31cf53a72fce43ef5a67c5d55781c489ff20d5f49390d09baa94608c7fc |
| [E223/E225 assessment](E223_E225_ENDPOINT_ABSORPTION_ASSESSMENT_20261123.md) | 14961be53f583c551e95b62cf5999ff81aea7d15b09e64fa9748a08b0b000aaf |
| [E227/E228 assessment](E227_E228_STRICT_INTERIOR_ASSESSMENT_20261123.md) | 16458a62ed6815997714b34e648157b6cfbe573915b047b87f6fea30f12e6219 |
| [E227 derivation](../notes/227_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md) | f3d777307b40ea66d74f8f06432d08b839ab75e2c2804d3b1584ec91749e0412 |
| [E228 audit](E228_STRICT_INTERIOR_ABSORPTION_AUDIT_20261123.md) | ab69acd97a9a4b3d255f537f773cf1afe02408f9c1299311da7b8325f0250e2e |
| [E224 audit](E224_SHARP_SPECTRAL_MANUSCRIPT_AUDIT_20261123.md) | bab76eb526e25b2ae9207ee306f2e41da09e7ec49d764be255c994f797c9684c |
