# E183 Conditional uniform intrinsic entry on varying bases

Prepared for Edward B. Baker III with OpenAI assistance, 22 November
2026 (America/New_York). Fixed E work under B90, configured
gpt-6.2-sol/ultra. Independent runtime and lead-model attestation
unavailable. I authored the inherited E01A normalization, E145
transport comparison and E155 polar bundle construction. I audited
E171 in E173 and the fixed-family E177 theorem in E178. The work
here is the conditional varying-base transfer. No E182 result or
new primary source is used.

## Premise and conditional conclusion

Assume exactly \(H_{\mathrm{var}}\) of B90. For every sequence
of smooth closed connected oriented homotopy four-spheres
\((M_i,g_i)\) with uniform finite bounds
\[
 |\operatorname{Ric}_{g_i}|\le K,\qquad
 |W^+_{g_i}|_{\mathrm{op,HS}}\le K_+,\qquad
 \operatorname{Vol}(M_i,g_i)\ge v>0,\qquad
 \operatorname{diam}(M_i,g_i)\le D ,
\]
a subsequence has a fixed smooth oriented homotopy four-sphere
\(M_{\mathrm{ref}}\), which can be one late member, and smooth
orientation-preserving diffeomorphisms
\(f_i:M_{\mathrm{ref}}\to M_i\). The \(f_i^*g_i\) converge to a
positive metric in \(C^{1,1/4}\) and weakly in \(W^{2,8}\) in a
fixed smooth atlas. This is a premise: common initial smooth
type or atlas, an injectivity floor and a full-curvature
supremum bound are outside its hypothesis.
[B90](../brainstorm/notes/B90_VARYING_BASE_COMPACTNESS_AND_UNIFORM_ENTRY_20261122.md).

Under this premise fix \(0\le P_0<\infty\) and
\(0<D_0<\infty\). There is a non-effective
\(\delta(P_0,D_0)>0\) uniform over all smooth closed connected
oriented homotopy four-spheres \(M\) and smooth principal
\(SO(3)\) bundles \(P\to M\). Consider smooth definite
connections in the positive-plane round-compatible component,
with native negative Killing pairing, reconstructed Riemannian
metric and clock. With the native whole-fiber density \(\Psi\)
and defect energy
\(\mathcal E(A)=\int_M|Q-I|^2\,dV_{g_A}\), the initial conditions
\[
 \sup_M\Psi(A)\le P_0,\qquad
 \operatorname{diam}(M,g_A)\le D_0,\qquad
 \mathcal E(A)<\delta(P_0,D_0)
 \tag{1}
\]
give all the E177 conclusions on \(P\): smooth global definite
original flow, entry at a positive time into the fixed native
round pair-value basin after a smooth oriented equivariant
identification, and smooth exponential convergence of the
actual original pair to one fixed pullback of the round pair.
In particular the existence of such a datum implies that its
smooth base is diffeomorphic to standard \(S^4\). The threshold
is uniform in the base and bundle for the two fixed bounds.
The higher-order constants may depend on the datum.

## Floor-free common geometry and characteristic volume

If the bounded class is empty then (1) is vacuous for any
positive \(\delta\). Otherwise suppose no universal positive
\(\delta\) has all of the asserted consequences. For every
\(i\) select a counterexample on \(P_i\to M_i\) with the two
bounds and \(\mathcal E(A_i)<1/i\). Each datum fails the entire
asserted property. Write \(g_i=g_{A_i}\).

Set \(k^2=4\pi/5\), \(C=(1+4\sqrt3)/k^2\), and
\(\mathcal G=|\nabla^AT|+|T|^2\) with the full live base slots.
By assessed E159 and its inherited transport computation,
\(\mathcal G_i\le C\Psi_i\le CP_0\). The pointwise native
chiral block estimate has its scalar term \((s-6)^2/48\)
and supplies the common bound
\[
 Z(P_0)=\frac{\sqrt6}{2}+(42+8\sqrt3)CP_0,\qquad
 |W^+|_{\mathrm{op,HS}}\le Z(P_0),\qquad
 |\operatorname{Ric}|\le 3+(2+2\sqrt3)Z(P_0).
 \tag{2}
\]
Indeed the coefficient of \(|Q-I|\) is \(1/2\), and
\(|Q-I|^2=\operatorname{tr}(Q^2)-3\le6\) follows
from positivity and trace three. The remaining coefficients
\(6\) and \(42+8\sqrt3\) are controlled by
\((42+8\sqrt3)\mathcal G_i\). The Ricci estimate splits
\(\operatorname{Ric}_0\) and \((s/4)g\), using
\(|\operatorname{Ric}_0|\le2Z(P_0)\),
\(|s-6|\le4\sqrt3 Z(P_0)\), and \(|g|_g=2\).
These bounds hold also at \(P_0=0\) and use no quantitative
minimum eigenvalue. [Native geometry assessment](../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md).

