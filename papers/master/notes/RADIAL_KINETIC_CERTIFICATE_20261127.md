# Kinetic transfer on the actual radial band footprints

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E calculation under master B02. Actual serving model variant and reasoning effort were unavailable. Intake HEAD `48f36794f9b1`. The [frozen scalar family][data] has Git blob `52799ce89460`. We use the unchanged smooth Riemannian long-cuff width-\(1/16\) trial and the [frozen radial profile][trial]. All kinetic quantities below are for one band.

The actual kinetic term obeys \(m^{-1}K_*\le K\le mK_*\), where \(K_*\) is the term evaluated with one smooth explicit planar comparator. The verified factor is \(m<1.002751\) if the uniform height gate is \(\sup|u_p-v_p|\le126\cdot10^{-6}\) and \(m<1.003041\) for the gate \(193\cdot10^{-6}\). In either case this supplies the kinetic comparison throughout the actual two-parameter root box. An additional subinterval contribution is below \(0.480\) under either height gate and below \(1.760\) unconditionally. A four-variable integral bound on the remaining smooth comparator is still needed. [Replay][script] · [Cuff root and uniform-height premises][scalar]

## A rank-two kinetic transformation

Let \(\widehat H=e^{v_*}\) and \(\widehat\Phi=\alpha_*P_{+,\mathrm{app}}^2+\beta_*P_{-,\mathrm{app}}^2\), computed from the frozen center. For a complex scalar define
\[
 S(z)=\begin{pmatrix}\operatorname{Re}z&-\operatorname{Im}z\\
                       -\operatorname{Im}z&-\operatorname{Re}z\end{pmatrix},
 \qquad M(H,\Phi)=\sqrt H\,I+H^{-1/2}S(\Phi).
\]
Then \(q=M(H,\Phi)^2\). Write \(M_*=M(\widehat H,\widehat\Phi)\) and \(q_*=M_*^2\). With \(\kappa=|\widehat\Phi|/\widehat H<1\), let \(d\ge|u-v_*|\) and \(e\ge|\Phi-\widehat\Phi|\). The norm of \((M-M_*)M_*^{-1}\) is bounded by
\[
 \epsilon=e^{d/2}-1+
 \frac{(e^{d/2}-e^{-d/2})\kappa}{1-\kappa}
 +\frac{e^{d/2}e}{\widehat H(1-\kappa)}.
\]
Indeed \(M=e^{(u-v_*)/2}M_*\) plus the two terms from the change of coefficient and the inverse stretch. Use \(\|S(z)\|=|z|\) and \(\|M_*^{-1}\|=(\sqrt{\widehat H}(1-\kappa))^{-1}\). It follows that \((1-\epsilon)^2q_*\le q\le(1+\epsilon)^2q_*\). Hence \(m=(1-\epsilon)^{-2}\) controls both directions of comparison.

In exterior coordinates the exact and comparator blended metrics differ only in the planar block. Thus their relative eigenvalues are \(1,1,\lambda_1,\lambda_2\) with \(\lambda_i\in[m^{-1},m]\), by the planar comparison and positivity of the unaltered part. The ratio of \( |ds|^2\sqrt{\det G}\) to its comparator value is at most
\[
 \frac{\sqrt{\lambda_1\lambda_2}}{\min(1,\lambda_1,\lambda_2)}\le m.
\]
This uses no estimate of a derivative of the planar metric. Interchanging the metrics gives the lower bound. Under the looser gate, an upper enclosure \(K_*\le21933\) would suffice for the target \(K<22000\).

## Verified planar inputs

The projection of each framed \(r\le9/8\) point lies in the radius annulus \([119/128,137/128]\) around one of the hole centers. The two signs and complex conjugation reduce this cover to the upper half-annulus about \(+1\). Parametrize its two angular quarters by \(i^j(1+it)/(1-it)\), \(t\in[0,1]\). Sixteen radial intervals and 256 intervals per quarter cover the whole annulus. In each cell, group the exact dyadic comparator terms by angular mode and convert the radial Chebyshev sums to monomial polynomials. The exact Bernstein coefficients of their derivatives on \([0,9/32]\) bound radial variation from the midpoint of a cell's radial-argument interval. That domain covers all three radial chart arguments. Use interval arithmetic for the remaining rational angular factors and the base logarithm. The approximate Hopf fields are the exact rational multipole derivatives, with the uniform \(2\cdot10^{-10}\) correction on \(F\) for the actual Hopf combination in the root box. Include in \(d\) the two affine parameter responses together with the specified uniform height error. Include in \(e\) the two absolute multipole-square field amplitudes times the coordinate radii and the global Hopf correction. [Whole-pants Hopf bound and parameter box][scalar] · [Arithmetic replay][script]

| Quantity | \(126\cdot10^{-6}\) height gate | \(193\cdot10^{-6}\) height gate |
| --- | ---: | ---: |
| Upper \(\kappa\) | 0.623 | 0.623 |
| Upper \(d\) | 0.000316238 | 0.000383238 |
| Upper \(\epsilon\) | 0.001372542 | 0.001516787 |
| Upper \(m\) | 1.002751 | 1.003041 |

The same verification gives \(v_*\in[-1.763,-0.241]\) on the cover and \(q<3I\) under either gate.

## Stable Schur evaluation and the adjoining strip

