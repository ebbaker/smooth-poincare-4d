# SP4-CME-E90 — Intrinsic strain and quantitative comparison with a round metric

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored the inherited
E02C and E84 inputs. All five frozen digests in
the [request][req] matched at consumption. This is an endpoint
consequence of the assessed intrinsic-budget and convergence
theorem. No new primary source was inspected or imported.
[B52][b52]. [Return][ret].

## Hypotheses and normalization

Let \(A_{\rm in}\) be a smooth positive definite connection on
the fixed round-compatible chiral \(SO(3)\) bundle over the
compact, closed, oriented standard smooth \(S^4\). The reconstructed
metrics are Riemannian. Use the smooth open invariant neighborhood
\(\mathcal W\) of the round orbit and the threshold
\(\ell_*>0\) in the frozen manuscript's
`cor:intrinsic-orbit-budget`. Define
\[
 \ell=\|T(A_{\rm in})\|_{L^{4,1}(g^{\rm F}_{A_{\rm in}})}
        \le \ell_* .
\]
For these data the assessed result gives the global smooth
original Fine flow, its smooth round-pullback limit, and
\(J(\infty)\le C_{\rm budget}\ell\).
The constant \(C_{\rm budget}\) and the threshold are from the
fixed reference and localization, uniform over the stated
automorphism saturation. Use that unadjusted flow in the same
base and bundle identification at all times.
[E84][e84]. [E84–E86 assessment][e8486].
[Manuscript, intrinsic orbit budget and smooth recovery][ms].

Fix the manuscript's \(K>0\). The normalized metric and time are
\(\widehat g_A,t\); the native metric and time satisfy
\(g_A^{\rm F}=c\,\widehat g_A\), \(\tau=ct\), \(c=2K\).
The manuscript's bracket-orthonormal internal convention and
the native negative Killing convention differ by a constant
internal metric factor. The endomorphism \(Q\), its square
root, and \(T\) as an endomorphism-valued one-form are the
same under this conversion. Constant rescaling leaves the
Levi-Civita connection unchanged. Thus \(|T|^2\) and
\(|\nabla^A T|\), with one and two covector slots respectively,
both acquire a factor \(c^{-1}\) in the native metric.
Their time integrals agree because \(d\tau=c\,dt\).
The \(L^{4,1}\) modulus scales by \(c^{-1/2}\) and
the four-dimensional volume by \(c^2\), which cancel in
\(4\int_0^\infty\operatorname{Vol}(\{|T|>\lambda\})^{1/4}\,d\lambda\).
Thus \(\ell\) and \(J\) are unchanged by the normalization.
[E84, native budget][e84]. [Manuscript, native conventions][ms].

## Endpoint forms and volume

Let \(A_\infty=j_\infty^*A_0\) be the limiting connection, where
\(j_\infty\) is an allowed smooth equivariant automorphism with
orientation-preserving base map \(f_\infty\). Write
\[
 \begin{split}
 \widehat g&=\widehat g_{A_{\rm in}},\qquad
 \widehat h=\widehat g_{A_\infty}
     =f_\infty^*\widehat g_{A_0},\\
 g^{\rm F}&=g^{\rm F}_{A_{\rm in}}=c\widehat g,\qquad
 h^{\rm F}=g^{\rm F}_{A_\infty}=c\widehat h
     =f_\infty^*g^{\rm F}_{A_0}.
 \end{split}
\]
Here \(\widehat h\) has sectional curvature \(K\);
\(h^{\rm F}\) has sectional curvature \(K/c=1/2\).
Curvature pullback conjugates the normalized endomorphism by
the fiber isometry. Since \(Q(A_0)=I\), one has
\(Q(A_\infty)(x)=U_x^{-1}I\,U_x=I_{E_x}\) at each point.
This uses the identity endomorphism and is independent of
the internal isometry chosen to express the pullback.
Smooth convergence gives the metric and \(Q\) limits as
tensors in the original identification. [E84 (11)][e84].
[Manuscript, smooth round limit and critical recovery][ms].

