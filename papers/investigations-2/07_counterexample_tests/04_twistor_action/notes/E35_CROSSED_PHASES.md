# SP4-TWA-E35 · Two Fourier waves with overlapping quaternion planes

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E35_REQUEST_v1.md) specifies bounded GPT-6.2 Sol/ultra execution. Actual serving model and reasoning effort were unavailable. Checkout `7c6bbab9a0a6`. The inputs were [E14](E14_FIRST_NEGATIVE_MODE.md), [E15](E15_HELICAL_COMPETITOR.md) and [E18](E18_TWO_HELICES.md) at that checkout. E35 is a floating-point search with an analytic nonvanishing test for the recorded fields.

All 24 deterministic starts were run at the exact Hessian crossing. The twelve fitted fields with both first-mode amplitudes held fixed had fully projected action excesses
\((S-S_{\rm rad})/S_{\rm rad}\) from approximately \(2.2769\times10^{-4}\) to \(9.8575\times10^{-2}\). In all twelve free fits both waves became small and the action reached the radial value to within \(4.4\times10^{-15}\) in relative units. The isolated negative values in that range vary with the quadrature or projection formula at floating-point precision. No strict lower witness was found.

## Trial fields and full action

Use the oriented flat Riemannian cylinder \([-1,1]\times(\mathbb R/\mathbb Z)^3\), the periodic spin structure, and commuting positive half-spinors in the E14 left-quaternion frame. Thus the parallel spinor is \(1\), the oriented frame corresponds to \((1,I,J,K)\), real self-dual two-forms act on the chosen half-spinors, and all pairings are real. Set \(b=51\pi/16\), \(\omega=\pi/2\), \(T=\omega t\), \(X=2\pi x_1\), \(Y=2\pi x_2\), and \(B=51/8\). The trials use

\[
h=1+C(T)e^{IX}p+D(T)e^{JY}q,\qquad s=|h|^2,
\qquad \psi=e^{bt+U(T)}s^{G(T)}h.
\]

The coefficients \(C,D,U,G\) are real linear combinations of \(f_n(T)=\sin(n(T+\pi/2))\). The first two use modes \(1\)–\(4\), \(U\) uses modes \(1\)–\(6\), and \(G\) uses modes \(1\)–\(4\). The time amplitude \(e^U\) can be absorbed into the three unmodified Fourier coefficients. The periodic log multiplier is \(G\log s\) in the chosen gauge \(a=1\). At both ends all four profiles vanish exactly, so \(h=1\), \(s=1\), and the physical traces are \(e^{\pm b}\). This search covers a finite positive-\(a\) gauge with one specified functional dependence on the norm.

Independent translations in \(X,Y\) allow the quaternion planes to be represented by

\[
\begin{aligned}
p&=(\sin\alpha,0,\cos\alpha\cos\tau,\cos\alpha\sin\tau),\\
q&=(\sin\beta,\cos\beta\cos\eta,0,\cos\beta\sin\eta).
\end{aligned}
\]

Each start had a nonzero real projection in each plane. The largest singular value of the overlap matrix of the orthonormal frames \((p,Ip)\) and \((q,Jq)\) ranged from about \(0.8960\) to \(0.9995\) across the twelve angle quadruples. A simple uniform lower bound is

\[
|h|\ge\operatorname{Re}h\ge
1-|\sin\alpha|\sum_n |C_n|-|\sin\beta|\sum_n |D_n|.
\]

For the recorded starting and fitted coefficients this bound exceeded \(0.177\) and \(0.026\), respectively. The minima of the evaluated bounds were approximately \(0.1770293\) and \(0.0266625\). The positive exponential and the real power of \(s\) then give smooth, nowhere-vanishing physical spinors. The fitted values of \(|h|\) on the \(90\times72^2\) check grid ranged from approximately \(0.597\) to \(3.747\), and the analytic lower bound controls every point between grid nodes.

