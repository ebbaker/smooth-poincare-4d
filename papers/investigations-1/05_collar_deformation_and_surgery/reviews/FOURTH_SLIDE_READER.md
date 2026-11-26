# Independent reading of the GST fourth-slide quaternion test

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E reading for SUR-B04. Actual serving model and reasoning effort are unavailable. Checkout 1c81a3048c8c21a4c1d1fb23db72f37168a15ca5. SHA-256 prefixes of the supplied [note](../02_handle_isolation_and_marked_surgery/notes/GST_FOURTH_SLIDE_QUOTIENTS.md) and [script](../02_handle_isolation_and_marked_surgery/numerics/gst_four_slides.py) are 15027a80860a3a84 and 51ec19545d486539. The input [depth-three note](../02_handle_isolation_and_marked_surgery/notes/GST_THIRD_SLIDE_QUOTIENTS.md) and [script](../02_handle_isolation_and_marked_surgery/numerics/gst_three_slides.py) have prefixes afa42bf7e139ac41 and ce93b272e8e94845. This read takes the marked \(L_{3,1}\) words and framed band convention from the [diagram derivation](../02_handle_isolation_and_marked_surgery/notes/GST_DUAL_WORD_AND_BAND_20261126.md).

## Histories and the one-sided angular test

Keep the two oriented component labels through the moves. A signed history records the moved label and the orientation of the added stationary parallel at each step. Each four-slide sequence gives one of the \(4^4=256\) histories. Endpoint paths, conjugating words, frames, and isotopy classes of geometric bands can vary within a history. An arbitrary change of the final complete belt system preserves the test of primitivity. The component left fixed by slide four already fails the necessary primitivity test at depth three.

For the moved component, the signed row recurrence records abelianization and a second, unsigned recurrence counts factors in an expression before any simplification. Its entries count conjugates of each starting relator or its inverse. Conjugating an expression conjugates all factors, and inversions of expressions reverse their order and invert the factors. This proves the unsigned recurrence even when a particular band permits cancellation of factors. The maximal retained coordinate at depth four is five. The signed row determinant stays \(-1\), so each candidate row is coprime and the Christoffel classification supplies its primitive conjugacy class. Reversing the sign of the row inverts the class and leaves its real part in every witness unchanged.

In a witness with one killed relator, the moved word is a product \(Q\) of \(N\) unit quaternions of common real part \(c\), since inversions and conjugations preserve that part. For \(N=0,1\) the required real parts are \(1,c\), respectively. Otherwise set \(\sigma=\operatorname{sgn}(c)\) with \(+1\) at zero and \(\theta=\arccos |c|\). Centering each factor by \(\sigma\) changes their product to \(\sigma^NQ\). The spherical left invariance and triangle inequality give \(d(1,\sigma^NQ)\le N\theta\). When \(N\theta<\pi\), the valid interval is
\[
  \cos(N\theta)\ \le\ \sigma^N\operatorname{Re}(Q)\ \le\ 1 .
\]
An exclusion requires the centered candidate scalar to be strictly below the lower endpoint. If \(c<0\) and \(N\) is odd this endpoint gives an upper bound on the original real part. Witness five has \(c<0\) and the script performs precisely that sign change. The interval is vacuous at \(N\theta=\pi\), and the script uses no nontrivial bound at or above that angle. The squared-real-part comparisons preserve order within the nonnegative scalars and reverse it within the negative scalars.

## Exact replays

Both supplied programs reproduced their stated output. I separately enumerated histories using signed and unsigned coefficient matrices before applying the original homology rows. An independent exact replay used the Hamilton-unit multiplication table with integer numerator coordinates and positive squared denominators. It verified that each witness sends its designated killed relator to the identity. Christoffel representatives were encoded by vertical increments \(\lfloor kn/m\rfloor-\lfloor(k-1)n/m\rfloor\) after each horizontal step for \((m,-n)\), with the single-letter axis cases treated directly. I computed the endpoint by the exact cosine recurrence and certified the angular domain via the sine recurrence \(U_{k-1}(|c|)=\sin(k\theta)/\sin\theta\). For \(0<\theta\le\pi/2\), positivity for consecutive \(k\le N\) keeps every \(k\theta\) below \(\pi\), and the recurrence at \(\theta=0\) is its positive limit. This independently reproduces the strict-domain checks. Both recurrences use rational pairs in the basis \(1,|c|\) with \(|c|^2\) rational.

| Witness | Histories excluded at this step | Histories left |
| --- | ---: | ---: |
| 1 | 146 | 110 |
| 2 | 52 | 58 |
| 3 | 16 | 42 |
| 4 | 6 | 36 |
| 5 | 4 | 32 |

The independent replay agrees on each of the 32 labels and their unsigned counts. Their oriented slopes up to sign are \((1,0),(5,-4),(6,-5),(7,-4)\), occurring 4, 20, 6, and 2 times, respectively. The 224 exclusions apply to every choice of the original joining paths in those histories. The remaining histories satisfy these necessary scalar tests and still require a joining-word construction and a verified framed geometric one-intersection move for a cancellation claim.
