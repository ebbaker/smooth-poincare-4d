# Independent reading of the rank-two single-slide word obstruction

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. This bounded E check uses the relators supplied in the assignment and the parent’s matrix proof. Actual serving model and reasoning effort are unavailable. The checkout at intake was `1c81a3048c8c21a4c1d1fb23db72f37168a15ca5`. The evidence concerns words in a fixed free group of rank two. A geometric application requires the actual based reverse attaching words and a verified slide formula on the marked upper body.

Write $X=x^{-1}$ and $Y=y^{-1}$ for the two inverse letters. Set $r=yxyXYX$ and $s_n=x^{n+1}Y^n$ in $F_2=\langle x,y\rangle$. The frozen second word $xxxxYYY$ is $s_3$. For every integer $n\geq1$, every $u\in F_2$, and every $\epsilon,\delta\in\{1,-1\}$, the element
\[
w=r^\epsilon u s_n^\delta u^{-1}
\]
is nonprimitive. The trace calculation and a separate Cayley-tree calculation both give this conclusion. The property holds with the factors swapped, with independent changes of basing or orientation, and after a simultaneous free-basis change. For example, replacing $r,s_n$ by $a r a^{-1},b s_n b^{-1}$ and conjugating the product by $a^{-1}$ replaces $u$ by $a^{-1}u b$. Swapping factors uses conjugacy of $AB$ and $BA$ and replaces the free conjugator by its inverse. A curve meeting one belt sphere once gives a cyclic word with a single occurrence of the corresponding letter, allowing either sign. Such a word is primitive, since cyclic rotation places it in the form $x^{\pm1}y^k$ in that basis. This gives a necessary obstruction to a cancellation from one slide of the specified pair, conditional on the word identification. Sequences of slides, stabilization and alternative starting pairs lie outside the calculation.

## Primitive representatives at the four possible vectors

For each primitive abelianization vector, there is exactly one conjugacy class of primitive elements of $F_2$. Kassel–Reutenauer prove the Christoffel-word classification in Corollary 3.3(b), with one Christoffel word per coprime signed pair defined in §3 and equation (3.1). I checked the primary preprint, version 1 dated 11 July 2005, on pp. 14–17. Their Remark 3.4(c) points out a sign issue in the older Osborne–Zieschang prescription. [Kassel–Reutenauer, *Sturmian morphisms, the braid group $B_4$, Christoffel words and bases of $F_2$*, arXiv:math/0507219v1](https://arxiv.org/pdf/math/0507219#page=17) · [Journal identification and DOI](https://doi.org/10.1007/s10231-006-0008-z)

The primitive representative at $(k+1,-k)$ is $P_k=x(xY)^k$ for $k\geq0$. In fact $(x,xY)$ is a free basis, because $y=(xY)^{-1}x$. Replacing its first entry by its product with the $k$th power of the second entry is an invertible basis operation. The representative at the opposite vector is $P_k^{-1}$. Since $[r]=(-1,1)$ and $[s_n]=(n+1,-n)$, the vectors for $w$ are $(n,-(n-1))$ for equal signs and $(n+2,-(n+1))$ for opposite signs, each up to an overall minus sign. Thus a primitive $w$ would be conjugate to $P_{n-1}^{\pm1}$ or $P_{n+1}^{\pm1}$, respectively.

## Matrix quotient

Map $x$ to $A$ and $y$ to $B$, where
\[
A=\begin{pmatrix}1&1\\0&1\end{pmatrix},\qquad
B=\begin{pmatrix}1&0\\-1&1\end{pmatrix}.
\]
Direct multiplication gives $ABA=BAB=\left(\begin{smallmatrix}0&1\\-1&0\end{smallmatrix}\right)$. Hence $r=yxy(xyx)^{-1}$ maps to the identity. These matrices also appear in Kassel–Reutenauer, p. 2, equations (0.1)–(0.2), with their $B$ equal to our $B^{-1}$. [Primary preprint, p. 2](https://arxiv.org/pdf/math/0507219#page=2)

For all $u$ and both signs, the trace of the image of $w$ is the trace $q_n$ of the image of $s_n$. This uses conjugacy invariance and $\operatorname{tr}(D^{-1})=\operatorname{tr}D$ for $D\in SL_2(\mathbb Z)$. The image $A^{n+1}B^{-n}$ has trace $q_n=n(n+1)+2$. For $P_k$, write $M=AB^{-1}=\left(\begin{smallmatrix}2&1\\1&1\end{smallmatrix}\right)$ and $T_k=\operatorname{tr}(AM^k)$. Cayley–Hamilton gives
\[
T_0=2,\qquad T_1=4,\qquad T_{k+2}=3T_{k+1}-T_k.
\]
Consequently $T_2=10$, $T_3=26$, and $T_4=68$. For the frozen pair this gives $T_2=10<q_3=14<T_4=68$. The recurrence yields $T_{k+1}\geq2T_k$ by induction. Since $2q_n-q_{n+1}=n(n-1)$ and $T_3>q_4$, it follows that $T_{n-1}>q_n$ for $n\geq4$. The other candidate $T_{n+1}$ is still larger. At $n=1$ the three values $T_{n-1},q_n,T_{n+1}$ are $2,4,10$, and at $n=2$ they are $4,8,26$. This verifies the trace mismatch throughout the claimed domain. The same calculation gives $T_n>q_n$ for $n\geq2$, starting with $T_2>q_2$, so $s_n$ itself is nonprimitive in that range. The word $r$ is nonprimitive because its cyclic length is six and the primitive representative at its vector $(-1,1)$ is $yX$ of cyclic length two.

## Cayley-tree check of the arbitrary conjugator

Use the tree for the basis $x,y$, with edges labelled by right multiplication and the group acting on the left. Let $g=r^\epsilon$ and $h=u s_n^\delta u^{-1}$. If their translation axes are disjoint, let $p,q$ be the endpoints on the respective axes of their shortest joining path. Define $a=p^{-1}gp$, $b=q^{-1}hq$ and $d=p^{-1}q$. The word $a d b d^{-1}$ represents $p^{-1}ghp$. The words $a$ and $b$ read one translation on their axes. When followed from either endpoint, the joining path leaves the corresponding axis at its first edge. Hence every cyclic junction is reduced, giving cyclic length $6+(2n+1)+2|d|$.

If the axes meet, choose a common vertex $p$. Conjugation by $p^{-1}$ gives a product of a cyclic rotation of $r^\epsilon$ and a cyclic rotation of $s_n^\delta$, since intervals of a full period on the respective axes read those rotations. The cyclic word now has two junctions between its factors. Each deletion of an adjacent inverse pair takes one letter off the start or end of each remaining factor. The deleted letters in $r^\epsilon$ therefore occupy a single cyclic run whose letters belong to the inverse alphabet of $s_n^\delta$. When the signs agree, this run has length at most two, as seen from the two runs in $\{X,y\}$ in the cyclic word $r$. When the signs differ, the longest run has length one, since the letters in $\{x,Y\}$ are isolated in that cyclic word. Reversing and inverting both factors preserves the bounds. Neither factor can be deleted in its entirety, since $|r|=6$ and $|s_n|\geq3$, so these bounds hold through complete cyclic reduction. The resulting cyclic lengths are at least $2n+3$ and $2n+5$ for the equal and opposite signs, respectively. The required primitive lengths from the representatives above are $2n-1$ and $2n+3$. This verifies the strict obstruction and includes any cancellations involving $u$ in the initial unreduced expression. The assumption $n\geq1$ matters. At $n=0$, the product $r s_0=rx$ cyclically reduces to $y$.
