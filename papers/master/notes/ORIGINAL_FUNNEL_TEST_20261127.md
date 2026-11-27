# A smaller exterior charge for the original long-cuff trial

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E under master B02, checkout `48f36794f9b1`. Actual serving model and reasoning effort are unavailable. Inputs are the [07 trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md) `e999229fcdf9`, [tube marking and inverse](../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md) `59c3993e018e`, [compactified funnels](../../investigations-1/07_positive_subcritical_entry/notes/FUNNEL_EXTERIOR.md) `0cc56c281145`, [closed form](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_CLOSED_SIGN.md) `67f00fd3e9bf`, [band exchange](FIXED_WIDTH_BAND_TEST_20261127.md) `03f618c377cf`, and [Hopf and joint forms](HOPF_NEUMANN_TEST_20261127.md) `0a88a993bc54`. The metric is the original smooth oriented Riemannian minus Miller–Schupp assembly, with its two positive-facing caps, convex width \(1/16\), and three length-\(L=2\operatorname{arcosh}5\) cuffs with their original smooth compactifications. In the energy convention of the master, the two band contributions are each \(c\) in both real two-form Hilbert–Schmidt chiralities.

On the actual metric, one explicit common exterior trial improves the radial numerator bound from \(2Q_{U_1}(\chi)+144L\,\chi(1/8)^2\) to
\[
 Q_M(f)\le 2Q_{U_1}(\chi)+C_{\rm ext}\,\chi(1/8)^2,
 \qquad C_{\rm ext}=\frac{425496L+1868\pi^2+11208L\log 2}{3125}<\frac{3208}{5}.
\]
In particular \(\int_{U_1}R\,dV\le-1604/5\) would make the original closed sign strictly negative. The estimate needs no harmonic-map derivatives in the exterior. It still needs a band numerator and yields no bound on \(c\).

## The signs and operators at the actual ends

