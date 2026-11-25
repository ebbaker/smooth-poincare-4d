# E59b · Logarithmic selection and radial flux

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded execution MASTER-E59b v1 under NECK-B04/B05.
Actual serving model and reasoning effort are unavailable. Frozen commit
b5ce9f481a7604a411b9e1bde5383b2bc122fb5c. The radial TeX, E56c note and
E56–E58 assessment SHA-256 prefixes are ffdb821e81ecb21f,
2a0e895cdac9081b and 7747813c21b22b70. This is a conditional analytical
result. [Radial propositions](../manuscript/anchored_physical_shell.tex) ·
[E56c](E56_PHYSICAL_RADIAL_FLUX.md) · [E56c review](../reviews/E56_FLUX_CHECK.md) ·
[E56–E58 assessment](../../../../../master/research-progress/handoffs/E56_E58_RECOGNITION_GAP_20261125.md)

**Result.** Logarithmic selection under physical Bishop–Gromov comparison,
together with the associated one-sided Laplacian bound, gives an
intermediate scale with small full-curvature integral and small total
variation of the full radial defect on every fixed compact subwindow.
A supplied proper flat comparison with compact first-order source
embeddings then gives the spherical cut with both complete chiral marks,
with no volume-coverage premise. A Ricci lower bound confined to a
widening physical annulus also suffices for flux if one inner transition
volume is bounded at its fourth-order scale. Scalar volume ratios alone
give a two-volume criterion with different comparison and omission
hypotheses. The physical sequence supplies a lower volume floor. The
radial comparisons and compact embeddings remain supplementary.

## Physical source and finite selection

