# SP4-POLE-E08a · Return on the marked cap trace

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed E packet, revision 1. The request designates GPT-6.2 Sol/ultra. The executing helper is Codex, GPT-6 based, with exact serving variant and effort unavailable. Base 6a422ce7814fe1ad278d6904970e3b19b05a9890. Working project proof delivered for non-author replay. [Request](REQUEST_E08_CAP_ESTIMATES_20261127.md) · [Derivation](../../notes/E08_CAP_TRACE.md) · [Register](../REGISTER.md)

Each complete fibre of either actual cap has zero flux for \(Lu\) by its A1 primitive. The scalar \(c_u=\langle Lu,J\rangle_h\), where \(J\) is the unit self-dual part of the fibre area, has zero mean and vanishes somewhere on every fibre. At such a point, \(|Lu-\lambda J|_h^2=|Lu|_h^2+\lambda^2\). A strict error-versus-template-value certificate fails there for every line-valued template, including variable amplitudes and separate chart pieces. The normalized \(SO(3)\) average on the product second cap is zero. Orthogonal self-dual components remain possible at each scalar zero.

On \(C_2^+\) through \(t'=17/16\), the orientation-preserving \(F=(\xi,bn)\) gives \(F^*g_{\mathrm{Eucl}}=b^2h\), with \(e^{-17/16}\le b\le e^{17/16}\). Use \(\beta_0=(dZ^0\wedge dZ^1+dZ^2\wedge dZ^3)/\sqrt2\), \(j(t,n)=\Phi_2(t,(17/16)n)\), and write \(\tau_u=j^*Lu\), \(\tau_0=j^*F^*\beta_0\). The induced boundary metric is \(h_\partial=(2\pi\sinh(17/16))^2dt^2+g_{S^2}\), with the cap boundary orientation \(+dt\wedge dA\). For a fixed \(u\), including B04's \(u_1\), the sufficient test is
\[
 m_u=\min_{S^1\times S^2}2b^{-4}\langle\tau_u,\tau_0\rangle_{h_\partial}>0 .
\]
The harmonic scalar component gives \(|Lu|_h\ge e^{-17/8}m_u\) on \(C_2^+\). The full-error version uses the tangential-to-full factor \(\sqrt2\,b^{-2}\) and the boundary maximum of the squared error.

**First unresolved bound.** The angularly resolved, signed trace \(j^*Lu\) of the coupled global solution has no evaluated bound for the displayed test. \(F^*\beta_0\) is a local exact zero-free model with zero fibre periods and exact physical norm range \([e^{-17/8},e^{17/8}]\). The actual field retains the B04 lower bound \(1/2\) for unit inputs at \(r\ge R\). The cap calculations give a conditional estimate and a scoped obstruction to the line-template estimate. The next input is a verified uniform lower estimate for the displayed signed trace of one common \(u\) in the frozen mark. The other pieces of the compact atlas require their own bounds for that same input. No A1 or A2 failure was found in this packet.

| Working-tree source | Inspected version and use |
| --- | --- |
| [Frozen E08 request](REQUEST_E08_CAP_ESTIMATES_20261127.md) | SHA-256 prefix `160bc4dfca922ed2`. Assignment and endpoint. |
| [B04 marking](../../brainstorm/notes/B04_MARKED_PILOT_20261127.md) and [replay](../../reviews/B04_MARKING_REPLAY.md) | `d87dc4f71886074e` and `e614ecc71399d668`. Fixed metric, end bound, and prior radius-one cap check. |
| [B04 analytic method](../../brainstorm/notes/B04_ANALYTIC_METHOD_20261127.md) and [interface decision](../../brainstorm/notes/B04_INTERFACE_DATA_20261127.md) | `1473402e7f2028b7` and `7380811a2ce166b2`. Prescribed enlargement, flat chart and boundary data. |
| [Original 07 metric trial](../../../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md#one-whole-smooth-trial) and [CERT marking](../../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#framed-handles-and-the-two-collar-identifications) | `e27a89ae784451f6` and `0718114604f51a00`. Product germ, first-cap connection, and signed collar. |
| [E07 atlas](../../notes/E07_MARKED_ATLAS.md) and [A1, §3](../../notes/E01_A1.md#3-the-endpoint-estimate-and-exhaustion) | `ea60a02278bd296a` and `db13563024da1a55`. Coordinates and orientations, exact primitive and normalized leading coefficient. |
