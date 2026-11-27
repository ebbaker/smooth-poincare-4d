# Marked rotation obstructs constant-curvature lens half-disks

27 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Bounded [SP4-CUT-SEAM-E10 r1](../research-progress/handoffs/E10_REQUEST_R1.md), requested GPT-6.2 Sol/ultra, exact serving model and effort unavailable. Working HEAD bc2c1bbccc1d. Read [E09A](../notes/E09A_LENS_METRIC.md) working object 95763c57869c, [E09B](../notes/E09B_LENS_MARKING.md) bb0cd898bc33 and [E03](../notes/E03_DERIVATION.md) 2c45fc5b9c65. Positive-definite smooth oriented category, unit-sphere-positive curvature operator, Hilbert–Schmidt Weyl norms on real chiral two-forms, $T=4\pi^2$.

**Result.** For the two marked round-punctured-lens exteriors and unit round $S^2$ connection fibres of E09, the full fixed-axis, constant-Gaussian-curvature half-disk family requires $E_\pm\ge (501/250)T$ in each chirality. The two constants, puncture radii, connection fields and axes may differ. The estimate uses the displayed puncture-fibre marking, an umbilic seam at the two diameters, and the flat product first jet at each attaching arc. It includes axes transverse to the Hopf directions. The scope is the marked model and curvature-convergent smoothings of its fixed members. Robin signs cannot remedy this energy lower bound.

## Actual marking and the two holonomies

In the embedding from the two-twist-spun trefoil, a compact fibre is $N=L(3,1)^\circ$. Cutting its exterior bundle over the two complementary intervals gives two copies of $N\times I$ with the recorded fibre-face markings. For the second side the knot neighbourhood $S^2\times D^2$ is attached along one boundary arc of the disk, times $S^2$. This just extends the puncture collar in that side, by joining a disk to the collar rectangle along an edge, and keeps the two end copies of $N$. The resulting cut is the rounded boundary of $N\times I$, namely $L(3,1)\#-L(3,1)$, with its punctured lens ends and spherical connector. Each page inclusion into either complete side is a generator on $H_1=\mathbb Z/3$. After choosing the row $(1,1)$ on the first side, integral Mayer–Vietoris for the actual $S^4$ forces the row on the second side to be $(1,-1)$ up to overall sign and reordering. Conversely the two relations $u_1=u_2^{\epsilon_-}=u_2^{\epsilon_+}$ in the marked van Kampen pushout give the trivial group precisely for these opposite signs. This check uses the actual two page inclusions with their product transports. [Zeeman, main theorem and Corollary 5, pp. 486–487](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/zeemantwist.pdf#page=16) · [Burke–Burton–Spreer, §6.2, the two-bridge fibre and trefoil construction](https://link.springer.com/article/10.1007/s00454-026-00818-w)

