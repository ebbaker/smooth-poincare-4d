# SP4-CME-E45 return v1 — adjusted continuation under fixed value smallness

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper `gpt-6.2-sol`/`ultra`.
Independent runtime attestation and actual lead settings are unavailable.
[Request v1][req] · [Proposition and proof][note].

## Disposition

Proved the fixed-reference continuation corollary of the assessed
E41–E44 local theorem. For the same autonomous E36 equation, a
smooth compatible trajectory with a finite endpoint \(t_*>0\)
extends smoothly and compatibly across it if all its values remain
within one sufficiently small fixed reference radius \(\epsilon\).

Use the common lifespan \(T\) at \(t_0=t_*-\min(t_*,T)/2\).
The incoming smooth solution itself provides the individual
comparison. On a possibly shorter initial interval its anchored norm
is at most \(\epsilon+c\sqrt\ell\sup|DU|\) and falls in the completed
uniqueness ball. Later agreement uses smooth stripwise uniqueness.
The difference equation has a strongly parabolic divergence term
in the fixed pairing. Gårding and Young's inequality give an
\(L^2\) Gronwall estimate on each compact overlap strip. This extends
agreement to all \(t_0<t<t_*\) without assuming the incoming full
overlap \(X\) norm is small. The common-time solution is smooth
through \(t_*\) and through at least \(t_*+T/4\).

A maximal adjusted trajectory that stays in the value tube has
infinite lifespan. Preservation of the tube from initial smallness
remains open here. E24's continuous limits concern the unadjusted
equation in a fixed identification and do not supply an incoming
adjusted trajectory with the required value bound. The unadjusted
endpoint bridge remains open.

## Versions and source dependence

| Requested frozen input | Checked SHA-256 |
| --- | --- |
| `notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md` | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| `notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md` | `8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3` |
| `notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md` | `a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a` |
| `notes/29_LOCAL_PARABOLIC_INPUT_20261122.md` | `f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5` |
| `reviews/E44_ROUGH_SYSTEM_AUDIT_20261122.md` | `ec0a69b82089c2c50230b590e5fcc03e57c47ce520fad78e951081133f1217b8` |

| Other read artifact or output | Checked SHA-256 |
| --- | --- |
| `research-progress/handoffs/SP4-CME-E45_REQUEST_v1.md` | `d469a94c39baf18d4fc95c0542847ede54e99b664826645722d84cfdcb70afe7` |
| `brainstorm/notes/B34_ADJUSTED_CONTINUATION_20261122.md` | `0826f717f06b3b1b04ac90f30b42991cfd6aa71e2a95ee7dc4fc1e35697bba5b` |
| `reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md` | `3ec7e9e78ba1f4bf5534141315bcd13032b71a333a58f83724b37616594f3aa3` |
| `notes/24_TEMPORAL_BOOTSTRAP_20261122.md` | `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44` |
| `notes/45_ADJUSTED_VALUE_CONTINUATION_20261122.md` | `c42a64b67c95ae8c4e04b2cedc53936cb933dac89195344c53eaa59ba432976d` |

The proof uses the assessed local theorem and the displayed smooth
difference energy argument. No new external theorem, source version
or numerical artifact enters E45. The exact earlier primary
dependencies remain in the [combined assessment][lead] and its
canonical source links.

[req]: SP4-CME-E45_REQUEST_v1.md
[note]: ../../notes/45_ADJUSTED_VALUE_CONTINUATION_20261122.md
[lead]: ../../reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
