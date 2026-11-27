# The round-start biaxial transition

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded SP4-CUT-SEAM-E17 r1. Requested GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. Working HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The frozen B04, E08C, E11A, closing, incoming TUBE return and E19 SHA-256 prefixes match those listed in the request. All calculations are for smooth Riemannian fillings of the marked disk with collapsing \(i\), E19 outward-first orientation and real operator Hilbert–Schmidt blocks. This is an exact independent derivation of the class bound, the trial and its sign. [Request](../research-progress/handoffs/E17_REQUEST_R1.md) · [E19 conventions](../../03_tubes_and_exteriors/notes/E19_TRIAXIAL_CERTIFICATE.md) · [Marked paired criterion](../notes/B04_PAIRED_FILLING.md)

The explicit positive family proves \(F_W(h_{\sqrt3})\le(13/2)\pi^2\). Within the class with an interior round umbilic orbit and the prescribed fixed-axis biaxial annulus from that orbit to the face, the infimum is exactly \((13/2)\pi^2\) and every finite member is strictly above it. The family gives a better admissible upper bound while leaving the strict entering threshold \(4\pi^2\) open.

## Curvature and normalization

Write a biaxial piece in outward arclength as \(ds^2+\sigma_1^2+\sigma_2^2+a(s)^2\sigma_3^2\), where the forms have the positive structure equations of E19. A cyclic permutation can put the distinguished axis in position 3 without changing orientation. More generally, if the two equal lengths are a common factor \(c(s)>0\), divide by \(c(s)^2\) and reparametrize arclength. A round umbilic orbit remains round and umbilic, and in the normalized gauge the two constant length directions force its full second form to vanish. Let \(v\) increase outward by \(dv=a(s)\,ds\) and set \(y=a^2\), \(z=y-1\). Hereafter primes denote \(v\)-derivatives.