The assessed native convention gives, for \(E_i=\operatorname{ad}P_i\),
\[
  \operatorname{Vol}(M_i,g_i)
  =\int_{M_i}\tfrac13\langle F_{A_i}\wedge F_{A_i}\rangle
  =\frac{8\pi^2}{3}\langle p_1(E_i),[M_i]\rangle .
 \tag{3}
\]
In a native orthonormal internal frame
\(\operatorname{ad}(e_j)=e_j\times\cdot/\sqrt2\), so
\(\operatorname{tr}_{\mathbb R^3}(\operatorname{ad}e_j
\operatorname{ad}e_\ell)=-\delta_{j\ell}\). The real
Pontryagin representative
\(-\operatorname{tr}(\operatorname{ad}F\wedge\operatorname{ad}F)/(8\pi^2)\)
therefore has the coefficient in (3). Since each positive definite
datum has positive native volume, its Pontryagin pairing in the
oriented fundamental class is a positive integer. Consequently
\(\operatorname{Vol}(M_i,g_i)\ge8\pi^2/3\) uniformly. There
is no need to evaluate this integer or to use a formula for
\(p_1(\Lambda^+)\). Together with (2) and the diameter bound,
this verifies every geometric hypothesis of \(H_{\mathrm{var}}\).
[Fixed-family native volume convention](../reviews/E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md).

## Smooth transport to one fixed positive chiral bundle

