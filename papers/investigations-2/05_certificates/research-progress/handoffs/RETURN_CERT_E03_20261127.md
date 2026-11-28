# SP4-CERT-E03 · return to request 1

27 November 2026, for Edward B. Baker III with OpenAI Codex assistance. The launcher recorded GPT-6.2 Sol with ultra reasoning effort. Serving details beyond the launcher are unavailable. Checkout `6a422ce7814fe1ad278d6904970e3b19b05a9890`. [Frozen request](REQUEST_CERT_E03_20261127.md)

**Four entries completed.** The groups at \(d=11,\ s=0,1\) are \(C_2\) and the infinite \(C_4*_{C_2}D_{10}\). At \(d=17,\ s=0,1\) they are \(S_3\) and the infinite \(C_4*_{C_2}D_{14}\). The abelianizations are \(C_2,C_4\) at each order. Killing the two old singular meridians gives \(1,C_2\) at each order. [Gate-3 table and reductions](../../notes/E03_MARKED_SWEEP.md)

**Certificate.** Each finite order is proved in both directions. A checked word reduction in the actual four-generator presentation bounds the order by \(2k\). The two signed tables exhibit transitive actions on 2 and 6 rows using the original signed generators. Both positive neighbours have reverse substitutions to the stated amalgam and an explicit permutation representation where \(qc\) sends \((n,0,0)\) to \((n+1,0,0)\) for every integer \(n\). This establishes infinity separately from coset enumeration. [Data](../../numerics/e03_cases.json) · [Independent verifier](../../numerics/e03_check.py)

**Execution.** Python 3.10.0 ran `python3 -B papers/investigations-2/05_certificates/numerics/e03_check.py` from the root in about 0.044 seconds. The verifier accepted the four entries and rejected separate mutations of a corner exponent, an inverse edge, a root representative and a dihedral order. A separate comparison against the E02 witness script agreed on all seven expanded defining relators at both order-seventeen slopes. All computations used exact words and permutations. No coset enumeration ran.

**Dependencies and scope.** The algebra is independent of the derivation of the marked presentation. The geometric interpretation at \(d=17\) uses E02 and that at \(d=11\) additionally uses the E07 check of the same marked section with \(k=1\). In that scope the B01 trial of order six at both \(s=0\) slopes fails at eleven. The group comparison enters gate 3. Its smooth implications depend on the separate recognition and transfer arguments. [E02](../../notes/E02_PRISM17_MARKED_EXTERIOR.md) · [E07](../../reviews/E07_MARKED_FAMILY.md)

| Fixed working input | SHA-256 |
| --- | --- |
| [E03 request](REQUEST_CERT_E03_20261127.md) | `f6691187802d5edc10c603c92996967ea4b9aeff48936479bb389be616d4b36a` |
| [B01 decision](../../brainstorm/notes/B01_MARKED_SWEEP.md) | `e8ab355e225ddd7d6b6d698e0dc1fba8531927f49f5c584693aa7d8eccdfb911` |
| [E02 derivation](../../notes/E02_PRISM17_MARKED_EXTERIOR.md) | `8fee1c3602639a31ee98542fceecd24d836572a20a941376f640dd21e41f3dfc` |
| [E07 request](REQUEST_CERT_E07_20261127.md) | `a947fe68af517ed109737f66b142ca7c7edbf16ec1d1c6ae9e91cbdf03478b9b` |
| [E07 marked review](../../reviews/E07_MARKED_FAMILY.md) | `a185f641f4e739ef6d9b2f5f3f75e4ce94e9319ebef32f34b753abe04490b4a4` |
