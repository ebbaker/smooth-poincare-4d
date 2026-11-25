# E54r · Spectral recognition and the unattained energy endpoint

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort are unavailable.
This bounded mathematical review uses the [frozen E52
master](../research-progress/handoffs/E52_RECOGNITION_ENDPOINT_20261125.md),
HEAD `b5de9758f16e14f22162b4a1e091166ea126c389`, and the verified
eight-file transitive TeX digest `2867c940507acb77`. The conventions are
those of the [master's threshold section](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L160).

## Finite-index recognition

Let \(M\) be a smooth, closed, connected, oriented homotopy four-sphere,
and let \(g\) be a smooth volume-one ordinary Yamabe minimizer for a
positive Riemannian conformal class. Write \(Y=Y([g])=R_g>0\),
\(T=4\pi^2\), \(e=E_+(g)=E_-(g)\), and
\(D=\int_M|\operatorname{Ric}_{0,g}|^2\,dV_g\).
For the Weyl endomorphism \(W^\pm\) of \(\Lambda^\pm\), order its
eigenvalues \(\lambda_1^\pm\le\lambda_2^\pm\le\lambda_3^\pm\).
Set

$$
 a_\pm=\lambda_3^\pm,quad
 w_\pm=|W^\pm|_{\rm HS}^2,quad
 b_\pm=\frac{(\lambda_1^\pm-\lambda_2^\pm)^2}{3},quad
 \Lambda=\max(a_+,a_-),quad L=\|\Lambda\|_{L^2(g)} .
$$

Both \(a_\pm\) are nonnegative by trace-freeness. The three-eigenvalue
identity \(\frac23 w_\pm=a_\pm^2+b_\pm\) gives

$$
 b:=\frac23(w_++w_-)-\Lambda^2
     = b_++b_-+\min(a_+^2,a_-^2),\qquad
 B:=\int_M b\,dV_g=\frac43e-L^2\ge0 .
$$

Pointwise \(b=0\) means that one block vanishes and the other has
eigenvalues \((-a/2,-a/2,a)\) for some \(a\ge0\), allowing both to
vanish. Chen–Zhu use the largest **signed** eigenvalue of the Weyl
operator on each block and the Hilbert–Schmidt norm of that operator
in their comparison (1.9). In the ordered four-index convention,
\(|W|_{\rm tens}^2=4(w_++w_-)\) and \(\int_M |W|_{\rm tens}^2=8e\).
The equality of the two chiral energies follows from
\(E_+-E_-=12\pi^2\tau(M)=0\) on \(M\). The measure-level identities
do not require equality of the two chiral charges on subsets.
[Chen–Zhu, pp. 814–815, (1.5) and (1.9)](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=4)
· [Chang–Gursky–Yang, Remark 2 and (0.4)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

With \(8\pi^2\chi(M)=16\pi^2\), Chern–Gauss–Bonnet gives

$$
 16\pi^2=2e-\frac{D}{2}+\frac{Y^2}{24},\qquad
 Y^2-36L^2=12D+36B-96(e-T).
$$

Chen–Zhu Theorem 1.4 applies if \(Y^2-36L^2>0\). The resulting
connected sum consists of a sphere, possibly an \(\mathbb{RP}^4\),
and compact cylinder quotients. Such a cylinder quotient has
nontrivial fundamental group because its simply connected cylinder
cover is noncompact. Fundamental groups of the connected summands
form a free product. Thus \(\pi_1(M)=0\) leaves only the sphere.
At \(Y^2-36L^2=0\), Theorem 1.6 gives the same diffeomorphism
conclusion or two exceptions. The conformal \(\mathbb{CP}^2\)
exception has \(b_2=1\). In the product exception the universal cover
is conformal to a product of constant-curvature surfaces. Since
\(M\) is compact and simply connected, this product is compact and
simply connected, so its connected surface factors are each
diffeomorphic to \(S^2\). This gives \(b_2=2\). Both exceptions
therefore contradict \(b_2(M)=0\). A sphere diffeomorphism can be
made orientation-preserving by composition with a round reflection.
[Chen–Zhu, Theorems 1.4 and 1.6](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=4)

Consequently \(12D+36B\ge96(e-T)\) recognizes the standard smooth
sphere, including equality. A nonstandard smooth type satisfies

$$
 e>T,\qquad D+3B<8(e-T).
$$

This also recovers finite-index recognition at or below \(T\).
The criterion \(Y\ge6L\) is independent of the representative because
the endomorphism eigenvalues scale by \(v^{-2}\) under \(g\mapsto
v^2g\), while \(dV\) scales by \(v^4\). This preserves the integral \(L^2\),
\(B\), the chiral measures and their dominant-chirality sets. For an
arbitrary conformal representative \(h\) the budget reads

$$
 12D_h+36B-96(e-T)
   =(Y^2-36L^2)+\left(\int_M R_h^2\,dV_h-Y^2\right).
$$

The parenthesis is nonnegative by the Yamabe inequality on the
constant test and Cauchy–Schwarz, using \(Y>0\). Thus the upper bound
on \(D\) for a nonstandard type concerns the ordinary Yamabe gauge,
and the formula with \(D_h\) alone cannot be used for recognition
in an arbitrary gauge.

## A sequence approaching the threshold

Suppose the fixed nonstandard \(M\) has such metrics \(g_i\) with
\(e_i\to T\). This is the conditional, unattained case
\(I^+(M)=T\) in the master. Then

$$
 D_i\to0,\qquad B_i\to0,\qquad
 Y_i\to Y_0=8\sqrt3\,\pi,\qquad
 L_i^2\to L_0^2=\frac{16\pi^2}{3},\qquad Y_0=6L_0 .
$$

Write \(d\mu_i^\pm=w_{i,\pm}\,dV_{g_i}\). Use the measurable
partition \(A_i^+=\{a_{i,+}\ge a_{i,-}\}\) and
\(A_i^-=M\setminus A_i^+\). For any measurable \(U\subset M\),

$$
 \mu_i^+(U\cap A_i^-)+\mu_i^-(U\cap A_i^+)
       \le \frac32\int_U b_i\,dV_{g_i}.
$$

Indeed the nondominant block has squared largest eigenvalue equal
to the smaller squared largest eigenvalue, and its remaining defect
is its \(b_{i,\pm}\). Thus each block retains \(T+o(1)\) charge
on its own side, and
\(\int_U\min(w_{i,+},w_{i,-})\,dV_{g_i}
\le\tfrac32\int_U b_i\,dV_{g_i}\).
The chiral measures can be approximated in total variation by
measures supported on disjoint measurable sets at each \(i\).
The sets can change with \(i\), and these bounds give no mutual
singularity statement for their weak limits.

## The modified Yamabe near-minimizers

For a smooth positive \(u\) with \(\int_M u^4\,dV_g=1\), let

$$
 Q_g(u)=\int_M(6|du|^2+R_g u^2)\,dV_g,\qquad
 F_g(u)=Q_g(u)-6\int_M\Lambda u^2\,dV_g,\qquad
 m=\inf_u F_g(u).
$$

This is Chen–Zhu's conformal invariant (1.12). Their Theorem 1.7
gives \(m\le0\) in every class on the fixed nonstandard sphere,
because otherwise the supremum over classes would be positive and
the same connected-sum argument would recognize \(M\). Positivity
of the ordinary Yamabe constant and Cauchy–Schwarz give
\(m\ge Y-6L\). In this setting \(L>0\) and \(k=6L-Y>0\) by the
finite-index result. Direct subtraction gives the exact deficit

$$
 F_g(u)+k=(Q_g(u)-Y)
           +3L\left\|u^2-\frac{\Lambda}{L}\right\|_{L^2(g)}^2 .
$$

The two terms on the right are nonnegative. If \(F_g(u)\le m+\eta\)
then both are bounded by \(k+\eta\). This yields the needed
convergence for any smooth positive normalized tests with
\(\eta_i\to0\), since

$$
 0<k_i
   =\frac{96(e_i-T)-12D_i-36B_i}{6L_i+Y_i}
   \le\frac{96(e_i-T)}{6L_i+Y_i}.
$$

In particular \(m_i\to0\) from the nonpositive side,
\(Q_{g_i}(u_i)-Y_i\to0\), and
\(\|u_i^2-\Lambda_i/L_i\|_{L^2(g_i)}\to0\).
The smooth conformal metrics \(h_i=u_i^2g_i\) have unit volume,
\(\int_M R_{h_i}\,dV_{h_i}=Q_{g_i}(u_i)\), and the same positive
Yamabe constants and chiral measures. [Chen–Zhu, (1.12), Theorem 1.7,
and (2.3)–(2.4)](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=6)

Use the total variation norm of signed measures, equal to the
\(L^1\) norm for densities. Since \(u_i^2\) and \(\Lambda_i/L_i\)
are unit \(L^2(g_i)\) functions, and
\(\frac23(d\mu_i^++d\mu_i^-)-\Lambda_i^2dV_{g_i}\) has
nonnegative density and mass \(B_i\),

$$
 \left\|dV_{h_i}-\frac{d\mu_i^++d\mu_i^-}{2e_i}\right\|_{\rm TV}
 \le 2\left\|u_i^2-\frac{\Lambda_i}{L_i}\right\|_{L^2(g_i)}
           +\frac{2B_i}{4e_i/3}\longrightarrow0.
$$

Restricting this estimate and using the nondominant-block bound
gives \(\|d\mu_i^\pm-2e_i\mathbf1_{A_i^\pm}dV_{h_i}\|_{\rm TV}
\to0\). In particular
\(\operatorname{Vol}_{h_i}(A_i^\pm)\to1/2\). These measure
comparisons hold uniformly over measurable test regions.

## Curvature control from a modified Yamabe minimizer

The preceding conclusions require only approximate minimizers.
One can choose representatives with more curvature control.
Chen–Zhu Lemma 2.1 attains \(m\) in the enlarged class with positive
\(C^{2,\alpha}\) conformal factors. Here \(\Lambda\) is locally
Lipschitz because it is a largest eigenvalue of smooth self-adjoint
endomorphisms, so the cited regularity applies. For the normalized
minimizing factor \(u\) the conformal scalar-curvature equation gives

$$
 R_h-6\Lambda_h=m,\qquad
 \frac{R_h}{6}I_{\Lambda^\pm}-W_h^\pm\ \ge\ \frac m6 I_{\Lambda^\pm},
 \qquad h=u^2g .
$$

Thus the minimum over the two least eigenvalues of the
isotropic-curvature operators is \(m/6\) at every point. The scalar equation
also supplies a two-sided integral estimate. In volume one,
\(Y\le\int_M R_h\,dV_h=6\int_M\Lambda_h\,dV_h+m\).
Since \(m\le0\) and \(Y>0\), this gives

$$
 \begin{aligned}
 \int_M R_h^2\,dV_h
    &=36L^2+m\left(12\int_M\Lambda_h\,dV_h+m\right)\le36L^2,\\
 \|R_h-Y\|_{L^2(h)}^2
    &\le\int_M R_h^2\,dV_h-Y^2\le36L^2-Y^2,\\
 12D_h&=12D+\int_M R_h^2\,dV_h-Y^2
          \le12D+36L^2-Y^2 .
 \end{aligned}
$$

The last line uses Chern–Gauss–Bonnet, valid for this representative by
smooth \(C^2\) approximation. In particular \(D_h+3B\le8(e-T)\).
Equivalently, the conformal scaling of \(\Lambda\) gives the direct
identity

$$
 \|\Lambda_h-L\|_{L^2(h)}
   =L\left\|u^2-\frac{\Lambda}{L}\right\|_{L^2(g)}.
$$

For the sequence, smooth the positive factors in \(C^2\) and
renormalize independently at each \(i\). Approximations can be made
arbitrarily accurate in the scalar curvature, Weyl blocks,
trace-free Ricci and normalized integrals for the fixed \(i\).
Hence one can take smooth volume-one representatives with
\(R_{h_i}-6\Lambda_{h_i}\to0\) uniformly,
\(R_{h_i}\to Y_0\) in \(L^2(h_i)\), and
\(\|\operatorname{Ric}_{0,h_i}\|_{L^2(h_i)}\to0\), while
retaining the measure estimates. This choice depends on the
minimizing equation. The approximate functional estimate for
arbitrary tests only bounds their total scalar integral.
[Chen–Zhu, Lemma 2.1 and (2.3), pp. 819–820, and the operator
criterion on p. 824](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=9)

In this choice of gauge one also has
\(\||\operatorname{Rm}_{h_i}|_{\rm tens}^2-64\pi^2\|_{L^1(h_i)}
\to0\). Indeed the total four-index Weyl squared norm converges
to \(8T=32\pi^2\) in \(L^1(h_i)\) by the total variation
comparison, and the scalar contribution \(R_{h_i}^2/6\) converges
to \(Y_0^2/6=32\pi^2\) in the same sense. The remaining contribution
is \(2|\operatorname{Ric}_{0,h_i}|^2\). Thus a sequence of regions
with \(h_i\)-volume tending to zero has full curvature charge
tending to zero. Geometric compactness or a marked region in the
ordinary Yamabe gauge still requires a separate argument.

## Recognition from a marked exterior

Let \(P\) be a compact connected exterior of finitely many marked
standard balls in \(M\), and give it a smooth metric \(h\) with
exact unit round product collars in the prescribed markings. Use
the master round-boundary construction to attach round cylinders
and compactify by conformally flat smooth caps on the original
smooth type. Write \(\widehat h\) for the compact metric. Because
\(\Lambda_{f^2g}=f^{-2}\Lambda_g\), the closed modified quadratic
form transfers under the same compact-to-cylindrical \(H^1\)
isomorphism as the ordinary form. The additional potential
vanishes on the cylinders and caps. Minimizing across the cylinders
for the traces \(\tau_b(v)\) on the marked faces therefore gives

$$
 F_{h,P}^{\Lambda}(v)
 =\int_P \bigl(6|dv|_h^2+(R_h-6\Lambda_h)v^2\bigr)\,dV_h
   +6\sum_b
     \big\langle \tau_b(v),\sqrt{1-\Delta_\gamma}\,\tau_b(v)\big\rangle,
 \qquad v\in H^1(P).
$$

Assume \(F_{h,P}^{\Lambda}(v)>0\) for every nonzero retained
test \(v\). A nonzero closed test either restricts to such a
retained test or has strictly positive cylindrical energy on an
end. The transferred closed quadratic form is thus strictly
positive. Its potential \(R_{\widehat h}-6\Lambda_{\widehat h}\)
is bounded. On this fixed compact manifold its first \(L^2\)
Rayleigh value is attained by the direct method and is positive.
This and the bounded potential make the form coercive on \(H^1\).
The compact Sobolev inequality then gives a positive lower bound
for the normalized modified quotient. By Chen–Zhu Theorem 1.7
the marked smooth type is standard. The minimizing extension
also proves necessity of the exterior test for positivity of the
modified quotient on this particular capped class.
[Master round-boundary form](../manuscript/marked_cut.tex#L117)
· [Conformal transfer verification](E45_ROUND_END_FORM.md#the-conformal-change-on-sobolev-tests)
· [Chen–Zhu, Theorem 1.7](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf#page=6)

A second test uses positivity of the **ordinary** exterior form
to give \(Y([\widehat h])>0\). Define \(e(P)=E_+(h;P)\) and
\(B(P)=\int_P b\,dV_h\). The Weyl curvature vanishes on the caps,
so these values are preserved upon closing. Consequently

$$
 e(P)-\frac38 B(P)\le T
$$

also recognizes the standard sphere. On a nonstandard type this
would contradict \(D+3B<8(e-T)\) on the closed ordinary Yamabe
minimizer, since \(D\ge0\). Thus the modified form gives a sign
test independent of an energy ceiling, and the ordinary form
combines with the stated exterior energy and spectral budget.
Both implications require a supplied qualifying marked exterior.

## Finite return

| Assertion | Verdict |
| --- | --- |
| Spectral decomposition and curvature normalizations | Pass in both stated norm conventions. |
| Strict obstruction on nonstandard type | Pass. Equality also recognizes the standard sphere. |
| Endpoint Ricci, spectral deficits and localized chiral measures | Pass under the positive ordinary Yamabe and same-type sequence hypotheses. |
| Modified sign, near-minimizer rigidity and volume comparison | Pass with quantitative deficits, including tests chosen smooth and positive. |
| Stronger curvature control in the modified gauge | Pass for the selected minimizing factors and their smooth approximations. |
| Modified and ordinary marked exterior tests | Pass for the supplied exact round-collar metric and markings. |

Inspected on 25 November 2026. Bing-Long Chen and Xi-Ping Zhu,
*A conformally invariant classification theorem in four dimensions*,
Communications in Analysis and Geometry **22** (2014), no. 5,
811–831. Checked the journal statements and relevant proof passages
of Theorems 1.4, 1.6 and 1.7, equations (1.5), (1.9), (1.12),
(2.3)–(2.4), and Lemma 2.1. Also checked the preprint formulation
of Theorem 1.4 and Chang–Gursky–Yang's Theorems A/B, Remark 2
and (0.4). [Journal PDF](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)
· [arXiv:1206.5051](https://arxiv.org/abs/1206.5051)
· [Chang–Gursky–Yang journal PDF](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf)