Define \(\widehat\partial=(\partial_T,4\partial_X,4\partial_Y,0)\), set \(h_\mu=\widehat\partial_\mu h\), \(s_\mu=2(h,h_\mu)\), and put

\[
V_\mu=B\delta_{\mu0}+\widehat\partial_\mu U
 + (\widehat\partial_\mu G)\log s+G s_\mu/s,
\qquad z_\mu=h_\mu+V_\mu h,
\qquad z_D=-z_0+Iz_1+Jz_2.
\]

With \(Q=|P\psi|^2/(\omega^2|\psi|^2)\) and \(Q_0=3B^2/4\), the projected action and the stable relative excess formula are

\[
\begin{aligned}
Q&=\frac{|z_0|^2+|z_1|^2+|z_2|^2-|z_D|^2/4}{s}\\
 &=\frac{|z_0+z_D/4|^2+|z_1+Iz_D/4|^2+|z_2+Jz_D/4|^2+|Kz_D/4|^2}{s},\\
S_{\rm rad}&=2\omega^4 Q_0^2=9b^4/8\simeq11312.34878664,\qquad
\frac{S-S_{\rm rad}}{S_{\rm rad}}=
 \mathbb E\frac{(Q-Q_0)(Q+Q_0)}{Q_0^2}.
\end{aligned}
\]

Here \(\mathbb E\) averages over \(t\in[-1,1]\) and both unit spatial circles. In the left-action frame \(z_D\) is the scaled negative-chiral Dirac expression with the common positive factor divided out. The Clifford projection has four components even on an \(x_3\)-independent field. This formula includes the mixed terms from differentiating the norm and from squaring \(Q\). Friedrich's published §1, p. 59 and equation (1.1), were rechecked for the twistor projection and Dirac convention. The left-action sign and specialization follow from E14. [Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

## Deterministic runs and refinement

The table indexes paired starts. Run \(i\) starts with only \(C_1,D_1\) nonzero and holds both of them and all four angles fixed. It also holds \(G=0\) in runs 1 and 4. For run \(12+i\), let \(j=i-1\) and retain the table's first amplitudes and starting angles. Initialize \((C_2,C_3)=(0.14(-1)^j C_1,0.06 C_1)\), \((D_2,D_3)=(0.19(-1)^{\lfloor j/2\rfloor}D_1,-0.06 D_1)\), \(U_2=-0.035(-1)^j\), \(G_1=-0.16\), and all other profile coefficients at zero. Those twelve runs free all profile coefficients, with initial angles fixed for \(i=1,2,3,4\) and varied for \(i=5,\ldots,12\). Columns show initial and fitted relative excess for each run. Initial values use the \(52\times44^2\) grid and fitted values use the \(90\times72^2\) grid.

