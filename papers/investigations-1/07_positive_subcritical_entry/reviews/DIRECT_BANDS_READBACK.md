# Independent analytical reading of the native direct bands

26 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance.
SP4-PSE-E03, bounded analytical review at intake HEAD `1c81a3048c8c`.
The selected lead was GPT-6.2 Astra/ultra. Actual serving model and effort for
this reading were unavailable. Checked working inputs were the [closed sign
test](../notes/DIRECT_CLOSED_SIGN.md) `75e96e12d90e`, [thin sign
test](../notes/THIN_DIRECT_SIGN.md) `4721e2a7789dc`, and [thin Weyl
estimate](../notes/DIRECT_WIDTH_WEYL.md) `c1063b1ee987`, using the [original
issue](../research-progress/handoffs/DIRECT_EQUATOR_ISSUE_20261126.md)
`cbcd73ce04b1`, [long-cuff issue](../research-progress/handoffs/DIRECT_SECOND_ISSUE_20261126.md)
`f78cde4f6651`, [marked assembly](../notes/MARKED_CONNECTION_ASSEMBLY.md)
`59c3993e018e`, and [complete exterior](../notes/FUNNEL_EXTERIOR.md)
`0cc56c281145`. The review concerns the smooth oriented Riemannian metric
on the closed marked homotopy four-sphere and the indicated one-parameter
family on each band.

**Verdict.** The coupled quadratic form gives the exact closed Yamabe sign
test. The compactly supported Rayleigh witness and the positive chiral Weyl
coefficients both survive independent calculation. For each fixed marked
pants metric, sufficiently thin direct transitions have negative closed
Yamabe sign and exceed the strict Weyl budget. At the original changing
layer width \(1/16\), the four-dimensional sign and the actual energies
remain unmeasured. The retained equator excludes joint entry for the
length-one pants and passes its own necessary sign test for the selected
long-cuff pants. [Short cuffs](../notes/EQUATOR_FORM.md) · [Long cuffs](../notes/LONG_CUFF_SEAM.md)

## Fixed-width sign test

With \(\Delta=\operatorname{div}\nabla\), write
\(Q_A(f)=\int_A(6|df|^2+Rf^2)\). The sign of the closed first eigenvalue
equals the Yamabe sign. In the positive case, the first eigenvalue bounds the
\(L^2\) norm and bounded scalar curvature then gives \(H^1\) coercivity.
The four-dimensional Sobolev inequality gives positivity with the \(L^4\)
denominator. In the two nonpositive cases the first eigenfunction supplies
the sign test. The actual cap and exterior face measures match because the
germs are glued in the given marking. Piecewise \(H^1\) functions with those
matching traces are global \(H^1\) functions.

* For a band with negative first Dirichlet eigenvalue, zero extension gives
  a negative global test. At Dirichlet eigenvalue zero, use the positive
  zero-trace eigenfunction \(\psi\) and its zero extension. The boundary
  point lemma gives \(\partial_\nu\psi<0\) with the outward band normal.
  For sign-changing scalar potential, take \(c\ge\max(0,\sup R/6)\) so
  \((-\Delta+c)\psi\ge0\). Green's identity gives
  \(Q_M(\psi,1)=6\int_{\partial U}\partial_\nu\psi<0\). A small positive
  constant perturbation makes the closed form strictly negative.
