# E162 — Assessment of the smooth ALE core obstruction

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Selected lead preserved, actual model/effort
unavailable. Helper configured gpt-6.2-sol/ultra; independent runtime
attestation unavailable. Lead read the full note and return,
independently checked the integral argument and the primary Wright
v2 passages below, and verified both output hashes.

**Accepted for a supplied smooth full core.** A sufficiently large
smooth truncation of a complete connected nonflat oriented Ricci-flat
ASD ALE four-manifold cannot embed orientation-preservingly in a
closed smooth oriented integral homology four-sphere. The same
argument covers a full core with product complement. This is not
an extraction theorem or a statement about singular orbifold cores.

For an embedded boundary Y with finite fundamental group, its
integral H2 vanishes. Mayer–Vietoris then gives H2(U)=H2(V)=0
and H1(Y)=H1(U)⊕H1(V). The pair sequence identifies the second
summand with H2(U,Y), which duality and UCT identify with
Ext(H1(U),Z). Both summands are finite. Thus H1(Y)≅G⊕G.
This excludes nontrivial cyclic H1, and excludes positive b2 of
the retracting core directly. The independent intersection-form
argument in the note is consistent with this simpler obstruction.

For b2=0, Wright's classification retains a cyclic quotient of
a Gibbons–Hawking cover; the cover has k=d monopoles and deck
degree d>1. The end group is an extension of C_d by its C_d
fiber subgroup. The generator is central because every deck
map preserves the oriented circle action; conjugation is checked
by the cylinder of fibers along a lifted basepoint path. A central
extension with cyclic quotient is abelian. Simultaneous complex
diagonalization of the finite orthogonal abelian representation
gives a character; its kernel would fix a nonzero real vector,
contrary to freeness on S3. Hence the character is faithful and
the group is cyclic. Its order is d², giving the contradiction
to the two-sided splitting. Group order alone was not used to
infer cyclicity. Cofinal product tails identify the circle end
section with the ALE end, and an entire core is essential.

Lead independently opened the versioned primary PDF and read
Theorem A, §2/Table 1, §3/Proposition 1, §7.1's circle ansatz,
§7.2's k=2 reduction and positive-generator argument, and §8.
The theorem uses Wright's stated hyperkähler classification;
the original Kronheimer and Gibbons–Hawking papers were not
separately read. The indexed §8 phrase giving k−1 monopoles
is inconsistent with §7.1 and Table 1; the derivation instead
uses k monopoles and b2 of the cover equal to k−1.
The inspected source is arXiv:1102.2442v2, not the published
edition. Canonical R31 records retain those distinctions.

[Proof note](../notes/162_ALE_CORE_TOPOLOGY_TEST_20261122.md)
SHA-256 c99bc41b15e828f54e717b9eb8250927586d2aa277c6160a6b323fd12fdddf54.
[Return](../research-progress/handoffs/SP4-CME-E162_RETURN_v1.md)
SHA-256 c36784e784bcf958680259b92d6edf914de60669f0301f10dcba5ec1380bcefd.
[Primary source](https://arxiv.org/pdf/1102.2442v2).

The missing metric extraction is being tested separately in
B84/E164/E165. No injectivity premise is removed by this
topology assessment alone.

