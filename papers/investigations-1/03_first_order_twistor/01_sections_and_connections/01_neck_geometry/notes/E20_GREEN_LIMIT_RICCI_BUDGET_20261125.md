# SP4-FOT-NECK-E20 · Ricci budget for a conformal Green rescaling

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded E proof check, companion to
EXTRACT-E11. Helper configured for GPT-6.2 Sol, ultra. Exact runtime
variant and effort are unavailable.
[Frozen request and input versions](../research-progress/handoffs/E20_REQUEST_20261125.md).
The companion EXTRACT-E11 derivation was checked at SHA-256
prefix ea035f56.

## Comparison and the Green limit

Fix a smooth closed oriented homotopy four-sphere \(M\). Let \(g_i\)
be smooth physical unit-volume positive Yamabe minimizers with
\[
 E_i=E_+(g_i)=E_-(g_i)\longrightarrow e,\qquad
 4\pi^2\le E_i\le 8\pi^2-\delta,\qquad
 s_i=Y([g_i])\longrightarrow y>0,\qquad
 \int_M|B_{g_i}|\,dV_{g_i}\longrightarrow0 .
\]
Use the real Hilbert–Schmidt norm on the Weyl blocks. Set
\(D_i=\int_M|\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}\). By the
closed Gauss–Bonnet and signature conventions in SEC,
\[
 D_i=4E_i+s_i^2/12-32\pi^2,\qquad
 D:=\lim_i D_i=4e+y^2/12-32\pi^2,\qquad
 Y_{\rm rd}^2=384\pi^2 .
 \tag{1}
\]
[SEC §11.1, source budget](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)

Supply a smooth closed oriented homotopy-sphere conformal base
\((N,h)\) with a finite marked set \(P\). On full compact
truncations of \(N\setminus P\) use orientation-preserving
comparison embeddings \(F_i\) and positive functions \(u_i\)
with
\[
 F_i^*g_i=u_i^2 h_i,\qquad h_i\longrightarrow h
\]
smoothly on every fixed compared compact set. As in EXTRACT-E09,
the smooth closed \(h\) can be a fixed conformal replacement
of the initial smooth punctured gauge. In particular the
comparison gives \(Y([h])\ge y\) by compactly supported
conformal tests and the capacity-zero smooth point cutoffs.
It gives \(B_h=0\) by conformal invariance of the total
Bach norm and smooth comparison, followed by removability
at \(P\). Put \(e_N=E_+(h)=E_-(h)\); nonnegative
conformal Weyl accounting gives \(e_N\le e\).
[EXTRACT-E09, conformal comparison and weak limit](../../02_dirac_collar_extraction/notes/E09_CONFORMAL_BASE_VOLUME_DICHOTOMY_20261125.md)

In the zero-factor branch assume a smooth comparison after
one constant physical length normalization \(\lambda_i^{-1}\),
\(\lambda_i\downarrow0\), with
\[
 \lambda_i^{-2} F_i^*g_i\ \longrightarrow\ g_X=w^2h,\qquad
 w=\sum_{j=1}^{\ell}a_jG_{p_j},\quad a_j>0 ,
 \tag{2}
\]
on every fixed compact subset away from **all** of \(P\).
The poles are distinct points of \(P\).
Here \(G_p\) is the positive Green function of
\(L_h=6\Delta_h+s_h\), with \(\Delta_h\) nonnegative,
normalized by \(L_hG_p=24\pi^2\delta_p\).
The factor is smooth and positive at the remaining marked
points. For the intrinsic limit metric let
\(X=N\setminus\{p_1,\ldots,p_\ell\}\), including the
ordinary marked points at which \(g_X\) is smooth.
There is at least one pole. Indeed, a positive global
smooth solution of \(L_hw=0\) would contradict
\(Y([h])\ge y>0\), by testing with \(w\).
The budget argument below starts with (2). For a nonround
base with coherent comparisons, EXTRACT-E11 supplies (2)
on any weak-zero subsequence after further extraction.
Indeed \(Y([h])\ge y\) and closed sharp Yamabe rigidity
give \(y<Y_{\rm rd}\), so EXTRACT-E09 gives local smooth
decay of the factor on such a subsequence. The normalized
factor at one regular base point satisfies a homogeneous
linear equation with smoothly bounded coefficients. A
Harnack chain and local elliptic estimates give (2), with
the Green representation from the isolated singularity
argument. The round zero branch below remains conditional
on (2), in particular when \(y=Y_{\rm rd}\).
[EXTRACT-E11, normalized equation and Green representation](../../02_dirac_collar_extraction/notes/E11_VANISHING_FACTOR_GREEN_LIMIT_20261125.md)