* The scalar-flat caps are Dirichlet-positive. Setting
  \(a=|m|\) and \(z=\sinh^2(t/2)\) in the cap radial equation gives
  \(z(1+z)P''+(a+1+2z)P'-\ell(\ell+1)P=0\) after dividing out
  \(\tanh^a(t/2)\). Equating coefficients gives the stated finite polynomial
  recurrence, and \(\partial_t\log\tanh(t/2)=1/\sinh t\) gives the normal
  multipliers. The constant mode is the only zero. The checks
  \(\nu_{m0}=|m|/\sinh1\) and \(\nu_{0,1}=\tanh1\) use the actual cap
  measure \(dA=\sinh1\,d\theta\,d\omega\).
* The compactified exterior is connected, has \(R\ge0\), and has \(R>0\)
  on the end cores and nearby tails. Compactness and the positive potential
  control constants, so \(Q_E\) is coercive on all of \(H^1(E)\), and the
  exterior response strictly controls the pair of outer traces in \(L^2\).
  For \(g_E=u^2g_0\), a truncated exterior calculation gives
  \(Q_E(f)=6\int|d(uf)|_{g_0}^2-6\int_{\partial}uf^2\partial_{\nu_0}u\,dA_0\).
  The tube term is zero and each distant cut term is \(O(e^{-r})\). For
  \(v=uf\), the variable \(\tau=\int_0^r\operatorname{sech} t\,dt\) gives
  the modal potential \(m^2/a_0^2+\ell(\ell+1)\sec^2\tau\), with
  \(a_0=L/(2\pi)\). The core-regular branch is proportional to
  \((\pi/2-\tau)^{\ell+1}\) times an even analytic factor. The outward
  derivative at the cuff is \(-V'(0)\). For the constant spherical mode it
  is \(2/\pi\) at \(m=0\) and \(\kappa\coth(\kappa\pi/2)\) otherwise,
  with \(\kappa=|m|/a_0\). The three responses enter the compact core form
  with a plus sign and overall factor six. [Lee–Parker, (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=7)
* When both bands are Dirichlet-positive, Green's identity at each piece
  gives the boundary energy \(6\langle T,\mathcal N_A T\rangle\) plus a
  positive zero-trace remainder. The band maps couple their two faces and
  the exterior map couples its two outlets. The infimum of the resulting
  coupled boundary form over unit total \(L^2\) traces has the same sign as
  the closed first eigenvalue. It is bounded below using the ground-state
  substitution by the harmonic function of boundary trace one on each
  piece. That function is positive by testing its negative part using
  Dirichlet positivity, followed by the strong maximum principle. The
  closed negative and zero eigenfunctions have nonzero traces because every
  piece is Dirichlet-positive. In the closed positive case, \(H^1\) coercivity
  of the harmonically extended function gives the positive trace lower
  bound. In the closed zero case the trace kernel imposes cancellation of
  outward derivatives at every interface.

## Scalar singular term and its finite-width bound

Write \(n=N^{-1}(\partial_s-\beta)\),
\(B=(\partial_s h-\mathcal L_\beta h)/(2N)\), and \(k=\operatorname{tr}_h B\).
With positive sectional curvature on the round sphere, the acceleration is
\(-\nabla_h\log N\), whose ambient divergence is \(-\Delta_hN/N\).
The normal Ricci identity and scalar Gauss equation give
\(R_g=R_h-|B|^2-k^2-2n(k)-2\Delta_hN/N\). Since
\(\operatorname{div}_g n=k\), integration produces the endpoint term
\(2\int_{s=0}kf^2-2\int_{s=1/8}kf^2\) with physical face measures.
The remaining normal part is \(6(nf+kf/3)^2-|B^\circ|^2f^2\).

The test \(f=\chi J^{-1/3}\), with \(dV_h=J\,d\mu\) for a fixed slice
density, has zero endpoint term. Tracing the second fundamental form gives
\((\partial_s-\beta)\log J=Nk+\operatorname{div}_\mu\beta\). Thus
\(nf+kf/3=J^{-1/3}(\chi'-\chi\operatorname{div}_\mu\beta/3)/N\).
Every coefficient in this expression and in the tangential terms ranges
over a smooth compact family with \(N>0\). All rapid derivatives reside in
\(B^\circ=a_\varepsilon'P+S\), with
\(P=(\partial_a h)^\circ_h/(2N)\) and \(S\) using the fixed-\(a\)
derivative. With \(\chi=1\) on the layer, the negative leading coefficient is
\[
 F_i=\int_0^1 (H'(x))^2\int_Y |P(s_*,H(x),y)|_h^2
     N J^{1/3}(s_*,H(x),y)\,d\mu(y)\,dx>0 .
\]
In fact \(Q_M(f)=-F_i/\varepsilon+O(1)\). The cross term is bounded by
\(\int|a_\varepsilon'|=1\), and smooth explicit \(s\)-dependence gives an
\(O(\varepsilon)\) integrand difference inside the leading layer integral.
The estimate \(Q_M(f)\le C-AD/(2\varepsilon)\) in the thin sign note also
follows from \(|a_\varepsilon'P+S|^2\ge |a_\varepsilon'P|^2/2-|S|^2\).
Its \(D\ge1\) follows from Cauchy–Schwarz and the endpoint change one.
The cutoff contains the layer for \(0<\varepsilon\le2\rho=1/64\), and the
proposed choice \(\min\{\rho,AD/[2(C+1)]\}\) gives a witness of numerator
at most \(-1\). The test extends by zero smoothly across both faces. It
works with either band compressed and is independent of the other band's
transition width. The compact coefficient estimates depend on the marked
representative and do not give an assessed numerical transition width.

## Electric tensor, marked mismatch and energy normalization

For \(s=s_*+\varepsilon(x-1/2)\), a tangential coordinate dilation of
factor \(\varepsilon\), followed by the homothety \(\varepsilon^{-2}\), gives
the frozen coefficients at \((s_*,H(x),y_0)\) with uniform \(O(\varepsilon)\)
two-jet error at each tangential base point \(y_0\). A derivative in a dilated
tangential coordinate or a derivative on the explicit \(s\)-dependence
supplies a factor \(\varepsilon\). The full tensor determines the frozen
lapse via the Schur complement, \(N^2=g_{ss}-g_{sa}h^{ab}g_{bs}\). Translating
the tangential coordinates by \(\int_0^x\beta\) and putting \(d\tau=N\,dx\)
gives \(d\tau^2+h(\tau)\) without changing orientation.

For \(L=h^{-1}\dot h/2\), direct contraction gives
\(h^{-1}R_{0\cdot0\cdot}=-\dot L-L^2\) and
\(h^{-1}\operatorname{Ric}|_{TY}=-\dot L-kL\), where \(k=\operatorname{tr}L\).
Taking the trace-free part of the Schouten subtraction gives
\[
 \mathcal W=(-\tfrac12\dot L-L^2+\tfrac12kL)^\circ
 =-\tfrac12(\dot S+(k/3)S+2(S^2)^\circ),\qquad S=L-(k/3)I.
\]
For \(h=h_c+aD\), set \(A=h^{-1}D\). Then \(L=\dot a A/2\) and
\(\dot A=-\dot a A^2\). The two \(A^2\) terms cancel, leaving
\(\mathcal W=(-\ddot a/4+(\operatorname{tr}A)\dot a^2/8)A^\circ\).
The derivatives are \(\dot a=H'/N\) and
\(\ddot a=H''/N^2-H'\partial_xN/N^3\). As a second positivity check,
\(\dot J/J=(\operatorname{tr}A)\dot a/2\) rewrites the scalar factor as
\(-\tfrac14 J\,\tfrac{d}{d\tau}(\dot a/J)\). Since \(a\) changes by one
and \(\dot a=0\) at the endpoints, that factor is nonzero somewhere.

For either marked tube and any longitude take \(p=(1,0,0)\) in the tube
sphere and the unit round tangent \(V=\partial_w\). The transverse
squared-length ratio of exterior to cap is \(\delta^2r^2\), with
\(\delta=1/16\) and \(r=1+s\). The exterior longitude squared length is
\(|c_i'(\theta/(2\pi))/(2\pi)|_q^2+3/4\ge3/4\). Proportionality would force
that length to be \(\delta^2r^2\sinh^2 r<1/4\). This works at a pause of the
projected relator because the latitude is \(\pi/3\) or \(2\pi/3\) and the
ambient azimuth advances with \(\theta\). The mismatch is measured in the
same physical marking for both metrics. It gives \(A^\circ\ne0\) at the
selected point for each \(a\). By continuity the electric integrand is
positive on a set of positive measure on each band, and the same comparison
gives \(F_i>0\) in the scalar estimate.

The mixed components \(W_{0abc}\) vanish for the frozen family. In the
orthonormal two-form basis given by the normal forms and their Hodge duals,
the two diagonal blocks of the Weyl operator are both \(\mathcal W\). Thus
the \(\Lambda^\pm\) orthonormal bases, with factors \(1/\sqrt2\), each give
squared operator norm \(\operatorname{tr}(\mathcal W^2)\). The homothety
contributes \(\varepsilon^4\) to the rescaled squared norm, and the
original volume is \(\varepsilon NJ\,dx\,d\mu\). The two exact end metrics
are Weyl-flat, so
\[
 \varepsilon^3 E_\pm^{\rm HS}(g_\varepsilon;U_i)
 = C_i+O(\varepsilon),\qquad
 C_i=\int_Y\int_0^1\operatorname{tr}(\mathcal W^2) NJ\,dx\,d\mu>0,
\]
with the coefficients in \(C_i\) evaluated at \((s_*,H(x),y)\). Leading
coefficients agree across chiralities on each separate band. Exact equality
of the two closed integrals follows from signature zero.

In the fully contracted \((0,4)\)-tensor squared norm, the sum includes both
orders of each antisymmetric pair, so
\(E_\pm^{\rm tens}=4E_\pm^{\rm HS}\) and its leading coefficient is \(4C_i\).
In the Hilbert–Schmidt convention the strict budget is \(8\pi^2\) per sign
or \(16\pi^2\) for the sum. In the fully contracted tensor convention the
same budget is \(32\pi^2\) per sign or \(64\pi^2\) for the sum.
[Chang–Gursky–Yang, (0.2) and the signature formula, pp. 710, 712](https://arxiv.org/pdf/math/0409583#page=2)

## Integration details

Use **band length** \(1/8\) and **changing layer width** \(1/16\) for the
original profile. At \(\varepsilon=1/16\), the prescribed
\(H((s-3/32)/\varepsilon+1/2)\) is exactly \(H(16s-1)\). The outer face at
\(s=1/8\) has all exact exterior jets because \(H\) is flat at its endpoint.
The narrower construction gives open end germs. Both give smooth gluing.
For the long-cuff follow-up, use \(a_0=L/(2\pi)\) with
\(L=2\operatorname{arcosh}5\) in the exterior response. The cap, band and
trace formulas apply with that same fixed marked \(q\). The thin estimates
hold separately for each fixed smooth marked representative and supply no
uniform cutoff or remainder over all markings. A finite-width conclusion
for the long-cuff trial requires estimates on the actual marked band and
core coefficients. [Fixed-width sign](../notes/DIRECT_CLOSED_SIGN.md) · [Long-cuff selection](../research-progress/handoffs/DIRECT_SECOND_ISSUE_20261126.md)
