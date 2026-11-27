# GEO-E16 · Chirality forced by the negative Berger datum

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Helper settings requested in [revision 1][issue] were GPT-6.2
Sol/ultra. Actual serving model and reasoning effort were unavailable.
Input checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`, with the working
[E06 germ][germ], [angular comparison][area], [LED eta variation][eta],
[orientation replay][ledger], and [LED source replay][source]. Evidence is
an exact boundary calculation for smooth Riemannian metrics, with a check
of the primary signature theorem.

For the E06 orientation specified below, the signed Weyl energies of the
two caps are \(-75\pi^2\) and \(+75\pi^2\). Each cap spends at least
\(75\pi^2\) in its required chirality. A smooth closed metric on a homotopy
four-sphere containing the marked datum has \(e>75\pi^2\), which excludes
the entering band \(e<8\pi^2\).

## Datum and orientation

Write \(X_i\) for the E06 round left-invariant frame with
\([X_i,X_j]=2X_k\) cyclically, and \(\sigma_i\) for its dual. Choose
\(\sigma_1\wedge\sigma_2\wedge\sigma_3>0\) on the marked orbit and orient
the collar by \(ds\wedge\sigma_1\wedge\sigma_2\wedge\sigma_3\). In
particular \(d\sigma_i=-2\sigma_j\wedge\sigma_k\) cyclically. Put
\[
 t=\frac{\sqrt{65}}4,\qquad b=\frac1{2\sqrt2},\qquad
 (e^1,e^2,e^3)=(\sigma_1,\sigma_2,t\sigma_3),\qquad
 h=\sum_i(e^i)^2 .
\]
The outward normal on the side \(V_{\rm left}\) adjacent to \(s<0\) is
\(+\partial_s\). For this normal, \(B(X,Y)=g(\nabla_X\nu,Y)\) and
\(B=B^\circ=\operatorname{diag}(b,-b,0)\) in the displayed coframe. On
\(V_{\rm right}\), which is adjacent to \(s>0\), the normal and the induced
orientation both reverse. The E06 coefficient \(c=1/16\) fixes the second
normal jet. The boundary budget uses the zeroth and first normal jets.

## APS normalization and intrinsic term

Atiyah, Patodi and Singer, *Spectral asymmetry and Riemannian geometry. I*,
Math. Proc. Camb. Phil. Soc. **77** (1975), 43–69, equation (1.7), p. 44,
and Theorem (4.14), p. 66, were checked in the published scan on 27 November
2026. The theorem applies to a compact oriented Riemannian \(4k\)-manifold
with a product metric near its boundary. Its signature is that of the
relative-to-absolute middle cohomology image. Its correction is the value
at zero for the even-form odd-signature operator, whose spectral sum
omits zero eigenvalues. In dimension four the resulting equality is
\(\int_V p_1(g_0)=3(\tau(V)+\eta(\Sigma,h))\) for the product-near-boundary
comparison metric \(g_0\), with the boundary oriented outward first.
The spectral asymmetry changes sign under orientation reversal. [APS I][aps]

Equation (2) of the [LED eta variation][eta] uses this normalization. Its
Berger calculation orients the dual of the frame with
\(d\sigma_i=+2\sigma_j\wedge\sigma_k\) positively. Replacing each
\(\sigma_i\) by \(-\sigma_i\) converts the E06 structure equations to that
choice and reverses the orientation while preserving the metric and the
diagonal second form. For a sign check directly in E06 orientation, put
\(\alpha=2/t-t\). The E06 Koszul coefficients give the connection forms
\(\omega^1{}_2=-\alpha e^3\), \(\omega^2{}_3=-t e^1\), and
\(\omega^3{}_1=-t e^2\), where \(\omega^i{}_j=\langle\nabla e_j,e_i\rangle\).
For the family \(h_t=\sigma_1^2+\sigma_2^2+t^2\sigma_3^2\), the
three-dimensional Schouten eigenvalues are
\(p_1=p_2=2-3t^2/2\) and \(p_3=-2+5t^2/2\). Here \(p_i\) denotes an
eigenvalue in this calculation. The Cotton–York convention of the variation
formula gives
\[
 Y_{33}=\varepsilon_3{}^{kl}\nabla_kP_{l3}
       =-2t(p_3-p_2)=-8t(t^2-1).
\]
The only frame component of \(\partial_t h_t\) is \(2/t\) in the third
direction and \(\operatorname{Vol}(h_t)=2\pi^2t\). Thus
\[
 \frac{d}{dt}\eta(h_t)=
 \frac{1}{12\pi^2}(2/t)Y_{33}(2\pi^2t)=-\frac83t(t^2-1).
\]
The round eta is zero by an orientation-reversing round isometry. Integration
from \(t=1\) gives \(\eta(h_t)=-\tfrac23(t^2-1)^2\) in E06 orientation,
including the stretched range. At the frozen parameter \(t^2=65/16\),
\[
 12\pi^2\eta(h)=-8\pi^2(49/16)^2=-\frac{2401}{32}\pi^2.
\]

## Covariant boundary term and its sign

Use \(p_1(\Omega)=-(8\pi^2)^{-1}\operatorname{tr}(\Omega\wedge\Omega)\)
with the trace in the real tangent representation. In the parent
[Theorem 3.1][parent] and its [orientation replay][ledger], replace the
metric by \(g_0\) product near the boundary with the same induced \(h\).
The connection difference along the boundary has normal–tangential blocks
\(B_i\) and \(-B_i\), where \(B_i=\sum_j B_{ij}e^j\). In the Pontryagin
transgression the linear and cubic traces vanish, and the quadratic trace
is \(-2\sum_i B_i\wedge(d^\nabla B)_i\). The sign in \(p_1\) and Stokes'
theorem give
\[
 \int_V(p_1(g)-p_1(g_0))=\frac{1}{4\pi^2}\int_\Sigma
        \sum_i B_i\wedge(d^\nabla B)_i .
\]
The parent curvature-operator Hilbert–Schmidt normalization, one quarter of
the all-lowered squared Weyl norm, gives
\(4\pi^2p_1=(|W^+|^2_{\rm HS}-|W^-|^2_{\rm HS})dV_g\). With \(H=0\),
the correction to the signed energy is therefore
\(\mathcal T=\int_\Sigma\sum_i B_i\wedge(d^\nabla B)_i\).

For diagonal entries \((b_1,b_2,b_3)=(b,-b,0)\), the exterior covariant
derivative is \((d^\nabla B)_i=dB_i+\sum_j\omega^i{}_j\wedge B_j\).
Writing \(e^{ij}=e^i\wedge e^j\), the coefficient in the first slot is
\((-2b_1/t+\alpha b_2+t b_3)e^{23}\), in the second it is
\((-2b_2/t+\alpha b_1+t b_3)e^{31}\), and in the third it is
\((-2tb_3+t(b_1+b_2))e^{12}\). In particular, the covariant curl is
\((t-4/t)\operatorname{diag}(b,-b,0)\). Consequently,
\[
 \sum_i B_i\wedge(d^\nabla B)_i
 =2b^2(t-4/t)dV_h=\frac{1}{64t}dV_h,
 \qquad \mathcal T=\frac{\pi^2}{32} .
\]
The opposite normal negates each \(B_i\) and each covariant derivative,
so the summed differential form is unchanged. Its integral changes sign
because the induced boundary orientation reverses.

## Two-sided budget and scope

For a four-ball the relative signature vanishes. More generally, on any
side \(V\) of a cut in a homotopy four-sphere \(M\), the map
\(H^2(V,\partial V;\mathbb R)\to H^2(V;\mathbb R)\) factors by excision
through \(H^2(M;\mathbb R)=0\), so \(\tau(V)=0\). The signatures and
boundary values give

| Side | \(12\pi^2\eta\) | \(\mathcal T\) | \(E_+-E_-\) |
| --- | ---: | ---: | ---: |
| \(V_{\rm left}\) | \(-2401\pi^2/32\) | \(+\pi^2/32\) | \(-75\pi^2\) |
| \(V_{\rm right}\) | \(+2401\pi^2/32\) | \(-\pi^2/32\) | \(+75\pi^2\) |

Thus \(E_-(V_{\rm left})\ge75\pi^2\) and \(E_+(V_{\rm right})\ge75\pi^2\).
Reversing the ambient orientation swaps the chiralities. An orientation-safe
bound follows directly from
\(\lvert12\pi^2\eta+\mathcal T\rvert\ge
12\pi^2\lvert\eta\rvert-\lvert\mathcal T\rvert=75\pi^2\).
In the parent conventions \(e=E_+(M)=E_-(M)\) on a homotopy sphere, so
\(e\ge75\pi^2\). Equality would force \(W^+=0\) on \(V_{\rm left}\) and
\(W^-=0\) on \(V_{\rm right}\) by nonnegativity and smoothness, hence
\(W=0\) at their common boundary. Codazzi in the [orientation replay][ledger]
identifies the magnetic Weyl block there with the symmetric covariant curl
of \(B^\circ\), which is nonzero by the derivative calculation. Therefore
\(e>75\pi^2\) for a smooth closed realization. The orientation and first
normal jet are the only marked data used in the strictness argument besides
\(h\). Conformal changes of the weighted datum preserve the boundary budget
by Theorem 3.1 and the Weyl measures.

The obstruction applies to arbitrary smooth interiors of the stated
signature, including every smooth homotopy-four-sphere completion of the
actual E06 germ. An isolated filling of different relative signature carries
the additional term \(12\pi^2\tau(V)\). The calculation is specific to this
marked Berger datum. General first-width cuts remain in the scope of the
[GEO register][register].

[issue]: ISSUE_BERGER_COMPLETION_20261127.md
[germ]: E06_GERM.md
[area]: ../../notes/GLOBAL_AREA_TEST_20261127.md
[eta]: ../../../01_chirality_ledger/notes/ETA_VARIATION.md
[ledger]: ../../../01_chirality_ledger/reviews/PARENT_SECTION_3.md
[source]: ../../../01_chirality_ledger/reviews/LEDGER_SOURCE_REPLAY.md
[parent]: ../../../manuscript/cuts_of_subcritical_conformal_classes.tex
[register]: ../REGISTER.md
[aps]: https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24
