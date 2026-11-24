# SP4-FOT-DIR-E22 · Quaternionic Hopf lift at degree zero · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Fixed E routing was **gpt-6.2-sol / ultra**.
Actual helper and selected lead model identifiers and reasoning efforts
were unavailable. [Request v1](SP4-FOT-DIR-E22_REQUEST_v1.md) ·
[Technical note](../../notes/DIR_E22_20261124.md) · [Owning register](../REGISTER.md).

**Completed.** HEAD was **f178fbb604f7f972b639fa8c1fc05f649c9bc8fc** and
all eight frozen working-tree digests matched. The principal
\(\mathrm{Sp}(1)\)-bundle is trivial exactly when \(\deg F=0\).
The complete four-dimensional section obstruction is \(c_2(F^*L)\)
up to sign. In the stated outward target orientation and quaternionic
projector coordinates, the tautological connection is self-dual on
the unit \(S^4\), with \(|\Omega|^2=3/2\),
\(\int_{S^4}|\Omega|^2=4\pi^2\) and Chern number \(-1\) in the
complex matrix trace convention.

For a smooth lift \(z\) on the fixed volume-one domain, the derivative norm splits as
\(|dz|^2=|dF|^2/4+|a|^2\). The projected curvature satisfies
\(|F_a(X,Y)|=|dF(X)\wedge dF(Y)|/2\), and
\[
 |F_a|^2=\tfrac14\sum_{r<s}\sigma_r^2\sigma_s^2
          \leq\tfrac{3}{32}\lambda^2 .
\]
For a degree-zero first eigenmap the integrated upper bound is strict.
The lower bound
\(\int|a|^2\geq\lambda(3/4-|\int z|^2)\geq\lambda/4\) holds for
every smooth lift. Attainment of \(\lambda/4\) forces the image
into a great \(S^3\). Every supplied eigenmap into such an \(S^3\)
has an explicit attaining lift \(z=\sqrt2Pv\) from a unit normal
represented by \(\mathcal H(v)\). For fixed full-span \(F\) the gap
above \(\lambda/4\) is uniform over its smooth lifts and depends on \(F\).

Verified Hatcher's author-hosted v2.2, §3.2 Prop. 3.13 and §3.3
primary obstruction and Prop. 3.22, and Ballmann's Appendix A,
(A.33)–(A.35), Remark A.37 and Prop. A.38(1). [Hatcher](https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf) ·
[Ballmann](https://people.maths.ox.ac.uk/~joyce/Nairobi2019/BallmannKahlerManifolds.pdf).

The curvature equation still contains \(a\wedge a\) in any
would-be co-closed gauge, so the circle-bundle spectral inversion
does not supply an upper connection-energy estimate. The missing
gauge bound and any exclusion of the full-span degree-zero alternative
return to [B13](../../brainstorm/notes/DIR_B13_FULL_TARGET_STRESS_20261124.md).