| \(i\) | \((C_1,D_1)\) | \((\alpha,\tau,\beta,\eta)\) in radians | Initial \(i\) | Fitted \(i\) | Initial \(12+i\) | Fitted \(12+i\) |
| ---: | --- | --- | ---: | ---: | ---: | ---: |
| 1 | \((.12,.12)\) | \((.08,.33,.11,.40)\) | 0.00024265 | 0.00022769 | 0.00052493 | \(-7.7\times10^{-18}\) |
| 2 | \((.35,.30)\) | \((.31,1.2,.29,-.30)\) | 0.01292236 | 0.00644837 | 0.01133997 | \(1.4\times10^{-17}\) |
| 3 | \((.40,.12)\) | \((.61,.90,.51,.70)\) | 0.02451810 | 0.01299324 | 0.02037257 | \(4.2\times10^{-18}\) |
| 4 | \((.18,.49)\) | \((.70,-.80,-.55,1.7)\) | 0.03129571 | 0.03052933 | 0.02585906 | \(1.8\times10^{-16}\) |
| 5 | \((.75,.34)\) | \((.04,.20,.09,.90)\) | 0.02051223 | 0.00791776 | 0.01726248 | \(4.4\times10^{-16}\) |
| 6 | \((.65,.65)\) | \((.25,-.40,.18,1.2)\) | 0.06129997 | 0.02805788 | 0.04892593 | \(-2.3\times10^{-17}\) |
| 7 | \((.95,.20)\) | \((-.22,.70,.33,-1.3)\) | 0.02316737 | 0.00841979 | 0.01874145 | \(1.7\times10^{-16}\) |
| 8 | \((.95,.75)\) | \((.43,.30,.38,.45)\) | 0.14045965 | 0.06353947 | 0.11785150 | \(4.4\times10^{-15}\) |
| 9 | \((.38,.59)\) | \((.54,1.4,.62,-.60)\) | 0.09102352 | 0.04682109 | 0.07422573 | \(1.3\times10^{-15}\) |
| 10 | \((1.25,.57)\) | \((.30,-1.8,.20,1.25)\) | 0.12118166 | 0.04856695 | 0.10152475 | \(-7.6\times10^{-19}\) |
| 11 | \((1.55,.55)\) | \((.10,.10,-.25,-.70)\) | 0.08429690 | 0.02730265 | 0.07015544 | \(1.2\times10^{-16}\) |
| 12 | \((1.75,1.20)\) | \((.18,2.0,-.20,.30)\) | 0.30983453 | 0.09857490 | 0.25517598 | \(1.4\times10^{-16}\) |

Optimization used double-precision NumPy 1.25.1, Gauss–Legendre time integration, and equally spaced periodic spatial summation starting at \(X=Y=0\). The fit grid was \(24\times18^2\). It used BFGS on the free coefficients with initial inverse Hessian \(0.3I\), the first step scale \(\min(1,0.8/\|d\|_\infty)\) for direction \(d\), and backtracking by halves. Acceptance used the Armijo slope factor \(10^{-4}\) and absolute allowance \(2\times 10^{-15}\). The initial inverse Hessian was restored if the direction ceased to descend, and the inverse update was applied only when the usual displacement–gradient inner product exceeded \(10^{-15}\). Line evaluations with sampled \(s<10^{-14}\) were rejected. The exact coefficient derivatives of the discrete objective were obtained by differentiating the displayed formulas. A centered difference test of all coefficients at a mixed field agreed to \(1.8\times10^{-10}\). The stopping target was free gradient norm below \(2\times10^{-8}\), with a 150-iteration cap. All runs reached the target in 32–82 iterations.

Every fitted field was reevaluated on both \(52\times44^2\) and \(90\times72^2\) grids using both projection expressions. They agreed pointwise within \(5.7\times10^{-14}\) in dimensionless \(Q\), and their integrated relative excesses agreed within \(6.3\times10^{-17}\). The largest change between these two grids in relative excess was \(1.05\times10^{-6}\), in run 12. Runs 1, 8, 12, 13, 17, and 24 were also checked on \(128\times104^2\). Run 12 there gave \(0.09857489794\), compared with \(0.09857489784\) on the \(90\times72^2\) grid. As a separate finite-amplitude control, take \(p=J\), \(C=0.4f_1+0.1f_2\), and \(D=U=G=0\). The E15 helical formula with \(\theta=\arctan C\) and log amplitude \(\frac12\log(1+C^2)\) gives relative excess \(0.001331665195893009\), against \(0.001331665195893012\) from the direct four-component projection.

The largest sampled \(\max(|C|,|D|)\) among the free fits was \(3.85\times10^{-5}\), in run 17. Their largest sampled \(|U+G\log s|\) was \(2.30\times10^{-7}\). These runs supply near-radial numerical endpoints. The fixed-amplitude runs supply finite two-wave comparisons. The search gives no universal comparison for arbitrary smooth time profiles, sign-changing \(a\), other periodic amplitudes, admitted zeros or general spinors, and the quadrature checks do not enclose the exact action by intervals.
