# SP4-CME-E17 — The Lorentz spatial endpoint on the fixed round sphere

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This fixed benchmark follows [B16][decision] and the [request][request].
Input identities are in the [return][return].

Let \(g_0\) be the unit round metric on the standard smooth
oriented \(S^4\), with \(\omega_3=2\pi^2\) the unit \(S^3\) area
and \(V_0=8\pi^2/3\) the \(g_0\) volume. Let \(A\) be any smooth
round-positive definite connection on the chiral bundle of
\((S^4,g_0)\). Use the manuscript's Euclidean internal metric
and fixed \(K>0\), with \(F=-KS\Sigma\), \(S=Q^{1/2}\),
\(Q>0\), \(\operatorname{tr}Q=3\),
\(\mu=\frac13\sum_iF_i\wedge F_i\),
\(F_i\wedge F_j=Q_{ij}\mu\), and
\(dV_{\widehat g}=\mu/(2K^2)\).
Set
\[
T_Y=\tfrac12\bigl(S^{-1}(\nabla^A_Y Q)S^{-1}\bigr)_0,\qquad
D=\sqrt{\lambda_{\max}(Q)/\lambda_{\min}(Q)} .
\]
For \(|T|_{g_0}\) use \(g_0\) in the base covector slot and the
Frobenius inner product in the internal endomorphism slot.

For a finite measure \(\nu\), define \(f_\nu^*(s)\) to be
the decreasing rearrangement of \(|f|\) by its \(\nu\)
distribution function. The norm in this packet has convention
\[
\|f\|_{4,1;\nu}
=\int_0^{\nu(S^4)} s^{1/4}f_\nu^*(s)\,\frac{ds}{s}.
\]
When using \(g_0\) the upper limit is \(V_0\). Tensor \(L^{4,1}\)
norms mean this norm of the stated pointwise tensor norm.
The result is
\[
\operatorname{osc}_{S^4}\log D
\leq C_{\rm round}\,\||T|_{g_0}\|_{4,1;dV_{g_0}},\qquad
C_{\rm round}=2\sqrt2\,\frac{\pi^3}{2V_0}
                    \left(\frac{\omega_3}{4}\right)^{3/4}.
\]
No comparison of the two metrics is required in this form.
For conversion to the reconstructed norm and measure assume
\(C_0^{-1}g_0\leq\widehat g\leq C_0g_0\). The bound then holds
with \(C_0 C_{\rm round}\,\||T|_{\widehat g}\|_{4,1;dV_{\widehat g}}\).

## Round Green kernel and its distribution