Let \(C_*=4512\sqrt2\) and \(D=C_* C_{\rm budget}\ell\).
For a fixed nonzero tangent vector \(X\) and fixed nonzero
internal vector \(v\) at the same spatial point, E14 gives
\[
 \begin{split}
 |\partial_t\log\widehat g_{A(t)}(X,X)|&\le C_*\mathcal G(t,x),\\
 |\partial_t\log\langle Q(A(t))v,v\rangle|&\le C_*\mathcal G(t,x),
 \qquad \mathcal G=|\nabla^A T|_{\widehat g_{A(t)}}
                                 +|T|_{\widehat g_{A(t)}}^2 .
 \end{split}
\]
The second bound uses the relative \(Q\) velocity on all
fixed fiber vectors, so it compares full quadratic forms.
Integrate each logarithmic bound from \(0\) to \(t\), use
\(\int_0^t\sup_x\mathcal G\,ds=J(t)\), and pass to the
smooth limiting tensor. For either pair
\((g,h)=(\widehat g,\widehat h)\) or
\((g,h)=(g^{\rm F},h^{\rm F})\), the result is
\[
 e^{-D}h\le g\le e^D h,\qquad
 e^{-D}I\le Q(A_{\rm in})\le e^D I .                                  \tag{1}
\]
Indeed the finite-time comparison for the metric bounds
the evolving metric between \(e^{-C_*J(t)}\widehat g\)
and \(e^{C_*J(t)}\widehat g\); taking the limit and reversing
the two inequalities gives (1). For \(Q\) use the same argument
with limit \(I\). Multiplying both metric forms by \(c\)
gives (1) in the native scale. One can use the smaller
exponent \(C_*J(\infty)\) throughout. [E14 (4)–(5) and
integrated comparison][e14].

In the fixed unadjusted identification, E02C gives
\(\partial_t\mu_{A(t)}=0\) pointwise as a four-form, with
\(\mu_{A(t)}=2K^2dV_{\widehat g_{A(t)}}\). Taking the smooth limit
and then multiplying by the fixed volume scaling \(c^2\)
gives exact endpoint equalities
\[
 dV_{\widehat g}=dV_{\widehat h},\qquad
 dV_{g^{\rm F}}=dV_{h^{\rm F}} .                                       \tag{2}
\]
In each pair the common form equals the pullback by
\(f_\infty\) of the reference round volume form at that
scale. The native form scales by \(c^2\) relative to the
normalized form across the two pairs. Equation (2) concerns
pointwise equality on the same base, and therefore also
gives equality of total volumes. [E02C, pointwise volume
and gauge dependence][e02c]. [Manuscript, pointwise volume][ms].

## Distance and diameter

For either pair in (1), the quadratic form bound gives
\[
  e^{-D/2}|\dot\gamma|_h
   \le|\dot\gamma|_g\le e^{D/2}|\dot\gamma|_h
\]
on every piecewise smooth curve. Integrating along each curve,
then taking infima over curves with given endpoints, gives
\[
 e^{-D/2}d_h(x,y)\le d_g(x,y)\le e^{D/2}d_h(x,y)
       \qquad (x,y\in S^4).
\]
Taking suprema gives
\[
 e^{-D/2}\operatorname{diam}(h)
 \le \operatorname{diam}(g)
 \le e^{D/2}\operatorname{diam}(h).                                   \tag{3}
\]
Since \(h\) is the round pullback, its diameter is
\(\pi/\sqrt K\) in the normalized metric and \(\pi\sqrt2\)
in the native metric. Distances and diameter scale by
\(\sqrt c\) from normalized to native. The norm and exponent
controlling both comparisons are intrinsic to \(A_{\rm in}\).

## Scalar Laplace eigenvalues

In either pair use its common volume \(d\nu=dV_g=dV_h\).
Inverting (1) gives the dual form inequalities
\(e^{-D}h^{-1}\le g^{-1}\le e^Dh^{-1}\). Therefore for every
\(u\in H^1(S^4)\),
\[
 e^{-D}\mathcal E_h(u)\le\mathcal E_g(u)\le e^D\mathcal E_h(u),
 \qquad \mathcal E_m(u)=\int_{S^4}|du|_m^2\,d\nu
 \quad (m=g,h).
                                                                            \tag{4}
\]
The form domains coincide as sets and their norms are equivalent
by (4). For a nonzero \(u\), the two Rayleigh quotients with
nonnegative scalar Laplacians use the same denominator
\(\int|u|^2\,d\nu\).

