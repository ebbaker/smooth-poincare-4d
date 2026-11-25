# Physical volume in a smooth conformal base comparison

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning
effort are unavailable. The source versions and scope are in
[EXTRACT-E09 revision 1](../research-progress/handoffs/E09_REQUEST_20261125.md).

## Statement and smooth gauge

Let \(g_i\) be smooth unit-volume positive Yamabe minimizers
on a fixed smooth closed oriented homotopy four-sphere \(M\),
with energies in the fixed SEC band, \(Y([g_i])=Y_i\to y>0\),
\(E_+(g_i)\to e\), and vanishing total Bach norm. Let \(N\)
be a smooth closed oriented homotopy four-sphere, \(P\) a
finite set of smooth points, and \(N^\circ=N\setminus P\).
Suppose there are oriented embeddings \(F_i\) of neighborhoods
of full compact truncations exhausting \(N^\circ\), compatible
on the exhaustion, and positive smooth functions \(u_i\) there
with
\[
 F_i^*g_i=u_i^2 h_i,\qquad h_i\longrightarrow h
        \quad\text{in }C^\infty_{\rm loc}(N^\circ).
\]
Assume the \(h\)-conformal class has a smooth positive
representative on \(N\). If that representative is \(a^2 h\)
on \(N^\circ\), use \(a^2h_i\) and \(u_i/a\) in the comparison.
The masses \(u_i^4dV_{h_i}\) agree in both descriptions.
Thus take \(h\) smooth on \(N\) from the outset. This fixed
change uses convergence only on each fixed truncation.

After a subsequence, the factors converge weakly in
\(H^1_{\rm loc}\) and strongly in \(L^q_{\rm loc}\) for \(q<4\)
to a nonnegative \(u\), with \(\int_N u^4\,dV_h\le1\).
If \(u\) is nonzero, then \(Y([h])=y\), \(u^2h\) is a
smooth positive unit-volume Yamabe minimizer on \(N\), and
the physical pullbacks tend to it smoothly on the same
fixed compact sets. In this case the base carries the whole
physical volume in the limit obtained by first taking \(i\)
large and then exhausting \(N^\circ\). If \(y<Y_{\rm rd}\)
and \(u=0\), the physical volume tends to zero on every
fixed compared compact, and the factors converge there
smoothly to zero. In particular a positive lower physical
volume on one fixed compared compact forces the nonzero
case when \(y<Y_{\rm rd}\).

These are alternatives for the supplied conformal comparison.
No physical coefficient estimates are assumed. The
[physical-base request](../research-progress/handoffs/E08_REQUEST_20261125.md)
and [SEC §12.4](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4639)
give the associated matched comparison setting.

## Equation and weak limit

