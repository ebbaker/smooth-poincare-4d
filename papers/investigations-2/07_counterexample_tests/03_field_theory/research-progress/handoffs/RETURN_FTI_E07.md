# FTI-E07 · Gerig's normal first jet and marked framing

28 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E execution on checkout `7c6bbab9a0a6`. Actual serving
variant and reasoning effort are unavailable. The request specified
`gpt-6.2-sol`/ultra. Inputs are [request r1](REQUEST_FTI_E07.md)
(`e7d036708b1b5598`, SHA-256 prefix) and the [B01 cut](../../brainstorm/notes/B01_ACTUAL_CUT.md)
(`bd923836031876e2`). The calculation concerns the smooth real Riemannian
tube at the retained zero circle, with the complex orientation on
\(\mathbb C^2\) and self-dual chirality.

## Normal derivative in the B01 frame

Set \(E=e^{is}\) and \(a=\sqrt\epsilon\). The visual reading of the
displayed formula gives
\[
 f=|z|^2-|w|^2-a^2,\qquad B=Rw-\bar z\bar w,\qquad
 \omega_\epsilon=f\omega_{\rm std}-\operatorname{Im}(B\,dz\wedge dw).
\]
The coefficient in the antiholomorphic wedge is \(\overline B=R\bar w-zw\)
with the opposite sign inside the \(i/2\) brackets. On the B01 tube the
modified form is \(\omega=\kappa\omega_\epsilon\), where \(\kappa\) is the
nonzero real constant from the example. The passage specifies the
constant-multiple modification without giving a numerical multiplier.
[Gerig, arXiv:1905.10938v3, Example 1.7, p. 3](https://arxiv.org/pdf/1905.10938v3#page=3)

Use \((T,n_1,n_2,n_3)=(iE,-E,1_w,i_w)\) at \(p=(aE,0)\), with the
angle \(s\) increasing counterclockwise. Both displayed real two-form
terms are Euclidean self-dual. For a normal vector
\(v=\sum_j x_jn_j\) at \(p\),
\[
 df(v)=-2ax_1,\qquad dB(v)=R(x_2+ix_3)-aE^{-1}(x_2-ix_3).
\]
Since the form vanishes at \(p\), its covariant derivative there is the
intrinsic derivative of the section. The map in the question sends \(v\)
to the normal covector \((\nabla_v\omega)(T,\cdot)\). In the chosen frame
its components for \(\omega_\epsilon\) are \(-2ax_1\),
\(-\operatorname{Re}(E\,dB(v))\), \(\operatorname{Im}(E\,dB(v))\), using
\(dz(T)=iE\). With the Euclidean normal metric the actual matrix is
\[
 M_{\omega,T}(s)=\kappa M_0(s),\qquad
 M_0(s)=
 \begin{pmatrix}
 -2a&0&0\\
 0&a-R\cos s&R\sin s\\
 0&R\sin s&a+R\cos s
 \end{pmatrix}.
\]
It is symmetric and trace free. The tangent derivative vanishes. For
\(R>a>0\) the unscaled eigenvalues in this orientation are
\(-2a,a-R,a+R\). The unit tangent giving two positive eigenvalues is
\(\widehat T=-\operatorname{sgn}(\kappa)T\), clockwise for positive
\(\kappa\). The canonical matrix, still expressed in the B01 normal
basis, is \(-|\kappa|M_0\). Its eigenvalues are
\[
 |\kappa|\big(2a,\ R-a,\ -(R+a)\big).
\]
In particular the derivative has rank three, with image equal to the
Euclidean self-dual three-plane. This is the positive three-plane that
determines the conformal class at the zero.

## Half-angle charts and spin lifts

Use the active convention
\(R_1(\theta)e_2=\cos\theta\,e_2+\sin\theta\,e_3\) and
\(R_1(\theta)e_3=-\sin\theta\,e_2+\cos\theta\,e_3\). Then
\[
 M_0(s)=R_1(-s/2)\,\operatorname{diag}(-2a,a-R,a+R)\,R_1(-s/2)^{-1}.
\]
The canonical negative line in the Euclidean framing is
\[
 L_s^- = R_1(-s/2)\mathbb R e_3
       = \mathbb R\big(\sin(s/2)n_2+\cos(s/2)n_3\big).
\]
The displayed unit vector comes back with sign minus. The line has
winding number \(-1\) in \(\mathbb P(\operatorname{span}(n_2,n_3))\),
with the angular orientation set by \(R_1(\theta)\), and
\(\langle w_1(L^-),[C]\rangle=1\).

Write \(A=R_1(\pi)=\operatorname{diag}(1,-1,-1)\). Both maps
\[
 \tau_\pm(s,x)=\tau(s,R_1(\pm s/2)x)
\]
descend to diffeomorphisms from the twisted disk bundle, since
\(\tau_\pm(2\pi,x)=\tau_\pm(0,Ax)\). The minus chart sends the marked
Honda axis to \(L^-\). The axis under the plus chart in B01 has winding
number \(+1\) in the same projective line. The plus chart pulls the
actual marking back to \(R_1(-s)\mathbb R e_3\) in interval coordinates.
In particular
\(\tau_- = \tau_+\circ H\), where \(H(s,x)=(s,R_1(-s)x)\) is periodic
and its normal rotation represents the generator of \(\pi_1 SO(3)\).

With Clifford convention \(e_j^2=-1\), the lift from the identity is
\(\widetilde R_1(\theta)=\exp(\theta e_2e_3/2)\). The periodic B01
Euclidean frame itself lifts with terminal sign minus, since its
\(z\)-plane rotates by \(2\pi\) as \(s\) increases. The lifted interval
frame for \(\tau_\pm\) is the product of this lifted Euclidean frame
and \(\widetilde R_1(\pm s/2)\), in that order. Its terminal-to-initial
spin coordinate transition is therefore
\[
 g_\pm=-\widetilde R_1(\pm\pi),\qquad
 g_-=+\widetilde R_1(\pi),\qquad g_+=-\widetilde R_1(\pi).
\]
The opposite signs record the change of spin coordinates under \(H\) on
the same ambient spin restriction. These formulas use increasing B01
angle \(s\). Traversing the circle in the opposite direction inverts
both transitions.

## Comparison with Honda's first jet

Honda's twisted flat model has the same terminal-to-initial ball map
\(A\), and its normal operator in the positively oriented product frame
is \(\operatorname{diag}(1,1,-2)\). The larger-to-smaller positive
eigenvalue ratio is \(1\) for Honda and \((R-a)/(2a)>1\) for Gerig in
the fixed range \(R>3a\), independently of \(\kappa\).
[Honda, author revision of 13 January 2004, eq. (3), Lemma 4 and Theorem 6(B), pp. 4–6](https://www.math.ucla.edu/~honda/moser.pdf#page=4)

For a smooth change of coordinates \(F\) taking one zero to the other,
pullback of the first derivative applies \(DF\)
to its three vector slots. If the jets agree, \((DF)^*\) takes the
target derivative image onto the source derivative image. These images
are positive for the wedge pairing, which forces \(DF\) to preserve
orientation. To see that \(DF\) must be conformal there, use oriented
singular-value frames.
Preserving the planes gives \(\lambda_0\lambda_1=\lambda_2\lambda_3\),
\(\lambda_0\lambda_2=\lambda_1\lambda_3\) and
\(\lambda_0\lambda_3=\lambda_1\lambda_2\) for the positive singular
values. They are all equal. Thus \(DF=cQ\), and using the canonical
unit tangents the normal operator is transported by orthogonal
conjugation and multiplication by \(c^3\). A smooth nonzero scalar
factor at the zero also scales both positive eigenvalues by the same
absolute factor.

The unequal ratios obstruct identification of the original first jets
even by arbitrary smooth coordinates with a nonzero scalar factor. The
minus chart gives the smooth marked tube identification and its spin
transition. Honda's Theorem 7 relates model representatives to an input
form by a deformation, which can change the normal first jet.
[Honda, Theorem 7 and its proof, pp. 6–7](https://www.math.ucla.edu/~honda/moser.pdf#page=6)
