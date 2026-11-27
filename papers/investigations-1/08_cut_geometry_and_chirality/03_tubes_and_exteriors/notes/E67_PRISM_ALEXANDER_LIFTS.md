# SP4-CUT-TUBE-E67 · Alexander evaluations from the marked lens lifts

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable.
[Frozen E67 request](../research-progress/handoffs/E67_REQUEST_R1.md),
checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. The input notes are
[E39](E39_PRISM_FILLINGS.md), [E54](E54_UNDERLYING_SLOPES.md) and
[the marked lens core](MARKED_LENS_CORE.md), with SHA-256 prefixes
566185d2f1c515a7, f82f1f43cf7455598 and d5817f7351ef7b91, respectively.
The calculation uses the marked smooth oriented three-dimensional exteriors
and the indicated order-two branching.

Let \(L=S_0\cup U\subset S^3\) be the link in the meridional filling, with
\(U\) unknotted and \(\operatorname{lk}(S_0,U)=3\) after choosing component
orientations. Use the reciprocal integral representative of its two-variable
Alexander polynomial and put \(\Delta_L(-1,y)=p(y+y^{-1})\).
With the overall sign chosen by \(p(-2)=17\), the evaluations give
\[
 p(1)=2,\qquad p(2)\equiv5\pmod8,\qquad
 p(0)\equiv3\pmod4,\qquad \det K_1=p(0)^2,
\]
where \(K_1\) is the single lifted singular knot in the ordinary universal
cover of the \(+2\) filling. Also \(\det S_0=|p(2)|\), so \(S_0\) is
nontrivial and the \(C_2\) possibility for the first marked orbifold
is excluded. These determinant conditions still permit the odd-dihedral
case there and the cyclic case for the second filling.

## The actual covers

Use \((\mu_U,\lambda_U)\) on \(U\), with \(\lambda_U\) the zero longitude,
and use \(\mu_S\) for the other meridian. The \(+n\) filling kills
\(n\mu_U+\lambda_U\), with \([\lambda_U]=3[\mu_S]\) before filling.
The ordinary lens space is denoted \(M_n\), the old singular knot in it is
\(S_n\), and the singular link in its ordinary universal cover \(S^3\)
is \(B_n\). The ambient homology class of \(S_n\) is \(3[\mu_U]\).
Consequently \(B_3\) has three components each of degree one over \(S_3\),
and \(B_2=K_1\) is a single component of degree two over \(S_2\).
[Underlying slope calculation](E54_UNDERLYING_SLOPES.md)
· [Marked lens core](MARKED_LENS_CORE.md).

