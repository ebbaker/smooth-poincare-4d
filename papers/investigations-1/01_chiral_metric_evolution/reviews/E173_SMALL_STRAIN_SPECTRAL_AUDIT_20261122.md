# E173 Independent small-strain spectral audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Fixed E audit under B86, configured gpt-6.2-sol/ultra.
Independent runtime and lead-model attestation unavailable. I authored
the relevant E145 transport-density, E155 first-derivative and E157
limiting-rank inputs. I did not author E171 or E159. The checks below
recompute E171's new single-slice argument. No new primary source was
inspected.

## Disposition

Pass. In E171's positive-plane round-compatible definite component,
on a smooth closed connected simply connected oriented four-manifold
with \(H^2(M;\mathbb R)=0\), the stated universal threshold for
\(\sup\mathcal G\) gives \(|Q-I|\le72\mathcal G\) pointwise and
\(\operatorname{Ric}_g\ge \tfrac34g\) in native normalization. The
floor-free Hessian, polynomial, rank-one exclusion, native Ricci
estimate and real-density conversion all agree. No correction to
the mathematical statement or proof is needed.
[E171](../notes/171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md).

## Full covariant Hessian and alternation

Set \(P_X=S^{-1}D_X^AS\) and \(U_X=(P_X+P_X^{\mathsf T})/2\).
Differentiating \(S^2=Q\) gives \(D_X^AQ=2SU_XS\). Thus
\(\operatorname{tr}(QU_X)=0\) by trace-three normalization.
Since \(T_X=(U_X)_0\), this gives
\(U_X=T_X-\operatorname{tr}(QT_X)I/3\). Positivity and trace three
imply \(|Q-I|^2\le6\), so
\[
 |U_X|^2=|T_X|^2+
           \tfrac13|\operatorname{tr}((Q-I)T_X)|^2
        \le3|T_X|^2.
\]
In an \(S\)-eigenframe \(P_{X,ij}=2s_j U_{X,ij}/(s_i+s_j)\).
Its skew entries are \((s_j-s_i)T_{X,ij}/(s_i+s_j)\) for \(i\ne j\).
All these ratios have magnitude at most one. Orthogonality of
symmetric and skew matrices gives \(|P|\le2|T|\), and
\(\|S\|_{\mathrm{op}}\le\sqrt3\) gives
\(|D^AS|\le2\sqrt3|T|\). These estimates are uniform as a positive
eigenvalue tends to zero.

On symmetric matrices let \(\mathscr S(B)=SBS\) and let \(\Pi\) denote
orthogonal projection to \(S^\perp\). Since
\(\mathscr S^{1/2}I=S\) and \(|S|^2=3\),
\[
 \mathscr S^{1/2}\Pi\mathscr S^{1/2}T_X
       = ST_XS-\tfrac13\operatorname{tr}(QT_X)Q=\tfrac12D_X^AQ.
\]
Its operator norm is at most \(\|\mathscr S\|\le3\).
Consequently \(|D^AQ|\le6|T|\) in the sum over the base slot.
This also verifies the earlier E155 estimate used here.

Use the live Levi–Civita derivative on the \(X\) slot of \(T\).
For \(H=(\nabla_Y^AT)_X\), trace-freeness gives
\(|H-\operatorname{tr}(QH)I/3|\le\sqrt3|H|\).
The other product-rule term in the derivative of \(U_X\) is
\(-\operatorname{tr}((D_Y^AQ)T_X)I/3\). Its norm after summing
the independent \(X,Y\) slots is at most
\(|D^AQ||T|/\sqrt3\). With \(x=|\nabla^AT|\) and \(y=|T|^2\),
this proves \(|\nabla^AU|\le\sqrt3 x+2\sqrt3 y\).
The product rule on \(2SU_XS\), with both \(D S\) factors and the
middle \(\nabla U\) term, yields
\[
 |\nabla^{2,A}Q|
   \le 4\|S\|_{\mathrm{op}}|D^AS||U|
                   +2\|S\|_{\mathrm{op}}^2|\nabla^AU|
   \le 6\sqrt3\,x+36\sqrt3\,y.
\]
The two outer terms contribute \(24\sqrt3\,y\) together.
The middle term contributes \(6\sqrt3\,x+12\sqrt3\,y\).
The Hessian here includes all ordered base slots.

For each unordered pair \(a<b\) the covariant exterior
second derivative is the difference of the corresponding
ordered Hessian entries by torsion-freeness. This is the
curvature on the internal endomorphism \(Q\), namely
\(\mathcal C=[\operatorname{ad}(F_A),Q]\). No base curvature
acts on \(Q\), an internal endomorphism with no base slots.
The estimate
\(\sum_{a<b}|H_{ab}-H_{ba}|^2\le2\sum_{a,b}|H_{ab}|^2\)
gives exactly the factor \(\sqrt2\) for the ordinary two-form
norm. Hence \(|\mathcal C|\le6\sqrt6\,x+36\sqrt6\,y\le
C_{\mathcal C}\mathcal G\) with \(C_{\mathcal C}=36\sqrt6\).

