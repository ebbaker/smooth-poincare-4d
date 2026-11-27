#!/usr/bin/env python3
"""Replay the four recorded SP4-CUT-SEAM-E23 trial profiles without optimizing.

27 November 2026, America/New_York. Prepared for Edward Baker with OpenAI
assistance. Bounded GPT-6.2 Sol/ultra requested. Actual serving details were
unavailable. Working HEAD bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0.

E23_REQUEST_R1.md SHA-256 ddda0d11fa9503ce4b51e57704da9d563ca6cdf1a72f1dd5117c8a96d14c542a.
B06_SHORT_TERMINAL_COLLARS.md SHA-256 5880dfbd77007364996f2a3f659371c8ad78c7760e8ab648c480aa0e55cfb92e.
seam_relaxation.py SHA-256 05380722ed46cbbf364251443c3644833e4837da9b9fbfc0ee8a2491355cabcc.

The original four optimizations ran in V8 during a workspace outage. They used
the E13 graded Gaussian basis, the nonzero terminal jets below, a damped
Gauss-Newton method with central difference step 2e-6 * (1 + abs(parameter)),
at most 120 iterations, and composite 8-node Gauss integration on 3n cells.
The search used one warm long-shape seed and one late-shear seed at each of
n=14 and n=22. At n=22 the warm seed takes the saved E13 Gaussian coefficients
exactly, and at n=14 it projects the Gaussian sums on 176 equispaced graded
coordinates. The original V8 evaluator and this Python replay both use the
removable E13 curvature formulas. Node generation, elementary function
implementations and the last Taylor term of the small sinh tail can differ.

RECORD contains the resulting IEEE floating coefficients at round-trip
decimal precision, the V8 diagnostics, and the best profile's panel
integrals. This replay uses E13's NumPy quadrature and tests the stored
profiles only. Energies, scalar samples and discrepancies are floating
diagnostics, with no interval bounds or positivity certificate.
"""

import hashlib
import json
import runpy
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss


FROZEN_PATH = Path(__file__).with_name("seam_relaxation.py")
FROZEN_SHA256 = "05380722ed46cbbf364251443c3644833e4837da9b9fbfc0ee8a2491355cabcc"
if hashlib.sha256(FROZEN_PATH.read_bytes()).hexdigest() != FROZEN_SHA256:
    raise ValueError("The E13 source no longer matches the frozen replay input.")
FROZEN = runpy.run_path(str(FROZEN_PATH))

END_A = np.sqrt(3 / 5)
END_U = np.log(5 / 3) / 2
END_A_S = -4 / 15
END_U_S = (4 / 15) * np.sqrt(5 / 3)


