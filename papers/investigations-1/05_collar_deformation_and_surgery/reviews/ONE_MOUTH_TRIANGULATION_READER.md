# Independent readback of the marked control mesh and upper chord

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Independent reading 3 of SUR-E02ag and SUR-E02al.
The issue selected a bounded GPT-6.2 Sol/ultra reader. Actual serving model
and reasoning effort were unavailable. HEAD `226b8f404b6e`.
[Reading issue](../research-progress/handoffs/WHITEHEAD_MIXED_READINGS_20261126.md)

I replayed the [control generator](../02_handle_isolation_and_marked_surgery/numerics/one_mouth_control.py)
and the [chord check](../02_handle_isolation_and_marked_surgery/numerics/one_mouth_twist.py)
with Python 3.10 on Darwin arm64. Both stdout files matched the
frozen execution records byte for byte. SHA-256 prefixes were
`ab400b02e14c` for the [construction note](../02_handle_isolation_and_marked_surgery/notes/ONE_MOUTH_TRIANGULATION.md),
`53649cdee687` and `1ff74a5fab48` for the scripts,
`79a63c059b02` and `e8a3f65c617e` for the
[control](../02_handle_isolation_and_marked_surgery/numerics/one_mouth_control_result.json)
and [twist](../02_handle_isolation_and_marked_surgery/numerics/one_mouth_twist_result.json)
records. The regenerated mesh SHA-256 was
`7a08ce4bd56de6030594d34925d860c4c9e2c59443e17bd7bbf368e21d7eb395`.

I also read the exported 7,470 vertices and 40,068 tetrahedra in a
separate scratch script without importing either generator. Every interior
triangle had two opposite oriented incidences, and the six marked faces
and walls partitioned the one-incidence triangles. Direct edge and vertex
incidence checks gave the following data.

| Marked surface | Triangles | Boundary edges | Position of boundary |
|---|---:|---:|---|
| Lower separator | 432 | 36 | Lower face, partition 12 and 34 |
| Upper separator | 352 | 32 | Upper face, partition 12 and 34 |
| Lower bridge disk | 12 | 14 | Exact marked lower chord and wall section |
| Upper bridge disk | 12 | 14 | Exact marked upper chord and wall section |

Each of these subcomplexes was connected with Euler characteristic one.
Its whole intersection with the ambient boundary was its recorded edge
boundary. The separator triangles had the designated mouth on one side and
the remainder on the other. The two face components after each separator
cut both had Euler characteristic minus one. All marked cuff paths
matched pointwise in the slab's spatial coordinates under the seam map.

The rail tubes are products of the indicated thickened planar elbow paths
with the two fixed x intervals. The cross-section cocycle uses a positive
t-normal on the horizontal part of the fold as y decreases, consistent
with the positive y-normals at both vertical ends. I checked the underlying
orientations against the code and replayed the integral cocycle equations
and the identity meridian evaluation matrix. The lower stationary cube
is interior to its mouth and misses both the lower tube and its bridge
rectangle. The punctured sphere-circle product therefore adds an interior
connected summand on the chosen lower side while leaving the local bridge
disk. The two independent meridian evaluations in that side obstruct a
solid torus for this particular separator. Thickening the bridge instead
uses a region near the return wall and avoids the stationary summand.

In the exported upper face the 38-edge alternate chord was embedded, had
the original endpoints, and was otherwise disjoint from the cuffs. The
twist circle cut the cuff pairs 13 and 24, and the oriented difference
of the two chords equalled the twist circle plus the unit-square boundary.
The square is precisely the offset that removes a repeated portion at
the insertion point. The original chord crosses the circle once and the
offset based detour realizes the indicated twist in its annular collar.
The evaluated closed word is `(0,1,1,0)` and a change of upper wall
winding adds a multiple of `(0,1,0,0)`. The through coordinate obstructs
the prescribed chord at every winding, even if endpoint tracks on the
return cuffs are absorbed into the wall section. The replacement on
the same face has six edges and its zero-winding word bounds the verified
12-triangle upper disk, which certifies the positive word test.

These machine conclusions apply to the split-unknot control with the
stationary zero filling represented directly. For the actual GST input,
the triangulation note gives a PL construction relative to a digitized
marked diagram, with numerical crossing data and corresponding tetrahedra
still missing. The actual lower word proof uses the disk free product and
the marked torus in the Q-filled U exterior. A detour on the lower face
projects to a power of its return meridian because the two capped pairs
of pants generate the return and through annular subgroups. Thus endpoint
freedom changes only a meridian exponent under this projection. The
peripheral injection there keeps every longitude with integral meridian
exponent nontrivial. The actual upper bridge uses the shallow cap in
the stated collar. The control independently checks the PL geometry and
the distinction between prescribed and selectable chords. It supplies
no mesh computation for the actual lower GST obstruction.