Use smooth unit-volume positive Yamabe minimizers \(g_i\) on a fixed
closed oriented smooth Riemannian nonstandard homotopy four-sphere
\(M\), with \(Y_i=R_{g_i}\ge y_0=\sqrt{48\delta}\),
\(4\pi^2\le e_i=E_+(g_i)\le8\pi^2-\delta\), and \(e_i\to I^+(M)\).
The chiral measure is \(|W^+_{g_i}|_{\rm HS}^2dV_{g_i}\) in the fixed
orientation. At fixed \(0<\theta<1/2\), let \(a_i=r_i(\theta)\),
\(b_i=r_i(1/2)\), \(a_i/b_i\to0\), and take \(x_i\) attaining the
smaller quantile. The complete marks are \(B_{g_i}(x_i,a_i)\), of mass
\(\theta e_i\), and \(M\setminus B_{g_i}(x_i,b_i)\), of mass at least
\(e_i/2\). The E53 source gives \(\operatorname{diam}(M,g_i)\le D\),
\(\operatorname{vol}_{g_i}B(p,u)\ge\nu u^4\) for \(0<u\le1\), and
\(\int_M|\mathrm{Rm}_{g_i}|_{\rm tens}^2dV_{g_i}\le\Lambda\).
[E53 source block](E53_PHYSICAL_SHELL.md#source-block-and-the-missing-transition-volume)

Let \(\Phi_i\) be nonincreasing on \([A_i,B_i]\) where
\(a_i\le A_i<B_i\le b_i\) and \(T_i=\log(B_i/A_i)\to\infty\).
Divide the middle half of the logarithmic interval into \(N_i\)
adjacent intervals of length \(2w_i=T_i/(2N_i)\). Summing the drops
\(D_i=\Phi_i(A_i)-\Phi_i(B_i)\) and full-curvature integrals selects
one interval, with exponential midpoint \(\rho_i\), such that
\[
 \int_{\{e^{-w_i}\rho_i<d_{g_i}(x_i,\cdot)<e^{w_i}\rho_i\}}
       |\mathrm{Rm}_{g_i}|_{\rm tens}^2dV_{g_i}
 +\operatorname{osc}_{[e^{-w_i}\rho_i,e^{w_i}\rho_i]}\Phi_i
 \le(\Lambda+D_i)/N_i .
\]
Distance spheres have zero four-volume, and
\(a_i/\rho_i,\rho_i/b_i\le e^{-T_i/4}\). For bounded \(D_i\) use
\(N_i=\lfloor\sqrt{T_i}\rfloor\) eventually. Then \(w_i\to\infty\)
and \(\rho_i\to0\). A scalar of bounded variation works with its
total variation replacing \(D_i\). For positive monotone \(\Phi_i\)
the same argument on \(\log\Phi_i\) gives a multiplicative
drop at most \(\exp((\Lambda+\log(1/v))/N_i)\) if \(v\le\Phi_i\le1\).

## Finite criterion for the full signed defect

Put \(h_i=\rho_i^{-2}g_i\), \(d_i=d_{h_i}(x_i,\cdot)\),
\(V_i(t)=\operatorname{vol}_{h_i}\{d_i<t\}\), and let \(\omega_4\)
be the Euclidean unit ball volume. Set
\(\mu_i=4dV_{h_i}-\Delta_{h_i}(d_i^2/2)\), with
\(\Delta=\operatorname{div}\nabla\). This is a signed Radon measure
locally away from \(x_i\), including the cut locus. Fix
\(0<a<a'<b'<b\) and \(\eta\in C_c^\infty((a,b))\) with
\(0\le\eta\le1\) and \(\eta=1\) on \([a',b']\).
Uniform and strong \(W^{1,2}\) approximation of the compactly
supported Lipschitz test \(\eta(d_i)\), the almost-everywhere
eikonal identity, and coarea give
\[
 \begin{aligned}
 \int\eta(d_i)\,d\mu_i
 &=\int_a^b(4\eta(t)+t\eta'(t))V_i'(t)\,dt\\
 &=-\int_a^b(5\eta'(t)+t\eta''(t))
        [V_i(t)-C_i-\omega_4 c_i t^4]\,dt .
 \end{aligned}
\]
Here \(C_i,c_i\) are arbitrary real constants. The constant disappears
on differentiation and the pure fourth power contributes the integral
of a multiple of \((t^4\eta)'\). With
\(\epsilon_i=\sup_{[a,b]}|V_i(t)-C_i-\omega_4c_it^4|\),
\[
 |\mu_i|(\{a'\le d_i\le b'\})
 \le \epsilon_i\int_a^b|5\eta'(t)+t\eta''(t)|\,dt
           +2\mu_i^-(\{a<d_i<b\}).
\]
The positive mass on the trim is at most the integral against
\(\eta(d_i)\) plus the weighted negative mass. Adding the negative
mass on the trim proves the claim. If \(C_i=0\) and \(c_i\) is any
value of \(V_i(t)/(\omega_4t^4)\) on the window, the first term can
be replaced by
\(\omega_4\operatorname{osc}_{[a,b]}(V_i/(\omega_4t^4))
\int_a^b |5\eta'+t\eta''|t^4dt\).
[Distributional Laplacian comparison and cut-locus sign, Mantegazza–Mascellani–Uraltsev, Theorem 2.10 and Corollary 2.11](https://msp.org/pjm/2014/270-1/pjm-v270-n1-p07-p.pdf)

## Centered physical Ricci comparison

A sufficient supplementary premise is
\(\operatorname{Ric}_{g_i}\ge-3K g_i\) on \(B_{g_i}(x_i,b_i)\) for
fixed \(K\ge0\). The pointwise lower bound on radial Ricci along
every minimizing ray before \(b_i\) suffices as well. Use \(A_i=a_i\),
\(B_i=\min(b_i,1)\), and
\[
 \Phi_i(t)=\frac{\operatorname{vol}_{g_i}B(x_i,t)}{v_K(t)},\qquad
 v_K(t)=4\omega_4\int_0^t\operatorname{sn}_K(u)^3du,
 \quad \operatorname{sn}_K(u)=\frac{\sinh(\sqrt K\,u)}{\sqrt K}.
\]
Take \(\operatorname{sn}_0(u)=u\). Polar Riccati comparison gives
a nonincreasing ratio at most one, using zero Jacobian after
each cut time. The physical small-ball lower bound gives a uniform
positive floor on this range. Scaling gives
\(v_{K\rho_i^2}(t)=\rho_i^{-4}v_K(\rho_i t)\). With
\(c_i=\Phi_i(\rho_i)\), on each fixed \([a,b]\),
\[
 V_i(t)=\omega_4c_it^4+O_{a,b}((\Lambda+1)/N_i+K\rho_i^2).
\]
The weak Laplacian comparison for the same radial distance is
\[
 \Delta_{h_i}(d_i^2/2)\le
 \left(1+3d_i
 \frac{\operatorname{sn}'_{K\rho_i^2}(d_i)}
      {\operatorname{sn}_{K\rho_i^2}(d_i)}\right)dV_{h_i}.
\]
The upper bound differs from four by \(O_{a,b}(K\rho_i^2)\)
on the fixed strip, and \(V_i(b)\) is bounded. The finite criterion
now gives \(|\mu_i|(\{a'\le d_i\le b'\})\to0\).
The positive volume ratio floor keeps the selected four-dimensional
volume profiles positive and gives the multiplicative estimate.
The absolute defect conclusion under this comparison still holds
without that floor.
[Centered Bishop–Gromov comparison, Petersen–Wei, §2](https://www.math.ucla.edu/~petersen/Papers/28.pdf)

### Protected comparison with an inner measured volume

The centered curvature premise can avoid the core. Suppose
\(a_i\le s_i\), \(s_i/b_i\to0\), \(\operatorname{Ric}_{g_i}\ge-3K g_i\)
on \(\{s_i<d_{g_i}(x_i,\cdot)<b_i\}\), and
\(\operatorname{vol}_{g_i}\{2s_i<d_{g_i}(x_i,\cdot)<4s_i\}\le C s_i^4\).
Along an uncut ray apply the mean curvature Riccati inequality
on its segment after \(s_i+\varepsilon\), comparing with the pole
model that starts there. Letting \(\varepsilon\downarrow0\) and
using the nonpositive singular cut term gives
\[
 \Delta d_{g_i}\le
 3\frac{\operatorname{sn}'_K(d_{g_i}-s_i)}
        {\operatorname{sn}_K(d_{g_i}-s_i)}\,dV_{g_i}
\]
on the protected annulus. Radial testing and coarea imply that the
physical coarea area divided by \(\operatorname{sn}_K(t-s_i)^3\)
is nonincreasing: writing \(A(t)\) for the area, the inequality is
\(DA\le 3(\operatorname{sn}'_K/\operatorname{sn}_K)(t-s_i)A\,dt\).
Its weighted average over \((2s_i,t)\) is therefore nonincreasing:
\[
 \Phi_i(t)=
 \frac{\operatorname{vol}_{g_i}\{2s_i<d_{g_i}(x_i,\cdot)<t\}}
      {v_K(t-s_i)-v_K(s_i)},\qquad 4s_i\le t\le b_i .
\]
Continuity defines the outer endpoint. The volume premise bounds
the ratio at \(4s_i\), and hence throughout. On
\([8s_i,\min(1,b_i)]\) it is also bounded below by a positive
constant. A minimizing geodesic reaching \(b_i\) has a point at
distance \(t/2\), and its radius-\(t/8\) ball is inside the numerator
shell. Use the Yamabe ball floor and the model upper volume bound.

Use the finite selection on \([8s_i,\min(1,b_i)]\). In particular
\(s_i/\rho_i\to0\). On every fixed normalized strip take
\(C_i=\rho_i^{-4}\operatorname{vol}_{g_i}B(x_i,2s_i)\) and
\(c_i=\Phi_i(\rho_i)\). Expanding the model volume gives
\(\epsilon_i=O_{a,b}((\Lambda+1)/N_i+s_i/\rho_i+K\rho_i^2)\),
with constants also depending on the transition volume bound.
The shifted Laplacian bound gives
\(\mu_i^-\le O_{a,b}(s_i/\rho_i+K\rho_i^2)dV_{h_i}\)
on the strip, whose normalized volume is bounded by the prefix
outside \(2s_i\) even if \(C_i\) is large. Thus the full defect
vanishes on each fixed inner trim. The required physical
transition bound is \(O(s_i^4)\). The absolute \(o(1)\)
transition volume from the full-curvature budget does not give
that rate.

## From full radial flux to the complete marks

Choose \(H=A_0=2\) and \(L>8\) meeting the two anchored-width
inequalities. Use the selected \(\rho_i\) or a subsequence.
Assume a nonempty connected oriented smooth flat four-manifold
\((U,h)\) without boundary and a proper continuous
\(r:U\to(1/16,2L)\). For every compact subset require one oriented
smooth embedding \(F_i\) of a neighborhood into \(M\) for all
large \(i\), with \(F_i^*h_i\to h\) locally in
\(C^0\cap W^{1,4}\) and \(d_i\circ F_i\to r\) locally uniformly.
In particular one embedding must cover a full buffered compact
radial strip around \([1/8,L]\). The all-source defect bound
controls every transported compactly supported test irrespective
of the omitted volume.

The pullbacks of \(d_i^2/2\) converge locally uniformly and weakly
in \(W^{1,2}\), by local uniform ellipticity. The defect test
gives \(\Delta_h(r^2/2)=4\). Flat interior regularity makes \(r\)
smooth. Short final minimizing segments from \(x_i\) stay in
buffered charts by a uniform first-exit length bound. Their
limits calibrate \(r\), so \(|dr|_h=1\). With \(f=r^2/2\),
Bochner gives \(|\nabla_h^2 f|^2=\Delta_h f=4\), hence
\(\nabla_h^2f=h\) by equality in the trace bound. The radial
flow exists across each compact strip by properness and gives
the flat cone over a compact connected unit round link
\(S^3/\Gamma\), with \(\Gamma\subset\mathrm{SO}(4)\) finite and free.
The single buffered comparison covers the quotient shell inside
the physical low-curvature block. Equivariant straightening
and a conformal multiplier give the exact quotient product at
\(o(1)\) chiral cost. The closed-source quotient obstruction
below \(9\pi^2\) makes \(\Gamma\) trivial.

The original physical chart has ellipticity \(H=2\) and anchor
\(d_{g_i}(x_i,S_i(1))\le2\rho_i\). The anchored-width argument
places the entire smaller ball and median exterior on opposite
sides and off the closed \(1/4\le |z|\le4\) trim. Apply the
first-order splice using \(C^0\cap W^{1,4}\) convergence and
small full curvature. This alternative does not require a
differentiated coordinate-tension estimate. The per-side \(E_+\)
cap upper allowances are \(o(1)\), so the retained positivity
threshold is \(8\pi^2\) and the minimizing excess plus either
allowance is smaller than the discarded charge lower bound
\(4\pi^2\theta\) at late indices. The inherited nonsplitting
contradiction follows. All pre-splice quantities use the
original metric or its constant rescaling, with the fixed
orientation. A conformal positive Ricci gauge by itself
requires transfer of distances, densities and first-order
metric coefficients.
[Anchored radial and cap proofs](../manuscript/anchored_physical_shell.tex) ·
[Quotient link check](E08_QUOTIENT_LINK_TEST_20261125.md)

## Scalar saturation and the lower floor

If only scalar full-volume saturation is available, let
\(t_0<t_1<t_2\) buffer \([1/8,L]\) in a proper *unshifted*
comparison range \((0,\beta)\). Use one embedding \(F_i\) on a
neighborhood of a compact comparison strip whose open interior
\(V\) contains \(r^{-1}([t_0,t_2])\). On each measured interval
the unshifted image-shell value is
\(4(V_i(v)-V_i(u))/(v^4-u^4)-\mathcal O_i(u,v)\), where
\[
 \mathcal O_i(u,v)=
 \frac{4\,\operatorname{vol}_{h_i}
       (\{u<d_i<v\}\setminus F_i(V))}{v^4-u^4}.
\]
Full-shell saturation thus suffices for E56 unshifted image
equality if \(\mathcal O_i(t_0,t_1)-\mathcal O_i(t_1,t_2)\to0\)
and the common limiting image value is positive. Separate
vanishing of both omissions suffices with a full-volume ratio
floor. At a fixed lower endpoint \(\alpha>0\), E56 calibration
controls \((r-\alpha)^2/2\) and the denominators are
\((v-\alpha)^4-(u-\alpha)^4\). Even an exact Euclidean
unshifted cone has strictly decreasing shifted area density
\(4\omega_4(t/(t-\alpha))^3\), so the unshifted scalar saturation
cannot directly give shifted equality. Without a bound on the
negative defect or the above image test, signed radial averages
could conceal cancellation within a level.
[Exact shifted difference and source omission](../reviews/E56_FLUX_CHECK.md)

Additive drops of a monotone ratio in \([0,1]\) always permit
selection. Positivity follows from a floor or independently
from a supplied nonempty four-dimensional \(C^0\) comparison
at the selected scale. For relative selection without a fixed
floor it suffices that the total logarithmic drop is \(o(T_i)\).
Choose \(N_i\to\infty\) with that drop \(o(N_i)\) and
\(N_i=o(T_i)\). Without such a drop condition consider complete
flat \(\mathbb R^3\times(\mathbb R/\ell_i\mathbb Z)\) with
\(\ell_i/A_i\to0\) and \(A_i/B_i\to0\). Centered ball volumes
throughout the range are
\[
 \int_{-\ell_i/2}^{\ell_i/2}\omega_3(t^2-u^2)^{3/2}\,du
 =\omega_3\ell_i t^3(1+O((\ell_i/t)^2)).
\]
At any fixed multiplicative factor \(\lambda>1\), the quotient
of the Euclidean normalized ratios at \(\lambda t\) and \(t\)
tends uniformly to \(\lambda^{-1}\) where both radii are in
range. Absolute ratios and fixed-window defects can vanish in
collapse. This example satisfies zero Ricci and zero full
curvature. Its source has neither the physical Yamabe lower
floor nor the prescribed complete chiral marks.

The physical critical \(L^2\) curvature integral supplies
neither of the pointwise radial comparison premises. The
protected integral comparison in the frozen manuscript requires
supercritical Ricci on each protected ball and does not supply
a centered negative-defect estimate through an omitted core.
Even protected flat charts around each point leave the compact
source embedding and radial alignment to establish. The
argument discharges radial saturation after the comparison
inputs are supplied and leaves their extraction from the
separated Yamabe sequence open.