Use \(Q_A(f)=\int_A(6|df|^2+Rf^2)\,dV\), with \(\Delta=\operatorname{div}\nabla\). On the scalar-flat positive-facing cap the outward normal is increasing disk radius. For a cap mode \(e^{im\theta}Y_{\ell k}\), the normal response \(b'_{m\ell}(1)/b_{m\ell}(1)\) is nonnegative, and vanishes just on the constants. This follows directly from integrating the radial equation of 07 against \(b_{m\ell}\sinh t\) and using regularity at the disk center. The energy pairing is six times this response with the induced face measure \(\sinh 1\,d\theta\,dA_{S^2}\).

On one unscaled funnel use \(a_0=L/(2\pi)\), \(\tau=\arctan(\sinh r)\), \(x=\pi/2-\tau\), and \(g_0=dr^2+a_0^2\cosh^2r\,d\eta^2+\sigma\). The physical metric is \(u^2g_0\), with \(u=1\) near the waist and \(u=B^{-1}\sin x\) near its collapsed end. With \(v=uf\), its energy is \(6\int|dv|_{g_0}^2\). In the conformal formula the waist term vanishes because \(u'=0\). At a distant cut the boundary correction \(-6\int uu'f^2\,dA_{g_0}\) tends to zero for bounded \(f\), since \(u,u'=O(e^{-r})\) and \(dA_{g_0}=O(e^r)d\eta\,dA_\sigma\). The outward waist normal of the **funnel** is \(-\partial_r=\partial_x\) there. Its contribution has positive sign and adds to the core terms with the opposite core normal. [Lee–Parker, equation (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=7)

Set \(\kappa=|m|/a_0\). The regular solution on the funnel of
\[
 V''=\big(\kappa^2+\ell(\ell+1)\csc^2 x\big)V
\]
is proportional to \(x^{\ell+1}\) at the collapsed end. Its multiplier at the waist is \(\nu_{m\ell}=V'(\pi/2)/V(\pi/2)\), with physical waist measure \(a_0\,d\eta\,dA_\sigma\). All multipliers can be evaluated without an ODE solve. With \(K_\ell=-\partial_x^2+\ell(\ell+1)\csc^2x\) and \(D_\ell=\partial_x-\ell\cot x\), direct multiplication gives \(D_\ell^*D_\ell=K_{\ell-1}-\ell^2\) and \(D_\ell D_\ell^*=K_\ell-\ell^2\). Applying \(D_\ell\) to the regular solution for \(\ell-1\) therefore produces the nonzero regular solution for \(\ell\). Its leading term of order \(x^{\ell-1}\) cancels, leaving order at least \(x^{\ell+1}\). The kernel possibility would give \(V\propto\sin^\ell x\) with eigenvalue \(\ell^2\) in place of \(-\kappa^2\). At \(x=\pi/2\) the transformed value is \(V'\) and its derivative is \((\kappa^2+\ell^2)V\). Hence
\[
 \nu_{00}=2/\pi,\qquad \nu_{m0}=\kappa\coth(\kappa\pi/2)\ (m\ne0),\qquad
 \nu_{m\ell}=\frac{\kappa^2+\ell^2}{\nu_{m,\ell-1}}\ (\ell\ge1).
\]
For example \(\nu_{0,1}=\pi/2\) and \(\nu_{0,2}=8/\pi\). The sign at either band face in the integrated Gauss identity is likewise physical. With mean curvature \(k\) for increasing \(s\), the contribution is \(+2\int kf^2\,dA\) at \(s=0\) and \(-2\int kf^2\,dA\) at \(s=1/8\). At the first face the integrated \(k\) is \(8\pi^2\cosh1\). At the second face it is computed in the actual pulled-back product germ, with the band normal pointing from the band into the retained exterior. [07 band identity](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_CLOSED_SIGN.md#a-band-integral-at-the-prescribed-width)

The exact exterior reduction minimizes the gradient form on the compact tube complement with the three positive cuff pairings. When the band Dirichlet signs are positive, the original trace form adds the two cap, two band and three cuff charges, with the cuff variables first minimized on the coupled exterior. A nonpositive band Dirichlet sign produces a strictly negative closed witness as in 07. The trial below works for either Dirichlet sign.

## One explicit trial on the full retained exterior

For \(p\) in the exterior sphere put \(t=p_3=\cos\phi\). Both actual outer band tubes obey \(2/5<|t|<3/5\). In fact \(|\phi-\phi_i|\le9/128\), and the unit Lipschitz bound of cosine places \(|t|\) between \(1/2-9/128\) and \(1/2+9/128\). Define
\[
 \psi_p(t)=(|t|-3/5)_+,\qquad \psi_e(t)=(2/5-|t|)_+,
 \qquad b(t)=1-\psi_p(t)/4-\psi_e(t)/10.
\]
Use \(f=\chi(s)\) on both bands, its constant inner value on both caps, and \(v=\chi(1/8)b(t)\) on the compact retained product. The outer face traces match because both ramps vanish there. Extend \(v\) across every funnel by \(\chi(1/8)b(t)(1-2\tau/\pi)\) and use \(f=v/u\) in its actual physical metric. This is an \(H^1\) trial, including at the collapsed circles. Near them the quotient of the linear factor by \(u\) is a smooth bounded function of \(x\) with bounded derivative, and the angular gradient contributes at most a constant times \(\int_0^{x_0}\sin^2 x\,\sin^{-2}x\,dx\). A radial cutoff removing a smaller neighborhood of the collapsed circle converges in \(H^1\), so the variational calculation also follows by approximation with smooth tests.

In the compact product the Dirichlet charge divided by six and by \(\chi(1/8)^2\) is at most \(2\pi\int_{S^2}|db|^2\), since the whole uncut hyperbolic pair of pants has area \(2\pi\) by Gauss–Bonnet. For all three funnels together the corresponding charge is
\[
 3L\int_{S^2}\left(\frac2\pi b^2+\frac{4\log 2}{\pi}|db|^2\right)dA_\sigma.
\]
The angular coefficient is \(4\pi^{-2}\int_0^{\pi/2}x^2\csc^2x\,dx=4\log2/\pi\), by integrating by parts and using the logarithmic sine integral. For that integral, symmetry gives equal sine and cosine logs on \([0,\pi/2]\), and \(2\sin x\cos x=\sin(2x)\) gives \(\int\log\sin x=-(\pi/2)\log2\).

The two ramps have disjoint support. Each has integral \(8\pi/25\) and squared integral \(32\pi/375\). Their gradient squared integrals are \(208\pi/375\) and \(568\pi/375\), by using \(dA=2\pi\,dt\) for functions of \(t\) and \(|dt|^2=1-t^2\). Substitution gives \(C_{\rm ext}\) above. Its rational strict upper bound uses \(\pi<22/7\), \(\log2<347/500\), and \(L<45849/10000\). The log bound follows by summing three terms in \(2\operatorname{artanh}(1/3)\) and bounding the remaining geometric tail. The hyperbolic bound follows from \(\sum_{j=0}^5(45849/20000)^{2j}/(2j)!>5\). The coefficient sum with these rational upper bounds is \(61402232029847/95703125000<3208/5\).

For the ordinary physical constant \(f=1\), each funnel instead contributes \(24\pi L\int_0^{\pi/2}|\partial_\tau u|^2d\tau\). The multiplier \(u\) is flat at one through \(r=1/2\) and goes to zero at \(\tau=\pi/2\). Its one-dimensional energy exceeds \(1/(\pi/2-\arctan(\sinh(1/2)))\) by strict Cauchy–Schwarz, since \(u\) differs from an affine function on that remaining interval. This explains the improvement over testing the physical constant as well as over the optimized constant-waist test. Setting \(\chi\equiv1\) in the new trial makes the band term exactly \(2\int_{U_1}R\,dV\).

The unaltered scalar and energy integrals still need their separate assessments on the same two bands. The [08 E08 marked-input readback](../../investigations-1/08_cut_geometry_and_chirality/research-progress/handoffs/E08_MARKED_INPUT_RETURN_20261127.md) at `85a5d42f206a` concerns different cuts. Its positive induced three-dimensional equator supplies neither the missing four-dimensional numerator nor a cost bound for these transitions.
