# The compact radial Lagrangian cobordism · SP4-TWA-E05

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request v1](../research-progress/handoffs/E05_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and individually
configured GPT-6.2 Sol/ultra helper. Actual backend serving variant and
reasoning effort were unavailable. HEAD was
`280376dd7a1820fa2878d0ab0ee2e639facb2eeb`, and all ten frozen working-tree
input digests matched at inspection. This checks the single geometric
construction specified in [B02](../brainstorm/notes/B02_COBORDISM.md).

## Radial phases and energy

Use the oriented flat Riemannian spin product \([0,2]\times T^3\) with
periodic spin structure and \(\operatorname{Vol}(T^3)=1\). For a unit
parallel positive half-spinor \(\psi_0\), the radial fields are
\(e^{q(t)}\psi_0\). The normalized action \(S=J_g^4\) has radial
Lagrangian \(\ell(v)=(9/16)v^4=(K/4)v^4\), where \(v=\dot q\) and
\(K=9/4\). The momentum is \(p=\ell'(v)=Kv^3\). For each affine radial
solution the two outward covectors are \((-p,p)\), so the incoming
phase point after the incoming sign reversal and the outgoing phase
point both use \(p=Kv^3\). The two-cylinder composition preserves this
same velocity and phase momentum, including \(v=0\).
[E02 normalization and signs](E02_FLAT_TORUS.md) · [E04 composition](E04_GLUING.md)

The Legendre energy and coefficient are

\[
H(v)=pv-\ell(v)=\frac{3K}{4}v^4=\frac{27}{16}v^4.
\]

In phase momentum coordinates this is
\(H=\tfrac34 K^{-1/3}|p|^{4/3}\), whose first derivative is the real
cube-root velocity and whose second derivative is singular at zero.
The prescribed family uses the smooth velocity \(v=\sin\theta\) with
\(\theta\in S^1=\mathbb R/2\pi\mathbb Z\), so each phase trajectory is
\(\gamma_t(\theta)=(q_t,p)\) with

\[
q_t=\cos\theta+(1+t)\sin\theta,\qquad p=K\sin^3\theta,
\qquad 0\le t\le2.
\]

Take the compact connected phase torus \(N=(\mathbb R/16\mathbb Z)^2\)
with \(\omega_N=dq\wedge dp\) descended from the universal cover. The
inequalities \(|q_t|\le\sqrt{1+(1+t)^2}\le\sqrt{10}<8\) and
\(|p|\le K<8\) put every point in the injective chart \((-8,8)^2\).
Equality of the momentum coordinates there implies equality of
\(\sin\theta\), since the real cube is injective. Equality of \(q_t\)
then implies equality of \(\cos\theta\), so \(\gamma_t\) is injective.
Its derivative is

\[
\partial_\theta\gamma_t=
\big(-\sin\theta+(1+t)\cos\theta,\ 3K\sin^2\theta\cos\theta\big).
\]

When \(\sin\theta=0\), the first component is \((1+t)\cos\theta\ne0\).
When \(\cos\theta=0\), it is \(-\sin\theta\ne0\). At every other angle
the second component is nonzero. Compactness of \(S^1\) now gives an
embedded circle \(C_t\) in \(N\). Each such circle is a closed
Lagrangian of the symplectic surface. The cobordism ends are precisely
\(C_0\) and \(C_2\).

## Suspension and split form

Use planar coordinates \((s,y)\) and \(ds\wedge dy\). Let the fixed
bump \(\beta(s)\) be \(\exp[-1/((s-1/4)(3/4-s))]\) on \((1/4,3/4)\)
and zero elsewhere. It is smooth with all derivatives flat at the two
cutoff points. Its integral on \([0,1]\) is positive and
\(\tau(s)=2\frac{\int_0^s\beta(\sigma)\,d\sigma}{\int_0^1\beta(\sigma)\,d\sigma}\)
is smooth, nondecreasing and
takes values in \([0,2]\). It equals zero on \([0,1/4]\) and two on
\([3/4,1]\). With the chosen strip the map is

\[
\Phi(s,\theta)=\left(s,\ 1-\tau'(s)\frac{3K}{4}\sin^4\theta,\
                     q_{\tau(s)}(\theta),\ K\sin^3\theta\right),
\qquad (s,\theta)\in[0,1]\times S^1.
\]

The first coordinate forces equal \(s\) for two points with equal image.
At that slice, injectivity of \(\gamma_{\tau(s)}\) forces equal \(\theta\).
The \(s\)-derivative has first component one and the \(\theta\)-derivative
has first component zero and a nonzero \(N\)-component, also at zero
velocity and at the two extrema of the velocity. Thus \(\Phi\) is an
injective immersion up to its boundary. The strip domain of the map
is compact and the target Hausdorff, so the image is an embedded compact
smooth cylinder with the two indicated boundary circles.

On the source \(p_s=0\), \(q_s=\tau'\sin\theta\) and
\(p_\theta=3K\sin^2\theta\cos\theta\). Therefore

\[
\begin{aligned}
\Phi^*(dq\wedge dp)&=3K\tau'\sin^3\theta\cos\theta\,ds\wedge d\theta,\\
\Phi^*(ds\wedge dy)&=-3K\tau'\sin^3\theta\cos\theta\,ds\wedge d\theta.
\end{aligned}
\]

These identities hold at all angles and throughout the product collars.
Their sum vanishes, and the image has dimension two in the
four-dimensional split symplectic product. Thus the image is Lagrangian.

## Product collars, extension and arrow

On \([0,1/4]\) the image is \([0,1/4]\times\{1\}\times C_0\). On
\([3/4,1]\) it is \([3/4,1]\times\{1\}\times C_2\). These are the
literal product-end restrictions of Definition 2.1.1 for one end on
each side, both at the required level \(1\). In Biran–Cornea's notation
the positive end is the source, so the elementary Lagrangian cobordism
has arrow \(C_2\leadsto C_0\). Radial time increases from \(C_0\) to \(C_2\).
[Biran–Cornea, Definition 2.1.1, pp. 296–297](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf#page=2)

Extend \(\tau\) to all real \(s\) by its constant left and right values.
The same formula gives a smooth boundaryless Lagrangian embedding
from \(\mathbb R\times S^1\) into \(\mathbb R^2\times N\). For any compact
subset of the ambient product, the preimage is closed and lies in the
compact product of a bounded closed \(s\)-interval with \(S^1\). This proves
properness. The image over any closed bounded \(s\)-interval is compact
for the same reason. The extension is exactly cylindrical for
\(s\le1/4\) and \(s\ge3/4\) at height \(1\), satisfying the slab and end
conditions of §4.1.
[Biran–Cornea, §4.1, pp. 306–307](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf#page=12)

## Chart period and relative area

On \(\mathbb R^2\times(-8,8)^2\) use the primitive
\(\lambda=-y\,ds-p\,dq\) of the split symplectic form. Its restriction
to a constant-\(s\) circle, with \(t=\tau(s)\) and increasing \(\theta\),
has period

\[
\oint\Phi^*\lambda
=-K\int_0^{2\pi}\sin^3\theta
      \big(-\sin\theta+(1+t)\cos\theta\big)\,d\theta
=\frac{3\pi K}{4}=\frac{27\pi}{16}.
\]

The mixed term is an integral of a derivative of \(\sin^4\theta\).
The \(\sin^4\theta\) integral is \(3\pi/4\). All primitives on the
contractible product chart differ by an exact form, so this period
obstructs exactness for every chart primitive. On the full phase torus,
\(\int_N\omega_N=16^2\), which also precludes a global primitive of
the split form by restricting to a torus slice.

For the two end pairs \((N,C_i)\), \(i=0,2\), and for the cylinder pair
in the split product, the ambient second homotopy group is zero and
the circle generator of the Lagrangian lies in the contractible chart.
The relative homotopy sequence identifies the relative second homotopy
group with \(\mathbb Z\) via the boundary circle. For the cylinder use an
end collar with constant planar coordinates along the spanning disk.
In the phase chart a spanning disk for \(C_t\) is given on the unit disk
by \((u,w)\mapsto(u+(1+t)w,Kw^3)\), which has the same chart bound as
the boundary. Oriented by increasing \(\theta\) on its boundary, the disk
has area \(27\pi/16\) by Stokes's theorem.

In the standard oriented chart trivialization, the angle of the tangent
of \(C_t\) winds once positively. Indeed its unique upward vertical
tangent occurs at the first-quadrant solution of
\(\tan\theta=1+t\). There the derivative of the horizontal tangent
component is \(-\cos\theta-(1+t)\sin\theta<0\), so the tangent crosses the
upward direction with positive angle derivative. The other vertical
tangent points downward. The winding of the corresponding unoriented
Lagrangian line is twice the tangent winding, giving Maslov index \(2\).
In the cylinder end collar the additional tangent line is the constant
horizontal line, so it contributes zero to the Maslov index. The area
and Maslov morphisms therefore satisfy \(\omega=(27\pi/32)\mu\) for
these relative groups, with minimal positive-area Maslov number \(2\).

## Source conditions and scope

Checked the authors' copy of the published article by Paul Biran and
Octav Cornea, *Lagrangian cobordism. I*, J. Amer. Math. Soc. 26 (2013),
295–340, on 28 November 2026. Definition 2.1.1 gives the compact strip
embedding and height conditions. Section 4.1 gives the boundaryless
cylindrical-end formulation and compact-slab condition. Section 2.1.1
specifies monotonicity and the stronger uniform conditions for families,
which include the Maslov-two disk counts. Theorem 2.2.1 additionally
uses a uniformly monotone family including a comparison Lagrangian
and Floer data. The calculation here establishes the elementary
geometric cobordism and the relative area and Maslov identities for
the specified cylinder and endpoints.
[Biran–Cornea, published copy](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf)

The canonical boundary graph gives the phase endpoint pairs used to
select the circle of trajectories. The embedded cobordism depends on
that auxiliary circle, the phase torus chart and the chosen strip
suspension. Its dimension and cylindrical ends are the geometric
claims for these fixed data. [B02 selection](../brainstorm/notes/B02_COBORDISM.md)
