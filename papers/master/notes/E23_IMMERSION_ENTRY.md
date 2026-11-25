# SP4-MASTER-E23 · Entry by a Euclidean hypersurface immersion

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E calculation under the
[frozen E23 handoff](../research-progress/handoffs/E23_IMMERSION_ENTRY.md).
Input commit `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`. Master TeX
SHA-256 prefixes are `c8a9f68da492`, `8b5692f2bcab`, `0c9b1dce4aa6`,
`b972bc546624` and `f93717b0b73c`, respectively, in packet order.
Requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort
were unavailable to this helper. The metrics and integrals below live
on the smooth oriented domain, with the induced Riemannian metric
counted separately at each preimage of any ambient overlap.

## Immersion on the prescribed smooth type

Fix a smooth closed oriented homotopy four-sphere $M$. Its signature
vanishes because $H^2(M;\mathbb R)=0$. The degree-four signature
formula $\langle p_1(TM),[M]\rangle=3\tau(M)$ and
$H^4(M;\mathbb Z)\simeq\mathbb Z$ give $p_1(TM)=0$.
The Euler class evaluates to $\chi(M)=2$.
[Hirzebruch, PNAS 39 (1953), §3, Theorem 3.1, p. 953](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirzpnas.pdf#page=3)

Use an oriented degree-one homotopy equivalence $M\to S^4$ and
pull back along a homotopy inverse to classify $TM$ as a bundle
over $S^4$. The classification uses homotopy invariance of vector
bundles and oriented rank-four clutching on $S^4$. In the coordinates
$(h,j)\in\pi_3(SO(4))=\mathbb Z^2$ of Milnor's §3 the
clutching map is $v\mapsto u^h v u^j$, $u\in S^3\subset\mathbb H$.
The first Pontryagin class is $\pm2(h-j)$ times a fixed generator.
The Euler class has coefficient $h+j$ up to the common orientation
choice. Indeed its clutching obstruction is the degree of evaluation
at $v=1$, namely the power map $u\mapsto u^{h+j}$. This map represents
$h+j$ times the degree-one class by the group operation on $S^3$.
Consequently the pair of classes determines the oriented rank-four
bundle over $S^4$. The bundle corresponding to $TM$ has the same
classes as $TS^4$, so it is isomorphic to $TS^4$. Pullback and the
standard radial normal trivialization $TS^4\oplus\mathbb R\simeq
S^4\times\mathbb R^5$ give $TM\oplus\mathbb R\simeq M\times\mathbb R^5$.
A continuous trivialization of the smooth bundle can be smoothed
by uniform approximation of a global frame, preserving independence.
[Milnor, Ann. Math. 64 (1956), §3, Lemma 3 and proof, pp. 402–403](https://sites.math.rutgers.edu/~feehan/teaching/math866/milnor7sphere.pdf#page=4)

The smooth rank-five trivialization supplies a bundle monomorphism
$TM\to M\times\mathbb R^5$ and a transverse vector. This is the
equivariant frame map of Hirsch's Euclidean immersion Theorem 6.1,
with domain dimension four, target dimension five and one transversal
field. It yields a smooth immersion $F:M\to\mathbb R^5$ on the
given smooth $M$. Theorem 5.7 (take empty relative subcomplex) and
the proof of Theorem 6.1 supply the differential homotopy.
[Hirsch, Trans. AMS 93 (1959), Theorem 5.7, p. 265, and §6, Theorems 6.1–6.2, p. 269](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirsch.pdf)

## Curvatures on the domain

Let $g=F^*g_{\mathrm{eucl}}$, let $A$ be the shape operator in a
chosen global unit normal, and use $H=\operatorname{tr}A$ and
$A^\circ=A-(H/4)\operatorname{Id}$. Reversal of the normal reverses
all four principal curvatures $k_i$. The Euclidean Gauss equation
is obtained by decomposing the ambient derivatives into the induced
connection and second fundamental form. In a positively oriented
principal frame its curvature operator is diagonal on the six
frame two-forms with entries $k_i k_j$, $i<j$. Thus
\[
 R=2\sum_{i<j}k_i k_j=H^2-|A|^2=\tfrac34H^2-|A^\circ|^2 .
\]
At a point, scalar curvature is positive precisely for
$|A^\circ|^2<3H^2/4$. For example the principal data
$(k,-k,0,0)$ give negative scalar curvature, whereas $(k,k,k,k)$
with $k\ne0$ give positive scalar curvature.

Using the paired oriented orthonormal self-dual and anti-self-dual
bases, set
\[
 s_1=k_1 k_2+k_3 k_4,\quad
 s_2=k_1 k_3+k_2 k_4,\quad
 s_3=k_1 k_4+k_2 k_3,\quad
 \bar s=(s_1+s_2+s_3)/3=R/6 .
\]
Each chiral block of the curvature operator has diagonal entries
$s_i/2$. The curvature decomposition subtracts $R/12$ on each
diagonal block, so in both chiralities the Weyl eigenvalues are
$(s_i-\bar s)/2$. The Hilbert–Schmidt density is
\[
 |W^\pm|_{\mathrm{HS}}^2
   =\tfrac1{12}\big[(s_1-s_2)^2+(s_1-s_3)^2+(s_2-s_3)^2\big].
 \tag{1}
\]
For instance $s_1-s_2=(k_1-k_4)(k_2-k_3)$.
The formula is unchanged when all $k_i$ are shifted by the same
number, since the three pair sums acquire the same increment.
These are the real chiral Weyl operator norms used by the master.
[Master curvature and Yamabe normalizations](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L165)

For the sharp bound, write the eigenvalues of $A^\circ$ in order as
$(x+y+z,x-y-z,-x+y-z,-x-y+z)/2$. Then
$N=x^2+y^2+z^2=|A^\circ|^2$ and the chiral eigenvalues are
$(x^2-N/3,y^2-N/3,z^2-N/3)/2$. In particular
\[
 |W^\pm|_{\mathrm{HS}}^2=\tfrac14
          (x^4+y^4+z^4-N^2/3)\le\tfrac16|A^\circ|^4 .
 \tag{2}
\]
Equality occurs for principal trace-free data proportional to
$(1,1,-1,-1)$, up to permutation. For a rank-two shape with
nonzero product $K=k_1 k_2$, (1) gives $K^2/6$ in either chirality.

The immersion, with normal $\nu:M\to S^4$ chosen compatibly with
the orientation, also has $TM\simeq\nu^*TS^4$ as oriented bundles.
Thus $2\deg\nu=\langle e(TM),[M]\rangle=2$. The signed Jacobian
of the Gauss map is $\det A$ in dimension four, giving the signed
constraint $\int_M\det A\,dV_g=\operatorname{Vol}(S^4)=8\pi^2/3$.
The rank-two formula already permits large Weyl density where this
topological integrand vanishes.

## A quantitative sufficient integral criterion

Put $\omega_4=\operatorname{Vol}(B^4)=\pi^2/2$. For the induced
metric one has, with trace mean curvature,
\[
 4\omega_4^{1/4}\left(\int_M w^{4/3}\,dV_g\right)^{3/4}
    \le \int_M \sqrt{|dw|_g^2+H^2w^2}\,dV_g ,
 \qquad w\ge0 .
 \tag{3}
\]
This is Brendle's codimension-two inequality after composing $F$ with
the linear inclusion $\mathbb R^5\hookrightarrow\mathbb R^6$.
The additional normal direction has zero second fundamental form.

For the immersion application, the checked argument is Brendle's
§2, Lemmas 4–6 and the annulus estimate. The divergence equation is
solved on the compact connected domain with its induced metric
and smooth positive coefficient $w$. In the closed case it is
normalized to have mean-zero right side and has no boundary term.
For each ambient $\xi$ in the open unit ball the function
$u-\langle F,\xi\rangle$ takes a minimum on $M$, where $u$ is the
auxiliary solution of the divergence equation. The normal bundle
map $(x,v)\mapsto dF_x(\nabla u)+v$ therefore covers the ball from
the contact set, by the first- and second-derivative minimum
conditions. The determinant estimate differentiates in local tangent
and normal frames and uses the divergence equation on the domain.
The ensuing area inequality counts multiplicities and needs only
coverage, so it applies with overlapping sheets. The fiber volume
of an ambient radial shell of squared thickness $1-\sigma^2$ is
at most $\pi(1-\sigma^2)$ in the two-dimensional normal plane.
This is the $m=2$ step leading to (3). Approximation gives (3) for
the nonnegative $C^1$ weights used here, including $|u|^3$ for
smooth real $u$.
[Brendle, JAMS 34 (2021), 595–603, Corollary 2 and §2](https://par.nsf.gov/servlets/purl/10232897)

With $w=|u|^3$, apply Cauchy–Schwarz to
$\int |u|^2\sqrt{9|du|^2+H^2u^2}$ and cancel $\|u\|_4^2$ to get
\[
 16\sqrt{\omega_4}\|u\|_4^2
            \le 9\|du\|_2^2+\|Hu\|_2^2 .
\]
The full scalar quadratic form, using Hölder for the negative term,
therefore satisfies
\[
 \begin{aligned}
 Q_g(u)&=6\|du\|_2^2+\tfrac34\|Hu\|_2^2
              -\int_M |A^\circ|^2 u^2\,dV_g\
 &\ge \left(\tfrac{32}{3}\sqrt{\omega_4}-\|A^\circ\|_4^2\right)
                  \|u\|_4^2 .
 \end{aligned}
 \tag{4}
\]
Here and in (3), all norms and forms on the source use $g$.
An alternative uses the smaller penalty
$\|( |A^\circ|^2 - H^2/12 )_+\|_2$ in (4), by keeping exactly
$2H^2/3$ in the positive part. Thus a verifiable sufficient
criterion is the exact integral from (1) strictly below $8\pi^2$
and this smaller penalty strictly below $32\sqrt{\omega_4}/3$.
A simpler single sufficient bound is
\[
 \left(\int_M |A^\circ|^4,dV_g\right)^{1/2}
                                    <4\sqrt3\,\pi .
 \tag{5}
\]
Indeed, (2) then gives $E_+<8\pi^2$, and
$4\sqrt3\pi<32\sqrt{\omega_4}/3$ makes (4) positive. If such an
immersion is supplied, passing to a volume-one Yamabe minimizer
keeps its chiral energies and establishes entry. Formula (5) is
scale invariant under constant Euclidean dilation.

## Fixed-domain corrugation with divergent energy

Take any smooth immersion of $M$ and a coordinate disk on which a
rigid ambient motion and the inverse function theorem put its
restriction in graph form $x\mapsto(x,u_0(x))$. One can multiply
$u_0$ by a smooth cutoff to flatten a smaller cube and leave a
neighborhood of the outside fixed. Straight-line interpolation of
the heights stays immersed because the horizontal differential is
the identity. Taking the graph plane tangent at the center gives
$u_0=O(|x|^2)$ and $Du_0=O(|x|)$, so the flattening can be
arbitrarily small in $C^1$. On the flattened set choose a fixed
cube $[-a,a]^4$ and a smooth cutoff $\eta=1$ near it supported
within that set. On this domain use a normal graph perturbation
\[
 u_k(x)=\frac{\varepsilon_k}{k}\,\eta(x)
                  \big(\cos(kx_1)+\cos(kx_2)\big),
 \qquad k=\frac{m\pi}{a},\quad \varepsilon_k=k^{-1/2}.
\]
The perturbations converge to zero in $C^1$. Each new immersion
is in the original regular homotopy class by graph interpolation,
which is relative to the outer neighborhood. Ambient overlaps
with other pieces of the immersion do not affect this argument.

On the fixed cube $g=I+du_k\otimes du_k$, and
$w_k=(1+|Du_k|^2)^{1/2}$ gives the graph volume density.
The second fundamental form is $D^2u_k/w_k$. The nontrivial
two-plane principal block has curvature product
$K=\det D^2_{12}u_k/w_k^4$, using
$\det g_{12}=w_k^2$. By the rank-two case of (1),
\[
 \begin{aligned}
 E_\pm(g;[-a,a]^4)
 &=\frac{\varepsilon_k^4 k^4}{6}
   \int_{[-a,a]^4}
    \frac{\cos^2(kx_1)\cos^2(kx_2)}{w_k^7}\,dx\
 &\ge\frac{4a^4\varepsilon_k^4 k^4}
                 {6(1+2\varepsilon_k^2)^{7/2}}
   \ \longrightarrow\ \infty .
 \end{aligned}
 \tag{6}
\]
The lower bound uses $\int_{-a}^a\cos^2(kx)dx=a$. The scalar
curvature is $2K$ and takes both signs on this cube, but (6)
alone gives no verdict on its Yamabe sign. The curvature blowup
already rules out a bound on $E_+$ from first-order control or
regular homotopy data alone. The rest of the domain contributes
a nonnegative chiral energy.

## A finite graph patch with negative Yamabe form

Consider the graph $\Sigma=(x,y,xy)\subset\mathbb R^3$. Directly
from the graph formulas,
\[
 K=-\frac{1}{(1+x^2+y^2)^2},\qquad
 dA=\sqrt{1+x^2+y^2}\,dx\,dy .
\]
The parameter unit disk has $\int K\,dA=-c_0$ where
$c_0=2\pi(1-1/\sqrt2)>0$. Write $\rho=|(x,y,xy)|$,
so $|d\rho|_\Sigma\le1$ off the origin and the parameter unit
disk is in $\{\rho\le2\}$. For $R\ge2$,
$\operatorname{Area}(\rho\le R)\le16R^2$. To see the estimate
in the first quadrant, integrate $1+x+y$ over
$0\le x\le R$, $0\le y\le\min(R,R/x)$.
The portion $x\le1$ is at most $5R^2/4$.
On $1\le x\le R$, integration gives at most
$R\log R+R^2+R^2/2\le5R^2/2$. Four quadrants give the claim.

For a fixed positive integer $N$, choose the piecewise smooth
cutoff $\chi$ that is one below $\rho=2$, zero above
$\rho=2^{N+1}$, and linear as a function of $\log\rho$ between.
The energy of this cutoff is at most $64/[N(\log 2)^2]$ by bounding
$\int\rho^{-2}dA$ on each of the $N$ dyadic annuli by $64$.
Also $\int K\chi^2dA\le-c_0$. Fix $N$ sufficiently large, for example
$N=1000$, so that
\[
 6\int_\Sigma|d\chi|^2dA+2\int_\Sigma K\chi^2dA\le -c_0 .
\]
Now take the codimension-one product graph
$(x,y,z_1,z_2)\mapsto(x,y,z_1,z_2,xy)$ in $\mathbb R^5$.
It has metric $g_\Sigma+|dz|^2$ and scalar curvature $2K$. For
a nonzero $\phi\in C_c^\infty(\mathbb R^2)$ and
$u(x,y,z)=\chi(x,y)\phi(z/L)$, its full quadratic form is
\[
 Q(u)\le
  -c_0 L^2\int_{\mathbb R^2}\phi^2
  +6\left(\int_{\mathbb R^2}|d\phi|^2\right)
                                  \left(\int_\Sigma\chi^2dA\right).
\]
Fix $L$ large enough for strict negativity. The entire supported
test now lies in a fixed compact coordinate box. Smoothing the
cutoff in $H^1$ there preserves the strict inequality.

Multiply the graph height by a cutoff equal to one around that
box, and fit the resulting finite patch into any flattened source
chart by scaling all five coordinates by a common $\lambda>0$.
The induced metric on the test patch pulls back to $\lambda^2$
times the product metric, so its quadratic form is multiplied
by $\lambda^2$ and remains negative. Graph interpolation gives a
regular homotopy relative to the same outside neighborhood as
above. Extension of the test by zero to $M$ proves $Y([g])<0$
on every such completion. The same construction can be made in
any regular homotopy class of immersions of $M$. If desired,
the negative-form patch and the high-energy patch of (6) can be
placed in disjoint source charts on the same immersion.

## Return to B02

The stable tangent bundle and Hirsch theorem solve the existence of
an immersion on every prescribed smooth type. The missing step is a
selection of an immersion with quantitative second-order control,
such as (5) or the two independent integral inequalities following
(4). Formal immersion and regular homotopy supply no such bounds.
The explicit changes above preserve the regular homotopy class and
can produce arbitrarily large chiral energy or a negative Yamabe
class on any of the candidate smooth types. These examples leave
open whether some controlled immersion achieves entry on each type.
