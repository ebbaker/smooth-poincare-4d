# SP4-FOT-DIR-E50 · return v1

24 November 2026, America/New_York. Prepared for Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. Executed by the lead session; the recommended gpt-6.2-sol / ultra helper was not available. [Request](SP4-FOT-DIR-E50_REQUEST_v1.md) · [Evidence](../../notes/DIR_E50_20261124.md) · [Owning register](../REGISTER.md).

Observed HEAD was `3fb565b70247a57e4fcc7e65886c57ce0ca0e1ab` and the six working-tree digests matched the request. The four-index norm in the Chang–Gursky–Yang hypothesis agrees with SH-E01 and with the manuscript, so no escalation was needed.

| Frozen item | Verdict | Result and scope |
| --- | --- | --- |
| (i) Gauss–Bonnet with signature | Resolved | $E_+=2\pi^2(2\chi+3\tau)+\tfrac14\int\lvert{\rm Ric}_0\rvert^2-\tfrac1{48}\int s^2$; on a homotopy four-sphere at a unit-volume Yamabe metric $E_+=(Y(S^4)^2-Y^2)/48+\tfrac14\int\lvert{\rm Ric}_0\rvert^2$. |
| (ii) Chang–Gursky–Yang threshold | Resolved; theorem imported | At a unit-volume Yamabe metric with $s=Y>0$, the hypothesis is $\int\lvert{\rm Ric}_0\rvert^2<s^2/12-8\pi^2\chi$. Equality at $\mathbb{CP}^2$ and at the necklace. Homotopy sphere: threshold $s^2/12-16\pi^2$, positive only for $Y>Y(S^4)/\sqrt2$. Pointwise comparison: $\delta^2<\tfrac19-32\pi^2\chi/(3s^2)$ suffices. |
| (iii) Bochner | Resolved | $\int\lvert{\rm Hess}_0\phi\rvert^2+\int{\rm Ric}_0(\nabla\phi,\nabla\phi)=\tfrac{s^2}{12}\nu(\nu-1)\int\phi^2$ and $\operatorname{div}{\rm Hess}_0\phi={\rm Ric}_0(\nabla\phi)-\tfrac14(3\lambda-s)\nabla\phi$. Pinching bounds the sum only. On the necklace the translation mode has each term equal to $\tfrac{s^2}{12}\int\phi^2$ in absolute value. |
| (iv) local minimizers | Resolved by inspection | E37 and E38 use the minimizing inequality only as $t\to0$ along $1+t\phi+t^2w$; the exact theorem holds at local minimizers. Corollary: $\dim\mathfrak{conf}-\dim\mathfrak{isom}\le4$ at a non-round local minimizer. The near-equality estimates are not covered. |

Numerical confirmations on the E49 family: the Gauss–Bonnet value to twelve digits and the Bochner identity to six. The Chang–Gursky–Yang statement and equality case were read as quoted by Chang, Qing and Yang through a text extraction; the original was not re-inspected. The Yamabe constant of $\mathbb{CP}^2$ is from memory. The same model wrote the request and the return in one session.