Use \(\Delta_{g_0}=\nabla^a\nabla_a\), and normalize \(G_x\) by
\(-\Delta_{g_0}G_x=\delta_x-1/V_0\) and zero mean.
In polar distance \(r=d_{g_0}(x,y)\) the operator on radial
functions is \((\sin^3r)^{-1}\partial_r(\sin^3r\,\partial_r)\).
Away from the pole the radial equation is
\[
(\sin^3r G'(r))'=\sin^3r/V_0 .
\]
To have no flux at the antipode, set
\[
-G'(r)=\frac{\int_r^\pi\sin^3t\,dt}{V_0\sin^3r}
       =\frac{(2-\cos r)\cos(r/2)}{6V_0\sin^3(r/2)} .
\]
The second expression follows from
\(\int_r^\pi\sin^3t\,dt=(1+\cos r)^2(2-\cos r)/3\).
Near the antipode \(G'\) is an odd analytic function of
\(\pi-r\) and vanishes there, so the radial primitive is
smooth at the antipode. At the pole the outward flux of
\(-\nabla G_x\) through the boundary of the small ball is
\[
\lim_{r\downarrow0}\omega_3\sin^3r\,(-G'(r))
=\frac{\omega_3}{V_0}\int_0^\pi\sin^3t\,dt=1 .
\]
This gives the \(\delta_x\) coefficient of \(-\Delta G_x\).
The singularity of \(G_x\) is of order \(r^{-2}\), which is
integrable, so a constant sets the mean to zero.
The kernel derivative obeys the global bound
\[
k_x(y):=|\nabla_yG_x(y)|
\leq C_G\,d_{g_0}(x,y)^{-3},\qquad C_G=\frac{\pi^3}{2V_0}.
\]
This uses \(\sin(r/2)\geq r/\pi\) for \(0\leq r\leq\pi\)
and \((2-\cos r)\cos(r/2)\leq3\).

For every radius \(\rho>0\) the round ball volume satisfies
\[
\operatorname{Vol}_{g_0}(B_\rho(x))
=\omega_3\int_0^{\min(\rho,\pi)}\sin^3t\,dt
\leq\tfrac{\omega_3}{4}\rho^4 .
\]
Therefore the distribution of \(k_x\) has
\[
\operatorname{Vol}_{g_0}\{k_x>\lambda\}
\leq \frac{\omega_3}{4}\,C_G^{4/3}\lambda^{-4/3}.
\]
In the weak norm convention
\(\|k_x\|_{4/3,\infty}=\sup_{0<s<V_0}s^{3/4}(k_x)^*(s)\),
this gives the uniform bound \(B=C_G(\omega_3/4)^{3/4}\).

## Pairing and the Lipschitz distortion field

For nonnegative \(f,k\), the layer-cake formula integrates the
intersection measures of \(\{f>a\}\) and \(\{k>b\}\)
over \(a,b>0\). The intersection measure is at most the
minimum of the separate measures. For rearranged superlevel
sets, the two sets are nested intervals with exactly that minimum
as intersection measure. Thus, by Tonelli,
\[
\int_{S^4} fk_x\,dV_{g_0}
\leq \int_0^{V_0} f^*(s)(k_x)^*(s)\,ds
\leq B\int_0^{V_0}s^{-3/4} f^*(s)\,ds
=B\|f\|_{4,1;dV_{g_0}} .
\]

The function \(h=\log D\) is locally Lipschitz because \(Q\)
is smooth, the extremal eigenvalues are Lipschitz in the
matrix entries, and they are positive. Compactness gives
Lipschitz regularity for a fixed slice without a uniform
positive eigenvalue floor across the class of slices.
For any scalar Lipschitz \(h\) and fixed \(x\), integrate
by parts on \(S^4\setminus B_\epsilon(x)\).
The weak gradient of \(h\) is bounded, and the identity
follows on that smooth domain by the integration by parts
formula for Lipschitz functions. The normal derivative
on the boundary is \(-G'(\epsilon)\).
Its area integral tends to one, so continuity of \(h\)
makes the boundary term tend to \(h(x)\).
The volume term tends to the mean of \(h\).
Finally \(k_x\) is integrable and the pole can be removed
from the gradient pairing by dominated convergence.
This proves the representation at every \(x\),
\[
h(x)-V_0^{-1}\int_{S^4}h\,dV_{g_0}
=\int_{S^4}\langle\nabla_yG_x,\nabla h\rangle_{g_0}\,dV_{g_0}.
\]

The E04 inequality is
\(|dh(Y)|\leq\sqrt2|T_Y|\) almost everywhere, including
the repeated-eigenvalue interpretation.
Its scalar trace cancellation follows from
\(\nabla_Y^A Q=2S T_Y S-\tfrac23\operatorname{tr}(QT_Y)Q\).
On an extremal eigendirection, the derivative of the logarithm
of the eigenvalue has this same scalar term independent of the
chosen direction. It cancels when taking half the difference
for \(\log D\). The difference of two orthogonal rank-one
projectors has Frobenius norm \(\sqrt2\).
At a tie, the one-sided extremes use the restricted derivative
on the eigenspace as in E04. Thus, using \(g_0\) and its
dual on the base, \(|dh|_{g_0}\leq\sqrt2|T|_{g_0}\)
almost everywhere. The Green bound applied to \(f=|dh|_{g_0}\)
gives \(|h(x)-\operatorname{mean}(h)|\leq\sqrt2 B
\||T|_{g_0}\|_{4,1;dV_{g_0}}\). Taking the oscillation gives
the displayed \(C_{\rm round}\).
[E04 derivative including repeated eigenvalues][anchor].

## Changing metric and measure, and the energy anchor

The assumed comparison implies
\(|T|_{g_0}\leq C_0^{1/2}|T|_{\widehat g}\)
and \(dV_{g_0}\leq C_0^2dV_{\widehat g}\).
For a nonnegative function \(f\), the Lorentz norm convention
used here satisfies
\[
\|f\|_{4,1;\nu}=4\int_0^\infty \nu\{f>b\}^{1/4}\,db
\]
by inserting the layer-cake formula in the rearrangement integral.
Consequently \(\nu_1\leq c\nu_2\) multiplies that norm by at
most \(c^{1/4}\). The two conversions together give
\[
\||T|_{g_0}\|_{4,1;dV_{g_0}}
\leq C_0\,\||T|_{\widehat g}\|_{4,1;dV_{\widehat g}},
\]
and the reverse comparison has the same factor.

Let \(q=Q-I\) and \(e=\mathcal P/\int\mu\), with
\(\mathcal P=\int|q|^2\mu\).
If \(e<3/2\), a minimum point of \(|q|^2\) has
\(|q|^2\leq e\) by the normalized positive measure.
The trace-free eigenvalue deviations satisfy
\(|\lambda_i-1|^2\leq2|q|^2/3\) by Cauchy–Schwarz
on the other two eigenvalue deviations.
Thus at the anchor point \(D\leq\sqrt{(1+r)/(1-r)}\)
where \(r=\sqrt{2e/3}<1\).
Combining with the oscillation bound gives, uniformly on \(S^4\),
\[
D\leq D_*:=\sqrt{\frac{1+r}{1-r}}\,
\exp\!\left(C_{\rm round}\,\||T|_{g_0}\|_{4,1;dV_{g_0}}\right),
\qquad
\lambda_{\min}(Q)\geq\frac{3}{1+2D_*^2}.
\]
The floor follows from \(3\leq m+2M_*=m(1+2D^2)\),
with \(m=\lambda_{\min}(Q)\) and \(M_*=\lambda_{\max}(Q)\).
When using reconstructed strain norms and measure, replace the
exponent by \(C_{\rm round}C_0\||T|_{\widehat g}\|_{4,1;dV_{\widehat g}}\).
[E04 energy anchor and trace-three estimate][anchor].

## The logarithmic concentration family and scope

For the E12 family at one fixed \(\delta>0\),
\(D_L(p)=(1+\delta)/(1-\delta)\), while \(D_L=1\)
outside the shrinking support. Its metric comparison holds
uniformly with \(C_0=2\). The present bound forces
\[
\||T_L|_{g_0}\|_{4,1;dV_{g_0}}
\geq C_{\rm round}^{-1}\log\frac{1+\delta}{1-\delta},
\qquad
\||T_L|_{\widehat g_L}\|_{4,1;dV_{\widehat g_L}}
\geq (2C_{\rm round})^{-1}\log\frac{1+\delta}{1-\delta}.
\]
This is a positive lower bound independent of \(L\).
In the same family the \(L^4(dV_{\widehat g_L})\) strain norm
tends to zero by E12, and the uniform comparison gives the
same decay for \(g_0\) norms and measure.
[E12 exact center and \(L^4\) decay, eqs. (1), (8)][concentration].

This establishes a fixed-reference spatial criterion on the
standard sphere. It depends on the round Green kernel, and
using reconstructed norms assumes the stated metric comparison.
No control of the Lorentz norm along Fine's flow or construction
of definite data on an arbitrary homotopy sphere follows.

[decision]: ../brainstorm/notes/B16_ENDPOINT_SPATIAL_NORM_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E17_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E17_RETURN_v1.md
[anchor]: 06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md
[concentration]: 14_CRITICAL_STRAIN_CONCENTRATION_20261122.md
