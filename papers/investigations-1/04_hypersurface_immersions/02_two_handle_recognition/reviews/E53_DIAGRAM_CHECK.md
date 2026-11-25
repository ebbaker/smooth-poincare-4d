# E53dr · Independent check of the marked two-handle diagrams

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The actual serving model and reasoning
effort were unavailable. This bounded proof and source check used HEAD
b5de9758f16e14f22162b4a1e091166ea126c389 and the E51 height TeX
bundle SHA-256 6acf5b21c679170689a5fb1ef6e899746ad492760ed58ddd438f46b70ec1b39a.
The checked E53d TeX bundle SHA-256 is
f8995353a388aab08e9487f15ad04dc20539a3f9d2e412131a0cae640eb0f8de
and the checked note SHA-256 is
2a525c8496fea22065ad935f770bed017f727af6c3577f87058c68470a7f632c.
The bundle uses the E51 path-and-content convention.
[Derivation](../notes/E53_HEIGHT_DIAGRAMS.md)
· [Working draft](../manuscript/recognition_from_marked_morse_heights.tex)

**Assessment.** The two one-sided recognition tests and the mixed
belt-circle test are valid for the supplied marked diagrams. The mixed
first homology restrictions apply even before normalizing the lower
incidence row. The Mazur double illustrates the belt-circle test at a
specified cut with nontrivial fundamental group. Finding a height whose
actual ordered presentation satisfies one of the tests remains open.

## One-sided diagram

