# Independent check of the paired conformal flux

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Exact serving model and reasoning effort are
unavailable. Working checkout `6879850c01a741618210815be0cc8041abe45a94`.
This checks the indicated analytic identities and conditional residual
implication, including the scope of the examples.

| Input reviewed | SHA-256 |
| --- | --- |
| [NECK-E18, positive Schouten flux](../../../01_sections_and_connections/01_neck_geometry/notes/E18_POSITIVE_SCHOUTEN_BOUNDARY_FLUX_20261125.md) | `10b3bbb7fb7a687950675bd25af4ecdc7c748587c3fcaee8a8a23b4e319b6c13` |
| [MATCH-E13, charge distribution](../notes/E13_CHARGE_DISTRIBUTION_AND_SPIN_TRACES_20261125.md) | `babce477d9d28898bbaae9dcfad3f18ad44301b691e748c70f8a93e858baa151` |
| [EXTRACT-E07, conformal current](../../../01_sections_and_connections/02_dirac_collar_extraction/notes/E07_CONFORMAL_BOUNDARY_CURRENT_20261125.md) | `5a4d7b0fe8d984c1c94ec32b9e272afed31dfda74e7c1b25850d50e9e4af13d1` |
| [EXTRACT-E06, physical ends](../../../01_sections_and_connections/02_dirac_collar_extraction/notes/E06_PHYSICAL_END_FRAMES_20261125.md) | `53b017973c05f734f27a86173558c14336313d8a7d5cfdebd18a05a072257935` |
| [MATCH-E12, chiral normalization](../notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md) | `e7091dcdca7ce190169a1b670a31e2c5145b3395d91c7ca165aace6b309320ce` |

## Conformal current and radial signs