In the round model $L(3,1)$ is the quotient by $\gamma=\cos(2\pi/3)I+\sin(2\pi/3)J$ on $\mathbb R^4=\mathbb C^2$. An identification of marked round punctured pages lifts to the sphere minus the three puncture balls, the simply connected covering domain. A conformal identification is already isometric in the round representatives. Indeed, for induced lift scale $w^{-2}$ the two round Einstein metrics give $\nabla^2 w=\psi g$. The spherical curvature commutator gives $d\psi=-dw$, so $w=a+\langle b,p\rangle$ by solving the resulting Hessian equation on great circles and continuing across the connected domain. The deck-invariant function $w$ has $b=0$ since $\gamma$ fixes no nonzero real vector. The constant scale is one because both sectional curvatures are one. The lifted isometry extends to an orthogonal transformation $A$ by matching its value and differential and using normal coordinates. Thus $A\gamma A^{-1}=\gamma^\epsilon$ gives $AJ=\epsilon JA$. On a puncture sphere its orthogonal derivative sends its oriented Hopf pole $Jp$ to $\epsilon J(Ap)$. This argument permits conformally round exterior pages, even when the radial factor used to match the cap varies. [E09B marking](../notes/E09B_LENS_MARKING.md#signed-projections-and-transport)

In the exterior product identification of endpoint sphere frames the two Hopf poles on side $i$ are thus the same unit vector $v_i$. The cap transport on the diameter gives $T_i\in SO(3)$ relative to those frames. The connector has the cylinder metric in its parallel frame, since restricting a connection to the base interval can be trivialized by parallel transport. In those frames a marked boundary isometry has a constant sphere rotation, using the cylinder's Ricci eigenspaces. A marked conformal identification has the same conclusion about the angular action. The two boundary spheres of the cylinder become concentric spheres in the Euclidean annulus scale. In flat coordinates the reciprocal conformal factor $w$ satisfies $\nabla^2w=|\nabla w|^2 I/(2w)$, so its right-hand coefficient is constant by differentiation and $w$ is constant or a positive multiple of $|x-x_0|^2$. Hence the map is a similarity or a similarity composed with inversion at $x_0$. Inversion sends two concentric spheres to spheres with distinct centres unless $x_0$ is the common centre. It follows that the map acts by the same element of $O(3)$ on the two unit angular spheres, including a radial reversal. The conformal Hessian formula used here and on the pages is the trace-free part of the conformal Ricci law, which follows from the Levi–Civita change $\widehat\nabla_XY=\nabla_XY+du(X)Y+du(Y)X-g(X,Y)\nabla u$ for $\hat g=e^{2u}g$.

Thus the actual endpoint matching matrices $f_-,f_+\in O(3)$ satisfy $f_+T_1=T_2f_-$ after labelling the second connector in the corresponding direction. Reversing that direction replaces $T_2$ by $T_2^{-1}$ and leaves the bound below intact. The vectors obey $f_\pm v_1=\epsilon_\pm v_2$, so opposite signs force $f_+f_-^{-1}$ to take $v_2$ to $-v_2$. Its determinant is $+1$ by the connector relation, hence it has rotation angle $\pi$. By the triangle inequality for the rotation angle distance $d$ on $SO(3)$,
\[
 \pi \le d(I,T_1)+d(I,T_2).
\]
This argument never restricts which direction the rotations use. In the fixed-axis model take an oriented unit axis $n_i$ in a global cap gauge and write the connection $d+\alpha_i n_i\times$ and curvature $f_i n_i\,dA_{q_i}$. The attaching arc has trivial transport in the exterior product frames, so $T_i$ is the holonomy of the half-disk boundary up to conjugacy and inversion. Abelian Stokes gives its angle modulo $2\pi$ as $\Phi_i=\int f_i\,dA_{q_i}$ up to sign, and therefore
\[
                    |\Phi_1|+|\Phi_2|\ge\pi .                 \tag{1}
\]
A flat gauge change transports the physical endpoint labels too. It leaves this holonomy test unchanged.

## Boundary jet and pointwise Weyl calculation

For one cap suppress the side index. The base metric is a smooth space-form half-disk in geodesic polar coordinates, $ds^2+r(s)^2d\theta^2$ with $0\le\theta\le\pi$, centre jet $r(0)=0,r'(0)=1$, and Gaussian curvature $c$. On the normalized puncture collar the metric is a unit round sphere fibre over $d\rho^2+(\ell/\sin r_0(\rho))^2 d\theta^2$, with $d\rho=dr_0/\sin r_0$. At the attaching arc its logarithmic outward derivative is $-m=-\cos r_0$ with $0<r_0<\pi/3$, so $1/2<m<1$. Here the puncture radius notation on the collar means its radial coordinate, with the value at the arc denoted by the same $r_0$. The curvature ODE is $r''+cr=0$. The flat or hyperbolic radial solution has nonnegative derivative and cannot match that negative logarithmic derivative. For $c>0$ the radial solution is $r(s)=\sin(\sqrt c\,s)/\sqrt c$. At the outer arc $s=S$, match $r'(S)/r(S)=-m$ with $\pi/2<\sqrt c\,S<\pi$. Consequently
\[
 \cos(\sqrt c\,S)=-\frac{m}{\sqrt{c+m^2}},\qquad
 A=\operatorname{Area}(D)=\frac{\pi a}{c},\qquad
 a=1+\frac{m}{\sqrt{c+m^2}}>1+\frac1{\sqrt{4c+1}},\qquad 1<a<2.       \tag{2}
\]
The diameter is contained in a great circle. Its interior half-disk lies in one hemisphere of the complete sphere of curvature $c$.

At a boundary curve take a unit basic horizontal tangent $e_1$, horizontal unit normal $e_2$ and vertical tangent $U$. For the full inverse image of the curve the mixed second fundamental form equals $-\langle f n\times p,U\rangle/2$, by the vertical connection term in the Koszul formula. At an umbilic diameter this off-diagonal entry is zero. At the attaching arc it agrees with zero by the product first-jet matching in the marked fibre collar. In either case requiring it at every fibre point $p$ forces $f=0$. Hence $f\in H^1_0(D)$. The argument uses the first jet and remains valid when both pieces are matched only to $C^1$ before curvature-convergent smoothing.

Here is an independent pointwise check of the energy coefficient. Put $b=f n$, $C=b\times p$, $u=|C|^2$, $k=b\cdot p$, and choose oriented orthonormal $e_1,e_2$ horizontal and $e_3,e_4$ vertical, with $e_4=p\times e_3$. Use $\mathcal R_{ij,ab}=\langle R(e_i,e_j)e_b,e_a\rangle$. Koszul gives
\[
 (\nabla_XY)^V=-\tfrac12 C_{XY},\qquad
 \langle\nabla_U X,Y\rangle=\tfrac12\langle C_{XY},U\rangle,\qquad
 (\nabla_U V)^H=0,
\]
where $X,Y$ are basic horizontal and $U,V$ vertical. The vertical bracket is $[X,Y]^V=-C_{XY}$. In the horizontal sectional curvature the covariant derivatives contribute $-u/4$ and the bracket term contributes $-u/2$, giving $\mathcal R_{12,12}=c-3u/4$. The vertical section is $1$ and the mixed sections are $C_\alpha^2/4$ for $\mathcal R_{i\alpha,i\alpha}$. Also $\nabla_U^S C=k\,p\times U$, so the normal connection on the totally geodesic fibre has curvature $kJ$ with $Je_1=e_2$. Thus $\mathcal R_{12,34}=-k$. Computing $\langle R(e_1,U)V,e_2\rangle=-\langle\nabla_U^S C,V\rangle/2$ gives $\mathcal R_{13,24}=-k/2$ and $\mathcal R_{14,23}=k/2$. The scalar curvature is $R_g=2(c+1)-u/2$.

The three chiral basis vectors are $(e^{12}\pm e^{34})/\sqrt2$, $(e^{13}\mp e^{24})/\sqrt2$ and $(e^{14}\pm e^{23})/\sqrt2$. Removing $R_g/12$ from each diagonal, since the trace-free Ricci block exchanges chiralities, gives diagonal entries $(d_\pm,-d_\pm/2,-d_\pm/2)$ with $d_\pm=(c+1-u)/3\mp k$. For the differentiated entries choose base-geodesic fields in a gauge with connection form zero at the base point. Differentiating the vertical part of $\nabla_XY$ gives $(R(e_1,e_2)e_i)^V=(D_i b)\times p/2$. Terms containing $[e_1,e_2]^V$ in this calculation are horizontal by the fibre connection identities. Thus $u_{i\alpha}:=\mathcal R_{12,i\alpha}=-\langle(D_i b)\times p,e_\alpha\rangle/2$, while $\mathcal R_{34,i\alpha}=0$ by total geodesy of fibres and the Codazzi equation. The first row off-diagonals are $(u_{13}\mp u_{24})/2$ and $(u_{14}\pm u_{23})/2$. The only remaining chiral off-diagonal vanishes: $\mathcal R_{13,14}=\mathcal R_{24,23}=C_3 C_4/4$, and $\mathcal R_{13,23}=\mathcal R_{24,14}=0$ by the skewness of $\nabla^S C$. [Atiyah–Hitchin–Singer §1, (1.1), p. 427](https://doi.org/10.1098/rspa.1978.0143) · [Local facsimile, PDF p. 4, SHA-256 beginning a4d55168994f0581](../../../../../references/Atiyah.pdf) · [07 connection curvature conventions](../../../07_positive_subcritical_entry/notes/CONNECTION_CURVATURE.md)

In the fixed-axis gauge $D_i b=(\partial_i f)n$, so the two derivative cross terms cancel pointwise when the two off-diagonal squares are added. Counting both symmetric entries in the Hilbert–Schmidt square gives the pointwise derivative contribution $|\nabla f|^2|n\times p|^2/8$. Integrate the fibre using $\operatorname{avg}|n\times p|^2=2/3$, $\operatorname{avg}|n\times p|^4=8/15$, and $\operatorname{avg}(n\cdot p)^2=1/3$. The signed odd terms in the diagonal squares integrate to zero. In either chirality the exact resulting cap integral is
\[
 E_\pm(\mathrm{cap})=\frac{\pi}{3}\int_D\left[
 2(c+1)^2+\frac23(5-4c)f^2+\frac{16}{15}f^4+|\nabla f|^2\right]dA .       \tag{3}
\]
In particular for $c=1$ the coefficient of $|\nabla f|^2$ is $\pi/3$ in either sign before dividing by $T$. Orientation reversal just exchanges the two equal cap integrals. The product lens exteriors have zero Weyl energy in the model, and any additional exterior energy is nonnegative in either sign.

## Independent unit-curvature bound

The positive spherical coordinate normal to the bounding great circle on the hemisphere is a Dirichlet eigenfunction of $-\Delta$ at $2c$. For a compactly supported test the hemisphere eigenfunction $\psi$ gives the identity $\int(|\nabla f|^2-2cf^2)=\int\psi^2|\nabla(f/\psi)|^2$ by integration by parts. Density gives $\int|\nabla f|^2\ge2c\int f^2$ on the Dirichlet space. For the actual disk extend by zero from $H^1_0(D)$ into that hemisphere. At $c=1$ use this bound in (3), discard the quartic term, and apply (1) and Cauchy–Schwarz over the two areas. With $a_1+a_2=s_*$ the combined energy divided by $T$ is at least
\[
                  \frac23 s_*+\frac{2}{9s_*}.
\]
The expression increases above $s_*=2(1+1/\sqrt5)$, the lower endpoint from (2). At that endpoint the difference from $2$, multiplied by $9(1+1/\sqrt5)$, equals $-13/5+6/\sqrt5>0$. This verifies the E09B unit-curvature obstruction with the actual fixed-axis holonomy requirement.

## Torsion bound for unequal constant curvatures

The round sphere of curvature $c$ has the sharp isoperimetric inequality $L^2\ge 4\pi s-cs^2$ for a regular region of area $s$. Use the whole sphere for comparison, although the test function is supported inside the half-disk. For smooth compactly supported $f$, put $\mu(t)=|\{|f|>t\}|$ and $L(t)=\mathrm{Length}(\{|f|=t\})$. At regular levels coarea and Cauchy–Schwarz give
\[
 \int |\nabla f|^2\ge \int_0^\infty \frac{L(t)^2}{-\mu'(t)}\,dt,\qquad
 \left(\int |f|\right)^2\le \int|\nabla f|^2 \int_0^\infty
                  \frac{\mu(t)^2(-\mu'(t))}{L(t)^2}\,dt .
\]
These formulas integrate only the nonempty regular levels, which suffice by Sard's theorem. The absolutely continuous part of the variation of the decreasing distribution function is bounded by its total variation when changing variables, so any jumps only reduce the second factor. The last factor is at most
\[
 \int_0^A \frac{s}{4\pi-cs}\,ds
 \ \le\ \frac{A^2}{2(4\pi-cA)}
 \ =\ \frac{\pi a^2}{2c^2(4-a)} .
\]
Approximation extends the bound to $H^1_0(D)$, giving
\[
 |\Phi|^2\le \frac{\pi a^2}{2c^2(4-a)}\int_D|\nabla f|^2.                \tag{4}
\]
The spherical perimeter premise is the metric-ball minimization in Ros, §1.3, including general regions in the whole sphere. Scaling from the unit sphere gives this coefficient. For a cap the area and perimeter in polar coordinates give exactly the quadratic expression. The comparison and coarea apply to regular disconnected level sets. Ros supplies a proof via existence, regularity and symmetrization, following Hsiang. Schmidt's original general-dimensional paper was located at the archive record; the EuDML article link did not render in this reading. [Ros, The Isoperimetric Problem, §§1.1 and 1.3, Theorem 1.1 and pp. 178–179](https://www.claymath.org/wp-content/uploads/2022/03/cmip02.pdf) · [Schmidt publication record](https://geodesic.mathdoc.fr/item/MZ_1943__49_169016/)

Set $x=|\Phi|/\pi$, $p(c)=(c+1)^2/(6c)$ and $P=ap(c)$. For $0<c\le5/4$, retain the full gradient term and use $\int f^2\ge\Phi^2/A$ for its nonnegative coefficient in (3). For $5/4\le c\le3$, the hemisphere estimate $\int f^2\le(2c)^{-1}\int|\nabla f|^2$ allows a fraction of the gradient term to absorb the negative potential. Its remaining fraction is $(5-c)/(3c)$. Dropping the quartic in both ranges, (3)–(4) give $E_\pm/T\ge P+Qx^2$ with the following choices of $Q$.
\[
 \begin{aligned}
 Q&=\frac{c^2(4-a)}{6a^2}+\frac{c(5-4c)}{18a} &&(0<c\le5/4),\\
 Q&=\frac{c(5-c)(4-a)}{18a^2} &&(5/4\le c\le3).
 \end{aligned}
\]
Both are positive and agree at the common endpoint. Completing the square gives
\[
                  P+Qx^2\ge P-\frac1{100Q}+\frac{x}{5}.                \tag{5}
\]

### Exact finite sign verification

For $a>8/5$ equation (2) and $m<1$ give $c<16/9$. Since $(4-a)/a\ge1$, either formula for $Q$ gives $Q\ge c(5-c)/(18a)$. In particular $5-c>3$ yields
\[
 P-\frac1{100Q}\ge a\left(p(c)-\frac3{50c}\right)
   =\frac a6\left(c+2+\frac{16}{25c}\right)
   \ge \tfrac35 a > \tfrac{24}{25}.
\]
For $a\le8/5$ the factor $(4-a)/a$ is at least $3/2$. For $c\le5/4$ this gives $Q\ge c(5+c/2)/(18a)$ and for $5/4\le c\le3$ it gives $Q\ge c(5-c)/(12a)$. Therefore $P-1/(100Q)\ge aF(c)$, where the following lower choices suffice:
\[
 F(c)=
 \begin{cases}
 (c+2+(98/125)/c)/6, & 0<c\le1,\\
 p(c)-9/(275c), & 1\le c\le5/4,\\
 p(c)-16/625, & 5/4\le c\le3 .
 \end{cases}
\]
For the middle interval use $5+c/2\ge11/2$. For the last use $c(5-c)\ge75/16$. In the first interval AM–GM gives $F(c)\ge(1+\sqrt{98/125})/3$. For each other row, its chosen formula for $F$ increases because $p'(c)=(1-c^{-2})/6\ge0$ at $c\ge1$. Use the left endpoint for $F$ and the right endpoint $r$ for the decreasing factor $1+1/\sqrt{4c+1}$. If the row table supplies a rational lower bound $a_\ell>1$, check it by $(a_\ell-1)^2(4r+1)\le1$. Check $F_\ell$ by substitution at the left endpoint, or by $(3F_\ell-1)^2\le98/125$ on the first row. All products are exact.

| Range of $c$ | $a_\ell$ | $F_\ell$ | Exact product |
| --- | ---: | ---: | ---: |
| $(0,1]$ | $36/25$ | $157/250$ | $2826/3125$ |
| $[1,11/10]$ | $143/100$ | $633/1000$ | $90519/100000$ |
| $[11/10,6/5]$ | $283/200$ | $319/500$ | $90277/100000$ |
| $[6/5,5/4]$ | $176/125$ | $161/250$ | $14168/15625$ |
| $[5/4,7/5]$ | $1389/1000$ | $3247/5000$ | $4510083/5000000$ |
| $[7/5,8/5]$ | $1367/1000$ | $33/50$ | $45111/50000$ |
| $[8/5,2]$ | $4/3$ | $339/500$ | $113/125$ |
| $[2,3]$ | $1277/1000$ | $181/250$ | $231137/250000$ |

Every product is at least $451/500$. This last step uses no sampling or floating comparison. In particular (5) is bounded below by $451/500+x/5$ for the full $0<c\le3$ range.

For $3\le c\le5$ the hemisphere bound absorbs the negative potential entirely and leaves $E_\pm/T\ge P$. Between $3$ and $4$, $p(c)\ge8/9$ and $a\ge1+1/\sqrt{17}>31/25$. The product is greater than $551/500$. Between $4$ and $5$, $p(c)\ge25/24$ and $a\ge1+1/\sqrt{21}>6/5$, again giving a product greater than $551/500$. For $c\ge5$ use the whole hemisphere estimate in (3), which leaves the residual quadratic coefficient $(2/3)(5-c)$. Complete the square in $f^2$ with the quartic term. The pointwise non-gradient sum is at least
\[
 2(c+1)^2-\frac5{48}(c-5)^2\ \ge\ \frac{91}{48}c^2+4c+2 .
\]
Since $a>1$, the normalized cap energy is at least $(91/576)c+1/3\ge647/576>551/500$. The comparison at $c=3$ is covered in both estimates.

For every cap the two ranges together give
\[
            \frac{E_\pm(\mathrm{cap})}{T}\ge \frac{451}{500}+
                            \frac15\min\{|\Phi|/\pi,1\}.
\]
The sum of the truncated nonnegative fluxes is at least one by (1). Thus any marked pairing in this model has common closed energy at least $(501/250)T$. This exceeds the strict budget by $T/250$ before any additional exterior cost. For a fixed first-jet-matched piecewise model, convergence in $C^1\cap W^{2,2}$ in the given smooth marking implies convergence of the two Weyl integrals. The strict excess thus survives every sufficiently close such smoothing of the fixed model. A normalized base with variable Gaussian curvature, a fibre geometry outside the unit-round connection ansatz, or an identification abandoning the displayed marked puncture decomposition lies outside this result.
