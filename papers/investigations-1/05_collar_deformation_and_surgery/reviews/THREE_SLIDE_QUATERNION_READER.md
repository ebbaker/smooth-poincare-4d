# Independent check of the three-slide obstruction for GST $L_{3,1}$

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E check at checkout 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5, using the assigned quaternion representations, the published GST diagram, and the existing [fixed-component obstruction](FIXED_COMPONENT_SLIDES_READER.md). Actual serving model and reasoning effort are unavailable.

On the smooth, oriented native rank-two reverse diagram, any first $1/2$ belt cancellation reached by unstabilized slides and isotopies requires at least four reverse $2$-handle slides. This is a lower bound. Existence of such a cancellation remains open in this calculation.

## Native marking and move count

The two dotted $1$-handles on the left of GST Figure 9 mark $F_2=F(x,y)$ on the original incoming $\#_2(S^1\times S^2)$. Section 7 introduces the two dual meridians in the right panel and follows them through the bracketed surgery reductions to $L_{n,1}$ in Figure 1. Its description of the presentation in Question 2 gives $y=w^{-1}xw$, $w=yx$, and $x^{n+1}=y^n$. With $X=x^{-1}$, $Y=y^{-1}$, the first relator $yw^{-1}Xw=yXYXyx$ is a cyclic rotation of $r=yxyXYX$. The second relator at $n=3$ is $s=x^4Y^3$. The text and dualization thus give the two actual reverse attaching classes up to orientations, choices of basing and the simultaneous marking. The proof tests both names for the initial mover. [Gompf–Scharlemann–Thompson, *Geometry & Topology* 14 (2010), §7, pp. 2329–2333, Figures 9–13 and Question 2](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=25)

A slide of a core representing $u$ over a framed push-off of $v$ changes the moving class to $u g v^{\epsilon}g^{-1}$ up to conjugacy, where $\epsilon=\pm1$. The push-off is homotopic to $v$ inside its tube. The band gives the conjugating path $g$, which can be arbitrary for this obstruction. Orient both cores by retaining the moving core's orientation and absorbing the stationary orientation in $\epsilon$. Isotopy leaves the free homotopy class unchanged. Changes of upper belt marking act by a common automorphism after transport back to the original marking. A geometric intersection of an attaching circle with one belt sphere at exactly one transverse point would give a cyclic representative $t^{\pm1}h$ in a corresponding free basis, with $h$ in the complementary free factor. This word is primitive by an elementary basis change. Primitivity is independent of the transported belt marking. [GST, §2, Lemma 2.1 and Figures 3–4](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=4) · [GST, §7, p. 2333](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=29)

The fixed-component quotient proof already covers sequences using just one moving label and sequences ending at the first switch. Among sequences of length at most three, the remaining case has different moving labels on its first two slides. Let $m$ be the initial mover and $a$ the initial stationary core. Use their abelianization vectors as an ordered basis. With slide signs $\alpha,\beta\in\{\pm1\}$, after the first two slides the ordered pair is

\[
u=(1,\alpha),\qquad v=(\beta,1+\alpha\beta).
\]

A third slide with sign $\gamma\in\{\pm1\}$ gives moving vector $u+\gamma v=(1+\gamma\beta,\alpha+\gamma(1+\alpha\beta))$ or $v+\gamma u=(\beta+\gamma,1+\alpha(\beta+\gamma))$. Up to overall sign the union is

\[
(0,1),\quad (2,1),\quad (2,-1),\quad (2,3),\quad (2,-3).
\]

Using $[r]=(-1,1)$ and $[s]=(4,-3)$, the table below orients each vector to have positive first coordinate in $(x,y)$. All ten vectors are coprime. The stationary curve after the third slide already fails the first-switch test.

## Quaternion bound and exact check

In any quotient killing $a$, the first slide leaves the image of the mover conjugate to $m$. The second slide multiplies the killed class by a conjugate of the current mover or its inverse. Immediately before slide three both images are therefore conjugate to $m^{\pm1}$. If the quotient is represented in the unit quaternions, write $c=\operatorname{Re}(m)$ for the common scalar part of those images. Their imaginary parts both have norm $\sqrt{1-c^2}$, including when either image is inverted or conjugated. The scalar part of the moving image after slide three is bounded below by

