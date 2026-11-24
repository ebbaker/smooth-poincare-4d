# SP4-FOT-SEC-E53 · Shrinking round marks from a closed Bach-flat class · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The author-selected lead and effort were
retained. Bounded execution was configured as `gpt-6.2-sol` / `ultra`.
Actual backend identifiers and reasoning effort were unavailable for
independent verification.

## Disposition

For a supplied smooth positive-Yamabe Bach-flat class on an oriented
smooth closed homotopy four-sphere with
\(4\pi^2<E_+<8\pi^2-\delta\), a normal-chart round splice gives
\[
  E_+(r_\varepsilon)=E_+(g)+O(\varepsilon^4),\qquad
  \int |B_{r_\varepsilon}|\,dV_{r_\varepsilon}=O(\varepsilon^2),
  \qquad Y(M,[r_\varepsilon])=Y(M,[g])+O(\varepsilon^2).
\]
The metric second jets remain bounded and the uniform conformal
Laplacian form comparison uses the \(O(\varepsilon^2)\) scalar
error in \(L^2\). The positive first eigenvalue is uniformly bounded
away from zero in the raw gauge. A fixed literal unit-round metric
on a prescribed cap is possible by pullback and dilation, preserving
all three invariants and keeping total volume bounded. Its physical
volume in that representative is fixed. A unit-volume Yamabe gauge
has a conformally round cap of physical diameter of order
\(\varepsilon\): the strict fixed-background Yamabe gap rules out
Sobolev mass loss of the variational minimizers and gives uniform
upper and lower bounds on their conformal factors by local
absorption and a fixed-background elliptic estimate.
[Proof and regularity][note]

E46 gives optional regular marked centers with exact splice energy
and arbitrarily small \(C^4\) perturbations at each radius. Fixed
conformal changes and oriented pullbacks preserve surjectivity.
E48 then forces
every actual differentiable radial tangent to have intrinsic
supremum norm at least \(c\varepsilon^{-2}\). This is a conditional
failure of uniform radial strain control within the fixed band,
given the supplied closed Bach-flat class. A small Bach norm
sequence alone supplies neither its closed Bach-flat limit nor
an ALE rescaling.
[Regular centers and scope][note]

The lower endpoint \(E_+=4\pi^2\) admits no positive-Yamabe closed
Bach-flat input on a homotopy four-sphere by the exact endpoint
results of Chang–Chen and Chang–Gursky–Yang. At the upper endpoint,
the splice at a point where \(W^+\ne0\) strictly increases energy
by at least \(c\varepsilon^4\) and can leave the original band.
The estimates still apply with a smaller positive upper margin
when the input lies strictly below \(8\pi^2\).
[Endpoint analysis and primary sources][note]

## Inputs and checks

Observed HEAD `e76752648b69969b1234d0295530c87fce9fcdcb`.
All ten [issued request][request] working SHA-256 pins matched.
The request digest is
`aa6e390c66b4e85569532b25ae8e46d84d167bcb7e66b005034cdb1117523aa4`.
The proof records the pinned versions, primary passages and
exact scope. The [owning register][register] lists E53 as issued.

[note]: ../../notes/SEC_E53_20261124.md
[request]: SP4-FOT-SEC-E53_REQUEST_v1.md
[register]: ../REGISTER.md
