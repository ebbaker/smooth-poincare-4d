# WIN-E04 · Independent count replay

28 November 2026 UTC, 27 November in America/New_York. Prepared for Edward
B. Baker III with OpenAI Codex assistance. The [non-author dispatch](../research-progress/handoffs/REQUEST_E04_COUNT_R1.md)
specifies gpt-6.2-sol, ultra. Actual serving model and effort unavailable.
Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. Dispatch SHA-256
prefix `fb0dfd6349129e72`. The dispatch names `88f080209ca78c3e` for
[E03_COUNT](../notes/E03_COUNT.md). The working-tree text actually read and
replayed had SHA-256
`6900b5f7c424267d1ec5677f8c1c3c3666824903b4b8b0e82c3b7fe7b3256624`.
The [register](../research-progress/REGISTER.md) owns the evidence status.

**Disposition.** The marked end conversion, cutoff, spatial jet and
minimum replay as a deduction using POLE A1/A2/E04, Gerig's Theorem 1.6
with the collar used in Appendix A, and Perutz's relative endpoint
theorem. I recomputed the strict positivity of the model jet at the
regular endpoint. Gerig's relative Honda transversality and Perutz's
compact support remain primary imports. There are literal discrepancies
in both source expositions, with a limit on the proof check of Perutz's
stationary collar recorded below.

## Marked existence from Gerig

