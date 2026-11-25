# SP4-FOT-EXTRACT-E01 · First-order comparison on a supplied spin strip

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E proof check, with recommendation
gpt-6.2-sol / ultra. The helper's exact serving model and reasoning effort
are unavailable. Source checkout, TeX hashes and scope are fixed in the
[request](../research-progress/handoffs/E01_REQUEST_20261125.md).

## Supplied chart and radius cancellation

Use the [SEC §14.3 annulus](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5520)
with \(A=\{r\le|x|\le R\}\), \(A^*=\{r/2<|x|<2R\}\) and \(R\ge 2r\).
The smooth Riemannian metric \(g=\delta+v\) has Euclidean Frobenius norm
\(a=\|v\|_{L^\infty(A^*)}\le\varepsilon_0\le 1/4\) and Euclidean
\(K=\|D^2v\|_{L^2(A^*,dx)}\). Use only the interpolation estimate
\(\|\eta Dv\|_{L^4(dx)}^2\le Ca(K+a)\). In the SEC cutoff, \(\eta=1\)
on \([7r/8,9R/8]\) in radius. Fix \(I=[t_-,t_+]\) of length
\(L\ge 2\) with \(\rho_\pm=\rho_0e^{t_\pm}\), \(r\le\rho_-\),
\(\rho_+\le R\). This fits when \(L\le\log(R/r)\). It has at least
\(\log(8/7)\) of inner and \(\log(9/8)\) of outer buffer before the
cutoff varies. All fields below are smooth on a neighborhood of the
closed strip. The local calculation also applies whenever the strip
is contained in the \(\eta=1\) region with both end buffers supplied.
[SEC interpolation and theorem](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5539)

Set \(Q=I\times S^3\), \(\Phi(t,\omega)=\rho\omega\) with
\(\rho=\rho_0e^t\), \(G=\Phi^*g\), \(G_0=\Phi^*\delta\), and take
\(h=\rho^{-2}G\), \(h_0=\rho^{-2}G_0=dt^2+\gamma_{S^3(1)}\).
Here \(S^3\) has its boundary-of-the-ball orientation and \(Q\) the
orientation \(dt\wedge dV_\gamma\), making \(\Phi\) orientation
preserving. The spin structure induced from the oriented chart is
unique since \(H^1(Q;\mathbb Z/2)=0\). Take the Clifford convention
\(c(X)^2=-|X|^2\) and \(S^+\) as in DIR. With \(k=h-h_0\), express
\(k\) in the global \(h_0\)-orthonormal frame
\(F_i=\rho\,d\Phi^{-1}\partial_{x_i}\) built from the oriented Cartesian
frame. Then \(k(F_i,F_j)=v_{ij}\circ\Phi\). In particular
\(|k|_0=|v|\circ\Phi\). The conformal connection relation gives
\[
 \nabla^0_X F_i=-dt(F_i)X+h_0(X,F_i)\partial_t .
\]
Indeed \(\nabla^{G_0}_XF_i=dt(X)F_i\), and the conformal factor for
\(h_0\) is \(\rho^{-1}\). Thus the derivatives of the frame are uniformly
bounded in the cylinder metric. Derivatives of the entries of \(k\)
are \(F_\ell(v_{ij}\circ\Phi)=\rho(\partial_{x_\ell}v_{ij})\circ\Phi\).
Consequently, with pullback along \(\Phi\) understood,
\[
 |\nabla^0 k|_0\le C(\rho|Dv|+|v|),\qquad
 dV_0=dt\,dV_\gamma=\rho^{-4}\Phi^*dx .
\]
For each \(J\subset I\) of length between one and two this gives
\[
\begin{aligned}
 \|\nabla^0k\|_{L^4(J\times S^3,h_0)}
 &\le C\|Dv\|_{L^4(\Phi(J\times S^3),dx)}
         +Ca(|J|\operatorname{vol}(S^3))^{1/4}\\
 &\le C\bigl(\sqrt{a(K+a)}+a\bigr).
\end{aligned}
\]
The \(\rho^4\) from the fourth power of \(\rho|Dv|\) cancels the volume
factor. This uses the interpolation bound on the whole buffered annulus
and a fixed reference volume for the frame term on each slab. It
proves the stated
\[
 \varepsilon_D=\|k\|_{\infty,0}
    +\sup_{1\le |J|\le2}\|\nabla^0 k\|_{L^4(J\times S^3,h_0)}
 \le C\bigl(a+\sqrt{a(K+a)}\bigr).
 \tag{1}
\]
Under \(x=s y\), the normalized coefficients are \(v(sy)\).
The second derivative factor \(s^2\) cancels the square root of the
volume factor \(s^{-4}\) in dimension four. Both \(a\) and \(K\) retain
their values. The constant in (1) is independent of \(\rho_0,\rho_\pm\)
and \(L\).

