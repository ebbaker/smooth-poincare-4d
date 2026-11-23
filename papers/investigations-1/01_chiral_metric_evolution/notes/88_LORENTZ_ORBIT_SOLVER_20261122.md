# SP4-CME-E88 — A value-uniform Lorentz bound for the actual orbit solver

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E79. I did not
author E71, E80, E66 or E70. All five frozen input digests matched
the [request][req] before use. This derivation uses the fixed
reference inverse of E71, the assessed E79 weak solver, and the
E66/E70 kernel and layer methods. No new primary source was
inspected or imported. [B51][b51]. [Return][ret].

## Statement and conventions

On the compact closed oriented round Riemannian \(S^4\) use the
fixed positive perfect chiral connection \(A_0\), its native metric
\(g_0\), its curvature \(F_0\), and the positive internal metric from
the negative Killing form. Let \(E\) be the adjoint bundle and
\(E_1=T^*S^4\otimes E\). Write \(d_0=d_{A_0}\) and use the fixed
covariant derivative \(D_0\) on all tensor slots. All norms and
adjoints are in those fixed reference pairings. For a tensor with
pointwise modulus \(f\), use
\[
 \|f\|_{4,1}=\int_0^V s^{-3/4}f^*(s)\,ds
            =4\int_0^\infty \mu_f(v)^{1/4}\,dv,\qquad
 \mu_f(v)=\nu_0(\{|f|>v\}),\quad V=\nu_0(S^4),
\]
with reference measure \(\nu_0=dV_{g_0}\).
Define \(W^{1,(4,1)}\) by the sum of the Lorentz norms of
a section and its first weak covariant derivative.

There are \(\epsilon_*>0\) and \(C<\infty\) fixed by the reference
such that for all smooth \(A=A_0+a\) on the fixed bundle with
\(\epsilon=\|a\|_\infty+\|\beta\|_\infty\le\epsilon_*\),
\(\beta=F_A-F_0\), and all smooth \(r\in\Gamma(E_1)\),
E79's exact solution satisfies
\[
 \|\phi\|_{W^{1,(4,1)}}+\|\phi\|_{C^0}+\|u\|_{4,1}
                 +\|r_{\rm sl}\|_{4,1}\le C\|r\|_{4,1}.              \tag{1}
\]
Here \(r=d_A\phi+S_Au+r_{\rm sl}\), \(S_Au=\iota_u F_A\),
\(\phi\perp_{L^2}N\) with \(N=\ker K_0\), and
\(S_0^*r_{\rm sl}=d_0^*r_{\rm sl}=0\).
The tube is chosen inside the definite reference component as in E79.
Threshold and constant use only the stated sup norms of the
perturbation, with no higher coefficient derivative bound.
[E71 (1), (5)–(6)][e71]. [E79 (1)–(9)][e79].

## The fixed divergence inverse and its finite-rank correction

