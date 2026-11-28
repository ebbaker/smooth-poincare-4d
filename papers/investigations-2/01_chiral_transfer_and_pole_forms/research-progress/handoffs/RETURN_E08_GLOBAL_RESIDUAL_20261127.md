# SP4-POLE-E08b · Return on the combined residual

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance on base `6a422ce7814fe1ad278d6904970e3b19b05a9890`. Fixed E packet, revision 1. The request designates GPT-6.2 Sol with ultra effort. The actual serving variant and effort are unavailable to this helper. Working analytical proof, pending non-author replay. [Frozen request](REQUEST_E08_CAP_ESTIMATES_20261127.md) · [Derivation and input hashes](../../notes/E08_GLOBAL_RESIDUAL.md) · [Register](../REGISTER.md)

For the frozen Riemannian metric, end and cap potentials, let \(f_e=-\sqrt2P_h^-dA_e\), \(f_c=-\sqrt2P_h^-dA_c\) and \(T_K f=(dD^{-1}_{h,-1/2}(0,f))|_K\). The global trial error on the cap is \(T_K(f_e+f_c)\). Both cutoff derivatives are included in the note. The residual supports are disjoint, including the curved portion of the cap cutoff. The \(W^{3,2}_{-3/2}\) norm is the local derivative integral, so the squared norm of the combined residual is the sum of the squared source norms. The end residual is nonzero for every \(u\ne0\).

For every smooth compactly supported cap potential, the cap-only solve is identical at weights \(-1/2\) and \(-3/2\). The latter gives enough end decay for the corrected closed self-dual form to have zero pole by A1. Thus \(T_K f_c=-dA_c|_K\). On any nonempty compact observation piece in the enlarged second cap, even a singleton, the best operator norm \(N_K=\|T_K\|\) consequently satisfies

\[
 N_K\|f_e+f_c\|_{W^{3,2}_{-3/2}}
 \ \ge\ \|dA_c\|_{C^0(K,h)}
    \sqrt{1+\frac{\|f_e\|_{W^{3,2}_{-3/2}}^2}{\|f_c\|_{W^{3,2}_{-3/2}}^2}}
 \ >\ \|dA_c\|_{C^0(K,h)}\qquad (u\ne0).
\]

For the unit flat trial, the exact infimum and supremum on \(t'\le17/16\) are \(e^{-17/8}\) and \(e^{17/8}\). The best allowance exceeds even the supremum, so the strict error-versus-infimum bound fails for every nonzero input. The argument covers arbitrary compact cap potentials with residual support disjoint from the end residual, on pieces where \(dA_e=0\). It also covers restricted source spaces containing the cap-only source and the combined source.

The actual cap field equals \(T_K f_e\). Its sign in the chosen flat direction and its zero set remain undetermined by this estimate. The next input for the product-cap test is a signed component bound on the true tangential trace for the fixed \(u\), pulled back by \((t,n)\mapsto\Phi_2(t,(17/16)n)\). No A1 or A2 failure was found.
