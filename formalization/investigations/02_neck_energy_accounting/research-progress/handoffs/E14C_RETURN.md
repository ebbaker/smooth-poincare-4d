# FOT-E14c · Hölder estimates for cutoff interpolation

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet named GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. [Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/InterpolationHolder.lean) · [SEC `msneck:interpolation`][sec]

## Checked statements

`FirstOrderTwistor.interpolationL4 μ f` is $(\int f^4\,d\mu)^{1/4}$ and `interpolationL2 μ h` is $\sqrt{\int h^2\,d\mu}$. Work on one measure $\mu$, with nonnegative real functions $f=\eta\,du$, $g=d\eta$, and $h=\eta^2d^2u$. The functions $du$ and $d^2u$ represent the Euclidean derivative norms. Write $Y=\operatorname{interpolationL4}(\mu,f)$ and $X=\operatorname{interpolationL2}(\mu,h)$. [SEC `msneck:interpolation`][sec]

| Declaration in `FirstOrderTwistor` | Inputs and conclusion |
| --- | --- |
| `bufferedInterpolation_holder` | From `MemLp f 4 μ`, `MemLp g 4 μ`, `MemLp h 2 μ` and their a.e. nonnegativity, proves integrability of $gf^3$ and $f^2h$. Real integral Hölder with exponents $4,4/3$ gives $\int gf^3\,d\mu\le (\int g^4\,d\mu)^{1/4}Y^3$. Hölder with $2,2$ gives $\int f^2h\,d\mu\le Y^2X$. |
| `bufferedInterpolation_of_fluxBound` | Takes $U\ge0$, $(\int g^4\,d\mu)^{1/4}\le c$, the stated weighted `MemLp` conditions and a.e. nonnegativity of the four norm and cutoff functions. An integrable signed flux $F$ must satisfy $\int f^4\,d\mu=\int F\,d\mu$ and $F\le U(4gf^3+4f^2h)$ a.e. The theorem gives $Y^4\le U(4cY^3+4Y^2X)$, $Y\le4cU+2\sqrt{UX}$ and $Y^2\le32c^2U^2+8UX$. |

The proof obtains integrability of the Hölder products before applying integral monotonicity to the signed flux. It rewrites the fourth-root powers exactly, including when the integrals vanish. The last two conclusions invoke E14a's `bufferedInterpolation_of_quartic`, which covers $Y=0$. [E14a Lean module](../../../../FirstOrderTwistor/BufferedInterpolation.lean) · [SEC `msneck:interpolation`][sec]

## Euclidean application

- Use the Euclidean volume on `EuclideanFour`, with $du=|Du|$, $d^2u=|D^2u|$ and $d\eta=|D\eta|$ in the manuscript's Hilbert–Schmidt norms. Identify the scalar quartic integrand with the left side of E14a's `bufferedInterpolation_integrationByParts`. Its right side becomes $\int F$ with $F=-\sum_{p,a}u_p\partial_a F_{pa}$ and $F_{pa}=\eta^4|Du|^2\partial_a u_p$. [SEC `msneck:interpolation`][sec] · [E14a Lean module](../../../../FirstOrderTwistor/BufferedInterpolation.lean)
- The bound on the differentiated flux uses the coordinate derivative, Hessian norm, and the dimension-four trace estimate, with $|u|\le U$ on the cutoff region. A bound for the absolute contraction from E14b supplies the required signed upper bound. The norm identifications and this pointwise comparison enter as geometric inputs to E14c. [SEC `msneck:interpolation`][sec]
- The weighted norms in `MemLp` are finite for the fixed smooth compactly supported cutoff and smooth field near its support. The `MemLp` hypotheses express finiteness of the integrals. For the annular application $c=c_\eta$ uses the separate cutoff estimate, where $\|D\eta\|_4\le c_\eta=\|D\eta\|_4+\|D^2\eta\|_2$. [SEC `msneck:ceta`][cutoff]

## Verification and inputs

`lake env lean FirstOrderTwistor/InterpolationHolder.lean` from `formalization/` passed. The separate stdin `#check` and `#print axioms` audit of the four public declarations reported exactly `propext`, `Classical.choice` and `Quot.sound` for each. The public-import check belongs to lead integration.

The checkout read during proof work was `7db310a2a9219c537b440d7c2fb39e602a32b729`. The unchanged SEC manuscript SHA-256 was `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The unchanged manifest SHA-256 was `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a` were checked. [Baseline](../../../research-progress/01_BASELINE.md)

[cutoff]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5519
[sec]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5539