For \(n=3\) the ordinary cover underlies the orbifold cover associated to
\[
 K=Q_8\times_{\{\pm1\}}Q_{68}\ \subset\
 \Lambda=T^*\times_{\{\pm1\}}Q_{68}.
\]
Indeed killing the old singular-meridian stabilizers has kernel \(K\)
and quotient \(C_3\). Those stabilizers are contained in \(K\), so the
induced map of underlying manifolds is the ordinary \(C_3\)-cover, also
over the singular circle. The parity of the right factor is odd on
every old local stabilizer of order two. Hence its restriction to \(K\)
defines the double cover branched along all three components of \(B_3\).
Its kernel \(Q_8\times C_{17}\) acts freely, and
\[
 \Sigma_2(B_3)=(Q_8\times C_{17})\backslash S^3,\qquad
 H_1(\Sigma_2(B_3);\mathbb Z)=(C_2)^2\times C_{17}.
\]
The same parity on \(\Lambda\) gives
\(X_0=(T^*\times C_{17})\backslash S^3\), double branched over \(S_3\) in
\(M_3\), with \(|H_1(X_0;\mathbb Z)|=51\).
[E39, orbit quotient](E39_PRISM_FILLINGS.md)
· [E54, normal closure of stabilizers](E54_UNDERLYING_SLOPES.md#underlying-quotient-and-its-singular-circle).

## The sign cover of the two-component link

The sign character of \(L\) takes \(\mu_S,\mu_U\) to \(-1\).
It extends over \(+3\) on \(U\), since \(\mu_U^3\lambda_U\) has sign
\(+1\). It is the unique character of the filled exterior with values
in \(\{\pm1\}\) sending \(\mu_S\) to \(-1\), because the filling relation
forces the sign on \(\mu_U\). The \(+3\) filling core can be represented
by \(\mu_U^{\pm1}\) and has sign \(-1\). Thus it has a single lift in
\(X_0\). Remove a neighborhood of that lift to obtain \(N\), a rational
homology solid torus and the double cover of
\(V=S^3\setminus\operatorname{int}\nu U\) branched along \(S_0\).

On the torus of \(N\) the covering image is the index-two lattice of
pairs with even coordinate sum, since \(\lambda_U\) also has sign \(-1\).
The filling slopes giving \(X_0\) and \(\Sigma_2(L)\) project, respectively,
to \(3\mu_U+\lambda_U\) and \(2\mu_U\). In the first filling the base
meridian has trivial sign and lifts primitively. In the second, the
normal map to the meridional filling is the order-two branched map,
and the first closed lift of the meridian projects to \(2\mu_U\).
The projection \(H_1(N;\mathbb Q)\to H_1(V;\mathbb Q)\) is nonzero since
the first slope projects to \(3[\mu_U]\) in \(V\), so it is an isomorphism.
The free integral homology coordinates of the two slopes in \(N\)
therefore have absolute ratio \(3:2\). Filling \(N\) along a slope of
nonzero free coordinate \(m\) gives homology of order
\(|m|\,|\operatorname{Tor}H_1(N;\mathbb Z)|\) by taking the quotient by
that slope. Therefore
\[
 |H_1(\Sigma_2(L);\mathbb Z)|=\frac23|H_1(X_0;\mathbb Z)|=34.
\]

## Torsion normalizations and the lens filling factors

For a link \(B\subset S^3\), write \(E_B\) for its exterior and \(\omega\)
for the sign character sending every meridian to \(-1\). If the double
branched cover has finite first homology, its sign-twisted exterior
complex is acyclic over \(\mathbb C\). Indeed the sign-twisted homology
is the anti-invariant homology of the unbranched double cover. The
lifted boundary tori and the filled solid tori have trivial action on
homology, so taking anti-invariants in the gluing sequence identifies
the anti-invariant homology before and after filling. The closed cover
is a rational homology sphere and its involution preserves orientation.

In the convention that a circle of monodromy \(z\) has torsion
\((z-1)^{-1}\), the modulus obeys
\[
 |H_1(\Sigma_2(B);\mathbb Z)|=2\,|\tau(E_B,\omega)|.
 \tag{1}
\]
For \(r\ge2\) components the strictly cyclic degree-two case of
Mayberry–Murasugi gives the homology order as
\(2^{r-1}|\Delta_B(-1,\ldots,-1)/2^{r-2}|=
2|\Delta_B(-1,\ldots,-1)|\). The exterior torsion at sign is the
absolute value of this multivariable Alexander evaluation.
Equivalently the one-variable Alexander polynomial for the cyclic
map sending all meridians to \(t\) is
\((t-1)\Delta_B(t,\ldots,t)\) up to a unit in \(\mathbb Z[t^{\pm1}]\).
This factor follows by computing the cyclic torsion both by specialization
and as the one-variable Alexander order divided by \(t-1\).
For a knot the Fox formula gives the usual \(|\Delta_B(-1)|\) for the
branched cover and the exterior torsion is \(|\Delta_B(-1)|/2\).
[Turaev, *Reidemeister torsion in knot theory*, Theorems 1.1.1–1.1.3 and
§2.3 on specialization](https://doi.org/10.1070/RM1986v041n01ABEH003204)
· [Mayberry–Murasugi, introduction, Definition 11.1 and Proposition 11.7](https://doi.org/10.1090/S0002-9947-1982-0648083-1).

Let \(E_n=M_n\setminus\operatorname{int}\nu S_n\). A character \(\chi_y\)
of \(E_n\) with meridian values
\((\chi_y(\mu_S),\chi_y(\mu_U))=(-1,y)\) exists exactly when \(y^n=-1\).
The \(n\) such characters differ by the deck characters of the ordinary
lens cover. All restrict to the sign character of \(E_{B_n}\).
Each lift meridian maps to an old meridian because the ambient lens
cover is locally unbranched along \(S_n\). The pushforward of the sign
local system is the direct sum of these \(n\) characters, by Fourier
decomposition of the cyclic deck factor after tensoring by any one of
the extending characters. With unitary fibre bases the Fourier
change has determinant of modulus one. Thus multiplying the torsions
of these summands gives exactly \(|\tau(E_{B_n},\omega)|\).
Acyclicity holds for \(n=3\) by the computed closed cover and for
\(n=2\) because the determinant of a knot is odd and nonzero
(\(\Delta_B(-1)\equiv\Delta_B(1)=1\bmod 2\)). It therefore holds for
each summand.

The attached solid torus in \(E_n\) has core monodromy \(y^{\pm1}\).
Its torsion modulus is \(1/|y-1|\). The gluing torus is acyclic and has
torsion modulus one. The unfilled exterior \(E_L\) is acyclic at each
of these characters by the twisted homology gluing sequence.
Gluing and Alexander specialization give
\[
 |\tau(E_n,\chi_y)|=\frac{|\tau(E_L,\chi_y)|}{|y-1|}
   =\frac{|\Delta_L(-1,y)|}{|y-1|}.
\]
In the last equality \(E_L\) has first Betti number two. The
specialization can also be read from its Alexander minors: delete
the row for a meridional generator with image \(x\) from the
\(2\)-cell boundary matrix of a one-vertex spine. Its determinant is
\((x-1)\Delta_L(x,y)\) up to a unit, and the torsion divides by \(x-1\),
which stays nonzero here. At every evaluation the unit factors have
absolute value one. [Turaev, Theorem 0.2.3, Lemma 1.3.3 and §2.3](https://doi.org/10.1070/RM1986v041n01ABEH003204).

Finally \(\prod_{y^n=-1}|1-y|=2\). This product cancels the factor
of two in (1), leaving
\[
 |H_1(\Sigma_2(B_n);\mathbb Z)|
   =\prod_{y^n=-1}|\Delta_L(-1,y)|,\qquad n=2,3.
 \tag{2}
\]

## Integral reciprocal centering and consequences

Torres specialization gives
\(\Delta_L(1,y)\doteq 1+y+y^2\) and
\(\Delta_L(x,1)\doteq(1+x+x^2)\Delta_{S_0}(x)\), where
\(\doteq\) denotes equality up to an integral monomial unit.
Both specializations have even breadth and are nonzero at \(1\).
In the reciprocal relation
\[
 \Delta_L(x^{-1},y^{-1})=\epsilon x^a y^b\Delta_L(x,y),
\]
evaluating at \((1,1)\) gives \(\epsilon=+1\). At \(x=1\) and \(y=1\)
the extreme degrees force \(b\) and \(a\), respectively, to be even.
Multiplication by \(x^{a/2}y^{b/2}\) gives exact reciprocity in the
integral Laurent ring. Hence \(P(y)=\Delta_L(-1,y)\) satisfies
\(P(y^{-1})=P(y)\), and the recurrence for \(y^j+y^{-j}\) gives
\(P(y)=p(y+y^{-1})\) with \(p\in\mathbb Z[v]\).
[Guillermo Torres, *On the Alexander polynomial*, Chapter II,
Theorems 2–3](https://www.maths.ed.ac.uk/~v1ranick/papers/torres.pdf).

Now (1) for \(L\) and the computation of \(34\) give \(|p(-2)|=17\).
The three roots of \(y^3=-1\) have reciprocal sums \(-2,1,1\).
Equation (2) and the homology of \(\Sigma_2(B_3)\) give
\(68=17|p(1)|^2\). Choosing the sign \(p(-2)=17\) fixes \(p(1)=2\),
because \(p(1)\equiv p(-2)\pmod3\). The roots of \(y^2=-1\) are
\(\pm i\), both with reciprocal sum zero, proving
\(\det K_1=p(0)^2\).

In the symmetric normalization \(\Delta_L(1,y)=\pm(y+1+y^{-1})\).
Reducing \(-1\) to \(1\) in the first variable gives
\(p(v)\equiv v+1\bmod 2\) as a polynomial, since the substitution
\(v=y+y^{-1}\) is injective over \(\mathbb F_2\) by the top Laurent
degree. Write \(p(v)=\sum_j a_jv^j\). Then \(a_1\) is odd and
\[
 p(2)-p(-2)\equiv 4a_1\equiv4\pmod8,\qquad
 p(-2)-p(0)\equiv -2a_1\equiv2\pmod4.
\]
At \(y=1\) the Torres multiplier in the \(x\) specialization has
absolute value one at \(x=-1\), so \(p(2)\) has absolute value
\(\det S_0\). Thus \(\det S_0\equiv3\) or \(5\pmod8\), which rules out
the order-two cyclic orbifold group of the \(S^3\) filling by its
index-two branched cover. For the \(+2\) filling the desired cyclic
group requires \(\det K_1=1\), hence \(p(0)=-1\) in this normalization.
The arithmetic alone permits that value, for example
\(4v^2-v-1\) meets these polynomial evaluation and congruence conditions.
