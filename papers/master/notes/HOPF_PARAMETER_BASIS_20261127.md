# A conditioned Hopf basis in the original planar marking

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded derivation for master B02. Actual serving model variant and reasoning effort were unavailable. Intake HEAD `48f36794f9b1`. Inputs were the [native scalar reconstruction][scalar] at `621dd607b795` and the [marking footprint enclosure][footprint] at `f103fccfd777`. This calculation concerns the unchanged circular source pants of the \(L=2\operatorname{arcosh}5\), width-\(1/16\) Miller–Schupp trial. All planar derivatives are in its literal coordinate \(z=x+iy\).

The two real Hopf parameters can be taken to be \(\Phi(0)\) and \(\Phi(4)\), where \(\Phi\,dz^2\) is the Hopf differential. The basis below uses only the two Dirichlet harmonic measures on the source pants. Two explicit Green barriers give uniform lower bounds for its scalar normalizers. Evaluation at the two anchor points is the identity matrix in the normalized basis. The parameters and the original scalar Neumann test still require certified solution data. [Native scalar equation and the two cuff lengths][scalar]

## Harmonic-measure forms

On \(F=\overline D_4(0)\setminus(D_{1/4}(-1)\cup D_{1/4}(1))\), let \(\mu_R,\mu_L\) be real harmonic functions. The function \(\mu_R\) is \(1\) on the right hole and \(0\) on the left and outer cuffs, while \(\mu_L\) is \(1\) on the left hole and \(0\) on the other two cuffs. Smooth boundary regularity and uniqueness apply to these constant Dirichlet data. Set \(h_\pm=\mu_R\pm \mu_L\), and write
\[
 f_\pm=2\partial_z h_\pm=(h_\pm)_x-i(h_\pm)_y,\qquad
 \omega_\pm=f_\pm\,dz .
\]
The data are invariant under conjugation and transform by the indicated sign under the half-turn. In particular \(f_\pm(\bar z)=\overline{f_\pm(z)}\), \(f_+(-z)=-f_+(z)\), and \(f_-(-z)=f_-(z)\). Thus \(f_+(0)=0\). On every circular cuff with center \(c\), \((z-c) f_\pm(z)\) is real, because its product by \(i\) is the value of \(\omega_\pm\) on the circular tangent and has real part zero.

The forms extend holomorphically to the Schottky double. In a real boundary chart, \(\omega_\pm\) has purely imaginary tangential coefficient, and odd Schwarz reflection continues it across the cuff. Equivalently, reflect \(h_\pm-d\) oddly, with \(d\) the constant value on that cuff and the reflection given by circle inversion. Only the derivative is used on the opposite pants, so the possibly different constants on the three cuffs introduce no ambiguity. Thus cuff reflection \(I\) satisfies \(I^*\overline{\omega_\pm}=-\omega_\pm\), and conjugation \(C\) satisfies \(C^*\overline{\omega_\pm}=\omega_\pm\). The holomorphic half-turn pulls \(\omega_\pm\) back to \(\pm\omega_\pm\).

The two forms are independent, as also follows from the anchor bounds below. Their ratio is nonconstant, so their two squares and their product are complex-linearly independent. The genus-two space \(H^0(K^2)\) has complex dimension \(3\) by Riemann–Roch, since \(K^2\) has degree \(4\) and \(K^{-1}\) has no section. Therefore the three products form a complex basis. The half-turn fixes the squares and negates the mixed product. Imposing the cuff and conjugation real structures leaves precisely the real span of \(f_-^2\,dz^2,f_+^2\,dz^2\). This is the Hopf space of the marked reconstruction. [Reflection symmetries of the reconstruction][scalar]

## Bounds at the anchors

For \(c=\pm1\), the disk Green function with pole \(c\) and zero outer trace is
\[
 G_c(z)=\log\left|\frac{16-cz}{4(z-c)}\right|.
\]
The difference \(G_1-G_{-1}\) has zero trace on the imaginary axis and the outer circle. On the right hole, \(|z-1|=1/4\), \(|z+1|\le9/4\) and \(|16-z|\le|16+z|\), so the difference is at most \(\log9\). The maximum principle in the right half of \(F\) gives \(h_-\ge(G_1-G_{-1})/\log9\). Both sides vanish at \(0\). Differentiation from the right there gives
\[
 f_-(0)=\partial_x h_-(0)\ge\frac{15}{8\log9}>\frac56.
\]
Here \(\partial_x(G_1-G_{-1})(0)=15/8\), and the last bound uses \(\log9<9/4\).

The sum \(G_1+G_{-1}=\log|(256-z^2)/(16(z^2-1))|\) vanishes on the outer circle. On either hole \(|z^2-1|\ge7/16\) and \(|256-z^2|\le256+25/16<258\). Thus the sum is at most \(\log37\) there. Comparing with \(h_+\) and differentiating inward at \(4\) gives
\[
 -f_+(4)=-\partial_x h_+(4)
        \ge \frac{17}{30\log37}>\frac{17}{120}.
\]
In the open real segment approaching \(4\) from below the derivative of the sum tends to \(-8/(256-16)-8/(16-1)=-17/30\). The final bound uses \(\log37<4\).

