# E60r2 · Ricci-flow Hessian audit

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E review, request v1. Actual serving model and reasoning effort were unavailable to this reviewer. Frozen input b5ce9f481a7604a411b9e1bde5383b2bc122fb5c and [master E20](../../notes/E20_CLOSED_VARIATION.md), SHA-256 0d637f3ddede8aeeb3f98f0f6208adb39b88baa3ceb8c4257ffc6903417f885c. I recomputed the signed integral from E20's gradient normalization. The closed-calculation helper independently reported the same reduction after I derived the apparent discrepancy and proved its vanishing.

## Result and normalization

Let \(g\) be a smooth closed oriented Riemannian four-manifold metric with constant scalar curvature \(R\) and vanishing Bach tensor. Write \(Z=\operatorname{Ric}-Rg/4\), \(A=Z^\sharp\), and \(C_{ijk}=\nabla_i Z_{jk}-\nabla_j Z_{ik}\). Use full tensor contractions for \(C\) and the Hilbert–Schmidt norm on the self-dual Weyl endomorphism for \(E_+\). For \(\partial_tg=-2\operatorname{Ric}\) starting at \(g\),
$$
 \left.\frac{d^2}{dt^2}E_+(g(t))\right|_0
 =\int_M\left[\frac7{12}|Z|^4-\operatorname{tr}(A^4)
 -3Z_{ia}C_{ijk}C_{ajk}\right]dV . \tag{1}
$$
The formula also holds for volume-normalized flow with coefficient \(-2\) on Ricci and the same initial metric, and for \(E_-\) with the fixed orientation.

Gauss–Bonnet and signature give
$$
 E_+=4\pi^2\chi(M)+6\pi^2\tau(M)+\tfrac14\mathcal F,\qquad
 \mathcal F=\int_M (|\operatorname{Ric}|^2-R^2/3)\,dV .
$$
Here \(\int |W|_{(0,4)}^2=4(E_++E_-)\), and \(E_+-E_-=12\pi^2\tau\). Write \(G=\nabla_{L^2}\mathcal F=4\nabla_{L^2}E_+\). The Ricci-square gradient minus one third the scalar-square gradient gives
$$
 G=-\Delta Z-2\mathrm{Rm}\cdot Z+\tfrac13(\nabla^2 R)^0
   +\tfrac R6 Z+\tfrac12 |Z|^2g,\qquad
 (\mathrm{Rm}\cdot Z)_{ij}=R_{ikjl}Z^{kl}.
