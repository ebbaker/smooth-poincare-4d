# Which Weyl curvature must cross a spherical interface?

24 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. The author-selected lead was retained. The lead's actual model identifier and effort are unavailable. Execution helpers are requested/configured as gpt-6.2-sol/ultra. A configuration is not independent backend attestation. Lead assessment of E21–E23, E26–E28 and E32–E33. The [input manifest](../brainstorm/notes/SEC_B16_SPHERICAL_TRANSMISSION_20261124.md) records the working files and checkout. The [B18](../brainstorm/notes/SEC_B18_LOCAL_RESPONSE_AND_EXTERIOR_CONTROLS_20261124.md) and [B20](../brainstorm/notes/SEC_B20_EXACT_ANGULAR_OBSERVATION_20261124.md) decisions distinguish the round calibration from information intrinsic to a round patch.

## The round calculation

Write the unit round metric as \(r=\Omega^2\delta\), \(\Omega=2/(1+\rho^2)\). The equator is \(\rho=1\). Prescribe the self-dual Weyl derivative in flat frames as \(f(x)=\chi(\rho)Z\), with the smooth positive bump from B16 supported in \(\rho\le1/2\) and \(Z=\operatorname{diag}(1,1,-2)\). Its round-frame value is \(\Omega^{-2}f\). Define \(m_j=\int_{\mathbb R^4}|x|^j\chi(|x|)\,dx\). A constant local adjoint mode pairs nontrivially with \(f\), so a compact correction in the northern cap cannot produce this source.

