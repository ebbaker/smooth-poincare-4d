# SP4-FOT-MATCH-E08 · Global critical norm of regular Dirac jump corrections

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E check under MATCH-B03.
Recommended gpt-6.2-sol / ultra. The helper's exact serving model
and reasoning effort are unavailable.
[Frozen request and inputs](../research-progress/handoffs/E08_REQUEST_20261125.md)

## The closed conformal estimate

Let \(g\) be a smooth Riemannian metric on a smooth closed
oriented spin four-manifold with \(Y([g])\ge y_0>0\).
Fix the spin structure and the ordinary, untwisted Dirac
operator with \(c(X)^2=-|X|^2\). Set \(p=8/5\) and \(q=8/3\),
the Hölder dual exponent of \(p\). The inverse satisfies
\[
 \|D_g^{-1}f\|_{L^q(g)}
       \le C_0\|f\|_{L^p(g)},\qquad
 C_0=2^{1/4}\sqrt{\frac3{y_0}} .
 \tag{1}
\]
The constant uses only the positive Yamabe lower bound. This
is a two-test estimate obtained from the closed Hijazi bound
and the classical conformal Dirac norms.
[Hijazi, CMP 104 (1986), pp. 151–162](https://doi.org/10.1007/BF01210797) ·
[Ammann, equations (1.1)–(1.2) and §2.2](https://ammann.app.uni-regensburg.de/preprints/comin/comin.pdf)

For \(h=u^2g\) with \(u>0\) smooth, set \(V_h=\operatorname{Vol}(M,h)\).
The first eigenvalue of \(6\Delta_h+s_h\), in the nonnegative
Laplacian convention, is at least \(Y([g])V_h^{-1/2}\) by
the Yamabe quotient and Hölder. Hijazi's inequality gives
\(\lambda^2\ge Y([g])/(3V_h^{1/2})\) for every Dirac
eigenvalue in \(h\). Thus \(D_h\) has no kernel and its
self-adjoint inverse has
\[
 \|D_h^{-1}\|_{L^2(h)\to L^2(h)}
  \le \sqrt{3/y_0}\,V_h^{1/4}.
 \tag{2}
\]
The [E06 first-eigenfunction proof](E06_ACTUAL_CORE_GRAPHS_20261125.md#the-closed-inverse-with-a-fixed-product-near-the-seam)
also gives (2) directly. The conformal spin isometry
\(\beta:S_g\to S_h\) identifies
\(D_h(u^{-3/2}\beta\psi)=u^{-5/2}\beta D_g\psi\).
In particular, for smooth \(f,k\) and
\(f_h=u^{-5/2}\beta f,\ k_h=u^{-5/2}\beta k\), one has the
exact pairing identity
\[
 \int_M\langle D_g^{-1}f,k\rangle_g\,dV_g
 =\int_M\langle D_h^{-1}f_h,k_h\rangle_h\,dV_h .
\]
The solution weight \(-3/2\) and test weight \(-5/2\)
cancel the volume exponent \(+4\). Also
\(\|f_h\|_{L^2(h)}^2=\int_M u^{-1}|f|_g^2\,dV_g\),
with the same formula for \(k_h\).
[DIR, conformal weights](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L343)

By homogeneity assume \(\|f\|_p=\|k\|_p=1\). For \(\epsilon>0\)
choose
\[
 u_\epsilon^4=(|f|_g^2+\epsilon)^{4/5}
                  +(|k|_g^2+\epsilon)^{4/5}.
\]
These functions are smooth and strictly positive, including
at the common zeros of \(f,k\). For each \(\epsilon\),
\(u_\epsilon^{-1}|f|^2\le |f|^{8/5}\), and the same holds
for \(k\). Hence both \(L^2(h_\epsilon)\) norms are at
most one, and \(V_{h_\epsilon}\to2\) as \(\epsilon\)
tends to zero for the fixed smooth \(f,k,g\).
Apply (2) to the invariant pairing and take this limit.
The result for arbitrary smooth \(f,k\) is
\[
 \left|\int_M\langle D_g^{-1}f,k\rangle_g\,dV_g\right|
       \le C_0\|f\|_p\|k\|_p .
\]
Taking the supremum over smooth tests in the dual unit ball
proves (1) on smooth sources. Density extends the estimate to
\(L^p\) with a distributional solution in \(L^q\). This solution
is unique, because a distributional homogeneous solution is
smooth by elliptic regularity and \(D_g\) has zero kernel.
For sources of a fixed target chirality \(S_g^\mp\),
\(D_g^{-1}f\) has chirality \(S_g^\pm\), and it suffices to test
against the latter. This gives the same estimate for the
inverse of \(D_g^\pm\).

For transformed fields, the individual norms at the critical
exponents are themselves invariant:
\[
 \|u^{-3/2}\beta\psi\|_{q,h}=\|\psi\|_{q,g},\qquad
 \|u^{-5/2}\beta f\|_{p,h}=\|f\|_{p,g}.
 \tag{3}
\]
These identities also hold on measurable subsets, so the
estimate on the whole closed source bounds the norm on
every residual subregion in its own conformal gauge.

## Applying the estimate to the regular jump field

Use the [E07 frozen construction](../research-progress/handoffs/E07_REQUEST_20261125.md)
with two measurement seams and fixed-width, one-sided strips in
the supplied spin gauge. Only the two local normalized strips
enter the following norm estimate. In particular the rest of
the closed manifold may have no cylinder chart. For one
spinor prescribe jumps \(\xi_-,\xi_+\) in the fixed reference
\(H^{1/2}\) trace spaces and let
\(J^2=\|\xi_-\|_{H^{1/2}}^2+\|\xi_+\|_{H^{1/2}}^2\).
Take a smooth positive representative \(h\) in the closed
class agreeing with the normalization on those strips.
Extend the two one-sided \(H^1\) lifts by zero on the
other sides and off their supports. Denote the resulting
piecewise \(H^1\) spinor by \(v\) and set \(F=D_{h,\mathrm{pw}}v\),
the Dirac image on the open pieces extended as an \(L^2\)
source to the whole closed manifold. This image omits the
distributional seam term in \(D_hv\).

The ordinary fixed-width trace lifting has piecewise
\(H^1\) norm at most \(C J\) in the product reference
spaces. The transported Dirac operator on each
measurement strip has bounded \(H^1\to L^2\) norm from
its principal \(L^\infty\) control and connection
\(L^4\) control. This uses the local dimension-four
\(H^1\hookrightarrow L^4\) estimate, and the reference and
actual strip volumes are uniformly comparable. In
particular \(\|F\|_2\le C J\), \(\|v\|_4\le C J\).
The supports have uniformly bounded \(h\)-volume, so
\[
 \|F\|_{L^p(h)}+\|v\|_{L^q(h)}\le C J .
\]
Set \(w=D_h^{-1}F\). Since \(F\in L^2\), the closed inverse
has \(H^1\) regularity for the supplied smooth metric.
It has the same two traces at the seam from either side.
Then \(z=v-w\) is piecewise harmonic and retains the
specified jumps. Equations (1) and (3) give
\[
 \|z\|_{L^q(h)}
 \le \|v\|_{L^q(h)}+C_0\|F\|_{L^p(h)}
 \le C(y_0) J .
 \tag{4}
\]
The analogous bound holds for \(w\) alone. One can undo
the conformal normalization to \(g\) or transport to another
conformal gauge and use (3), with the spin weights included.
This proof makes no comparison of volume, injectivity radius
or higher derivatives on the complement of the measurement
strips.
[EXTRACT-E01, critical operator comparison](../../../01_sections_and_connections/02_dirac_collar_extraction/notes/E01_BUFFERED_SPIN_STRIP_20261125.md#operator-on-fixed-hilbert-spaces)

For finitely many such regular corrections \(z_a\) set
\(B=\sum_a J_a^2\). On a region \(U\) in any chosen conformal
gauge with volume \(V>0\), write \(z_a^U\) for the
transported spinors. By Minkowski's inequality in \(L^{4/3}\),
\[
 \left\|\sum_a|z_a^U|^2\right\|_{L^{4/3}(U)}
       \le \sum_a\|z_a^U\|_{L^{8/3}(U)}^2
       \le C(y_0)^2 B .
\]
Thus a joint floor \(\sum_a|z_a^U|^2\ge c^2\) almost
everywhere forces
\[
 c^2 V^{3/4}\le C(y_0)^2 B,\qquad
 c\le C(y_0) B^{1/2}V^{-3/8}.
 \tag{5}
\]
The same bound applies to a family of \(w_a\)'s.
Here \(V\) is the volume in the gauge in which the floor
is measured. On a product-like region of length \(L\) where
that volume is comparable to \(L\), the right side loses
\(L^{-3/8}\) at bounded total squared jump budget. Equation
(4) remains available without that regional geometry or
a product-length interpretation. This controls the upper
mass of the correction and puts an upper bound on a
possible joint floor.

## Pole and derivative scope

A Green field with fixed nonzero point source in a flat
germ has leading norm proportional to \(r^{-3}\) in
dimension four. Its \(8/3\)-power integral outside a
cutoff radius \(\delta\) in that germ grows as
\(\int_\delta^{r_0} r^{-5}\,dr\), of order \(\delta^{-4}\)
for fixed \(r_0>0\).
The borderline pole order for this exponent is \(r^{-3/2}\),
which gives logarithmic divergence. These statements refer
to the Dirac spin weights and are unaffected by changing
to a conformal gauge on the punctured region, by (3).
The prescribed distributional point source lies outside
\(L^{8/5}\). An \(L^{8/3}\) regular correction cannot
remove the divergence of the fixed Green field. Its
actual weighted trace may enter the jump data through
an affine shift, whose size must be supplied or bounded
independently. The full matched spinor can include a
regular or singular reference field in addition to (4).
Equation (5) concerns the regular corrections unless
an independent critical bound is available for the other
fields on the specified region.
[DIR §4.1, Green pole and conformal normalization](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L516)

Neither (1) nor (4) controls the differentiated twistor
defect on the residual. A Weyl-energy implication still
requires an appropriate lower spinor normalization and a
bound for the projected differentiated defect in the
weighted ratio used in MATCH-B03.
[DIR §2.3, curvature defect](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276)