I checked Chris Gerig, *No homotopy 4-sphere invariants using ECH = SWF*,
Algebr. Geom. Topol. **21**(5), 2543–2569 (2021), DOI
`10.2140/agt.2021.21.2543`, in the author's version
`arXiv:1905.10938v3` (9 November 2020), §1, Theorem 1.6 and Appendix A,
printed pp. 1–2 and 17–18. Section 1 starts with the smooth homotopy sphere,
removes a small standard ball, and completes along its boundary. Appendix A
prescribes the round cross-section, the contact form and the growing harmonic
model on this cylinder before introducing its relative transversality
argument. Theorem 1.6 yields an exact near-symplectic form with standard
tail. For the marked use it is the appendix construction on the chosen
cylinder that identifies the end. An arbitrary diffeomorphism of the open
puncture would supply no relation to the original compactifying chart.
[Theorem 1.6 and Appendix A](https://arxiv.org/pdf/1905.10938#page=2)

Choose a positive chart \(y\) at the marked point and delete a round
coordinate ball in it. With a fixed orthogonal reflection \(Q\), the
coordinates \(z=Qy/|y|^2\) on the deleted punctured ball are positively
oriented for the manifold. Attach the product using its angular
coordinate. For the standard \(\lambda\) on the unit \(S^3\) and
\(r=|z|=Re^t\), the standard form in \(z\) is
\[
\Omega_0=d(r^2\lambda)=R^2d(e^{2t}\lambda).
\]
The flat metric is \(r^2(dt^2+g_{\mathrm{rd}})\), and hence this model
is self-dual for the unit round product in \(t\). The appendix's
\(d(e^s\lambda)\) is the same form up to \(R^{-2}\) when \(s=2t\).
The product metric then has axial term \(ds^2/4\). The formula with
the unit axial metric \(ds^2\) would require \(e^{2s}\). This
normalization is a radial coordinate choice in the given collar.

In Appendix A the correction to the growing model is exact on the
end. Its primitive is a one-form on the cylinder, as opposed to a
single one-form on the cross-section as in the displayed type of
\(\alpha\). For example write a small closed cylindrical correction as
\(\xi=dt\wedge b(t)+a(t)\). Then \(d_{S^3}a=0\) and
\(\partial_t a=d_{S^3}b\). Choose a coclosed cross-section primitive
\(\gamma(t)\) of \(a(t)\) by Hodge inversion on the round sphere.
The one-form \(b-\partial_t\gamma\) is exact since \(H^1(S^3)=0\);
write it as \(d_{S^3}h\) with mean-zero \(h\). Then
\(\xi=d(\gamma-h\,dt)\). The fixed cross-section elliptic estimates
bound this primitive and its needed derivatives in terms of the
decaying correction. Cutting it off sufficiently far out gives a
small error relative to the growing positive model on the transition.
On the core Gerig's pre-cutoff self-dual harmonic form is transverse,
so its spatial derivative at every zero surjects onto its
wedge-positive self-dual plane. The argument imports the relative
Honda step in the form stated by Gerig's sketch. The resulting exact
end in \(z\) is a positive constant multiple of \(\Omega_0\), hence in
\(x=y/|y|^2\) it is Euclidean self-dual for the inherited orientation
because \(Q\) is an isometry between the corresponding oriented
Euclidean spaces. Thus E04 applies on the original compactification,
with smooth compact representative \(\delta_y\) near \(p\), and A1
gives the claimed admissible projective pole. No additional
identification of the open or compact smooth type enters this step.
[Gerig, Appendix A](https://arxiv.org/pdf/1905.10938#page=17) · [POLE E04](../../../01_chiral_transfer_and_pole_forms/notes/E04_REALIZATION.md)

## Relative merger and strict endpoint jet

I checked Tim Perutz, *Zero-sets of near-symplectic forms*,
J. Symplectic Geom. **4**(3), 237–257, DOI
`10.4310/JSG.2006.v4.n3.a1`, author's `math/0601320v2` (posted
15 January 2007), Definitions 1.1 and 1.3, Theorem 1.4, Lemma 3.1,
§4 including (8), and Proposition 4.4 and Remark 4.5. Theorem 1.4(2)
states relative support in a ball on a connected oriented
four-manifold, using two distinct circles when decreasing the count.
The stated construction uses short arcs and an embedded connecting
arc off the rest of the zero set. These choices and their regular
neighborhood can lie in the interior of one connected compact
truncation. The insertion region and the arc-normalization supports are
chosen in this interior. The output is taken at the regular endpoint
of the one-handle change, beyond the parameter where the spatial rank
drops. The quoted theorem gives the relative support used here.
[Perutz, Theorem 1.4 and `3–4](https://arxiv.org/html/math/0601320v2)

The rank-three condition in the abbreviated near-positive definition
and nonnegative wedge square alone permit a degenerate quadratic form
on the image. In (8), with \(c_0=\delta\epsilon/2\), direct differentiation
at \(x_2=x_4=f=0\) and \(df\ne0\) gives the basis
\[
\delta\,dx^{12}+dx^{34},\quad
\delta\,dx^{13}+dx^{42},\quad
-\delta\,dx^{14}-(1+c_0f_3)dx^{23}+c_0 f_1\,dx^{12}.
\]
The \(df\) direction contributes \(c_0\) times the second vector.
The wedge matrix divided by \(2\delta\,dx^{1234}\) has diagonal
\((1,1,1+c_0 f_3)\) and off-diagonal entry \(c_0 f_1/(2\delta)\) in
positions \(13,31\). With the uniform \(C^1\) bound in Lemma 4.3 the
small parameter \(\epsilon\) can be chosen to make both corrections
smaller than \(1/4\). The matrix is then positive definite. This jet
calculation concerns the model at the new regular zero arcs. The old
strict jets persist by orientation-preserving pullback and by the
aligned positive-plane interpolation in Lemma 3.1. In the invoked
relative insertion the collar adjustment takes place away from the
zeros. [Perutz, Lemma 3.1 and (8)](https://arxiv.org/pdf/math/0601320v2#page=8)

**Proof-reading limit.** In Lemma 4.3 the smaller second interval in
the stated support rectangle would keep \(x_3=\pm1\) fixed by
continuity. The proof and §4.2 use the larger square, as recorded by
LINE E03. At \(t=-1\), the form in (8) is
\(D_\delta^*\omega^{\delta\epsilon f}\) with the §4.1 definition of
\(\omega^f\). Its amplitude must match that choice in the preceding
embedding description. Also the particular primitive \(\alpha\)
printed in §4.2 restricts to zero at \(x_4=0\) on the normal cylinder
and therefore fails the stated contact test there. A primitive of
\(D_\delta^*\zeta\) that is contact on that cylinder is
\(\tfrac{\delta}{2}(x_4^2-x_2^2)dx_1-x_2x_4dx_3\), obtained by half
the contraction with the normal Euler field. The claimed stationary
primitive of \(f_t\,dx^{13}\) also needs justification beyond
contracting along the indicated normal path, which annihilates
\(f_t\,dx^{13}\). These observations check the literal formulas, with
the supported endpoint and collar statement taken as the theorem
import. Taubes's original paper gives an independent local melding
endpoint in §3, and his Theorem 2 states the prescribed positive
count in the asymptotically standard class. That source is another
route to the endpoint claim at the level of its assumptions.
[Perutz, §4.2](https://arxiv.org/html/math/0601320v2#S4.SS2) · [LINE E03](../../../03_lines_and_broken_fibrations/research-progress/handoffs/LINE_E03_RETURN.md) · [Taubes, pp. 558, 561–562](https://archive.intlpress.com/site/pub/files/_fulltext/journals/mrl/2006/0013/0004/MRL-2006-0013-0004-a006.pdf)

## Cutoff, realization, and minimum

A1 writes any admissible pole as \(\beta+da\) in the inverted
normal chart, with \(a=O(r^{-1})\), \(da=O(r^{-2})\). The replacement
\(\beta+d(\chi_Ra)\), with the cutoff derivative \(O(R^{-1})\) on
\(R\le r\le 2R\), changes only a distant region where its flat-norm
distance to \(\beta\) is \(O(R^{-2})\). The two-form stays in the open
positive wedge-square cone there. The original zeros and their jets
are fixed, and compactness and transversality imply finitely many
circles. Perutz's endpoint iterates \(n-1\) times when \(n>0\), with
zero kept when the input is zero-free. All operations take place on
the original puncture and preserve the exact tail. E04 restores a
smooth compact conformal class by its compatible positive-plane
construction in the original chart, and A1 uniqueness gives the
pole with the same numerical leading coefficient. The strict jet
criterion gives the required transversality in the resulting class.
[A1](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md) · [E04](../../../01_chiral_transfer_and_pole_forms/notes/E04_REALIZATION.md)

The domain is nonempty by the marked existence argument. The minimum
of the nonnegative integer counts is thus attained and is at most one.
A minimum zero means an actual zero-free pole, so the replayed A2 gives
a diffeomorphism of the original closed sphere with \(S^4\). On the
standard sphere itself the round conformal class yields constant
nonzero self-dual forms in oriented stereographic coordinates and
zero count by A1. Either orientation is accommodated by an orientation
matching stereographic chart or by composing the pullback with a
standard reflection. Any other smooth type, if it exists, has positive
count for every admissible triple by A2, and there is an admissible
count-one triple by the existence and relative endpoint arguments.
This is an existential recognition reformulation across varied metrics.
A numerical lower bound over that domain or generic transversality
in a specified class would need another argument.
[A2 and its recheck](../../../01_chiral_transfer_and_pole_forms/notes/E02_A2.md) · [A2 replay](../../../01_chiral_transfer_and_pole_forms/reviews/E02_REPLAY.md)
