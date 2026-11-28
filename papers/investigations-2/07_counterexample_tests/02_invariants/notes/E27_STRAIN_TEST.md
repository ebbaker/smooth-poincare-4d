# WIN-E27 · A transverse-traceless test for the metric perturbation

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The packet specifies GPT-6.2 Sol/ultra routing. Actual
serving variant and effort are unavailable. Inputs are checkout
`86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`, the working-tree [comparison request](../research-progress/handoffs/REQUEST_B08_COMPARISONS_R1.md)
and [frozen metric, revision 1](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md),
and the [orthogonal jet split](BALANCED_SPECTRAL_BOUND.md) stated in the
spectral bound. This is a working analytic estimate for the smooth Riemannian
standard four-sphere, pending independent replay and formal verification.

## Estimate

Write \(q\) for the unit round source metric and \(q_{\rm tar}\) for the unit
round metric on the target \(S^4\subset\mathbb R^5\). Use \(d\nu=dV_q/V_0\),
where \(V_0=8\pi^2/3\), and let \(\gamma=q+h\) be the comparison metric at
\(t=\tau=a^6\). Let \(f\) be the smooth kernel map of a generating
quaternionic pencil of positive half-spinors in the prescribed orientation.
Keep its residue \(R\) under conformal transport from \(g\) to \(\gamma\).
The centering measure for the pencil is \(dV_g\). For any supplied
\(O\in O(5)\), let \(u(x)=Ox\), \(v=f-u\) and
\(E=\int |dv|_q^2\,d\nu\), using the Euclidean target for \(dv\).

If \(E\le 1\), \(\sqrt R\le t^2\), and \(T\) is a symmetric covariant
tensor with \(\operatorname{tr}_q T=0\), \(\nabla^i T_{ij}=0\) and
\(|T|_q\le K\), then
\[
 \left|\int\langle T,h\rangle_q\,d\nu\right|
 \le K\left(\frac54 E+2t\sqrt E+24 R^{1/4}\right).
\]
Distributional vanishing of the divergence suffices for bounded \(T\). All
pointwise tensor norms below are Hilbert–Schmidt unless marked as operator
norms. The estimate uses spherical values, the jet split and the supplied
\(O\). The only inputs from \(T\) are its trace, distributional divergence
and pointwise norm bound.

## Cancellation in the round embedding

Let \(Q=f^*q_{\rm tar}\) and \(\alpha(Y)=\langle v,du(Y)\rangle_{\mathbb R^5}\).
For the unit spherical embedding, with ambient flat derivative \(\overline\nabla\)
and source Levi-Civita connection \(\nabla\),
\[
 \overline\nabla_X(du(Y))-du(\nabla_XY)=-q(X,Y)u.
\]
The tangential projection on the left vanishes by metric compatibility and
absence of torsion for the induced connection. The normal component follows
by differentiating \(\langle u,du(Y)\rangle=0\). Thus
\((\nabla_X\alpha)(Y)=\langle dv(X),du(Y)\rangle-q(X,Y)\langle v,u\rangle\).
Using \(|u+v|^2=|u|^2=1\) gives \(2\langle v,u\rangle=-|v|^2\), so the exact
tensor expansion is
\[
 Q=q+2\operatorname{sym}\nabla\alpha-|v|^2q+(dv)^*dv,
\]
where \(\operatorname{sym}\) averages the two transposed components. The
terms proportional to \(q\) vanish against \(T\). Integration by parts on
the closed sphere kills the symmetrized derivative against \(T\), since
\(d\nu\) is a constant multiple of \(dV_q\). Consequently
\[
 \int\langle T,Q\rangle_q\,d\nu=\int\langle T,(dv)^*dv\rangle_q\,d\nu,
 \qquad
 \left|\int\langle T,Q\rangle_q\,d\nu\right|\le K E.
\]
The pointwise estimate uses \(|(dv)^*dv|_q\le |dv|_q^2\), by comparing the
Euclidean norm and sum of the nonnegative eigenvalues of \((dv)^*dv\).

## Metric comparison and signed defect