## Operator on fixed Hilbert spaces

Write \(H=h_0^{-1}h\), \(b=H^{-1/2}\). The map \(e\mapsto be\) sends
\(h_0\)-orthonormal frames to \(h\)-orthonormal frames and preserves
orientation. Lift along \(H^{-s/2}\), \(0\le s\le1\), starting at the
identity in the fixed spin structure. This gives a fiberwise unitary
map \(\beta\colon S_0^\pm\to S_h^\pm\) with
\(\beta c_0(X)=c_h(bX)\beta\). Use that same lift throughout the strip and
on its two ends. The positive-symmetric transport and Dirac formula
are those of Bourguignon–Gauduchon. The reference measure stays \(dV_0\).
The pointwise map \(\beta\) leaves spin lengths intact and the change of
volume is \(dV_h=w\,dV_0\) with \(w=(\det H)^{1/2}\) uniformly comparable
to one. [DIR §3.3](../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L489) · [Bourguignon–Gauduchon, Proposition 1.6, §2 and Theorem 3.1](https://www.igt.uni-stuttgart.de/dokumente/schwahn/SpineursVariations_EN.pdf#page=13)

The eigenvalues of \(H\) lie in \([3/4,5/4]\).
Smoothness of the positive matrix power and the Koszul difference
formula give, pointwise,
\[
 |b-\mathrm{Id}|\le C|k|,\qquad
 |\nabla^0 b|+|\nabla^h-\nabla^0|\le C|\nabla^0 k|.
\]
The transported vector connection differs from \(\nabla^0\) by
\(U(X)=b^{-1}\bigl(\nabla^0_X b+(\nabla^h_X-\nabla^0_X)b\bigr)\).
It is skew with respect to \(h_0\), so its spin action
\(\sigma(U(X))\) is bounded by \(C|X|_0|\nabla^0k|\). In an
\(h_0\)-orthonormal frame \(e_j\), put
\(\widetilde D_h=\beta^{-1}D_h\beta\). Then
\[
 (\widetilde D_h-D_0)u
 =\sum_j c_0(e_j)
  \left(\nabla^0_{(b-\mathrm{Id})e_j}u+
           \sigma(U(be_j))u\right).
 \tag{2}
\]
The corresponding pointwise bound is
\(C(|k|\,|\nabla^0u|+|\nabla^0 k|\,|u|)\). Covariant differentiation
in (2) uses the product spin connection. The estimate in the
transported Cartesian frame may instead move a bounded reference
connection term into \(C|k||u|\).
[DIR-E04, connection computation](../../../02_dirac_and_twistor_spinors/notes/DIR_E04_20261124.md)

Give \(H^1(Q,S_0^+)\) the norm
\((\|u\|_{2,0}^2+\|\nabla^0u\|_{2,0}^2)^{1/2}\) and use
\(L^2(Q,S_0^-;dV_0)\) for the chiral target. The full-spin and
opposite-chiral estimates follow from the same formula. Partition
\(I\) into \(\lfloor L\rfloor\) pieces of equal length in \([1,2]\).
Each piece has the same bound for \(H^1\hookrightarrow L^4\) by affine
rescaling to the unit product interval, with the derivative and measure
factors bounded in both directions. The Sobolev inequality is on each
closed slab, with unrestricted boundary traces. For the lower-order
term, Hölder on each slab and summation of the squared \(L^2\) norms give
\[
 \||\nabla^0 k|\,|u|\|_{2,0}^2
 \le C\left(\sup_J\|\nabla^0k\|_{4,J}\right)^2
           \sum_J\|u\|_{H^1(J\times S^3)}^2
 \le C\varepsilon_D^2\|u\|_{H^1(Q)}^2 .
\]
Thus the result extends by density from smooth sections to the full
\(H^1\) space, including its boundary traces:
\[
 \|(\widetilde D_h^+-D_0^+)u\|_{2,0}
 \le C\varepsilon_D\|u\|_{H^1(Q)}
 \le C\bigl(a+\sqrt{a(K+a)}\bigr)\|u\|_{H^1(Q)}.
 \tag{3}
\]
Set \(N=\partial_t\) and postcompose both chiral operators with the
fixed isometry \(c_0(N)^{-1}\colon S_0^-\to S_0^+\).
The resulting \(L_0=\partial_t+A\) uses the tangential Dirac
operator with the increasing-\(t\) normal convention. Equation (3)
holds for \(\|L_h-L_0\|_{H^1\to L^2}\) with the same constant.
This is the comparison used in
[the matching formulation](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md).

## Conformal weights and the two ends

Let \(\Gamma\colon S_G^\pm\to S_h^\pm\) be the conformal spin
isometry from orthonormal frame scaling by \(\rho\). For a physical
spinor \(\psi\) pulled back to \(G\) set
\[
 U=\rho^{3/2}\Gamma\psi,\qquad u=\beta^{-1}U,\qquad
 \widetilde D_h^+u=\rho^{5/2}\beta^{-1}\Gamma D_G^+\psi .
 \tag{4}
\]
These are the ordinary Dirac weights with conformal factor
\(\Omega=\rho^{-1}\). The measures give
\(dV_h=\rho^{-4}dV_G\). Thus the volume \(L^2_h\) norms squared of
\(U\) and \(D_h U\) are respectively
\(\int_Q\rho^{-1}|\psi|_G^2dV_G\) and
\(\int_Q\rho|D_G\psi|_G^2dV_G\). Using reference \(L^2_0\) inserts
the bounded weight \(w^{-1}\) in these integrals.
[DIR, conformal spin identities](../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L343) · [Bourguignon–Gauduchon, equations (18) and (18′)](https://www.igt.uni-stuttgart.de/dokumente/schwahn/SpineursVariations_EN.pdf#page=17)

For a physical first-order norm corresponding to (3), take
\[
 \|\psi\|_{H^1_\rho(G)}^2
 =\int_Q\left(\rho^{-1}|\psi|_G^2+\rho|\nabla^G\psi|_G^2\right)dV_G .
\]
Under (4) it is equivalent to \(\|U\|_{H^1(h)}\). To see this, the
connection transported by the scalar frame map for \(h=e^{2f}G\) differs
from the \(G\) connection by the spin action of
\(Y\mapsto df(Y)X-G(X,Y)\operatorname{grad}_G f\) in direction \(X\).
For \(f=-\log\rho\), \(|df|_G\le C/\rho\). The derivative of
\(\rho^{3/2}\) gives a term of the same size before the change of
covector norm, and \(|\cdot|_h=\rho|\cdot|_G\) for covectors.
Combining these two bounds in either direction proves the claim.
The map \(\beta\) compares \(\|U\|_{H^1(h)}\) with \(\|u\|_{H^1(h_0)}\)
with constants bounded in terms of \(1+\varepsilon_D\). In the forward
direction use the slab estimate for \(U(X)\)'s spin action in (2).
In the reverse direction use \(|U|_h=|u|_0\) and the scalar Sobolev
inequality applied to \(|U|_h\) on each slab. The scalar inequality
is uniform by metric comparability, and
\(|d|U|_h|_h\le|\nabla^h U|_h\) gives the derivative bound.
All these equivalences are uniform in physical radius when
\(\varepsilon_D\) is bounded.

The left end \(t=t_-\) is the inner sphere at \(\rho_-\) with
reference outward normal \(-N\). The right end \(t=t_+\) is the outer
sphere at \(\rho_+\) with reference outward normal \(+N\).
Actual \(h\)-unit outward normals are
\[
 n_{h,\pm}=\pm H^{-1}N/\sqrt{h_0(N,H^{-1}N)},\qquad
 n_{G,\pm}=\rho_\pm^{-1}n_{h,\pm}.
\]
Under the symmetric frame comparison they correspond to
\(b^{-1}n_{h,\pm}=\pm bN/|bN|_0\). Thus actual and reference normals
agree up to \(O(a)\) after comparison, with both signs fixed.
Their identification is independent of the choice of
\(c_0(N)^{-1}\) as the common model target map in (3).

On each end the transported prescribed trace of a physical
spinor \(\tau_\pm\psi\) is
\[
 \tau_\pm u=\rho_\pm^{3/2} B_\pm\, \tau_\pm\psi,\qquad
 B_\pm=(\beta^{-1}\Gamma)|_{t=t_\pm} .
 \tag{5}
\]
The end area satisfies \(d\sigma_h=\rho_\pm^{-3}d\sigma_G\), so
\(\|\tau_\pm U\|_{L^2(d\sigma_h)}=\|\tau_\pm\psi\|_{L^2(d\sigma_G)}\).
For reference \(L^2(\gamma)\), the area density
\(d\sigma_h/d\sigma_0\) is uniformly equivalent to one. For
\(H^{1/2}\), use the fixed reference trace space of \(S_0^+\)
on each end, for example the norm
\(\|(1+A^2)^{1/4}v\|_{L^2(\gamma)}\). Equation (5) gives exactly
\(\|\tau_\pm u\|_{H^{1/2}_0}
=\rho_\pm^{3/2}\|B_\pm\tau_\pm\psi\|_{H^{1/2}_0}\).
The two joint trace maps have a uniform bound and bounded lift on
the product via fixed-width, disjoint end neighborhoods. In
physical variables the trace norm given by the infimum of
\(\|\psi\|_{H^1_\rho(G)}\) over extensions is equivalent to the
joint reference norm in (5), by the bulk norm equivalences.
This uses a scale-normalized norm. The reference area of a physical
round sphere scales by \(\rho_\pm^3\) and its tangential Dirac
eigenvalues by \(\rho_\pm^{-1}\), so an unscaled inhomogeneous
physical \(H^{1/2}\) norm has different spectral weights.
The ratio of the pointwise spin factors in (5) is \(e^{3L/2}\).
Its value is fixed for a fixed \(L\), independent of physical radius.

The comparison (3) acts on the full space and restricts to the
closed reference domain
\[
 X=\{u\in H^1(Q,S_0^+):P_+\tau_-u=0,\ P_-\tau_+u=0\},
\]
where the projections of \(A\) are bounded in the fixed
\(H^{1/2}\) norm. If a reference inverse
\(L_0^{-1}\colon L^2\to X\) with norm \(C_{\rm inv}\) is supplied,
the same domain gives a perturbed inverse when
\(C_{\rm inv} C\varepsilon_D<1\), by the norm bound on
\((L_h-L_0)L_0^{-1}\). The use of \(X\) selects fixed projections of
the reference sphere. Actual end spectral projections and the
trace ranges of adjoining core and cap solutions are further inputs.

## Scope on a degenerating sequence

For a sequence of supplied charts, \(a_i\to0\) and
\(a_i(K_i+a_i)\to0\) suffice for (1) to tend to zero. A uniform
\(K_i\) bound and \(a_i\to0\) give this implication. Finiteness of
\(K_i\) for each chart and \(a_i\to0\) alone do not force even the
slab derivative to vanish. For example, on one fixed buffered
annulus let \(v_j=j^{-1}\sin(jx_1)\delta\). Then \(a_j\to0\) and
\(K_j\) grows linearly in \(j\). In a fixed Cartesian box inside a
unit log slab the integral of \(\cos^4(jx_1)\) is bounded below
for large \(j\) by periodic averaging. Since
\(k_j=j^{-1}\sin(jx_1\circ\Phi)h_0\), its covariant derivative has
a slab \(L^4\) norm bounded below by the scale-cancelled integral on
that box. This tests only the implication from uniform closeness
for general supplied smooth metrics.

The first geometric input on the original degenerating sequence
is an actual embedded spherical annular chart with the supplied
buffers and a quantitative right-hand side in (1). The present
estimate conditions on this input. A comparison on the full
residual region requires compatible charts and their spin
transitions, and actual matching requires control of the two
weighted trace ranges and their normalizations. No Bach bound
enters (1)–(5).
