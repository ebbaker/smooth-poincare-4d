# A chiral obstruction on the projective-plane normal disk bundle

27 November 2026, for Edward B. Baker III, OpenAI assistance. Lead actual model and effort unavailable. Inputs bc2c1bb, [marked Berger return](../../01_chirality_ledger/research-progress/handoffs/TO_TUBE_QUATERNIONIC_MARKING_20261127.md) and [B02](../brainstorm/notes/B02_MARKED_CAPS.md). Analytical calculation on a specified smooth Riemannian disk bundle with boundary. The statement bounds the larger of the two signed Weyl energies and is independent of the choice of orientation.

Consider the oriented normal disk bundle of a projective plane with normal Euler number of magnitude two. Use its homogeneous model with principal orbit \(Q_8\backslash SU(2)\). The projection of this orbit to the zero section is \([g]\mapsto[g^{-1}kg]\in\mathbb{RP}^2\). On this marking the normal circle is left multiplication by \(\exp(\alpha k)\); its period is \(\pi/2\), since the isotropy inside this circle is \(\{\pm1,\pm k\}\). The normalizer of the circle identifies the antipodal axes. Equivalently the increasing angle on the ordinary normal disk is \(4\alpha\). The double cover over the oriented base is the disk bundle with Euler magnitude four. The argument applies to this explicit tube and to its orientation reverse.

Assume a smooth biaxial metric through the core with horizontal radii equal throughout and the marked circle as the third axis. Conformally divide by the common horizontal radius squared (positive at the core) and reparameterize by arclength. With right-invariant unit round forms on the cover the resulting metric reads
\[
 ds^2+\sigma_1^2+\sigma_2^2+c(s)^2\sigma_3^2,\qquad
 c(0)=0,\quad c'(0)=4,\quad c>0\quad(0<s\le S).
\]
The squared forms descend. Smoothness in normal polar coordinates gives the slope four. An umbilic outer boundary is totally geodesic after the normalization, hence \(c(S)=t,\ c'(S)=0\). A varying horizontal scale, or a conformal change of the entire cap, preserves the chiral integrals. Nothing requires monotonicity of \(c\), scalar positivity, or symmetry of the complement.

With orthonormal forms \(ds,\sigma_1,\sigma_2,c\sigma_3\), the sectional curvatures of the radial/third and horizontal planes are \(-c''/c,\ 4-3c^2\), respectively. The radial/horizontal sectional curvatures vanish and the other two are \(c^2\). Intrinsically on the orbit the curvature values follow from the round structure constants of magnitude two. The second fundamental form has eigenvalues \(0,0,c'/c\); Codazzi gives \(|R_{0312}|=2|c'|\) (the two horizontal connection terms have opposite signs). Rotations of the horizontal plane force equal transverse Weyl eigenvalues in each chirality. Subtracting \(R/12\) from the curvature operator on the axial self-dual or anti-self-dual form gives axial eigenvalue \((4-4c^2-c''/c\ \pm6c')/3\), the signs taken as an unordered pair. The squared Hilbert–Schmidt norm is \(3/2\) times the square of that eigenvalue. Each orbit has volume \(2\pi^2 c/8\).

Put \(v=\int_0^s c\,ds,\ V=v(S),\ z=c^2-1\); dots below differentiate in \(v\). Then \(\dot z=2c'\), \(\ddot z=2c''/c\), giving the unordered pair
\[
 \frac{E_\pm}{\pi^2}=\frac1{96}\int_0^V
  (\ddot z\ \pm6\dot z+8z)^2\,dv,\quad
 (z,\dot z)(0)=(-1,8),\quad(z,\dot z)(V)=(t^2-1,0).
\]
In particular the difference in magnitude is \(|9-(t^2-1)^2|\pi^2\), as follows by integrating the cross term. It agrees with the independent eta computation at \(t=\sqrt3\).

Take the member with \(-6\dot z\). The derivative of \(e^{-4v}(\dot z-2z)\) is \(e^{-4v}(\ddot z-6\dot z+8z)\). Evaluation at the two ends and Cauchy–Schwarz give
\[
 \frac{\max(E_+,E_-)}{\pi^2}\ \ge\
 \frac{\big(10+2(t^2-1)e^{-4V}\big)^2}{12(1-e^{-8V})}.
\]
For **every \(t\ge1\)** the right side exceeds \(25/3>8\). Thus no exterior can put this cap in the strict closed band for either orientation. This applies in particular throughout the eta-admissible Berger interval for this marking, including the intrinsic \(R=2,\ |\eta|=5/12\) example. For \(0<t<1\) this marking already fails the strict eta test on the Berger slice. A smooth core and umbilic face were essential to the two endpoint evaluations.

A Berger boundary does not force a biaxial path inside; the calculation does not control an arbitrary filling or a path which breaks horizontal equality. If the elongated axis differs from the collapsing disk axis the fixed biaxial model at the core does not produce that boundary, and the same substitution cannot simply be made. Both qualifications matter for a general projective-plane tube.
