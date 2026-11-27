# Rigidity tests at an attained fixed-type minimum

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E derivation and independent reading under master B06. Actual serving model variant and reasoning effort were unavailable. Inputs at `72068cef1973d23aee808fe66476c44ed4b99cc5` include the [master plan](../research-plan/PLAN.md) (`840a588d4c48`), [master manuscript](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex) (`b5d6bfb4cf79`), [closed comparison](../manuscript/marked_cut.tex) (`dac42a05369a`), [03 first-value theorem](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex) (`5abc9c7713da`), [06 attainment assessment](../../investigations-1/06_bour_flow_and_fixed_type_attainment/reviews/FIXED_TYPE_ATTAINMENT_20261126.md) (`cacb2e70d9cf`), and [08 Robin and cap return](../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md) (`835cff73b949`). Hashes are SHA-256 prefixes. Attainment, exact compactness and the mass gap are imported on their stated hypotheses. The new mixed identity, localized mass comparison and cap test below are written out and await a further reading.

Let $M$ be a closed connected oriented smooth homotopy four-sphere. All metrics are smooth and Riemannian except the explicitly described first-jet caps. With the real curvature-operator Hilbert–Schmidt convention, $e=E_+=E_-$ and $T=4\pi^2$. Throughout the minimum tests $I=I^+(M)<2T$ is attained by a positive class. On a nonstandard type the master lower gap gives $I>T+\varepsilon_*$.

## Exact least-$D$ selection

Assume $M$ is nonstandard. Attainment implies Bach-flatness by openness of positive Yamabe sign. Every exact positive critical value is an admissible test in the infimum defining $I$, so the exact first value $a_M$ equals $I$. Choose $0<\delta\le2T-I$. The 03 compactness hypothesis at $b=a_M$ is $a_M\le2T-\delta$ and $a_M<a_M+\kappa_\delta$. The second inequality holds because $\kappa_\delta>0$. This gives smooth sequential compactness modulo oriented diffeomorphisms on the exact stratum of volume-one Yamabe representatives. For each fixed smooth test function, transport the Yamabe inequality to the fixed manifold and pass to the smooth limit. The scalar constants converge to the scalar curvature $s$ of the limit, and the constant test attains the limiting bound $s$. The energy and Bach equation pass as well. The Gauss–Bonnet identity yields

\[
D=\int_M|\operatorname{Ric}_0|^2\,dV=4I-\frac{Y_{\rm rd}^2-Y^2}{12},
\qquad Y_{\rm rd}=8\sqrt6\,\pi.
\]

Thus least $D$ and least $Y^2$ select the same exact representatives. If $D=0$ occurs, the selected metric is positive Einstein. Every positive Einstein metric on a closed manifold is Yamabe by the Yamabe theorem and Obata's conformal rigidity, so $D>0$ at the selector excludes an Einstein metric in every exact minimizing class on this type. The maximum of $Y^2$ on this stratum is strictly below $Y_{\rm rd}^2$ by the spherical Yamabe equality theorem. Finiteness of represented types in each fixed band, conditional on 06, makes this deficit uniform on the nonempty union of exact nonstandard strata in that band. Least $D$ compares only points on the exact stratum. The Weyl variations below use openness of the Yamabe sign and require no differentiable choice of a Yamabe representative. [Master fixed-band corollary](../manuscript/exact_closed_types.tex) · [Lee–Parker, §§3 and 11](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

## Mixed physical Hessian in the Yamabe gauge

Let $g$ be smooth, constant-scalar $s>0$, and Bach-flat on $M$. Write $Z=\operatorname{Ric}_0$, $A=Z^\sharp$, $s_j=\operatorname{tr}(A^j)$, $Q=Z\circ Z-s_2g/4$, and $H_g=D^2E_+$. Use $\Delta=\nabla^i\nabla_i$, $(\mathrm{Rm}\cdot Z)_{ij}=R_{ikjl}Z^{kl}$, and let $L_i$ be the endomorphism with components

\[
(L_i)^a{}_j=\tfrac12(\nabla_i Z^a{}_j+\nabla_j Z^a{}_i-\nabla^a Z_{ij}).
\]

The mixed pairing is

