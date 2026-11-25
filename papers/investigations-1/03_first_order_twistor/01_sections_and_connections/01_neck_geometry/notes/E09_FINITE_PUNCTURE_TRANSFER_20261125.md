# Smooth-type transfer from a finite-puncture component

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Exact serving model and reasoning effort unavailable.
Conditional theorem in the smooth oriented Riemannian category.
[Frozen request and input versions](../research-progress/handoffs/E09_REQUEST_20261125.md)
· [Return](../research-progress/handoffs/E09_RETURN_20261125.md)

## Statement

Let \(M\) be a fixed smooth closed oriented homotopy four-sphere.
Let \(g_i\) be smooth Riemannian metrics on \(M\), with
\(Y([g_i])\ge y_0>0\) and \(E_+(g_i)\to e\). Here \(E_+\) is the squared
Hilbert–Schmidt Weyl endomorphism norm on the real \(\Lambda^+\) block,
integrated with its Riemannian volume. Suppose \((N,q)\) is smooth,
closed, connected, oriented and \(Y([q])>0\). Let
\(P=\{p_1,\ldots,p_k\}\) be distinct smooth points with \(1\le k<\infty\).
On neighborhoods of every fixed whole compact truncation of \(N-P\),
assume there are orientation-preserving embeddings into \(M\)
under which the \(g_i\) converge smoothly to \(q\) after multiplication
by positive smooth conformal factors. All boundary components in a
truncation must be compared by one embedding into the same source.
Write \(e_C=E_+(q)\). If \(0\le e-e_C<4\pi^2\), then \(M\) and \(N\)
are orientation-preservingly diffeomorphic. We derive the smooth-type
consequence by recognizing each capped exterior. No neck exhaustion
premise is needed beyond the supplied component comparison.

## Simultaneous cuts and complement topology

Fix a large finite buffer length \(\ell\ge1\), to be chosen using \(y_0\).
Choose disjoint oriented \(q\)-normal coordinate balls at all \(p_j\).
Let
\[
 K_r=N\setminus\bigcup_{j=1}^k B_q(p_j,r)
\]
where the balls deleted are open and \(r\) is sufficiently small.
This truncation is connected. A path crossing an open deleted ball
can be moved onto its connected boundary, after taking a path
transverse to the boundaries. In each ball put
\(t=\log(r/\rho)\), with \(\rho\) its normal radius. Use an angular
reflection once in the chart if required to make \(dt\wedge dV_\gamma\)
agree with the orientation. The full comparison is taken on a
neighborhood of \(K_{r\exp(-\ell-2)}\) and gives all \(|t|\le\ell+2\)
strips in one map \(\Phi_{i,r}\). The logarithmic width is fixed
and the underlying normal balls are disjoint. At \(t=0\) cut along
the images of all \(k\) round-coordinate spheres. The \(t>0\) half
of each buffer lies outside \(\Phi_{i,r}K_r\).

Put \(K=\Phi_{i,r}K_r\) and
\(V=\overline{M\setminus K}\), with collars interpreted using
\(V=M\setminus\operatorname{int}K\). Let \(\Sigma=K\cap V\) be the
\(k\)-component boundary and let \(m\) be the number of components of
\(V\). Each component meets \(\Sigma\) by connectedness of \(M\).
Mayer–Vietoris applied after thickening by collars gives
\[
 0\longrightarrow \mathbb Z^{k}
   \longrightarrow \mathbb Z\oplus\mathbb Z^{m}
   \longrightarrow \mathbb Z\longrightarrow0
\]
from \(H_1(M)=0\) and the three \(H_0\) groups. Thus \(m=k\), and each
component has just one boundary sphere. Label these components \(V_j\)
by the corresponding \(p_j\). In particular each \(V_j\) is one full
retained side of the single cut \(\Sigma_j\).

Using the same incidence and simply connected boundary spheres,
van Kampen identifies \(\pi_1(M)\) with the free product of
\(\pi_1(K)\) and the \(k\) groups \(\pi_1(V_j)\). Each group is
trivial. Mayer–Vietoris in degree two, with \(H_2(\Sigma)=H_1(\Sigma)=0\),
gives \(H_2(V_j)=0\). The closed oriented manifolds \(\widehat V_j\)
formed by attaching the marked standard balls to their individual
boundaries are simply connected with \(H_2=0\). By Poincaré duality
they are integral homology four-spheres, with \(\tau=0\) and \(\chi=2\).