$$
Use \(\mathrm{Rm}\cdot g=\operatorname{Ric}\) and \(\Delta=\nabla^i\nabla_i\). The gradient \(G\) vanishes by Bach flatness. At the critical metric, conformal invariance annihilates trace tangents in either slot of \(D^2 E_+\), and the acceleration term drops. The flow tangent modulo a trace term is \(-2Z\), so the desired derivative is \(4D^2E_+(Z,Z)\). [Gursky–Viaclovsky, author preprint (2.2)–(2.5), (2.8)–(2.9) and the proof of Theorem 2.11](https://arxiv.org/abs/1105.4648) · [Hamilton, Theorem 4.2, short-time Ricci flow](https://math.cs.kitami-it.ac.jp/~kouno/paper/Hamilton1982.pdf)

## Signed derivative

At the initial metric, \(\operatorname{div} Z=0\) by contracted Bianchi. Set \(T_{ijk}=\nabla_i Z_{jk}\) and work in a pointwise orthonormal eigenframe \(A=\operatorname{diag}(\lambda_i)\). Each sum below is an invariant contraction over all \(i,j,k\). Set
$$
 \begin{aligned}
 d&=\sum\lambda_iT_{ijk}^2,& b&=\sum\lambda_jT_{ijk}^2,\\
 p&=\sum\lambda_iT_{ijk}T_{jik},& q&=\sum\lambda_kT_{ijk}T_{jik},&
 U&=\sum\lambda_i C_{ijk}^2=d+b-2p .
 \end{aligned}
$$
Define \(X=\mathrm{Rm}(Z,Z)\) and \(\mathrm{Rm}(H,K)=\langle\mathrm{Rm}\cdot H,K\rangle\).

Differentiate \(\int\langle G,Z\rangle\) in direction \(h=Z\), which gives \(4D^2E_+(Z,Z)\) because \(G=0\). At a varying metric integration by parts gives
$$
 \int\langle G,Z\rangle\,dV
 =\int\left(|\nabla Z|^2-2X+\tfrac R6 |Z|^2-\tfrac1{12}|dR|^2\right)dV .
$$
The squared scalar-gradient term has zero derivative at constant \(R\). At \(h=Z\), the transverse-traceless Ricci linearization \(\operatorname{Ric}'=-\Delta_L Z/2\) and \(G=0\) give
$$
 \operatorname{Ric}'=RZ/6+(Z^2)^0,\quad
 R'=-|Z|^2,\quad Z'=Z^2-RZ/12,\quad
 A'=-RA/12,\quad (dV)'=0 .
$$
Here \(Z^2\) is the tensor obtained by lowering the index of \(A^2\). The linearization follows by differentiating the connection and commuting the divergences of the transverse-traceless variation. [Gursky–Viaclovsky, (2.4), Lichnerowicz convention](https://arxiv.org/abs/1105.4648)

For \(L^a_{ij}=(\Gamma^a_{ij})'=\tfrac12(T_{ija}+T_{jia}-T_{aij})\), one has \((\nabla_i A)'=-R\nabla_i A/12+[L_i,A]\). Contraction with \(\nabla_i A\) gives
$$
 (|\nabla Z|^2)'=-\tfrac R6|\nabla Z|^2-d+2p-2q .
$$
For curvature, differentiate \(X=R^a{}_{k j l}A^j_aZ^{kl}\). The mixed curvature derivative \(\nabla_j L^a_{lk}-\nabla_l L^a_{jk}\), after integration by parts, contributes \(\sum\lambda_i(L^k_{ji}-L^i_{jk})T_{ijk}=d-p\). The divergences of \(Z\) and \(A\) vanish in these integrations, and \(L^k_{ji}-L^i_{jk}=T_{ijk}-T_{kij}\). The derivative of the two raised curvature arguments gives
$$
 \int X'\,dV
 =\int \big(d-p-\tfrac R6 X-\mathrm{Rm}(Z,Z^2)\big)\,dV .
$$
The terms proportional to \(-R/6\) times the pairing with \(G\) cancel after integration. Since \((|Z|^2)'=-R|Z|^2/6\), the remaining scalar derivative is \(-|Z|^4/6\). Pairing the initial \(G=0\) with \(Z^2\) gives \(2\int\mathrm{Rm}(Z,Z^2)=\int[2b+R\operatorname{tr}(A^3)/6+|Z|^4/2]\). Thus
$$
 4D^2E_+(Z,Z)=\int\left[2b-3d+4p-2q+
                 \tfrac R6\operatorname{tr}(A^3)+\tfrac13|Z|^4\right]dV . \tag{2}
$$
This reproduces the signed integral in [E20, (4)](../../notes/E20_CLOSED_VARIATION.md). The constant-scalar identity used for the proportional terms also follows from [Chang–Gursky–Yang, Proposition 3.2, (3.7)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf).

## Four-dimensional cancellation and Cotton indices

Integrate \(p+q=\nabla_i Z_{jk}\nabla_j(Z^2)_{ik}\). Closure, the divergence of \(Z\), and the curvature commutator give
$$
 \begin{aligned}
 \nabla_j\nabla_i Z_{jk}
   &=(\operatorname{Ric}\circ Z)_{ik}-(\mathrm{Rm}\cdot Z)_{ik},\\
 \int(p+q)\,dV
   &=\int\big[\mathrm{Rm}(Z,Z^2)-\operatorname{tr}(A^4)
                     -\tfrac R4\operatorname{tr}(A^3)\big]dV\\
   &=\int\big[b-\tfrac R6\operatorname{tr}(A^3)
                     +\tfrac14|Z|^4-\operatorname{tr}(A^4)\big]dV .
 \end{aligned}
$$
The derivative terms in (2) are \(-3U+5b-2(p+q)\). The difference between (2) and (1) is therefore \(3\int(2b-p-q)\,dV\), with \(2b-p-q=\langle C,\nabla Z^2\rangle\). The same commutator, the stationary equation, and Weyl decomposition give
$$
 \begin{aligned}
 \nabla^i C_{ijk}&=(\Delta Z-\operatorname{Ric}\circ Z+\mathrm{Rm}\cdot Z)_{jk}
                  =-(W\cdot Z)_{jk},\\
 \mathrm{Rm}\cdot Z&=W\cdot Z+\tfrac12|Z|^2g-Z^2-\tfrac R{12}Z .
 \end{aligned}
$$
Thus the possible discrepancy is \(3\int W(Z,Z^2)\,dV\). In dimension four this Weyl contraction vanishes pointwise. In the eigenframe write \(w_{ij}=W_{ijij}\). Trace-freeness gives \(w_{ij}=w_{kl}\) for complementary pairs \(\{i,j\},\{k,l\}\), and \(w_{12}+w_{13}+w_{14}=0\). The coefficient of each shared Weyl component in \(W(Z,Z^2)\) is
$$
 (\lambda_i+\lambda_j)(\lambda_i\lambda_j-\lambda_k\lambda_l)
 =-\sum_{a<b<c}\lambda_a\lambda_b\lambda_c ,
$$
using \(\sum_i\lambda_i=0\). The common coefficient multiplies the zero Weyl trace.

In particular \(U=Z_{ia}C_{ijk}C_{ajk}\), with \(Z\) acting on the first skew index, equivalently the second by antisymmetry. The remaining-index contraction is distinct. For an algebraic check take \(A=\operatorname{diag}(3,-1,-1,-1)\) and \(T_{122}=1\), \(T_{133}=-1\), all other components zero. The trace and divergence constraints on \(T\) hold. The resulting \(C\) has \(U=4\) and \(\sum\lambda_k C_{ijk}^2=-4\) in the full tensor contraction.

## Products and Cotton-flat cases

For a product of closed constant-curvature surfaces with sectional curvatures \(k,l\), each chiral Weyl block has eigenvalues \((k+l)/3,-(k+l)/6,-(k+l)/6\) and squared Hilbert–Schmidt norm \((k+l)^2/6\). Testing independent rescalings of the factors shows Bach flatness requires \(k^2=l^2\). Equal curvatures give an Einstein product and opposite curvatures a locally conformally flat product, so both conditions suffice. At \(l=-k\ne0\), Ricci flow rescales the factors by \(1-2kt\) and \(1+2kt\). The sum of sectional curvatures starts at zero with derivative \(4k^2\), giving \(E_+''=(16/3)k^4\operatorname{Vol}(g)\). Formula (1) agrees since \(C=0\), \(|Z|^2=4k^2\) and \(\operatorname{tr}(A^4)=4k^4\). At \(l=k\) the flow is homothetic and both sides vanish.

For any Cotton-flat metric of the stated class, parametrize the eigenvalues of \(A\) as \(x+y+z,x-y-z,-x+y-z,-x-y+z\). Direct expansion gives
$$
 \frac7{12}|Z|^4-\operatorname{tr}(A^4)
 =\frac83\big[(x^2-y^2)^2+(y^2-z^2)^2+(z^2-x^2)^2\big].
$$
Equality at a point occurs precisely for spectra \((-3a,a,a,a)\), up to permutation with \(a=0\) allowed. A closed nontrivial equality example is a periodic conformal round cylinder \(g=u(s)^2(ds^2+g_{S^3})\), where \(u>0\) is a nonconstant periodic solution of \(u''=u-u^3\). The potential \(u^4/4-u^2/2\) gives such solutions with energy in \((-1/4,0)\). The conformal scalar equation gives \(R_g=u^{-3}(-6u''+6u)=6\). The Weyl tensor vanishes by local conformal flatness, and its contracted Bianchi identity gives \(C=0\) at constant scalar curvature. Spherical symmetry gives a triple Ricci eigenspace on the fibers. The path \(g+s_0 Z\) for small \(s_0\) remains a warped round-sphere metric and is locally conformally flat by a local reparametrization to a conformal cylinder. Hence \(D^2E_+(Z,Z)=0\) directly. Both example types lie outside the homotopy four-sphere target.

For an attained positive-Yamabe minimizer, (1) gives \(3\int U\le\int(7|Z|^4/12-\operatorname{tr}A^4)\). A strict reverse inequality at a Bach-flat positive-Yamabe metric supplies local strict same-type descent by openness of positive Yamabe sign. A sufficient estimate in the surviving closed class remains open.