\[
\begin{split}
4H_g(Z,Q)=\int_M\bigg[&-2 Z^{ij}\operatorname{tr}(A\nabla_iA\nabla_jA)
+2g^{ij}\operatorname{tr}\big(A[L_i,A]\nabla_jA+A\nabla_iA[L_j,A]\big)\\
&-\tfrac13\langle\nabla^2 s_2,Q\rangle
-\tfrac{s}{6}s_4+\tfrac{s}{24}s_2^2-\tfrac13s_2s_3\bigg] \,dV_g .
\end{split} \tag{1}
\]

For the derivation, $G=4\nabla_{L^2}E_+$ is the gradient of $\int(|\operatorname{Ric}|^2-R^2/3)\,dV$. Its formula for arbitrary smooth nearby metrics is

\[
G=-\Delta Z-2\mathrm{Rm}\cdot Z+\tfrac13(\nabla^2R)^0+\tfrac R6Z+\tfrac12s_2g.
\]

Here and in the varied expression, all contractions and trace projections use the varying metric. At all these metrics $\mathrm{Rm}(Z,Z^2)=-s_4-Rs_3/12+s_2^2/2$. Indeed the $W(Z,Z^2)$ term is zero for every trace-free $Z$ in dimension four. In its eigenframe the coefficients of the three complementary Weyl sectional pairs are all minus the third elementary symmetric polynomial in its eigenvalues, and the three Weyl weights sum to zero. Integration by parts therefore gives

\[
\int_M\langle G,Z^2\rangle\,dV=
\int_M\left[2g^{ij}\operatorname{tr}(A\nabla_i A\nabla_j A)
  +2s_4+\tfrac R3s_3-\tfrac12s_2^2+\tfrac13\langle\nabla^2R,Q\rangle\right]dV .
\]

