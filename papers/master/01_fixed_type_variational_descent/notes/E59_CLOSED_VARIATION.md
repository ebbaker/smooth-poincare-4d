# E59d · Cotton contraction in the Ricci-flow second variation

25 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Bounded E derivation for MASTER-E59d v1. Actual serving model and reasoning effort are unavailable. Frozen inputs are `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`, including the [E20 derivation](../../notes/E20_CLOSED_VARIATION.md), the [descent manuscript](../manuscript/fixed_type_chiral_energy_descent.tex), [endpoint smoothing](../manuscript/endpoint_smoothing.tex) and the [E56–E58 assessment](../../research-progress/handoffs/E56_E58_RECOGNITION_GAP_20261125.md). The calculation applies to an actual smooth closed stationary metric.

## Reduced second variation

Let \(g\) be a smooth Bach-flat positive-definite metric of constant scalar curvature \(R>0\) on a closed oriented smooth homotopy four-sphere \(M\). Write \(F=E_+\), the integrated squared Hilbert–Schmidt norm of the Weyl endomorphism of \(\Lambda^+\), and put

\[
Z=\operatorname{Ric}-\tfrac R4g,\qquad A=Z^\sharp,\qquad
s_m=\operatorname{tr}(A^m),\qquad
C_{ijk}=\nabla_i Z_{jk}-\nabla_j Z_{ik}.
\]

Here \(C\) is twice the Cotton tensor formed from the usual Schouten tensor \(P=\tfrac12(\operatorname{Ric}-Rg/6)\) with the same index order. Use \(\Delta=\nabla^i\nabla_i\), \((\operatorname{Rm}\cdot Z)_{ij}=R_{ikjl}Z^{kl}\), and full ordered-index sums for \(C\). Define the symmetric endomorphism \(A\) on \(TM\) and the covariant tensor \(Z^2_{ij}=Z_{ia}Z^a{}_j\). In an orthonormal eigenframe let \(\lambda_i\) be the eigenvalues of \(A\). Then unnormalized Ricci flow starting from \(g\), and volume-normalized Ricci flow in the same time variable, satisfy at \(t=0\)

\[
\boxed{\left.\frac{d^2}{dt^2} F(g(t))\right|_0
=\int_M\left[\frac7{12}s_2^2-s_4-3\sum_{i,j,k}\lambda_i C_{ijk}^2\right]dV_g.} \tag{1}
\]

The Cotton term before its coefficient is the invariant contraction \(\mathcal C=Z^{ia}C_{ijk}C_a{}^{jk}\). The quartic term has the pointwise representation

\[
\mathcal Q=\frac7{12}s_2^2-s_4
=\frac16\left[(\lambda_1-\lambda_2)^2(\lambda_3-\lambda_4)^2
+(\lambda_1-\lambda_3)^2(\lambda_2-\lambda_4)^2
+(\lambda_1-\lambda_4)^2(\lambda_2-\lambda_3)^2\right]. \tag{2}
\]

For example, set \(p=\lambda_1+\lambda_2\), \(q=\lambda_1+\lambda_3\), \(r=\lambda_1+\lambda_4\). Trace zero gives \(s_2=p^2+q^2+r^2\) and \(s_4=3s_2^2/4-(p^4+q^4+r^4)/2\). Thus \(6\mathcal Q=(p^2-q^2)^2+(q^2-r^2)^2+(r^2-p^2)^2\), the expression in (2). Equality holds exactly at \(Z=0\) or at a spectrum of the form \((-3a,a,a,a)\) with \(a\ne0\), up to permutation.

## Contraction and cancellation

On a fixed closed oriented four-manifold \(4F\) equals \(\int(|\operatorname{Ric}|^2-R^2/3)dV\) up to a topological constant. The gradient of this last integral in constant scalar gauge is

\[
G=-\Delta Z-2\operatorname{Rm}\cdot Z+\tfrac R6 Z+\tfrac12s_2g.
\]

