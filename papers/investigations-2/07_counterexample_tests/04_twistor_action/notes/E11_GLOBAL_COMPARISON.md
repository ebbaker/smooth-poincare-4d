# SP4-TWA-E11 · Sharp comparison at the prescribed unequal traces

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. [Frozen request v1](../research-progress/handoffs/E11_REQUEST_v1.md) records the selected lead GPT-6.2 Astra/ultra and configured helper GPT-6.2 Sol/ultra. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all nine frozen SHA-256 digests matched.

## Statement and fixed data

Let \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) have its oriented flat Riemannian product metric and periodic spin structure. Its volume is \(D=2\). Fix a unit parallel positive half-spinor \(\sigma\), with \(S^+\) the chirality on which real self-dual two-forms act. Use the Levi–Civita spin connection, Clifford square \(X\cdot X=-|X|^2\), and the real part of the Hermitian pairing. Let \(P_X=\nabla_X+\tfrac14X\cdot D_g\) be the twistor operator, and take the action \(S_g=J_g^4\) of the [overview](../research-overview/OVERVIEW.md). The fields are smooth up to the boundary and have the fixed traces \(e^{-b}\sigma,e^b\sigma\), \(b=1/200\). They may be zero-free or have finitely many transverse interior zeros with \(P\psi=0\) at each zero.

Let \(\Pi\) be the orthogonal Clifford projection, \(A=\Pi(dt\otimes\cdot)\), \(B=P+bA\), \(k^2=3b^2/4\), and \(\psi_*=e^{bt}\sigma\). For every competitor write \(f=e^{-bt}\psi=\sigma+v\), so \(v\) has zero end traces. Conditional on the frozen homogeneous Sobolev estimate

\[
\|v\|_4\le 24\|\nabla v\|_2,
\]

the global comparison is

\[
\left[J_g(\psi)^2-k^2\sqrt D\right]\|f\|_4^2
\ \ge\ \|Bf\|_2^2-k^2\sqrt D\,\|f\|_4^2
\ \ge\ \tfrac23\|\nabla v\|_2^2 .
\]

Consequently \(\psi_*\) is the unique minimizer over this full fixed-trace class, its action is exactly \(9/(8\cdot 200^4)\), and every smooth admissible minimizing sequence converges strongly to it in \(H^1\). The proof uses the Sobolev estimate as the E11 premise. Its verification belongs to E12. [B07 choice](../brainstorm/notes/B07_GLOBAL_COMPARISON.md)

## Conjugation and exact affine cancellation

The product rule \(P(e^{bt}f)=e^{bt}(Pf+bAf)\) gives

\[
J_g(\psi)^4=\int_{M\setminus Z(f)}\left(\frac{|Bf|}{|f|}\right)^4\,dV_g.
\]

At each admitted zero, with \(r\) the distance from the zero, transversality gives \(|f|\asymp r\). The compatible first jet gives \(Bf=e^{-bt}P\psi=O(r)\), so the ratio is bounded locally. Extend \(q=|Bf|/|f|\) by zero on the finite zero set. Then \(q\in L^4\), \(J_g(\psi)=\|q\|_4\), and \(|Bf|=q|f|\) almost everywhere. Cauchy–Schwarz for \(q^2\) and \(|f|^2\) gives

\[
\|Bf\|_2^2\le J_g(\psi)^2\|f\|_4^2.
\]

