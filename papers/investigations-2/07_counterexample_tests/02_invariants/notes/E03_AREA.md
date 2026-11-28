# WIN-E03b · Positive direction area at one standard-sphere marking

28 November 2026 UTC, 27 November in America/New_York. Prepared for Edward
B. Baker III with OpenAI Codex assistance. The [frozen request, revision 1](../research-progress/handoffs/REQUEST_E01_E03_R1.md)
specifies gpt-6.2-sol, ultra. Actual serving model and effort are unavailable.
Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. Input SHA-256 prefixes
identify the inspected bytes, including the working-tree request and B02.

| Input | SHA-256 prefix |
| --- | --- |
| [WIN request R1](../research-progress/handoffs/REQUEST_E01_E03_R1.md) and [WIN-B02](../brainstorm/notes/B02_POLE_OBSERVABLE.md) | `53a06ded6dcd3173`, `6a1b03781ed15260` |
| [POLE A1](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md) and [POLE E04](../../../01_chiral_transfer_and_pole_forms/notes/E04_REALIZATION.md) | `db13563024da1a55`, `0dc61bfb07a67b35a` |
| [POLE E06 argument in the E04 replay](../../../01_chiral_transfer_and_pole_forms/reviews/E04_REPLAY.md#sp4-pole-e06--a-degenerate-zero-on-the-standard-sphere) and [independent E06 replay](../../../01_chiral_transfer_and_pole_forms/reviews/E06_REPLAY.md) | `caebe2ed12ee24b1`, `88b24fb83bdf114c` |
| [ZERO B02](../../../02_zero_circles/brainstorm/notes/B02_INCIDENCE.md) and [its replay including local sources](../../../02_zero_circles/reviews/B02_E03_REPLAY.md) | `19f78ee39e22567b`, `5705f73a4f983bcb` |

**Working project theorem.** On the oriented standard smooth \(S^4\) with
the same pole \(p\), a smooth Riemannian conformal class realizing the
prescribed relative one-circle insertion has positive probability area of
directions with zeros. The round class has area zero. A boundary-norm
estimate below gives a projective disk of directions with zeros at the
fixed realized class. This distinguishes the two objects under oriented
conformal equivalence carrying the marked point. It uses POLE A1 and E04
at their recorded evidence levels. The finite packet ends with this
same-sphere comparison, pending its own non-author replay.

## The observable and its measure

Fix a smooth oriented Riemannian conformal class \(c\) and pole \(p\) on a
smooth homotopy four-sphere \(M\). Use the A1 leading coefficient space
\(U=\Lambda^-_{c,p}\) with any representative inner product and write
\(A(q)u=\omega_{p,u}(q)\in E_q=\Lambda^+_{c,q}\) on \(X=M\setminus\{p\}\).
Linearity follows from uniqueness and the linear pole equation. In an
inverted normal chart the three A1 expansions give a common end on which
\(A(q)\) is injective by uniform closeness to the constant leading
inclusion into two-forms. Thus

\[
D(c,p)=\{[u]\in\mathbb P(U): A(q)u=0 \text{ for some }q\in X\}
\]

is compact as the projection of the closed incidence relation on the
product of a compact truncation and \(\mathbb P(U)\). This is ZERO B02's
incidence argument, and makes the set Borel measurable.

Let \(\mu\) be the pushforward of the area on the unit two-sphere of \(U\)
divided by \(4\pi\) under the antipodal quotient. An open projective disk
of angular radius \(0<\alpha\le\pi/2\) pulls back to the two open caps of
radius \(\alpha\), so its probability is \(1-\cos\alpha\). The normalization
is independent of rotations, orthonormal frames and uniform norm scaling.
In POLE A1 §4, changing \(g\) to \(e^{2\phi}g\) scales the leading tensor
of every fixed pole form by the same factor \(e^{4\phi(p)}\), and rescales
the inner product of two-forms at \(p\) by \(e^{-4\phi(p)}\). Thus the
projective direction and probability are independent of the representative.

If \(F:(M,c,p)\to (M',c',p')\) is an orientation-preserving conformal
diffeomorphism with \(F(p)=p'\), use a representative \(g'\) and its pullback
\(F^*g'\). The map is then an isometry, intertwines the normal coordinates
used in A1 when their bases are transported, and maps the leading
coefficient by \(F^*\) at \(p\). Pullback preserves closedness and
self-duality and takes \(\omega_{p',u}\) to \(\omega_{p,F^*u}\) by A1
uniqueness. It therefore takes \(D(c',p')\) to \(D(c,p)\) by an orthogonal
projective identification for these representatives and preserves \(\mu(D)\).

## The insertion and the two markings

Start on the standard \(S^4\) with a positive compactifying chart \(y\) at
\(p\), chosen so that \(x=y/|y|^2\) extends to a stereographic chart on \(X\).
Its numerical orientation is opposite to the inherited orientation.
Reflect the numerical \(x\) coordinates by a fixed Euclidean orthogonal
map to the positive complex coordinates \(z,w\) for the insertion. This
preserves the geometric orientation and makes Taubes's standard form
\(\beta=(i/2)(dz\wedge d\bar z+dw\wedge d\bar w)\) an end form of positive
chirality. The leading A1 tensor of \(\beta\) in \(y\) has the constant
coefficients of \(\beta\) in \(x\) and negative chirality at \(p\).

**Primary passage checked.** Clifford Henry Taubes, *A proof of a theorem of
Luttinger and Simpson about the number of vanishing circles of a near-symplectic
form on a 4-dimensional manifold*, Math. Res. Lett. **13** (2006), 557–570,
DOI `10.4310/MRL.2006.v13.n4.a6`. Publisher PDF §2, pp. 558–560,
Proposition 2.1 and Parts 1–5, read 28 November 2026 UTC. Proposition 2.1
allows \(n=0\) on a smooth oriented four-manifold. Its proof starts from
the standard symplectic form in a chart away from any previous zeros,
gives the local model (2.2), (2.5), and restores the constant form on
\(r\ge32\delta\) in Part 5. The printed annular formulas contain the
matching errors recorded by the ZERO replay. In particular the saturated
coefficient from (2.7) is \(1-\epsilon\), and (2.12) needs the factor
\(T^{-1}\). The corrected positivity and matching check is given below.
[Publisher PDF](https://archive.intlpress.com/site/pub/files/_fulltext/journals/mrl/2006/0013/0004/MRL-2006-0013-0004-a006.pdf#page=2)

On the inner ball \(r<\delta=\sqrt{2\epsilon}\), the inserted form is
\(T^{-1}\mu_{\rm core}\), where \(\mu_{\rm core}\) has coefficients
\[
\bigl(-\epsilon+|z|^2-|w|^2,\ -\operatorname{Im}(zw-R\bar w),
       \operatorname{Re}(zw-R\bar w)\bigr)
\]
in the Euclidean self-dual basis
\((\beta,\operatorname{Re}(dz\wedge dw),\operatorname{Im}(dz\wedge dw))\).
For \(R\) large the only zeros there have \(|z|^2=\epsilon,\ w=0\). The
radial \(z\) derivative of the first coefficient is nonzero. On the real
\(w\)-plane the derivative of the complex coefficient is
\(v\mapsto zv-R\bar v\) of real determinant \(\epsilon-R^2\), which is
nonzero. Thus the derivative has the full Euclidean self-dual plane as its
image at every point of the circle. This verifies E04's wedge positivity
as well as transversality.

By E04, realize this same closed form as self-dual for a smooth conformal
class \(c_1\) on the original \(S^4\) with representative Euclidean in
\(y\) near \(p\). The compatible Euclidean class in the inner ball can also
be prescribed on a smaller region there by E04's relative patching. For
the calculation below fix such a class and a representative Euclidean near
the chosen disk. With the exact constant end, A1 uniqueness identifies
the inserted form with the normalized pole for its leading coefficient.
Use \(u_0\) for the unit vector on that coefficient ray. Transversality of
the zero is a property of the intrinsic derivative, and \(A(q)u_0\) has
the same zero circle with rank three. The inputs from POLE E06 are the
prescribed end and transverse insertion endpoint.

For the round class \(c_{\rm rd}\), the stereographic metric is conformal
to the Euclidean one on \(X\). Inversion is conformal, so the round class
also has a representative equal to \(\delta_y\) near \(p\). Every constant
self-dual two-form in the
geometrically oriented Euclidean chart is closed, has its specified
nonzero A1 leading coefficient, and is nowhere zero. This exhausts the
projective directions by A1 and gives \(D(c_{\rm rd},p)=\varnothing\).

## Degree on the transverse disk and the lower bound

Choose one point \(q_0\) on the inserted circle and a sufficiently small
closed three-disk \(K\) in \(X\) through \(q_0\), tangent to a complement of
the derivative kernel. Choose a smooth orthonormal frame for \(E\) over
\(K\), for any fixed smooth target metric in \(c_1\) inducing its two-form
norm. The derivative of \(q\mapsto A(q)u_0\) restricted to this disk is an
isomorphism at the zero. The inverse function theorem permits \(K\) small
enough that \(q_0\) is the unique zero there, with local Brouwer degree
\(+1\) or \(-1\) in the frame. Define the boundary data

\[
 m=\min_{q\in\partial K}|A(q)u_0|>0,\qquad
 M=\max_{q\in\partial K}\|A(q)|_{u_0^\perp}\|_{\rm op}<\infty.
\]

For a projective direction at angle \(\theta<\pi/2\) from \([u_0]\), use
the coefficient representative \(u_0+\tan(\theta)v\) with \(v\) a unit
vector perpendicular to \(u_0\) when \(\theta>0\). On \(\partial K\) the
straight homotopy from \(A(q)u_0\) to \(A(q)(u_0+\tan(\theta)v)\) stays
nonzero whenever \(M\tan\theta<m\). Its degree about zero is consequently
the same nonzero integer, so the perturbed direction has a zero in the
interior of \(K\). This proves the containment of the open disk of radius
\(\arctan(m/M)\) in \(D(c_1,p)\), with radius \(\pi/2\) when \(M=0\).
The complete probability estimate, with the same convention at \(M=0\), is

\[
 \mu(D(c_1,p))\ \ge\ 1-\frac{M}{\sqrt{M^2+m^2}}\ >\ 0
       =\mu(D(c_{\rm rd},p)).
\]

For explicit input bounds, one may use \(q_0=(\sqrt\epsilon,0)\) in the
complex coordinates and the affine disk \(z=\sqrt\epsilon+t,\ t\in\mathbb R\),
\(t^2+|w|^2\le a^2\). Choose \(0<a<\min(\delta-\sqrt\epsilon,s)\) where
\(s=\min(2\sqrt\epsilon,R-\sqrt\epsilon)\). Then \(K\) lies inside the inner
ball and meets the zero circle only at \(q_0\). The smallest singular value
of the linear coefficient map in \((t,\operatorname{Re}w,\operatorname{Im}w)\)
is \(s\). The quadratic error has squared norm
\((t^2-|w|^2)^2+t^2|w|^2\le (t^2+|w|^2)^2\). With the Euclidean target
representative on \(K\) the basis above has norms \(\sqrt 2\). Dividing
the end coefficient by its pole-space norm \(\sqrt 2\) gives
\(m\ge (sa-a^2)/T\). Any certified upper bound \(\overline M\) for the
operator norm on the two perpendicular directions on \(\partial K\)
can therefore be used with \(\underline m=(sa-a^2)/T\) in the displayed
probability estimate. For example, if \(M_1,M_2\) bound the respective
boundary norms of the forms for an orthonormal basis of \(u_0^\perp\),
Cauchy–Schwarz gives \(\overline M=(M_1^2+M_2^2)^{1/2}\). Compactness
supplies finiteness of \(M\) and
suffices for strict positivity. A numerical size for the patch would
require a numerical bound on these other pole forms for the chosen
realized class. The result concerns the fixed conformal marking on the
standard sphere.

## Matching check for the relative insertion

Write \(\mu_{\rm core}=-\epsilon\beta+Q+RB\) using the degree-two and
degree-one forms \(Q,B\) from (2.2). For \(Q\), the derivative of the
diagonal coefficient cancels the derivatives of the \(zw\) and
\(\bar z\bar w\) terms. For \(B\), the differentiated \(\bar w,w\)
coefficients wedge to zero with the corresponding off-diagonal forms.
Fix a smooth nondecreasing
cutoff \(\gamma\) equal to zero on \([0,1]\) and one on \([2,\infty)\),
and let \(\gamma_b=\gamma(r^2/b^2)\). Use the Euclidean Euler field
\(\mathcal E\) and primitives \(\lambda=\iota_{\mathcal E}\beta/2\),
\(\tau=\iota_{\mathcal E}Q/4\), and \(\nu=\iota_{\mathcal E}B/3\).

1. On \(\delta\le r\le4\delta\), use
   \(T^{-1}(\mu_{\rm core}+d(\gamma_\delta\lambda))\). Set
   \(\vartheta=\gamma_\delta-\epsilon+|z|^2-|w|^2\). The radial derivative
   term \(d\gamma_\delta\wedge\lambda\) is decomposable of type \((1,1)\).
   After dropping \(T^{-2}\) and dividing by twice Euclidean volume, the
   square is \(\vartheta^2+\delta^{-2}\gamma' r^2\vartheta+\lvert zw-R\bar w\rvert^2\).
   Here \(\vartheta\ge\epsilon-2|w|^2\). For \(w\ne0\) the negative part
   of the middle term is bounded by \(32\|\gamma'\|_\infty|w|^2\) and is
   dominated by \((R-4\delta)^2|w|^2\) for large \(R\). When \(w=0\),
   \(\vartheta>0\).
2. On \(4\delta\le r\le8\delta\), use
   \(T^{-1}((1-\epsilon)\beta+RB+d((1-\gamma_{4\delta})\tau))\).
   The self-dual part before the cutoff term has norm at least
   \(\sqrt2(1-\epsilon)\) by the pointwise orthogonality of \(B\) to
   \(\beta\). The added term has norm \(O(\delta^2)\) with a fixed cutoff,
   so its anti-self-dual norm is strictly smaller than the resulting
   self-dual norm for small \(\delta\).
3. On \(8\delta\le r\le16\delta\), use
   \(d(\chi_{8\delta}\lambda)+(R/T)B\) with \(\chi_{8\delta}\) a
   nondecreasing smooth profile in \(r^2/(8\delta)^2\), constant equal
   to \(T^{-1}(1-\epsilon)\) up to argument one and equal to \(1\)
   from argument two. The first summand is a positive \((1,1)\) form,
   the mixed wedge with \(B\) vanishes by type, and \(B\wedge B\) is
   nonnegative.
4. On \(r\ge16\delta\), use \(\beta+(R/T)d((1-\gamma_{16\delta})\nu)\).
   The difference has norm \(O(R\delta/T)\) with fixed cutoff and vanishes
   from \(32\delta\) on. Choose \(T\) sufficiently large to preserve positive
   square on this last annulus.

All transitions match smoothly because the cutoffs are smooth and constant
on the adjoining sides where used. These expressions recover the support and
positivity used in the insertion above. [Taubes, §2, Parts 2–5, pp. 559–560](https://archive.intlpress.com/site/pub/files/_fulltext/journals/mrl/2006/0013/0004/MRL-2006-0013-0004-a006.pdf#page=3) · [ZERO replay, corrected annuli](../../../02_zero_circles/reviews/B02_E03_REPLAY.md#e03--local-models-and-source-qualifications)
