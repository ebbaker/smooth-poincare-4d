# Both marked caps of the transported physical disk

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E45 execution for Routes 03 and 07. The selected helper setting is Sol 6.2/ultra. Independent serving metadata are unavailable. Working revision `19c187ad8dbe936cf165017c753a94add775ebaf`.

[Transport on the original charged disk](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/notes/TRANSPORT_ON_THE_CHARGED_DISK.md) · [Lean cap leaf](../../../../SmoothPoincare/Variational/TransportedDiskCaps.lean) · [Native compression and adjunction](E45_NATIVE_DISK_COMPRESSION_20261126.md) · [Transported signed energies](../../../../SmoothPoincare/Variational/TransportedChargedDisk.lean)

Let $F$ be the buffered marking of the selected original disk $D=F(\overline B_1)$, $V=M\setminus\operatorname{int}D$, and $\phi$ the actual orientation-preserving transport. Fix $0<b\le1$ with $\phi(D)=F(\overline B_b)$. The magnitude $b$ is a radius in the chart's output pocket. Native Gaussian cut widths in the source and the endpoint are supplied by the physical comparison at this fixed index.

Use stereographic projection $C$ from the north pole of the unit model $S^4$. In the pinned convention the height of $C^{-1}(x)$ is $(|x|^2-4)/(|x|^2+4)$, so the standard south cap has chart image exactly the closed ball of radius two. The scaled chart $C_b=(b/2)C$ has full Euclidean target, and maps the same standard cap onto $\overline B_b$.

The retained exterior core is $\phi$ and its pocket marking is $F C_b$. Its core image is the closed complement of the interior of that actual marked pocket. The retained disk core is $C_b^{-1}F^{-1}\phi$ and sends the whole closed original disk onto the southern hemisphere. Its cap marking is the equatorial reflection from the standard south cap onto the north cap. The pocket marking and the disk core are inverse on the complete pocket after applying $\phi$. On the original face the disk core has height zero, where the equatorial reflection fixes every point of the original angular identification. Its normal reverses by the signed height formula. The open source and target conditions and the inverse computations retain the original charts.

Let $g_f$ be the flattened positive source, $k_V=e^{2u}g_f$ its indicated conformal representative and $G=\phi^*k_V$ the outgoing joined metric on $M$. The exterior cap carrier is the original oriented type. Its actual metric $k_V$ pulls back by $\phi$ to the metric on the complete retained exterior. The inverse is the actual inverse of $\phi$. The cap is positive by conformal invariance and has energy $E_\sigma(k_V)=E_\sigma(G;V)$ because the transported disk has zero energy in both signs.

For the disk the supplied local conformal geometry of the pocket identifies $G$ via its core with a smooth positive conformal multiple of the unit round metric on an open neighborhood of the closed southern hemisphere. A smooth cutoff equal to one near the complete south cap extends the local logarithm to a global smooth factor $u_D$, equal to zero outside its supplied open patch. Therefore $k_D=e^{2u_D}g_{\rm rd}$ uses the same metric germ along the whole retained disk and its face. It is positive in its actual conformal class and has $E_\sigma(k_D)=0=E_\sigma(G;D)$. The combined theorem chooses this very factor for both tasks. Taking the two concrete metrics as witnesses at every positive tolerance supplies both `HasPositiveCaps` conclusions. No width limit is needed for the corresponding fixed-source comparisons.

Against the incoming source $g$ the full exterior gain is separate. In each ambient chirality,
$$
E_\sigma(k_V)-E_\sigma(g;V)
=E_\sigma(g;D)+\Delta,\qquad \Delta=E_+(g_f;M)-E_+(g;M).
$$
The discarded original disk and any core it contains have zero outgoing energy. Thus this transport spends the original disk charge on the complete exterior. Since $E_+(k_V)\ge I^+(M)$, this cap supplies no strict reduction of the same-type infimum.

The Lean cap result uses the local conformal formula on the actual pocket and the already constructed endpoint transport. It realizes the normalized stereographic markings, smooth capping by the chosen factor, relative metric identities and the full fixed-source energy ledgers. The explicit local conformal factor follows from the Euclidean pocket and radius-scaled round metric identities. Selection of an affordable repair on a general minimizing sequence remains open. [Euclidean pocket cap germ](E45_EUCLIDEAN_POCKET_CAP_GERM_20261126.md)

## Inputs

| Input | SHA-256 |
| --- | --- |
| Physical transport note | `3afb193895a79e3b1f4ce508f66017cba887c5b3e3a9b1bb3aee36d81c22c37f` |
| Signed transport leaf at intake | `c4cef52897591752cedf5ccfccc55f4d69b81d87bf12a0cac4306446880e8e81` |
| Round hemisphere markings | `7df2baf48968afc8be50ce14cf030bba390cc20f5b8a6db863cfaf5640c596fa` |

## Verification

The direct check and `lake build +SmoothPoincare.Variational.TransportedDiskCaps` passed on Lean `4.35.0-rc3`. The targeted build completed 10,014 jobs. The leaf SHA-256 is `076de92e697319605456bb62d9d553520a533ba04a21b3e6b7fed5a564d493fe`. The nine-declaration signature and axiom readback including `exists_transportedDiskCaps_with_matchingGerm` has SHA-256 `21bcc9d1ed6b0936a337bad71255cdb3095a67f63b7febe7d89b1f2d065b05aa`. Its transitive axioms are `propext`, `Classical.choice` and `Quot.sound`.

The independent [radius-one-third fixtures](E45_TRANSPORTED_DISK_CAP_FIXTURES.lean) checked the exact scaled image, inverse at the chart center and exclusion of the north pole. The fixture SHA-256 is `4fdc3ec946eebda81dcb932a95cc65b6d937feb4a9dd199a441809ebfe44b84e`.
