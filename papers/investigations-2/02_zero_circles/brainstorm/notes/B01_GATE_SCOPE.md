# Which gate experiment tests a zero?

27 November 2026. For Edward B. Baker III, Codex research lead, serving variant and effort unavailable. SP4-ZERO-B01 on the working tree based at 6a422ce. Inputs are the [launch sources](../../continuation-notes/CONTINUATION.md#exact-inputs), the [normalized branch 01 return](../../../01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_02_03_MARKED_END_20261127.md) and the [flat-transform request](../../research-progress/handoffs/REQUEST_E01_E03_20261127.md). Proofs here are working project theorems pending the [register](../../research-progress/REGISTER.md) reading. The experiment specifications are lead decisions.

## Scope fixed before the run

Use the standard smooth sphere, one marked point at infinity, and the oriented Euclidean end frame in which the three unit leading forms are self-dual. An orthogonal reversal on the inverted chart implements the master convention if the compact coordinates at the pole are positive. Write the Cartesian variables as $(x_0,y_1,y_2,y_3)$. The norm for the minimum uses the asymptotically Euclidean representative $g$ below and the Euclidean norm on the coefficients at infinity. An infimum includes the limiting value 1 there.

Run two compactly supported graphs $\mu=tF I_3$ in the bases $(dx^{0i}\pm dx^{jk})/\sqrt2$ for cyclic $i,j,k$. The first profile A uses weights $(16,8,4,2,1)/31$, the second B uses $(16,-8,4,-2,1)/31$. In both, $F(x)=\sum_j w_j P(x-c_j)$ with centers $0,e_0/2,2e_1/3,3e_2/4,4e_3/5$. Define
\[
 P(x)=\prod_{i=0}^3(h*\rho)(x_i),\qquad
 h(s)=\begin{cases}1-3s^2/2+3|s|^3/4& |s|\le1,\\
 (2-|s|)^3/4&1<|s|\le2,\\0&|s|>2.\end{cases}
\]
Here $\rho(s)$ is the probability density proportional to $\exp[-1/(1-(64s)^2)]$ on $|s|<1/64$, zero elsewhere. The translates give different spatial profiles without imposing an orbit ansatz on the pole forms. No classification of their conformal automorphisms is needed. The compact metric is $(2/(1+|x|^2))^2g$ with
\[
 g=a^2dx_0^2+|dy|^2,\qquad a=(1+tF)/(1-tF).
\]
Indeed $a\,dx^{0i}+dx^{jk}$ spans the stated graph. A flat end and the two prescribed mixtures give directly comparable tests without periodizing a transformed pole. No other pole point is in the sample.

Use both profiles at $0,\pm1/4,\pm5/16$ and probe A at $-33/64,-3/4$ and B at $3/4$. Keep these latter parameters even if an analytical bound loses its sign. Use the E01 solver, one centered odd grid per row with a second resolution on the stress rows if practical. Report numerical energies and minima separately from the enclosures below. A negative or zero numerical singular value alone cannot certify a zero. The table must say which metric and measure it uses and distinguish the first zero from the first inconclusive bound.

## Continuum bounds for all directions and all spatial points at the marked pole

**Project theorem (working).** With Fourier convention $f(x)=\int e^{ix\cdot\xi}\widehat f(\xi)\,d\xi$, write $\|f\|_A=\int|\widehat f|$, using the pointwise operator norm for matrices. The norm is submultiplicative by the convolution formula. Each nonzero-frequency flat transfer multiplier is an isometry, so acts contractively on this norm. The one-dimensional profile $h$ is $3/2$ times the fourth convolution power of the indicator of $[-1/2,1/2]$ (integration of the cubic pieces, or four integrations of point masses). Its Fourier measure is nonnegative. Its mass is $h(0)=1$. The probability convolution, translations, tensor product and weighted sum give $\|F\|_A\le1$, $|F|\le1$.

A useful sharper bound that is still independent of the FFT is
\[
 b^2=\sum_{i,j}w_iw_j\prod_{k=0}^3 h(c_{i,k}-c_{j,k}),\qquad \|F\|_A\le b\le1 .
\]
Indeed integrate the absolute value of the translation polynomial against the probability Fourier measure of the *unmollified* tensor profile. Dropping the mollifier factors costs at most one. Cauchy–Schwarz and Fourier inversion give the displayed second moment, including negative cross terms. Put $v=|t|b$. The $A$-norm of the anti-self-dual correction is at most $v/(1-v)$ by the geometric series, as is the norm of the self-dual correction to the identity. This is the physical normalized solution. To see identification, the smooth A1 pole has smooth compactly supported minus part $\psi$ by the graph equation. The plus remainder and $T_0\psi$ differ by a closed flat self-dual form. It is bounded and tends to zero (the Fourier integral for $T_0\psi$ is absolutely convergent). Its coefficients are harmonic, hence zero by ball averaging. This proves the fixed point equation for that pole, where uniqueness follows in $L^2$ for the compact minus part; alternatively the smooth minus part belongs to $A$ and uniqueness there suffices.

Pointwise, if $V$ is the plus matrix, the physical metric norm of $\omega_u$ is $(1-tF)|Vu|$ in this coframe. In particular with $s=|t|$ and $m_\omega=\inf_{x,|u|=1}|\omega_u|_g$,
\[
 (1-s)\max\{0,(1-2v)/(1-v)\}\le m_\omega\le1 .
\]
For A with $t<0$ one may replace the first factor by 1. This is a continuum error enclosure for the unknown infimum. A grid estimate $d$ has error bounded by the larger of its distances to the enclosure endpoints. A tighter experimental resolution difference is a diagnostic. Positivity proves invertibility for every spatial point and direction at this pole.

## Curvature and positivity of the same class

**Project theorem (working).** In the coframe $a\,dx_0,dy_i$, take the unit-sphere-positive curvature convention. The only independent curvature components are $R_{0i0j}=-a_{ij}/a$ for $i,j$ transverse. One checks from $d(a\,dx_0)=\sum (a_i/a)dy_i\wedge(a\,dx_0)$ that the connection forms are $\omega_{0i}=(a_i/a)(a\,dx_0)$, $\omega_{ij}=0$; their derivatives give this formula. Thus $R=-2\Delta_y a/a$, both Weyl blocks equal $-(D_y^2a)_0/(2a)$ (subscript 0 means trace-free), and $dV=a\,dx$. Both exact chiral ratios are therefore
\[
 e/T=\frac1{16\pi^2}\int_{\mathbb R^4}\frac{|(D^2_y a)_0|^2}{a}\,dx .
\]
This uses the [first master's metric conventions](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex). The smooth compactification gives the same integrals.

**Certificate (rational input).** The integrals of $h^2,(h')^2,(h'')^2$ are $151/140,3/2,6$. The integrals of $h^4,(h')^4$ are $122559/160160,1233/1120$. Each follows by integrating the two displayed polynomials on $[0,1],[1,2]$ and doubling. Tensor products and the triangle inequality give $\|D_y^2 F\|_2<7$ by summing three diagonal and six off-diagonal squared norms. Likewise $\||\nabla_yF|^2\|_2\le3\sqrt{(1233/1120)(122559/160160)^3}<9/4$. Translations, probability averaging and the weights preserve these bounds.

**Project theorem (working).** Put $m=(1-s)/(1+s)$ and $d=1-s$. For A and negative $t$, one may set $d=1$, since $F\ge0$. For both profiles one may further use $m=(1-v)/(1+v)$, $d=1-v$ where advantageous, by the preceding supremum estimate. The chain rule bounds
\[
 \|D_y^2a\|_2\le D=14s/d^2+9s^2/d^3,\qquad
 0\le e/T\le D^2/(16\pi^2m).
\]
Two integrations by parts give $\|\Delta_y a\|_2=\|D_y^2a\|_2$. The Yamabe numerator on compactly supported $z$ in this chart is bounded below by $6m\|Dz\|_2^2-2D\|z\|_4^2$. Use $m\le a,1/a$, the scalar formula, and Cauchy–Schwarz. 

**Import.** Talenti's main theorem, §0 (1)–(2), pp. 353–354, applied to compactly supported real test functions in $\mathbb R^4$ with $p=2,q=4$, gives $\|z\|_4^2\le S^2\|Dz\|_2^2$, $S^2=\sqrt6/(8\pi)$. [Primary text](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf)

**Project theorem (working).** If $K=6m/S^2-2D>0$, then $Y(c)\ge\sqrt m K>0$ since $\|z\|_{4,g}^2\le m^{-1/2}\|z\|_4^2$. For the compact representative $\Omega^2 g$, replace its compactly supported test $f$ away from $p$ by $z=\Omega f$. Integration by parts using $R_{\Omega^2g}\Omega^3=R_g\Omega-6\Delta_g\Omega$ gives equal numerators and the denominators agree. The scalar identity follows by substituting $\widehat\Gamma^k_{ij}-\Gamma^k_{ij}=\delta^k_i l_j+\delta^k_j l_i-g_{ij}l^k$ with $l=d\log\Omega$ into the curvature trace. Smooth tests on the sphere are approximated in $H^1$ and $L^4$ by cutting out a radius-$\delta$ ball about $p$: the cutoff gradient costs $O(\delta^2)$ in squared $L^2$. If $K\le0$, record the test as inconclusive. Rounded enclosures must be outward or given by exact expressions.

## What would refute the bridge?

**Project theorem (logical criterion).** A counterexample on the standard sphere needs one smooth positive subcritical class for which, for *every* pole $p$ and *every* direction $[u]$, there exists $q\ne p$ with $\omega_{p,u}(q)=0$. One marked zero, an everywhere-singular sample in the direction variable, or a finite list of poles supplies fewer quantifiers. A nonzero local degree on a transverse three-disk can certify a zero and its persistence over an explicitly controlled parameter neighborhood. A refutation by such certificates needs neighborhoods covering the entire compact bundle of marked directions. A positive lower bound for even one direction on all of $S^4\setminus p$, including the end, gives an affirmative witness for its class.

**Heuristic / decision.** A single uniform Wiener bound would predetermine the answer for small amplitudes. Keep separate larger-amplitude stress rows and both signs. No orbit reduction, sign inference from a point sample, or assumption that fixed-parameter transversality holds is part of the experiment. The bridge for arbitrary entered classes is outside the test. If E01 misses its tolerance, revise the solver or replace the gate computation on these same profiles with continuum enclosures and an independently validated Fourier approximation before issuing E02.