Substitution into Cartan's equations gives \(f_3=2/a-a\), \(f_1=f_2=a\), normal sectional curvatures \((0,0,-a_{ss}/a)\), and the three complementary tangential sectional curvatures \((a^2,a^2,4-3a^2)\). The mixed curvature entries are \((a_s,a_s,-2a_s)\) in the signed E19 chiral formulas. Therefore
\[
 R=8-2y-y'',\qquad \lambda_3^\pm=-\frac{y''\pm6y'+8(y-1)}6 .
\]
The equal remaining chiral eigenvalues are \(-\lambda_3^\pm/2\), so the squared block norm is \(3(\lambda_3^\pm)^2/2\). An orbit of the indicated lengths has volume \(\pi^2 a/4\), since the unit \(S^3\) volume is \(2\pi^2\) and the group has order eight. Consequently, writing \(L_\pm=D_v^2\pm6D_v+8\),
\[
 \frac{E_\pm}{\pi^2}=\frac1{96}\int(L_\pm z)^2\,dv,
 \qquad
 \frac{E_+-E_-}{\pi^2}=\left[\frac{(z')^2}{8}+z^2\right]_{\mathrm{ends}}.
\]
The second equality follows by subtracting the squares and integrating \(z'(z''+8z)/4\). It fixes the energy labels independently of the boundary ledger.

## The sharp outer-annulus cost

On a finite such annulus place the face at \(v=0\) and the interior round orbit at \(v=A<0\). The endpoint data are \(z(A)=z'(A)=0\) and \(z(0)=2,z'(0)=0\). Extend by zero for \(v<A\), which gives an \(H^2\) function on \(( -\infty,0]\) because the extended function and its first derivative match. Put \(z_*=4e^{2v}-2e^{4v}\), which has the same clamped data at zero. Since \(L_+^*L_+=(D_v^2-4)(D_v^2-16)\), we have \(L_+^*L_+z_*=0\). For \(w=z-z_*\), integrations by parts give \(\int L_+z_*L_+w=0\). The finite seam of the zero extension contributes nothing because its first traces match. The traces of \(w,w'\) vanish at zero and all terms decay at the far end. Also \(L_+z_*=96(e^{2v}-e^{4v})\) and \(L_-z_*=0\). Direct integration gives
\[
 \frac1{96}\int_{-\infty}^0 (L_+z_*)^2\,dv
 =96\left(\frac14-\frac26+\frac18\right)=4 .
\]
The energy of the extended function is then \(4+\|L_+w\|_2^2/96\). Equality would require \(w=C_1e^{-2v}+C_2e^{-4v}\), hence \(w=0\) by its \(L^2\) limit. No finite annulus attains that equality, since its extension vanishes on an open tail and \(z_*\) is positive there. The lower bound uses only the biaxial outer annulus with both its clamped endpoints. It allows an arbitrary smooth interior before the round umbilic orbit, whose \(E_+\) is nonnegative. It gives no lower bound of \(4\pi^2\) for a filling without such an orbit followed by this annulus.

For the optimum tail the scalar curvature is \(6-24t+36t^2\) with \(t=e^{2v}\in(0,1]\), so \(R\ge2\). Its distinguished axis is \(k\). This gives the terminal value \(a_k=\sqrt3\), with the other two axes equal to one and all first normal derivatives zero.

## The inner core and the positive finite assembly

In the core use the distinguished axis \(i\) and the two transverse unit lengths. On \(v\ge0\) choose
\[
 y_i=1+2e^{-2v}-3e^{-4v}=(1-e^{-2v})(1+3e^{-2v}).
\]
It is positive away from the bolt and has \(y_i(0)=0\), \(y_i'(0)=8\). From \(ds=dv/\sqrt{y_i}\) we get \(v=2s^2+O(s^4)\) and \(a_i(s)=4s+O(s^3)\) with smooth odd extension. For instance changing variable to \(\sqrt v\) gives an even smooth integrand for arclength with nonzero initial value. The normal polar angle is four times the quaternion parameter for the actual marked C4 meridian \(\langle i\rangle\). Thus \(a_i/4\) has the unit radial derivative required for the smooth polar disk metric. The remaining horizontal metric is fixed and isotropic, so it is invariant under the normalizer at the bolt. In a local disk trivialization the polar connection terms are smooth since \(s^2d\gamma\) has smooth Cartesian coefficients, and the correction to the polar metric begins at order \(s^4\) in the angular coefficient. This establishes smooth extension on the actual projective-plane normal bundle. [Explicit normalizer and normal slice](../../03_tubes_and_exteriors/notes/E18_QUATERNIONIC_PAIR.md)

Here \(L_+(y_i-1)=0\), and the exact signed difference formula gives \(E_-/\pi^2=9\) on the infinite core, since \((z,z')=(-1,8)\) at the bolt and tend to \((0,0)\) at the other end. Its scalar curvature is \(6-12t+54t^2\) with \(t=e^{-2v}\in(0,1]\), and is at least \(16/3\), including the bolt by smoothness.

Fix a smooth cutoff \(\chi\) equal to one on \(( -\infty,0]\), zero on \([1,\infty)\), and in \([0,1]\). At length parameter \(\ell\ge1\), replace the core's \(z\) by \(\chi(v-\ell)z\), and the outer \(z_*\) by \(\chi(-v-\ell)z_*\). On both cutoff strips the native \(|z^{(j)}|\), \(0\le j\le2\), is at most \(56e^{-2\ell}\). The cutoff functions give the bound \(224Me^{-2\ell}\) there, where \(M=\max_{j\le2}\|\chi^{(j)}\|_\infty\). Positivity of \(y\) is automatic for sufficiently large \(\ell\), and on these strips \(|R-6|\le672Me^{-2\ell}\). The native regions keep their strict scalar bounds. The profile is exactly round product beyond each cutoff strip. The two round collars can be joined by the identity on principal orbit axes with an optional finite round product interval. Both radial parameters then agree up to translation in outward arclength. The smooth disk retains the original meridian and its outer face has the required \(h_{\sqrt3}\) and \(B=0\). Its scalar curvature is strictly positive on the whole disk, hence its entire Neumann conformal Laplacian is positive.

The changed and dropped portions in either energy are \(O(e^{-4\ell})\), since on the modified unit strips \(L_\pm z=O(e^{-2\ell})\) and the unmodified tails decay exponentially at the same rate. The intermediate round interval has both Weyl blocks zero. The finite family thus gives \(E_+/\pi^2\to4\), \(E_-/\pi^2\to9\), and \(e_W/\pi^2\to13/2\). The signed half difference \(-5\pi^2\) holds at every finite length by the clamped traces, independently of the cutoff. This combined limit proves the upper bound for unrestricted \(F_W(h_{\sqrt3})\) and attains the infimum as a limit in the restricted class above.

Duplication and the exact short-axis switch give the marked matrix-sphere split. The outward normal signs are opposed and both forms vanish at the seam. The two whole-side Neumann signs are positive. If smooth reflections are required, productize collars arbitrarily close to the terminal face while preserving its induced metric and first jet. This keeps both signs and the two initial energy limits by \(C^1\cap W^{2,p}\) convergence as in E15. The resulting smooth classes on the actual paired sphere have \(E_+=E_-\to13\pi^2\). They provide no entering pair in this family, since each half in the prescribed class exceeds the outer-annulus lower bound and the paired energy wall is \(2T=8\pi^2\). [Paired orientations, exact smooth type and sign](E15_DOUBLES_AND_COVERS.md)
