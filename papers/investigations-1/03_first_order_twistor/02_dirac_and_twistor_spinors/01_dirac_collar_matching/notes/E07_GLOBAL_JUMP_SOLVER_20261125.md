# SP4-FOT-MATCH-E07 · Jump correction on the closed source

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The serving model and reasoning effort are unavailable.
This is a conditional analytic theorem on a supplied embedded collar of the
actual closed source. Input versions are frozen in the
[request revision 1](../research-progress/handoffs/E07_REQUEST_20261125.md).

## Data and estimate

Let \((M,g)\) be smooth, closed, oriented, Riemannian and spin, with
\(Y([g])\ge y_0>0\). Supply a smooth oriented embedding of a neighborhood of
\([-2,L+2]\times S^3\), \(L\ge6\), and a positive smooth function \(F\) on
it. In pullback coordinates set \(h=F^2g\),
\(h_0=dt^2+g_{S^3(1)}\), and \(k=h-h_0\). All collar norms refer to
\(h_0\) and its spin connection. Assume
\[
 \varepsilon=\|k\|_\infty+
 \sup_{1\le |J|\le2}\|\nabla^0 k\|_{L^4(J\times S^3)}\le\varepsilon_*
\]
on the supplied collar. A sufficiently small universal \(\varepsilon_*\)
will suffice. Compare spinors by the fixed symmetric frame lift of
EXTRACT-E01, with the same lift on both faces of each cut. The chirality
may be fixed throughout. In the notation of MATCH-E01, let
\(\mathcal T=H^{1/2}(S^3,S_0^\pm)\) with equivalent norm
\(\||A|^{1/2}\cdot\|_2\), where \(A\) uses \(+\partial_t\).
[Extraction comparison](../../../01_sections_and_connections/02_dirac_collar_extraction/notes/E01_BUFFERED_SPIN_STRIP_20261125.md)
· [Reference trace norm](E01_ROUND_INVERSE_20261125.md)

Cut at \(t_0=0,t_1=L\). On the cut-open manifold let
\(J_\nu q=\tau_{\nu,+}q-\tau_{\nu,-}q\), where the signs label the
increasing-\(t\) and decreasing-\(t\) sides. The traces use harmonic
conformal transport from \(g\) to \(h\) and then the fixed spin gauge.
For every \(j=(j_0,j_1)\in\mathcal T^2\) there is exactly one piecewise
\(H^1\) spinor \(q\) with \(D_g q=0\) on the cut-open interiors and
\(Jq=j\). Write \(B_\nu=[t_\nu-1/2,t_\nu+1/2]\times S^3\) and
\(B_\nu^\pm\) for its two half-buffers. The transported spinor \(q_h\)
satisfies
\[
 \sum_{\nu=0}^1\sum_{\sigma\in\{-,+\}}
 \left(\|q_h\|_{H^1(B_\nu^\sigma)}^2+
        \|\tau_{\nu,\sigma}q\|_{\mathcal T}^2\right)
 \le C(y_0)^2\sum_{\nu=0}^1\|j_\nu\|_{\mathcal T}^2.                 \tag{1}
\]
The constant is independent of \(L\), the original conformal scales and
the geometry outside the fixed end windows. On a homotopy four-sphere the
parallel slices separate, giving the core, intervening strip and exterior.
For a general closed spin manifold this terminology requires separation.
The same proof applies if the complementary end faces belong to one
component of the cut-open manifold.

## A bounded-volume representative with the same end gauges

For each \(\nu\), choose a nonnegative cutoff \(\chi_\nu\le1\) supported in
\(O_\nu=(t_\nu-3/2,t_\nu+3/2)\times S^3\) and equal to one on
\([t_\nu-1,t_\nu+1]\times S^3\). The supports are disjoint. Extend the
products \(\chi_\nu F\) by zero and set
\[
 \theta=c(1-\chi_0-\chi_1)+\chi_0 F+\chi_1 F,\qquad
 \widetilde g=\theta^2g,
\]
where \(0<c\le1\) is chosen with \(c^4\operatorname{Vol}_g(M)\le1\).
This is smooth and positive on \(M\), and \(\widetilde g=h\) on the
two unit-radius windows. Convexity of the fourth power gives
\[
 \operatorname{Vol}_{\widetilde g}(M)
 \le c^4\operatorname{Vol}_g(M)+\sum_{\nu=0}^1\operatorname{Vol}_{h}(O_\nu)
 \le 1+6(1+\varepsilon_*)^2\operatorname{Vol}(S^3)=V_* .               \tag{2}
\]
The last bound follows from the uniform pointwise eigenvalue bound for
\(h_0^{-1}h\). The Yamabe class is preserved. The volume estimate uses
only pointwise information about \(\theta\).