Let \(D_\pm=(W^\pm)'_r\), and invert \(D_+\) on the global transverse-traceless round metric slice. The opposite curvature \(D_-D_+^{-1}\) is a real \(L^2\) isometry. Its flat Fourier multiplier sends \(Z\) to \(M(n)Z=Q_nZQ_n^{-1}\), where \(Q_n\) is reflection in the hyperplane perpendicular to \(n=\xi/|\xi|\), acting on two-forms from \(\Lambda^+\) to \(\Lambda^-\). Both chiral symbols on transverse-traceless tensors have the same coefficient. The round \(L^2\) comparison excludes a zero-frequency ambiguity. [Symbol and equation](../notes/SEC_E21_20261124.md)

The components of \(|x|^4 M(x/|x|)Z\) are harmonic quartics. Acting on the radial biharmonic potential of \(\chi\) gives the flat exterior field \(q(x)=a(\rho)M(x/\rho)Z\), with
\[
 a(\rho)=\frac6{\pi^2}\left(m_0\rho^{-4}-2m_2\rho^{-6}\right),\qquad \rho\ge\tfrac12 .
\]
The physical round field is \(\Omega^{-2}q\). At the equator its norm is \(6\sqrt6(m_0-2m_2)/\pi^2\). At the south pole its norm is \(3\sqrt6\,m_0/(2\pi^2)\). In the second oriented frame the apparent angular dependence cancels against the bundle transition. A single global positive metric supplies all interface jets, with opposite choices of outward normal on its two pieces. [Radial calculation](../notes/SEC_E22_20261124.md) · [Angular algebra and transition](../notes/SEC_E23_20261124.md)

On this known sphere there is a smooth fixed-volume family with transported \(W^+=t\Omega^{-2}f\) exactly. For small nonzero \(t\) the entire closed southern cap is ASD and nowhere Weyl-flat. Its opposite-chirality energy is
\[
 \frac{432}{\pi^2}\left(\frac{m_0^2}{4}-\frac{2m_0m_2}{3}+\frac{m_2^2}{2}\right)t^2+O(|t|^3).
\]
The Yamabe sign is positive by round closeness. This is a nonlinear example on a sphere whose smooth type is supplied. [Metric construction and uniform remainder](../notes/SEC_E28_20261124.md)

## What an arbitrary exterior can change

Take only a round coordinate ball in an arbitrary smooth manifold. On its flat representative, let \(D_+h=t f+e\) and \(q=D_-h\) for the same variation. No outer metric or normal derivative is fixed. For \(A=\{2/3<\rho<1\}\),
\[
 \|q\|_{L^2(A)}+\|e\|_{L^2(B)}\ \ge\ |t|\,\|a(\rho)M(n)Z\|_{L^2(A)} .
\]
The sharp linear constant is attained by restricting and conformally flattening the global round linear transverse-traceless lift of \(t f_{\rm round}\), which has \(e=0\). At zero error, the spherical projection of \(q\) onto the five-dimensional space \(n\mapsto M(n)V\) equals \(t a(\rho)M(n)Z\) at every radius in \(A\). This experiment leaves the other angular components unspecified. For general \(L^2\) error, the same projection is fixed after subtracting the unitary response \(T\widetilde e\) to the zero extension of the error. The all-radii statement then refers to the smooth representative of \(q-T\widetilde e\). For a supplied metric in the same fixed-volume logarithmic chart with trace-free, \(C^2\)-small \(h\) and exact positive-block target \(t f_{\rm round}\), Taylor expansion gives the norm bound with loss \(C\|h\|_{C^2(B)}^2\). The nonlinear lower bound is positive when this loss is less than the leading annular norm. The observation is inside the supplied collar. There is no formula here for curvature deep in an unknown complement. [Robust preliminary bound](../notes/SEC_E26_20261124.md) · [Sharp angular measurement](../notes/SEC_E32_20261124.md)

The underlying test is local. Extend \(e\) by zero and subtract its unitary response and \(tTf\) from \(q\). The residual lies in \(\ker D_-^*\) on the ball. Every shell probe \(\eta(\rho)M(n)V\) equals \(D_-D_+^*(\phi(\rho^2)V)\) for a smooth compactly supported test. Four radial integrations give \(\phi\) polynomial near the origin. Testing the adjoint gives the exact measurement. For a signed radial bump the compactly supported linear metric-lift criterion is precisely \(m_0=m_2=0\). The two adjoint tests are \(Z\) and \(|x|^2Z\). For round adjoint components \(A\), let \(z=\Omega^2 A\) be their flat representative. The radial pairing is \(\langle Z,m_0z(0)+(m_2/8)\Delta z(0)\rangle\). Thus a measurable angular response and a *global* adjoint obstruction are distinct conditions. [Compact support and moments](../notes/SEC_E33_20261124.md)

## What can be solved on the actual manifold

Install a round neighborhood of a prescribed coordinate ball \(K\) in a smooth positive reference metric \(r\) on a homotopy sphere. Write \(L=dF_r(0)\) in the full trace-free fixed-volume chart. If a global field in \(\ker L^*\) vanishes outside \(K\), extension by zero through the round neighborhood gives a round-sphere adjoint field, hence zero. For an orthonormal basis \(Z_i\) of this finite-dimensional kernel, a smooth cutoff \(w\) zero on \(K\) and positive outside makes \(\Gamma_{ij}=\langle Z_i,wZ_j\rangle\) positive definite. For all sufficiently small smooth targets \(y\) a smooth metric on the given \(M\) solves
\[
 F_r(h)=W_r^++y-\sum_i c_i(y)wZ_i,\qquad
 c(y)=\Gamma^{-1}\big(\langle Z_i,y\rangle\big)_i+O(\|y\|_{H^s}^2).
\]
The curvature is prescribed exactly on \(K\), and its exterior correction belongs to a specified finite-dimensional space. Global balance requires all \(c_i\) to vanish on this slice. The initial exterior curvature \(W_r^+\), the inverse estimates and the coefficients can each depend on the actual metric. The smooth exterior is contractible with boundary \(S^3\). Its analytic treatment uses its given smooth structure. [Local nonlinear theorem and exact balance equation](../notes/SEC_E27_20261124.md)

With \(W^+=0\) on a region, the twistor almost complex structure of the chosen chirality is integrable there. The observed \(W^-\) obstructs the orientation-reversed integrability condition wherever it is nonzero. All these structures use one conformal metric and its compatible chiral connection. Signature equates the two *global* energies on a homotopy sphere, so the opposite energy in a retained collar also contributes a lower bound on the global \(E_+\). Removing the collar source, or balancing its exterior correction and continuing to a recognizing metric, remains a global problem. [Common conventions](../../brainstorm/notes/SH_B01_CONVENTIONS_20261124.md) · [Recognition audit](../../notes/SH_E01_20261124.md)

A [distinct proof check](../notes/SEC_E39_20261124.md) verified the constants, compact probes and support criterion. Its scope qualifications are incorporated above. The [reverse patch](../research-progress/handoffs/SP4-FOT-SEC-E39_FROZEN_SYNTHESIS_REVERSE.diff) reproduces the synthesis frozen in the request.