RECORD = json.loads(r"""
{
  "trials": [
    {
      "n": 14,
      "initial": 4.675409570666146,
      "steps": 66,
      "reason": "relative decrease",
      "scaled": 0.000016343881329944675,
      "L": 1.9754978891880273,
      "V": 1.9861211681425543,
      "ep": 3.5245020454328437,
      "em": 8.968946489877307,
      "R": -0.04344450419103649,
      "shift": -1.9539925233402755e-14,
      "quadrature": 1.7132961716015416e-12,
      "end": [
        4,
        0.7745966692414834,
        0.25541281188299536,
        -0.26666666666666666,
        0.3442651863295481
      ],
      "p": [
        1.5190484097670136,
        0.08772246983268316,
        0.08936643134441977,
        0.12974889871757958,
        0.1587836977261516,
        0.19552674136656123,
        0.2258743340336811,
        0.25356734437298956,
        0.27532639213195703,
        0.2902012411488388,
        0.31320546461492693,
        0.3200278411442666,
        0.41015849613709143,
        0.35549551519080813,
        1.1139140894246444,
        0.36614940484585845,
        0.23031702641688787,
        0.2889098097399144,
        0.2624114269488154,
        0.27589377778888025,
        0.263170586741334,
        0.2642609638217189,
        0.24756096168036923,
        0.23974262119024747,
        0.20683275615100488,
        0.19773368741099237,
        0.12232695382387283,
        0.1720615832736913,
        -0.1733279254519755
      ],
      "s": [
        0.95,
        2.2,
        1.74999991,
        0.15
      ]
    },
    {
      "n": 14,
      "initial": 6.59261303470487,
      "steps": 116,
      "reason": "relative decrease",
      "scaled": 0.00003274059324864519,
      "L": 1.978805421088616,
      "V": 1.9814647493424684,
      "ep": 3.5301710927255514,
      "em": 8.974615537170013,
      "R": 0.0771649582876239,
      "shift": -1.7763568394002505e-14,
      "quadrature": 1.7057466550340905e-12,
      "end": [
        4,
        0.7745966692414832,
        0.25541281188299536,
        -0.2666666666666666,
        0.34426518632954817
      ],
      "p": [
        0.6016636001657008,
        0.08769712420521361,
        0.08933082467440445,
        0.1295826649714099,
        0.15842196548118923,
        0.19484139224646926,
        0.22472386422918608,
        0.25181736846652664,
        0.27278357840612427,
        0.28680495423610797,
        0.30863412230805254,
        0.31449531995696844,
        0.4023759221660956,
        0.3472760443880754,
        1.0928691509701653,
        0.5566834625326462,
        0.34989571857700663,
        0.4377515369805651,
        0.39694058386092435,
        0.4153132185858623,
        0.39526177815871494,
        0.3938928893375642,
        0.3700754629090851,
        0.3559920355007458,
        0.3191535954955811,
        0.3045415833394076,
        0.24515089604756946,
        0.2821290082351792,
        0.06273034411655322
      ],
      "s": [
        0.48,
        2.8,
        2.35,
        0
      ]
    },
    {
      "n": 22,
      "initial": 4.240706905523213,
      "steps": 120,
      "reason": "iteration limit",
      "scaled": 0.000051689703481175317,
      "L": 1.9910464044493763,
      "V": 2.0077719867961434,
      "ep": 3.5203377308023254,
      "em": 8.964782175246745,
      "R": -0.8207427585662279,
      "shift": 2.4868995751603507e-14,
      "quadrature": 1.440181307543753e-12,
      "end": [
        4,
        0.7745966692414834,
        0.25541281188299536,
        -0.26666666666666666,
        0.3442651863295481
      ],
      "p": [
        1.6058694479679558,
        0.09017476729365596,
        0.08191109099635918,
        0.10783590164223754,
        0.12334400538863212,
        0.14520306115045506,
        0.16502889686908023,
        0.18641922216221385,
        0.2062133197447768,
        0.22540578097941785,
        0.24245732613031945,
        0.2577767871363068,
        0.27101306976250017,
        0.2825539313918484,
        0.29357445581660374,
        0.30396665494613945,
        0.3182118781337062,
        0.33266848194574933,
        0.3648784658154531,
        0.3897835551674728,
        0.5039356564209658,
        0.4877557424185291,
        1.2376645789252518,
        0.3591999221327722,
        0.2384450848574356,
        0.28784180645235924,
        0.26943414959367545,
        0.27961329518056005,
        0.2744905297422154,
        0.27674198393324695,
        0.273498601158021,
        0.27228406828350593,
        0.267985828387989,
        0.2636646324124502,
        0.256558919143062,
        0.24846261705069725,
        0.23698405892683544,
        0.22462071120025928,
        0.20734729683799716,
        0.19173172096539376,
        0.16530751612011813,
        0.15156564792478638,
        0.09148868448628061,
        0.11434683247137108,
        -0.23268085358763865
      ],
      "s": [
        0.95,
        2.2,
        1.74999991,
        0.15
      ]
    },
    {
      "n": 22,
      "initial": 6.592613034704862,
      "steps": 90,
      "reason": "relative decrease",
      "scaled": 0.00001366587159609004,
      "L": 1.999564473832044,
      "V": 2.0085119540433514,
      "ep": 3.5277572674453053,
      "em": 8.972201711889744,
      "R": -0.6674985718661895,
      "shift": 6.217248937900877e-15,
      "quadrature": 2.2035706592760107e-12,
      "end": [
        4,
        0.7745966692414834,
        0.25541281188299536,
        -0.26666666666666666,
        0.34426518632954817
      ],
      "p": [
        0.6410230551672393,
        0.09060060563595988,
        0.08226548375588984,
        0.10820915448814131,
        0.12365431417253646,
        0.1454162471406449,
        0.1650780892777603,
        0.18624176635897646,
        0.20573414408653282,
        0.2245518730280092,
        0.24115231062338083,
        0.2559512505825368,
        0.2685986705641867,
        0.27949426001679833,
        0.289808390984812,
        0.29944871253898675,
        0.31286104231148765,
        0.32642858511925293,
        0.3575376611843718,
        0.381231545342075,
        0.49332287969150873,
        0.47560771503100224,
        1.2184978822229087,
        0.540676407173931,
        0.3584213805770175,
        0.4324209922247567,
        0.40418257012953984,
        0.41889169560050515,
        0.4104429934908626,
        0.41295799028511665,
        0.40712966612339335,
        0.4042513352568697,
        0.3968595570325918,
        0.3895144601648057,
        0.3786436571562742,
        0.3667444105201519,
        0.3515498168489959,
        0.33582118006379397,
        0.31675847210842933,
        0.30015366581622105,
        0.2774223100216112,
        0.26642837887502124,
        0.22448455319221064,
        0.24116195637053905,
        -0.010056011478653796
      ],
      "s": [
        0.48,
        2.8,
        2.35,
        0
      ]
    }
  ],
  "panels": [
    [
      0,
      0.5,
      0.011441580509960112,
      0.010541705251198047
    ],
    [
      0.5,
      0.75,
      0.16980708457271307,
      0.11866981593745
    ],
    [
      0.75,
      0.875,
      0.3006009153704459,
      0.4947729984004993
    ],
    [
      0.875,
      1,
      0.4667775098231963,
      1.947726120936864
    ]
  ],
  "combined": 3.9647821752467696,
  "paired": 12.92956435049354
}
""")