Differentiate along $g+tZ$ at the Bach-flat background. The left side has derivative $4H_g(Z,Q)$ because $G=0$, and the trace direction is in the Hessian kernel. The contracted Bianchi identity makes $Z$ transverse-traceless, and the linearized Ricci tensor is $-\Delta_L Z/2$. Using $G=0$ and $R=s$ gives $R'=-s_2$, $Z'=Z^2-sZ/12$, $A'=-sA/12$, and $(dV)'=0$. Also $\partial_t\nabla_i A=-s\nabla_i A/12+[L_i,A]$ at zero. Subtracting $-s/4$ times the stationary integral, which is zero, cancels the common scalar multiples of the first term and the $s_3$ term. The other algebraic pieces and the differentiated scalar Hessian give (1). [E20, gradient and tangent identities](E20_CLOSED_VARIATION.md) · [Owning Cotton reduction](../01_fixed_type_variational_descent/manuscript/cotton_variation.tex) · [Gursky–Viaclovsky, equations (2.2)–(2.5), (2.8)–(2.9), and (3.1)](https://arxiv.org/pdf/1105.4648)

For a check on the scalar terms of (1), take the locally conformally flat product of a circle with a round three-sphere of curvature $k$. It has parallel $Z$ with spectrum $(-3a,a,a,a)$ for $a=k/2$ and $s=12a$. The right side of (1) then vanishes. Since $Q=-2aZ$ and the relative-scale path preserves conformal flatness, the mixed pairing also vanishes directly. This calibration concerns a different topology and the derivative terms vanish on it.

At a true positive minimum the bilinear form vanishes against every conformal or diffeomorphism tangent and is nonnegative on all smooth directions. This follows by differentiating the invariance and by admissibility for small metric perturbations. Hence

\[
H_g(Z,Q)^2\le H_g(Z,Z)H_g(Q,Q).
\]

A strict reversal yields an actual negative direction in $\operatorname{span}\{Z,Q\}$. In particular when the known Ricci-direction integral is zero, a nonzero value of (1) supplies a strict decrease on the same type. For a stability candidate satisfying $H_g(Z,Z)=0$, (1) is a necessary integral equality. Its differentiated connection, scalar Hessian and cubic terms have no established sign from the subcritical bound. The formula computes a second entry of the two-direction matrix and leaves $H_g(Q,Q)$ and a forcing estimate open. Even if that matrix is nonnegative, variations outside its span still have to be considered.

## Einstein spectrum and a one-ball rigidity criterion

For a smooth positive Einstein metric of scalar curvature $s$, put $\Delta_L h=\Delta h+2\mathrm{Rm}\cdot h-(s/2)h$ on transverse-traceless tensors. If $-\Delta_L h=\lambda h$, then in this normalization

\[
H_g(h,h)=\tfrac18(\lambda-s/2)(\lambda-s/3)\|h\|_2^2 . \tag{2}
\]

Indeed in four dimensions $4E_+$ equals $\int(|\operatorname{Ric}|^2-R^2/3)\,dV$ up to an additive topological constant. Gursky–Viaclovsky Theorem 3.10 for $n=4,\tau=-1/3$ supplies the factor $1/2$ in its Hessian. The open forbidden interval is $(s/3,s/2)$, and both endpoints have zero Hessian. On the closed transverse-traceless space the operator is self-adjoint elliptic with discrete spectrum. The trace and diffeomorphism directions are in the Hessian kernel, so avoiding the interval suffices for this second-order test. An upper bound for only the first eigenvalue can leave the whole low spectrum at or below $s/3$. On the equal-curvature product of round two-spheres, there is a relative-scaling mode at zero and the next eigenvalue is at least $4k$, where $k$ is the sectional curvature of each factor and $s=4k$. This product checks the role of the two roots in a different topology. [Gursky–Viaclovsky, Theorem 3.10 and Proposition 7.9](https://arxiv.org/pdf/1105.4648)

At an Einstein exact minimum, $D=0$ also makes this metric a global minimum of $F^p=2(1-p)e+pD/2$ over all smooth metrics in positive conformal classes on $M$, for $0<p<1$. In the same mode $Z'=(\lambda-s/2)h/2$, giving

\[
D^2F^p_g[h,h]=\tfrac14(\lambda-s/2)(\lambda-s/3-ps/6)\|h\|_2^2.
\]

The strict window becomes smaller at fixed positive $p$. Existing signed energy and normalized volume restrictions still apply. Here $e=2T-Y^2/48$ and $e\ge16\pi^2/3+\eta_E$ on the nonround class under the exact compactness used in E05. The E40 signed determinants further bound $e$ in terms of the two integrated determinant deficits. [E05](E05_CLOSED_STABILITY.md) · [E40](E40_CLOSED_PINCHING.md)

**One-ball criterion.** Normalize $\operatorname{Ric}=3g$. If some point $p$ has $\operatorname{inj}_p>\pi/2$ and the radial sectional curvatures throughout $B_{\pi/2}(p)\setminus\{p\}$ satisfy $K(\partial_r,v)\ge-1/1000$, then $g$ is homothetic to round on the homotopy sphere. This claim applies to the positive Einstein metric independently of minimization. In the unscaled Einstein metric the radius is $(\pi/2)\sqrt{12/s}$ and the assumed lower sectional bound is $-s/12000$. [Gursky–Malchiodi, mass gap Theorem 1.5, arXiv:2512.07257v1](https://arxiv.org/html/2512.07257v1) · [Gursky–Malchiodi, radial and Green-function comparisons, Lemmas 2.1–2.2 and Theorem 3.1, arXiv:2609.30803v1](https://arxiv.org/html/2609.30803v1)

Set $\epsilon=1/1000$. The radial Ricci trace bounds each radial curvature above by $3+2\epsilon$. Write $F(k,r)=\sqrt{k}\cot(\sqrt{k}r)$ for $k>0$, $F(0,r)=1/r$, and $F(k,r)=\sqrt{-k}\coth(\sqrt{-k}r)$ for $k<0$. Radial Jacobi-field comparison shows that the three nonradial eigenvalues of $\nabla^2r$ are in $[a,b]$, where $a=F(3+2\epsilon,r)$ and $b=F(-\epsilon,r)$. This uses only the radial bounds along each geodesic and the normal ball. The lower comparison has no pole for $0<r\le\pi/2$. With $q=\Delta r$, the Riccati equation and the elementary inequality $x^2\le(a+b)x-ab$ for $x\in[a,b]$ give

\[
q'+(a+b)q\ge 3ab-3.
\]

The function $a+2b$ solves the equality since $a'=-a^2-(3+2\epsilon)$ and $b'=-b^2+\epsilon$. The integrating factor is positive and comparable to $r^2$ near zero, while $q-(a+2b)=O(r)$. Radial integration gives $q\ge f_\epsilon:=a+2b$.

On the closed manifold define $\Psi=\csc^2r$ for $r\le\pi/2$ and $\Psi=1$ elsewhere. Its value and first derivative match at $\pi/2$. For $0<r<\pi/2$,

\[
(\Delta-2)\Psi=\frac{2\cos r}{\sin^3r}(3\cot r-q)
\le \frac{2\cos r}{\sin^3r}(3\cot r-f_\epsilon).
\]

At $\epsilon=0$ the last expression is at most $4/7$ by the trigonometric inequality of Gursky–Malchiodi Lemma 2.2. The following verification also checks the constant. With $u=1/r-\cot r$ and $d=3\cot r-2/r-F(3,r)$, one has $0<u\le2\sin r/[3(1+\cos r)]$ from $r(2+\cos r)-3\sin r\ge0$. The latter function and its first derivative vanish at zero and its second derivative is $\sin r-r\cos r>0$. Differentiation gives $d'=d^2+(6u-2/r)d+6u^2$. Put $V=2\sin^3r/(7\cos r)$. Using the bound for $u$, the difference $V'-V^2-(6u-2/r)V-6u^2$ is at least
\[
\frac{\sin^2r}{147c^2(1+c)^2}
(30-52c-282c^2+496c^3+292c^4-24c^5-12c^6),\qquad c=\cos r.
\]
The minima of the degree-six Bernstein coefficients of this polynomial on the four successive intervals of length $1/4$ in $[0,1]$ are $8437/1024,\ 127/128,\ 205/16,\ 129213/1024$, respectively. These rational minima follow by using the coefficient of $t^i$ in $P((j+t)/4)$ with weight $\binom{\ell}{i}/\binom{6}{i}$ in Bernstein coefficient $\ell$. Each is positive, so $V$ is a strict supersolution. The initial expansions $d=2r^3/15+O(r^5)$ and $V=2r^3/7+O(r^5)$ give $d<V$ by first contact.

For the increase at $\epsilon>0$, use the cotangent partial fractions and $A_n=n^2\pi^2$. Separating the linear term in $k$ gives

\[
F(k,r)=\frac1r-2kr\sum_{n\ge1}A_n^{-1}-2r^3\sum_{n\ge1}\frac{k^2}{A_n(A_n-kr^2)}.
\]

The linear terms cancel in $f_0-f_\epsilon$, since $(3+2\epsilon)+2(-\epsilon)=3$. For $3\le k\le3+2/1000$, $A_n-kr^2\ge A_n/5$ and $r^2\le A_n/4$. The derivative of $k^2/[A_n(A_n-kr^2)]$ is therefore at most $140/A_n^2$. The $k=-\epsilon$ terms contribute at most $2\epsilon^2/A_n^2$, before the common factor $2r^3$. Hence

\[
\frac{2\cos r}{\sin^3r}(f_0-f_\epsilon)
 \le 4\left(\frac{\pi}{2}\right)^3(280\epsilon+2\epsilon^2)\sum_{n\ge1}A_n^{-2}
 \le75\epsilon .
\]

The last inequality uses $\sin r\ge2r/\pi$, $(\pi/2)^3<4$, and $\sum A_n^{-2}\le4/(3\pi^4)<4/243$. Thus the absolutely continuous upper bound for $(\Delta-2)\Psi$ is $C=4/7+3/40$, including the exterior where its value is $-2$. Its Dirac term is $-4\pi^2\delta_p$ by $\Psi=r^{-2}+1/3+O(r^2)$ and the small-sphere flux. The Green function normalized by $G_p=r^{-2}+A+O(r)$ has the same Dirac term. The comparison function $\Psi+C/2-G_p$ lies in $H^1$ by the Einstein Green-function remainder and satisfies $(\Delta-2)(\Psi+C/2-G_p)\le0$ in distributions. The weak maximum principle gives $A\le1/3+C/2$. In the source mass convention $m(G_p^2g)=12A-1\le3+6C=963/140<22/3$. For a nonround homotopy sphere, the mass gap applies at every pole because $\chi=2,\tau=0$, yielding $m\ge22/3$ and the contradiction. The cited comparison provides the pole regularity and flux conventions. [NIST DLMF (4.22.3)](https://dlmf.nist.gov/4.22.E3) · [Gursky–Malchiodi, §3, distributional comparison and mass formula](https://arxiv.org/html/2609.30803v1#S3)

Consequently any nonround Einstein survivor has, at every pole with injectivity radius $>\pi/2$ in the normalized gauge, a radial section in that normal ball with $K<-1/1000$. Existence of such a large normal ball and any curvature implication of minimizing stability remain separate questions.

## Positive marked caps from a boundary trace estimate

Let $\Sigma\cong S^3$ be an actual smooth embedded umbilic hypersurface with round conformal boundary metric. In one smooth representative suppose $R>0$ on $M$, and use a marking to write $h=w^2\gamma_r$ on the cut, where $\gamma_r$ is intrinsically round of radius $r$, and $w>0$ is smooth. Denote by $H_i$ the trace of the outward second fundamental form from side $V_i$, so $H_1=-H_2$. Use fixed $S^3$ boundary markings in both fillings. A sufficient condition for both smooth positive marked caps with limiting complete costs $E_\pm(V_i)$ is

\[
|H_i|w\le 3/r\quad\text{on }\Sigma . \tag{3}
\]

More generally it suffices that for all smooth real boundary traces $f$,

\[
6\left\langle wf,(\Lambda_r+r^{-1})(wf)\right\rangle_{L^2(\gamma_r)}
\ \ge\ 2\int_\Sigma H_i^- f^2\,dA_h\quad(i=1,2), \tag{4}
\]

where $H_i^-=\max(-H_i,0)$ and $\Lambda_r$ is the outward Dirichlet-to-Neumann map of the Euclidean ball of radius $r$ for the harmonic equation. This condition uses the actual boundary datum in an ambient positive scalar curvature representative.

For each side let the marked ball carry $u_i^2g_{\rm Eucl}$ with boundary value $u_i=w$ and outward derivative chosen so that its metric trace is $-H_i$. The derivative is $\partial_{\nu_{\rm Eucl}}\log u_i=-1/r-wH_i/3$. Extend the prescribed value and derivative of $\log u_i$ smoothly from a collar, then exponentiate. Since the cap and original boundary forms are umbilic, this matches both full first jets under signed Gaussian collars. The cap has zero Weyl tensor. With the Robin convention $6\partial_\nu+2H$, conformal covariance gives the cap form for $v$ as

\[
Q_{\rm cap}(v)=6\int_{B_r}|d(u_iv)|^2\,dV_{\rm Eucl}
    +\frac6r\int_{\partial B_r}(w f)^2\,dA_{\gamma_r},
\]

Here $f=v|_\Sigma$. Write $u_iv$ as the harmonic extension of $wf$ plus a zero-trace remainder. The Dirichlet energy splits orthogonally. Inequality (4) pays the adverse side boundary term with the contribution of the harmonic extension and the cap boundary term. The interior $V_i$ form controls the full $H^1(V_i)$ norm using $R>0$. Its trace controls the norm of the harmonic extension by the bounded map $H^{1/2}(\partial B_r)\to H^1(B_r)$. The remaining cap Dirichlet energy controls the full $H^1$ norm of the zero-trace part by Poincaré. Bounded smooth $u_i,u_i^{-1}$ preserve norm equivalence. Thus the matched closed form is coercive including at equality in (4). Condition (3) implies (4) because $dA_h=w^3dA_{\gamma_r}$ and $\Lambda_r$ is nonnegative. [08, Robin form and gluing](../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md)

**Independent check of the sharp $L^3$ variant.** Beckner's sharp sphere inequality gives $\langle F,(\Lambda_r+r^{-1})F\rangle\ge(2\pi^2)^{1/3}\|F\|_{L^3(\gamma_r)}^2$. On the unit $S^3$, the degree-$j$ operator eigenvalue is $j+1$ and the measure normalization follows by testing a constant. Rescaling both sides by $r^2$ for fixed boundary data proves the same form at radius $r$. For $F=wf$ the induced $L^3$ norm is precisely $\|f\|_{L^3(h)}$. Hölder now verifies (4) whenever $\max_i\|H_i^-\|_{L^3(h)}\le3(2\pi^2)^{1/3}$. The harmonic/zero-trace splitting above establishes strict closed coercivity at the inclusive endpoint. The sharp trace inequality applies to the cap, so this test permits a negative Robin sign for one original whole side. [Beckner, Theorem 4](https://annals.math.princeton.edu/1993/138-1/p05) · [Ball formulation, equations (1.4)–(1.5)](https://doi.org/10.1016/j.jfa.2019.108414)

The glued metric is piecewise smooth and $C^{1,1}$. Smooth it in a shrinking collar by cutting off the difference of the two smooth prolongations of the tangential metrics in a fixed common normal chart. Those differences vanish to second order in the normal coordinate, so the first derivatives converge uniformly and the second derivatives are bounded in the shrinking interpolation region. This is $C^1\cap W^{2,2}$ convergence, which gives $L^2$ curvature convergence. The Sobolev bound controls the change of the scalar quadratic form by $o(1)\|v\|_{H^1}^2$, and coercivity preserves the positive Yamabe sign for all sufficiently close smoothings. Capping topology gives a homotopy sphere, so the closed signature identity, after taking the limit, gives $E_+(V_i)=E_-(V_i)$ directly. The approximants may change the metric on the shrinking collar. [08 smoothing and second-jet check](../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E04_ROBIN_DESCENT.md)

In particular, if the boundary is intrinsically round in a positive entering pinched representative, then (3) is automatic with $w=1$. Indeed the umbilic Gauss identity gives $6/r^2=R-2\operatorname{Ric}(\nu,\nu)+(2/3)H_i^2$, and $R-2\operatorname{Ric}(\nu,\nu)>0$ in that gauge. For a boundary whose round metric requires a further conformal change, (3) or (4) must be checked with the original $w$ and $H_i$. [08 entering positivity](../../investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/notes/E01_DERIVATION.md) · [Chang–Gursky–Yang, positive Schouten gauge](https://annals.math.princeton.edu/2002/155-3/p02)

At an attained nonstandard minimum with either this cap test or independently certified positive cap approximants approaching the raw signed masses, $e_1+e_2=e<2T$, so one $e_i<T$. Smooth positive approximants to that capped side stay strictly below $T$. Chang–Gursky–Yang recognizes that summand, and reassembly with its actual cap and the original boundary marking identifies the other capped side with $M$. Passing to the limit in its smooth admissible energies gives $I\le e_j$, so $e_i=0$. The original smooth Bach-flat metric has $W=0$ on a nonempty open set. Lassas–Liimatainen Theorem 3.8 forces $W=0$ on the connected closed $M$. This contradicts $I>T$. The argument excludes the entire cut configuration on a nonstandard minimum, including a hypothetical conformally flat discarded side. With a nonzero surviving-side surcharge the finite cut criterion requires it to be strictly smaller than the discarded raw mass to contradict minimality. [Marked reassembly](../manuscript/marked_cut.tex) · [Chang–Gursky–Yang, Theorem A and (0.4)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf) · [Lassas–Liimatainen, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27)

## Einstein free-cut recognition without minimality

A positive Einstein metric on a homotopy four-sphere with a round-conformal umbilic $S^3$ is round independently of minimization. In the Einstein gauge let $B=\beta h$ for one normal. Contracted Codazzi gives $d\beta=0$ since the mixed normal-tangential Ricci curvature is zero. The scalar Gauss identity gives $R_h=s/2+6\beta^2$ constant. By Obata's theorem for constant-scalar metrics conformal to a round sphere, $h$ is intrinsically round with sectional curvature $k=s/12+\beta^2$. In curvature $K=s/12$, the round four-sphere has a geodesic $S^3$ at radius $\rho\in(0,\pi/\sqrt K)$ with principal curvature $\sqrt K\cot(\sqrt K\rho)=\beta$ and intrinsic curvature $k$. Thus the metric and second fundamental form agree as Einstein Cauchy data in the boundary marking, with outward normals of the same sign for this comparison. Anderson–Herzlich Theorem 3.1 gives a local isometry on a side of the cut. Hence $W=0$ on an open set, and the same unique continuation followed by the Einstein equation gives global sectional curvature $K$. Simple connectivity and completeness identify the round sphere. [Obata, conformal round equality, Lee–Parker Proposition 3.1](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Anderson–Herzlich, Theorems 1.1 and 3.1](https://www.math.stonybrook.edu/~anderson/andherz.pdf) · [Lassas–Liimatainen, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27)

## Remaining class

In the non-Einstein branch the sign or kernel condition from (1) needs a forcing theorem or a test metric. The sufficient cap test supplies the closed positive signs once its trace bound is verified on an actual round-conformal umbilic cut. No such cut is selected on a general minimum. In the Einstein branch the strict instability window, one-ball comparison and free-cut recognition leave candidates without the supplied spectral or geometric premise. The positive Einstein gap and signed energy restrictions remain necessary and give no universal exclusion within their surviving interval.