The actual zero-to-two-handle trace is attached along an integral
two-component framed link in \(S^3\) whose marked outgoing boundary is
\(Y_2=\#_2(S^1\times S^2)\). Its two-by-two surgery matrix has cokernel
of rank two, so the matrix vanishes over \(\mathbb Z\), including both
framings and the linking number. Framed slides preserve the trace with
transported gluing. Their effect does not change the right to apply the
integral surgery theorem to the actual moved link.

For tunnel number two, Meier–Schirmer–Zupan's Corollary 1.3(2) takes
\(c=2,k=0\). It adds one split zero-framed unknot and then slides to
the three-component zero-framed unlink. This addition is an actual
local 2–3 stabilization of the closed decomposition. In the new
\(S^1\times S^2\) connected summand the belt circle is
\(S^1\times\{q\}\) and the new 3-handle sphere is
\(\{z\}\times S^2\). They meet transversely once. A connected-sum
ball can be chosen disjoint from them and from the old collars,
so this local cancellation leaves the old closed manifold and
markings outside the stabilization neighborhood. Dually, the upper
body acquires one 1-handle and is \(\natural_3(S^1\times D^3)\).
The moved zero-framed unlink trace is \(\natural_3(S^2\times D^2)\).
Laudenbach–Poénaru Theorem A recognizes their gluing for any actual
boundary diffeomorphism, including the transported one.
[Meier–Schirmer–Zupan, §6, Corollary 1.3 and proof](https://arxiv.org/pdf/1507.06561#page=11)
· [Laudenbach–Poénaru, Theorems A and A'](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

For a generalized square knot \(T_{p,q}\#T_{-p,q}\) with coprime
\(p,q\ge2\), Meier–Zupan Theorem 1.1 applies to the actual closed
homotopy sphere because its marked presentation has no 1-handles and
two 2-handles, one with that core. Its conclusion identifies the
closed manifold directly. Theorem 1.2 bounds the number of
introduced Hopf pairs by two, with the definition of Weak Property
\(2R\) also permitting split zero-framed unknots. This requires a
generalized square knot on the actual diagram after the chosen
slides.
[Meier–Zupan, *J. Differential Geom.* 122 (2022), pp. 70–71, Theorems 1.1–1.2](https://par.nsf.gov/servlets/purl/10464744)

## Mixed diagram and the inverse trace

Write \(P=S^1\times D^3\), \(W=P\cup h_1^2\), \(Y=\partial W\).
Assume the subsequent attaching circle is ambient isotopic in the
actual \(Y\) to the belt circle \(B\) of \(h_1^2\). Extend the
isotopy over the outgoing collar, transporting the normal framing.
The belt circle bounds the co-core disk inside \(W\), so this second
attachment imposes the trivial relation on \(\pi_1(W)\). The higher
handles leave \(\pi_1\) unchanged. Thus the first attaching circle's
winding \(a\) in \(\partial P\) satisfies \(\mathbb Z/a=1\) and
\(a=\pm1\).

The geometric meridian in the proof really is a representative of
\(B\). Draw the first attaching knot \(K\) in an exterior diagram
for the dotted unknot \(U\), and push a small meridian of \(K\) into
its exterior in a ball avoiding \(U\). In the boundary surgery,
replace the dot by a zero coefficient solely to describe the actual
three-manifold. The filled meridian slope on the \(K\) torus is
\(\lambda_K+d\mu_K\) for integer \(d\). The pushed meridian meets
it once, so in the new solid torus that primitive transverse slope
is isotopic to the filling core. That core is \(B\). This local
isotopy takes place in the filling solid torus for any \(Y\)
in the stated presentation.

For either attaching tube, the given second one or the reverse of
the first trace, use the same pushed meridian and its exterior
normal framing. Its integer twist \(b\) appears in the full
boundary-surgery matrix
\[
 \begin{pmatrix}
 0&a&0\\ a&d&1\\ 0&1&b
 \end{pmatrix}.
\]
The determinant is \(-a^2b\). Both outgoing boundaries have rank-one
first homology. The actual outgoing boundary is the boundary of the
upper one-handlebody and the reversed trace returns to \(\partial P\).
Since \(a\ne0\), both framings are \(b=0\) in the same coordinates.
This identifies the framed tubes. The resulting
trace isomorphism carries the outgoing gluing, and the discrepancy
with the identity double extends over the upper one-handlebody.
Equivalently \(W\cup_Y\overline W\) with reverse trace upstairs uses
the identity on the given \(Y\), and the only remaining gluing
adjustment is on \(S^1\times S^2\).
[Laudenbach–Poénaru, proof of Theorem A, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

The product \(W\times I\) after rounding is a five-dimensional body
with one handle each of indices zero, one and two. The product
attaching circle in the boundary \(S^1\times S^3\) of its
one-handlebody is primitive, so after orienting it a free homotopy
leads to a standard factor. Relative parametric transversality
allows the homotopy to be chosen through embedded circles. Vanishing
of the tangent has codimension four on the two-dimensional
domain-and-time space, and equal-time double points have codimension
four on the three-dimensional space of distinct pairs and time.
Near the diagonal, the immersions and compactness of the parameter
interval give local injectivity uniformly. Isotopy extension carries
the framed tube. The new factor circle meets the belt 3-sphere once
transversely. This suffices for geometric cancellation independently
of the parity of the normal framing. Its rounded boundary is
therefore \(S^4\), which is the identity double in the preceding
trace comparison.
[Milnor, *Lectures on the h-Cobordism Theorem*, Theorem 5.4](https://press.princeton.edu/books/paperback/9780691273723/lectures-on-the-h-cobordism-theorem)

Isoshima's Figure 37 has an extra zero-framed small meridian about
the first attaching component of the indicated double, and the
caption omits one 3-handle and one 4-handle. At \(n=1\) the lower
body is \(W^-(0,3)\). Akbulut–Kirby's Proposition 1(2) identifies
it with \(W^+(2,-2)\), and two applications of the inverse of
Proposition 1(1) give \(W^+(0,0)\). Their Theorem 2(1) gives
its boundary \(\Sigma(2,5,7)\). This integral
homology sphere has a fundamental group surjecting onto the
nontrivial \((2,5,7)\) triangle group of its Seifert base orbifold.
This cut is neither \(S^3\) nor \(Y_2\), and the example concerns
that specific cut of the stated presentation.
[Isoshima, arXiv:2403.17356v2, Figure 37 and §3](https://arxiv.org/pdf/2403.17356#page=35)
· [Akbulut–Kirby, §1, Proposition 1 and Theorem 2(1)](https://math.berkeley.edu/~kirby/papers/Akbulut%20and%20Kirby%20-%20Mazur%20manifolds%20-%20MR0544597.pdf)

## Homology of any mixed cut

Label the two pieces \(X_\pm\) using their own lower directions.
Their individual first homology groups are \(\mathbb Z/a_\pm\)
with \(\mathbb Z/0=\mathbb Z\). Each dotted-to-zero boundary
matrix is
\(\left(\begin{smallmatrix}0&a_\pm\\a_\pm&d_\pm\end{smallmatrix}\right)\).
Comparison of their determinants first shows that the windings
vanish together or have equal nonzero absolute value \(n\). The
actual orientation-reversing boundary gluing preserves first homology.
The Mayer–Vietoris segment has \(H_2(M)=0\) on the incoming end
and \(H_1(M)=0\) on the outgoing end, so
\[
 H_1(Y)\cong H_1(X_-)\oplus H_1(X_+)
     \cong \mathbb Z^2 \quad\text{or}\quad(\mathbb Z/n)^2.
\]
In the latter case the Smith form also forces \(n\mid d_\pm\),
since the gcd of the entries is the first invariant factor \(n\).
In the former case \(d_\pm=0\) because each matrix has rank zero.
Any genus-at-most-one Heegaard splitting therefore gives \(S^3\).
Genus zero has that conclusion, and the other genus-one
manifolds have nontrivial cyclic \(H_1\). In the integral-homology-sphere
case both pieces are contractible one-1/one-2 handle manifolds.
Conway–Tosun's criterion applies if the actual cut is additionally
an irreducible Heegaard Floer \(L\)-space.
[Conway–Tosun, Theorem 1](https://bpb-us-e2.wpmucdn.com/sites.ua.edu/dist/8/406/files/2024/10/mazur-type_manifolds.pdf)

The count argument provides two middle handles in selected
directions. A further selection theorem would have to provide
a tunnel system, a knot type or an isotopy of the actual marked
circles.