## Exact eigenvalue polynomial and branch separation

In a positive internal orthonormal eigenframe, \(J_i=\operatorname{ad}(e_i)\)
rotates the complementary plane with coefficient \(1/\sqrt2\).
In that plane \([J_i,Q]\) has two symmetric off-diagonal entries of
magnitude \(|\lambda_j-\lambda_k|/\sqrt2\). Squaring its Frobenius norm
therefore gives \((\lambda_j-\lambda_k)^2\), with no further factor.
The ordinary self-dual two-forms \(\sigma_i\) are orthonormal and
\(F_A=-\sum_i\sqrt{\lambda_i}\,\sigma_i e_i\). Thus
\[
 |\mathcal C|^2=\sum_{\mathrm{cyc}}\lambda_i(\lambda_j-\lambda_k)^2
        =\sum_{i\ne j}\lambda_i^2\lambda_j-6s_3
        =3s_2-9s_3,
 \qquad s_2=\sum_{i<j}\lambda_i\lambda_j,\quad
 s_3=\prod_i\lambda_i .
\]
The last identity follows by expanding \(3s_2=(\sum_i\lambda_i)s_2\).

On the closed nonnegative trace-three simplex every cyclic summand
is nonnegative. At rank three vanishing requires each complementary
difference to vanish, hence \((1,1,1)\). At rank two the value is
\(3\lambda_i\lambda_j>0\), and at rank one all terms vanish, yielding
the three vertices. Rank zero is excluded by the trace. The two open
neighborhoods \(U_R=\{|\lambda-(1,1,1)|_2<1/2\}\) and
\(U_L=\{\lambda_{\max}>5/2\}\) are disjoint since \(U_R\) has
\(\lambda_{\max}<3/2\). Their compact complement is nonempty,
for example it contains \((2,1,0)\), and all polynomial zeros are
in their interiors. The continuous polynomial thus has a positive
minimum \(p_*\) on the complement. With
\(\varepsilon_{\mathrm{sep}}=\sqrt{p_*}/(2C_{\mathcal C})\),
\(\mathcal P\le p_*/4\) globally. The two preimages are open
because \(|Q-I|\) and \(\lambda_{\max}\) are continuous,
and their disjoint union is the entire connected base.
This uses the nonnegative simplex only for an algebraic minimum.
The given connection still has \(Q>0\).

## Rank-one neighborhood and the projected curvature

On \(U_L\) the other two eigenvalues have sum \(<1/2\), and hence
the top gap exceeds two. The simple eigenline is smooth, for
example by the isolated spectral projection. Its unit-vector
bundle is a smooth two-sheeted cover. Choose a lift at one
basepoint and lift paths from that point. Simple connectivity
makes the result independent of the path. The cover charts
make this section \(v\) smooth. Differentiating \(Qv=\lambda v\)
and projecting gives
\[
 (\lambda I-Q)D_X^Av=\operatorname{pr}_{v^\perp}(D_X^AQ)v.
\]
Metricity gives \(D_X^Av\in v^\perp\) and the gap implies
\(|D^Av|\le |D^AQ|/2\le3|T|\), with Frobenius norm giving
the required bound on \((D_X^AQ)v\).

Orient \(v^\perp\) by the ordered frame \((v,e_1,e_2)\), so
the generator \(J_v=v\times\cdot\) sends \(e_1\) to \(e_2\).
Write \(\theta=\langle D^Ae_1,e_2\rangle\) and
\(\beta_i=\langle D^Av,e_i\rangle\). Pairing
\(D_X^AD_Y^Ae_1\) with \(e_2\) yields
\(X(\theta(Y))-\beta_1(Y)\beta_2(X)\).
Alternating \(X,Y\) and subtracting the bracket-of-vector-fields
term gives
\(\langle R^Ae_1,e_2\rangle=d\theta+\beta_1\wedge\beta_2\).
In the chosen orientation,
\(\langle [F_A,e_1],e_2\rangle=\langle F_A,v\rangle/\sqrt2\).
For the projected metric connection the local coefficients
are \(\theta\) and \(-\theta\), so its curvature is
\[
 R^\perp=\Omega J_v,\qquad
 \Omega=d\theta=\frac{\langle F_A,v\rangle}{\sqrt2}
                           -\beta_1\wedge\beta_2 .
\]
The factor \(1/\sqrt2\) belongs to the ambient Lie bracket,
while \(J_v\) is the unit positive rotation in the plane.
The scalar \(\Omega\) is global because \(J_v\) is. Local
\(d\theta\) yields closedness, and the two-form error is
the oriented plane-area pairing on \(D^Av\) with the
displayed minus sign.

