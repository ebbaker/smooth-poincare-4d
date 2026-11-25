# Subcritical regularity of the recovered Yamabe factors · EXTRACT-E15

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request assigned gpt-6.2-sol/ultra.
Exact serving model and reasoning effort are unavailable.
The EXTRACT-E14 note inspected had SHA-256 `71fa1d973301df7034e2ffdf935aca93a187103f6eb6d60cbcbbc0dd34dea4da`
at starting checkout `7db310a2a9219c537b440d7c2fb39e602a32b729`.
[Frozen check](../research-progress/handoffs/REGULARITY_CHECK_REQUEST_20261125.md)
· [Input EXTRACT-E14](../notes/E14_WEAK_MARKED_BASE_20261125.md)

Under the weak marked comparison in EXTRACT-E14 and its strong
local \(H^1\cap L^4\) recovery of the factor \(u_i\), one has
uniform \(W^{2,s}_{\rm loc}\) bounds for every \(1<s<2\), and
\(u_i\to u\) strongly in \(W^{1,p}_{\rm loc}\) for every \(1\le p<4\).
The physical tensor pullbacks \(u_i^2m_i\) converge strongly in
the same \(W^{1,p}_{\rm loc}\) range. All estimates are on fixed
compacts of the smooth punctured base in the prescribed marking.

## Finite power tests

