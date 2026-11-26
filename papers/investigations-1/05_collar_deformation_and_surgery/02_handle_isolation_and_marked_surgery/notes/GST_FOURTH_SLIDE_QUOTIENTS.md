# Quaternion bounds at the fourth reverse slide on GST \(L_{3,1}\)

26 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort unavailable. Bounded group calculation for SUR-B04 under SUR-E02. Inputs are the [marked \(L_{3,1}\) word reading](GST_DUAL_WORD_AND_BAND_20261126.md), the [three-slide obstruction](GST_THIRD_SLIDE_QUOTIENTS.md), and checkout 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5.

Represent each slide by its moved component \(R\) or \(S\) and sign \(+\) or \(-\) as in the [three-slide note](GST_THIRD_SLIDE_QUOTIENTS.md). There are \(2^4\cdot2^4=256\) chronological direction and sign sequences of length four. The component unchanged by the last slide is already covered by the three-slide theorem. For the changed component, five unit-quaternion homomorphisms exclude primitivity in 224 branches. The other 32 branches satisfy this set of necessary angular inequalities.

## Bound used for one test

Assign the initial pair of words the vectors \((1,0)\) and \((0,1)\), separate from their abelianizations. At each slide add the source vector to the target vector, irrespective of the sign. The coordinates \((n_r,n_s)\) of the changed vector count the original conjugates in a product expansion, retaining factors even when group cancellation could erase them. Indeed, conjugating a product conjugates each factor, and inversion reverses the factors and replaces each by its inverse.

For a representation that kills one original relator, delete its trivial factors. The remaining \(N=n_r\) or \(n_s\) factors are unit quaternions with the same real part \(c\). A factor and its inverse have the same real part. For \(N=0\) the image is the identity and for \(N=1\) the real part is \(c\). For \(N\geq2\) put \(\sigma=1\) if \(c\geq0\) and \(\sigma=-1\) otherwise. Multiplying each factor by \(\sigma\) centers its spherical distance from the identity at \(\theta=\arccos |c|\). Left multiplication by a unit quaternion is an isometry of the round three-sphere, so the triangle inequality bounds the distance of the resulting product from the identity by \(N\theta\). At \(N\theta<\pi\) this gives
\[
\sigma^N\operatorname{Re}(\mathrm{image})\geq \cos(N\theta).
\]
The [exact replay](../numerics/gst_four_slides.py) uses the signed abelianization recurrence and the Christoffel representative for each resulting vector up to inversion. It compares real parts exactly using their signs and rational squares, with \(\cos(N\theta)=T_N(|c|)\) for the Chebyshev polynomial \(T_N\). Counts never exceed five at this depth. It uses an angular bound only when \(N\theta<\pi\), or when comparison to \(-1\) is vacuous at the endpoint.

## Five evaluations

The first two evaluations are those of the [three-slide note](GST_THIRD_SLIDE_QUOTIENTS.md#representations-and-arithmetic), in order \(r\) survives, then \(s\) survives. They leave 58 branches. For two more with \(r\) surviving, take
\[
x=(1-i)/\sqrt2,\qquad
y=(D+M i+\sqrt{3D^2-M^2}\,j)/(2D)
\]
at \((M,D)=(-1,16)\) and \((-13,8)\). They give \(x^4=y^3=-1\), and exclude 16 and six more branches, respectively. The last evaluation leaves \(s\) surviving. Take
\[
x=(-17+10i+\sqrt{11}\,k)/20,\qquad
y=(-17+10i-\sqrt{11}\,k)/20.
\]
Here \(x=q^{-1}p\) and \(y=p^{-1}q^2\) for \(p=i\) and \(q=(10-17i+\sqrt{11}\,j)/20\), with \(p^2=q^3=-1\). It excludes four more branches.

## Branches remaining in this test

Each listed sign sequence applies independently to each direction sequence in its row. The slope is the fourth moved component's abelianization up to sign.

| Directions | Slope | Counts \((n_r,n_s)\) | Signs |
| --- | --- | --- | --- |
| RSRR, RSRS | \((1,0)\) | \((3,5)\) | +--- |
| RSRR, RSRS | \((5,-4)\) | \((3,5)\) | +-++, -++-, -+-+, --+-, ---+ |
| SRRR, SRRS | \((6,-5)\) | \((4,3)\) | -+--, --+-, ---+ |
| SRSR, SRSS | \((1,0)\) | \((5,3)\) | ++-- |
| SRSR, SRSS | \((5,-4)\) | \((5,3)\) | +-++, -++-, -+-+, --+-, ---+ |
| SRSR, SRSS | \((7,-4)\) | \((5,3)\) | ++++ |

These are necessary restrictions on a potential first cancellation after four unstabilized slides. The test uses products of arbitrary conjugates in its target groups. An existence result requires joining words in \(F(x,y)\) and the geometric framed realization on the marked trace.