class CoreRule(FROZEN["Quadrature"]):
    """Use E13 curvature with the prescribed nonzero end jets."""

    def profile_jets(self, q, length, axial, transverse, scale, basis):
        axial_basis, transverse_basis = basis
        w_end = np.log(END_A / (4 * length))
        w_q_end = (length * END_A_S / END_A - 1) / 2
        r_q_end = (length * END_U_S - END_U) / 2

        coefficient = (4 * length / END_A)**2
        denominator = 1 + coefficient * q
        value_correction = w_end + np.log1p(coefficient) / 2
        slope_correction = w_q_end + coefficient / (2 * (1 + coefficient))
        axial_jets = (
            -np.log(denominator) / 2 + value_correction * q * (2 - q)
            + slope_correction * q * (q - 1),
            -coefficient / (2 * denominator) + value_correction * (2 - 2 * q)
            + slope_correction * (2 * q - 1),
            coefficient**2 / (2 * denominator**2) - 2 * value_correction + 2 * slope_correction,
        )
        if scale == 0:
            # The late-shear seed starts with u at order x^5.
            bend = r_q_end - 2 * END_U
            transverse_jets = (
                q**2 * (END_U + bend * (q - 1)),
                2 * q * END_U + bend * (3 * q**2 - 2 * q),
                2 * END_U + bend * (6 * q - 2),
            )
        else:
            denominator = q + scale
            value_correction = END_U - END_U / np.sqrt(1 + scale)
            slope_correction = r_q_end + END_U / (2 * (1 + scale)**1.5)
            transverse_jets = (
                END_U / np.sqrt(denominator) + value_correction + slope_correction * (q - 1),
                -END_U / (2 * denominator**1.5) + slope_correction,
                3 * END_U / (4 * denominator**2.5),
            )

        axial_jets = tuple(value + matrix @ axial for value, matrix in zip(axial_jets, axial_basis))
        transverse_jets = tuple(
            value + matrix @ transverse for value, matrix in zip(transverse_jets, transverse_basis)
        )
        return length, axial_jets, transverse_jets