The leading form \(\omega_0=-\sqrt{\lambda/2}\,\sigma(v)\)
is self-dual and \(|\omega_0|\ge\sqrt5/2\).
The ordinary two-form wedge norm gives
\[
 |\Omega-\omega_0|
 \le|\beta_1||\beta_2|\le\tfrac12|D^Av|^2
 \le\tfrac92 y\le\tfrac92\mathcal G.
\]
At \(\sup\mathcal G\le\varepsilon_{\mathrm{pl}}=\sqrt5/36\),
the error is at most \(\sqrt5/8\le|\omega_0|/4\).
Thus \(|\Omega^+|\ge3|\omega_0|/4\) and
\(|\Omega^-|\le|\omega_0|/4\). The wedge-square density
is at least \((9-1)|\omega_0|^2/16\ge5/8\).
Since \(H^2(M;\mathbb R)=0\), the smooth closed scalar
form \(\Omega\) is exact. If \(\Omega=d\alpha\), then
\(d(\alpha\wedge\Omega)=\Omega\wedge\Omega\).
Stokes on the closed oriented base forces zero integral,
contradicting the pointwise lower bound. The only topology
used in this exclusion is the global line orientation
and exactness of \(\Omega\).

## Round estimate, native curvature and real transport threshold

On \(U_R\), every \(\lambda_i\ge1/2\). The sum of the three
squared differences is \(3\sum_i(\lambda_i-1)^2\) by trace
three. Consequently \(\mathcal P\ge3|Q-I|^2/2\) and
\(\sqrt{2/3}\,C_{\mathcal C}=72\). This is a pointwise
bound with the live \(\mathcal G\) at the same point.

For the chiral estimate, the conversion from the old triple
of norm \(\sqrt2\) to the native ordinary orthonormal
self-dual triple changes the internal component by
\(\sqrt2\) and rescales the metric by \(c=2K\).
The old scalar target \(12K\) therefore becomes \(6\).
In the native chiral block \(\tfrac12(F_\Gamma+\sigma)\)
the scalar coefficient is \(-(s_g-6)/12\); its squared
three-dimensional matrix norm contributes \((s_g-6)^2/48\).
The trace-free Ricci off-diagonal block has squared norm
\(|\operatorname{Ric}_0|^2/4\). For example, diagonalize
\(\operatorname{Ric}_0\) with trace-free eigenvalues \(r_i\).
In opposite Hodge blocks the three coefficients from its
Kulkarni–Nomizu term have absolute values
\(|r_1+r_j|/2\), \(j=2,3,4\), whose squared sum is
\(\sum_i r_i^2/4\). These are the conventions of E159 (3).
The old coefficient \(K|Q-I|\) divides by \(c\), and the
two strain terms have the same scale degree \(c^{-1}\)
as the curvature, giving the stated native bound uniformly
on the positive cone.
[E159, (3)](../notes/159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md).

Using the pointwise pinching, its right side is bounded
by \(36(x+y)+6x+(42+8\sqrt3)y\le(78+8\sqrt3)\mathcal G=Z\).
For each native unit vector, \(\operatorname{Ric}(X,X)=
s_g/4+\operatorname{Ric}_0(X,X)\).
From the block norm,
\(|\operatorname{Ric}_0|\le2Z\) and
\(|s_g-6|\le4\sqrt3 Z\). The resulting directional bound
is \(3/2-(2+\sqrt3)Z\). In particular this uses
\(s_g/4\) in the directional calculation. The scalar
part would have a different coefficient in a full
Ricci tensor norm. The threshold
\[
 \varepsilon=\min\left\{
   \frac{\sqrt{p_*}}{2(36\sqrt6)},\ 
   \frac{\sqrt5}{36},\
   \frac{3}{4(2+\sqrt3)(78+8\sqrt3)}
                  \right\}
\]
is positive and suffices for the stated lower bound.

With \(k^2=4\pi/5\), \(C_0=4\sqrt3\) and
\(z=|\nabla^\Gamma T|\), the E145 moment and connection
comparison give \(\Psi=kz+k^2y\) and
\(x\le z+C_0y\). Since \(k\le1+C_0\),
\(\mathcal G=x+y\le z+(1+C_0)y\le
(1+C_0)\Psi/k^2\). Thus the uniform assumption
\(\sup_M\Psi\le k^2\varepsilon/(1+4\sqrt3)\) supplies
the same \(\sup_M\mathcal G\) threshold.
[E145, (6)](../notes/145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md).

The result is a static estimate for the stated existing smooth
connection. No supplied eigenvalue floor, diameter, Sobolev bound,
metric compactness or negative-chiral curvature estimate enters this
single-slice calculation. The audit stops before any subsequent
geometric, dynamical or existence consequence.

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E173 request v1](../research-progress/handoffs/SP4-CME-E173_REQUEST_v1.md) | 62f6a1961b92c93c1f142e51d1ef7bb3cb6a97a7e44ff043bd17ff6318390af1 |
| [E171](../notes/171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md) | 4fc28853a3866f7094aa67471c4e1df40f56ac4a516146a752fd33df624f7e60 |
| [B86](../brainstorm/notes/B86_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md) | 7162b240aed4478c8007a11f2a1f8f520c2601d7689da7b8cd804059c4a2825c |
| [E145](../notes/145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md) | 544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4 |
| [E155](../notes/155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md) | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |
| [E159](../notes/159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md) | eb5a66fc93fcf8e04e41870caa426e09399944be2a302b008befffb513851156 |