On the smooth closed spin manifold \((M,\widetilde g)\) every Dirac
eigenvalue satisfies
\[
 |\lambda|^2\ge {y_0\over3}\operatorname{Vol}_{\widetilde g}(M)^{-1/2}.
                                                                        \tag{3}
\]
For the normalization, put \(L_{\widetilde g}=6\Delta_{\widetilde g}+s_{\widetilde g}\)
with nonnegative \(\Delta\). The Yamabe bound and Hölder give
\(\mu_1(L_{\widetilde g})\ge y_0\operatorname{Vol}_{\widetilde g}(M)^{-1/2}\).
For a positive first eigenfunction \(f\) on a connected component,
\(\check g=f^2\widetilde g\) has scalar curvature \(\mu_1f^{-2}\).
A Dirac eigenspinor transported with the harmonic weight solves
\(D_{\check g}\check\psi=\lambda f^{-1}\check\psi\). The integrated
twistor identity yields
\(0\le\|P_{\check g}\check\psi\|_2^2=(3\lambda^2-\mu_1)\int
f^{-2}|\check\psi|^2\,dV_{\check g}/4\).
Apply this componentwise if needed. This reproduces the
four-dimensional Hijazi estimate with the required conventions. It also
excludes a kernel. The self-adjoint closed Dirac inverse maps \(L^2\) into
its \(H^1\) domain and obeys
\[
 \|D_{\widetilde g}^{-1}\|_{2\to2}\le \sqrt{3/y_0}\,V_*^{1/4}.         \tag{4}
\]
Anticommutation with chirality gives the corresponding chiral inverse.
[Hijazi, Theorem A and (2.1)–(2.2)](https://archive.mpim-bonn.mpg.de/id/eprint/3484/1/preprint_1985_29.pdf)
· [DIR conformal and twistor conventions](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex)
· [MATCH-E06 spectral argument](E06_ACTUAL_CORE_GRAPHS_20261125.md)

## Lift the jumps and invert the regular forcing

On the positive side of the \(\nu\)-th cut put
\[
 v_\nu(t_\nu+s)=\zeta(s)e^{-s|A|}j_\nu,\qquad 0\le s<1/2,
\]
where \(\zeta=1\) near zero and has support in \([0,1/2)\). Use the fixed
spin comparison to regard \(v_\nu\) as a spinor for \(\widetilde g\).
Extend it by zero on the other faces and off this half-buffer on the
cut-open manifold. With \(v=v_0+v_1\), the reference \(H^1\) norm of \(v\)
is bounded by \(C\|j\|_{\mathcal T^2}\). Indeed on an angular mode of
absolute eigenvalue \(\mu\ge3/2\), the squared derivative,
\(|A|\) and zeroth-order integrals are bounded by
\(C\int_0^\infty(1+\mu^2)e^{-2\mu s}\,ds\) times the squared
coefficient. This is at most \(C\mu\) times that coefficient. The spin
Schrödinger–Lichnerowicz identity on the reference sphere controls the
tangential covariant derivative by the same bound.

Define \(G=D_{\widetilde g,\mathrm{pw}}v\) by evaluating the Dirac
operator on the interiors of the cut pieces and then regarding it as a
global \(L^2\) spinor. This definition retains the ordinary first-order
term on each side. The distributional derivative of \(v\) as a section
on the uncut manifold would additionally have \(c(\nu)J_\nu v\,\delta_{\Sigma_\nu}\)
at each seam, in the geometric frame with \(\nu\) pointing to the positive
side. The inverse below takes the regular forcing \(G\). The fixed-window
\(H^1\to L^2\) comparison and the lift bound give
\[
 \|G\|_{2,\widetilde g}\le C\|j\|_{\mathcal T^2}.
\]
Solve \(w=D_{\widetilde g}^{-1}G\). By (4),
\(\|w\|_{2,\widetilde g}\le C(y_0)\|j\|_{\mathcal T^2}\).
The global \(H^1\) spinor \(w\) has equal traces across both seams.
Thus \(\widetilde q=v-w\) on the cut-open manifold is Dirac-harmonic
and has jumps \(j\).

To obtain the local derivative estimate, fix \(\xi_\nu=1\) on \(B_\nu\)
supported in the open unit-radius window and compare \(\xi_\nu w\)
with a compactly supported reference-cylinder spinor. With operators
transported to the reference spin bundle, the product
Schrödinger–Lichnerowicz identity gives
\(\|u\|_{H^1}\le C_0\|D_0u\|_2\) for such compactly supported \(u\), since
the reference scalar curvature is six. The coefficient difference obeys
\[
 \| (D_{h}-D_0)u\|_2\le C_1\varepsilon\|u\|_{H^1}.
\]
Here the principal coefficient error is \(O(|k|)\), and the connection
error is bounded by \(C(|k|+|\nabla^0k|)\). Hölder and the fixed-window
\(H^1\hookrightarrow L^4\) embedding control the latter. Choose
\(C_0C_1\varepsilon_*<1/2\). Apply the resulting estimate to
\(u=\xi_\nu w\) and use the commutator with the cutoff to get
\[
 \|w\|_{H^1(B_\nu)}
 \le C\bigl(\|G\|_{2,\widetilde g}+\|w\|_{2,\widetilde g}\bigr).
\]
The reference trace estimates on the half-buffers and the bound for \(v\)
give (1). The construction also yields
\(\|\widetilde q\|_{2,\widetilde g}\le C(y_0)\|j\|_{\mathcal T^2}\).
A piecewise \(H^1\) spinor with zero jumps glues across both seams to a global
\(H^1\) section. If it is piecewise harmonic it is globally weakly
harmonic, because the conormal trace terms cancel. Equation (3) then
gives uniqueness. [Local coefficient comparison](E02_FIXED_PROJECTION_PERTURBATION_20261125.md)

## Original metric, trace spaces and a supplied pole

With the conformal spin-bundle isometry \(\beta:S_g\to S_{\widetilde g}\),
the piecewise harmonic spinor for the original metric is
\(q=\theta^{3/2}\beta^{-1}\widetilde q\). On the measurement windows
\(\theta=F\), so (1) is exactly the prescribed collar-gauge estimate
for \(q\). The auxiliary global \(L^2\) bound corresponds to
\(\int_M\theta|q|_g^2dV_g\le C(y_0)^2\|j\|_{\mathcal T^2}^2\).
Unweighted estimates in a varying physical gauge would require control
of its conformal factors and, for derivatives, their variation.

Let \(\mathcal C\subset\mathcal T^4\) consist of the four face traces
of actual piecewise \(H^1\) harmonic sections, with the two middle faces
coming from the same solution on the intervening strip. Then
\(J|_{\mathcal C}:\mathcal C\to\mathcal T^2\) is bijective. Its bounded
inverse is the trace of the constructed solution, with norm at most
\(C(y_0)\). Hence \(\mathcal C\) is closed and is a uniformly complemented
subspace against the equal-trace subspace \(\ker J\): the bounded
projection onto \(\mathcal C\) is \((J|_{\mathcal C})^{-1}J\).
This establishes simultaneous transversality of the actual traces in
the stated gauges. A graph estimate for an individual face relative to
the spectral projections would require further input.

For smooth \(j\) the correction is smooth up to each face separately.
One way to see this is to choose another one-sided lift with the same
trace and with its regular Dirac forcing flat at the seam. The
coefficient of the normal derivative is Clifford multiplication by a
nonzero normal covector and is invertible. Starting from \(j\), solve
successively for the higher normal jets of the lift by imposing zero
jets on its forcing. A smooth extension of these jets is obtained by
cutting off their successive Taylor terms on progressively smaller
normal intervals so each term is summable in every fixed lower-order
norm. The forcing, extended by zero over the cut, is smooth. Elliptic
regularity gives smoothness of the corresponding global inverse. The
piecewise correction coincides with the bounded construction by
uniqueness.

Suppose a physical piece already supplies a pole at an interior point
with its fixed source coefficient, and actual piecewise Dirac solutions
are given on the cut-open manifold with those sources and face traces
in \(\mathcal T\). Add the correction with the opposite jumps. The
corrector is smooth near each pole, so the source and leading singular
term are preserved. The adjusted section solves the prescribed global
distributional equation, with cancellation of seam terms. Uniqueness
holds among solutions with the same poles and \(H^1\) remainder by (3).
A pole from an auxiliary cap can be treated this way only if its field
is supplied on the corresponding actual piece with the stipulated seam
trace and physical source. The estimate controls the cost of its given
trace mismatch. A bound on the normalized pole-induced trace, a lower
spinor bound in the middle and control of the differentiated twistor
defect there require independent estimates. [DIR Green convention](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L514)
· [MATCH-E04 pole trace scale](E04_BALL_AND_POLE_TRACES_20261125.md)
