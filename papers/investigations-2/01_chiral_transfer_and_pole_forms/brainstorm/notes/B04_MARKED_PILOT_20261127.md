# B04 · A marked pole on the four-dimensional minus presentation boundary

27 November 2026 (America/New_York). Prepared for Edward B. Baker III by the OpenAI Codex lead. The selected research role is Astra/ultra. The runtime identifies the lead as Codex, GPT-6 based, without exposing an exact serving variant or reasoning effort. Base 6a422ce7814fe1ad278d6904970e3b19b05a9890, with working-tree inputs below. Smooth oriented Riemannian category. Decision and working project calculation pending non-author reading. [Register](../../research-progress/REGISTER.md)

## The specimen

Use the outward-first boundary with ambient order `X,Y,z1,z2,z3`. Use CERT's original coordinate framing, both ordered seven-slot paths with the flat step, both signed collar maps and their inverses. Write E for the retained exterior and X for the punctured closed manifold. Use CERT's specified rounding with delta=1/128 and the exact psi sublevel in its §1. Use the *original* §“One whole smooth trial” of the 07 assembly at radius one, including its choices of j,H, connection axis (0,0,1), inverse-facing first radial function and connection, hyperbolic second disk, exterior convex bands and induced Euclidean background. No further smoothing of the metric at a join is needed. The signed normal coordinate is s=t'-1 on each disk and s=|z|-1 outside. These prescriptions fix the metric even on the portions with no symmetry. The symbol n will denote the sphere coordinate in a free face. [Handle formulas, SHA-256 prefix 0718114604f51a00](../../../05_certificates/notes/E06_PRESENTATION_HANDLES.md) · [Table, f898a23925988690](../../../05_certificates/numerics/e06_handles.json) · [07 trial, e27a89ae784451f6](../../../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md) · [05 replay](../../../05_certificates/reviews/E09_FORMAT_HANDLE_REPLAY.md)

Choose p=((0,0),(0,0,1)) on the product face. The oriented orthonormal frame is the ordered pair of planar Cartesian vectors followed by the Cartesian x and y tangents at the sphere's north pole. Moving the exterior unit normal past two planar vectors preserves orientation. Use the corresponding coframe e and input columns
\[
 u_1=(e^{12}-e^{34})/\sqrt2,\quad
 u_2=(e^{13}+e^{24})/\sqrt2,\quad
 u_3=(e^{14}-e^{23})/\sqrt2 .
\]
All chart estimates use the same coefficients in this basis. The first trial direction is u1. Changes of target chart always act on the two-form indices. Write L for the A1 evaluation with unit leading coefficient (not the volume-normalized Schwartz kernel).

On the normal ball |y|<1/4 use product exponentials, with planar y1,y2 and N=(cos v)north+sinc(v)(y3,y4,0), v=hypot(y3,y4). This is an embedded product-normal chart. The base-point distance from the closest deleted planar disk is 3/4. The entire spherical disk of geodesic radius 1/4 avoids both enlarged latitude bands and the rounding misses the chosen planar ball. Write rho=|y|, x=y/rho², r=|x|. Put theta=1-H(16rho-1) in this chart. Set h=exp(-4 theta log rho)g there and h=g elsewhere. It equals rho^{-4}g for rho<=1/16 and g for rho>=1/8. Thus h=g on both caps and on their exterior collars.

## A sufficient uniform end truncation

In y-coordinates the planar and spherical radial eigenvalues of g are 1; the remaining spherical eigenvalue is sinc(v)^2. The inequalities hold also at v=0 by smoothness. In x-coordinates at r>=16 the inverted h is orthogonally conjugate to this matrix. Hence h<=Id and |b|_h>=|b|_Eucl for every covariant two-form there. By the [replayed A1 expansion](../../notes/E01_A1.md) (input prefix db13563024da1a55), each column has component remainder O(r^{-2}) after subtraction of its constant form beta_k in x. Define
\[
 C_k=\sup_{r\ge16}r^2|L u_k-\beta_k|_{\rm Eucl},\quad
 K=(\textstyle\sum C_k^2)^{1/2},\quad R=\max(32,\sqrt{2K}).
\]
These constants exist. This is a sufficient inequality for choosing a truncation and makes no claim to an evaluated numerical radius. Cauchy–Schwarz gives |Lu|_h>=1-K/r²>=1/2 for every unit input and r>=R. Take the compact core by excising rho<1/(2R), so the common overlap includes R<=r<=2R.

## Analytical decision

The cover itself gives coordinate identifications. To extract information on the global field, use its exactness: A1 constructs it as d of a global potential on X. Every complete fibre in either cap consequently has zero period. On the second cap the metric is exactly the product of a hyperbolic disk and a round sphere, and its rotation group acts in the sphere factor. First test approximations lying in the rotation-invariant self-dual mode there against this necessary condition, in pointwise two-form norm. Independently use the upper-half-plane realization of the disk to transport a constant Euclidean chiral form to the cap. In that frame the actual closed self-dual form has harmonic coefficients, so actual boundary trace errors can control the entire cap. Track the coefficient at p and the physical seam through E07. Treat the rotating competitor only as a local field until the global trace is bounded. The projection obstruction and this alternative test can both be decided from the frozen metric. An actual positive global certificate would additionally require estimates on every remaining piece for the same input. Comparing Weyl energy or transplanting the earlier round calibration would supply neither the prescribed field nor its trace. [Handle-atlas assignment](../../continuation-notes/HANDLE_ATLAS_20261127.md) · [Master acceptance](../../../../master-2/research-plan/PLAN.md#handle-atlas-integration)