Use \(\Delta_h=\operatorname{div}_h\nabla\) and
\(L_h=-6\Delta_h+R_h\). In dimension four the conformal
scalar law and the positive constant scalar curvature
of the physical Yamabe metric give
\[
 L_{h_i}u_i=Y_i u_i^3,\qquad
 \int_K u_i^4\,dV_{h_i}
    =\operatorname{Vol}_{g_i}(F_i(K))\le1
\]
on each fixed compact \(K\subset N^\circ\) and all large \(i\).
For any smooth cutoff \(\chi\) supported in such a comparison
domain, testing the equation with \(\chi^2 u_i\) yields
\[
 Q_{h_i}(\chi u_i)
   =Y_i\int \chi^2u_i^4\,dV_{h_i}
       +6\int u_i^2|d\chi|_{h_i}^2\,dV_{h_i},\qquad
 Q_k(w)=\int(6|dw|_k^2+R_k w^2)\,dV_k .
 \tag{1}
\]
The scalar coefficients and cutoff norms are bounded in
the compared gauges on the fixed support. The mass bound
and Hölder then give uniform \(H^1\) bounds on each fixed
interior compact. Rellich and a diagonal subsequence give
the asserted weak and strong convergence and almost-everywhere
convergence. The locally bounded \(u_i^3\) in \(L^{4/3}\)
converge weakly to \(u^3\), using their almost-everywhere
convergence. Since the \(h_i\) converge smoothly, the weak
equations pass to
\[
 L_hu=yu^3\qquad\text{on }N^\circ .
\]
Fatou on fixed truncations and exhaustion gives the mass
bound. [Lee–Parker, §2 and Theorem 2.2](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

The source Yamabe inequality also gives \(Y([h])\ge y\).
For a smooth compactly supported \(w\) on \(N^\circ\),
transport \(w/u_i\) by \(F_i\) and extend by zero. Its
Yamabe quotient in \(g_i\) equals the quotient of \(w\)
in \(h_i\), by conformal covariance; hence the latter is
at least \(Y_i\). Taking \(i\to\infty\) proves the inequality
on punctured compact supports. Cutoffs about the finitely
many smooth points with \(\|d\chi_\epsilon\|_2=O(\epsilon)\)
approximate fixed smooth closed test functions in \(H^1\)
and \(L^4\), proving the closed inequality. This comparison
does not estimate \(d u_i\) on the source gauge.

## A nonzero limit fills the volume

Choose cutoffs \(\chi_\epsilon\) on \(N^\circ\) equal to
zero within distance \(\epsilon\) of \(P\), equal to one
outside its \(2\epsilon\) neighborhood, and satisfying
\(\|d\chi_\epsilon\|_{4,h}\le C\). The latter follows
from the annular volumes \(O(\epsilon^4)\) and derivative
bound \(O(\epsilon^{-1})\). Testing the weak equation with
\(\chi_\epsilon^2u\), justified by density on the compact
support, gives (1) for \(u,h,y\). Its cutoff error tends to
zero, since
\[
 \int |d\chi_\epsilon|^2 u^2\,dV_h
 \le C\|u\|_{L^4(\operatorname{supp}d\chi_\epsilon,h)}^2
 \longrightarrow0 .
\]
The identity and bounded scalar coefficient give bounded
gradient energy of \(\chi_\epsilon u\). Since these
functions equal \(u\) on the exhausting interiors, \(du\)
has finite \(L^2\) integral on \(N^\circ\). The gradient
difference from \(du\) there is
\((\chi_\epsilon-1)du+u\,d\chi_\epsilon\), tending to zero in
\(L^2\). Thus \(u\in H^1(N)\), and
\[
 Q_h(u)=y\int u^4\,dV_h,\qquad
 Y([h])\left(\int u^4\,dV_h\right)^{1/2}
    \le y\int u^4\,dV_h .
\]
For \(m=\int_Nu^4>0\) this reads
\(y\le Y([h])\le y\sqrt m\le y\). Hence \(m=1\),
\(Y([h])=y\) and \(u\) attains the closed Yamabe quotient.
For \(P=\varnothing\) the same identity uses \(\chi=1\).

The minimizer satisfies the closed weak Yamabe equation by
variation. It is smooth and positive. One can obtain
the initial higher integrability by testing with truncated
powers and decomposing the coefficient \(yu^2-R_h\in L^2\)
into a bounded part and an arbitrarily small \(L^2\) tail.
The Sobolev inequality absorbs the tail at each fixed power.
Elliptic bootstrapping then gives smoothness, and the strong
maximum principle gives positivity from nonzero mass.
[Lee–Parker, Theorems 2.5–2.6 and the critical regularity discussion after Theorem 4.1](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For convergence, extract also a locally weak limit \(\nu\)
of \(\nu_i=u_i^4dV_{h_i}\). It has mass at most one on
\(N^\circ\) and \(\nu\ge u^4dV_h\) by Fatou on compact
supports. When \(m=1\), equality follows. Testing against
compactly supported fourth powers of cutoffs gives convergence
of the corresponding \(L^4\) norms. Weak convergence and
uniform convexity give strong \(L^4\) convergence on each
interior compact in the fixed \(h\) measure.

The smooth convergence of \(h_i\) and strong local \(L^4\)
convergence make \(V_i=Y_i u_i^2-R_{h_i}\) strongly
convergent in \(L^2_{\rm loc}\). To obtain a uniform bound
on higher norms, test \(-6\Delta_{h_i}u_i=V_i u_i\) with
\(\eta^2u_i^{q-1}\), where \(\eta\) is a spatial cutoff
and \(q\ge4\) is fixed. The gradient estimate for
\(\eta u_i^{q/2}\) has right side bounded by
\(C_q\int |V_i|(\eta u_i^{q/2})^2+
 C_q\int|d\eta|^2u_i^q\).
The uniform local Sobolev estimate for \(h_i\) absorbs the
\(L^2\)-small remainder after truncating \(V_i\) at a common
finite level for this \(q\). The result bounds the \(L^{2q}\)
norm on a smaller compact by the \(L^q\) norm on the
initial one. Finitely many nested steps give a high finite
\(L^q\) bound, then interior elliptic estimates give uniform
\(L^\infty\) and smooth bounds. This argument requires only
smoothness of the \(h_i\) on the larger compared compact.
Compactness and the known weak limit yield \(u_i\to u\)
in \(C^\infty\) on every fixed interior compact. Consequently
\(F_i^*g_i\to u^2h\) there. Integrating at fixed truncation
and then exhausting yields that the captured physical
volume tends to one.

## The strict round gap prevents local volume concentration

The following argument works for any weak local limit and
its mass measure \(\nu\) above. About a fixed \(x\in N^\circ\),
take a cutoff \(\chi_r\) equal to one on \(B_h(x,r)\), supported
inside \(B_h(x,2r)\), with \(\|d\chi_r\|_4\le C\).
The Euclidean sharp Sobolev inequality on the coordinate
ball, with the comparison of coefficients in \(h_i\), gives
\[
 (Y_{\rm rd}-\epsilon_r-o_i(1))
       \left(\int \chi_r^4\,d\nu_i\right)^{1/2}
 \le 6\int |d(\chi_r u_i)|_{h_i}^2\,dV_{h_i},
 \qquad \epsilon_r\longrightarrow0 .
\]
Using (1), the right side is
\(Y_i\int\chi_r^2\,d\nu_i+
6\int |d\chi_r|^2 u_i^2-\int R_{h_i}\chi_r^2u_i^2\),
with all last integrals in \(h_i\). At fixed \(r\), strong
\(L^2_{\rm loc}\) convergence gives the corresponding terms
for \(u\). Then \(r\downarrow0\) makes the last two terms
vanish by \(u\in L^4\), bounded scalar curvature, and the
cutoff derivative bound. For an atom \(m_x=\nu(\{x\})>0\)
this gives
\[
 Y_{\rm rd}\sqrt{m_x}\le y m_x,\qquad
 m_x\ge (Y_{\rm rd}/y)^2.
\]
In particular there is no atom when \(y<Y_{\rm rd}\).
[Lee–Parker, §3 and Theorem 3.3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For \(u=0\) and \(y<Y_{\rm rd}\) there is a direct proof
that **all** of \(\nu\) vanishes, including any putative
diffuse part. Use any fixed cutoff supported in a chart
so small that its sharp Sobolev coefficient \(Y_{\rm rd}-\epsilon\)
is strictly greater than \(y\). The scalar and cutoff
errors in (1) now tend to zero already at fixed support.
The inequality above gives
\[
 (Y_{\rm rd}-\epsilon)\left(\int\chi^4\,d\nu\right)^{1/2}
 \le y\int\chi^2\,d\nu
 \le y\left(\int\chi^4\,d\nu\right)^{1/2},
\]
since \(\nu(N^\circ)\le1\). Hence every such cutoff
detects zero mass, and \(\nu=0\). Using a cutoff equal to
one near any fixed compact gives strong \(L^4_{\rm loc}\)
convergence to zero. The same interior elliptic argument
gives \(u_i\to0\) smoothly on fixed compacts.
The argument with the strict inequality leaves open
concentration with mass one at a regular point when
\(y=Y_{\rm rd}\).

A compact \(K\) with
\(\liminf_i\operatorname{Vol}_{g_i}(F_i(K))>0\) rules out
the zero alternative on every extracted subsequence for
\(y<Y_{\rm rd}\). A positive limsup suffices to choose one
nonzero subsequence. Containment of an actual source ball
of fixed positive physical radius in \(F_i(K)\) supplies
a uniform lower bound by the unit-volume Yamabe
ball estimate. This premise is a statement about the
comparison image. [NECK-E11 ball estimate](../../01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)

## Consequences for the matched smooth base

Smooth conformal comparison and conformal invariance of the
dimension-four \(L^1\) Bach density give \(B_h=0\) on \(N^\circ\)
and hence on \(N\). Write \(e_N=E_+(h)=E_+(u^2h)\) in the
nonzero case. Suppose also that a full embedded nonflat
smooth ALE component \(X\) satisfying SEC §§11–12 is supplied
with the required disjointness on matched fixed truncations.
Then \(e_N+e_X\le e\) by nonnegativity and conformal convergence,
and \(e_X>4\pi^2\). It follows that \(e_N<4\pi^2\),
so SEC's positive-Yamabe closed Bach-flat gap makes \(N\)
conformally round. The nonzero volume branch gives \(y=Y([h])
=Y_{\rm rd}\). But the nonflat ALE compactification inherits
Yamabe constant at least \(y\) and has nonzero Weyl energy.
Schoen's strict round inequality rules that out. Thus the
nonvanishing base and such a separate nonflat ALE component
cannot coexist. [SEC §§11.5, 12.1 and 12.4](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4288) · [Schoen, Theorem 2](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf)

When \(y<Y_{\rm rd}\) and the nonzero branch holds, the
closed Bach-flat \(N\) is nonround and \(e_N>4\pi^2\).
The residual satisfies \(0\le e-e_N<4\pi^2-\delta\).
The finite-puncture transfer therefore gives
\(N\cong M\) by an oriented diffeomorphism using the whole
matched comparisons. If there are no punctures, the comparison
of the whole closed \(N\) is already a diffeomorphism.
Under minimizing selection \(e=I^+(M)\), the transferred
positive Yamabe class is an admissible competitor with
energy \(e_N\), so \(e=e_N\). In the absence of such selection,
the upper residual bound remains the conclusion about
energy outside the base. Physical volume accounting alone
gives no Weyl energy equality. [NECK finite-puncture transfer](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md)

A vanishing-volume comparison can occur under the stated
conformal comparison definition on any supplied source
sequence. For example, take \(N=S^4\), remove one point,
and use oriented stereographic coordinates \(x\) with
\(\omega(x)=2/(1+|x|^2)\) and round metric \(\omega^2\delta\).
Embed growing coordinate balls by oriented source normal
charts \(F_i(x)=\exp_{q_i}^{g_i}(\lambda_i x)\), using an
oriented orthonormal tangent identification and choosing
\(\lambda_i\downarrow0\) sufficiently fast for the indicated
growing balls. For each fixed compact,
\(\lambda_i^{-2}F_i^*g_i\to\delta\) smoothly. The gauges
\[
 h_i=\omega^2\lambda_i^{-2}F_i^*g_i,\qquad
 u_i=\lambda_i/\omega
\]
then have smooth round limit and \(u_i\to0\) there. This
example uses the conformal comparison definition alone,
without claiming matching to another prescribed component.
The outstanding geometric input for an arbitrary proposed
nonround base is physical volume on a fixed compared compact.
