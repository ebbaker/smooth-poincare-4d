# The coefficient of a pole and the kernel of the transfer

27 November 2026. Codex lead for Edward B. Baker III. Lead model variant and effort unavailable. Inputs are the 6a422ce working tree, the proposal §3.2 (091aa015355ef938), and the second master's oriented normal-coordinate and two-form conventions. This B decision fixes the normalization. The proof below uses the existence and expansion half of A1 for its curved kernel identification. See the [independent replay](../../reviews/B01_REPLAY.md) for its evidence level.

**Import.** On a smooth compact oriented Riemannian homology four-sphere the map taking the self-dual part of an exact two-form to its anti-self-dual part extends to an isometry. Smooth input has a smooth coclosed potential. Reversing orientation gives the inverse. Donaldson–Sullivan, §2(ii), (2.9)–(2.13), pp. 188–189. For a common exact form the two arrows are inverse, so the operator defined in this branch by the opposite arrow satisfies $T_{-o}=T_o^{-1}=T_o^*$. The adjoint uses the positive two-form inner product in either orientation. [Primary paper](https://www.math.stonybrook.edu/~dennis/publications/PDF/DS-pub-0088.pdf)

**Project theorem (normalization).** Let $I(y)=y/|y|^2$ in an oriented orthonormal normal chart at $p$, $R_n=1-2n\otimes n$, $n=y/|y|$. Write $P_g(q,p)\eta$ for the A1 solution with leading term $I^*\eta=|y|^{-4}R_n^*\eta$, where the coefficients of the covariant anti-self-dual tensor $\eta\in\Lambda^-T_p^*M$ are used in the inverted chart. Lebesgue orientation in the inverted chart is opposite to $o$. With source integration against the positive volume $dV_g(p)$, the off-diagonal Schwartz kernel of $d^-A\mapsto d^+A$ is
\[
 K^o_g(q,p)=\frac{2}{\pi^2}P_g(q,p),\qquad
 K^{-o}_g(p,q)=K^o_g(q,p)^{*_{g(p),g(q)}} .
\]
In particular a unit pole coefficient and a unit delta input have different normalizations.

**Project theorem (proof of the factor).** As locally integrable one-forms in Euclidean normal coordinates put $b=\tfrac12 |y|^{-4}\iota_y\eta$. Off zero, $db=I^*\eta$. In the sense of coefficient distributions,
\[
 db=\operatorname{pv}(I^*\eta)+\frac{\pi^2}{2}\eta\,\delta_0 .
\]
Indeed the sphere mean of $R_n^*\eta=\eta-2n^\flat\wedge\iota_n\eta$ vanishes since $\sum_i e^i\wedge\iota_{e_i}\eta=2\eta$. Integration by parts outside a sphere gives the contact coefficient $\tfrac12\int_{S^3} n^\flat\wedge\iota_n\eta\,dS=\tfrac12(2\pi^2)(2/4)\eta$, with positive sign from the derivative of the exterior indicator. The flat exact current $2db/\pi^2$ has anti-self-dual part $\eta\delta_0$. Another sign check uses frequency $\xi=e^1$: exact forms have a factor $e^1$, so the graph sends $e^{12}-e^{34}$ to $e^{12}+e^{34}$. A Fourier multiplier equal to the pullback of the reflection $R_\xi$ would give the opposite sign on this example. The flat-space operator in Iwaniec–Martin, §8, Thms. 8.1, 8.10 and 8.13, is a historical comparison. Read the graph definition when transferring a sign. [Primary paper](https://doi.org/10.1007/BF02392454)

**Project theorem (global identification).** The A1 remainder on the punctured normal ball is $O(|y|^{-2})$, locally integrable and closed there after subtracting $I^*\eta$. Its extension by integration is closed across zero since the boundary pairing costs $O(\rho)$. Extend the pole by spherical principal value in that ball. The preceding identity then shows that
\[
 F=\operatorname{pv}(P_g(\cdot,p)\eta)+(\pi^2/2)\eta\delta_p^g
\]
is closed. Here $\delta_p^g$ pairs a scalar test function against $dV_g$ by evaluation, and normal coordinates have unit volume density at zero. The first term is distributionally self-dual, by testing the ordinary self-duality on every deleted ball before taking the limit. Given any smooth self-dual test form $\beta$, choose a smooth one-form $B$ with $d^+B=\beta$ by the compact import. Pairing the closed $F$ with $dB$ by the wedge integral gives zero. The self-dual term contributes its positive inner-product pairing with $\beta$, while the contact contributes $- (\pi^2/2)\langle\eta,d^-B(p)\rangle_g$. Since $d^-B=T_o^*\beta$, this identifies the column including its distributional extension. Applied to test forms with disjoint supports this yields the off-diagonal reciprocity identity, initially as a kernel identity. Pointwise identification follows from smoothness off the diagonal (for the moving-source variable one may also use the smooth-family argument of B02). For a fixed column smooth test functions already identify the distribution uniquely.

**Project theorem (scale and coordinates).** The intrinsic input for a fixed output two-form is $\eta_g\otimes dV_g(p)^{-1}$ in $\Lambda^-T_p^*M\otimes |\Lambda^4T_p^*M|^{-1}$. Equivalently one can raise both indices of $\eta_g$. For $\widehat g=e^{2f}g$ and $a=e^{f(p)}$, the same pole form has $\eta_{\widehat g}=a^4\eta_g$ as a covariant tensor; its components in rescaled orthonormal coframes have factor $a^2$ and the usual rotation of a two-form. Consequently $K_{\widehat g}(q,p)=a^{-4}K_g(q,p)$ on a fixed covariant source, and $K_g(q,p)dV_g(p)$ is independent of representative. There is no volume factor at the target.

For a fixed representative oriented orthonormal frames differ by rotations and normal coordinates transform linearly. To check the sharper error under varying scale, align frames at $p$, set $v=(df)_p^\sharp$ in the first frame. The difference of the connections there is $C(u,u)=2v\cdot u\,u-|u|^2v$, by the metric connection formula. Taylor expansion of the geodesic equation in the first normal chart gives the new normal coordinate
\[
 z=a\{y+(v\cdot y)y-\tfrac12 |y|^2v+O(|y|^3)\}.
\]
Inverting gives $I(z)=a^{-1}(I(y)-v/2+O(|y|))$. The derivative of the error with respect to $x=I(y)$ is $O(|x|^{-2})$, by Taylor's formula with derivatives and the explicit inversion. Thus translation does not affect the constant two-form, and the chart change leaves an $O(|x|^{-2})$ coefficient error. This gives the stated weights, including for nonconstant scale. An arbitrary nonlinear chart does not have the normal-coordinate remainder assertion.

**Decision.** Use $P_g$ for unit leading coefficient in computations and $K_g$ for the operator integrated against volume. Give the source as a two-form divided by a volume density when the scale is unspecified. Use reversal of orientation for the exchanged kernel, so its fibres match. These definitions are sent to the conventions owner.
