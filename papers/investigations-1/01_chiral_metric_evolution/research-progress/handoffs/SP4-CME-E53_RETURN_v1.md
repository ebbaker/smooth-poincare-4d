# SP4-CME-E53 return v1 — critical finite-exponent embedding and flat heat

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper `gpt-6.2-sol`/`ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Request v1][req] · [Derivation][note].

## Endpoint embedding

On the flat unit volume-one \(\mathbb T^4\) and with the stated
inhomogeneous Fourier partition,
\[
 \|U\|_{B^{1/2}_{8,1}}
    \leq C\bigl(\|U\|_8+\|dU\|_{4,1}\bigr).
\]
The high-block inverse derivative on arbitrary tensor fields
bounds each weighted block by \(C2^j K(2^{-3j/2},dU;L^2,L^8)\).
The discrete sum is bounded by the \(\theta=2/3\) integral.
Splitting the vector layers by their level-set measure gives
the integral cost \(C\int_0^\infty|\{|dU|>v\}|^{1/4}\,dv\),
which is the E21 rearrangement norm up to the displayed factor
four. The low block is bounded by \(\|U\|_8\).
The smooth graph completion is exactly
\(\{U\in L^8:dU\in L^{4,1}\text{ distributionally}\}\).
Graph convergence implies \(B^{1/2}_{8,1}\) and uniform
convergence to the continuous representative.

## Damped heat

For \(U_t=(\Delta-1)U+f\), the Duhamel solution satisfies
\[
 E_T(U)\leq C\bigl(\|U_0\|_{B^{1/2}_{8,1}}
                 +\|f\|_{L^1(0,T;B^{1/2}_{8,1})}\bigr)
 \quad (0<T\leq\infty).
\]
At high frequencies the multiplier with a fixed annular
cutoff has an \(L^1\) periodized kernel bounded by
\(Ce^{-c2^{2j}t}\). The low finite block, including its
constant mode, is bounded by \(Ce^{-t}\). Block integration
gains \(2^{-2j}\), and dyadic Bernstein gives
\(\int_0^T\|D^2U(t)\|_\infty\,dt\leq C E_T(U)\).
The continuous finite-\(E_T\) class is complete and the
Duhamel solution has a strong \(B^{1/2}_{8,1}\) and uniform
initial trace. For a datum in the derivative graph, the
homogeneous term has strong trace in that graph as well.
Fourier mode uniqueness holds distributionally with the
specified trace. The estimate and completion apply to the
stated linear constant-coefficient equation with a prescribed source.
They use a full gradient and supply no nonlinear or geometric transfer.

## Input and output versions

| Artifact | Checked SHA-256 |
| --- | --- |
| `notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md` | `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2` |
| `notes/25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md` | `fd84cf6012ca8b318fe9220db74ffe42e7fd1ae323c0eb4a56bf5b495043c156` |
| `brainstorm/notes/B37_FINITE_P_CRITICAL_CONTROL_20261122.md` | `2c3812a7fed7c997c82df87dc2f88f6db7793281d5a866ce41202ec7bbfc16c6` |
| `research-progress/handoffs/SP4-CME-E53_REQUEST_v1.md` | `2e98808ddc5f14fcc920d24697675fa01a52bbe49ef177ba9440e138bc583a3f` |
| `notes/53_CRITICAL_FINITE_P_HEAT_20261122.md` | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |

The Fourier, interpolation and approximation estimates are derived directly.
The specified Lorentz convention is inherited from E21. No new primary
source dependence, retained PDF or numerical artifact enters E53.

[req]: SP4-CME-E53_REQUEST_v1.md
[note]: ../../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