class PanelRule(CoreRule):
    def __init__(self, size, lower, upper):
        self.size = size
        nodes, weights = leggauss(16)
        edges = np.linspace(lower, upper, 25)
        left, right = edges[:-1, None], edges[1:, None]
        self.x = ((right + left + (right - left) * nodes) / 2).ravel()
        self.weights = ((right - left) * weights / 2).ravel()
        self.q = self.x**2
        self.axial_basis, self.transverse_basis = self.basis(self.q)


def energy(rule, parameters, start, sign=1):
    residual = rule.residual(parameters, start, sign)
    return residual @ residual


def verify_matching(rule, parameters, start):
    jet = rule.terminal_data(parameters, start)
    np.testing.assert_allclose(jet, [4, END_A, END_U, END_A_S, END_U_S], atol=2e-12, rtol=0)
    _, a, u, a_s, u_s = jet
    conformal_multiplier = 1 / (a * np.exp(-u))
    log_multiplier_s = -a_s / a + u_s
    core_lengths = np.array([a, np.exp(-u), np.exp(u)])
    core_slopes = np.array([a_s, -u_s * core_lengths[1], u_s * core_lengths[2]])
    np.testing.assert_allclose(
        [conformal_multiplier, log_multiplier_s], [5 / 3, 2 * END_U_S], atol=2e-12, rtol=0,
    )
    np.testing.assert_allclose(np.sqrt(conformal_multiplier) * core_lengths, [1, 1, 5 / 3], atol=2e-12)
    np.testing.assert_allclose(core_slopes + log_multiplier_s * core_lengths / 2, [0, 0, 8 / 9], atol=2e-12)


def replay_trial(trial):
    size, start = trial["n"], trial["s"]
    parameters = np.asarray(trial["p"])
    coarse = CoreRule(size, 8)
    fine = CoreRule(size, 16)
    verify_matching(fine, parameters, start)
    plus = energy(fine, parameters, start)
    minus = energy(fine, parameters, start, -1)
    length, a, scalar, *_ = fine.fields(parameters, start)
    volume = fine.weights @ (length * a)
    discrepancy = plus - energy(coarse, parameters, start)
    np.testing.assert_allclose(
        [length, volume, plus, minus, min(scalar), discrepancy],
        [trial[k] for k in ("L", "V", "ep", "em", "R", "quadrature")],
        atol=2e-9,
        rtol=0,
    )
    np.testing.assert_allclose(plus - minus, -49 / 9, atol=2e-10, rtol=0)
    seed_name = "warm" if start[-1] else "late"
    print(
        f"n={size} {seed_name} L={length:.9f} V={volume:.9f} "
        f"E+/pi²={plus:.9f} E-/pi²={minus:.9f} sampled min R={min(scalar):.6f}"
    )


def replay_panels(best):
    parameters = np.asarray(best["p"])
    size, start = best["n"], best["s"]
    for lower, upper, recorded_axial, recorded_transverse in RECORD["panels"]:
        panel = PanelRule(size, lower, upper)
        plus = panel.residual(parameters, start)
        axial = plus[:panel.x.size]
        transverse = plus[panel.x.size:]
        values = [axial @ axial, transverse @ transverse]
        np.testing.assert_allclose(values, [recorded_axial, recorded_transverse], atol=2e-9, rtol=0)
        print(f"[{lower:g}, {upper:g}] i-axial={values[0]:.9f} transverse={values[1]:.9f}")

    combined = best["ep"] + 4 / 9
    paired = 2 * combined + 5
    np.testing.assert_allclose([combined, paired], [RECORD["combined"], RECORD["paired"]], atol=2e-12)
    print(f"Best core + collar E+/pi²={combined:.9f}; switched pair E+/pi²={paired:.9f}")


def main():
    for trial in RECORD["trials"]:
        replay_trial(trial)
    best = min(RECORD["trials"], key=lambda trial: trial["ep"])
    replay_panels(best)
    print("Replayed four stored profiles. No optimizer was called.")


if __name__ == "__main__":
    main()
