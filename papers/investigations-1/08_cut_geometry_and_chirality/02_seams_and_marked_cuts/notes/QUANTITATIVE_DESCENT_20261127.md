# Strong-data descent at a marked near-round sphere

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected lead Astra/ultra, serving details unavailable. Working HEAD `bc2c1bbccc1d` and parent TeX SHA-256 `ccb52d6a2548fb8f…`. This combines the [matched hemisphere estimate](E02_CAP.md) and the [closed descent and sign argument](E04_ROBIN_DESCENT.md), replayed in [cap reading](../reviews/E07A_CAP_READBACK.md) and [analytic reading](../reviews/E07B_ANALYSIS_READBACK.md).

Let a smooth embedded \(S^3\) split the fixed oriented smooth homotopy four-sphere. Choose a conformal representative and a boundary marking in which \(H=0,\ h=\gamma+a\), where \(\gamma\) is unit round. For the forward normal write \(b=B^\circ\) in this representative. On the unit round hemisphere with inward coordinate \(s\), put \(q_\pm=\chi(s)(a\pm2s b)\) using the specific cutoff in E02. Let \(D_\pm=\max_{0\le j\le2}\sup|\nabla_0^j q_\pm|\), \(D=\max D_\pm\), \(K=3750\pi^2\). These are data norms in the chosen marking. Infimizing \(D\) over smooth diffeomorphisms and boundary conformal factors with corresponding weight on \(b\) makes the test depend only on the conformal Cauchy datum. The ambient normal logarithmic derivative permits the normalization \(H=0\) independently. Any strict threshold for this infimum is passed by an actual representative, so no minimizing gauge is needed.

If \(D\le1/100\), the two physical caps have \(R\ge8\) and half-sum costs \(c_i\le K D_{\sigma_i}^2\), with opposite choices of \(\sigma_i\) at the two joins. This is a sufficient strong-data estimate; an optimal cap is unnecessary. Suppose both capped classes are positive. A sufficient independent criterion is that the two original whole-side Robin forms be nonnegative, as proved in E04 (a cap with strictly positive conformal form controls the common trace). If
\[
                     e+K(D_+^2+D_-^2)<2T ,
\]
one capped piece is a smooth standard sphere by strict CGY after smoothing. If \(e_i+KD_{\sigma_i}^2<T\) for each \(i\), both capped pieces are standard and \(M\cong S^4\). On a nonstandard \(M\), if \(e\le I(M)+\delta\), the removed piece \(i\), with opposite piece \(j\), obeys
\[
              e_i\le c_j+\delta\le K D_{\sigma_j}^2+\delta,
       \qquad E_\pm(V_i)\le E_\pm(\mathrm{cap}_j)+\delta .
\]
The cap cost on the **opposite** side is the price paid by the competitor on \(M\). In particular, at an attained minimum (\(\delta=0\)) with fixed \(e<2T\), for \(D\le1/100\) and \(2KD^2<2T-e\), one side has \(e_i\le KD^2\). If a family of such marked cuts has \(D\to0\) and the capped signs persist, the smaller side energy tends to zero. At \(D=0\), it vanishes. A global conformal swap across an exactly free cut supplies both signs and \(e_i=e/2<T\), giving standardness.

The smooth capped energies converge to \(e_i+c_i\). Exact equality is available for the piecewise matched class and there is a smooth approximation for each positive tolerance. No step in the strict descent asserts exact smooth realization of the limiting energy. The round boundary metric and vanishing shear alone do not force the two normal second jets to match. No statement here produces a balanced near-round marked cut on a minimizing class.