\[
\operatorname{Re}((c+\mathbf v)(c+\mathbf w))
=c^2-\mathbf v\cdot\mathbf w\ \ge\ 2c^2-1.
\]

* When $m=r$, set $x=(1-i)/\sqrt2$, $y=(2+i+\sqrt{11}j)/4$. Both have unit norm. The first has scalar part $\cos(\pi/4)$, the second $\cos(\pi/3)$, so $x^4=y^3=-1$ and $s$ maps to $1$.
* When $m=s$, set $p=i$, $q=(5+6i+\sqrt{39}j)/10$, $x=q^{-1}p$ and $y=p^{-1}q^2$. These are unit quaternions. Since $p^2=q^3=-1$, $xy=q$, $xyx=p$ and $yxy=p^{-1}q^3=p$, so $r$ maps to $1$. In coordinates $x=(6+5i+\sqrt{39}k)/10$ and $y=(6+5i-\sqrt{39}k)/10$.

For $(h,-k)$ with $h,k>0$ coprime, the primitive conjugacy class has representative $C_{h,k}=\prod_{\ell=1}^{k}x^{e_\ell}Y$, with $e_\ell=\lceil\ell h/k\rceil-\lceil(\ell-1)h/k\rceil$. The formula follows from the lower lattice path and the sign substitution $y\mapsto Y$. The scalar part is unchanged by inversion and conjugation. Each table entry therefore gives the scalar part forced by primitivity at that endpoint. [Kassel–Reutenauer, arXiv:math/0507219v1, §3, equation (3.1) and Corollary 3.3(b), pp. 14–17](https://arxiv.org/pdf/math/0507219#page=14)

The scalar parts were computed independently using the $SL_2$ trace identities and exact arithmetic in $\mathbb{Q}(\sqrt2)$. Under the standard unit quaternion representation into $SU(2)$, trace is twice the scalar part. Put $t=\operatorname{tr}x$, $v=\operatorname{tr}y$ and $w=\operatorname{tr}(xy)$. The two trace triples are $(\sqrt2,1,3\sqrt2/4)$ and $(6/5,6/5,1)$, respectively. Track a formal coefficient tuple $(A,B,C,D)$ for $A I+B x+C y+D xy$, beginning at $(1,0,0,0)$. Cayley–Hamilton and $yx=-xy+v x+t y+(w-tv)I$ give the right multiplication maps

\[
\begin{aligned}
M_x(A,B,C,D)&=(-B+(w-tv)C-vD,\ A+tB+vC+wD,\ tC+D,\ -C),\\
M_y(A,B,C,D)&=(-C,\ -D,\ A+vC,\ B+vD).
\end{aligned}
\]

Use $M_X=tI-M_x$, $M_Y=vI-M_y$ on tuples. The scalar part of the final tuple is $(2A+tB+vC+wD)/2$. This yields $\operatorname{Re}(r)=41\sqrt2/64$ in the first representation and $\operatorname{Re}(s)=64893/78125$ in the second, and gives the following endpoint values.

| Initial mover | Normalized endpoint | $\operatorname{Re}(C_{h,k})$ |
| --- | --- | ---: |
| $r$ | $(10,-7)$ | $239/1024$ |
| $r$ | $(4,-3)$ | $-1/32$ |
| $r$ | $(2,-1)$ | $-1/4$ |
| $r$ | $(6,-5)$ | $79/256$ |
| $r$ | $(14,-11)$ | $-21169/65536$ |
| $s$ | $(5,-3)$ | $220741/781250$ |
| $s$ | $(1,-1)$ | $11/50$ |
| $s$ | $(7,-5)$ | $-112497839/488281250$ |
| $s$ | $(9,-7)$ | $-63953221019/305175781250$ |
| $s$ | $(11,-9)$ | $50687449811701/190734863281250$ |

The first five entries are at most $79/256<657/1024=2\operatorname{Re}(r)^2-1$. The last five are all below $3/10<2318687273/6103515625=2\operatorname{Re}(s)^2-1$. Thus no possible moving endpoint after slide three is primitive. Together with the first-switch check, this completes the bound in the marked rank-two reverse presentation. A further $2$-handle slide, changing rank by introducing a pair of handles, and a geometric realization of any primitive word in a later diagram lie outside these checks.

## Independent reading of the extension to \(n\ge4\)

The same four-slide lower bound holds for the native rank-two reverse diagram of \(L_{n,1}\) for each integer \(n\ge4\). This portion checks the free-product argument, including the short endpoint cases at \(n=4\). Set \(s_n=x^{n+1}Y^n\), so the preceding signed slide calculation in the relative basis \(([m],[a])\) is unchanged. After the first two slides have different moving labels, a third moving endpoint projects, in a quotient killing \(a\), to a product of two conjugates of \(m^{\pm1}\). The two signs are opposite for the endpoint \(\pm[a]\). They are both positive when the endpoint is oriented as \(2[m]+j[a]\), \(j=\pm1,\pm3\). In fact the signed \([m]\)-coefficient is the sum of the two signs, by tracking each through the first switch.

### Axes and surviving turns

For a free product \(A*B\), use the Bass–Serre tree with edges labeled by group elements \(g\) and vertices \(gA,gB\). Across a vertex, two successive distinct edges \(g,h\) determine the nontrivial turn \(g^{-1}h\) in its factor. A sequence of turns and its first edge determine a path uniquely. Left translation preserves the labels of turns. A cyclically reduced free-product word with at least two syllables translates along an axis, with one turn per syllable in the periodic sequence and translation length equal to its cyclic syllable length. A segment of \(E\) complete edges carries \(E-1\) interior turns.

Let \(U,V\) be the two conjugate factors of equal translation length \(L\). If the axes are disjoint, join the closest vertices \(p\) on the \(U\)-axis and \(q\) on the \(V\)-axis by their bridge. The path
\[
p\longrightarrow Up\longrightarrow Uq\longrightarrow UVq\longrightarrow UVp
\]
and its \(UV\)-translates concatenate without backtracking because each bridge leaves both axes at its endpoints. Both period segments survive and the product length is \(2L+2d(p,q)\). For intersecting axes with compatible directions, choose \(p\) in their intersection and concatenate \(p\to Up\to UVp\) and its translates. The directions at each seam are distinct, including if the axes meet at just a vertex. The length is \(2L\) and both segments survive. A coincident axis with compatible directions also retains a whole period. An intersection containing a ray forces the axes to coincide here. An edge sufficiently far inside the common ray is taken to the same edge by \(U\) and either \(V\) or \(V^{-1}\), using equal lengths and the respective directions. The edge stabilizer is trivial.

For an oppositely oriented finite overlap \([p,q]\) of length \(D<L\), choose \(p\) where the \(U\)-direction enters the overlap. The path \(p\to Up\to UVp\) has no backtracking at \(Up\), because the negative \(U\)-direction and the positive \(V\)-direction diverge at \(p\). Its cyclic seam retracts exactly \(D\) edges at each end. In the translates of the shortened path the two residual directions diverge at the other endpoint \(q\) of the overlap. This leaves length \(2L-2D\) with \(L-D\) consecutive edges from each factor's axis. If \(D\ge L\), then \(UVq=q\), since \(Vq\) is on the common segment and \(U\) reverses that translation there. The product is elliptic. Oppositely oriented coincident axes also give an elliptic product. These elliptic cases cannot realize any candidate below, all of which have positive cyclic syllable length.

### The initial mover is \(s_n\)

In \(C_2*C_3=\langle d,e\mid d^2=e^3=1\rangle\), put \(x=de,\ y=ed\). The braid relation \(xyx=yxy=d\) kills \(r\), and \(s_n\) maps to \((de)^{n+1}(de^{-1})^n\). Its period has \(L=4n+2\) edges, with \(C_3\)-turn signs \(P=+^{n+1}-^n\) read in the positive direction.

For endpoint \(\pm[r]\), the primitive representative up to orientation is \(xY\), with cyclic syllable length four. The two product factors have opposite signs. On a finite overlap of oppositely oriented axes, read the turns in the positive \(s_n\) direction on both. Both lists are shifts of \(P\). Equal phase at one common edge gives coincident axes, by uniqueness of a path from turns. For distinct phases the common \(C_3\)-turn run has length at most \(n\). To see this, a matching run cannot contain a sign transition because each type of transition appears exactly once per period. A nonzero shift within the same sign-run matches at most its length minus one. Thus \(D-1\) interior turns include at least \(\lfloor(D-1)/2\rfloor\) \(C_3\)-turns and \(D\le2n+2<L\) for a nonempty overlap. The product length is at least \(4n>4\). Disjoint and compatibly oriented axes give length at least \(2L\), and coincident opposing axes give length zero.

An endpoint \(2[s_n]+j[r]\) has vector \((2n+2-j,-(2n-j))\) in \((x,y)\). The Christoffel representative has \(x\)-blocks of size one or two, separated by \(Y\). In the quotient it is cyclically reduced of length \(2L-4j\). Its \(C_3\)-turn signs have no run of three equal signs. Disjoint or compatible axes preserve a whole period arc from a factor. Otherwise matching positive lengths require \(D=2j\), so \(j=1\) or \(3\), and each surviving arc has at least \(L-6\ge12\) edges. Both possibilities give at least five consecutive \(C_3\)-turns from one factor. A block of five in \(+^{n+1}-^n\), or the inverse period, contains a triple. If it crosses at most one sign transition, one run occupies at least three positions. If it crosses two transitions, it contains a complete run of length at least \(n\). This contradicts the primitive turn pattern. The proof also excludes \(D\ge L\) by ellipticity, without a phase bound for products with equal signs.

### The initial mover is \(r\)

Send \(x,y\) to the factor generators of \(C_{n+1}*C_n\), killing \(s_n\). The two period patterns of length six for \(r,r^{-1}\), started in the \(y\)-factor, can be written \(P=(y,x,y,X,Y,X)\) and \(Q=(y,x,Y,X,Y,x)\). The maximal lengths of common runs with \(P\) for its shifts by two and four are both one. For \(Q\) and its shifts by two and four the corresponding maxima are \(2,0,2\). These counts are comparisons of cyclic words, with matching factor types required at every vertex. On opposing axes, compare the patterns in the same direction across the overlap. Opposite signs of the product factors then compare \(P\) with another phase of \(P\) (or \(Q\) with \(Q\)). Equal phase gives coincident axes. Thus distinct axes have \(D\le2\). Equal signs of the product factors compare \(P\) with a phase of \(Q\), giving \(D\le3\).

The endpoints \(\pm[s_n]\) and \(2[r]+j[s_n]\) have primitive cyclic syllable lengths \(2n\) and \(2|nj-2|\), respectively. Indeed, orient them so the \(x\)-coordinate is positive. These vectors are all coprime and have \(x\)-coordinate between one and two times the absolute \(y\)-coordinate. Their primitive words use only the turns \(x,x^2,Y\), or only \(X,X^2,y\) if the endpoint is oriented in the other direction. Since \(n\ge4\), \(X\) is distinct from \(x,x^2\), and \(Y\) is distinct from \(y\).

If the target length is at least twelve, a matching product retains a period segment of six edges, with five interior turns. For either period pattern, every cyclic block of five turns contains both signs in at least one factor. In \(P\) a block could omit the only \(x\) or the only \(Y\), yet cannot omit both. The inverse pattern has the same property. This excludes the primitive turn list in either orientation.

If the target length is below twelve, the only possibilities are \(\pm[s_n]\) for \(n=4,5\) and \(2[r]+[s_n]\) for \(n=4,5,6,7\). For the first orient the endpoint as \(+[s_n]\), so exactly one factor is a positive conjugate of \(r\). For the second both factors are positive. Any short positive-length product would have a surviving segment of at least three edges from a positive \(r\)-period. Its two or more successive turns cannot all lie in \(\{x,x^2,Y\}\), because only \(x\) and \(Y\) in \(P\) lie in that set and their positions are nonadjacent. At \(n=4\), the candidate \(2[r]+[s_n]\) also has length four, below the minimum six from \(D\le3\). This completes the uniform extension when combined with the exact quaternion check at \(n=3\).
