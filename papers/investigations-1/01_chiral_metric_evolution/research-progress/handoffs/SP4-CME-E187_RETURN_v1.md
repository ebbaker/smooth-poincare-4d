# SP4-CME-E187 return v1 — Exact stationary-kernel quadratic tests

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E computation under B92, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. Prior E01B/E02B checks and E179 authorship are disclosed in the proof note. [Request][req] · [Proof note][note] · [Script][script] · [Exact results][results].

## Disposition

Completed all seven tests. Rational RREF gives velocity rank eight and kernel dimension twelve at every prescribed \(t\). The restricted inertia \((n_+,n_0,n_-)\) is \((12,0,0)\) at \(t=1/2,1\) and \((8,0,4)\) at \(t=1/8,1/4,2,4,8\). The exact negative witness values in that latter order are

\[
    -156673/1376,\quad -1537/88,\quad -8/19,\quad
    -11/54,\quad -11651/2662 .
\]

The certificates contain the restricted rational matrices, RREF bases, explicit congruence bases and diagonals, and negative witnesses in the original four symmetric matrix slots. Direct checks verified the Sylvester equation, \(\mathscr C^2=2I-\mathscr C\), full Bianchi with reconstructed \(b\), skew \(\Xi\), exact velocity residuals and congruence. The round form is \(4\sum_a|X_a|^2\), and the E07 tensor has zero speed and \(R=16\). Two final runs on Python 3.10.0 returned identical JSON bytes.

The five indefinite cases obstruct pointwise nonnegativity on the abstract stationary derivative kernel at the sampled spectra. The two positive cases supply finite certificates only. The experiment gives no claim about realization by a stationary connection, sign between samples, or a global stationary gap. All bound input hashes matched, including the current-byte E05/E07 inputs. No shared edit or new source inspection occurred.

| Input or output | SHA-256 |
| --- | --- |
| [E187 request][req] | `f16ffeb64cbddec145c93decda529a584a44e43042e0878cf780b21f6ea1e257` |
| [B92][b92] | `4368eb9bf3ef70004be357711a42f926b314b2d037aa96482582755bbfa5d8a9` |
| [E187 note][note] | `6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4` |
| [Exact script][script] | `fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56` |
| [JSON certificates][results] | `0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad` |

[req]: SP4-CME-E187_REQUEST_v1.md
[b92]: ../../brainstorm/notes/B92_STATIONARY_COERCIVITY_ALGEBRA_20261122.md
[note]: ../../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md
[script]: ../../numerics/e187_stationary_kernel.py
[results]: ../../numerics/e187_stationary_kernel_results.json