Equality here occurs exactly when \(q^2=\lambda |f|^2\) almost everywhere for some \(\lambda\ge 0\). The trace ensures \(\|f\|_4>0\). At \(f=\sigma\), \(q=k\) and \(\lambda=k^2\). [E09 zero and quotient comparison](E09_UNEQUAL_TRACE_GAP.md#holder-unequal-traces-and-the-diagonal)

For Clifford contraction \(c\), the identity \(cc^*=4I\) gives \(\Pi=I-c^*c/4\), whence \(A^*A=\tfrac34I\). The tensor \(A\sigma\) is parallel and in the projection range. Thus \(\int_M (A\sigma,Pv)\,dV_g=\int_M(A\sigma,\nabla v)\,dV_g=0\) by integration by parts and the zero traces. Expanding the squared numerator gives

\[
\|Bf\|_2^2
=Dk^2+2k^2\int_M(\sigma,v)\,dV_g+\|Bv\|_2^2 .
\]

For \(G(f)=\|f\|_4^2\), \(G(\sigma)=\sqrt D\) and \(DG(\sigma)[v]=(2/\sqrt D)\int_M(\sigma,v)\,dV_g\). Thus \(k^2\sqrt D\,G(f)\) has the same constant and linear terms at \(f=\sigma\). [E08 projection and conjugation](E08_LOCAL_DIRICHLET.md#conjugation-stationarity-and-coercivity)

## Global upper Taylor estimate for \(G\)

For real Hilbert-valued \(u,v\in L^4\), put \(u_s=u+sv\) and \(I(s)=\int |u_s|^4\). This is a quartic polynomial with

\[
I'(s)=4\int |u_s|^2(u_s,v),
\qquad
I''(s)=4\int |u_s|^2|v|^2+8\int(u_s,v)^2
\le 12 I(s)^{1/2}\|v\|_4^2.
\]

The inequality uses pointwise Cauchy–Schwarz and \(L^2\) Hölder on the squared norms. For \(I(s)>0\) the second derivative of \(G(u_s)=I(s)^{1/2}\) satisfies

\[
\frac{d^2}{ds^2}G(u_s)
=\frac{I''(s)}{2 I(s)^{1/2}}
-\frac{I'(s)^2}{4 I(s)^{3/2}}
\le 6\|v\|_4^2.
\]

If \(I(s_0)=0\), then \(u=-s_0v\) in \(L^4\) and the whole line satisfies \(G(u_s)=(s-s_0)^2\|v\|_4^2\). Its second derivative is \(2\|v\|_4^2\), including the constant case. Thus the bound holds along any line even at the origin, with first derivative zero there. Integrating from \(s=0\) to \(1\) with Taylor weight \(1-s\) yields

\[
G(u+v)\le G(u)+DG(u)[v]+3\|v\|_4^2 .
\]

The universal remainder constant is sharp. For a unit constant \(u\) on the cylinder and \(v=\varepsilon u\) on one half and \(v=-\varepsilon u\) on the other, \(DG(u)[v]=0\), \(G(u+v)=\sqrt D\sqrt{1+6\varepsilon^2+\varepsilon^4}\), and the excess divided by \(\|v\|_4^2\) tends to \(3\) as \(\varepsilon\to0\). This is a test of the \(L^4\) estimate.

## Coercivity at \(b=1/200\)

For zero-trace \(v\), \(|Pv|^2=|\nabla v|^2-\tfrac14|D_gv|^2\). The flat Dirac identity \(D_g^2=-\Delta\) and integration by parts, first in the Dirac pairing and then with the component Laplacian, give \(\|D_gv\|_2^2=\|\nabla v\|_2^2\). Both surface terms contain the zero trace. Thus \(\|Pv\|_2=(\sqrt3/2)\|\nabla v\|_2\). Integrating \(v\) from the left face in \(t\) and applying Cauchy–Schwarz gives \(\|v\|_2\le2\|\nabla v\|_2\). The reverse triangle inequality and \(A^*A=\tfrac34 I\) now give

\[
\|Bv\|_2\ge\|Pv\|_2-b\|Av\|_2
\ge \tfrac{\sqrt3}2(1-2b)\|\nabla v\|_2 .
\]

The affine cancellation, the Taylor estimate and the assumed homogeneous Sobolev bound yield

\[
\begin{aligned}
\|Bf\|_2^2-k^2\sqrt D\,\|f\|_4^2
&\ge \|Bv\|_2^2-3 k^2\sqrt D\,\|v\|_4^2\\
&\ge \left(\tfrac34(1-2b)^2-3k^2\sqrt D\,24^2\right)\|\nabla v\|_2^2\\
&=\frac{29403-1296\sqrt2}{40000}\,\|\nabla v\|_2^2 .
\end{aligned}
\]

The coefficient exceeds \(27459/40000>2/3\) by \(\sqrt2<3/2\). This proves the stated global comparison. [Homogeneous identity](E09_UNEQUAL_TRACE_GAP.md#flat-zero-trace-estimate-and-orthogonality)

## Equality and minimizing sequences

At the reference field \(f=\sigma\), the quotient is \(k\) everywhere. Thus \(J_g(\psi_*)^2=k^2\sqrt D\) and \(S_g[\psi_*]=Dk^4=9/(8\cdot 200^4)\). The comparison forces \(J_g(\psi)^2\ge k^2\sqrt D\) for every competitor. Equality forces \(\nabla v=0\), hence \(v=0\) by the zero trace. This establishes attainment and uniqueness without any bound on the size of the competitor in a strong norm.

For any smooth admissible minimizing sequence \(\psi_n=e^{bt}(\sigma+v_n)\), set \(\delta_n=J_g(\psi_n)^2-k^2\sqrt D\) and \(x_n=\|\nabla v_n\|_2\). Then \(\delta_n\ge0\) and \(\delta_n\to0\). The global estimate and the triangle inequality give, with \(c_0=2/3\),

\[
\sqrt{c_0}\,x_n
\le \sqrt{\delta_n}\big(D^{1/4}+24x_n\big).
\]

For all sufficiently large \(n\), \(24\sqrt{\delta_n}\le\sqrt{c_0}/2\), hence \(x_n\le 2D^{1/4}\sqrt{\delta_n/c_0}\to0\). The interval estimate gives \(v_n\to0\) strongly in \(H^1\). Multiplication by the fixed smooth \(e^{bt}\) is bounded on \(H^1\), so \(\psi_n\to\psi_*\) strongly in \(H^1\).

## Evidence scope

The nine frozen inputs were checked. The [closing note](../continuation-notes/CLOSING_20261128.md) and B07 fix the exact background and traces. The scoped replays verify the earlier projection, Dirichlet and zero calculations. E08, E09 and the [leading-order asymptotic](SMALL_TRACE_ASYMPTOTIC.md) supply the comparisons at their respective scopes. The global Taylor bound, exact affine cancellation and numerical coercivity are derived here. The result concerns the smooth admissible class on this single length-two unit-torus cylinder at the prescribed \(b\), and the convergence conclusion is in \(H^1\).