Let \(\Pi_0=I-S_0(S_0^*S_0)^{-1}S_0^*\) and
\(K_0=d_0^*\Pi_0 d_0\). E71 gives a bounded weak inverse
from the annihilator of \(N\) in \(H^{-1}\) to \(H^1(E)\cap
N^\perp\). The nullspace is finite dimensional and smooth,
and \(\Pi_0d_0\psi=0\) for \(\psi\in N\). Choose an
\(L^2\)-orthonormal basis \(\{\psi_j\}\) of \(N\).
For \(w\in L^2(E_1)\), set
\[
 R_Nw=\sum_j (w,d_0\psi_j)_{L^2}\psi_j,\qquad
 Lw=K_0^\dagger d_0^*w .
\]
Then \(\phi=Lw\in H^1\cap N^\perp\) solves
\[
 K_0\phi=d_0^*w-R_Nw\quad\text{in }H^{-1},\qquad
 \|\phi\|_{H^1}\le C\|w\|_2.                                        \tag{2}
\]
The formula for \(R_Nw\) is precisely the weak kernel
projection of \(d_0^*w\), since weak testing uses \(d_0\psi_j\).
For \(p=2\) or \(8\) and each nonnegative integer \(k\),
Hölder and the fixed smooth basis give
\(\|R_Nw\|_{C^k}\le C_{k,p}\|w\|_p\).
For \(w=\Pi_0 w'\) this term vanishes from
\(\Pi_0d_0\psi_j=0\) and orthogonality of \(\Pi_0\).
More generally it vanishes if \(w(x)\in\ker S_0^*(x)\)
almost everywhere, since \(d_0\psi_j\in\operatorname{im}S_0\).
We prove the estimate for arbitrary \(w\), retaining the
smooth finite-rank correction. Smooth \(w\) gives smooth
\(\phi\) by the fixed regularity theorem. [E71 (4)–(7)][e71].
[E79, weak annihilator][e79].

## Local \(L^8\) estimate for divergence forcing

In a fixed orthonormal internal frame on a coordinate patch,
write \(d_0=\partial+\gamma\) on \(E\) and
\(dV_{g_0}=\mu(x)\,dx\). The local operator \(P=\mu K_0\)
has the form
\[
 P\phi=-\partial_i(A^{ij}\partial_j\phi)
       -\partial_i(B^i\phi)+C^j\partial_j\phi+D\phi .
\]
Its coefficient matrices are smooth and fixed, with
\(A^{ij}=\mu g_0^{i\ell}(\Pi_0)_\ell{}^j\).
For example \(B^i=A^{ij}\gamma_j\),
\(C^j=\gamma_i^*A^{ij}\) and \(D=\gamma_i^*A^{ij}\gamma_j\),
from the weak form. Move \(C^j\partial_j\phi\) into a
divergence and a value term to write
\[
 P\phi=-\partial_i(A^{ij}\partial_j\phi+M^i\phi)+D_1\phi,\quad
 M^i=B^i-C^i,\quad D_1=D-\partial_j C^j .
\]
By the symbol of E71,
\(A^{ij}(x)\xi_i\xi_j=\frac23\mu(x)|\xi|_{g_0(x)}^2 I_E\).
The coordinate form of (2) is
\(P\phi=-\partial_i F^i+G\), where
\(F^i=\mu g_0^{ij}w_j\) and
\(G=\gamma_i^*F^i-\mu R_N w\).
Thus \(F,G\) have coordinate \(L^8\) bounds from \(w\) and
the finite-rank correction. [E71 (2)][e71].
[E80, raw form coefficients][e80].

Choose a smooth cutoff \(\chi\) supported inside the patch
and put \(v=\chi\phi\), extended by zero. The exact cutoff
identity is
\[
 P v=\chi P\phi-\partial_i(A^{ij}(\partial_j\chi)\phi)
       -(\partial_i\chi)A^{ij}\partial_j\phi
       -(\partial_i\chi)M^i\phi .
\]
Rewrite the third term as
\(-\partial_j((\partial_i\chi)A^{ij}\phi)
 +\partial_j((\partial_i\chi)A^{ij})\phi\).
Also \(-\chi\partial_i F^i=-\partial_i(\chi F^i)+
(\partial_i\chi)F^i\). All terms therefore give
\(Pv=-\partial_i F_\chi^i+G_\chi\) with
\[
 \|F_\chi\|_8+\|G_\chi\|_8
 \le C_\chi(\|w\|_{8,\rm patch}+\|R_Nw\|_{8,\rm patch}
                                      +\|\phi\|_{8,\rm patch}) .
                                                                            \tag{3}
\]
The coefficient derivatives in (3) are fixed reference
derivatives. There are no derivatives of \(\phi\) left in
the cutoff forcing outside the displayed divergence.
The extensions on \(\mathbb R^4\) use compact support.

Freeze \(A_*^{ij}=A^{ij}(x_*)\) on such a patch and use
\(L_*=-A_*^{ij}\partial_i\partial_j\).
With \(\partial_j\mapsto i\xi_j\), put
\(A_*(\xi)=A_*^{ij}\xi_i\xi_j\).
Uniform ellipticity and bounded fixed coefficient matrices on
the initial finite atlas give constants uniform over the
freezing points. In the identity for \((I+L_*)v\),
\[
 (I+L_*)v
 =-\partial_i\big(F_\chi^i+(A_*^{ij}-A^{ij})\partial_jv-M^i v\big)
       +G_\chi+(I-D_1)v,                                             \tag{4}
\]
the relevant gradient multipliers for flux and value forcing are
\[
 m_{ij}(\xi)=\xi_i\xi_j(I+A_*(\xi))^{-1},\qquad
 n_i(\xi)=i\xi_i(I+A_*(\xi))^{-1}.                                    \tag{5}
\]

The flux multiplier \(m_{ij}\) is \(L^2\)-bounded by
Plancherel. For a fixed smooth annular partition
\(\sum_{\ell\in\mathbb Z}\varphi(2^{-\ell}\xi)=1\)
away from zero, the symbol on the rescaled annulus is
\[
 \varphi(\eta)\eta_i\eta_j(2^{-2\ell}I+A_*(\eta))^{-1}.
\]
All derivatives of each fixed finite order are uniformly bounded
there for all \(\ell\). Indeed \(A_*(\eta)\) is uniformly positive
on the annulus and differentiating the matrix inverse preserves
these bounds, including the low scales. Rescaling and integrations
by parts give the block kernel estimate for \(j=0,1\),
\[
 |D^j K_\ell(x)|\le C_N 2^{(4+j)\ell}(1+2^\ell|x|)^{-N}.
\]
Summing at \(2^\ell|x|\le1\) and \(2^\ell|x|>1\) gives the
off-origin kernel bounds \(C|x|^{-4}\), \(C|x|^{-5}\) for
kernel and first derivative. Finite partial multipliers converge
strongly on \(L^2\) by bounded overlap and Plancherel.
The summed bound identifies the off-support action on compactly
supported \(L^1\cap L^2\) inputs. All these facts also hold for
the adjoint multiplier.

To obtain the strong \(L^8\) bound, take the dyadic decomposition
of a vector-valued \(f\in L^1\cap L^2(\mathbb R^4)\) at height
\(\lambda>0\). Maximal cubes of average modulus exceeding
\(\lambda\) are disjoint, with total volume at most
\(\|f\|_1/\lambda\). Replacing \(f\) on each cube by its vector
average gives a good part of \(L^2\) norm squared at most
\(C\lambda\|f\|_1\) by the parent-cube bound. The bad parts \(b_Q\)
have zero average and total \(L^1\) norm at most \(2\|f\|_1\).
Off a fixed enlargement of \(Q\), subtract the kernel at the cube
center. The gradient bound integrates there to a bound
\(C\ell(Q)\int_{c\ell(Q)}^\infty r^{-2}\,dr\le C\) for the
kernel difference. Thus the bad output has \(L^1\) bound
\(C\sum_Q\|b_Q\|_1\) off the union of enlarged cubes. To pass
from finite sums, the disjoint mean-zero pieces converge in
\(L^2\), so the bounded \(L^2\) multiplier and Fatou along a
pointwise subsequence give the same bound. The enlarged union
has volume at most \(C\|f\|_1/\lambda\), and the good output is
handled by the \(L^2\) estimate. This gives weak \((1,1)\).

For either multiplier, splitting \(f\) at modulus \(\lambda\)
therefore gives an output distribution bound at that threshold
of at most
\[
 C\lambda^{-1}\int_{|f|>\lambda}|f|
       +C\lambda^{-2}\int_{|f|\le\lambda}|f|^2 .
\]
Integration against \(p\lambda^{p-1}\,d\lambda\) and Tonelli give
strong \(L^p\) for \(1<p<2\), since the two inner integrals
have powers \(p-2\) on \((0,|f|)\) and \(p-3\) on
\((|f|,\infty)\). Apply this at \(8/7\) to the adjoint and
dualize to obtain strong \(L^8\) for \(m_{ij}\), agreeing with
the multiplier on common \(L^2\) inputs by smooth testing.
This derives the divergence gradient estimate using the
assessed Euclidean kernel argument. [E66 (4) and multiplier
proof][e66]. [E70, strong endpoints][e70].

For the value multiplier \(n_i\), a smooth low block has a
Schwartz kernel with bounded \(L^1\) norm. Its rescaled high
blocks are \(2^{-\ell}\) times symbols uniformly bounded
with fixed-order annulus derivatives. Hence their \(L^1\) kernel
norms sum, by rescaling and integrations by parts. Young's
inequality gives the required \(L^8\) gradient bound for the
value term. The full identity for compact smooth \(v\) follows
by Fourier transformation of (4) and these bounds.

Choose a finite cover by sufficiently small coordinate patches
so the leading coefficient oscillation on each patch times the
uniform flux multiplier constant, summed over the finitely many
slots, is less than \(1/2\). Apply (4)–(5) to the cutoffs of a
fixed subordinate partition and absorb
\(\|(A_*-A)\partial v\|_8\) for each cutoff. The commutator and
lower bounds in (3)–(4), finite-rank bound of (2), and fixed
coordinate and frame comparisons now give
\[
 \|D_0\phi\|_8\le C_1\big(\|w\|_8+\|\phi\|_8\big) .                   \tag{6}
\]
The \(L^8\) remainder can be removed using only the low \(L^2\)
bound. In a compactly supported patch, if \(\eta_h\) is a
normalized smooth mollifier of scale \(h\), then
\(\|v-\eta_h*v\|_8\le C h\|\partial v\|_8\) by straight
translations and the fundamental theorem of calculus.
Also \(\|\eta_h*v\|_8\le C h^{-3/2}\|v\|_2\) by Young with
\(\|\eta_h\|_{8/5}=C h^{-3/2}\). Sum the patch inequalities,
including the cutoff terms \(C h\|\phi\|_8\) from \(\partial v\),
and absorb those terms for small \(h\). This gives, for every
fixed \(\varepsilon>0\),
\(\|\phi\|_8\le\varepsilon\|D_0\phi\|_8+C_\varepsilon\|\phi\|_2\).
Use it in (6) with \(C_1\varepsilon<1/2\).
Then (2) and \(\|w\|_2\le V^{3/8}\|w\|_8\) yield
\[
 \|\phi\|_{W^{1,8}}\le C_8\|w\|_8 .                                 \tag{7}
\]
We proved this first for smooth \(w\).
Smooth approximations in \(L^8\) converge in \(L^2\) as well,
so the \(W^{1,8}\) limit and the weak \(H^1\) limit in (2)
are the same section. This establishes one common operator
\(L=K_0^\dagger d_0^*\) on the two endpoints. The argument
uses its own divergence gradient multiplier and treats the
cutoff fluxes before taking any norms.

## Layers and the fixed Lorentz estimate

The rearrangement bound
\(h^*(s)\le\min(\|h\|_2s^{-1/2},\|h\|_8s^{-1/8})\)
integrates against \(s^{-3/4}\) to give
\(\|h\|_{4,1}\le12\|h\|_2^{1/3}\|h\|_8^{2/3}\).
The switch is at \(s=(\|h\|_2/\|h\|_8)^{8/3}\), and a
zero norm is the trivial case. Write
\(w_v=(w/|w|)1_{\{|w|>v\}}\) using zero on \(\{w=0\}\).
Its endpoint norms are \(\mu_w(v)^{1/2}\) and
\(\mu_w(v)^{1/8}\). For each \(D_0^j L\), \(j=0,1\),
with endpoint operator norms \(c_{j,2},c_{j,8}\) from
(2), (7), the estimates on the same layer give
\[
 \|D_0^j L w_v\|_{4,1}
  \le12 c_{j,2}^{1/3}c_{j,8}^{2/3}\mu_w(v)^{1/4}.
\]
This applies to arbitrary vector layers. The layer map is
strongly continuous in each endpoint away from the at most
countably many positive-measure level sets, so the output
is strongly measurable there and in the Lorentz norm by
the same interpolation bound. The assessed completeness
of \(L^{4,1}\) makes the output integrable in that norm.
The input integral is \(w\) in \(L^2\), since
\(\mu_w(v)^{1/2}\le V^{1/4}\mu_w(v)^{1/4}\) and the
finite-height layers converge pointwise to \(w\). Integrating
and using continuity of the common endpoint operators,
the Lorentz and \(L^2\) output integrals agree in \(L^1\).
Hence
\[
 \|K_0^\dagger d_0^*w\|_{W^{1,(4,1)}}
       \le C_L\|w\|_{4,1},\qquad
 C_L=3\sum_{j=0}^1 c_{j,2}^{1/3}c_{j,8}^{2/3}.                       \tag{8}
\]
The derivatives are weak derivatives of the same section
by (2). In particular \(K_0^\dagger d_0^*\Pi_0\) has this
bound with the same constant because \(\Pi_0\) is an
orthogonal fiber projection. The estimate for arbitrary
forcing already includes \(R_Nw\). [E66 (6)–(9)][e66].
[E70, Lorentz layer audit][e70].

## Value-only perturbation and exact E79 identification

Use E79's maps \(H_A=(S_0^*S_A)^{-1}S_0^*\) and
\(\Pi_A=I-S_AH_A\). Then \(H_A,\Pi_A\) are uniformly
bounded and \(\|\Pi_A-\Pi_0\|_\infty\le C\|\beta\|_\infty\)
in the fixed tube. For \(\phi\in W^{1,(4,1)}\) write
\[
 M_A\phi=(\Pi_A-\Pi_0)d_0\phi+\Pi_A[a,\phi].
\]
The exact weak form of the E79 operator is
\(K_A\phi=K_0\phi+d_0^*M_A\phi\).
This uses the nonsymmetric \(\Pi_A\) on the flux in
the original ordered positions. In particular
\[
 \|M_A\phi\|_{4,1}\le C\epsilon\|\phi\|_{W^{1,(4,1)}}.                 \tag{9}
\]
The bracket is order zero in \(\phi\). Keeping the difference
inside \(d_0^*\) means (9) uses only sup norms of \(a,\beta\).
Every flux entering \(M_A\phi\) and \(\Pi_A r\) is in
\(\ker S_0^*\). Thus their weak divergences annihilate
\(N\), even though \(K_A\) need not vanish on input \(N\).
[E79 (1)–(5)][e79]. [E80, weak annihilator][e80].

The finite-volume layer inequality used above gives
\(\|w\|_2\le(V^{1/4}/4)\|w\|_{4,1}\).
Thus \(W^{1,(4,1)}\) embeds continuously in \(H^1\)
and is complete in its graph norm, by completeness of
the two Lorentz components and closedness of the weak
derivative in distributions. The subspace
\(W^{1,(4,1)}\cap N^\perp\) is closed by the weak
\(L^2\) pairing. On it, the equation
\[
 (I+L M_A)\phi=L\Pi_A r
\]
has a convergent Neumann solution if
\(C_L C\epsilon_*\le1/2\), by (8)–(9) and the normalization
of \(L\). It satisfies
\(\|\phi\|_{W^{1,(4,1)}}\le C\|r\|_{4,1}\).
Since its data are in the weak \(H^{-1}\) space and
the divergences annihilate \(N\), applying \(K_0\) gives
\(K_A\phi=d_0^*\Pi_A r\) on all \(H^1\) tests.
Uniqueness in the \(H^1\cap N^\perp\) inverse of E79
therefore identifies this \(\phi\) with the exact solver.
It is smooth for smooth \(A,r\) by the assessed E79
regularity. The corresponding exact formulas
\(u=H_A(r-d_A\phi)\) and
\(r_{\rm sl}=\Pi_A(r-d_A\phi)\) give
\[
 \|u\|_{4,1}+\|r_{\rm sl}\|_{4,1}\le C\|r\|_{4,1}
\]
because \(d_A\phi=d_0\phi+[a,\phi]\) and the fiber maps
and brackets have the stated bounds. [E79 (5)–(9), (12)][e79].
[E80][e80].

## Explicit continuous endpoint for the vertical parameter

On \(\mathbb R^4\), for a compactly supported smooth vector
\(v\), integrate its derivative along every ray from \(x\) and
average over directions. Polar coordinates give
\[
 |v(x)|\le |S^3|^{-1}\int_{\mathbb R^4}|x-y|^{-3}
                                              |\partial v(y)|\,dy .
\]
For a set of measure \(m>0\), split its integral against
\(|x-y|^{-3}\) at \(|x-y|=m^{1/4}\).
The interior ball contributes at most \(|S^3|m^{1/4}\),
and the outside contributes at most \(m^{1/4}\).
Applying this set bound to the layers of \(|\partial v|\)
and using Tonelli proves \(\|v\|_\infty\le C\|\partial v\|_{4,1}\).
For each fixed cutoff of a section, the coordinate derivative
of its components is bounded by fixed multiples of the
section and \(D_0\) derivative on the patch. Coordinate
density comparisons in the distribution formula and the finite
cover give
\[
 \|\phi\|_{C^0}\le C_0\big(\|D_0\phi\|_{4,1}+\|\phi\|_{4,1}\big)
\]
for smooth sections.

The same bound gives a continuous representative in the weak
space. For the compactly supported coordinate pieces and their
weak derivatives, truncate at magnitude \(m\) in \(L^{4,1}\).
The high-value tail tends to zero by dominated convergence
in the layer formula. Bounded compactly supported truncations
are in \(L^2\cap L^8\), so their translations are continuous
in \(L^{4,1}\) by the two-endpoint interpolation bound.
Translation invariance and the tail estimate extend this
continuity to the full coordinate piece and its derivatives.
Mollification then converges in the \(W^{1,(4,1)}\) norm,
using commuting distributional derivatives and the norm
triangle inequality for the translation integral. Patch the
approximants in the fixed frames with support still interior
to the charts. The smooth approximants are Cauchy in \(C^0\)
by the proved estimate, and their uniform limit is the weak
section by the \(L^2\) embedding. This supplies the asserted
continuity and completes (1).

All charts, reference derivatives, kernel bounds, cutoff scales,
volume constants and the fixed kernel projection in this proof
are reference data. The two sup bounds determine the perturbation
threshold, and no higher derivative of \(a\) or \(\beta\) enters (1).
The estimate leaves the horizontal parameter in \(L^{4,1}\).
It establishes neither \(C^1\) control for a horizontal vector-field
flow nor finite placement in the fixed slice on a value-only tube.

[req]: ../research-progress/handoffs/SP4-CME-E88_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E88_RETURN_v1.md
[b51]: ../brainstorm/notes/B51_VALUE_UNIFORM_LORENTZ_ORBIT_INVERSE_20261122.md
[e71]: 71_LINEAR_ROUND_SLICE_20261122.md
[e79]: 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e80]: ../reviews/E80_ORBIT_INVERSE_AUDIT_20261122.md
[e66]: 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e70]: ../reviews/E70_FIXED_SLICE_AUDIT_20261122.md
