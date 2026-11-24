# SP4-FOT-DIR-E49 · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. Executed by the lead session; the recommended gpt-6.2-sol / ultra helper was not available. [Request](SP4-FOT-DIR-E49_REQUEST_v1.md) · [Evidence](../../notes/DIR_E49_20261124.md) · [Computation record](../../numerics/README.md) · [Owning register](../REGISTER.md).

Observed HEAD was `3fb565b70247a57e4fcc7e65886c57ce0ca0e1ab` and the six working-tree digests matched the request.

| Frozen item | Verdict | Result and scope |
| --- | --- | --- |
| (i) family and minimizer | Resolved, classification imported | $g_m=\operatorname{dn}^2(t/\sqrt{2-m}\mid m)(dt^2+g_{S^3})$, $s=12/(2-m)$, period $2K\sqrt{2-m}$, $Y=24\pi(2-m)^{-3/4}I_4^{1/2}$. For $L>\sqrt2\,\pi$ the minimizer is the one-period metric; the product and the multiply wrapped metrics are unstable. Rotational symmetry and the list of solutions are Schoen's, read in §2, pp. 132–135, through a text extraction of a scan. |
| (ii) spectrum | Resolved; ordering numerical | $-h''+(2-m)(k+1)^2h=(4\nu+2)\operatorname{dn}^2h$. Exact: $\nu=1$ with $h=\operatorname{sn}\operatorname{cn}$ (so $s=3\lambda_1$ for every $L$), $\nu=5/2$ with $h=\operatorname{sn}\operatorname{cn}\operatorname{dn}$. $\epsilon=\nu_1-1$ for the $k=1$ ground state, and $\tfrac35\epsilon\le A/s\le\tfrac45\epsilon$. |
| (iii) bound and asymptotics | Resolved; equality numerical | $0\le\epsilon\le(-I_6+4(2-m)I_4-(1-m)I_2)/(4I_6)-1=\tfrac{15}{16}(1-m)+\dots$; computed $\epsilon/(1-m)\to0.937500$; $1-Y/Y(S^4)=\tfrac38(1-m)+\dots$; $1-m\sim16e^{-L}$. Hence $\epsilon\to0$ on $S^1\times S^3$. |
| (iv) joint law | Resolved numerically | Fourth moments within $4.57\,\epsilon$ of $15/7$; radial $L^2$ error $3.2\times10^{-6}$ at $1-m=10^{-6}$; $\sup\lvert X\rvert\to1$, $\inf\lvert X\rvert\approx\tfrac12\sqrt{1-m}\to0$; $\int\Gamma(X,X)^2\to1.0429$; Gram residual $\to0$ in $L^1$ and $\to0.207$ in $L^2$. |
| (v) curvature | Resolved | $\int\lvert{\rm Ric}_0\rvert^2=s^2{\rm Vol}/12$ for every $m$; radial Ricci curvature at the neck $s/4-3/((2-m)(1-m))$. |

Acceptance tests: second method agrees to $2\times10^{-9}$ or better; energy closed form agrees with quadrature to twelve digits; exact solutions have residual $8\times10^{-31}$. All numerical limits of the request were respected. Runs: Python 3.13.18, NumPy 2.5.3, mpmath 1.3.0 in the session workspace, repeated with Python 3.10.12, NumPy 2.2.6, mpmath 1.3.0 on the author's computer.

No escalation. Limitations: floating-point diagnostics without interval arithmetic; Caffarelli–Gidas–Spruck not inspected; elliptic identities standard and checked numerically only; the same model wrote the request and the return in one session. The example is not simply connected.
