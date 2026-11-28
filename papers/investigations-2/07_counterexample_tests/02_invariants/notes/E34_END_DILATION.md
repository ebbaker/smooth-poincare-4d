# WIN-E34-T · The one-circle period under end dilation

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen E34-T request](../research-progress/handoffs/REQUEST_E33_E34_COMPARISONS_R1.md)
specifies GPT-6.2 Sol/ultra dispatch. Exact serving model and effort are
unavailable. Checkout `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`.
The request, POLE A1 and POLE E04 have SHA-256 prefixes `67cd9a13d21b`,
`db13563024da` and `0dc61bfb07a67`. This is a direct transformation
calculation for one supplied input.

**Result.** With the original puncture, signed constant end coefficient
and coordinate scale fixed, dilation of the outer end by \(L\geq1\),
followed by pullback and multiplication by \(L^{-2}\), gives another
admissible one-circle pole form. Its signed primitive period is
\(P_L=L^{-2}P\). The infimum of the absolute period within this family
is zero.

## Marked input and construction

Let \(\Sigma\) be a closed connected oriented smooth homotopy four-sphere,
\(p\in\Sigma\), and \(X=\Sigma\setminus\{p\}\). Use an oriented normal
chart \(y\) for a smooth compact Riemannian metric \(g\) at \(p\), and
write \(x=I(y)=y/|y|^2\), \(r=|x|\). Let \(\omega\) be a smooth closed
\(g\)-self-dual two-form on \(X\) with exactly one transverse zero circle
\(Z\), and \(\omega=\beta\ne0\) for all sufficiently large \(r\), where
\(\beta\) is constant. The numerical \(x\)-orientation is opposite to the
orientation inherited from \(X\). Thus \(\beta\) is Euclidean self-dual
in the inherited orientation and anti-self-dual in the numerical
orientation. In A1 the corresponding residue \(\eta\in\Lambda^-_{g,p}\)
has the numerical coefficients of \(\beta\) in the \(y\)-frame. If the
starting form is instead supplied with just the intrinsic near-symplectic
conditions and the indicated tail in a fixed smooth oriented chart,
POLE E04 realizes it with \(g=\delta_y\) near \(p\). Its hypotheses are
closedness, positive square off \(Z\), a wedge-positive rank-three zero
jet, and Euclidean self-duality of the constant coefficient in the
inherited orientation. [A1 §§1, 4](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md) · [E04 fixed-end criterion](../../../01_chiral_transfer_and_pole_forms/notes/E04_REALIZATION.md#fixed-end-criterion)

Choose an orientation of \(Z\) and a compact smooth singular two-chain
\(C\) with \(\partial C=Z\) as an oriented cycle. Excision for the
pair \((\Sigma,X)\) gives the local relative groups of a four-ball
punctured at its center, concentrated in degree four. The pair sequences
and the homotopy-sphere hypothesis give \(H_1(X;\mathbb Z)=0\) and
\(H^1(X;\mathbb R)=H^2(X;\mathbb R)=0\). The first gives a finite
spanning chain in smooth singular homology. The second gives a smooth
primitive \(\alpha\) with \(d\alpha=\omega\), unique up to a smooth exact
one-form. Stokes gives the choice-independent period
\(P=\int_Z\alpha=\int_C\omega\) with this orientation.

Choose \(R\) so the compact core through \(r=R\) contains \(Z\) and the
support of \(C\) in its interior and \(\omega=\beta\) for \(r\geq R\).
Take a smooth nondecreasing radial cutoff \(\chi\) equal to zero through
\(R\) and one from \(2R\) onward. Define \(F_L\) as the identity on the
core and on the end by
\[
F_L(x)=\bigl(1+(L-1)\chi(r)\bigr)x.
\]
The radial derivative is \(1+(L-1)(\chi+r\chi')\geq1\) and the angular
scales are positive. The radial function is onto the end, which proves
that \(F_L\) is a smooth orientation-preserving diffeomorphism. For
\(r\geq2R\), \(F_L(x)=Lx\). In the original compactifying chart this means
\(I\circ F_L\circ I(y)=L^{-1}y\) for small \(|y|\). Thus \(F_L\) extends
to an orientation-preserving smooth diffeomorphism \(\bar F_L\) of the
same compactification fixing \(p\).

## Compact self-duality, residue and zero set

Set
\[
\omega_L=L^{-2}F_L^*\omega,\qquad
c_L=\bar F_L^*[g],\qquad g_L=L^2\bar F_L^*g.
\]
The class \(c_L\) is smooth Riemannian on the closed \(\Sigma\).
Exterior differentiation commutes with pullback and the factor is
constant, so \(d\omega_L=0\) on \(X\). The star commutes with the
oriented pullback and is conformally invariant on two-forms in four
dimensions. Hence \(\omega_L\) is \(g_L\)-self-dual. Its zero set is
\(F_L^{-1}(Z)=Z\). Near \(Z\), \(F_L\) is the identity, \(c_L=[g]\),
and the intrinsic derivative on the normal bundle is multiplied by
\(L^{-2}>0\). This preserves rank three and the positive image, so the
same single circle is transverse for each finite \(L\).

On the outer end, \(F_L^*\beta=L^2\beta\), so \(\omega_L=\beta\) there.
Near \(p\), \(g_L(y)=(g_{ij}(y/L))\) as a coordinate matrix, so its
value at \(p\) is the original metric value. More precisely, for
\(L^2g\) the corresponding orthonormal normal coordinates are \(Ly\),
and composing them with the isometry \(\bar F_L\colon(\Sigma,g_L)\to
(\Sigma,L^2g)\) gives the original \(y\) near \(p\). Thus the end equals
the same constant in the same inverted normal coordinates. The exact
formula in \(y\) is \(\rho^{-4}R_y^*\eta\), with \(\rho=|y|\) and
\(R_y=\mathrm{Id}-2\hat y\otimes\hat y\). A1 uniqueness identifies
\(\omega_L\) with the normalized pole form for \((g_L,p,\eta)\), with
the same residue tensor in the same orthonormal frame.
[A1 §§1, 4](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md)

## Period and scale

The primitive \(\alpha_L=L^{-2}F_L^*\alpha\) gives
\[
P_L=\int_Z\alpha_L=L^{-2}P,
\qquad
\int_C\omega_L=L^{-2}\int_C\omega.
\]
In particular, \(\inf_{L\geq1}|P_L|=0\). If \(P\ne0\), the sign is
constant and the infimum is unattained at finite \(L\). The separate
LINE result supplies nonvanishing when its marked-cap hypotheses apply.
The transport calculation itself works whether or not the input period
is known to be nonzero. [LINE one-circle period](../../../03_lines_and_broken_fibrations/research-progress/handoffs/TO_ZERO_SINGLE_CIRCLE_PERIOD_20261127.md)

A projective residue \([\eta]\) permits every nonzero real multiple of
the normalized form, so an absolute period requires an amplitude
convention. With the coordinate scale fixed, one can require
\(|\beta|_{\delta_x}=1\), or equivalently use the projectively
well-defined magnitude \(|P|/|\beta|_{\delta_x}\), which also scales
by \(L^{-2}\) in this family. Specifying only \((c,p,[\eta])\)
provides no absolute scale for that number. For example, replacing
\(g\) by \(a^2g\), \(a>0\), changes the corresponding normal
coordinates to \(ay\) and the inverted ones to \(a^{-1}x\). For a
fixed form its numerical leading coefficient then has norm
\(a^2|\beta|_{\delta_x}\). Renormalizing the residue to unit norm
rescales the absolute period by \(a^{-2}\). Signs of lifted residues
and the orientation of \(Z\) are separate choices for a signed period.
[A1 §4](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md#4-optimal-order-and-independence-of-the-representative)

The zero infimum excludes a strictly positive uniform lower bound for
the absolute period under these marked conformal changes whenever an
input exists. The conclusion is conditional on one supplied exact-ended
one-circle form. Every finite member still has its original transverse
circle, so the infimum supplies no endpoint with a circle deletion.