For \(t=1-a\), \(r=1+s\), the matrices in the exterior coordinates of the [native band][trial] are
\[
 C=256[r^{-2}I+(1-r^{-2})pp^\top],\qquad Q=\operatorname{diag}(q,1),\qquad F=tC+aQ .
\]
Put \(v=(\bar c'(\theta),0)\). The Schur complement is
\[
 b=t\sinh^2r+a\sin^2\phi+v^\top tC F^{-1}aQv,\qquad \det G=\det F\,b.
\]
The last term is a positive parallel sum. For \(0<a<1\) it is \(ta\,v^\top(aC^{-1}+tQ^{-1})^{-1}v\), which extends to the pure ends. The inverse lapse is
\[
 |ds|^2=256\left(p^\top F^{-1}p+\frac{a^2(p^\top F^{-1}Qv)^2}{b}\right).
\]
Both follow by completing the exterior longitude block. For a remaining four-variable quadrature the first inverse can use \(F=D+c pp^\top\), with \(D=256 t r^{-2}I+aQ\) and \(c=256 t(1-r^{-2})\ge0\). The parallel-sum inverse can use \(aC^{-1}+tQ^{-1}=E-d_0 pp^\top\), with \(E=a r^2I/256+tQ^{-1}\) and \(d_0=a(r^2-1)/256\). The latter inverse's rank-one denominator \(1-d_0 p^\top E^{-1}p\) is at least \(r^{-2}\ge64/81\). This permits a positive arithmetic evaluation without subtracting two large longitude kinetic terms.

On \(s\in[27/400,3/32]\) one has \(a\le1/2\), \(t\ge1/2\), and \(\chi'=4/125\). The letter speed satisfies \(|v|\le35\). Indeed on \(x\in[1/4,1/2]\) the flat-step derivative is at most \((16+4)/4=5\). On \(0<x\le1/4\) one can use \(H(1-H)\le e^{4/3}e^{-1/x}\) and \(x^{-2}+(1-x)^{-2}\le(10/9)x^{-2}\), giving \(H'<(160/9)e^{-8/3}<5\). Reflection applies to the other half, and the physical longitude introduces the factor seven. For \(Q\le BI\), the parallel sum is bounded above by \(aQ\). Since \(G\ge tA\), \(|ds|^2\le1/t\). It follows using \(\sinh(35/32)<3/2\) that
\[
 \frac{|ds|^2dV_G}{ds\,d\mu}
 \le r^2(1+B/256)^{3/2}\sqrt{t b}
 \le (35/32)^2(1+B/256)^2\sqrt{5/2+35^2B/4}.
\]
Here \(d\mu=d\theta\,dA_{S^2}\) and \(dV_G=16^{-3}r^2\sqrt{\det F\,b}\,ds\,d\mu\). Multiply by \(6(4/125)^2(21/800)\cdot80\), using \(8\pi^2<80\) on the angular slice. This gives the stated strip bounds with \(B=3\) and with the unconditional footprint estimate \(B=28\), respectively. The plateau after \(62/512\) has zero kinetic integrand. The central varying-profile strip still requires the four-variable enclosure of \(K_*\). Neither this transfer nor the strip bound evaluates the scalar potential. [Unconditional footprint metric upper bound][footprint] · [Frozen trial slope and geometry][trial] · [Arithmetic replay][script]

## Coefficients for the localized exterior annulus

For the [moving-letter test][moving], the planar support reaches past the preceding annular cover. On the whole rectangle \([9/5,11/5]\times[-1/5,1/5]\), which contains \(|z-2|\le1/5\), the interval replay gives
\[
  J=\sqrt{\det q_L}<0.253682,\qquad
  Jq_L^{-1}<2.335999\, I .
\]
Conjugation covers the lower half of the rectangle and the half-turn carries these same inequalities to the actual support near \(-2\). They use the isolated root box and its whole-pants height estimate, allowing the looser tolerance \(193\cdot10^{-6}\). At the endpoint \(z=9/5\) on the disk, \(J\in[0.2513914,0.2518108]\), so \(J\le0.24\) fails even on the disk. [Actual isolated root and height bounds][jet]

Use 256 subdivisions in each coordinate of the upper half of the rectangle, with exact rational endpoints and outward evaluation of the frozen dyadic fields. The Bernstein derivative interval for each radial polynomial now uses \([0,5/16]\), which covers all three chart arguments on this rectangle. For each cell, enclose \(u\) with the two affine response fields and the global height tolerance, and enclose \(|\Phi|\) from the center field, the two parameter radii and the global \(2\cdot10^{-10}\) Hopf error. Put \(H=e^u\) and \(\kappa=|\Phi|/H\). The code checks \(\kappa<1\) and evaluates
\[
 J=H-\frac{|\Phi|^2}{H},\qquad
 \lambda_{\max}(Jq_L^{-1})=\frac{1+\kappa}{1-\kappa}.
\]
The matrix formula follows from the two native eigenvalues \(H(1\pm\kappa)^2\). The rectangle check replays with `python3 -B papers/master/numerics/radial_kinetic_certificate.py --moving-rectangle --rectangle-cells 256`. The bound supplies only metric values for the exterior Dirichlet term. [Replay][script] · [Original moving support and test][moving]

[script]: ../numerics/radial_kinetic_certificate.py
[data]: ../numerics/whole_pants_residual_d18.json
[trial]: NATIVE_RAYLEIGH_TRIAL_20261127.md
[scalar]: SCALAR_FIT_RESIDUAL_20261127.md
[footprint]: HARMONIC_MARKING_ENCLOSURE_20261127.md
[moving]: MOVING_LETTER_RAYLEIGH_TEST_20261127.md
[jet]: NATIVE_MARKED_JET_CERTIFICATE_20261127.md
