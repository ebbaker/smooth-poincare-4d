# A direct trial on the short-axis projective-plane disk

27 November 2026 for Edward B. Baker III with OpenAI assistance. Lead serving setting unavailable. Routing and limits are recorded in [B05](../brainstorm/notes/B05_DIRECT_SHORT_AXIS.md), [E17](../research-progress/handoffs/E17_REQUEST_R1.md) and [E19](../research-progress/handoffs/E19_REQUEST_R1.md). Inputs at bc2c1bb and the new [SEAM return](../../02_seams_and_marked_cuts/research-progress/handoffs/TO_TUBE_SHORT_AXIS_FILLING_20261127.md). This is a filling of one disk bundle only.

Take the disk circle along \(i\) and elongate the horizontal \(k\)-axis. The normalized metric on the principal orbit region is
\[
 ds^2+a^2\sigma_i^2+e^{-2u}\sigma_j^2+e^{2u}\sigma_k^2 .
\]
With \(x=s/L,\ q=x^2\), put \(a=x p(q),\ u=x r(q)\). The cap ends at \(x=1\) with \(a=3^{-1/4}, u=\log(3)/4\) and \(a'=u'=0\), where prime is any positive rescaling of radial derivative for these zero conditions. Thus its boundary is homothetic to the requested \((1,1,\sqrt3)\) metric with zero second form. Rescale the whole cap by the constant needed to achieve the exact boundary metric; the integrals and signs below are conformally invariant. The printed scalar lower bound is in the normalized gauge. At the core \(a=4s+O(s^3)\), \(u\) is odd, and the two horizontal lengths exchange under reversal. In the normal slice the actual polar angle is four times the quaternional circle parameter. The trace of the horizontal metric is even, and the traceless horizontal metric transforms with the same weight as the normal coordinate and has an odd radial coefficient. Thus the metric extends smoothly.

For a check of the integrand independent of any pole expansion, put \(l_i=a,l_j=e^{-u},l_k=e^u\), \(k_i=l_i'/l_i\), and \(n_i=2l_i/(l_jl_k)\) in cyclic order. The orbit Ricci eigenvalues are \(\rho_i=(n_i^2-(n_j-n_k)^2)/2\) by the homogeneous Koszul formula. With primes in \(s\),
\[
 A_i=-l_i''/l_i+(\rho_j+\rho_k-\rho_i)/2-k_jk_k,\qquad
 B_i=\tfrac{n_i}{2}(k_j+k_k-2k_i)+\tfrac{n_k-n_j}{2}(k_k-k_j).
\]
The first formula adds complementary sectional curvatures, and the second is Codazzi for the diagonal orbit shape operator. Then \(R=2\sum_i A_i\); the two Weyl spectra are \(A_i/2-R/12\pm B_i\), up to an exchange of orientations. Integrate the squared triples against \((\pi^2/4)a\,ds\). The signed difference is independently fixed by the boundary eta because the cap signature is zero.

The [floating search](../numerics/direct_triaxial.py) fixes three extra polynomial coefficients per function and two starting lengths. The endpoints are built into the basis and the scalar condition is sampled. A long-interval trial with positive sampled scalar curvature has mean \(7.0269969703\pi^2\). This decimal is neither a rigorous upper bound nor a minimum. The first short-interval trial has a much larger sampled positive scalar margin and was selected for full-interval validation. Its exact decimal parameters are \(L=0.391295\), the extra coefficients of \(p\) are \((-0.235767,0.148703,-0.047647)\) and those of \(r\) are \((-0.023612,-0.020121,-0.006356)\).

On this specific short trial the [rationally enclosed result](E19_TRIAXIAL_CERTIFICATE.md) is \(R\ge2.6306\) in the normalized gauge and \(7.5423\le e_W/\pi^2\le7.5575\). The larger signed energy lies between \(10.0406\pi^2\) and \(10.0592\pi^2\), so no complementary exterior makes this a subcritical closed class. This exact positive-sign cap supplies a finite upper bound on the marked filling infimum; its value exceeds the required \(4\pi^2\). Combined with the independent cover lower bound, the result is
\[
 \frac83\ \le\ F_W(h_{\sqrt3})/\pi^2\ \le\ 7.5575.
\]
The interval still straddles four. The trial contains no forced round intermediate face, so the failure of the earlier round-intermediate construction is not the reason this particular cap fails. [Exact first sign control](E14_SHORT_AXIS.md).
