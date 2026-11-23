# SP4-CME-E231 return v1 — Conditional margin-weighted flow criterion

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E derivation, configured gpt-6.2-sol/ultra.
Selected-lead settings and independent runtime attestation are unavailable.
I authored inherited E220 and the E214 manuscript audit. This packet
keeps \(H_{\rm linear}\) explicit with symbolic \(k>0\).

## Disposition

**Conditional proof complete.** In the assessed speed-complement estimate
take \(\kappa=k\epsilon\), \(\epsilon=7/2-r\), and
\(C(\epsilon)=\tfrac12(2L_0^2/(k\epsilon)+L_0+k\epsilon/2)\)
with \(L_0=120\). Young's inequality and the right inverse give
\(R_Q\ge(k\epsilon/2)|X|^2-C(\epsilon)|V_{\rm o}|^2/K^2\).
The old identity uses \(dV_{\widehat g}\) for dissipation and
\(\mu_{\rm o}=2K^2dV_{\widehat g}\) for the derivative and reaction
terms. Its negative velocity cost is \(4C(\epsilon)\mathscr D_{\rm o}\).
The lower bound on \(\sqrt{\det Q}\) gives the old right side
\(k\epsilon\mathscr G_{\rm o}+(48K/5)\mathcal P_{\rm o}\).
Using the native metric, internal factor and time conversion gives
\((1+4C(\epsilon))\mathscr D\ge k\epsilon\mathscr G+(24/5)\mathcal E\).
The exact bound
\[
 \epsilon(1+4C(\epsilon))
 =241\epsilon+57600/k+k\epsilon^2
 \le H=1205/2+57600/k+25k/4
\]
gives the stated static coefficients
\(\mathscr D\ge\gamma_0\epsilon\mathcal E+
\beta_0\epsilon^2\mathscr G\),
\(\gamma_0=24/(5H)\), \(\beta_0=k/H\).

For a supplied smooth original native flow on a general closed
oriented base, let \(w=(7/2-\sup_M\rho(Q))_+\) and
\(\Theta(t)=\int_0^t w\). The spatial supremum and the weight are
continuous on compact slabs. Use the static estimate at the actual
positive margin when \(w>0\) and ordinary dissipation when \(w=0\).
The absolutely continuous integrating factor gives
\[
 e^{\gamma_0\Theta(t)}\mathcal E(t)
 +\beta_0\int_0^t e^{\gamma_0\Theta(s)}w(s)^2
                            \mathscr G(s)\,ds\le\mathcal E(0)
\]
throughout the supplied lifespan. It includes round and zero-energy
data and times with ratio above \(7/2\).

For the round conclusions, the simultaneous late \(\sup\Psi\) and
diameter bounds on a fixed homotopy four-sphere and bundle first give
infinite lifespan by the assessed geometric theorem. Infinite
\(\Theta\) makes the limiting energy zero. Alternatively,
\(\mathcal E(0)e^{-\gamma_0\Theta(t_n)}<\delta(P_0,D_0)\)
at one qualifying unshifted slice places that actual datum below
the assessed non-effective uniform entry threshold. Smooth original
uniqueness identifies the entire constructed tail with the supplied
trajectory. Both tests give an actual fixed round pullback with the
native rate \(\lambda_1(G_0)/2\) and datum-dependent constants at
each fixed spatial order. The finite observation depends only on
past occupation, and the round conclusion forces \(w(t)\to5/2\).
The logarithmic comparison in the note concerns scalar time profiles.

The premise \(H_{\rm linear}\) remains unresolved in this packet.
Only the derivation and return were written.

## Verified versions

| Artifact | SHA-256 |
| --- | --- |
| [E231 request](SP4-CME-E231_REQUEST_v1.md) | 70f46909154ecaa5c569f032b85fca3e55ee866ae6d8e9084c7bd27934fe362b |
| [B108](../../brainstorm/notes/B108_LINEAR_SPECTRAL_MARGIN_20261123.md) | f17210f4e9d9e5d2c8839b2413794cab0d03309368ce5d872b99cc35de385c6f |
| [E220 derivation](../../notes/220_CONDITIONAL_SHARP_SPECTRAL_APPLICATIONS_20261123.md) | c9e3e7ca52f86c830e391f9c39d84207a455c95772001bb561c607842be010f2 |
| [E220/E222 assessment](../../reviews/E220_E222_SHARP_APPLICATIONS_ASSESSMENT_20261123.md) | a1ad1fc9eded4f0de17101858ae3ae323c174fac3a63f086ad8118aff61b33d5 |
| [E212/E213 assessment](../../reviews/E212_E213_INTERMITTENT_RETURN_ASSESSMENT_20261123.md) | 63942e67c937280a0ea88f635d79be51c81b6e54f873e6b1bccf9ad2529ead3c |
| [E179/E181 assessment](../../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E182/E185 assessment](../../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md) | 0f55dfd759e5dfd1f86e69cc7bd201688de0a2cf5e2bd9ce68414f9ffe96761f |
| [E205/E206 assessment](../../reviews/E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) | bca701d680e3e0f66dca5c56ba4caa3edb43c0005b8a94d7db4c2225b49858aa |
| [E231 derivation](../../notes/231_CONDITIONAL_MARGIN_WEIGHTED_FLOW_20261123.md) | 08ac5cef435505d77e99bbd2d8c4cb38c26be6c3a88fac276f42292da5260a4b |
