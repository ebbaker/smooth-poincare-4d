# TT stability test at a closed positive Einstein metric

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Delegated execution was configured as
gpt-6.2-sol/ultra. The serving settings are unavailable for independent
attestation. Conditional Hessian result for one smooth oriented
Riemannian metric. [Frozen request and input versions](../research-progress/handoffs/E13_REQUEST_20261125.md)
· [Return](../research-progress/handoffs/E13_RETURN_20261125.md)

## Normalization and spectral criterion

Let \(M\) be a smooth closed oriented homotopy four-sphere and let \(g\)
be smooth Einstein with \(\operatorname{Ric}=(R/4)g\), \(R>0\).
Use \(E_+(g)=\int |W^+_g|_{\mathrm{HS}}^2\,dV_g\) on the real
\(\Lambda^+\) endomorphism bundle as in SEC. Write \(V=\operatorname{Vol}(g)\)
and set \((\mathring{\mathrm{Rm}}h)_{ij}=R_{ipjq}h^{pq}\), with
\(\mathring{\mathrm{Rm}}h=-h\) on trace-free tensors at sectional
curvature one. The Gursky–Viaclovsky convention is
\[
 \Delta_L^{\mathrm{GV}}h
 =-\nabla^*\nabla h+2\mathring{\mathrm{Rm}}h-\tfrac R2 h .
\]
Write \(\mathscr L=-\Delta_L^{\mathrm{GV}}\), the self-adjoint
Lichnerowicz operator with positive leading symbol. Use smooth TT
tensors \(h\), meaning \(\operatorname{tr}_g h=0\) and \(\nabla^i h_{ij}=0\).
The Einstein assumption ensures preservation of TT by \(\mathscr L\).
Its TT spectrum is discrete, with smooth eigenfields and finite
multiplicities. All inner products below are taken at \(g\).
[Gursky–Viaclovsky, §1.2, Theorem 3.10 and §4.1](https://citeseerx.ist.psu.edu/document?doi=7580e80330031de8b7399cf9ea10467d6fdf70e0&repid=rep1&type=pdf)

In dimension four Gursky–Viaclovsky's volume normalization
\(V^{4/n-1}\) is one, so their functional is
\(\mathcal F_\tau=\int(|\operatorname{Ric}|^2+\tau R^2)\,dV\).
At \(\tau=-1/3\) the Chern–Gauss–Bonnet identity gives
\[
 \mathcal F_{-1/3}
     =\tfrac12\int |W|_{\mathrm{4ind}}^2\,dV-16\pi^2\chi(M).
\]
The four-index norm is \(4(|W^+|_{\mathrm{HS}}^2+|W^-|_{\mathrm{HS}}^2)\)
after squaring. The signature vanishes for \(M\), so \(E_-=E_+\)
for every metric in the variation. Thus
\(\mathcal F_{-1/3}=4E_+-16\pi^2\chi(M)\).
The conversion is at the level of functionals. Einstein metrics
are critical, so the Hessian of this functional along a path with
initial derivative \(h\) pairs \(h\) with the linearized gradient,
without an acceleration term. Theorem 3.10, equation (3.41),
gives the TT linearized gradient of \(\mathcal F_\tau\) as
\(\tfrac12(\Delta_L^{\mathrm{GV}}+2R/n)
(\Delta_L^{\mathrm{GV}}+(4/n+2\tau)R)\).
Substituting \(n=4\) and \(\tau=-1/3\) and dividing by four gives
\[
 D^2E_+(g)[h,h]
 =\tfrac18\big\langle h,(\mathscr L-\tfrac R2)(\mathscr L-\tfrac R3)h
             \big\rangle_{L^2}
 =\tfrac18\left(\|(\mathscr L-\tfrac{5R}{12})h\|_2^2
                  -\tfrac{R^2}{144}\|h\|_2^2\right).
 \tag{1}
\]
[Gursky–Viaclovsky, (1.1)–(1.3), §3.1 and (3.41)](https://citeseerx.ist.psu.edu/document?doi=7580e80330031de8b7399cf9ea10467d6fdf70e0&repid=rep1&type=pdf)
· [SEC chiral conventions](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

On a TT eigentensor of eigenvalue \(\mu\) for \(\mathscr L\), the
Hessian multiplier is \((\mu-R/2)(\mu-R/3)/8\).
Hence a negative TT direction exists exactly when
\[
 \operatorname{spec}_{\rm TT}(\mathscr L)\cap(R/3,R/2)\ne\varnothing .
 \tag{2}
\]
The TT Jacobi kernel is the sum of the eigenspaces at the two
endpoints. These are kernel tensors for the bilinear Hessian.
The \(R/2\) endpoint corresponds to the infinitesimal Einstein
equation in TT gauge, by the Einstein Ricci linearization. The
\(R/3\) endpoint is a distinct Weyl-functional degeneracy.
Equivalently the Einstein operator
\(\mathscr E=\mathscr L-R/2=\nabla^*\nabla-2\mathring{\mathrm{Rm}}\)
has negative Weyl-Hessian interval \((-R/6,0)\), since (1) factors
as \(\mathscr E(\mathscr E+R/6)/8\). An eigenvalue below \(R/3\) for
\(\mathscr L\) gives positive Weyl second variation even though it
lies below the infinitesimal Einstein threshold. In the presence
of negative and positive modes a vector of zero quadratic value
need not be a Jacobi kernel tensor.

## Gauge directions and admissible descent

Smooth conformal changes and flows of vector fields preserve \(E_+\)
on the oriented manifold. For any smooth \(f\) or \(X\) the first
derivative paired with \(fg\) or \(\mathcal L_Xg\) vanishes identically
as a function of the metric. Differentiating at a critical metric
shows that both gauge directions are in the radical of the full
Hessian, including mixed pairings. The \(L^2\) pairings of a TT
tensor with either direction vanish. Conversely, decompose a
variation into its trace and trace-free parts and project the latter
orthogonally to the image of \(KX=(\mathcal L_Xg)_0\).
The equation for this projection uses \(K^*K\), elliptic on vector
fields by the injective symbol of \(K\), and its right-hand side is
orthogonal to conformal Killing fields. The residual is TT.
Thus (1) detects negative second variations modulo the two gauges.
[SEC-E42, York splitting on the round model](../../notes/SEC_E42_20261124.md#classification-by-the-closed-round-problem)

A nonzero TT direction is realized by the smooth positive metric path
\(g_s=g(e^{s h^\sharp}\,\cdot,\cdot)\). Its volume form is fixed
pointwise, and \(R(g_s)>0\) for small \(|s|\) by \(C^2\) continuity
and compactness. Positive scalar curvature gives positive class
Yamabe constant by the compact Sobolev inequality. Thus a negative
mode yields a strict decrease of \(E_+\) along a path of admissible
positive-Yamabe metrics on the same smooth type. If required, each
metric along the path can be put in a volume-one Yamabe minimizing
gauge without altering its energy. One need not assume a
differentiable choice of those representatives for this conclusion.

Consequently a local minimum among all positive-Yamabe metrics
requires the open interval in (2) to be empty. If the closed interval
\([R/3,R/2]\) is empty, Gursky–Viaclovsky's Theorem 1.6 gives a
strict local Weyl minimum modulo diffeomorphism and conformal
changes, and exclusion of the two endpoint eigenvalues alone gives
local Bach rigidity. These nonlinear conclusions are the cited
theorem. An open-interval exclusion with a nontrivial endpoint
kernel gives a nonnegative Hessian and leaves higher-order
analysis in those directions. A minimum among the SEC §12.3
*critical values* has a different admissible set. A smooth TT
descent along arbitrary positive-Yamabe metrics need not give
another Bach-flat metric.
[Gursky–Viaclovsky, Definition 1.5, Theorem 1.6 and Proposition 6.4](https://citeseerx.ist.psu.edu/document?doi=7580e80330031de8b7399cf9ea10467d6fdf70e0&repid=rep1&type=pdf)
· [SEC §12.3](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4590)

## Yamabe scale and the surviving energy band

At arbitrary volume the Einstein Chern–Gauss–Bonnet identity in
this normalization is
\[
 16\pi^2=2E_+(g)+R^2 V/24 .
 \tag{3}
\]
Here \(R\sqrt V=Y([g])\). To verify this directly, let \(\widehat g\)
be a smooth Yamabe minimizer conformal to \(g\), which exists by
the Yamabe theorem, and write \(g=u^{-2}\widehat g\), \(u>0\).
The trace-free Ricci conformal formula is
\[
 0=E_g=E_{\widehat g}
       +2u^{-1}(\widehat\nabla^2u)_0 ,
\]
where \(E\) in this identity denotes the trace-free Ricci tensor,
and the trace-free part is with respect to \(\widehat g\).
Pair with \(u E_{\widehat g}\) and integrate in \(\widehat g\).
The Hessian term integrates to zero by the contracted Bianchi
identity and the constant scalar curvature of \(\widehat g\).
Thus \(E_{\widehat g}=0\) and \(\widehat g\) is Einstein too.
The Yamabe constant is positive because \(g\) has positive scalar
curvature. Applying (3) to both Einstein metrics and using
conformal invariance of \(E_+\) gives
\(R\sqrt V=\widehat R\sqrt{\widehat V}=Y([g])\).
[Schoen, Theorems 2–3 and the minimizing solution](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf)

In the volume-one normalization \(R=Y=Y([g])\), so (3) becomes
\[
 E_+(g)=8\pi^2-\frac{Y^2}{48},\qquad
 (R/3,R/2)=(Y/3,Y/2).
\]
The dimensionless spectral interval is
\(\mu/R\in(1/3,1/2)\), invariant under constant scaling.
If a nonround positive Einstein metric lies in the SEC band,
the closed Bach-flat gap already supplies \(E_+>4\pi^2\).
Along with \(E_+\le8\pi^2-\delta\), this gives
\[
 \sqrt{48\delta}\le Y<8\sqrt 3\,\pi .
\]
At such a metric any strict small descent in the positive class
can stay within the band, since the initial energy lies strictly
above its lower endpoint. These identities determine the interval
relative to \(Y\) and the energy. Locating a TT eigenvalue in the
interval is a further requirement. On TT tensors the operator
also reads \(\mathscr L=\nabla^*\nabla-2\mathring W+2R/3\), where
\((\mathring W h)_{ij}=W_{ipjq}h^{pq}\). The supplied band is an
integral bound on \(W\) and the identities above give no estimate
placing an eigenspace in (2). In particular this calculation
establishes no negative direction on the surviving class.
[SEC §12, closed Bach-flat gap](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4350)

## Round benchmark and scope

On the sectional-curvature-one \(S^4\), \(R=12\) and
\(\mathscr L=\nabla^*\nabla+8\) on TT. Equation (1) gives
\[
 D^2E_+(g_{\rm rd})|_{\rm TT}
   =\tfrac18(\nabla^*\nabla+2)(\nabla^*\nabla+4).
\]
Even nonnegativity of the rough Laplacian makes this positive.
This recovers the round computation in SEC-E42, where the
linearized chiral block \(D_0\) satisfies
\(D^2E_+=2D_0^*D_0\) at the vanishing Weyl background.
Gauge directions persist, and the round energy is zero.
[Gursky–Viaclovsky, §7.1](https://citeseerx.ist.psu.edu/document?doi=7580e80330031de8b7399cf9ea10467d6fdf70e0&repid=rep1&type=pdf)
· [SEC-E42](../../notes/SEC_E42_20261124.md#classification-by-the-closed-round-problem)

A supplied conformally Einstein class can be tested in its Einstein
representative using conformal invariance. For a general closed
positive-Yamabe Bach-flat survivor an Einstein representative is an
additional premise. Its unrestricted Weyl Hessian still has the
gauge degeneracies, and establishing a negative direction there
requires its own gauge-fixed Hessian or a different descent
argument. The present test concerns a single closed critical
metric, and uses no topology-based assertion about the existence
or spectrum of a nonround Einstein metric.

Primary passages checked on 25 November 2026 were Matthew J. Gursky
and Jeff A. Viaclovsky, *Rigidity and stability of Einstein metrics
for quadratic curvature functionals*, arXiv:1105.4648v2 (20 April 2013),
(1.1)–(1.3), §1.2, Definition 1.5, Theorem 1.6, §3.1, Theorem 3.10
and (3.41), §4.1, Proposition 6.4 and §7.1. The inspected PDF is
the mirrored v2 preprint. The journal article is in
J. Reine Angew. Math. 700 (2015), 37–91.
Schoen's cited primary copy is J. Differential Geom. 20 (1984),
479–495. The round Hessian was previously checked in SEC-E42,
and the exact sign test and conditional local stability are
applications of the existing Einstein factorization.
