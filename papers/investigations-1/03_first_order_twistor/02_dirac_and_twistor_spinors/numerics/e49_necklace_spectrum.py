"""SP4-FOT-DIR-E49: spectrum and pinching of the Yamabe necklace on S^1(L) x S^3.

Usage:  python3 e49_necklace_spectrum.py            (prints the record to stdout)

For each parameter m in (0,1) the one-period Delaunay metric
g = dn(x|m)^2 (dt^2 + g_{S^3}), x = t/sqrt(2-m), is a constant scalar curvature
metric on S^1(L) x S^3, L = 2 K(m) sqrt(2-m).  The script records
  * its Yamabe energy Y and the energies of the competing solutions,
  * the lowest dimensionless eigenvalues nu = 3 lambda / s in each sector,
  * the relative five-eigenvalue pinching eps = 3 lambda_5 / s - 1,
  * the closed-form trial bound and the asymptotic coefficients as m -> 1.
Floating point (IEEE double) diagnostics, not interval arithmetic.
"""
import json
import sys
import numpy as np
from e49_necklace_lib import (Y0, KE, I2j, period, yamabe_energy, m_from_period,
                          sector_spectrum, trial_bound)


def first_modes(m):
    """Return the low spectrum by sector: dict of (k, parity) -> nu list."""
    out = {}
    for k in (0, 1, 2):
        for par in ("even", "odd"):
            out[(k, par)] = sector_spectrum(m, k, par, nev=3)
    return out


def five_lowest(spec):
    """Five lowest positive nu counted with multiplicity (k -> (k+1)^2)."""
    vals = []
    for (k, par), nus in spec.items():
        mult = (k + 1) ** 2
        for nu in nus:
            if k == 0 and par == "even" and abs(nu) < 1e-9:
                continue                      # the constants
            vals += [nu] * mult
    vals.sort()
    return vals[:5]


def record(m):
    L = period(m)
    Y = yamabe_energy(m)
    spec = first_modes(m)
    five = five_lowest(spec)
    eps = five[-1] - 1.0
    A_over_s = sum(v - 1.0 for v in five) / 5.0
    return {
        "m": m, "one_minus_m": 1 - m, "L": L, "Y_over_Y0": Y / Y0,
        "delta": 1 - Y / Y0,
        "nu_k0_odd": float(spec[(0, "odd")][0]),
        "nu_k0_even": float(spec[(0, "even")][1]),
        "nu_k1_even": float(spec[(1, "even")][0]),
        "nu_k1_odd": float(spec[(1, "odd")][0]),
        "nu_k2_even": float(spec[(2, "even")][0]),
        "five": [float(v) for v in five],
        "eps": eps, "A_over_s": A_over_s,
        "trial_bound_minus_1": trial_bound(m) - 1.0,
        "sum_ratio": (Y / Y0) * (1 + A_over_s),   # (3/5) sum lambda_i Vol^(1/2) / Y0
    }


def competitors(L):
    """Yamabe energies of all rotationally symmetric constant scalar curvature
    metrics on S^1(L) x S^3: product, and k-fold Delaunay for L/k > sqrt(2) pi."""
    out = {"product": 6.0 * np.sqrt(2 * np.pi ** 2 * L)}
    k = 1
    while L / k > np.sqrt(2) * np.pi * (1 + 1e-12):
        mk = m_from_period(L / k)
        out["delaunay_%d" % k] = np.sqrt(k) * yamabe_energy(mk)
        k += 1
    return out


def main():
    rows = []
    ms = [1e-3, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99,
          1 - 1e-3, 1 - 1e-4, 1 - 1e-5, 1 - 1e-6, 1 - 1e-7, 1 - 1e-8]
    for m in ms:
        rows.append(record(m))
    print("# Necklace spectrum (double precision diagnostics)")
    print("%-11s %-9s %-11s %-11s %-11s %-11s %-11s %-11s %-11s %-10s" % (
        "1-m", "L", "Y/Y0", "nu(0,odd)", "nu(0,even)", "nu(1,even)",
        "eps", "eps/(1-m)", "delta/(1-m)", "sum/Y0"))
    for r in rows:
        print("%-11.3e %-9.4f %-11.8f %-11.8f %-11.8f %-11.8f %-11.4e %-11.6f %-11.6f %-10.7f" % (
            r["one_minus_m"], r["L"], r["Y_over_Y0"], r["nu_k0_odd"], r["nu_k0_even"],
            r["nu_k1_even"], r["eps"], r["eps"] / r["one_minus_m"],
            r["delta"] / r["one_minus_m"], r["sum_ratio"]))
    print()
    print("# Ordering and bounds: nu(1,odd), nu(2,even), trial bound - 1 - eps (>= 0)")
    for r in rows:
        print("%-11.3e nu(1,odd)=%.10f nu(2,even)=%.8f  trial-1-eps=% .3e  A/s=%.6e  (A/s)/delta=%.5f" % (
            r["one_minus_m"], r["nu_k1_odd"], r["nu_k2_even"],
            r["trial_bound_minus_1"] - r["eps"], r["A_over_s"],
            r["A_over_s"] / r["delta"] if r["delta"] > 0 else float("nan")))
    print()
    print("# Competing constant scalar curvature metrics at fixed L (energies / Y0)")
    for L in [4.45, 4.6, 5.0, 6.0, 8.0, 9.0, 10.0, 14.0, 20.0, 30.0]:
        c = competitors(L)
        best = min(c, key=c.get)
        print("L=%-6.2f " % L + "  ".join("%s=%.6f" % (k, v / Y0) for k, v in c.items())
              + "   lowest: " + best)
    print()
    print("# Monotonicity on a grid of m: period T(m) and energy Y(m)")
    grid = np.concatenate([np.linspace(1e-4, 0.9985, 2000), 1 - np.logspace(-3, -12, 200)])
    T = np.array([period(mm) for mm in grid])
    Yv = np.array([yamabe_energy(mm) for mm in grid])
    Yc = 6.0 * np.sqrt(2 * np.pi ** 2 * T)
    print("T increasing:", bool(np.all(np.diff(T) > 0)), " Y increasing:", bool(np.all(np.diff(Yv) > 0)),
          " min(Y)/Y0 = %.6f" % (Yv.min() / Y0),
          " max(Y_delaunay/Y_product) = %.12f" % np.max(Yv / Yc))
    print("small-m comparison Y_product/Y_delaunay - 1 over m^4:",
          [float("%.5e" % ((6.0 * np.sqrt(2 * np.pi ** 2 * period(mm)) / yamabe_energy(mm) - 1) / mm ** 4))
           for mm in (0.02, 0.05, 0.1, 0.2)])
    json.dump(rows, open("E49_NECKLACE_SPECTRUM.json", "w"), indent=1)


if __name__ == "__main__":
    main()