## Uniform Yamabe sign and summed chiral budget

On the larger embedded truncation write
\(q_{i,r}=f_{i,r}^{\,2}\Phi_{i,r}^*g_i\to q\) smoothly for fixed \(r\).
On each puncture buffer use the cylindrical metrics
\(\rho^{-2}q_{i,r}\). In normal coordinates the normalized limit is
\(O_\ell(r^2)\)-close to \(dt^2+\gamma\) in \(C^2\). Indeed \(q-\delta\)
has normal-coordinate size \(O(\rho^2)\), its first derivative has
size \(O(\rho)\), and its second derivative is bounded. Conversion
to cylinder derivatives contributes the required powers of \(\rho\).
Through the oriented embeddings this is a source conformal gauge,
with positive factor \(f_{i,r}/\rho\) relative to the source pullback.
The maximum \(\eta_{i,r}\) of the \(k\) cylindrical \(C^2\) errors
satisfies
\[
 \eta_{i,r}\le C_\ell r^2+o_i(1;r,\ell).
\]
No convergence of the conformal factors themselves is required.
When applying the cap audit one may extend the collar gauges by
cutting off their logarithms in spare disjoint buffers. This preserves
the global Yamabe constant of \(g_i\), and both chirality energies
are conformally invariant.

Apply the [two-cap audit (1)](E01_TWO_CAP_AUDIT_20261125.md#setting-and-bounds)
to the exterior side of each cut. Let \(T_j\) be the original unit splice
on \(V_j\), and \(\widehat g_{i,j}\) the smooth metric on \(\widehat V_j\).
It gives
\[
 \begin{aligned}
 Y([\widehat g_{i,j}])
 &\ge \min\{y_0,(1-C_Y\eta_{i,r})Y_{\rm rd}\}
      -C_I\ell^{-3/2},\\
 E_+(\widehat g_{i,j})
 &\le E_+(g_i;V_j\setminus T_j)+C_W\eta_{i,r}^2,\\
 \sum_j E_+(\widehat g_{i,j})
 &\le E_+(g_i)-E_+(g_i;\Phi_{i,r}K_r)+k C_W\eta_{i,r}^2 .
 \end{aligned}
 \tag{1}
\]
Here \(\ell\) affects the localization error and the \(C^2\) comparison.
All disjoint regions in the sum are cut in the same source metric.
Each exact cap is conformally flat and the counted splice error
depends on its fixed unit width.

Put \(b=\min\{y_0,Y_{\rm rd}/2\}>0\). Choose \(\ell\) large enough that
\(C_I\ell^{-3/2}<b/2\). Choose \(\varepsilon>0\) such that
\(e-e_C+4\varepsilon<4\pi^2\). Then take \(r\) small and \(i\) large
so that the tail \(e_C-E_+(q;K_r)<\varepsilon\),
\(E_+(g_i)<e+\varepsilon\), and
\(E_+(g_i;\Phi_{i,r}K_r)>E_+(q;K_r)-\varepsilon\).
The last inequality uses conformal invariance and smooth convergence on
the fixed compact. Further require the cap threshold,
\(C_Y\eta_{i,r}\le 1/2\) and \(k C_W\eta_{i,r}^2<\varepsilon\).
Thus each capped exterior has \(Y>b/2\), and the sum of its positive
chiral energies over all exteriors is below \(e-e_C+4\varepsilon<4\pi^2\).

## Recognition and the fixed smooth type

The signature identity gives
\(E_+(\widehat g_{i,j})=E_-(\widehat g_{i,j})\) on each
\(\widehat V_j\). Its full four-index Weyl integral is
\(4(E_++E_-)=8E_+<32\pi^2=16\pi^2\chi(\widehat V_j)\).
With the positive Yamabe constant in (1), Chang–Gursky–Yang's
Theorem A recognizes \(\widehat V_j\) as diffeomorphic to \(S^4\) or
\(\mathbb{RP}^4\). Simple connectivity selects \(S^4\); choose an
orientation-preserving diffeomorphism to the oriented standard sphere.
[Chang–Gursky–Yang, Theorem A and Remark 2](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

For each \(j\) write \(D_j^+\) for the closed normal ball of radius
\(r\) deleted from \(N\). Use its standard smooth double as the
model \(S^4\), with the negatively oriented copy called \(D_j^-\).
The actual cap in \(\widehat V_j\) is a smooth parametrized disk
attached by the spherical chart. Its given parametrization, with
a collar extension, gives an orientation-preserving diffeomorphism
of a neighborhood of that disk to a neighborhood of \(D_j^-\).
On the outside collar this identification is the original
\(\Phi_{i,r}^{-1}\) in the coordinates of \(D_j^+\); the choice of
the prescribed angular and normal collars gives this agreement.
Transport the local diffeomorphism to the recognized standard sphere.
Palais's Theorem C extends it on a possibly smaller neighborhood
of the given disk to an orientation-preserving ambient diffeomorphism.
Composing with the recognition map and restricting to \(V_j\)
gives a diffeomorphism onto \(D_j^+\) with the stated collar
identification. Thus the exterior maps glue smoothly to
\(\Phi_{i,r}^{-1}:K\to K_r\). The proof uses the chosen cap disks in
the already recognized closed manifolds, so there is no use of a
smooth Schoenflies assertion about arbitrary sphere embeddings.
[Palais, *Extending diffeomorphisms*, Theorem C, p. 277](https://paperzz.com/doc/8888202/extending-diffeomorphisms)

## Infimum and the entire exterior budget

Define
\[
 I^+(M)=\inf\{E_+(g): g\text{ a smooth Riemannian metric on }M,\
                              Y([g])>0\}.
\]
Pull back \(q\) by the oriented diffeomorphism. It is an admissible
competitor on \(M\), so \(I^+(M)\le e_C\le e\).
In particular the near-minimizing excess \(\epsilon_{\min}=e-I^+(M)\)
bounds the residual \(e-e_C\) from above.

For any chosen fixed \(r>0\) with the given comparison, the
uncapped physical exterior has the exact limiting budget
\[
 \lim_{i\to\infty} E_+(g_i;M\setminus\Phi_{i,r}K_r)
     = e-E_+(q;K_r)
     = e-e_C+E_+(q;N\setminus K_r).
 \tag{2}
\]
The equality uses only the same fixed-compact convergence and
conformal invariance. There is no need to identify geometrically
what lies in that exterior. At fixed \(r\) the convergence is
taken first, and then \(r\downarrow0\) makes the smooth omitted
tail vanish. Thus for a minimizing family \(e=I^+(M)\) and a
supplied smooth compactified base satisfying the assumptions,
\(e=e_C\) and
\[
 \lim_{r\downarrow0}\lim_{i\to\infty}
     E_+(g_i;M\setminus\Phi_{i,r}K_r)=0 .
\]
This bounds the entire exterior, including any annuli or smaller
scales inside it. A diagonal vanishing statement follows by choosing
fixed radii \(r_n\downarrow0\) and only then the convergence thresholds
for \(i\); (2) requires no estimates for arbitrarily assigned moving
radii or nesting of the images in \(M\).

For a supplied nonflat ALE component, assume its smooth finite-puncture
compactification, the required whole embedded comparisons, and the
inherited strict SEC estimate \(e-e_C>0\) under its own Yamabe-band and
ALE assumptions. With \(e-e_C<4\pi^2\) the minimizing equality above
is impossible. In the specific SEC regime the one-ended topology
and upper band give this upper bound, and a quantitative strict
residual excludes any near-minimizer whose excess is below that
strict residual. This argument does not supply the ALE component
or extend SEC's strict residual to other component hypotheses.
[SEC §§11–12, closed threshold and strict residual](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4350)

## Scope and checked sources

At an orbifold omission the boundary may be \(S^3/\Gamma\), and
the smooth-ball cap and its Yamabe and smooth identification
arguments no longer apply. Separate, potentially incompatible
embeddings of puncture charts do not give the connected core \(K\)
with its \(k\) boundary components in one source. Then neither the
incidence argument nor the disjoint exterior budgets have these
premises. A smooth base of the stipulated type remains a geometric
input.

On 25 November 2026 the imported passages were checked in
S.-Y. A. Chang, M. J. Gursky and P. C. Yang, *A conformally invariant
sphere theorem in four dimensions*, Publ. Math. IHÉS 98 (2003),
105–143, Theorem A and Remark 2, and in R. S. Palais,
*Extending diffeomorphisms*, Proc. Amer. Math. Soc. 11 (1960),
274–277, Theorem C, p. 277, DOI
[10.1090/S0002-9939-1960-0117741-0](https://doi.org/10.1090/S0002-9939-1960-0117741-0),
from a publicly accessible copy of the original article. The cap and
conformal Yamabe estimates are those proved in the local E01 audit.
