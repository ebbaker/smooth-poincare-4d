# SP4-CUT-SEAM-E20 · Terminal annuli of the saved short-axis profile

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI Codex assistance. The bounded GPT-6.2 Sol/ultra reader was requested. Actual serving model and effort unavailable. Working HEAD bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. [Frozen E20 r1](../research-progress/handoffs/E20_REQUEST_R1.md), SHA-256 0fbc196a240cf9649. The sole numerical input is the saved vector in [E13's script](../numerics/seam_relaxation.py), SHA-256 05380722ed46cbbf. [B06's annular dual](B06_SHORT_AXIS_OBSTRUCTIONS.md), SHA-256 7f21353bd43dbbc8, and [TUBE E19](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md), SHA-256 5333dc4d1816, fix the equations and normalization. The inherited input manifest and marking are as in E20 r1. The [replay](../numerics/terminal_annulus_test.py) runs two quadrature resolutions on the one profile.

**Result.** The saved profile's last eighth in the original arclength coordinate has \(E_+/\pi^2\approx1.87454\), above the full strict budget \(1.5\). The \(k\)-axial part accounts for \(1.83764\) and the annular dual estimate is \(1.81948\). These are floating diagnostics. The positive-square rewrite is an exact identity. A separate explicit box of inner axial jets, conformal volumes and transverse moments gives a rigorous \(E_+/\pi^2>31/20\) for a class of variable outer collars.

## Change of gauge and signed normal jets

Write the frozen E13 orbit lengths \((\ell_i,\ell_j,\ell_k)=(a,e^{-U},e^U)\), with original arclength \(s=Lx\). On a specified outer annulus let \(m=\ell_i\ell_j=a e^{-U}\) and divide the metric by \(m\). Then the new outward arclength is \(d\bar s=m^{-1/2}ds\). In cyclic order \((k,i,j)\) the new lengths are \((\sqrt y,e^{-u},e^u)\), where
\[
 y=\frac{e^{3U}}{a},\qquad
 u=-\tfrac12(\log a+U),\qquad
 dv=\sqrt y\,d\bar s=\frac{e^{2U}}a\,ds .
\]
The last formula defines the volume coordinate with \(v=0\) at the outer face and \(v=-l\) at the inner orbit. The cyclic permutation preserves the outward-first orientation. The orbit volume in this gauge is \(\pi^2\sqrt y/4\), so integrating each Weyl square uses \(\pi^2\,dv/4\). The chiral energy on the annulus is unchanged by the conformal rescaling.

For \(H_a=a_s/a\), \(H_U=U_s\), and \(v_s=e^{2U}/a\),
\[
 y_v=y\frac{3H_U-H_a}{v_s},
 \qquad u_v=-\frac{H_a+H_U}{2v_s}.
\]
At the original face \(a=3^{-1/4}\), \(U=\log(3)/4\), \(H_a=H_U=0\) exactly, so \(y=3,\ u=0,\ y_v=u_v=0\). This is the prescribed metric with \(k\) long. The short-axis switch remains the stated \(i,j\) isometry, and both signed first normal derivatives vanish on the matched face. At the inner orbit the outward normal of the annulus is \(-\partial_{\bar s}=-\sqrt y\,\partial_v\), whereas the outward normal of the core is \(+\sqrt y\,\partial_v\) in the same conformal gauge. In the original gauge those operators are \(-v_s\partial_v\) and \(+v_s\partial_v\). In particular \(B_l\) uses the \(v\) derivative with its outward-growing coordinate sign, not the annulus's inner outward unit normal. The logarithmic derivatives of the rescaled orbit lengths in order \((k,i,j)\) along \(+\partial_{\bar s}\) are \( (y_v/(2\sqrt y),-\sqrt y\,u_v,\sqrt y\,u_v)\), and along the opposite normal they all reverse. [Marked end and gluing](B04_PAIRED_FILLING.md) · [E13 parity and jets](E13_VARIATIONAL_TRIAL.md)

## Exact dual and square identities

