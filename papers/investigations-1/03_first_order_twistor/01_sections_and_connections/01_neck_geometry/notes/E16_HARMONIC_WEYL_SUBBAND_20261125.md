# The harmonic self-dual Weyl subband

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Exact serving model and reasoning effort
unavailable. Conditional result on one smooth oriented Riemannian
homotopy four-sphere. [Frozen request and versions](../research-progress/handoffs/E16_REQUEST_20261125.md)
· [Return](../research-progress/handoffs/E16_RETURN_20261125.md)

## Statement

Let \(M\) be a smooth closed oriented homotopy four-sphere and
\([g]\) a smooth positive-Yamabe conformal class with a smooth
representative satisfying \(\delta_g W_g^+=0\).
Set \(Y=Y([g])>0\) and \(e=E_+(g)\), with the endomorphism
Hilbert–Schmidt norm on real \(\Lambda^+\).
Let \(\widehat g\) be any Yamabe minimizer in the class and write
\(T_Y=\int_M|\operatorname{Ric}_0(\widehat g)|_{\widehat g}^2\,dV_{\widehat g}\).
Then either \(W=0\) or
\[
 e>\frac{16\pi^2}{3}+\frac{T_Y}{6}.
 \tag{1}
\]
Thus for such a class the cutoff \(e\le16\pi^2/3\) is inclusive.
The Weyl-flat alternative is conformally round on the original
smooth manifold, by the signature identity and the developing map
as in SEC. Any positive Einstein metric supplies the harmonicity
hypothesis by the contracted Bianchi identity, and its Weyl-flat
alternative is a positive constant-sectional-curvature metric.
[SEC chiral conventions and closed threshold](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4350)
· [E13 Einstein Yamabe identity](E13_CLOSED_EINSTEIN_STABILITY_20261125.md#yamabe-scale-and-the-surviving-energy-band)

## Harmonic Weyl formula and zeros

Work in the harmonic representative. Put \(w=|W_g^+|_{\rm HS}\),
\(z=\lambda_{\max}(W_g^+)\), and use
\(\Delta=\nabla^i\nabla_i\) with nonpositive spectrum on functions.
For smooth oriented Riemannian dimension four, the divergence equation
\(\nabla^m(W_g^+)_{mjkl}=0\) yields the Derdziński Weitzenböck formula
\[
 \tfrac12\Delta w^2
 =|\nabla W_g^+|^2+\tfrac R2 w^2-18\det W_g^+ .
 \tag{2}
\]
The improved Kato inequality away from \(w=0\) is
\(|\nabla W_g^+|^2\ge(5/3)|\nabla w|^2\).
These are half-harmonic identities and allow variable \(R\).
Gursky–McKeown–Tyrrell discuss them under the ordinary smooth
hypothesis (3.3) before applying them to a filling. Their
equation (3.7) uses the endomorphism determinant and the
coefficient \(18\) in the present norm. Fu uses a four-index
tensor norm, whose square is \(4w^2\), so his (2-1) has
coefficient \(144\) for \(\Delta|W^\pm|_{\mathrm{4ind}}^2\)
and his gap constant \(1/6\) converts to \(1/24\).
[Gursky–McKeown–Tyrrell, (3.3), (3.7) and Corollary 3.4](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/103164BB62A5E9277B869CCA6213BD80/S1474748025101060a.pdf/self-dual-and-even-poincare-einstein-metrics-in-dimension-four.pdf)
· [Fu, §2, Proposition E and (2-1)–(2-9)](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf)

For eigenvalues \(x\le y\le z\) with \(x+y+z=0\), \(z\ge0\).
We have \(w^2=x^2+y^2+z^2=2z^2-2xy\), and
\[
 6z w^2-36\det W^+=12z(x-y)^2\ge0,\qquad
 6z\le 2\sqrt6\,w .
 \tag{3}
\]
For the last inequality use \(x^2+y^2\ge z^2/2\).
Both bounds are equalities at the same nonzero algebraic type
\(x=y=-z/2\). In particular \(18\det W^+\le\sqrt6\,w^3\).

Define \(U_\epsilon=w^2+\epsilon^2\) and \(f_\epsilon=U_\epsilon^{1/6}\).
This is smooth even at zeros of \(W^+\).
Let \(P_z=-6\Delta+R-6z\). Differentiating \(f_\epsilon\) gives
\[
 6\Delta f_\epsilon
   = U_\epsilon^{-5/6}
      \big(\Delta U_\epsilon-\tfrac56 U_\epsilon^{-1}|\nabla U_\epsilon|^2\big).
\]
By Kato, the subtracted gradient term is at most \(2|\nabla W^+|^2\).
At a zero of \(w\) one has \(\nabla U_\epsilon=0\), which gives the
same bound there. Equations (2)–(3) therefore imply
\[
 P_z f_\epsilon
 \le (R-6z)\epsilon^2 U_\epsilon^{-5/6}
 \le \|R\|_\infty\epsilon^{1/3}.
\]
Multiply by \(f_\epsilon\) and integrate. All coefficients are bounded
and \(f_\epsilon\) is uniformly bounded. The resulting inequality
bounds \(f_\epsilon\) in \(H^1\), and \(f_\epsilon\) tends uniformly
to \(f=w^{1/3}\). Lower semicontinuity for the gradient yields
\[
 Q_z(f):=\int_M(6|\nabla f|^2+(R-6z)f^2)\,dV_g\le0 .
 \tag{4}
\]
This avoids requiring smoothness of \(w^{1/3}\) across its zero set.

## Energy inequality and equality

Assume \(W^+\not\equiv0\), so \(f\ne0\). The Yamabe quotient of
the harmonic gauge, (4), and Hölder give
\[
 Y\|f\|_4^2
 \le \int_M(6|\nabla f|^2+R f^2)\,dV_g
 \le 6\int_M z f^2\,dV_g
 \le 2\sqrt6\int_M w f^2\,dV_g
 \le 2\sqrt6\,\|w\|_2\|f\|_4^2 .
 \tag{5}
\]
The Yamabe inequality extends to nonnegative \(H^1\) tests by density.
Thus \(e\ge Y^2/24\). If equality holds, the last Hölder inequality
forces \(w\) proportional to \(f^2=w^{2/3}\). By continuity
and connectedness \(w\) is a positive constant. The constant \(f\)
achieves the Yamabe quotient in the harmonic representative.
Its variational equation makes \(R=Y/\sqrt{\operatorname{Vol}(g)}\)
constant, and equality gives \(R=2\sqrt6\,w\).
Then (2) and \(18\det W^+\le\sqrt6\,w^3\) force
\(\nabla W^+=0\) and equality in the algebraic bound. The
endomorphism therefore has eigenvalues
\((-R/12,-R/12,R/6)\). Its simple positive eigenline is parallel.
The line is orientable since \(H^1(M;\mathbb Z/2)=0\). Its global
unit section is parallel, hence a nonzero harmonic self-dual
two-form. This contradicts \(b_2(M)=0\). This proof of the equality
exclusion uses the stated two topological facts rather than any
classification of the equality case on other manifolds.

## Combining the two gauges

In the Yamabe representative \(\widehat g\), constant scalar curvature
gives \(\int R_{\widehat g}^2\,dV_{\widehat g}=Y^2\).
Chern–Gauss–Bonnet and the signature formula for
\(\chi(M)=2\) and \(\tau(M)=0\) give
\[
 16\pi^2=2e-\tfrac12T_Y+Y^2/24 .
 \tag{6}
\]
Both \(e\) and \(Y\) agree in the harmonic and Yamabe representatives.
Harmonicity is used only in the first representative. Equation (6)
also shows \(T_Y\) has the same value for every Yamabe minimizer in
the class. Since the nonzero sector has \(e>Y^2/24\) by (5) and its
equality check, substitution in (6) proves (1). If \(W^+=0\), the
vanishing signature gives \(E_-=0\), hence \(W^-=0\) pointwise.
For the Einstein subclass \(T_Y=0\), or directly use
\(R\sqrt{\operatorname{Vol}(g)}=Y\) and the Einstein identity in E13.
For the half-harmonic subclass this is a Ricci-enhanced threshold
in the Yamabe representative. It gives no estimate for the
trace-free Ricci integral in an arbitrary conformal gauge.

## A stronger scalar spectral condition

The sign of the first eigenvalue of \(P_z=-6\Delta+R-6z\)
is a conformal invariant. For \(\widetilde g=\Omega^2g\),
\(\widetilde z=\Omega^{-2}z\) and the scalar transformation gives
\(P_{\widetilde z}^{\widetilde g}v
=\Omega^{-3}P_z^g(\Omega v)\). Therefore the quadratic
form in \(\widetilde g\) at \(v\) equals that in \(g\)
at \(\Omega v\). The metricwise condition \(\delta_gW_g^+=0\)
is used in deriving (4) and is not required of \(\widetilde g\).

For nonzero harmonic \(W^+\), (4) gives \(\lambda_1(P_z)\le0\).
If \(\lambda_1(P_z)=0\), then \(f=w^{1/3}\) has zero quadratic
form and minimizes the first Rayleigh quotient. It is a weak
zero eigenfunction. The potential is Lipschitz because \(W^+\)
is smooth and its largest eigenvalue is Lipschitz. Elliptic
regularity and the strong maximum principle give \(f>0\) on the
connected closed manifold. In particular \(w\) is everywhere
positive and smooth. The exact derivative calculation at
\(\epsilon=0\) gives
\[
 P_z f=-w^{-5/3}\left(
   2|\nabla W^+|^2-\tfrac{10}{3}|\nabla w|^2
   +12z(x-y)^2\right).
\]
Both terms after grouping the two gradient squares are nonnegative
by Kato and \(z>0\). Thus \(x=y=-z/2\) everywhere and the simple
positive eigenspace of \(W^+\) is a smooth line bundle.
A global norm-\(\sqrt2\) section exists since \(H^1(M;\mathbb Z/2)=0\),
and defines a compatible almost complex structure using the
self-dual form. Such a structure would have
\(\langle c_1^2,[M]\rangle=2\chi(M)+3\tau(M)=4\) by
\(p_1=c_1^2-2c_2\) and \(c_2=e(TM)\).
This contradicts \(H^2(M;\mathbb Z)=0\).
Equivalently, Derdziński's Proposition 5(i) makes this eigenline
locally the Kähler-form line of the conformally related metric
\(w^{2/3}g\) up to a constant. A global choice of sign then yields
a nonzero harmonic two-form in that metric.
[Derdziński, Proposition 5(i)](https://www.numdam.org/article/CM_1983__49_3_405_0.pdf)

It follows that \(\lambda_1(P_z)<0\) for nonzero harmonic \(W^+\)
on this topology. Testing the Yamabe inequality against any
negative quadratic-form direction yields
\[
 36\int_M z^2\,dV_g>Y^2 .
 \tag{7}
\]
Indeed the conformal-Laplacian energy of that test is strictly less
than \(6\int z v^2\), to which Hölder applies. Since
\(z^2\le(2/3)w^2\), (7) is at least as restrictive as the strict
\(e>Y^2/24\) inequality and retains additional pointwise spectral
information. The supplied hypotheses give no larger uniform
numerical \(E_+\) threshold from (7) alone.

## Sources and applicability

The harmonic-Weyl gap is Gursky's. His *Four-manifolds with
\(\delta W^+=0\) and Einstein constants of the sphere*,
Math. Ann. 318 (2000), 417–431, was reached at publisher-metadata
level only. The proof here uses the accessible half-harmonic
Weitzenböck formula and improved Kato passages in M. Gursky,
S. McKeown and A. Tyrrell, *Self-dual and even Poincaré–Einstein
metrics in dimension four*, J. Inst. Math. Jussieu 25 (2026),
749–779, §3, and the independently reproduced gap in Hai-Ping Fu,
*Four-manifolds with positive Yamabe constant*, Pacific J. Math.
296 (2018), DOI 10.2140/pjm.2018.296.79, §2.
Fu reproduces the topological bound and equality characterization
under the half-harmonic and positive Yamabe assumptions in Theorem B
and Theorem B*. The topology, equality exclusion, Ricci term and
scalar operator test above are checked explicitly. These passages
and Derdziński's published Proposition 5 were inspected
25 November 2026. The result addresses positive Einstein classes
and classes supplied with a half-harmonic representative.
An arbitrary positive-Yamabe Bach-flat class would require a separate
argument producing a representative of this type or a different
estimate. [Gursky 2000 publisher record](https://doi.org/10.1007/s002080000130)
