# Three reverse slides on the marked GST square-knot link

26 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort unavailable. Bounded group calculation for SUR-B04 under SUR-E02. The starting checkout was 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5, with the [marked diagram reading](GST_DUAL_WORD_AND_BAND_20261126.md) and [fixed-component calculation](../../reviews/FIXED_COMPONENT_SLIDES_READER.md) as working inputs.

## Claim and application

In $F(x,y)$, set $X=x^{-1}$, $Y=y^{-1}$, $r=yxyXYX$, and $s=x^4Y^3$. Start from the two conjugacy classes of $r,s$. For any sequence of at most three moves that replaces one class $u$ with the class of $u g v^\epsilon g^{-1}$, where $v$ is the other class, $g\in F(x,y)$ is arbitrary and $\epsilon=\pm1$, both resulting elements are nonprimitive. Two homomorphisms to the group of unit quaternions suffice. The computation uses integer arithmetic.

For the smooth oriented marked GST $L_{3,1}$ reverse trace in $Y_2=\#^2(S^1\times S^2)$, these are the individual attaching words in the complete upper belt basis. A band slide has this word update because traversing its two long sides contributes the conjugating path and its inverse. A circle crossing one belt of a complete system once reads $t^{\pm1}h$, where $h$ is a word in the other generator. This word is primitive by a basis operation. Primitivity is invariant under rebasing, inversion and simultaneous free basis changes. A first reverse $1/2$ cancellation by such unstabilized slides therefore needs at least four slides. [Diagram and basings](GST_DUAL_WORD_AND_BAND_20261126.md) · [GST, Figures 9–13 and §7, pp. 2329–2333](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

## Which image classes a sequence can reach

Label the first moving word $A$ and the initially stationary word $B$, and let $a,b$ be their signed abelianization vectors. The original vectors of $r,s$ are $(-1,1),(4,-3)$ and have determinant $-1$. Each signed slide adds a signed multiple of one row to the other, so every resulting row is coprime. In the representation chosen for this initial moving word, $B$ maps to the identity. Let $c$ be the real part of the image of $A$. Conjugating or inverting a unit quaternion preserves its real part.

During any initial run that moves $A$ over $B$, its image is conjugate to the image of $A$, and its row is $a+k b$, where $k$ is the sum of the signs. The first switch, of sign $\epsilon$, changes $B$ to an element with image conjugate to the image of $A^\epsilon$ and row
\[
b+\epsilon(a+k b)=\epsilon\bigl(a+(k+\epsilon)b\bigr).
\]
Through three moves, both rows with this image class after the initial run or the first switch have the form $\pm(a+j b)$, $|j|\leq3$. During the initial run the unchanged $B$ is checked at $j=0$ with the other representation. The same $j=0$ checks apply to the original pair.

If a third move occurs after the first switch, then the first two moves were in different directions. Immediately before the third move both images have real part $c$. An unchanged component remains in the preceding class, with its preceding row. The changed one becomes the product of two unit quaternions of real part $c$, including any conjugation and inversion prescribed by the slide. For imaginary parts $U,V$, Cauchy–Schwarz gives
\[
\operatorname{Re}\big((c+U)(c+V)\big)=c^2-U\cdot V
\ \geq\ c^2-(1-c^2)=2c^2-1.
\]
For signs $\alpha,\beta,\gamma$ in chronological order, the row of the third changed word is
\[
\begin{array}{ll}
A\,B\,A: &(1+\beta\gamma)a+(\alpha+\gamma+\alpha\beta\gamma)b,\\
A\,B\,B: &(\beta+\gamma)a+(1+\alpha\beta+\alpha\gamma)b.
\end{array}
\]
These formulas determine the rows before making any choice of band path.

## Representations and arithmetic

Write $i,j,k$ for the standard imaginary quaternion units.

- When $A=r$, send $x$ to $(1-i)/\sqrt2$ and $y$ to $(2+i+\sqrt{11}\,j)/4$. Then $x^4=y^3=-1$ in the image, so $s$ maps to the identity.
- When $A=s$, set $p=i$, $q=(5+6i+\sqrt{39}\,j)/10$, $x=q^{-1}p=(6+5i+\sqrt{39}\,k)/10$ and $y=p^{-1}q^2=(6+5i-\sqrt{39}\,k)/10$ in the image. The identities $p^2=q^3=-1$, $xy=q$, and $xyx=yxy=p$ show that $r$ maps to the identity.

A primitive word at a given coprime signed vector is conjugate to the Christoffel representative at that vector. Negating a vector inverts that conjugacy class. Thus we orient every candidate vector as $(m,-n)$ with $m>0$, $n\geq0$. Put $N=m+n$. In the positive quadrant the lower Christoffel path uses after $t$ steps the lattice point $(t-\lfloor tn/N\rfloor,\lfloor tn/N\rfloor)$. At each $t$ this is the highest point on the slice $x+y=t$ below the segment to $(m,n)$. For $(m,-n)$, write $Y$ whenever this floor increases and $x$ otherwise. [Kassel and Reutenauer, §3, equation (3.1) and Corollary 3.3(b), arXiv:math/0507219v1](https://arxiv.org/pdf/math/0507219#page=15)

The [exact replay](../numerics/gst_three_slides.py) multiplies numerator vectors in the basis $(1,i,\sqrt{d}\,j,\sqrt{d}\,k)$, with $d=11$ or $39$, and tracks the squared positive denominator. For the rows $\pm(a+j b)$ the maximum squared real part of a primitive representative is strictly smaller than $c^2$ in both representations.

| First moved word | $c^2$ | Maximum squared real part among these primitive candidates |
| --- | ---: | ---: |
| $r$ | $1681/2048$ | $5414929/8388608$ |
| $s$ | $4211101449/6103515625$ | $2150909693604/3814697265625$ |

For a third move after the switch, the two row formulas give five candidate slopes for either choice of first moving word. The real parts below are those of the corresponding primitive representatives in the indicated representation.

| First moved word | Candidate slope | Real part |
| --- | ---: | ---: |
| $r$ | $(2,-1)$ | $-1/4$ |
| $r$ | $(4,-3)$ | $-1/32$ |
| $r$ | $(6,-5)$ | $79/256$ |
| $r$ | $(10,-7)$ | $239/1024$ |
| $r$ | $(14,-11)$ | $-21169/65536$ |
| $s$ | $(1,-1)$ | $11/50$ |
| $s$ | $(5,-3)$ | $220741/781250$ |
| $s$ | $(7,-5)$ | $-112497839/488281250$ |
| $s$ | $(9,-7)$ | $-63953221019/305175781250$ |
| $s$ | $(11,-9)$ | $50687449811701/190734863281250$ |

For an $r$-first sequence the maximum $79/256$ is below $2c^2-1=657/1024$. For an $s$-first sequence the maximum $220741/781250$ is below $2c^2-1=2318687273/6103515625$. The estimate allowed all conjugations in the target group, so it holds for every original joining word. The geometric conclusion uses the individual marked words of $L_{3,1}$ and the necessary primitivity of a one-belt crossing.