Put \(z=y-1\), \(c=\cosh(2u)\), \(d=2\sinh(2u)\) and \(p=e^{2v}-e^{4v}\), and use primes for \(v\) derivatives. In the cyclic \((k,i,j)\) frame the smaller-block axial equation is
\[
 6\lambda_k^+=-(D^2+6D+8)z+8(c-1)+4d^2/y+4y(u')^2+12c',
 \qquad D=\partial_v .
\]
For example, the E19 formulas give \(3\lambda_k^+=-a_{k,\bar s\bar s}/a_k+4c-4a_k^2+2d^2/a_k^2+2u_{\bar s}^2-6a_{k,\bar s}+6(d/a_k)u_{\bar s}\) in this gauge. Substitution of \(a_k=\sqrt y\), \(a_{k,\bar s}=y'/2\), \(a_{k,\bar s\bar s}/a_k=y''/2\), and \(u_{\bar s}=\sqrt y u'\) yields the displayed equation.

Define
\[
 \begin{split}
 B_l&=[p z'+(6p-p')z]_{-l},\\
 J_l&=\int_{-l}^0 p\{8(c-1)+4d^2/y+4y(u')^2+12c'\}\,dv,\qquad
 I_l=\int_{-l}^0p^2\,dv .
 \end{split}
\]
The adjoint annihilates \(p\). Integration by parts gives \(6\int p\lambda_k^+ =-4+B_l+J_l\), where the \(-4\) uses \(p(0)=0,\ p'(0)=-2,\ z(0)=2,\ z'(0)=0\). With \(t=e^{-2l}\), the exact squared norm is \(I_l=1/24-t^2/4+t^3/3-t^4/8\). Tracelessness gives \(\lvert W^+\rvert_{\rm HS}^2\ge(3/2)(\lambda_k^+)^2\). Cauchy–Schwarz then gives
\[
 E_+(\mathrm{annulus})/\pi^2\ \ge\ \frac{(4-B_l-J_l)^2}{96 I_l}.
\]
Thus strict entry requires \(\lvert4-B_l-J_l\rvert<12\sqrt{I_l}\) on the particular annulus.

The term \(c'=d u'\) gives the positive-square identity
\[
 \begin{split}
 J_l &=-4p(-l)\bigl(c(-l)-1\bigr)+J_l^{\rm pos},\\
 J_l^{\rm pos}&=\int_{-l}^0
 \left[4p\left(\sqrt y\,u'+\frac{d}{\sqrt y}\right)^2
       +8e^{4v}(c-1)\right]\,dv\ \ge0 .
 \end{split}
\]
Completing the square absorbs \(8c'\) and leaves \(4c'\). Integrating that term by parts leaves \(8p-4p'=8e^{4v}\) as the nonnegative potential, with zero upper endpoint contribution. Integrating the entire \(12c'\) instead gives the form in B06 with coefficient \(40e^{4v}-16e^{2v}\) and lower boundary term \(-12p(-l)(c(-l)-1)\). The latter representation can have a negative integrand and the original \(J_l\) can have either sign. Both signed derivative and boundary terms enter the estimates.

## Saved-profile diagnostics

For each indicated \(x_{\rm in}\), the replay uses 24 equal \(x\) cells and separately 8 and 16 Gauss nodes per cell. The inner arclength transform and all integral diagnostics agree at displayed precision. The positive-square form, the B06 first-derivative form and the raw \(J_l\) agree by the replay assertions. It also reproduces the analytic \(I_l\) and the integrated signed \(k\)-axial moment. Direct Cartan evaluation in the cyclic rescaled gauge gives the same integrated smaller block as the original E13 curvature in its own gauge. The rows are floating results.

| \(x_{\rm in}\) | \(l\) | \(y(-l)\) | \(u(-l)\) | \(y'(-l)\) | \(u'(-l)\) |
| ---: | ---: | ---: | ---: | ---: | ---: |
| \(1/2\) | 1.423507 | 1.629915 | -0.220377 | 0.146107 | 0.096631 |
| \(3/4\) | 0.823951 | 1.869782 | -0.113070 | 0.931257 | 0.220180 |
| \(13/16\) | 0.651375 | 2.053303 | -0.076291 | 1.203542 | 0.204263 |
| \(7/8\) | 0.460628 | 2.334858 | -0.040054 | 1.785084 | 0.170885 |

In the rescaled gauge the outward unit-normal pair \((\partial_\nu y,\partial_\nu u)\) at the inner orbit is approximately \((-0.186532,-0.123367)\), \((-1.273400,-0.301073)\), \((-1.724598,-0.292696)\), \((-2.727651,-0.261117)\) for the annulus in table order. The corresponding core normals give the positive pairs. At the outer matched face the two paired halves have the zero pair in their respective outward normals.

| \(x_{\rm in}\) | \(B_l\) | \(J_l\) | \(I_l\) | \(4-B_l-J_l\) | \(12\sqrt{I_l}\) |
| ---: | ---: | ---: | ---: | ---: | ---: |
| \(1/2\) | 0.149928 | 0.015411 | 0.040889 | 3.834661 | 2.426519 |
| \(3/4\) | 0.749871 | -0.003970 | 0.034612 | 3.254099 | 2.232505 |
| \(13/16\) | 1.227676 | 0.001263 | 0.029210 | 2.771061 | 2.050910 |
| \(7/8\) | 2.129967 | 0.003648 | 0.019943 | 1.866385 | 1.694625 |

| \(x_{\rm in}\) | \(4\int p(\sqrt y\,u'+d/\sqrt y)^2\) | \(8\int e^{4v}(c-1)\) | \(-4p(-l)(c(-l)-1)\) |
| ---: | ---: | ---: | ---: |
| \(1/2\) | 0.030847 | 0.006143 | -0.021580 |
| \(3/4\) | 0.009124 | 0.002870 | -0.015963 |
| \(13/16\) | 0.008903 | 0.001594 | -0.009233 |
| \(7/8\) | 0.006205 | 0.000520 | -0.003077 |

| \(x_{\rm in}\) | Dual bound | Actual \(k\)-axial part | Actual transverse part | Actual exterior \(E_+/\pi^2\) |
| ---: | ---: | ---: | ---: | ---: |
| \(1/2\) | 3.746087 | 3.771695 | 0.141647 | 3.913343 |
| \(3/4\) | 3.186896 | 3.208914 | 0.061011 | 3.269925 |
| \(13/16\) | 2.738356 | 2.758845 | 0.043732 | 2.802577 |
| \(7/8\) | 1.819476 | 1.837643 | 0.036892 | 1.874536 |

All named annuli exceed the full smaller-block budget in this evaluation. Less than \(0.045\pi^2\) of its total smaller block lies before \(x=1/2\). The last eighth has original arclength about \(0.21875\) and \(k\)-gauge arclength about \(0.27897\). It accounts for about \(47\%\) of the full cost, with about \(98\%\) of that last segment's energy in the \(k\)-axial part. For this segment, keeping the measured \(B_l\) and \(I_l\) would require \(J_l>4-B_l-12\sqrt{I_l}\approx0.175407\) even to pass the necessary dual test. Its measured \(J_l\) is only about \(0.003648\). Changes confined to the core cannot remove this terminal cost at the displayed exterior data. A different outer profile can also change the axial jet combination \(B_l\) or the normalized interval \(l\), and passing the resulting dual inequality leaves a separate full-block energy test.

## Exact exclusion for a box of variable collar data

Consider any smooth diagonal annulus in the \(k\)-distinguished gauge just described, with \(y>0\), terminal jets \(y(0)=3,\ y'(0)=u(0)=u'(0)=0\), and the following inner quantitative data:
\[
 \frac{39}{100}\le t\le\frac25,\qquad
 \frac{23}{10}\le y(-l)\le\frac{47}{20},\qquad
 \frac{17}{10}\le y'(-l)\le\frac95,\qquad
 -\frac1{20}\le J_l\le\frac1{20}.
\]
The conclusion also follows if the last condition is replaced by \(J_l^{\rm pos}\le1/20\), since \(p(-l)(c(-l)-1)\ge0\). The exact formula \(6p-p'=4t-2t^2\) at \(-l\), \(p\le1/4\), and monotonicity of \(4t-2t^2\) there give
\[
 B_l\le\frac14\frac95+\frac{32}{25}\frac{27}{20}
       =\frac{1089}{500},\qquad
 4-B_l-J_l\ge\frac{443}{250}.
\]
The function \(I_l\), expressed in \(t\), is decreasing since its derivative is \(-t(1-t)^2/2\). Therefore
\[
 I_l\le I(39/100)=\frac{49254877}{2400000000}<\frac{21}{1000},
 \qquad
 E_+(\mathrm{annulus})/\pi^2>
 \frac{(443/250)^2}{96(21/1000)}
 =\frac{196249}{126000}>\frac{31}{20}.
\]
In particular this excludes the required \(E_+/\pi^2<3/2\) for any filling containing such a collar, independent of the core and its Robin sign.

The box permits many smoothly varying profiles. For example choose \(t=79/200\), \(y(-l)=7/3\), \(y'(-l)=7/4\) and \(u=0\). With \(q=(v+l)/l\) the positive profile
\[
 y(v)=7/3+(3q^2-2q^3)(3-7/3)+(7l/4)q(1-q)^2
\]
has the required terminal and inner jets and \(J_l=0\). Perturbations of \(y,u\) supported in the annulus interior keep the exact jets. Small enough perturbations keep the scalar functional in the box, since its integrand depends continuously on \(y,u\) and their first derivatives and \(y\) remains positive. This exhibits an open family relative to the fixed terminal conditions. The saved \(x=7/8\) values fall within the box at their computed precision. Membership for that profile has no certified enclosure in this packet.

## Reproduction

Run from the repository root

    PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 VECLIB_MAXIMUM_THREADS=1 python3 papers/investigations-1/08_cut_geometry_and_chirality/02_seams_and_marked_cuts/numerics/terminal_annulus_test.py

The script reads the saved E13 coefficients, checks the terminal data and the two quadrature resolutions, and validates the rational box arithmetic with Fraction. The exact identities and the box proof are independent of the floating evidence. No optimization was run.
