# Regulated evaluation of \(\phi(p_0)^2\) on the reassembled input

28 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance on 7c6bbab9a0a6 and the input versions in [B05](../brainstorm/notes/B05_REGULATED_POINT.md). Requested lead Astra/ultra; actual serving variant and effort unavailable. This calculation uses the smooth five-field algebra of [E04](../research-progress/handoffs/RETURN_FTI_E04.md). The finite regulator, including its scalar probability law, is a choice of this investigation.

## One mode that crosses the actual cut

Let \(X=B^4_{64a}\cup_{O}K\) be the original compactification with the signed cap. Glue in the actual Gerig tube. Use the smooth form \(u\) supported across its seam from B05. On any of the prescribed metrics, the unnormalized form has at its seam center the value
\[
 -\iota_{(dq^1)^{\sharp_g}}(dq^1\wedge dq^2).
\]
Its \(dq^2\) coefficient is \(-g^{11}\ne0\). For its normalized version set \(m=\|K_g d^+u\|_{2,g}\). This number is positive. Indeed \(K_g\) is positive and invertible. If \(d^+u=0\), then \(\int_X du\wedge du=-\|du\|^2=0\) by Stokes on the reassembled closed manifold. Thus \(du=0\), and \(d^*u=0\) and \(H^1(X;\mathbb R)=0\) force \(u=0\). The metric, the field and its restriction to the seam are genuine smooth input here. There is no assumption that the Gerig form germ is equivalent to Honda's. Use \(K_gd^+u/m\) as the positive auxiliary basis. The finite coordinates of \(A,\psi\) in the transverse mode are \(x,\theta\), and those of \(\chi,H\) are \(\chi,H\).

On the contour \(H=mx+iy\), the one-mode transverse partition integral with the B05 orientations is
\[
 \frac{1}{2\pi}\int_{\mathbb R^2} e^{-(m^2x^2+y^2)/2}\,dx\,dy
 \int_{\mathrm{Ber}} e^{m\chi\theta}= \frac1m\,m=1 .
\]
The test \(Q(\chi x)=Hx-\chi\theta\) gives a useful check inside the integral. Both \(\langle Hx\rangle\) and \(\langle\chi\theta\rangle\) equal \(1/m\). Varying the metric can change \(m\) and both moments while their difference remains zero.

## Which modes the Ward identity fixes

For \(k\) retained longitudinal pairs write \(\phi(p_0)=c+B\), \(B=\sum_j b_j f_j(p_0)\), and \(Z=\sum_j\zeta_j f_j(p_0)\). Here \(QZ=-B\). Even before applying the specified current,
\[
 I_{p_0}-c^2=Q[-Z(2c+B)] .
\]
The mean-zero scalar coefficient \(b_j\) itself is \(Q\)-exact. In particular \(b_j^2=Q(-\zeta_j b_j)\). Any normalized functional annihilating \(Q\)-exact polynomials whose real \(b\)-marginal is a positive probability measure with finite second moments must have \(b_j=0\) almost surely for every \(j\). This gives a necessity for the scalar support of our longitudinal current under an explicit positivity assumption. It leaves the marginal law of the constant scalar \(c\) free. Grassmann integration in other variables does not by itself imply such positivity.

For any retained transverse dimension \(N\), restricting to \(b=\zeta=0\) commutes with \(Q\). On the new real integration coordinates the complexified differential has \(Qy=iM\theta\) and \(Q\chi=Mx+iy\). Applied to holomorphic-polynomial observables restricted to the contour it closes there in the complexified tangent bundle. Its coefficients have zero superdivergence in the flat product measure. Polynomial insertions times the transverse Gaussian decay in \(x,y\), and Berezin integration kills odd total derivatives. Consequently the actual finite functional annihilates \(Q\)-exact polynomials. With the indicated orientation the bosonic determinant factor is \(1/|\det M|\) and the fermionic factor is \(\det M>0\). Thus the transverse normalized factor is one at every cutoff. This proof uses integration by parts on a specified finite cycle; the need to control measure and field-space ends in a quantum Ward argument is recorded in [Witten, §3, notes 10–11](https://www.ias.edu/sites/default/files/sns/%5B109%5DCommMathPhys117-1988.pdf#page=13).

With \(d\nu_t(c)=\sqrt{t/(2\pi)}\exp(-tc^2/2)\,dc\), the point value follows directly:
\[
 \mathcal L_{t,N,k,g}(1)=1,\qquad
 \mathcal L_{t,N,k,g}(I_{p_0})=\int c^2\,d\nu_t(c)=\frac1t .
\]
Integration by parts in \(c\) gives the last equality. The value is \(1/4\) at the prescribed precision \(t=4\). At every fixed positive \(t\) the value is independent of cutoff and metric. Removing scalar damping by \(t\downarrow0\) diverges even for the normalized expectation. The logarithmic derivative of the residual density is \(1/(2t)-c^2/2\); its restriction to the scalar fixed locus is a nonzero polynomial, so this regulator variation is outside the exact variations tested by the Ward identity. Equality at all cutoffs for this observable requires no construction of a continuum measure on arbitrary local products.

## Same-input comparison

| Input and retained data | Regulated closed point value, \(t=4\) | Earlier finite-cover outer value |
| --- | ---: | ---: |
| Actual Gerig ball and its standard cap, Möbius line \(R_1(-s/2)\mathbb R e_3\), line-adapted lift \(+\widetilde R_1(\pi)\) | \(1/4\) | \(0\) with the line projector |
| Same smooth ball, end and cap, zero-free standard form | \(1/4\) | \(1\) with empty insertion |
| Round and E33 metrics on the closed standard sphere | \(1/4\) on each | No extra decorated-cut calculation |
| Parent's minus puncture with its signed coordinate cap | \(1/4\) whenever the stated smooth cutoff fields are supplied on the closed homotopy sphere | Conditional on a supplied tube and line, \(\mathbf1_{w_1(L)=0}\) |

The first two entries share the original boundary \(O\) and the cap carrying \(-O\). The sign-cover calculation has capped values \(0,1/2\) in its own groupoid normalization. The spacetime point computation uses global fields, normalized vacuum one and a single residual variable on the reassembled \(X\). It does not produce a state or a monopole map on \(O\). Its smooth cutoff can cross the actual tube while the answer depends only on the residual variance. Consequently it gives the parent no stricter bound on the same signed latitude knot and supplies no substitute for a genus-saving surface. [Common inputs](COMMON_INPUTS.md) · [Earlier marked-cover and native comparison](../research-progress/handoffs/RETURN_FTI_E10.md)