Use these real anchors to define
\[
 A(z)=\frac{f_-(z)^2}{f_-(0)^2},\qquad B(z)=\frac{f_+(z)^2}{f_+(4)^2},
 \qquad P_0=A-A(4)B,\quad P_4=B.
\]
Since \(A(0)=1\), \(B(0)=0\) and \(B(4)=1\), the actual Hopf coefficient is
\[
 \Phi(z)=\Phi(0)P_0(z)+\Phi(4)P_4(z).
\]
The elementary bound \(0\le A(4)<3\) controls the subtraction. In fact \(h_-\) has an odd harmonic reflection across \(|z|=4\) of magnitude at most \(1\) on the unit disk centered at \(4\). This disk and its inversion avoid both holes. The center derivative bound for a bounded harmonic function gives \(|f_-(4)|\le4/\pi\). Combine this with \(f_-(0)>5/6\) and \(\pi>3\). The normalizing denominators remain positive under any sufficiently accurate interval evaluation.

## Propagating verified harmonic measure errors

If a harmonic comparison \(\widetilde h_\pm\) has the same zero outer trace and its cuff residual is bounded by \(\epsilon_\pm\), the maximum principle gives \(|h_\pm-\widetilde h_\pm|\le\epsilon_\pm\) on \(F\). This bound persists on the unit disk at \(4\) after odd reflection of the difference. The derivative errors at \(4\) are then at most \(4\epsilon_\pm/\pi\), and the disk of radius \(1/2\) at \(0\) gives at most \(8\epsilon_\pm/\pi\) there. On each native footprint, every point has distance at least \(\rho=87/128\) to the planar cuffs. The harmonic disk derivative estimate on radius \(\rho/2\) gives
\[
 |f_\pm-\widetilde f_\pm|\le\frac{8\epsilon_\pm}{\pi\rho},
 \qquad
 |f_\pm'-\widetilde f_\pm'|\le\frac{16\epsilon_\pm}{\pi\rho^2}.
\]
For the second estimate use the first bound uniformly on the disk of radius \(\rho/2\) about the footprint point, then Cauchy's estimate on that disk. Smaller radii followed by a limit cover disks tangent to a cuff. Substitution in \(A,B,P_0,P_4\) gives rigorous value and first-jet intervals for the basis by ordinary interval arithmetic with the stated positive denominators. The companion multipole certificate supplies the cuff comparison inputs in the original circles. These basis estimates leave the nonlinear two-length root and scalar form to be evaluated. [Harmonic-measure multipole certificate][measures] · [Native footprint][footprint] · [Three-cuff Rayleigh test][rayleigh]


## Independent replay of the two interior anchors

The [multipole certificate][measures] uses a different scaling of each harmonic measure and the interior anchors \(0,2\). I re-derived the right-circle log modes and multipole expansion at \(z=1+\zeta/4\). At \(|\zeta|=4\), \(|z|\le2\), \(|16-z|\ge14\), \(|z+1|\ge1\) and \(|16+z|\ge16\), which give \(28^{-k},4^{-k},32^{-k}\) for the three regular terms. The log terms have Taylor arguments of absolute values at most \(1/15,1/17,1/2\). Summing the Cauchy bounds above degree 24 gives the stated \(1/(3\cdot4^{24})\) coefficient. Parity carries the right-cuff error to the left cuff. The \(4\eta,16\eta\) first and second complex derivative errors follow from Fourier coefficient bounds on radius-\(1/2\) disks. Replaying `python3 -B papers/master/numerics/native_harmonic_measures.py` passed all rational residual and anchor checks. The displayed upper residual magnitudes were \(1.232\cdot10^{-15}\) and \(1.221\cdot10^{-15}\) for the even and odd potentials. The code and certificate read at Git blobs `2f2a755b2751` and `8de7ad20872d`.

At the framed sphere poles the planar displacement vanishes. The literal right-circle letter \((1-\cos 2\pi t,-\sin 2\pi t)\) reaches \(0\) and \(2\), and the prescribed speed changes preserve its range. Thus both points are covered by \(E<28\), hence \(|\Phi|<7\). The anchor intervals give \(7/(1.92)^2<1.9\) and \([7+1.9(0.765)^2]/(1.377)^2<4.3\) by rational cross multiplication. This verifies the stated search rectangle for the unnormalized coordinates of the certificate. [Actual letter paths][assembly] · [Cuff residual, computation and search rectangle][measures]

[scalar]: NATIVE_HARMONIC_DATA_20261127.md
[footprint]: HARMONIC_MARKING_ENCLOSURE_20261127.md
[measures]: HARMONIC_MEASURE_CERTIFICATE_20261127.md
[rayleigh]: THREE_CUFF_RAYLEIGH_20261127.md
[assembly]: ../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md
