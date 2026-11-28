# FTI-E10 · Finite sign projector on the signed minus puncture

28 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E execution on checkout `7c6bbab9a0a6`, requested
GPT-6.2 Sol at ultra effort. Actual serving variant and effort are
unavailable. Inputs are [request r1](REQUEST_FTI_E10.md)
(`1a9aaed2cae00880`), [common inputs](../../notes/COMMON_INPUTS.md)
(`92f54afaa36db652`), [B02](../../brainstorm/notes/B02_FLAT_SIGN_SECTOR.md)
(`565fa48c5ee30bb3`), [E03](RETURN_FTI_E03.md) (`06fc4ffbaa71b842`) and
the [native genus entries](../../../02_invariants/notes/E02_GENUS_ENTRY.md)
(`b434ef42ce03fba3`), with SHA-256 prefixes.

## Common puncture and cover data

Use the actual smooth oriented minus puncture
\(W=\Sigma_P\setminus\operatorname{int}B_{\rm coord}\). Its boundary
\(O=\partial W\) has the original outward parametrization
\(\iota(u)=\chi(rR(u))\) with \(r=1/16\) and
\(R(u)=(-u_1,u_2,u_3,u_4)\). The signed probe on the model \(S^3\) is
\[
 J(\alpha)=\left(-\frac{\sqrt{55}}8\cos\alpha,\,
                   \frac{\sqrt{55}}8\sin\alpha,\,\frac38,\,0\right),
 \qquad \alpha\ \text{increasing}.
\]
The standard puncture control is the oriented standard \(B^4\), with
the same model boundary and this exact oriented \(J\).
[Native boundary and sign](../../../02_invariants/notes/E02_GENUS_ENTRY.md#match-the-oriented-diagram)

On either puncture suppose the input supplies a smooth embedded interior
circle \(C\), its oriented rank-three normal disk bundle \(T\), and the
projection \(\pi:Y=\partial T\to C\) of the normal sphere bundle. For a
geometric input let \(L\) be the actual negative eigenline of the given
form along its transverse zero circle.
The same calculation for a purely decorated input uses a specified
abstract line over \(C\). Write \(E=W\setminus\operatorname{int}T\) and
\(\lambda=\pi^*w_1(L)\). Orient boundaries outward normal first so that
\(T\) has outgoing boundary \(Y\), and \(E\) has incoming \(Y\) and
outgoing \(O\).

## Cohomology and restriction maps

All cohomology here has coefficients in \(\mathbb F_2\). Excision using
collars gives \(H^i(\Sigma_P,W)\cong H^i(B_{\rm coord},S^3)\), which
vanishes for \(0\le i\le 3\). The pair sequence then identifies
\(H^i(W)\cong H^i(\Sigma_P)\) for \(i=0,1,2\). The homotopy-sphere
hypothesis gives
\[
 H^0(W)=\mathbb F_2,\qquad H^1(W)=H^2(W)=0 .
\]
The same identities hold on the standard ball by contractibility, and
\(H^1(O)=H^2(O)=0\) since \(O\simeq S^3\).

The disk bundle retracts to \(C\). The sphere bundle has connected
simply connected fibers, so its homotopy exact sequence gives
\(\pi_1(Y)\cong\pi_1(C)\). Thus both \(H^1(T)\) and \(H^1(Y)\) are
\(\mathbb F_2\), pulled back from the core, and
\(r_T:H^1(T)\to H^1(Y)\) is an isomorphism. With collared overlaps the
\(H^0\) Mayer–Vietoris sequence gives
\[
 0\longrightarrow H^0(W)\longrightarrow H^0(T)\oplus H^0(E)
   \longrightarrow H^0(Y)\longrightarrow H^1(W)=0 .
\]
Because \(W,T,Y\) are connected, \(H^0(E)=\mathbb F_2\), so \(E\) is
connected. The next part of the sequence is
\[
 0=H^1(W)\longrightarrow H^1(T)\oplus H^1(E)
   \xrightarrow{\ r_T-r_E\ } H^1(Y)\longrightarrow H^2(W)=0 .
\]
The isomorphism \(r_T\) already ensures surjectivity of the middle arrow.
The vanishing \(H^1(W)=0\) gives its injectivity, so \(H^1(E)=0\).
Consequently the restriction images on \(Y\) and \(O\) from \(E\)
consist of the trivial class. The two possible classes \(\lambda\)
correspond to the two longitudinal holonomies \(+1\) and \(-1\).
The class is zero exactly when the line's orientation cover is trivial.

## Finite evaluation and forgetting the mark

Use the B02 untwisted finite \(G=\mathbb Z/2\) theory with complex
coefficients and trivial action phase. Each bulk bundle class on a
connected piece has two constant automorphisms. For a fixed extending
class on a piece with \(m\) connected boundary components, the
identifications with fixed boundary representatives form a
\(G^m\)-torsor, modulo the free diagonal \(G\) action. The relative
cardinality is \(2^{m-1}\), and the seam measure is \(1/2\) per class.
Thus the tube state is the constant function \(v_T(b)=1\), and the
exterior kernel is \(K_E(0,b)=2\delta_{b,0}\) for \(b\in H^1(Y)\),
where \(0\) is also the sole outer class. The cap is a standard
coordinate ball with one boundary identification and contributes the
outer integration factor \(1/2\).
[E03, relative bundle groupoids](RETURN_FTI_E03.md#relative-states-from-the-bundle-groupoids)

The same projector as E03 is
\(P_\lambda f(b)=\delta_{b,\lambda}f(b)\). On either puncture it gives
\[
 \bigl(Z_E P_\lambda v_T\bigr)(0)
   =\frac12\sum_{b\in H^1(Y)}2\delta_{b,0}\delta_{b,\lambda}
   =\delta_{w_1(L),0}.
\]

| Input on either puncture | Outer state | Scalar with the coordinate cap |
| --- | ---: | ---: |
| Trivial orientation cover, with the projector | \(1\) | \(1/2\) |
| Nontrivial orientation cover, with the projector | \(0\) | \(0\) |
| Plain gluing, with the projector removed | \(1\) | \(1/2\) |

Transporting the same marked cover preserves the result, including
under normal frame changes or reversal of the core parameter. In the
ordinary problem after forgetting the mark, plain gluing gives the same
state on both punctures. The projected value itself fails to descend:
E03 already gives \(0\) with the actual twisted cover and \(1\) under
the zero-free identity insertion on the same smooth standard ball.
For abstract line data, an oriented rank-three bundle over a circle
admits a periodic frame because \(SO(3)\) is connected. In such a frame a
constant axis and an axis turned through a half-turn give the two
distinct cover values on the same tube.

## Cost on the exact latitude probe

The finite checker uses the homotopy-sphere hypothesis, the coordinate
puncture and the supplied tube, projection and cover class. The
calculation calls for no knot diagram, pole-existence theorem, surface
search, Jordan separation, or unknotting assertion.
For the geometric interpretation the tube and its actual eigenline
remain input data to be supplied on \(W\). The two-class evaluation
determines only the parity of that cover and gives no smooth-type
separation between the candidate and the standard puncture.

For this exact \(J\) the existing native disk uses two oppositely
oriented sections through cap \(1\) and misses cap \(2\). The same
signed \(J\) bounds the affine disk in standard \(B^4\) with
\(u_3=3/8\), \(u_4=0\) and orientation \(-du_1\wedge du_2\).
These disks and nonnegativity of genus give
\(g_{\Sigma_P}(J)=g_4(J)=0\). The genus check verifies a proper
spanning surface on the marked puncture and the comparison in the
standard ball. Both the finite evaluation and the genus entry are
controls on these particular inputs.
[Native signed comparison and replay](../../../reviews/E05_NATIVE.md)

For a potentially separating signed knot \(K\), a checked proper
surface in this \(W\) of genus \(g\) and a verified standard-ball
lower bound \(L_0>g\) would give a strict genus gap for \(\Sigma_P\).
The sign projector contains no boundary-knot input that could supply
that gap. The distinct Dunfield–Gong Theorem 5.14 implication uses
a disk for the specified \(16n68278\) in standard \(B^4\) and the
published zero-surgery data. Its exotic-sphere conclusion concerns
the sphere of that construction. Identification with the minus
presentation would require a separate diffeomorphism.
[Parent comparison and hypothesis](../../../notes/WITNESS_COMPARISONS_20261127.md)
