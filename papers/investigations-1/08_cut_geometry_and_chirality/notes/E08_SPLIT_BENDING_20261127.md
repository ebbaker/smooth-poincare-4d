# Exact cubic bending on the split \(K\)-first control

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex. This is a parent evaluation of the **genuinely nonumbilic** split example in the [E08 derivation](E08_FINITE_ATLAS_BAND_20261127.md), read on working checkout 48f36794f9b1. Lead serving details unavailable. For the independent local inequality and an alternate split atlas see the [separate reader](../research-progress/handoffs/E08_INDEPENDENT_RETURN_20261127.md). The diffeomorphism type \(S^4\) and the degree-one \(K\)-first map are supplied by the split control in [05](../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex).

On the signed latitude interval \(\lvert q\rvert\le\pi/6\), use \(g=dq^2+\cos^2 q\,\phi_q^*\gamma\), with zero shift. Here \(\gamma\) is the unit round \(S^3\), \(z=y_1\), and \(\phi_q\) is the time-\(\theta(q)\) flow of \(z\nabla_\gamma z\). The smooth \(\theta\) vanishes near both ends. This preserves the given framed attachments and both outer face identifications. On a leaf where the bump derivative is nonzero, the shear is positive away from the two poles and has norm
\[
 |B^\circ|=\sqrt{2/3}\,|\theta'|\, (1-z^2)\circ\phi_q,\qquad
 Q=6\sec^2q+|B^\circ|^2 .
\]
Pull back the volume as well as the integrand. The density of \(z\) on unit \(S^3\) is \(4\pi(1-z^2)^{1/2}\,dz\). Hence
\[
 \int_{S^3}(1-z^2)^3\,d\mu_\gamma
    =4\pi\int_{-1}^1(1-z^2)^{7/2}\,dz=\frac{35\pi^2}{32},
 \qquad
 b(q)=\frac{35\pi^2}{32}\left(\frac23\right)^{3/2}
             \cos^3q\,|\theta'(q)|^3 .
\]
For the integral put \(z=\sin s\) and use \(\int_{-\pi/2}^{\pi/2}\cos^8s\,ds=\pi{8\choose4}/4^4\). In particular, the simple upper bound in the E08 derivation pays a factor \(64/35\) beyond the exact result before also bounding \(\cos q\) by one. The exact expression can test a given bump with a large derivative confined to a narrow height interval.

There is also a stronger elementary constant on this control. Use the two stereographic charts and partition from the [independent return](../research-progress/handoffs/E08_INDEPENDENT_RETURN_20261127.md). The round latitude data there are \(m=3/25,\ M=4,\ L=4\pi^2/3\). Under the assumed \(\|\theta\|_\infty\le(\log2)/2\), the flow distortion is bounded by a factor two in both directions. In the same fixed reference charts this gives \(m=3/50,\ M=8,\ L=8\pi^2/3\), while \(q_0=6,\ S_D=3/4\) still work. Thus
\[
 C_2=\frac{3}{4}\,\frac{3}{400}\,\frac{9}{4\pi^2}
     =\frac{81}{6400\pi^2}.
\]
The value comes from two measured chart supports on the same band. It is independent of the eigenvalue calculation for the particular spherical slices. With \(\theta=\epsilon\zeta\) for any fixed nonconstant smooth interior bump, define
\[
 J_\zeta=\frac{35\pi^2}{32}\left(\frac23\right)^{3/2}
 \frac{3}{\pi}\int_{-\pi/6}^{\pi/6}\cos^3q\,|\zeta'(q)|^3\,dq>0 .
\]
Then any \(0<|\epsilon|\) satisfying both \(|\epsilon|\|\zeta\|_\infty\le(\log2)/2\) and \(|\epsilon|^3 J_\zeta<C_2^{3/2}\) passes the averaged curvature test on this nonumbilic metric. The underlying positive closed subcritical class persists for sufficiently small \(\epsilon\) by smooth convergence to the round metric on the compact double. The inequality above tests the physical band alone. Its satisfaction on another band by itself would give the selected slice and still require the marking and smooth closing for a topological application.

For a mere change to moving angular coordinates on the round metric, the shift is \(\theta' z\nabla_\gamma z\). Its Lie derivative cancels the entire trace-free velocity; the same computation then gives \(b(q)=0\). This checks the distinction between a deformation of the physical metric and a relabeling of the original cut.

The bounded independent E08 reader also checked this exact control after deriving the local estimate. The eigenvalues of \(\mathcal L_{z\nabla z}\gamma\) are \(2-4z^2,-2z^2,-2z^2\), giving the two-sided factor-two metric comparison. The pullback preserves the angular integral, and support away from the faces preserves both endpoint maps. This verifies the refined coefficient and the cost for the physical zero-shift deformation.