Apply \(H_{\mathrm{var}}\) to obtain, along a subsequence, the
smooth oriented \(f_i:M_{\mathrm{ref}}\to M_i\). For the
bundle identifications below only the smooth diffeomorphisms
from that conclusion are needed. The regularity of the metric
limit remains part of the premise. Choose any fixed smooth
positive metric \(g_b\) on \(M_{\mathrm{ref}}\). Put
\(g'_i=f_i^*g_i\) and \(L_i=g_b^{-1}g'_i\). The \(g_b\)-self-adjoint
endomorphism \(L_i\) is positive, so its smooth positive inverse
square root \(C_i=L_i^{-1/2}\) is a tangent isometry from
\(g_b\) to \(g'_i\):
\[
 g'_i(C_iu,C_iv)=g_b(L_i C_iu,C_iv)=g_b(u,v).
\]
It preserves orientation, so the inverse pullback on two-forms
\(J_i=(\Lambda^2(C_i^{-1}))^*\) gives an oriented isometry
\(\Lambda^+_{g_b}\to\Lambda^+_{g'_i}\). This map is smooth
for each \(i\).

Let \(\sigma_i=-F_{A_i}^{\sharp}Q_i^{-1/2}:
E_i\to\Lambda^+_{g_i}\) be the oriented polar isometry
in the stipulated curvature component. Pull it to
\(M_{\mathrm{ref}}\) using \(df_i^*\) on the form output:
\[
 \widetilde\sigma_i:f_i^*E_i\longrightarrow\Lambda^+_{g'_i},
 \qquad
 \widetilde\sigma_i(x)=(\Lambda^2 df_i(x))^*
                                   \circ\sigma_i(f_i(x)).
\]
The one fixed source adjoint model on \(M_{\mathrm{ref}}\)
is \(\Lambda^+_{g_b}\); the fiber isometry to the pulled-back
target model is
\[
 U_i=\widetilde\sigma_i^{-1}J_i:
               \Lambda^+_{g_b}\longrightarrow f_i^*E_i .
 \tag{4}
\]
This is the inter-base version of the polar frame construction
in E155. Define \(P_{\mathrm{ref}}\) as the bundle of
oriented isometries from the oriented native
\(\mathfrak{so}(3)\) model to \(\Lambda^+_{g_b}\), with
right action by composition with \(\operatorname{Ad}\).
The adjoint representation of \(SO(3)\) is the
orientation-preserving orthogonal group of this model:
it is faithful and surjective. Likewise \(P_i\) is
identified with the corresponding frames of \(E_i\)
via \(p\mapsto(\xi\mapsto[p,\xi])\). Composing frames
with \(U_i\) at each \(x\) produces a smooth equivariant
bundle isomorphism \(H_i:P_{\mathrm{ref}}\to P_i\) over
\(f_i\). Its inverse is smooth. The construction uses
only a fixed smooth \(g_b\) and the actual smooth
\(g'_i\), without a chiral frame of the unsmoothed limit.
[E155 polar construction](155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md).

Put \(\widetilde A_i=H_i^*A_i\) on \(P_{\mathrm{ref}}\).
Then \(F_{\widetilde A_i}=H_i^*F_{A_i}\) and
\(g_{\widetilde A_i}=g'_i\). Indeed orientation and the
internal isometry preserve the curvature wedge Gram
construction, the normalized trace volume, and the
curvature-map sign; \(Q\) is the conjugate of the base-pulled
matrix. The same covariance gives \(T\) by its strain
formula and the pulled-back chiral connection \(\Gamma\)
by naturality of the Levi–Civita connection and polar
isometry. The fiber map is a rotation on each unit
sphere. It intertwines the orthogonal projection
\(P_{f^\perp}\), the \(\Gamma\)-horizontal derivative,
and the live base covector derivative, and preserves the
round area of total mass \(4\pi\). Thus
\(\Psi(\widetilde A_i)=\Psi(A_i)\circ f_i\).
The orientation-preserving isometric pullback preserves
the diameter and the integral of \(|Q-I|^2\,dV\).
These are exactly the initial quantities in (1).

## Applying the fixed-family theorem and undoing the transport

The normalized inputs are now on a single smooth homotopy
four-sphere and a single smooth principal \(SO(3)\) bundle.
With the fixed \(P_0,D_0\), the assessed E177/E178 result
gives one positive threshold
\(\delta_{\mathrm{ref}}=\delta(M_{\mathrm{ref}},P_{\mathrm{ref}},
P_0,D_0)\). All sufficiently late \(\widetilde A_i\)
satisfy its strict energy inequality, as
\(\mathcal E(\widetilde A_i)=\mathcal E(A_i)\to0\).
The reference family's threshold need not be chosen before
the subsequence. There is no separate pair compactness
requirement to apply the fixed-family theorem.
[Fixed-family flow and entry theorem](../reviews/E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md).

For each such \(i\), let \(B_i(\tau)\) be the E177 smooth
global definite original solution on \(P_{\mathrm{ref}}\)
from \(\widetilde A_i\). The path
\[
 A_i^{\mathrm{orig}}(\tau)=(H_i^{-1})^*B_i(\tau)
 \tag{5}
\]
is the original smooth definite solution on \(P_i\)
from \(A_i\) by original-flow naturality under the
fixed \(H_i^{-1}\). Time remains the native clock.
Smooth uniqueness gives the corresponding actual
original trajectory. If an entry-time identification
on \(P_{\mathrm{ref}}\) is \(R_i:P_{\mathrm{ref}}\to
P_{\mathrm{rd}}\), where \(P_{\mathrm{rd}}\) is the
standard native round bundle, the corresponding
map for \(P_i\) is \(R_i\circ H_i^{-1}\).
In fact the inverse pullback of this map applied
to (5) is \((R_i^{-1})^*B_i\) by contravariance.
If the fixed limiting pair on \(P_{\mathrm{ref}}\)
is \((L_i^{\rm rd})^*(A_0,F_0)\) with
\(L_i^{\rm rd}:P_{\mathrm{ref}}\to P_{\mathrm{rd}}\),
then the limit on \(P_i\) is
\((L_i^{\rm rd}\circ H_i^{-1})^*(A_0,F_0)\).
A fixed smooth pullback on the respective compact bundles
preserves smooth exponential convergence in each order,
with constants allowed to depend on that datum and map.
The base identification to standard \(S^4\) composes with
\(f_i^{-1}\) on \(M_i\).

Thus each sufficiently late term of the supposed bad
sequence has the entire asserted property in its original
identification, a contradiction. This proves existence
of a positive \(\delta(P_0,D_0)\) uniform across the
stated bases and bundles under \(H_{\mathrm{var}}\). It is
a contradiction proof and supplies no effective threshold.

## Universal small-supremum transport corollary, conditional on the same premise

Let \(\varepsilon_{171}>0\) be the assessed universal
single-slice threshold for \(\sup\mathcal G\). For a datum on
an arbitrary one of these bases put \(p=\sup_M\Psi(A)\).
If \(Cp\le\varepsilon_{171}\), E171/E173 gives
\(|Q-I|\le72Cp\) and \(\operatorname{Ric}_g\ge(3/4)g\).
Along any unit-speed minimizing segment of length \(l>0\),
the three parallel normal sine test fields give total
index at most \(3\pi^2/(2l)-3l/8\). The first term is
the sum of derivative norms and the second comes from
the Ricci lower bound integrated against \(\sin^2(\pi t/l)\).
Nonnegative index implies \(l\le2\pi\). Compactness and
completeness give \(\operatorname{diam}(M,g_A)\le2\pi\).
[Small-strain assessment](../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md).

Use exactly the volume constant of B90. For \(p\le1\),
put
\[
 Z_0=\frac{\sqrt6}{2}+(42+8\sqrt3)C,\qquad
 R_0=3+(2+2\sqrt3)Z_0,\qquad
 V_{\max}=\mathcal V_{-R_0/3}(2\pi+1),
 \tag{6}
\]
where \(\mathcal V_\kappa(r)\) is the ball volume of
the complete simply connected four-dimensional space
form of sectional curvature \(\kappa\). The absolute
Ricci bound (2) gives \(\operatorname{Ric}\ge-R_0g\).
The corresponding space-form Ricci bound in dimension
four is \(3(-R_0/3)g\). With the established diameter
bound every ball of radius \(2\pi+1\) covers \(M\).
Bishop–Gromov from the small-ball Euclidean ratio then
gives \(\operatorname{Vol}(M,g_A)\le V_{\max}<\infty\).
Hence \(\mathcal E(A)\le V_{\max}(72Cp)^2\).

Choose any proven conditional threshold
\(\delta_0=\delta(1,2\pi)>0\) and take
\[
 \epsilon_{\mathrm{univ}}
   =\tfrac12\min\left\{1,\ \frac{\varepsilon_{171}}{C},\
                    \frac{\sqrt{\delta_0/V_{\max}}}{72C}\right\}.
 \tag{7}
\]
If \(p<\epsilon_{\mathrm{univ}}\), then \(p<1\),
\(Cp<\varepsilon_{171}\), and the above diameter estimate
applies. Moreover
\(\mathcal E(A)\le V_{\max}(72Cp)^2<\delta_0/4<\delta_0\).
All the hypotheses of the uniform energy-entry statement
therefore hold. This is a positive non-effective
threshold independent of the choice of the base and
bundle, conditional on exactly \(H_{\mathrm{var}}\).

No uniform positive entry time, derivative bounds for the
identifying maps, or uniform high-order convergence constants
are obtained. The result concerns supplied existing smooth
definite data; it gives no initialization or general a priori
estimate. Both conclusions remain conditional at this packet
boundary.

## Frozen inputs

| Input | Verified SHA-256 |
| --- | --- |
| [E183 request v1](../research-progress/handoffs/SP4-CME-E183_REQUEST_v1.md) | 4bf7f74195a55c4d3ca293c231009d028aa59d0bb801f0271b20890896879dd7 |
| [B90](../brainstorm/notes/B90_VARYING_BASE_COMPACTNESS_AND_UNIFORM_ENTRY_20261122.md) | 65f096442774df5a78d99b75dc6fa23b09a0b1b28028511ece93efb56527a2d4 |
| [E177/E178 assessment](../reviews/E177_E178_COMPACT_FAMILY_ENERGY_ASSESSMENT_20261122.md) | d51abd626e3f9e1379acefbe097fa8156aa9d3caeac637c672ea8749b589726f |
| [E177](177_COMPACT_FAMILY_DEFECT_ENERGY_ENTRY_20261122.md) | 1df79e8cc4397dccd9760acc57a68a36c352866e44f1976aadec09f4c0654d0a |
| [E178](../reviews/E178_COMPACT_FAMILY_ENERGY_ENTRY_AUDIT_20261122.md) | 5b0010317e526bef99067bfe3f5177836638cb5d4534051b6cb509081365c81e |
| [E171/E173 assessment](../reviews/E171_E173_SMALL_STRAIN_ASSESSMENT_20261122.md) | f8a1e2e86f0fdcd0d7b29ad915e6a249d6caed13d753befd140920a22cd12a9d |
| [E157–E159 assessment](../reviews/E157_E159_GEOMETRIC_CONTINUATION_ASSESSMENT_20261122.md) | b006a0c7e83266822078d4ff79d689ccd3bb67b049df3eacf586db27890cca52 |
| [E155](155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md) | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |
| [E174/E176 assessment](../reviews/E174_E176_INTRINSIC_ENTRY_ASSESSMENT_20261122.md) | 45c8c59dac557d65d10b029f1e495a8a7d93899613cc68e923a372ab1d831c3a |