Bach-flatness gives \(G=0\), and the contracted Bianchi identity gives \(\nabla^i Z_{ik}=0\). The gradient follows by subtracting one third of the scalar-square variation from the Ricci-square variation. Closed signature makes the normalization apply also to the opposite chirality. Conformal invariance gives the Hessian kernel in pure-trace directions at stationarity. The tangents to normalized and unnormalized Ricci flow therefore give the same second derivative \(4D^2F_g(Z,Z)\). Their accelerations have zero pairing with \(DF_g=0\). [Gursky–Viaclovsky, (2.2)–(2.5) and (2.8)–(2.9)](https://arxiv.org/abs/1105.4648) · [E20, (1)–(4)](../../notes/E20_CLOSED_VARIATION.md)

The new cancellation uses \(\nabla^iC_{ijk}=-(W\cdot Z)_{jk}\). In fact, commuting derivatives on the divergence-free \(Z\) gives

\[
\nabla^i\nabla_j Z_{ik}=(\operatorname{Ric}\circ Z)_{jk}-(\operatorname{Rm}\cdot Z)_{jk},
\qquad
\operatorname{Rm}\cdot Z=W\cdot Z-Z^2-\tfrac R{12} Z+\tfrac12s_2g.
\]

Subtract the commutator formula from \(\Delta Z\) supplied by \(G=0\), and use \(\operatorname{Ric}\circ Z=Z^2+RZ/4\). In four dimensions every Weyl tensor and trace-free \(Z\) satisfy

\[
W(Z,Z^2):=\langle W\cdot Z,Z^2\rangle=0. \tag{3}
\]

Indeed, let \(w_{ij}=W_{ijij}\) for \(i\ne j\) in an orthonormal eigenframe of \(Z\). Trace zero of \(W\) gives \(w_{ij}=w_{kl}\) for complementary pairs and \(w_{12}+w_{13}+w_{14}=0\). For each complementary pairing \(ij|kl\), the coefficient of \(w_{ij}\) in (3) is

\[
\lambda_i\lambda_j(\lambda_i+\lambda_j)+\lambda_k\lambda_l(\lambda_k+\lambda_l)
=-e_3(\lambda),
\]

where \(e_3\) is the third elementary symmetric polynomial. Thus the three coefficients are equal and their Weyl-weighted sum is zero. Integration by parts now yields

\[
\int_M C_{ijk}\nabla_i(Z^2)_{jk}\,dV_g=\int_M W(Z,Z^2)\,dV_g=0. \tag{4}
\]

To reduce the recorded [E20 Hessian](../../notes/E20_CLOSED_VARIATION.md#an-exact-integral-sign-test), write \(T_{ijk}=\nabla_i Z_{jk}\). Use \(P_1,P_2,X_1,X_2\) for the pointwise sums of \(\lambda_i T_{ijk}^2,\ \lambda_j T_{ijk}^2,\ \lambda_i T_{ijk}T_{jik},\ \lambda_k T_{ijk}T_{jik}\), respectively. Symmetry in the final two indices of \(T\) gives \(\mathcal C=P_1+P_2-2X_1\). The sum of the two derivative terms of E20 is

\[
2P_2-3P_1+4X_1-2X_2=5P_2-3\mathcal C-2(X_1+X_2).
\]

Since \(\nabla_i(Z^2)_{jk}=(\lambda_j+\lambda_k)T_{ijk}\) in the eigenframe, the left side of (4) equals \(\int(2P_2-X_1-X_2)dV_g\). Consequently the E20 derivative terms integrate to \(\int(P_2-3\mathcal C)dV_g\). Pairing \(G=0\) with \(Z^2\) and integrating gives

\[
\begin{aligned}
2\int_M\operatorname{Rm}(Z,Z^2)dV_g
&=\int_M\left(2P_2+\tfrac R6s_3+\tfrac12s_2^2\right)dV_g,\\
\operatorname{Rm}(Z,Z^2)&=-s_4-\tfrac R{12}s_3+\tfrac12s_2^2.
\end{aligned}
\]

The second line uses (3). Hence \(\int P_2=\int(-s_4-Rs_3/6+s_2^2/4)\), with all integrals taken against \(dV_g\). The remaining E20 scalar terms are \(Rs_3/6+s_2^2/3\), which proves (1).

## Scope of the sign test

At an attained fixed-type minimum, (1) requires \(3\int_M\mathcal C\,dV_g\le\int_M\mathcal Q\,dV_g\). Strict reversal at a stationary metric gives a same-type competitor by short forward Ricci flow. The first derivative vanishes, the negative second derivative gives strict energy decrease for all sufficiently small positive times, and positivity persists by openness of the first conformal-Laplacian eigenvalue. A constant rescaling at each time restores unit volume and preserves energy. If the inequality is strict in the stable direction, this flow raises energy initially. At equality the second variation leaves the higher-order sign open. [Same-type positivity](../../manuscript/variational_comparison.tex)

The Cotton contraction has a signed weight even after the Cotton symmetries and contracted Bianchi constraint on the first jet are imposed. For example take \(T_{123}=T_{132}=T_{312}=T_{321}=h\) and all other entries zero. Then the nonzero Cotton entries up to antisymmetry are \(C_{123}=h\) and \(C_{231}=-h\), and \(\mathcal C=(\lambda_2-\lambda_4)h^2\). These are pointwise first-jet tests. The metric and energy band would need a global estimate of the signed integral to force descent.

When \(C=0\), the second derivative is nonnegative by (2). On the target homotopy sphere the owning theorem on smooth half-harmonic Bach-flat representatives gives a sharper classification for this subclass. Cotton flatness makes both Weyl blocks divergence-free. If one block is nonzero, it is a smooth half-harmonic representative and the theorem makes \(g\) Einstein. The [companion derivation](../manuscript/cotton_variation.tex) gives an independent pointwise argument in the stated constant-scalar gauge, with global continuation of \(W=0\) by Lassas–Liimatainen. In the conformally flat case Kuiper gives a conformal identification with the round sphere. Write the pulled-back round metric as \(f^{-2}g\). The trace-free Ricci transformation then gives \(fZ=-2(\nabla^2f)^0\), so divergence-free \(Z\) and integration by parts imply \(\int f|Z|^2dV_g=0\). Thus the positive constant-scalar representative is round up to scale and diffeomorphism. The Cotton-flat subclass on the target has zero second variation here and remains subject to the existing Einstein energy restrictions. The identity supplies no vanishing of \(C\) for the general minimizing class. [Owning half-harmonic implication](../../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex#L780) · [Lassas–Liimatainen, Theorem 3.8](https://arxiv.org/pdf/1912.08030) · [Kuiper](https://doi.org/10.2307/1969587) · [Einstein restrictions](../../notes/E05_CLOSED_STABILITY.md)

As a coefficient check outside the positive-scalar target, take the locally conformally flat product of closed surfaces with curvatures \(k,-k\). Here \(C=0\), \(A\) has eigenvalues \((k,k,-k,-k)\), and (1) gives \(16k^4\operatorname{Vol}(g)/3\). Under Ricci flow the factor curvatures evolve by \(k_i'=2k_i^2\), and each chiral density is \((k_1+k_2)^2/6\). At the starting sum zero the direct second derivative is \(2(4k^2)^2\operatorname{Vol}(g)/6\), with the same coefficient. A positive Einstein start has \(Z=C=0\) and constant chiral energy under its homothetic Ricci flow.
