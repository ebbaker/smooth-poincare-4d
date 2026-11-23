# SP4-CME-E228 return v1 — Independent strict-interior absorption audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E work under B107, configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I previously authored E210, E222 and E224 and independently checked this E227 family. [Detailed audit](../../reviews/E228_STRICT_INTERIOR_ABSORPTION_AUDIT_20261123.md)

## Disposition

Pass. In the fixed old \(K=1\) family \(3<s<7/2\), a direct three-row solution of the actual starred Bianchi equations gives the skew contraction \(4\lambda t(s-1)\) before symmetric polarization, yielding \(B(N_s,Y)=2\lambda t(2-s)\). Direct substitution also gives \(V(N_s)=0\), \(|N_s|^2=s+4\), \(R(N_s)=4\lambda s(7-2s)\), and \(|V(Y)|^2=4R(Y)=48(5s+1)/(s+2)^2\). The axial value agrees with the assessed kernel identity, independently of the E223 mixed coefficients.

The constant-speed minimizing parameter is \((s-2)/(2t(7-2s))\), and the minimum is \(R(Y)-\lambda(s-2)^2/(7-2s)\). Every admissible pointwise constant \(C(s)\) satisfies
\[
 C(s)\ \ge\ \frac{(s+2)(s-2)^2}{16(5s+1)(7-2s)}-\frac14 .
\]
After multiplication by \(7/2-s\), the right side has exact limit \(99/4736\). This supplies a necessary liminf for any admissible \(C(s)\), with the full-space optimum undetermined. The kernel test gives \(0<\kappa(r)\le12r(7-2r)/[(r+2)(r+4)]\) for \(3<r<7/2\). The old and native scaling factors were verified.

The polynomial connection realizes each finite optimizing array at its center, with the actual Bianchi identity and normalized quotient. For every fixed \(s\) and every \(s<r'<7/2\), a sufficiently small ball has \(\sup\rho\le r'\). The necessary bound on \(C(s)\) uses the center spectrum and needs no uniform radius or derivative size. This is a pointwise obstruction to uniform speed-only absorption across the strict region, with integrated inequalities and global behavior unresolved.

## Integrity

- [Request v1](SP4-CME-E228_REQUEST_v1.md) SHA-256 141b16535b2b0f0a6070fbd7b4a2661615f070cd6f884717617c34a83cfc4b67.
- [Frozen E227 derivation](../../notes/227_STRICT_INTERIOR_ABSORPTION_LIMIT_20261123.md) SHA-256 f3d777307b40ea66d74f8f06432d08b839ab75e2c2804d3b1584ec91749e0412.
- [E228 audit](../../reviews/E228_STRICT_INTERIOR_ABSORPTION_AUDIT_20261123.md) SHA-256 ab69acd97a9a4b3d255f537f773cf1afe02408f9c1299311da7b8325f0250e2e.

All seven frozen identities match, and the review records the indirect source identities. Only the two assigned files were written.
