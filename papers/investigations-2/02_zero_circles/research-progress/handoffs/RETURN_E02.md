# Return for SP4-ZERO-E02

27 November 2026 (UTC). For Edward B. Baker III with OpenAI Codex assistance.
[Request revision 1](REQUEST_E02_GATE_20261127.md) was dispatched on base
`6a422ce` with gpt-6.2-sol/ultra. The helper has no separate serving
telemetry. The
[table](../../notes/E02_GATE_TABLE.md) gives the exact input versions,
the numerical observations and the B01 continuum certificates.

All requested rows ran on the centered $n=17$ grid. The three stress rows
also ran at $n=25$. The highest measured relative periodic graph residual
was $8.850\,10^{-12}$. All sampled physical singular minima were positive.
The refined stress rows are:

| Profile and amplitude | Estimated $e/T$ | Sampled minimum | Continuum minimum enclosure | $Y>0$ and $e/T<2$ by B01 |
| --- | ---: | ---: | ---: | --- |
| A, $-33/64$ | 0.083945399 | 0.956864515 | $[0.225946,1]$ | Both certified |
| A, $-3/4$ | 0.152340516 | 0.938061107 | $[0,1]$ | Both inconclusive |
| B, $3/4$ | 0.089675321 | 0.710453984 | $[0.335227,1]$ | Both inconclusive |

All base amplitudes and A at $-33/64$ satisfy all three certified
conditions. The A zero-free certificate applies at every parameter
in $(-1/(2b_A),5/16]$ of its tested span. The B certificate covers its
full tested interval $[-5/16,3/4]$. The unresolved interval for a
possible first zero on the A negative segment is $[-3/4,-1/(2b_A)]$,
where $1/(2b_A)\simeq0.590881$. These claims apply at a single marked
pole at infinity.

[Driver](../../numerics/e02_gate.py) · [execution record](../../numerics/e02_results.txt)
· [branch register](../REGISTER.md)
