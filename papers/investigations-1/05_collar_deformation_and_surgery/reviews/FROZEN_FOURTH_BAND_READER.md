# Every fourth band on a fixed GST \(L_{3,1}\) prefix

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E check based at 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5. The working input is the [three-slide, two-arc specimen](../02_handle_isolation_and_marked_surgery/notes/GST_INDEPENDENT_EXTERIOR_BANDS.md#a-three-slide-core-outside-every-original-one-arc-neighborhood). Actual serving model and reasoning effort were unavailable.

No fourth framed band on this particular marked reverse pair can produce a primitive attaching class, for either moving component and either sign. The test quantifies over all fourth bands after the specified first three bands. Its use of the exact two current words makes the fixed prefix essential.

Write \(X=x^{-1},Y=y^{-1}\). Starting with \(r=yxyXYX,\ s=x^4Y^3\), use
\[
 z=xyx,\qquad p=sr,\qquad q=r z p z^{-1},\qquad h=pq^{-1}.
\]
The current classes are \(q,h\) with vectors \((2,-1),(1,-1)\). Slide four replaces its moving class, after choosing the corresponding orientation and basing, by \(q u h^\epsilon u^{-1}\) or \(h u q^\epsilon u^{-1}\), \(\epsilon=\pm1\), for a joining word \(u\in F(x,y)\). In the two negative cases the possible primitive representatives are \(x\) and \(X\), respectively. In the positive cases both have vector \((3,-2)\), with primitive representative \(x^2YxY\) up to conjugation. A core crossing one belt sphere once would be primitive, including after a transported change of belt system. The stationary word after slide four is already obstructed by the three-slide check. [Kassel–Reutenauer, arXiv:math/0507219v1, equation (3.1) and Corollary 3.3(b)](https://arxiv.org/pdf/math/0507219#page=14) · [Three-slide obstruction](THREE_SLIDE_QUATERNION_READER.md)

Use the unit quaternions \(x=(3+4i)/5,\ y=(3+4j)/5\), with \(ij=k\). Direct multiplication gives
\[
 A=\operatorname{Re}(q)=\frac{595825212387}{762939453125},\qquad
 B=\operatorname{Re}(h)=\frac{2311596220746681}{2384185791015625},
\]
and
\[
 \operatorname{Re}(x)=\operatorname{Re}(X)=\frac35,\qquad
 \operatorname{Re}(x^2YxY)=-\frac{2253}{3125}.
\]
For an exact replay, start the numerator at \((1,\boldsymbol0)\) and, for each letter, right-multiply by its integer numerator \((3,\pm4i)\) or \((3,\pm4j)\), accumulating denominator \(5\) per letter. The update on scalar and vector coordinates is
\[
 (a,\mathbf v)(b,\mathbf w)
 =(ab-\mathbf v\cdot\mathbf w,\ a\mathbf w+b\mathbf v+\mathbf v\times\mathbf w).
\]
This replay requires no word reductions. The quotient can be evaluated on the two exact prefix words without imposing \(r=1\) or \(s=1\).

Conjugation and inversion preserve scalar parts and imaginary norms. In either moving direction and for either sign, the product therefore has scalar part at least \(AB-\sqrt{(1-A^2)(1-B^2)}\) by Cauchy–Schwarz. The exact fractions give \(A>39/50\), \(B>969/1000\), hence \(AB>151/200\) and
\[
 (1-A^2)(1-B^2)
 <\left(1-\left(\frac{39}{50}\right)^2\right)
  \left(1-\left(\frac{969}{1000}\right)^2\right)
 <\left(\frac{31}{200}\right)^2.
\]
The lower scalar bound is thus strictly above \(3/5\), which excludes all three primitive representatives. This is an obstruction in the original rank-two marking, unaffected by orientations, rebasing or ambient isotopies. It gives a four-slide obstruction only for continuations of this frozen three-slide specimen.
