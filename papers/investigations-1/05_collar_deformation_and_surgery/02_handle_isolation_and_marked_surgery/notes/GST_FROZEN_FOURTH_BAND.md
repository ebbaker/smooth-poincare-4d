# Every fourth band on the frozen two-arc GST sequence

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E continuation of SUR-B04. Exact serving model and reasoning effort are unavailable. Intake HEAD 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5. The working SHA-256 prefixes are 42f53b730d09ce96 for the [frozen framed sequence](GST_INDEPENDENT_EXTERIOR_BANDS.md#a-three-slide-core-outside-every-original-one-arc-neighborhood) and 15027a80860a3a84 for the [generic fourth-slide test](GST_FOURTH_SLIDE_QUOTIENTS.md). This result uses the actual smooth oriented \(L_{3,1}\) reverse trace in the fixed complete upper belt marking.

After the specified three framed slides through two joining arcs, a single exact unit-quaternion witness excludes every fourth band in either direction, for either sign. The stationary core is already nonprimitive on this prefix. Neither core therefore permits a first one-intersection cancellation at this stage.

## The four possible signed updates

Write \(X=x^{-1}\), \(Z=y^{-1}\), \(r=yxyXZX\), \(s=x^4Z^3\) and \(z=xyx\). The exact based words after the three slides are \(q=r z u z^{-1}\) and \(h=u q^{-1}\), where \(u=sr\). Their rows are \((2,-1)\) and \((1,-1)\). Every band has a relative conjugating word \(g\in F(x,y)\) with the retained basings. By the rank-two primitive conjugacy classification, the table gives the only possible primitive classes of the moved core.

| Moved word and sign | Fourth moved class | Row | Primitive representative |
| --- | --- | --- | --- |
| \(q,+\) | \(qg h g^{-1}\) | \((3,-2)\) | \(xZxxZ\) |
| \(h,+\) | \(hg q g^{-1}\) | \((3,-2)\) | \(xZxxZ\) |
| \(q,-\) | \(qg h^{-1}g^{-1}\) | \((1,0)\) | \(x\) |
| \(h,-\) | \(hg q^{-1}g^{-1}\) | \((-1,0)\) | \(X\) |

The first representative is a cyclic rotation of \(x(xZ)^2\), a primitive word in the basis \((x,xZ)\). The classification gives its uniqueness at that row. The other two rows have the single-letter representatives. [Kassel–Reutenauer, arXiv:math/0507219v1, Corollary 3.3(b)](https://arxiv.org/pdf/math/0507219#page=17)

## Exact scalar exclusion

Let \(\rho(x)=(3+4i)/5\) and \(\rho(y)=(3+4j)/5\), using the standard Hamilton units. I independently recomputed the witness by integer multiplication with a factor of five in the denominator at each letter and conjugate numerators for inverses. The real parts of the two current words and the primitive candidates are given below.

| Word | In \(x,y,X,Z\) | \(\operatorname{Re}\rho\) |
| --- | --- | --- |
| \(q\) | \(yxy\,x^4Z^2xyXZX^2ZX\) | \(595825212387/5^{17}\) |
| \(h\) | \(x^4Z^2xyxyxZXy^2X^4ZXZ\) | \(2311596220746681/5^{22}\) |
| \(xZxxZ\) | \(xZxxZ\) | \(-2253/3125\) |
| \(x\) and \(X\) | \(x\) and \(X\) | \(3/5\) |

Put \(a=\operatorname{Re}\rho(q)\) and \(b=\operatorname{Re}\rho(h)\). Each of the four updates multiplies quaternions of real parts \(a,b\) in some order, since conjugation and inversion preserve the real part. Their imaginary parts have norms \(\sqrt{1-a^2}\) and \(\sqrt{1-b^2}\). The scalar part of their product is \(ab\) less the dot product of the imaginary parts. Hence it is at least
\[
L(a,b)=ab-\sqrt{(1-a^2)(1-b^2)} .
\]
Here \(a>39/50\) and \(b>969/1000\) by exact cross-multiplication. The function \(L\) is increasing in each variable on \([0,1]^2\), since the product increases and the radicand decreases. At \(a_0=39/50\) and \(b_0=969/1000\),
\[
a_0b_0-\frac35=\frac{7791}{50000}>0,\qquad
\left(a_0b_0-\frac35\right)^2-(1-a_0^2)(1-b_0^2)
=\frac{377}{1000000}>0.
\]
It follows that \(L(a,b)>3/5\), strictly above all the primitive scalar candidates in the table. This holds for every joining word \(g\). The unchanged \(q\) or \(h\) was already excluded by its Whitehead graph, and a one-intersection crossing against any belt of a complete system would give a primitive class. The generic set of 32 surviving signed histories is unchanged. This calculation only excludes their realizations extending the exact three-slide prefix with word pair \((q,h)\). [Stationary-core tests and marked realization](GST_INDEPENDENT_EXTERIOR_BANDS.md#a-three-slide-core-outside-every-original-one-arc-neighborhood)

## Plain joining arc and geometric scope

One can take \(g=1\) by using a narrow strip along the original trivial-relative-class arc or its reverse, with the retained contact slots in the genus-three two-arc neighborhood. Use the current stationary framed parallel as in the first three slides. The positive products \(qh\) and \(hq\) are conjugate to \(u\) and give cyclic occurrence counts \((5,4)\). The negative products \(qh^{-1}=q^2u^{-1}\) and \(hq^{-1}\) are inverses and give \((23,16)\). These counts are lower bounds on crossings with the original respective belts. In particular the negative updates pass the signed unit test against \(B_x\) and still require at least 23 geometric crossings with it.

The fourth framed trace comparison fixes the incoming \(Y\)-collar in reverse. It composes its outgoing map with the preceding \(S^3\) comparison to carry the lower cap attaching map, with inverse given by the reverse composition. The original upper attachment and its inverse remain fixed on the \(Y\)-collar. The original and successor capped traces have the same forward counts \((0,2,2)\), with no births or cancellations. The negative and positive bands in this calculation leave open subsequent moves and other three-slide prefixes. [Relative trace comparison](GST_INDEPENDENT_EXTERIOR_BANDS.md#relative-trace-and-handle-count)