## Euler identity on the intrinsic Green metric

The scalar transformation formula gives \(s_{g_X}=0\).
Near a pole the other Green functions are smooth.
In conformal normal coordinates the pole expansion,
including two derivatives, has a positive \(r^{-2}\)
leading term. The conformal replacement of \(h\) is
compensated by the inverse multiplier on \(w\), so
\(w^2h\) is unchanged. Inverting in the pole and
rescaling the Cartesian end coordinates by its fixed
positive leading length coefficient gives an unquotiented
Euclidean end of positive differentiable order. More
explicitly, the Lee–Parker four-dimensional expansion
gives \(h_{\rm end}=\delta_{\rm eucl}+O_2(R^{-\alpha})\)
with any fixed \(0<\alpha<2\) sufficient here, where
the subscript \(2\) records derivative decay through
second order. Adding the other smooth Green terms
preserves the estimate, since their size relative to
the leading factor is \(O(r^2)\) with the corresponding
derivatives. One may use a reflection with the inversion
to preserve the orientation. Each end is complete and
its \(|\mathrm{Rm}|^2\) integral converges, by
\(|\mathrm{Rm}|\le C R^{-2-\alpha}\) and Euclidean growth.
The filled ordinary points are smooth and introduce
no additional ends.
[Lee–Parker, Lemma 6.4 and Theorem 6.5](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

Let \(K_R\subset X\) be its intrinsic compact
truncation at large Euclidean end radius \(R\).
Its topology is \(N\) with \(\ell\) open balls
removed, whether or not this entire \(K_R\) is
compared into the source. Thus
\(\chi(K_R)=\chi(N)-\ell=2-\ell\).
In SEC's Gauss–Bonnet convention each outward
large Euclidean sphere contributes \(+8\pi^2\)
in the limit. The rescaled end collars converge
in \(C^2\) to a Euclidean sphere collar, and
constant rescaling preserves the normalized
boundary integral. A Euclidean unit ball has
zero bulk curvature and Euler characteristic one,
which fixes the sign and constant. Conformal
invariance and the zero measure of the pole set
give \(E_+(g_X)=E_-(g_X)=e_N\).
Gauss–Bonnet on \(K_R\), with \(R\to\infty\),
therefore yields
\[
 8\pi^2(2-\ell)=2e_N-\tfrac12 D_X+8\pi^2\ell,\qquad
 D_X:=\int_X|\operatorname{Ric}_{g_X}|^2\,dV_{g_X}
      =4e_N+32\pi^2(\ell-1).
 \tag{3}
\]
The full Ricci norm here is the trace-free norm because
the metric is scalar-flat. This is Gauss–Bonnet on
the intrinsic completed model. The topology is
computed from the given smooth \(N\), with no need
to import a full-core embedding into \(M\).
[SEC §11.2, boundary normalization](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4011) · [Tian–Viaclovsky, §7, (7.2)](https://arxiv.org/pdf/math/0310302)

## Transfer using only punctured compact comparisons

Let \(K\) be a fixed compact exhaustion member contained
in \(N\setminus P\). Its image is an actual subset of
the source. The squared trace-free Ricci integral in
dimension four is invariant under constant rescaling,
so smooth comparison in (2) gives
\[
 \int_K|\operatorname{Ric}_{g_X}|^2\,dV_{g_X}
 =\lim_i\int_{F_i(K)}|\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}
 \le D .
\]
Take \(i\to\infty\) first, then exhaust \(N\setminus P\).
The extra ordinary marks carry zero smooth-limit
curvature measure, so this proves \(D_X\le D\).
It does not require a source embedding extending over
any such point. One can also compute (3) with small
balls removed at the ordinary marks. The boundary
of each deleted ball contributes \(-8\pi^2\) in the
small-radius limit, and the deletion subtracts one
from Euler characteristic, giving the same identity.

Combining (1) and (3) gives the quantitative test
\[
    e-e_N\ \ge\ 8\pi^2\ell-\frac{y^2}{48}.                      \tag{4}
\]
Since \(y\le Y_{\rm rd}\), two or more poles would force
\(e\ge e_N+8\pi^2\), contrary to \(e\le8\pi^2-\delta\).
There is exactly one positive pole, and
\[
    e-e_N\ \ge\ 8\pi^2-\frac{y^2}{48}
       =\frac{Y_{\rm rd}^2-y^2}{48}.                            \tag{5}
\]
The other ordinary marks can still be missing from the
comparison. This is a rescaling of the **same conformal
base**, with \(E_\pm(g_X)=e_N\). A budget adding \(e_N\)
and the Green limit's energy would count the same
comparison images twice. An independently supplied
disjoint ALE bubble is instead subject to the
separate matched-compacts inequality.

## Nonround bases and minimizing selection

If \([h]\) is nonround, the exact closed Bach-flat gap
gives \(e_N>4\pi^2\). The sharp Yamabe rigidity theorem
and the compact-test lower bound give
\[
 y\le Y([h])<Y_{\rm rd}.
\]
Since \(e-e_N<4\pi^2-\delta\), NECK-E09 transfers the
oriented smooth type of \(N\) to \(M\) from the full
finite-puncture comparison **in its conformal gauge**.
It does not need captured physical volume. In the
no-puncture case the closed comparison map is a
diffeomorphism directly. The positive class \([h]\)
is now an admissible competitor on \(M\), so
\(I^+(M)\le e_N\le e\). If \(e=I^+(M)\), this gives
\(e=e_N\), contradicting (5) in the zero branch.
[Schoen, Theorem 2](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf) · [SEC §12.1, exact gap](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4357) · [NECK-E09, finite-puncture same-type transfer](E09_FINITE_PUNCTURE_TRANSFER_20261125.md)

More quantitatively, \(h\) is in the exact
Bach-flat band with the same upper margin \(\delta\),
because \(4\pi^2<e_N\le e\le8\pi^2-\delta\).
The SEC uniform exact-class gap gives
\(Y([h])\le Y_{\rm rd}-d_\delta\), with \(d_\delta>0\).
Thus in the supplied zero branch
\[
 e-I^+(M)\ge e-e_N
   \ge \frac{Y_{\rm rd}^2-(Y_{\rm rd}-d_\delta)^2}{48}
   =:\kappa_\delta>0 .                                         \tag{6}
\]
For a near-minimizer with \(e-I^+(M)<\kappa_\delta\),
(6) excludes the supplied zero model. This uses
the exact-class gap on the **closed base**. It
does not import a nonflat-bubble exclusion theorem
requiring a full embedding of \(X\).
[SEC §12.2, uniform exact-class Yamabe gap](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4549)

Using EXTRACT-E11 on the possible zero-factor subsequences,
these contradictions force the nonzero branch of EXTRACT-E09
for a nonround base at or sufficiently near the infimum
under the coherent smooth comparison hypotheses. In that
branch the factor \(u\) extends smoothly and positively
through the marked points. The identity
\(Y([h])(\int u^4)^{1/2}\le y\int u^4\),
together with \(Y([h])\ge y>0\) and \(\int u^4\le1\),
gives \(Y([h])=y\) and volume one for \(u^2h\).
EXTRACT-E09 gives smooth physical comparison to
\(u^2h\) on fixed compact truncations. EXTRACT-E10
then gives measured Gromov–Hausdorff convergence
of the original physical manifolds along that
subsequence to the closed base with the metric
\(u^2h\), using the whole one-face complements
and the source volume noncollapse. This does
not require uniqueness of the limit factor across
subsequences.
[EXTRACT-E09, volume saturation](../../02_dirac_collar_extraction/notes/E09_CONFORMAL_BASE_VOLUME_DICHOTOMY_20261125.md#a-nonzero-limit-fills-the-volume) · [EXTRACT-E10, physical metric and measures](../../02_dirac_collar_extraction/notes/E10_METRIC_LIMIT_AND_CURVATURE_ATOMS_20261125.md)

Under exact minimizing selection \(e=e_N\) the
chiral Weyl defect is zero. The physical scalar-square
defect is zero by volume saturation, and the
trace-free Ricci and full Riemann defects are
zero by the same-gauge EXTRACT-E10 accounting.
In the strict near-minimizing case (6) also
forces the physical branch. A possible total chiral
defect then has size at most \(e-I^+(M)\), with
the associated Ricci and full Riemann budgets
as in EXTRACT-E10. The exclusion is conditional on the
supplied coherent smooth finite-puncture conformal base.

## Round base with vanishing factor

If \([h]\) is round, \(e_N=0\). The single-pole
identity (3) gives \(D_X=0\), and together with
\(W=0\) and \(s=0\) this makes \(g_X\) flat.
The filled \(X\) is complete, and is simply
connected because it is the smooth sphere
with one point deleted. It is therefore
isometric to Euclidean \(\mathbb R^4\) up to the
chosen scale of the initial normalization.
On the actual comparison domains, other marked
ordinary points can still be missing. Thus (2)
gives a flat pointed model there. This model
accounts for zero curvature energy and can
leave positive energy in the source outside
the comparison. Inequality (5) still holds,
but the flat model gives neither physical
volume saturation nor same-type transfer for
this zero branch. The moving exhaustion of
the actual sources must satisfy additional
comparison or residual estimates for those
conclusions.