Write \(\lambda_j(m)\), \(j=0,1,\ldots\), for the eigenvalues
of the nonnegative scalar Laplace operator with multiplicity,
including \(\lambda_0=0\). The compact form realization gives
an orthonormal eigenbasis. Adding the \(L^2(d\nu)\) term
gives a coercive form on \(H^1\) and a bounded weak inverse
from \(L^2\) to \(H^1\). The inverse is compact as an \(L^2\)
operator by compact inclusion.
For the min–max formula, the span of the first \(j+1\)
eigenfunctions gives an upper bound of \(\lambda_j\) for
the infimum of the maximal quotient. In any \(j+1\)
dimensional test space a nonzero vector is orthogonal to
the first \(j\) eigenfunctions in the common \(L^2\) pairing.
Its form value is at least \(\lambda_j\) times its \(L^2\)
norm squared. This follows from the eigenfunction expansion,
or by testing against its finite spectral truncations,
which split orthogonally for the form, and passing to the
\(L^2\) Parseval limit. Thus
\[
 \lambda_j(m)=
 \inf_{\substack{\mathcal L\subset H^1\\ \dim\mathcal L=j+1}}
       \ \sup_{0\ne u\in\mathcal L}
       \frac{\mathcal E_m(u)}{\int |u|^2\,d\nu}.
\]
Applying (4) on each test space gives simultaneously for all
\(j\ge0\)
\[
 e^{-D}\lambda_j(h)\le\lambda_j(g)\le e^D\lambda_j(h).                 \tag{5}
\]
The spectrum \(\lambda_j(h)\) is the scalar round spectrum at
the indicated curvature, because \(f_\infty\) is an isometry
from \(h\) to the reference round metric. Under multiplication
by \(c\) the energy in four dimensions scales by \(c\)
and the squared \(L^2\) norm by \(c^2\), so
\(\lambda_j(g^{\rm F})=c^{-1}\lambda_j(\widehat g)\) and
\(\lambda_j(h^{\rm F})=c^{-1}\lambda_j(\widehat h)\).
The exponent in (5) is unchanged. The common volume in
(2) leaves the same density in both the numerator and
denominator comparisons, so there are no extra volume
distortion factors.

## Supplied-round Sobolev inequality

For a pair at a fixed scale let \(C_\nabla,C_2>0\) be supplied
constants for the round metric \(h\) in the inhomogeneous
inequality
\[
 \|u\|_{L^4(h)}^2\le
       C_\nabla\mathcal E_h(u)+C_2\|u\|_{L^2(h)}^2 .
\]
The constants can be taken from the reference round metric
at that scale by its isometry to \(h\). Equation (2) makes
both function norms identical for \(h,g\), and (4) compares
the energies. Hence
\[
 \|u\|_{L^4(g)}^2\le
       e^D C_\nabla\mathcal E_g(u)+C_2\|u\|_{L^2(g)}^2
       \qquad (u\in H^1(S^4)).                                      \tag{6}
\]
In particular a round constant \(C_\nabla=C_2=C_{\rm rd}\)
gives one common coefficient \(e^D C_{\rm rd}\) for the
inhomogeneous \(g\) norm; (6) retains the unchanged
\(L^2\) coefficient. The argument gives the displayed
inequality for smooth functions and extends by \(H^1\)
approximation, since it makes smooth Cauchy approximations
Cauchy in \(L^4\) on the shared volume space.

For scaling, if \(\widehat C_\nabla,\widehat C_2\) are supplied
for the normalized round metric, the corresponding native
choice is \(C_\nabla^{\rm F}=\widehat C_\nabla\),
\(C_2^{\rm F}=c^{-1}\widehat C_2\). Indeed
\(\|u\|_{L^4(g^{\rm F})}^2=c\|u\|_{L^4(\widehat g)}^2\),
\(\mathcal E_{g^{\rm F}}(u)=c\mathcal E_{\widehat g}(u)\) and
\(\|u\|_{L^2(g^{\rm F})}^2=c^2\|u\|_{L^2(\widehat g)}^2\).
Equivalently, a supplied round inequality with one common
coefficient for \(\mathcal E_h+\kappa\|u\|_2^2\)
uses the same coefficient at \(\kappa=K\) and at
\(\kappa=1/2\), because \(\kappa\) scales by \(c^{-1}\).
No sharp round constant is needed.

## Zero strain and scope

If \(\ell=0\), then \(J(\infty)=0\) and \(D=0\).
Equations (1)–(6) give exact round metric, volume and
spectral data, and \(Q(A_{\rm in})=I\).
The two finite-time quadratic-form estimates also give
\(Q(A(t))=I\) throughout. The original velocity then
vanishes in the manuscript's \(q=Q-I\) form of the equation.
Thus \(A_{\rm in}=A_\infty=j_\infty^*A_0\) on the fixed
bundle, and the original trajectory is stationary.

These conclusions concern \(\mathcal W\) and
\(\ell\le\ell_*\). The metric estimates are pointwise
quadratic-form comparisons and the variational estimates
use their common volume. For general positive strain the
argument supplies no initial curvature or injectivity-radius
bounds, no quantitative control of higher coordinate derivatives of
\(f_\infty\), and no extension of \(\mathcal W\) to the whole
value-small basin or to arbitrary smooth homotopy spheres.

[req]: ../research-progress/handoffs/SP4-CME-E90_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E90_RETURN_v1.md
[b52]: ../brainstorm/notes/B52_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
[e14]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e02c]: 04C_VOLUME_AND_JETS_20261122.md
[e84]: 84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e8486]: ../reviews/E84_E86_INTRINSIC_ORBIT_ASSESSMENT_20261122.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