Write \(R_i=R_{m_i}\), \(\mu_i=\sqrt{\det m_i}\) and
\(A_i=\mu_i m_i^{-1}\) in a fixed coordinate ball.
The convention \(\Delta_m=\operatorname{div}_m\nabla\) gives
\[
 -6\operatorname{div}(A_i Du_i)
     = f_i,\qquad f_i=\mu_i(Y_i u_i^3-R_i u_i).
\tag{1}
\]
The comparison gives \(A_i\to A_h\) in \(C^0\cap W^{1,4}\)
and bounds \(R_i\) in local \(L^2\). The scalar-density part
of the form comparison gives, for \(w\) compactly supported
in this fixed ball,
\[
 \left|\int (R_i\mu_i-R_h\mu_h)w^2\,dx\right|
 \le \varepsilon_i\|w\|_{H^1}^2,\qquad\varepsilon_i\to0.
\tag{2}
\]
For example write the density difference as a divergence
whose coefficient tends to zero in \(L^4\), plus an \(L^2\)
term tending to zero. Integrate the divergence against \(w^2\)
and bound \(2w Dw\) in \(L^{4/3}\). This signed form estimate
is the control on the scalar term in the power test.
[Weak base check](WEAK_BASE_CHECK_20261125.md#yamabe-tests-and-marked-transfer)

For a fixed \(q\ge4\) test (1), with the scalar term moved
to the left, against \(\eta^2 u_i^{q-1}\). Here \(\eta\)
is a smooth compactly supported cutoff on the ball. The fields
are smooth and positive, so these powers are admissible.
Let \(w=\eta u_i^{q/2}\). Writing \(v=u_i^{q/2}\), the two
gradient terms of the power test are
\[
 \frac{24(q-1)}{q^2}\int\eta^2 A_i Dv\cdot Dv\,dx
  +\frac{24}{q}\int\eta v A_i Dv\cdot D\eta\,dx .
\]
Uniform ellipticity, Young's inequality and the product rule
give constants \(c_q>0,C_q<\infty\) independent of \(i\) with
\[
 c_q\|Dw\|_2^2 + \int R_i\mu_i w^2\,dx
 \le \int Y_i\mu_i u_i^2 w^2\,dx
     + C_q\int |D\eta|^2 u_i^q\,dx.
\]
The bounded smooth scalar part and (2) allow the scalar
error \(\varepsilon_i\|Dw\|_2^2\) to be absorbed for large
\(i\) at fixed \(q\). Local \(L^4\) convergence of \(u_i\)
makes \(Y_i\mu_i u_i^2\) strongly convergent in \(L^2\).
Its tails above a sufficiently high fixed level have \(L^2\)
norm arbitrarily small uniformly for large \(i\). Hölder
and Euclidean Sobolev absorb the tail pairing into
\((c_q/2)\|Dw\|_2^2\). The bounded part costs a constant
times \(\|w\|_2^2\), itself bounded by the incoming \(L^q\)
integral on the larger ball. Another Sobolev application
therefore bounds \(u_i\) in \(L^{2q}\) where \(\eta=1\).
Starting at \(q=4\), finitely many nested cutoffs give any
specified finite local exponent. The constants may depend
on that exponent and on the fixed compact.

## Divergence and second-derivative estimates

For the requested divergence check take \(q=16\).
On a fixed inner ball \(f_i\) is bounded in \(L^{16/9}\),
since \(1/2+1/16=9/16\). Set \(p=16/5\); its dual exponent
is \(16/11\), and \(W^{1,16/11}_0\) embeds in \(L^{16/7}\).
Thus \(L^{16/9}\subset W^{-1,p}\). For \(z_i=\eta u_i\),
\[
 -6\operatorname{div}(A_i Dz_i)
  =\eta f_i-6 A_i Du_i\cdot D\eta
         -6\operatorname{div}(u_i A_i D\eta).
\tag{3}
\]
The second term is in \(L^2\subset L^{16/9}\) on the
fixed support, and the last is the divergence of a bounded
\(L^p\) field. The smooth Dirichlet \(W^{-1,p}\to W^{1,p}_0\)
estimate for \(-6\operatorname{div}(A_hD\,\cdot)\) on a fixed
smooth ball now gives a uniform \(W^{1,p}\) bound after absorbing
\(C\|A_i-A_h\|_\infty\|Dz_i\|_p\).
Equivalently, work on a small \(h\)-normal ball and freeze the
coefficient at the identity using the Euclidean estimate.

For all \(1<s<2\) the direct second-derivative argument uses
the stronger finite \(L^q\) bound with
\[
 q\ge \max\{4,\,2s/(2-s)\},\qquad p_s=\frac{4s}{4-s}.
\]
In particular \(R_i u_i\) and \(u_i^3\) are bounded in
\(L^s\). On a small fixed \(h\)-normal ball, expand (3):
\[
\begin{split}
 -6 A_i:D^2z_i
   ={}&\eta f_i-12 A_i Du_i\cdot D\eta
      -6u_i\big(A_i:D^2\eta+(\operatorname{div}A_i)\cdot D\eta\big)\\
     &+6(\operatorname{div}A_i)\cdot Dz_i .
\end{split}
\tag{4}
\]
The first line is bounded in \(L^s\): the derivative
commutator uses the local \(L^2\) bound for \(Du_i\), and the
other coefficient derivative is in \(L^4\) and multiplied by
the available \(L^q\) factor. In the last term
\((\operatorname{div}A_h)\cdot Dz_i\) is bounded in \(L^s\)
by smoothness of \(h\) and the local \(H^1\) bound. The rest
is bounded by \(C\|DA_i-DA_h\|_4\|Dz_i\|_{p_s}\).

Extend \(z_i\) by zero. The Euclidean estimate for the
Laplacian gives \(\|D^2z_i\|_s\le C_s\|\Delta z_i\|_s\),
and the Sobolev estimate gives
\(\|Dz_i\|_{p_s}\le C'_s\|D^2z_i\|_s\). Thus moving
the principal term of (4) to the Euclidean operator costs
\(C_s\|A_i-I\|_\infty\|D^2z_i\|_s\), and the remaining
coefficient derivative costs
\(C''_s\|DA_i-DA_h\|_4\|D^2z_i\|_s\). Shrink the fixed
normal ball first, then take \(i\) large, to absorb both.
This proves the local \(W^{2,s}\) bound. In particular the
term with a derivative of the coefficients uses the strong
\(W^{1,4}\) comparison and the smooth fixed background.
[Calderón–Zygmund, Euclidean singular integral estimate](https://archive.ymsc.tsinghua.edu.cn/pacm_paperurl/20170108203135725155763)
· [Lee–Parker, Theorems 2.1–2.2, Sobolev and Rellich](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For any \(1\le p<4\), choose \(s<2\) with \(p<p_s\).
Rellich on fixed inner balls and the known \(H^1\) limit
give strong \(W^{1,p}\) along the recovery subsequence.
Interpolation of strong \(L^4\) with the higher finite
bounds gives strong local \(L^r\) for every finite \(r\).
In differentiating \(u_i^2m_i\), pair \(Du_i\) in a
strong exponent strictly between \(p\) and \(4\) with
\(u_i\) at the corresponding finite exponent. Pair
\(Dm_i\) in strong \(L^4\) with \(u_i^2\) at the
corresponding finite exponent. This gives the claimed
physical \(W^{1,p}\) convergence. The estimates use the
local scalar-square bound in the comparison gauge, and
their exponents describe local Sobolev regularity on the
marked compacts.