For the normalized Schouten \(A=(\operatorname{Ric}-s g/6)/2\),
the trace and squared norm of its endomorphism are \(s/6\) and
\(s^2/144+|\operatorname{Ric}_0|^2/4\). Therefore
\[
 2\sigma_2(A)=s^2/48-|\operatorname{Ric}_0|^2/4,
 \qquad T_1(A)=(\operatorname{tr}_g A)g-A=sg/4-\operatorname{Ric}/2 .
\]
Identify \(I_\pm(g;U)=E_\pm(U)+2\int_U\sigma_2(A_g)dV_g\) as the
real chiral charges, and put \(P=8\pi^2\). For \(g_t=e^{2tu}g\),
the infinitesimal Schouten change is \(-\nabla_{g_t}^2u\), with a
further \(-2u g_t^{-1}A_{g_t}\) in the endomorphism derivative.
The latter term gives \(-4u\sigma_2\), canceled by the volume
derivative. The contracted Bianchi identity gives
\(\operatorname{div}T_1=0\). Thus the signed outward Newton flux
\(J=\int_0^1\int_{\partial U}T_1(A_{g_t})(\nabla^{g_t}u,\nu_t)
dS_{g_t}dt\) satisfies
\[
 I_\pm(h;U)=I_\pm(g;U)-2J,\qquad h=e^{2u}g .                     \tag{1}
\]
This matches the sign of the calculation in Gursky–Streets after
changing their \(e^{-2u}\) convention. It uses no cone condition
along the conformal path.
[Gursky–Streets, §2.1, (2-3)–(2-5) and Lemma 2.1](https://msp.org/gt/2018/22-6/gt-v22-n6-p08-p.pdf#page=8)

The physical boundary formula also checks. The normal, gradient
and area rescaling factors cancel. In the covariant Newton tensor,
the integrated coefficients of \(\nabla^2u\) and
\(du\otimes du-|du|^2g/2\) are respectively \(-1/2\) and \(1/3\).
The latter contraction is \(-|\nabla u|^2u_\nu/2\) after multiplying
by \(1/3\). In the boundary Hessian term the pure second-normal
derivative cancels. With \(a=u_\nu\), \(v=\nabla_\Sigma u\),
\(II(X,Y)=g(\nabla_X\nu,Y)\), and \(H=\operatorname{tr}II\), the
integrated Hessian contribution is
\(-\int_\Sigma(a\Delta_\Sigma u+II(v,v)/2+Ha^2/2)dS_g\).
The critical mixed norms in EXTRACT-E07 (7) bound these terms in
the stated physical gauge. Opposite outward normals on faces of
one strip give a difference of forward currents. Constant offsets
of \(u\) on different faces never enter the formula.

For \(e^{2w}(dt^2+g_{S^3(1)})\) and \(p=w'\), the two Schouten
eigenvalues in the rescaled basis are \(e^{-2w}[-(1-p^2)/2-p']\)
in the radial direction, and \(e^{-2w}(1-p^2)/2\) of multiplicity
three. Multiplying the resulting \(2\sigma_2\) by the volume
density gives \(-3(1-p^2)p' dt\,dV_{S^3}\). The primitive with value
zero at \(p=1\) is \(2\pi^2(p^3-3p+2)\), which gives \(4\pi^2\)
at \(p=0\) and \(P\) at \(p=-1\). In the strict chamber one has
\(|p|<1\) and \(p'<0\). The doubled \(\cosh\) profile in NECK-E18
has the correct smooth pole expansions in \(e^{2t}\) and \(e^{-2t}\),
and its interior slopes both tend to zero. This verifies the
example of a small oriented sum with non-small individual terms.

## Framed charge, modular representatives and paired branches

The fundamental anti-Hermitian trace convention is
\(I_\pm=\sigma_\pm(Pk_\pm+C_\pm)\), with \(\sigma_+=-1\),
\(\sigma_-=+1\), and outward oriented CS sum \(C_\pm\).
The conformal bundle isometry preserves the relative integers
in the transported frames, so (1) gives
\(C_+(h)-C_+(g)=2J\) and \(C_-(h)-C_-(g)=-2J\).
Thus the sum of the two integrals in the fundamental trace convention,
\(C_++C_-\) is conformally invariant in these paired frames.
For independent frame choices it is invariant modulo \(P\).
For each chirality the modular distance satisfies
\(d_P(C_\pm(h))\le d_P(C_\pm(g))+2d_{P/2}(J)\).

For a finite partition in the physical Yamabe metric, take the
nearest real error representatives \(\varepsilon_{j,\pm}\),
with \(|\varepsilon_{j,\pm}|\le\epsilon\), and the corresponding
integers \(n_{j,\pm}\) as in MATCH-E13. Since the lower physical
charge bound on each piece is \(-P+\delta\), all these integers
are nonnegative for \(\epsilon<\delta\). The closed charge is \(P\)
in each chirality, so \(k\epsilon<P\) forces each integer sum to
equal one. The local chiral charge difference is the Weyl energy
difference, of magnitude at most \(P-\delta\). Since opposite
integer values would give magnitude at least \(P-2\epsilon\),
\(2\epsilon<\delta\) aligns the integers on each piece. The unique
jointly charged piece has physical volume at least
\((\delta-\epsilon)/P\) by \(s^2/48\le P\). These are nearest-
representative integers. An arbitrary change of boundary frames
can shift the raw relative framed Chern numbers. None of the
integer distribution constrains the smooth type of the piece.

In a representative with \(\sigma_2>0\), the total \(I_\pm(M)=P\)
and nonnegative masses give \(d_\pm=\min(I_\pm(h;U),I_\pm(h;U^c))\).
If \(d_++d_-<\delta\), the
nearest branches are on the same side, because opposite branches
would give \(|I_+(h;U)-I_-(h;U)|\ge P-d_+-d_->E\).
If the complement has either chiral energy bounded below by
\(\eta>0\), then \(d_++d_-<\min(\delta,\eta)\) selects \(U\) in
both chiralities and bounds \(E_+(U)+E_-(U)\le d_++d_-\).
On the EXTRACT-E06 residual one already has
\(E_+(U)-E_-(U)=I_+(g;U)-I_-(g;U)=o(1)\). In that case one target
modular-smallness condition and its complementary lower bound
suffice for both chiral Weyl energies.

## Physical-to-positive comparison and limit scope

Both physical charges are \(o(1)\) in the EXTRACT-E06 order of
limits when the actual smooth physical exterior comparison, the full
inner AE truncation and all their frames are supplied. Suppose
\(\sigma_2(A_h)\ge0\) on \(U\). Equation (1) yields
\[
 2J_-\ge\max_{\pm}\bigl(E_\pm(U)-I_\pm(g;U)\bigr)_+,
 \qquad J_-:=\max(-J,0).
\]
In particular if \(J_-\to0\), both chiral energies vanish, and a
positive chiral residual forces a negative flux of at least half
its energy up to \(o(1)\). For a unit-volume Yamabe metric,
\(J_+\le s_g^2\operatorname{Vol}_g(U)/96=o(1)\) under the same
comparison. Thus only the negative part needs a new estimate;
after it vanishes, the full signed current tends to zero.
If \(h\) is selected with the NECK-E14 relation
\(\sigma_2(A_h)=\lambda+\alpha|W_h|_{\mathrm{tens}}^2/16\)
for \(\lambda,\alpha>0\), summing both chiral charges also gives
\[
 (1+\alpha)(E_+(U)+E_-(U))+4\lambda\operatorname{Vol}_h(U)
 \le I_+(g;U)+I_-(g;U)+4J_- .
\]
The extra conclusion uses that specific selected representative.
[NECK-E14, modified constant Schouten equation](../../../01_sections_and_connections/01_neck_geometry/notes/E14_POSITIVE_RICCI_GAUGE_20261125.md#existence-and-normalization)

The EXTRACT-E07 round dilation test checks that physical CS
smallness, bounded global curvature and a positive constant target
Schouten square can coexist with a negative order-one flux through
the chosen physical residual. The model is in the zero Weyl class,
outside the stated positive lower band. It rules out a transfer
based solely on those global bounds. A positive-band end estimate
could still use additional structure of its metrics or gauges.
The required analytic input is a quantitative signed boundary
comparison for the actual target and residual, or another way to
place the positive charges on their small branch. Neither the
integer distribution nor long collar length supplies it.
