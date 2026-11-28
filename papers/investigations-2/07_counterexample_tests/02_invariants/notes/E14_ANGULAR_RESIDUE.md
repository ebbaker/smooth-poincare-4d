# WIN-E14 · Angular residue of a generating spinor pencil

28 November 2026 UTC, for Edward B. Baker III, with OpenAI Codex assistance. Exact serving model and effort are unavailable. Input checkout `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7` and the working-tree [E14 request](../research-progress/handoffs/REQUEST_AVERAGE_R1.md). Evidence is a working direct calculation.

Let \((M,g)\) be the smooth, closed, oriented Riemannian homotopy four-sphere of the request. Fix smooth positive half-spinors \(s_0,s_1\) generating the right quaternionic line \(S^+_x\) at every \(x\). Write
\[
 E_xu=s_0(x)u_1+s_1(x)u_2,\qquad
 B_xu=(P_gs_0)(x)u_1+(P_gs_1)(x)u_2,
\]
using the spinor and twistor-bundle norms induced by \(g\). The integrand is the fourth power of the pointwise relative defect for \(s_0u_1+s_1u_2\). The calculation uses smoothness, right quaternionic linearity and surjectivity of \(E_x\). [Twistor manuscript, “A conformally invariant relative error,” equation `eq:relative`](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)

Use \(d\mu\) for the probability measure on \(\mathbb H\mathbb P^1\) obtained by pushing forward uniform probability on the unit sphere \(S^7\subset\mathbb H^2\). Both norms in the quotient and cutoff are constant under unit right multiplication. Put \(\alpha_x=\|E_x\|_{\rm op}>0\), the single positive quaternionic singular value, and define
\[
 I(\epsilon)=\int_M\int_{\{|E_xu|>\epsilon\alpha_x\}}
       \frac{|B_xu|^4}{|E_xu|^4}\,d\mu([u])\,d\mathrm{vol}_g(x),
       \qquad 0<\epsilon<1,\quad |u|=1.
\]

## Exact fibre integral

Fix \(x\). Let \(e,k\) be unit vectors spanning \((\ker E_x)^\perp\) and \(\ker E_x\), respectively. Set \(a=B_xe\), \(b=B_xk\), and
\[
 A=|a|^2,\qquad C=|b|^2,\qquad D=|\langle a,b\rangle_{\mathbb H}|^2 .
\]
These scalars are independent of the choices of unit vectors. In particular \(C^2=\|B_x|_{\ker E_x}\|_{\rm op}^4\).

A uniform unit vector has the representation
\(u=\sqrt t\,e q+\sqrt{1-t}\,k r\), with independent uniform \(q,r\in S^3\) and \(t\) of density \(6t(1-t)\) on \((0,1)\). Indeed, normalize a pair of independent standard Gaussian vectors in \(\mathbb R^4\). Each squared radius has density proportional to \(s e^{-s/2}\), and the ratio of the first squared radius to their sum has the stated density by change of variables. At fixed \(t\), the mixed term in \(|B_xu|^2\) is \(2\sqrt{t(1-t)}\operatorname{Re}(\bar q\langle a,b\rangle_{\mathbb H}r)\). The real part has mean zero and second moment \(D/4\), since the quaternion is uniformly distributed on the three-sphere of radius \(\sqrt D\) when \(D>0\). For \(D=0\) the term vanishes. Thus
\[
 \mathbf E[|B_xu|^4\mid t]
 =t^2 A^2+(1-t)^2 C^2+t(1-t)(2AC+D).
\]
With \(\delta=\epsilon^2\), the cutoff is \(t>\delta\) and the denominator is \(\alpha_x^4 t^2\). The inner integral is therefore
\[
 \begin{aligned}
 I_x(\epsilon)=\frac{6}{\alpha_x^4}\bigg[&
 A^2\left(\frac16-\frac{\delta^2}{2}+\frac{\delta^3}{3}\right)\\
 &+ C^2\left(-\log\delta-\frac{11}{6}+3\delta
                   -\frac{3\delta^2}{2}+\frac{\delta^3}{3}\right)\\
 &+(2AC+D)\frac{(1-\delta)^3}{3}\bigg].
 \end{aligned}
\]
The three coefficients inside brackets come from integrating \(t(1-t)\), \((1-t)^3/t\) and \((1-t)^2\) on \((\delta,1)\).

## Integrated asymptotics

The coefficients are continuous and bounded on the compact base, with \(\alpha_x\) bounded away from zero. The exact formula gives
\[
 \begin{aligned}
 I(\epsilon)&=R\log(1/\epsilon)+F+O(\epsilon^2),\\
 R&=12\int_M\frac{\|B_x|_{\ker E_x}\|_{\rm op}^4}{\|E_x\|_{\rm op}^4}
              \,d\mathrm{vol}_g(x),\\
 F&=\int_M \frac{A^2-11C^2+4AC+2D}{\alpha_x^4}\,d\mathrm{vol}_g(x).
 \end{aligned}
\]
The polynomial error in the fibre formula is uniformly \(O(\epsilon^2)\), so the residue-subtracted integral converges to \(F\). The continuous nonnegative residue density is positive on an open set of positive volume whenever \(B_x\) acts nontrivially on \(\ker E_x\) at some \(x\). Hence \(I(\epsilon)\) stays bounded as \(\epsilon\downarrow0\) exactly when \(B_x|_{\ker E_x}=0\) at every point. In that case the exact value is
\[
 I(\epsilon)=(1-3\epsilon^4+2\epsilon^6)
       \int_M \frac{A^2}{\alpha_x^4}\,d\mathrm{vol}_g(x).
\]

## Linear control

Take the fibre maps \(E(u_1,u_2)=u_1\) in a unit frame of the spin line and \(B(u_1,u_2)=v u_2\) for a fixed unit twistor vector \(v\). Then \(|Bu|^4/|Eu|^4=(1-t)^2/t^2\), and with the specified probability measure the fibre integral is exactly
\[
 12\log(1/\epsilon)-11+18\epsilon^2-9\epsilon^4+2\epsilon^6 .
\]
This gives a nonzero logarithmic coefficient with the same cutoff and normalization as the pencil calculation.