In the stereographic \(q\)-orthonormal coframe \(\Omega\,dy^i\), the matrix of
\(h\) on its support has diagonal entries \((0,b,-b,0)\), where
\(b=\varepsilon\chi(s)(y^1)^2\) since \(\rho=1\) there. Thus \(|b|\le t\),
\(\operatorname{tr}_q h=0\), \(\operatorname{tr}_q\gamma=4\), and
\(|h|_q\le\sqrt2\,t\le 2t\) everywhere. Put \(B=(q^{-1}\gamma)^{1/2}\). Its
eigenvalues lie between \(\sqrt{1-t}\) and \(\sqrt{1+t}\). A matrix of \(df\)
in a \(q\)-orthonormal frame is carried to its matrix in the corresponding
\(\gamma\)-orthonormal frame by right multiplication by \(B^{-1}\). A
covariant two-tensor with matrix \(D_\gamma\) in the latter frame has matrix
\(B D_\gamma B\) in the former. Hence
\[
 |df|_\gamma\le (1-t)^{-1/2}|df|_q,\qquad
 |D|_q\le (1+t)|D|_\gamma,\qquad
 (1-t)^2\le dV_\gamma/dV_q=\det B\le(1+t)^2.
\]

In the \(\gamma\) frames use the supplied split \(df=S+N\) with \(S\) a
similarity of dilation \(\lambda\ge0\) (allowing zero), \(S\perp N\), and
\(\|N\|_{L^4(dV_\gamma;\gamma)}=2R^{1/4}\). Let \(D=Q-\lambda^2\gamma\).
In these frames \(D=S^*N+N^*S+N^*N\), where the star in this matrix
identity is Euclidean adjoint. Since \(\|S\|_{\rm op}=\lambda\),
\(|S|_\gamma=2\lambda\), and \(2\lambda\le |df|_\gamma\) by orthogonality,
\[
 |D|_\gamma\le 2\lambda |N|_\gamma+|N|_\gamma^2
 \le |df|_\gamma|N|_\gamma+|N|_\gamma^2.
\]
For a covariant two-tensor \(F\) put \(F_0^m=F-(\operatorname{tr}_m F)m/4\).
Then \(Q_0^q=\lambda^2h+D_0^q\), with a positive coefficient on \(h\) for
the pullback defect. If one uses the full trace for the dilation coefficient
instead, the equivalent identity is
\[
 Q_0^q=\frac{|df|_\gamma^2}{4}h+(Q_0^\gamma)_0^q,
 \qquad Q_0^\gamma=D-\frac{|N|_\gamma^2}{4}\gamma.
\]
In the reverse convention, testing the round metric against \(\gamma\) gives
\(q_0^\gamma=-h+(\operatorname{tr}_\gamma h)\gamma/4\), with
\(\operatorname{tr}_\gamma h=-2b^2/(1-b^2)\) on the stereographic patch.
Both similarity orientation signs give the same quadratic identities.

## Integral constants

Set \(r=R^{1/4}\). Here \(0\le r\le t\le 1/2\). The measure comparison and
\(V_0>4\) give
\[
 \big\||N|_\gamma\big\|_{L^2(d\nu)}
 \le \big\||N|_\gamma\big\|_{L^4(d\nu)}
 \le \frac{2r}{V_0^{1/4}\sqrt{1-t}}\le 2r.
\]
Since \(|du|_q=2\), the triangle inequality gives
\(\||df|_\gamma\|_{L^2(d\nu)}\le (1-t)^{-1/2}(2+\sqrt E)\le3\sqrt2\).
Use Cauchy–Schwarz in the estimate for \(D\) to obtain
\[
 \int|D|_q\,d\nu
 \le (1+t)\left(6\sqrt2\,r+4r^2\right)
 \le (9\sqrt2+3)r\le16r.
\]
Tracing \(Q=\lambda^2\gamma+D\) against \(q\) gives
\(4\lambda^2=|df|_q^2-\operatorname{tr}_qD\) exactly. Expanding
\(|du+dv|_q^2\) and using \(|\operatorname{tr}_qD|\le 2|D|_q\) yields
\[
 |\lambda^2-1|\le |dv|_q+\tfrac14|dv|_q^2+\tfrac12|D|_q,
 \qquad \int|\lambda^2-1|\,d\nu\le\sqrt E+E/4+8r.
\]
Finally \(\langle T,Q\rangle_q=\lambda^2\langle T,h\rangle_q+\langle T,D\rangle_q\).
Subtract the \((\lambda^2-1)\) contribution to recover the desired pairing.
The spherical cancellation and the two integral bounds give
\[
 \left|\int\langle T,h\rangle_q\,d\nu\right|
 \le K\left[E+16r+2t(\sqrt E+E/4+8r)\right]
 \le K\left(\tfrac54 E+2t\sqrt E+24r\right).
\]
